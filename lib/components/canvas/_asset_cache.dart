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

// object in cache
class CacheItem {
  Object? value;  // value can change because file can be renamed
  int? previewHash; // quick hash (from first 100KB bytes)
  int? hash; // hash can be calculated later
  String? fileInfo; // file information - /Info of pdf is implemented now
  final ValueNotifier<ImageProvider?>
      imageProviderNotifier; // image provider for png, svg as value listener
  PdfDocument? _pdfDocument; // pdf document provider for pdf
  Uint8List? bytes;   // used only when reading inline assets

  // for files only
  final int? fileSize;
  String? filePath; // only for files - for fast comparison without reading file contents
  final String? fileExt; // file extension
  int _refCount = 0; // number of references
  int  assetIdOnSave=-1;   // id of asset when the note is save (some assets can be skipped)

  CacheItem(
    this.value, {
    this.hash,
    this.filePath,
    this.previewHash,
    this.fileSize,
    this.fileExt,
    this.fileInfo,
    this.bytes,
    ValueNotifier<ImageProvider?>? imageProviderNotifier,
  }) : imageProviderNotifier = imageProviderNotifier ?? ValueNotifier(null);

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

  // move asset file to temporary file to avoid it is overwriten during note save
  void moveAssetToTemporaryFile() {
    final dir = FileManager.supportDirectory;
    String newPath = '${dir.path}/TmPmP_${RandomFileName.generateRandomFileName(fileExt != null ? fileExt! : 'tmp')}'; // update file path
    value=(value as File).renameSync(newPath);  // rename asset
    filePath=newPath;
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
      {}; // duplicit indices point to first indice  - updated in finalize
  final Map<int, int> _previewHashIndex =
      {}; // Map from previewHash → first index in _items

  final Map<int, Future<PdfDocument>> _openingDocs =
      {}; // Holds currently opening futures to avoid duplicate opens

  final Mutex _mutex = Mutex();   // blocking some operations

  /// Whether items from the cache can be removed:
  /// set to false during file save.
  bool allowRemovingAssets = true;

  final log = Logger('OrderedAssetCache');


  // return pdfDocument of asset it is lazy because it take some time to do it
  Future<PdfDocument> getPdfDocument(int assetId) {
    // if already opened, return it immediately
    final item = _items[assetId];
    if (item._pdfDocument != null) return Future.value(item._pdfDocument!);

    // if someone else is already opening this doc, return their future
    final pending = _openingDocs[assetId];
    if (pending != null) return pending;

    // otherwise start opening
    final future = _openPdfDocument(item);
    _openingDocs[assetId] = future;

    // when done, store the PdfDocument in the CacheItem and remove from _openingDocs
    future.then((doc) {
      item._pdfDocument = doc;
      _openingDocs.remove(assetId);
    });

    return future;
  }

  // open pdf document
  Future<PdfDocument> _openPdfDocument(CacheItem item) async {
    if (item.filePath != null) {
      return PdfDocument.openFile(item.filePath!);
    } else if (item.value is Uint8List) {
      return PdfDocument.openData(item.value as Uint8List);
    } else {
      throw StateError('Asset is not a PDF');
    }
  }


  // removes image provider of file from image Cache.
  // important to call this when assets are renamed
  Future<void> clearImageProvider(int assetId) async {
    // return cached provider if already available
    final item = _items[assetId];
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

      _items.add(newItem);
      final index = _items.length - 1;
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
  Future<int> add(Object value) async {
    return await _mutex.protect(() async {
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
  Future<void> renumberBeforeSave(String noteFilePath) async{
    await _mutex.protect(() async {
      int currentId = -1;
      for (int i = 0; i < _items.length; i++) {
        final item = _items[i];
        if (item.refCount > 0) {
          currentId++;
          final newPath = '$noteFilePath.$currentId'; // new asset file
          item.assetIdOnSave = currentId;
          if ((item.filePath) != newPath) {
            // move asset to correct file name
            final bool isImage = item.imageProviderNotifier !=null;
            final bool isPdf = item._pdfDocument !=null;
            if (isImage) {
              await clearImageProvider(i); // remove imageProvider from cache
            } else if (isPdf){

            }

            item.value =
                (item.value as File).renameSync(newPath); // rename asset
            item.filePath = newPath;
            item.invalidateImageProvider(); // invalidate image provider so new one is allocated
            getImageProviderNotifier(i); // allocate new image provider to enable rendering
          }
        }
        else {
          // this item is not used. We should save it to temp directory
          // in case of undo it can be used again
          item.assetIdOnSave = -1;
          if ((item.filePath)!.startsWith(noteFilePath)) {
            // file path of asset is the same as note path - asset file can be overwritten,
            // move it to the safe location
            await clearImageProvider(i); // remove imageProvider from cache
            item.moveAssetToTemporaryFile(); // move asset to different file
            item.invalidateImageProvider(); // invalidate image provider so new one is allocated
            getImageProviderNotifier(i); // allocate new image provider to enable rendering
          }
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
    final dir = Directory.systemTemp; // Použití systémového temp adresáře
//    final dir = await getApplicationSupportDirectory();
    final file = File('${dir.path}/TmPmP_${RandomFileName.generateRandomFileName(ext)}');
    file.writeAsBytesSync(bytes, flush: true);
    return file;
  }

  void dispose() {
    _items.clear();
    _aliasMap.clear();
    _openingDocs.clear();
    _previewHashIndex.clear();
  }

  @override
  String toString() => _items.toString();
}
