import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:logging/logging.dart';
import 'package:mutex/mutex.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:saber/data/file_manager/file_manager.dart';

class RandomFileName {
  // generate random file name
  static String generateRandomFileName([String extension = '.txt']) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(1 << 32); // 32-bit random number
    return 'file_${timestamp}_$random$extension';
  }
}

class PdfInfoExtractor {
  /// Extracts /Info dictionary from a PDF file with minimal reads (synchronous)
  static Map<String, String> extractInfo(File file) {
    final fileSize = file.lengthSync();
    final raf = file.openSync();

    try {
      // Check if linearized (optimized for web) by reading first 256 bytes
      raf.setPositionSync(0);
      final startBytes = raf.readSync(256);
      final startContent = latin1.decode(startBytes);

      final isLinearized = startContent.contains('/Linearized');

      int xrefOffset = 0; // offset of xref on the start of file
      int xrefOffsetEnd = 0; // offset of xref on the end of file
      int infoOffset=0;
      int infoObjNum = 0;
      if (isLinearized) {
        raf.setPositionSync(0);
        final linearizedBytes = raf.readSync(2048);
        final startContent = latin1.decode(linearizedBytes);

        // Check if /Info is referenced in start trailer
        // Look directly for /Info pattern in the trailer section
        final infoMatch = RegExp(
            r'trailer\s*<<.*/Info\s+(\d+)\s+\d+\s+', dotAll: true)
            .firstMatch(startContent);
        if (infoMatch != null && infoMatch.group(1) != null) {
          // /Info reference is at start, but we need end xref for object offset
          infoObjNum = int.parse(infoMatch.group(1)!);
        }

        // try to find /Prev indicating where starts xref on the end of file
        final prevMatch = RegExp(r'/Prev\s+(\d+)').firstMatch(startContent);
        if (prevMatch != null && prevMatch.group(1) != null) {
          // /Info reference is at start, but we need end xref for object offset
          xrefOffsetEnd = int.parse(prevMatch.group(1)!);
        }

        // try to find xref in the starting section
        int xrefStart = 0;
        int xrefSize = 0;
        // Look directly for /Info pattern in the trailer section
        final startxRefMatch = RegExp(r'xref\s*(\d+)\s+(\d+)', dotAll: true)
            .firstMatch(startContent);
        if (startxRefMatch != null && startxRefMatch.group(1) != null &&
            startxRefMatch.group(2) != null) {
          xrefStart = int.parse(startxRefMatch.group(1)!);
          xrefSize = int.parse(startxRefMatch.group(2)!);
        }

        if (infoObjNum != 0 && xrefSize != 0 && infoObjNum >= xrefStart &&
            infoObjNum <= xrefStart + xrefSize) {
          // Info object is referenced in xref on the document start, find its offset
          infoOffset = _findObjectOffset(raf, 0, infoObjNum, fileSize,startContent);
          if (infoOffset==-2) {
            // error unexpected
          }
        }
        else {
          infoOffset=-1; // Info object is not in this xref
        }
        if (infoOffset==-1 && xrefOffsetEnd != 0) {
          // info object is not in this xref table it is at the end of file at xrefOffsetEnd found in /Prev
          infoOffset = _findObjectOffset(raf, xrefOffsetEnd, infoObjNum,fileSize, '');
        }
        if (infoOffset<0) {
          infoOffset = -2;
          Map<String, String> result = {};
          return result;    // return empty info
        }
      }
      if (infoOffset == 0) {
        // standard pdf with Info at the end of file
        // Extract Info object number from trailer
        final endOffset = fileSize > 1024 ? fileSize - 1024 : 0;
        raf.setPositionSync(endOffset);
        final endBytes = raf.readSync(1024);
        final endContent = latin1.decode(endBytes);
        // Find trailer and extract /Info object number
        final infoMatch = RegExp(
            r'trailer\s*<<.*/Info\s+(\d+)\s+\d+\s+', dotAll: true)
            .firstMatch(endContent);
        if (infoMatch != null && infoMatch.group(1) != null) {
          // /Info reference is at start, but we need end xref for object offset
          infoObjNum = int.parse(infoMatch.group(1)!);
        }
        else {
          throw Exception('Trailer not found');
        }
        // Find startxref offset
        final startxrefMatch = RegExp(r'startxref\s+(\d+)').firstMatch(
            endContent);
        if (startxrefMatch == null) {
          throw Exception('startxref not found');
        }
        xrefOffset = int.parse(startxrefMatch.group(1)!);
        infoOffset =
            _findObjectOffset(raf, xrefOffset, infoObjNum, fileSize, '');
      }
      if (infoOffset != 0) {
        return _extractInfoFromTrailer(raf, infoOffset, fileSize);
      }
      Map<String, String> result = {};
      return result;
    } finally {
      raf.closeSync();
    }
  }

