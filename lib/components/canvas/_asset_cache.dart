import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:saber/components/canvas/image/editor_image.dart';

/// A cache for assets that are loaded from disk.
///
/// This is the analogue to Flutter's image cache,
/// but for non-image assets.
///
/// There should be one instance of this class per
/// [EditorCoreInfo] instance.
class AssetCache {
  AssetCache();

  final log = Logger('AssetCache');

  /// Maps a file path to its value.
  final Map<String, Object> _cache = {};

  /// Maps a file path to the visible images that use it.
  final Map<String, Set<EditorImage>> _images = {};

  /// Whether items from the cache can be removed:
  /// set to false during file save.
  bool allowRemovingAssets = true;

  /// Marks [image] as currently visible.
  ///
  /// It's safe to call this method multiple times.
  ///
  /// [file] is allowed to be null for convenience,
  /// in which case this function does nothing.
  void addImage<T extends Object>(EditorImage image, File? file, T value) {
    if (file == null) return;
    _images.putIfAbsent(file.path, () => {}).add(image);
    _cache[file.path] = value;
  }

  /// Returns null if [file] is not found.
  T? get<T extends Object>(File file) {
    return _cache[file.path] as T?;
  }

  /// Marks [image] as no longer visible.
  ///
  /// It's safe to call this method multiple times.
  ///
  /// If [image] is the last image using its file,
  /// the file is also removed from the cache.
  ///
  /// Returns whether the image was present in the cache.
  bool removeImage(EditorImage image) {
    if (!allowRemovingAssets) return false;

    for (final filePath in _images.keys) {
      final imagesUsingFile = _images[filePath]!;
      imagesUsingFile.remove(image);

      if (imagesUsingFile.isEmpty) {
        _images.remove(filePath);
        _cache.remove(filePath);
        return true;
      }
    }

    return false;
  }

  void dispose() {
    _images.clear();
    _cache.clear();
  }
}

class OrderedAssetCache {
  OrderedAssetCache();

  final log = Logger('OrderedAssetCache');

  final List<Object> _cache = [];

  /// Adds [value] to the cache if it is not already present and
  /// returns the index of the added item.
  int add<T extends Object>(T value) {
    int index = _cache.indexOf(value);
    if (index == -1 && value is List<int>) {
      // Lists need to be compared per item
      final listEq = const ListEquality().equals;
      for (int i = 0; i < _cache.length; i++) {
        final cacheItem = _cache[i];
        if (cacheItem is! List<int>) continue;
        if (!listEq(value, cacheItem)) continue;

        index = i;
        break;
      }
    }
    log.fine('OrderedAssetCache.add: index = $index, value = $value');

    if (index == -1) {
      _cache.add(value);
      return _cache.length - 1;
    } else {
      return index;
    }
  }

  /// The number of (distinct) items in the cache.
  int get length => _cache.length;
  bool get isEmpty => _cache.isEmpty;
  bool get isNotEmpty => _cache.isNotEmpty;

  /// Converts the item at position [index]
  /// to bytes and returns them.
  Future<List<int>> getBytes(int index) async {
    final item = _cache[index];
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
          'OrderedAssetCache.getBytes: unknown type ${item.runtimeType}');
    }
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
///   for each photo item provides ValueNotifier<ImageProvider?>  so the same items have the same ImageProvider
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
///   2. Each item provides PdfDocument  for pdfs or ValueNotifier<ImageProvider?> for images. It saves memory




// class returning preview data
class PreviewResult {
  final int previewHash;
  final int fileSize;

  PreviewResult(this.previewHash, this.fileSize);
}

// object in cache
class CacheItem {
  final Object value;
  int? previewHash; // quick hash (from first 100KB bytes)
  int? hash;  // hash can be calculated later
  final ValueNotifier<ImageProvider?> imageProviderNotifier;  // image provider for png, svg as value listener
  PdfDocument? _pdfDocument;      // pdf document provider for pdf

  // for files only
  final int? fileSize;
  final String? filePath; // only for files - for fast comparison without reading file contents
  final String? fileExt;  // file extension
  int _refCount = 0;    // number of references
  bool _released = false;