  static Map<String, String> _extractInfoFromTrailer(
      RandomAccessFile raf,
      int infoOffset,
      int fileSize,
      ) {
    // Read Info object - read up to 4KB to handle large info dictionaries
    raf.setPositionSync(infoOffset);
    final bytesToRead = (fileSize - infoOffset) < 4096
        ? fileSize - infoOffset
        : 4096;
    final infoBytes = raf.readSync(bytesToRead);
    final infoContent = latin1.decode(infoBytes);
    // Parse Info dictionary
    return _parseInfoDict(infoContent);
  }


  // find object objNum in xref table
  static int _findObjectOffset(
    RandomAccessFile raf,
    int xrefOffset,
    int objNum,
    int fileSize,
    String xrefContent,
  ) {
    // Parse xref table
    if (xrefContent.isEmpty){
      // there is no content read, do it
      // Read xref table to find object offset
      raf.setPositionSync(xrefOffset);
      final remainingBytes = fileSize - xrefOffset;
      final xrefBytes = raf.readSync(remainingBytes);
      xrefContent = latin1.decode(xrefBytes);
    }
    final xrefLines = xrefContent.split('\n');
    int startNum = 0;
    int count = 0;

    int iStart=-1;
    // find line xref
    for (int i = 0; i < xrefLines.length; i++) {
      final line = xrefLines[i].trim();
      if (line == 'xref') {
        iStart=i+1;
        break;
      }
    }
    if (iStart<0){
      throw('xref section does not contain xref');
    }
    while (iStart< xrefLines.length) {
      final line = xrefLines[iStart].trim();
      final subsectionMatch = RegExp(r'^(\d+)\s+(\d+)$').firstMatch(
          line.trim());
      if (subsectionMatch != null) {
        startNum = int.parse(subsectionMatch.group(1)!);
        count = int.parse(subsectionMatch.group(2)!);
        iStart=iStart+1;  // starting line of table
      }
      else {
        throw('Error determining xref objects range');
      }
      if (objNum<startNum || objNum>startNum+count){
        // object is not in this section of xref Table try another one
        iStart=iStart+count;  // try another section
      }
      else {
        break;
      }
    }
    // object is in the table and it is on position
    int indexObj=iStart+(objNum-startNum);
    if (indexObj>xrefLines.length) {
      // not read enough number of lines
      return -2;
    }
    // Parse entry (e.g., "0000000015 00000 n")
    final entryMatch =
        RegExp(r'^(\d{10})\s+(\d{5})\s+([nf])').firstMatch(xrefLines[indexObj].trim());
    if (entryMatch != null) {
      return int.parse(entryMatch.group(1)!);
    }
    return -3;
  }

  static Map<String, String> _parseInfoDict(String content) {
    final result = <String, String>{};

// Find the Info dictionary between << and >>
    final dictMatch = RegExp(r'<<([^>]*)>>', dotAll: true).firstMatch(content);
    if (dictMatch == null) return result;

    final dictContent = dictMatch.group(1)!;

// Extract key-value pairs
    final entries = RegExp(r'/(\w+)\s*\(([^)]*)\)').allMatches(dictContent);

    for (final match in entries) {
      final key = match.group(1)!;
      var value = match.group(2)!;

// Decode PDF string (basic implementation)
      value = value
          .replaceAll(r'\(', '(')
          .replaceAll(r'\)', ')')
          .replaceAll(r'\\', '\\')
          .replaceAll(r'\n', '\n')
          .replaceAll(r'\r', '\r')
          .replaceAll(r'\t', '\t');

      result[key] = value;
    }

// Also handle hex strings <...>
    final hexEntries =
        RegExp(r'/(\w+)\s*<([0-9A-Fa-f]+)>').allMatches(dictContent);
    for (final match in hexEntries) {
      final key = match.group(1)!;
      final hexValue = match.group(2)!;

// Convert hex to string
      final bytes = <int>[];
      for (int i = 0; i < hexValue.length; i += 2) {
        bytes.add(int.parse(hexValue.substring(i, i + 2), radix: 16));
      }
      result[key] = utf8.decode(bytes, allowMalformed: true);
    }

    return result;
  }
}

///////////////////////////////////////////////////////////////////////////
///   current cache and images problems:
///   1. two caches  assetCache (for working), OrderedAssetCache (for writing)
///   2. keeping bytes of each asset in memory (do not know if it is problem, but it is problem when adding to cache
///                                             because all bytes must be compared with each already added)
///   3. after first saving of note importing  pdf, is pdf saved as one asset because:
///           1. importPdfFromFilePath   create one File "    final pdfFile = File(path);"
///               and this File is used to create all instances of pages
///           2. when saving, all pages are one asset, because File is the same object!!!
///
///   4. when loading note again and saving note, each page is treated as different pdf
///         why:   PdfEditorImage class
///             1. when reading fromJson is created "pdfFile =  FileManager.getFile('$sbnPath${Editor.extension}.$assetIndex');"
///                for each page (even if they are the same asset file)
///             2. PdfEditorImage constructor is called with this File - each page has its own File!!!
///                     1. OrderedCache.add adds each page as new asset because each page is different File
///   5. problems of PdfEditorImage
///             1. PdfEditorImage keeps bytes of the whole pdf (wasting memory) even if it renders only one page
///             2. creates its own pdfDocument renderer - for each pdf page is new renderer keeping whole pdf
///             3. while saving note is to the OrderedAssetCache added each page of pdf separately as new asset.
///
///
///   New approach to cache
///
///   handles jpg, png, pdf  (not svg yet)
///   for each photo item provides ValueNotifier< ImageProvider? >  so the same items have the same ImageProvider
///   for each pdf item provides PdfDocument   every page of pdf use the same provider
///
///   During reading note to Editor are new items added using addSync - which is fast
///   addSync method:
///     1. must treat duplicated assets (especially pdfs created by current OrderedCache)
///     2. it calculate fast hash from first 100 KB of file and file size, if hash is the same files are "identical"
///           this is important only for compatibility.
///
///   In Editor is used async method when adding new image
///   add method:
///       it compares first paths, file size and then hashes of all cache items
///       calculation of hash is very time consuming, it will be better for pdfs to extract /Info and read author, creation date, etc.
///       and use this to recognize different pdfs.
///
///   Cache properties:
///   1. Every cache item is created and treated as File (path). Even picked Photos are first saved as temporary files and then added to chache.
///   2. Each item provides PdfDocument  for pdfs or ValueNotifier< ImageProvider? > for images. It saves memory

// class returning preview data
class PreviewResult {
  final int previewHash;
  final int fileSize;
  final String fileInfo;   // string containing file information  - now only pdfFile /Info
  PreviewResult(this.previewHash, this.fileSize, this.fileInfo);
}


// types of assets in chage
enum AssetType {
  image,    // png, jpg, ...
  pdf,      // pdf
  svg,      // svg
  unknown,
}

// object in cache
class CacheItem {
  Object? value;  // value can change because file can be renamed
  final AssetType assetType; // type of asset
  int? previewHash; // quick hash (from first 100KB bytes)
  int? hash; // hash can be calculated later
  String? fileInfo; // file information - /Info of pdf is implemented now
  final ValueNotifier<ImageProvider?> imageProviderNotifier; // image provider for png, svg as value listener


  PdfDocument? _pdfDocument; // pdf document provider for pdf
  final ValueNotifier<PdfDocument?> pdfDocumentNotifier; // pdfDocument as value listener

  Uint8List? bytes;   // used only when reading inline assets

  // for files only
  final int? fileSize;
  String? filePath; // only for files - for fast comparison without reading file contents
  final String? fileExt; // file extension
  int _refCount = 0; // number of references
  int  assetIdOnSave=-1;   // id of asset when the note is save (some assets can be skipped)

  CacheItem(
    this.value,{
    this.hash,
    this.filePath,
    this.previewHash,
    this.fileSize,
    this.fileExt,
    this.fileInfo,
    this.bytes,
    ValueNotifier<PdfDocument?>? pdfDocumentNotifier,
    ValueNotifier<ImageProvider?>? imageProviderNotifier,
  }) : assetType = _detectTypeFromExtension(fileExt),
      pdfDocumentNotifier = pdfDocumentNotifier ?? ValueNotifier(null),
      imageProviderNotifier = imageProviderNotifier ?? ValueNotifier(null);

  /// Placeholder constructor
  CacheItem.placeholder()
      : value = null,
        fileExt = null,
        fileSize = null,
        assetType = AssetType.unknown,
        filePath = null,
        pdfDocumentNotifier = ValueNotifier(null),
        imageProviderNotifier = ValueNotifier(null);


  bool get isImage => assetType == AssetType.image;
  bool get isPdf => assetType == AssetType.pdf;
  bool get isSvg => assetType == AssetType.svg;

  // detect asset type according to file extension
  static AssetType _detectTypeFromExtension(String? extension) {
    if (extension == null) return AssetType.unknown;

    final ext = extension.toLowerCase();
    if (['.jpg', '.jpeg', '.png', '.gif', '.bmp'].contains(ext)) {
      return AssetType.image;
    } else if (ext == '.pdf') {
      return AssetType.pdf;
    } else if (ext == '.svg') {
      return AssetType.svg;
    }
    return AssetType.unknown;
  }

  void dispose(){
    if (isPdf) {
      if (pdfDocumentNotifier.value == null)
        return;
      if (value is File) {
        _pdfDocument!.dispose();
        pdfDocumentNotifier.value = null; // set provider to null to inform widgets to reload
      }
    }
  }

  // increase use of item
  void addUse() {
    _refCount++;
  }

  // when asset is released (no more used)
  void freeUse() {
    if (_refCount > 0) _refCount--;
  }
  int get refCount => _refCount;
  bool get isUnused => _refCount == 0;

  @override
  bool operator ==(Object other) {
    if (other is! CacheItem) return false;

    // compare hashes it is precise
    if (hash != null && other.hash != null) {
      return hash == other.hash;
    }
    if (filePath != null && other.filePath != null) {
      if (filePath == other.filePath) {
        // both file paths are the same
        return true;
      }
    }

    if (fileInfo != '' && other.fileInfo != '') {
      if (fileInfo == other.fileInfo) {
        // both file info are the same.
        return true;
      }
    }

    // Quick check using previewHash
    if (previewHash != null && other.previewHash != null) {
      if (previewHash != other.previewHash) {
        // preview hashes do not match - assets are different
        return false;
      }
    }
    return false; // consider not equal
  }