  CacheItem(this.value,
        {this.hash,
          this.filePath,
          this.previewHash,
          this.fileSize,
          this.fileExt,
          ValueNotifier<ImageProvider?>? imageProviderNotifier,
        }): imageProviderNotifier = imageProviderNotifier ?? ValueNotifier(null);


  // increase use of item
  void addUse() {
    if (_released) throw StateError('Trying to add use of released CacheItem');
    _refCount++;
  }

  // when asset is released (no more used)
  void freeUse() {
    if (_refCount > 0) _refCount--;
    if (_refCount == 0) _released = true;
  }

  bool get isUnused => _refCount == 0;
  bool get isReleased => _released;

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
      return  item;
    } else if (item is FileImage) {
      return  item;
    } else {
      throw UnsupportedError('Unsupported type for ImageProvider: ${item.runtimeType}');
    }
  }

  // invalidate image provider notifier value - called in case of image replacement
  // this causes that new imageProvider will be created
  void invalidateImageProvider() {
    imageProviderNotifier.value = null; // will be recreated on next access
  }

//  @override
//  int? get hash => filePath?.hash ?? hash;

  @override
  String toString() =>
      'CacheItem(path: $filePath, preview=$previewHash, full=$hash, refs=$_refCount, released=$_released)';
}

// cache manager
class AssetCacheAll {
  final List<CacheItem> _items = [];
  final Map<int, int> _aliasMap = {}; // duplicit indices point to first indice  - updated in finalize
  final Map<int, int> _previewHashIndex = {};   // Map from previewHash → first index in _items

  final Map<int, Future<PdfDocument>> _openingDocs = {};   // Holds currently opening futures to avoid duplicate opens

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

  // give image provider notifier for asset image
  ValueNotifier<ImageProvider?> getImageProviderNotifier(int assetId) {
    // return cached provider if already available
    final item = _items[assetId];
    if (item.imageProviderNotifier.value != null) return item.imageProviderNotifier;

    if (item.value is File) {
      item.imageProviderNotifier.value = FileImage(item.value as File);
    } else if (item.value is Uint8List) {
      item.imageProviderNotifier.value = MemoryImage(item.value as Uint8List);
    } else if (item.value is MemoryImage) {
      item.imageProviderNotifier.value = item.value as MemoryImage;
    } else if (item.value is FileImage) {
      item.imageProviderNotifier.value = item.value as FileImage;
    } else {
      throw UnsupportedError('Unsupported type for ImageProvider: ${item.value.runtimeType}');
    }
    return item.imageProviderNotifier;
  }





  // calculate hash of bytes (all)
  int calculateHash(List<int> bytes) { // fnv1a
    int hash = 0x811C9DC5;
    for (var b in bytes) {
      hash ^= b;
      hash = (hash * 0x01000193) & 0xFFFFFFFF;
    }
    return hash;
  }

// Compute a quick hash based on the first 100 KB of the file.
// This can be done synchronously to quickly filter duplicates.
// calculate preview hash of file
  PreviewResult getFilePreviewHash(File file) {
    final stat = file.statSync();          // get file metadata
    final fileSize = stat.size;

    final raf = file.openSync(mode: FileMode.read);
    try {
      // read either the whole file if small, or just the first 100 KB
      final toRead = fileSize < 100 * 1024 ? fileSize : 100 * 1024;
      final bytes = raf.readSync(toRead);
      final previewHash = calculateHash(bytes);
      return PreviewResult((fileSize.hashCode << 32) ^ previewHash, // hash
                  fileSize);    // file size
    } finally {
      raf.closeSync();
    }
  }