  @override
  int get hashCode {
    // If hash is not null, prefer it (since you compare on it first in ==)
    if (hash != null) return hash.hashCode;

    // If previewHash is available, use it
    if (previewHash != null) return previewHash.hashCode;

    // Otherwise fall back to filePath
    if (filePath != null) return filePath.hashCode;

    // Default fallback
    return 0;
  }

  // give image provider
  ImageProvider getImageProvider(Object item) {
    // return cached provider if already available
    if (item is File) {
      return FileImage(item);
    } else if (item is Uint8List) {
      return MemoryImage(item);
    } else if (item is MemoryImage) {
      return item;
    } else if (item is FileImage) {
      return item;
    } else {
      throw UnsupportedError(
          'Unsupported type for ImageProvider: ${item.runtimeType}');
    }
  }

  // invalidate image provider notifier value - called in case of image replacement
  // this causes that new imageProvider will be created
  void invalidateImageProvider() {
    imageProviderNotifier.value = null; // will be recreated on next access
  }

  // move asset file to temporary file to avoid it is overwritten during note save
  Future<void> moveAssetToTemporaryFile() async {
    Directory? dir;
    try {
      dir = await FileManager.getTmpAssetDir();
    } catch (e) {
      throw('Error getting temporary directory');
    }
    String newPath = FileManager.fixFileNameDelimiters('${dir.path}${Platform.pathSeparator}TmPmP_${RandomFileName.generateRandomFileName(fileExt != null ? fileExt! : 'tmp')}'); // update file path
    //value=(value as File).renameSync(newPath);  // rename asset
    value=await safeMoveFile((value as File),newPath);    // rename asset
    filePath=newPath;
  }

  // copy asset file to temporary file to avoid it is overwritten during note save
  Future<void> copyAssetToTemporaryFile() async {
    Directory? dir;
    try {
      dir = await FileManager.getTmpAssetDir();
    } catch (e) {
      throw('Error getting temporary directory');
    }
    String newPath = FileManager.fixFileNameDelimiters('${dir.path}${Platform.pathSeparator}TmPmP_${RandomFileName.generateRandomFileName(fileExt != null ? fileExt! : 'tmp')}'); // update file path
    value=await (value as File).copy(newPath);  // copy asset to new file
    filePath=newPath;
  }

  // function used to rename assets
  Future<File> safeMoveFile(File source, String newPath) async {
    // first test if destination directory exists
    final String parentDirectory = newPath.substring(0, newPath.lastIndexOf(Platform.pathSeparator));
    await Directory(parentDirectory).create(recursive: true);
    try {
      return await source.rename(newPath);
    } on FileSystemException catch (e) {
      // Cross-device link (Android/Linux = 18, Windows = 17 or 32)
      final code = e.osError?.errorCode ?? -1;
      if (code == 18 || code == 17 || code == 32) {
        // Cross-device link, must copy by hand
        final newFile = await source.copy(newPath);
        try {
          await source.delete();
        } on FileSystemException catch (e) {
          // we at least copied file so continue
          final code = e.osError?.errorCode ?? -1;
        }
        return newFile;
      }
      else {
        rethrow;
      }
    }
  }

  void safeMoveFileSync(File source, File destination) {
    try {
      source.renameSync(destination.path);
    } on FileSystemException catch (e) {
      final code = e.osError?.errorCode ?? -1;
      if (code == 18 || code == 17 || code == 32) {
        // Cross-device link – use copySync and deleteSync
        source.copySync(destination.path);
        source.deleteSync();
      } else {
        rethrow;
      }
    }
  }




//  @override
//  int? get hash => filePath?.hash ?? hash;

  @override
  String toString() =>
      'CacheItem(path: $filePath, preview=$previewHash, full=$hash, refs=$_refCount)';
}

// cache manager
class AssetCacheAll {
  final List<CacheItem> _items = [];
  final Map<int, int> _aliasMap =
      {}; // duplicite indices point to first indice  - updated in finalize
  final Map<int, int> _previewHashIndex =
      {}; // Map from previewHash → first index in _items

  final Map<int, Future<PdfDocument>> _openingDocs =
      {}; // Holds currently opening futures to avoid duplicate opens

  final Mutex _mutex = Mutex();   // blocking some operations

  /// Whether items from the cache can be removed:
  /// set to false during file save.
  bool allowRemovingAssets = true;

  final log = Logger('OrderedAssetCache');


  // pdfDocument notifier for rendering pdfs
  ValueNotifier<PdfDocument?> getPdfNotifier(int assetId) {
    final item = _items[assetId];
    if (item.assetType !=AssetType.pdf){
      throw('getPdfNotified for non pdf asset');
    }
    log.info('getPdfNotifiert ${assetId}');
    if (item._pdfDocument == null && item.value != null) {
      // if no one is already opening this doc, return their future
      if (_openingDocs[assetId] == null) {
        _openingDocs[assetId] = _openPdfDocument(item)
            .then((doc) {
          log.info('_pdfDocument read for $assetId');
          item._pdfDocument = doc;
          item.pdfDocumentNotifier.value = doc; // notify widgets
          _openingDocs.remove(assetId);
          return doc;
        }).catchError((e, st) {
          log.severe('Error opening PDF $assetId: $e\n$st');
          _openingDocs.remove(assetId);
          throw e; // ❌ místo `return null`
        });
      }
    } else if (item._pdfDocument != null) {
      // if already opened, return it immediately
      if (item.pdfDocumentNotifier.value != item._pdfDocument) {
        item.pdfDocumentNotifier.value = item._pdfDocument;
      }
    }
    log.info('_pdfDocument returning');
    return item.pdfDocumentNotifier;
  }

  // open pdf document
  Future<PdfDocument> _openPdfDocument(CacheItem item) async {
    if (item.filePath != null) {
      log.info('open PdfDocument ${item.filePath!}');
//      final file = File(item.filePath!);
//      item.bytes = await file.readAsBytes();
//      return PdfDocument.openData(item.bytes!);
      return await PdfDocument.openFile(item.filePath!);
    } else if (item.value is Uint8List) {
      return PdfDocument.openData(item.value as Uint8List);
    } else {
      throw StateError('Asset is not a PDF');
    }
  }

  // removes image provider of file from image Cache.
  // important to call this when assets are renamed
  Future<void> clearPdfDocumentNotifier(int assetId) async {
    // return cached provider if already available
    final item = _items[assetId];
    if (item.assetType !=AssetType.pdf){
      throw('clearPdfDocumentNotifier for non pdf asset');
    }
    if (item.pdfDocumentNotifier.value == null)
      return;
    if (item.value is File) {
      item._pdfDocument = null;
      _openingDocs.remove(assetId);  // clear indicator
      item.pdfDocumentNotifier.value!.dispose();  // free pdf document
      item.pdfDocumentNotifier.value = null; // set provider to null to inform widgets to reload
    }
    return;
  }



  // removes image provider of file from image Cache.
  // important to call this when assets are renamed otherwise image cache will provide cached image of file
  // instead of new image.
  Future<void> clearImageProvider(int assetId) async {
    // clear image provider if already available
    final item = _items[assetId];
    if (item.assetType !=AssetType.image){
      throw('clearImageProvider for non image asset');
    }
    if (item.imageProviderNotifier.value == null)
      return;
    if (item.value is File) {
      final file=FileImage(item.value as File);
      final key = await file.obtainKey(ImageConfiguration());
      imageCache.evict(key);
    }
    return;
  }

  // give image provider notifier for asset image
  ValueNotifier<ImageProvider?> getImageProviderNotifier(int assetId) {
    // return cached provider if already available
    final item = _items[assetId];
    if (item.assetType !=AssetType.image){
      throw('getImageProviderNotifier for non image asset');
    }
    if (item.imageProviderNotifier.value != null)
      return item.imageProviderNotifier;

    if (item.value is File) {
      item.imageProviderNotifier.value = FileImage(item.value as File);
    } else if (item.value is Uint8List) {
      item.imageProviderNotifier.value = MemoryImage(item.value as Uint8List);
    } else if (item.value is MemoryImage) {
      item.imageProviderNotifier.value = item.value as MemoryImage;
    } else if (item.value is FileImage) {
      item.imageProviderNotifier.value = item.value as FileImage;
    } else {
      throw UnsupportedError(
          'Unsupported type for ImageProvider: ${item.value.runtimeType}');
    }
    return item.imageProviderNotifier;
  }

  // calculate hash of bytes (all)
  int calculateHash(List<int> bytes,int fileSize) {
    // fnv1a
    int hash = 0x811C9DC5;

    // first 4 bytes will be hashed file size
    hash ^= (fileSize & 0xFF);           // lowest byte
    hash = (hash * 0x01000193) & 0xFFFFFFFF;

    hash ^= ((fileSize >> 8) & 0xFF);    // second byte
    hash = (hash * 0x01000193) & 0xFFFFFFFF;

    hash ^= ((fileSize >> 16) & 0xFF);   // third byte
    hash = (hash * 0x01000193) & 0xFFFFFFFF;

    hash ^= ((fileSize >> 24) & 0xFF);   // fourth byte

    // and hash of filebytes
    for (var b in bytes) {
      hash ^= b;
      hash = (hash * 0x01000193) & 0xFFFFFFFF;
    }
    return hash;
  }

// Compute a quick hash based on the first 100 KB of the file.
// This can be done synchronously to quickly filter duplicates.
// calculate preview hash of file
  PreviewResult getFilePreviewHash(File file,String extension) {
    final stat = file.statSync(); // get file metadata
    final fileSize = stat.size;

    final raf = file.openSync(mode: FileMode.read);
    try {
      // read either the whole file if small, or just the first 100 KB
      final toRead = fileSize < 100 * 1024 ? fileSize : 100 * 1024;
      final bytes = raf.readSync(toRead);
      final previewHashBytes = calculateHash(bytes,fileSize);
      String fileInfo='';
      if (extension == '.pdf') {
        // asset is pdf, get pdf /Info, it is quick
        try {
          final info = PdfInfoExtractor.extractInfo(file);
          fileInfo=info.values.join(',');   // convert info to one String
        }
        catch(e) {
          fileInfo='';
        }
      }
      return PreviewResult(
          previewHashBytes, // previehash is put together from file size and hash of first 100kB
          fileSize, // file size
          fileInfo
      );
    } finally {
      raf.closeSync();
    }
  }