  // add to cache but read only small part of files - used when reading note from disk
  // full hashes are established later
  // is used during read of note when it is opened.
  // everything from new notes sba2 is File!
  // only old notes provide bytes instead File
  int addSync(Object value) {
    if (value is File) {
      log.info('allCache.addSync: value = $value');
      final path = value.path;

      final existingPathIndex = _items.indexWhere((i) => i.filePath == path);
      if (existingPathIndex != -1) {
        _items[existingPathIndex].addUse();
        log.info('allCache.addSync: already in cache {$_items[existingPathIndex]._refCount}');
        return existingPathIndex;
      }
      final previewResult=getFilePreviewHash(value);  // calculate preliminary hash of file

      // Check if already cached
      if (_previewHashIndex.containsKey(previewResult.previewHash)) {
        final existingIndex = _previewHashIndex[previewResult.previewHash]!;
        _items[existingIndex].addUse();
        return existingIndex;
      }

      final newItem = CacheItem(value,
          filePath: value.path,
          previewHash: previewResult.previewHash,
          fileSize: previewResult.fileSize)..addUse();
      _items.add(newItem);
      final index = _items.length - 1;
      _previewHashIndex[previewResult.previewHash] = index;  // add to previously hashed
      return index;
    } else if (value is FileImage) {
      final path = value.file.path;
      final File file = File(path);
      final previewResult=getFilePreviewHash(file);  // calculate preliminary hash of file

      final existingPathIndex = _items.indexWhere((i) => i.filePath == path);
      if (existingPathIndex != -1){
        _items[existingPathIndex].addUse();
        return existingPathIndex;
      }

      // Check if already cached
      if (_previewHashIndex.containsKey(previewResult.previewHash)) {
        final existingIndex = _previewHashIndex[previewResult.previewHash]!;
        _items[existingIndex].addUse();
        return existingIndex;
      }


      final newItem = CacheItem(value,
                          filePath: path,
                          previewHash: previewResult.previewHash,
                          fileSize: previewResult.fileSize)..addUse();
      _items.add(newItem);
      final index = _items.length - 1;
      _previewHashIndex[previewResult.previewHash] = index;  // add to previously hashed
      return index;
    } else if (value is MemoryImage) { // file images are first compared by file path
      final hash = calculateHash(value.bytes);
      final newItem = CacheItem(value, hash: hash)..addUse();

      final existingHashIndex = _items.indexOf(newItem);
      if (existingHashIndex != -1) return existingHashIndex;

      _items.add(newItem);
      final index = _items.length - 1;
      return index;
    } else if (value is List<int>) { // bytes
      final hash = calculateHash(value);
      final newItem = CacheItem(value, hash: hash)..addUse();

      final existingHashIndex = _items.indexOf(newItem);
      if (existingHashIndex != -1) return existingHashIndex;

      _items.add(newItem);
      final index = _items.length - 1;
      return index;
    } else if (value is String){
        // directly calculate hash
        final newItem = CacheItem(value, hash: value.hashCode)..addUse();
        final existingHashIndex = _items.indexOf(newItem);
        if (existingHashIndex != -1) return existingHashIndex;
        _items.add(newItem);
        final index = _items.length - 1;
        return index;
    } else {
      throw Exception(
          'OrderedAssetCache.getBytes: unknown type ${value.runtimeType}');
    }
  }

// is used from Editor, when adding asset using file picker
// always is used File!
  Future<int> add(Object value) async {
    if (value is File) { // files are first compared by file path
      final path = value.path;

      // 1. Fast path check
      final existingPathIndex =
      _items.indexWhere((i) => i.filePath == path);
      if (existingPathIndex != -1) {
        _items[existingPathIndex].addUse();
        return existingPathIndex;
      }
      final previewResult=getFilePreviewHash(value);  // calculate preliminary hash of file

      // Check if already cached
      if (_previewHashIndex.containsKey(previewResult.previewHash)) {
        final existingIndex = _previewHashIndex[previewResult.previewHash]!;
        _items[existingIndex].addUse();
        return existingIndex;
      }

      // compute expensive content hash
      final bytes = await value.readAsBytes();
      final hash = calculateHash(bytes);

      final newItem = CacheItem(value,
          filePath: value.path,
          previewHash: previewResult.previewHash,
          hash: hash,
          fileSize: previewResult.fileSize)..addUse();

      final existingHashIndex = _items.indexOf(newItem);
      if (existingHashIndex != -1){
        _items[existingHashIndex].addUse();
        return existingHashIndex;
      }
      _items.add(newItem);
      final index = _items.length - 1;
      _previewHashIndex[previewResult.previewHash] = index;  // add to previously hashed
      return index;
    } else if (value is FileImage) { // file images are first compared by file path
      final path = value.file.path;

      // 1. Fast path check
      final existingPathIndex =
      _items.indexWhere((i) => i.filePath == path);
      if (existingPathIndex != -1) {
        _items[existingPathIndex].addUse();
        return existingPathIndex;
      }

      final File file = File(path);
      final previewResult=getFilePreviewHash(file);  // calculate preliminary hash of file

      // Check if already cached
      if (_previewHashIndex.containsKey(previewResult.previewHash)) {
        final existingIndex = _previewHashIndex[previewResult.previewHash]!;
        _items[existingIndex].addUse();
        return existingIndex;
      }

      final bytes = await value.file.readAsBytes();
      final hash = calculateHash(bytes);

      final newItem = CacheItem(value, hash: hash, filePath: path);

      final existingHashIndex = _items.indexOf(newItem);
      if (existingHashIndex != -1) return existingHashIndex;

      _items.add(newItem);
      return _items.length - 1;
    } else if (value is MemoryImage) { // file images are first compared by file path
      final hash = calculateHash(value.bytes);

      final newItem = CacheItem(value, hash: hash);

      final existingHashIndex = _items.indexOf(newItem);
      if (existingHashIndex != -1) return existingHashIndex;

      _items.add(newItem);
      return _items.length - 1;
    } else {
      final hash = value.hashCode;  // string
      final newItem = CacheItem(value, hash: hash);

      final existingIndex = _items.indexOf(newItem);
      if (existingIndex != -1) return existingIndex;

      _items.add(newItem);
      return _items.length - 1;
    }
  }