  // remove item use but keep it in cache (in case of undo/redo)
  void removeUse(int id){
    _items[id].freeUse();
  }

  // add item use
  void addUse(int id){
    _items[id].addUse();
  }

  // Is used during read of note when it is opened.
  // everything from new notes sba2 is File!
  // only old notes provide bytes instead File
  // NOTE: Because old asset cache stores pdf as asset for each page, we should
  //       check during reading if asset is not the same as already stored asset!
  //       It is why we simply not add every asset, because they can be the same.
  //       add to cache but read only small part of files - used when reading note from disk
  //       full hashes are established later
  int addSync(Object value,
    String extension,
    int assetIdNote,  // assets of note can be read not in order of asset number.
    String? fileInfo,
    int? previewHash,
    int? fileSize,
    int? hash) {
    if (value is File) {
      log.info('allCache.addSync: value = $value');
      final path = value.path;

      final existingPathIndex = _items.indexWhere((i) => i.filePath == path);
      if (existingPathIndex != -1) {
        // file path already in cache and is the same
        _items[existingPathIndex].addUse();
        log.info(
            'allCache.addSync: already in cache {$_items[existingPathIndex]._refCount}');
        return existingPathIndex;
      }
      PreviewResult previewResult;
      if (previewHash != null && fileSize !=null){
        // file information is stored directly in asset no need to determine it
        previewResult = PreviewResult(previewHash, fileSize, fileInfo ?? '');
      }
      else {
        previewResult =getFilePreviewHash(value,extension); // calculate preliminary hash of file or get Info of pdf file
      }

      if (previewResult.fileInfo.isNotEmpty){
        // we know information about file (it is pdf) so test it
        final existingFileInfoIndex = _items.indexWhere((i) => i.fileInfo == previewResult.fileInfo);
        if (existingFileInfoIndex != -1) {
          // file with this fileInfo already in cache
          _items[existingFileInfoIndex].addUse();
          log.info(
              'allCache.addSync: already in cache {$_items[existingPathIndex]._refCount}');
          return existingFileInfoIndex;
        }
      }

      // Check if already cached previewHash
      if (_previewHashIndex.containsKey(previewResult.previewHash)) {
        final existingIndex = _previewHashIndex[previewResult.previewHash]!;
        _items[existingIndex].addUse();
        return existingIndex;
      }

      // create item
      final newItem = CacheItem(value,
          filePath: value.path,
          previewHash: previewResult.previewHash,
          fileSize: previewResult.fileSize,
          fileExt: extension,
          fileInfo: previewResult.fileInfo,
          hash: hash)
        ..addUse(); // and add use
      while (_items.length <= assetIdNote) {
        _items.add(CacheItem.placeholder()); // insert placeholder of asset, it will be filled later
      }
      _items[assetIdNote]=newItem;
      final index = assetIdNote;
      _previewHashIndex[previewResult.previewHash] =
          index; // add to previously hashed
      return index;
    }
    else{
      throw Exception('assetCacheAll.add: unknown type ${value.runtimeType}');
    }
  }

// async add cache is used from Editor, when adding asset using file picker
// always is used File!
// by default is file copied to new file before adding to assets
  Future<int> add(Object value,{bool copyFromSource = true }) async {
    return await _mutex.protect(() async {
      log.info("add mutex taken");
      if (value is File) {
        // files are first compared by file path
        final path = value.path;
        final extension = '.${value.path.split('.').last.toLowerCase()}';

        // 1. Fast path check
        final existingPathIndex = _items.indexWhere((i) => i.filePath == path);
        if (existingPathIndex != -1) {
          _items[existingPathIndex].addUse();
          return existingPathIndex;
        }

        final previewResult =
        getFilePreviewHash(value,extension); // calculate preliminary hash of file

        if (previewResult.fileInfo.isNotEmpty) {
          // we know information about file (pdf file) so test it
          final existingFileInfoIndex = _items.indexWhere((i) =>
          i.fileInfo == previewResult.fileInfo);
          if (existingFileInfoIndex != -1) {
            // file with this fileInfo already in cache
            _items[existingFileInfoIndex].addUse();
            log.info(
                'allCache.addSync: already in cache {$_items[existingPathIndex]._refCount}');
            return existingFileInfoIndex;
          }
        }

        // Check previwHash value
        if (_previewHashIndex.containsKey(previewResult.previewHash)) {
          final existingIndex = _previewHashIndex[previewResult.previewHash]!;
          _items[existingIndex].addUse();
          return existingIndex;
        }

        // compute expensive content hash - need to read whole file
        final bytes = await value.readAsBytes();
        final hash = calculateHash(bytes,previewResult.fileSize);

        // prepare cache item
        final newItem = CacheItem(value,
            filePath: value.path,
            previewHash: previewResult.previewHash,
            hash: hash,
            fileExt: extension,
            fileSize: previewResult.fileSize,
            fileInfo: previewResult.fileInfo)
          ..addUse();

        // check if it is already in cache
        final existingHashIndex = _items.indexOf(newItem);
        if (existingHashIndex != -1) {
          _items[existingHashIndex].addUse();
          return existingHashIndex;
        }
        // file should be added to assets
        if (copyFromSource){
          // copy original file
          await newItem.copyAssetToTemporaryFile();
        }
        _items.add(newItem);
        final index = _items.length - 1;
        _previewHashIndex[previewResult.previewHash] =
            index; // add to previously hashed
        return index;
      } else {
        throw Exception(
            'assetCacheAll.add: unknown type ${value.runtimeType}');
      }
    });
  }

  /// The number of (distinct) items in the cache.
  int get length => _items.length;
  bool get isEmpty => _items.isEmpty;
  bool get isNotEmpty => _items.isNotEmpty;

  /// Converts the item at position [indexIn]
  /// to bytes and returns them.
  Future<List<int>> getBytes(int indexIn) async {
    final index = resolveIndex(
        indexIn); // find first occurence in cache to avoid duplicities
    final item = _items[index].value;
    if (item is List<int>) {
      return item;
    } else if (item is File) {
      return item.readAsBytes();
    } else if (item is String) {
      return utf8.encode(item);
    } else if (item is MemoryImage) {
      return item.bytes;
    } else if (item is FileImage) {
      return item.file.readAsBytes();
    } else {
      throw Exception(
          'assetCacheAll.getBytes: unknown type ${item.runtimeType}');
    }
  }

  // return id of asset which must be used on save
  int getAssetIdOnSave(int index){
    return _items[index].assetIdOnSave;
  }

  // return asset previewHash
  int getAssetPreviewHash(int index){
    return _items[index].previewHash!;
  }

  // return asset Hash
  int? getAssetHash(int index){
    return _items[index].hash;
  }

  // return asset fileInfo
  String getAssetFileInfo(int index){
    return _items[index].fileInfo ?? '';
  }

  // return asset fileSize
  int getAssetFileSize(int index){
    return _items[index].fileSize!;
  }

  // this routine should be called before note is saved. It renumbers assets according their usage
  // if some asset is deleted (it is kept in undo/redo cache). When undo is used, asset is used again, but if note is saved meantime,
  // it can occur situation that item[1] is again used, but item[2] has already asset file name *.1 and will be rewriten when item[1] is saved
  // we must use 2 pass check of file names
  Future<void> renumberBeforeSave(String noteFilePath) async{
    await _mutex.protect(() async {
      log.info("renumber mutex taken");

      // first assign asset number for files
      log.info("find asset numbers");
      int currentId = -1;
      for (int i = 0; i < _items.length; i++) {
        final item = _items[i];
        log.info("item $i");
        if (item.refCount > 0) {
          currentId++;
          item.assetIdOnSave = currentId;
        }
        else {
          // this item is not used. We should save it to temp directory
          // in case of undo it can be used again
          item.assetIdOnSave = -1;
        }
      }

      log.info("move unused assets to temporary files");
      for (int i = _items.length - 1; i >= 0; i--) {
        final item = _items[i];
        log.info("item $i");
        if (item.refCount < 1) {
          // this item is not used. We should save it to temp directory
          // in case of undo it can be used again
          log.info("item $i is not used as asset");
          if ((item.filePath)!.startsWith(noteFilePath)) {
            log.info("item is from asset and must be saved to temporary directory");
            // file path of asset is the same as note path - asset file can be overwritten,
            // move it to the safe location
            if (item.isImage) {
              await clearImageProvider(i); // remove imageProvider from cache
            } else if (item.isPdf){
              clearPdfDocumentNotifier(i);
            }
            try {
              await item.moveAssetToTemporaryFile(); // move asset to different file
            } catch (e){
              log.info('Error saving asset to temporary file');
            }
            if (item.isImage) {
              item.invalidateImageProvider(); // invalidate image provider so new one is allocated
              getImageProviderNotifier(i); // allocate new image provider to enable rendering
            } else if (item.isPdf){
              // nothing to do with pdf. It's document is created automatically on redraw of widget
            }
          }
        }
      }


      log.info("now assetId on Save are assigned and assets can be saved - it is safe to save them in reversed order");
      for (int i = _items.length - 1; i >= 0; i--) {
        final item = _items[i];
        log.info("item $i");
        if (item.refCount > 0) {
          currentId=item.assetIdOnSave;  // assign asset number on save
          final newPath = '$noteFilePath.$currentId'; // new asset file
          log.info("item $i is used as asset $currentId. item file name ${item.filePath}  and must be saved as $newPath");
          if ((item.filePath) != newPath) {
            // move asset to correct file name
            if (item.isImage) {
              await clearImageProvider(i); // remove imageProvider from cache
            } else if (item.isPdf){
              clearPdfDocumentNotifier(i);
            }
            item.value = await item.safeMoveFile((item.value as File), newPath); // rename asset file
//            item.value = (item.value as File).renameSync(newPath); // rename asset
            item.filePath = newPath;
            if (item.isImage) {
              item.invalidateImageProvider(); // invalidate image provider so new one is allocated
              getImageProviderNotifier(i); // allocate new image provider to enable rendering
            } else if (item.isPdf){
              // nothing to do with pdf. It's document is created automatically on redraw of widget
            }
          }
        }
        else {
          // this item is not used. We should save it to temp directory
          // in case of undo it can be used again
          // but it was already moved to temporary file
        }
      }
      return;
    });
  }