  /// The number of (distinct) items in the cache.
  int get length => _items.length;
  bool get isEmpty => _items.isEmpty;
  bool get isNotEmpty => _items.isNotEmpty;

  /// Converts the item at position [indexIn]
  /// to bytes and returns them.
  Future<List<int>> getBytes(int indexIn) async {
    final index = resolveIndex(indexIn);  // find first occurence in cache to avoid duplicities
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
        hash = calculateHash(bytes);
        _items[i] = CacheItem(item.value, hash: hash, filePath: item.filePath, fileSize: item.fileSize);
      }
      else {
        hash=hashItem!;
      }

      if (seenHashes.containsKey(hash)) {
        // už existuje → aliasuj na první výskyt
        _aliasMap[i] = seenHashes[hash]!;
      } else {
        seenHashes[hash] = i;
      }
    }
  }

  /// retunr real index through alias map
  int resolveIndex(int index) {
    return _aliasMap[index] ?? index;
  }

  // replace asset by another one - typically when resampling image to lower resolution
  Future<void> replaceImage(Object value,int id) async {
    if (value is File) {
      // compute expensive content hash
      final bytes = await value.readAsBytes();
      final hash = calculateHash(bytes);
      final previewResult=getFilePreviewHash(value);  // calculate preliminary hash of file

      final oldItem=_items[id];
      // create new Cache item
      final newItem = CacheItem(value,
          filePath: value.path,
          previewHash: previewResult.previewHash,
          hash: hash,
          fileSize: previewResult.fileSize,
          imageProviderNotifier: oldItem.imageProviderNotifier, // keep original Notifier
      ).._refCount=oldItem._refCount; // keep number of references

      // update original fields
      _items[id] = newItem;
      _items[id].invalidateImageProvider;  // invalidate imageProvider so it is newly created when needed
    } else {
    throw Exception(
    'assetCacheAll.replaceImage: unknown type ${value.runtimeType}');
    }
  }



  // generate random file name
  String generateRandomFileName([String extension = 'txt']) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(1 << 32); // 32-bit random number
    return 'file_${timestamp}_$random.$extension';
  }

  // create temporary file from bytes when inline bytes are read
  Future<File> createRuntimeFile(String ext, Uint8List bytes) async {
    final dir = await getApplicationSupportDirectory();
    final file = File('${dir.path}/TmPmP_${generateRandomFileName(ext)}');
    return await file.writeAsBytes(bytes, flush: true);
  }

  String readPdfMetadataSync(File file) {
    if (!file.existsSync()) {
      log.info('File not found');
      return '';
    }

    final fileSize = file.lengthSync();
    const trailerReadSize = 4096;

    final trailerStart = fileSize > trailerReadSize ? fileSize - trailerReadSize : 0;
    final trailerLength = fileSize > trailerReadSize ? trailerReadSize : fileSize;

    final raf = file.openSync();
    final trailerBytes = Uint8List(trailerLength);
    raf.setPositionSync(trailerStart);
    raf.readIntoSync(trailerBytes);
    raf.closeSync();

    final trailerContent = ascii.decode(trailerBytes, allowInvalid: true);
    final trailerIndex = trailerContent.lastIndexOf('trailer');
    if (trailerIndex == -1) {
      log.info('Trailer not found');
      return '';
    }

    final trailerSlice = trailerContent.substring(trailerIndex);
    final infoMatch = RegExp(r'/Info\s+(\d+)\s+(\d+)\s+R').firstMatch(trailerSlice);
    if (infoMatch == null) {
      log.info('Info object not found in trailer');
      return '';
    }

    final infoObjNumber = int.parse(infoMatch.group(1)!);
    final infoObjGen = int.parse(infoMatch.group(2)!);
    log.info('Info object reference: $infoObjNumber $infoObjGen');

    // Find startxref
    final startxrefIndex = trailerContent.lastIndexOf('startxref');
    if (startxrefIndex == -1) {
      log.info('startxref not found');
      raf.closeSync();
      return '';
    }

    final startxrefLine = trailerContent.substring(startxrefIndex).split(RegExp(r'\r?\n'))[1].trim();
    final xrefOffset = int.tryParse(startxrefLine);
    if (xrefOffset == null) {
      log.info('Invalid startxref value');
      raf.closeSync();
      return '';
    }

    // Go to xref table
    raf.setPositionSync(xrefOffset);
    final xrefBuffer = Uint8List(8192); // read enough bytes for xref table
    final bytesRead = raf.readIntoSync(xrefBuffer);
    final xrefContent = ascii.decode(xrefBuffer.sublist(0, bytesRead), allowInvalid: true);

    // Find object offset in xref table
    //final objPattern = RegExp(r'(\d{10})\s+(\d{5})\s+n');
    //final objMatches = objPattern.allMatches(xrefContent);
    int? objOffset;

    //nt currentObjNumber = 0;
    final subMatches = RegExp(r'(\d+)\s+(\d+)\s+(\d+)\s+n').allMatches(xrefContent);
    for (final m in subMatches) {
      final objNum = int.parse(m.group(1)!);
      final offset = int.parse(m.group(2)!);
      if (objNum == infoObjNumber) {
        objOffset = offset;
        break;
      }
    }

    if (objOffset == null) {
      log.info('Info object offset not found in xref table');
      raf.closeSync();
      return '';
    }

    // Read Info object directly
    raf.setPositionSync(objOffset);
    final objBytes = Uint8List(1024); // read enough for object
    final objRead = raf.readIntoSync(objBytes);
    final objContent = ascii.decode(objBytes.sublist(0, objRead), allowInvalid: true);

    final objMatchContent = RegExp(r'obj(.*?)endobj', dotAll: true).firstMatch(objContent);
    if (objMatchContent == null) {
      log.info('Info object content not found');
      raf.closeSync();
      return '';
    }

    final infoContent = objMatchContent.group(1)!;

    final titleMatch = RegExp(r'/Title\s+\((.*?)\)').firstMatch(infoContent);
    final authorMatch = RegExp(r'/Author\s+\((.*?)\)').firstMatch(infoContent);
    final creationMatch =
    RegExp(r'/CreationDate\s+\((.*?)\)').firstMatch(infoContent);
    final String metadata='${titleMatch?.group(1) ?? 'N/A'}${authorMatch?.group(1) ?? 'N/A'}${creationMatch?.group(1) ?? 'N/A'}';
    return metadata;
  }

  @override
  String toString() => _items.toString();

  void dispose() {
    _items.clear();
    _cache.clear();
  }

}