  // finalize cache after it was filled using addSync - without calculation of hashes
  // is called after note is read to Editor
  Future<void> finalize() async {
    final Map<int, int> seenHashes = {}; // hash points to first index
    for (int i = 0; i < _items.length; i++) {
      final item = _items[i];
      int hash;
      int? hashItem = item.hash;
      if (hashItem == 0) {
        final bytes = await getBytes(i);
        hash = calculateHash(bytes,_items[i].fileSize!);
        _items[i] = CacheItem(item.value,
            hash: hash, filePath: item.filePath, fileSize: item.fileSize);
      } else {
        hash = hashItem!;
      }

      if (seenHashes.containsKey(hash)) {
        // už existuje → aliasuj na první výskyt
        _aliasMap[i] = seenHashes[hash]!;
      } else {
        seenHashes[hash] = i;
      }
    }
  }

  /// return real index through alias map
  int resolveIndex(int index) {
    return _aliasMap[index] ?? index;
  }

  // replace asset by another one - typically when resampling image to lower resolution
  Future<void> replaceImage(Object value, int id) async {
    await _mutex.protect(() async {
      if (value is File) {
        // compute expensive content hash
        final bytes = await value.readAsBytes();
        final previewResult =
        getFilePreviewHash(value,_items[id].fileExt!); // calculate preliminary hash of file
        final hash = calculateHash(bytes,previewResult.fileSize);

        final oldItem = _items[id];
        // create new Cache item
        final newItem = CacheItem(
          value,
          filePath: value.path,
          previewHash: previewResult.previewHash,
          hash: hash,
          fileSize: previewResult.fileSize,
          imageProviderNotifier:
          oldItem.imageProviderNotifier, // keep original Notifier
        )
          .._refCount = oldItem._refCount; // keep number of references

        // update original fields
        _items[id] = newItem;
        _items[id]
            .invalidateImageProvider; // invalidate imageProvider so it is newly created when needed
      } else {
        throw Exception(
            'assetCacheAll.replaceImage: unknown type ${value.runtimeType}');
      }
    });
  }

  // return File associated with asset, used to save assets when saving note
  File getAssetFile(int id) {
    final item = _items[id];
    if (item.value is File) {
      return (item.value as File);
    } else if (item is FileImage) {
      return (item.value as FileImage).file;
    } else {
      throw Exception(
          'assetCacheAll.getBytes: unknown type ${item.runtimeType}');
    }
  }

  // create temporary file from bytes when inline bytes are read
  File createRuntimeFile(String ext, Uint8List bytes) {
    final dir = Directory.systemTemp; // use system temp
//    final dir = await getApplicationSupportDirectory();
    final file = File('${dir.path}${Platform.pathSeparator}TmPmP_${RandomFileName.generateRandomFileName(ext)}');
    file.writeAsBytesSync(bytes, flush: true);
    return file;
  }

  void dispose() {
    for (CacheItem item in _items){
      item.dispose();
    }
    _items.clear();
    _cleanupCacheAll();
    _aliasMap.clear();
    _openingDocs.clear();
    _previewHashIndex.clear();
  }

  // remove all temporary assets which were not used
  Future<void> _cleanupCacheAll() async {

    // List all entries in the temporary directory
    try {
      final dir = await FileManager.getTmpAssetDir();
      await for (final entity in dir.list(recursive: false)) {
        // Check if it's a file (not a directory)
        if (entity is File) {
          final fileName = entity.uri.pathSegments.last;

          // Check if the name starts with 'TmPmP'
          if (fileName.startsWith('TmPmP')) {
            try {
              await entity.delete();
              log.info('AssetCacheAll.dispose - Deleted: $fileName');
            } catch (e) {
              log.info('AssetCacheAll.dispose - failed to deleted: $fileName');
            }
          }
        }
      }
      await dir.delete(recursive: true);  // delete also temporary directory so it does not show in file lists
    } catch (e) {
      log.info('Error deleting assetCacheAll temp files: $e');
    }

  }

  @override
  String toString() => _items.toString();
}
