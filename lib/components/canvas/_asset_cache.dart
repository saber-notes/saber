import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:collection/collection.dart';
import 'package:flutter/painting.dart';
import 'package:logging/logging.dart';
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
///   New approach to cache

// class returning preview data
class PreviewResult {
  final int previewHash;
  final int fileSize;

  PreviewResult(this.previewHash, this.fileSize);
}


// combine preview hash and size to "preliminary hash"
int makeCompositeKey(int previewHash, int fileSize) {
  // Shift size into high bits, preview hash stays in low bits
  // -> reduces collisions compared to just XOR
  return (fileSize.hashCode << 32) ^ previewHash;
}

// object in cache
class CacheItem {
  final Object value;
  int? previewHash; // quick hash (from first 100KB bytes)
  int? hash;  // hash can be calculated later

  // for files only
  final int? fileSize;
  final String? filePath; // only for files - for fast comparison without reading file contents

  int _refCount = 0;    // number of references
  bool _released = false;

  CacheItem(this.value,
      {this.hash, this.filePath, this.previewHash, this.fileSize});


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

    // Quick check using previewHash
    if (previewHash != null && other.previewHash != null) {
      if (previewHash != other.previewHash) {
        // preview hashes do not match - assets are different
        return false;
      }
    }
    if (filePath != null && other.filePath != null) {
      if (filePath == other.filePath) {
        // both file paths are the same
        return true;
      }
    }
    return false; // consider not equal
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


  final log = Logger('OrderedAssetCache');

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
  int addSync(Object value) {
    if (value is File) {
      final path = value.path;
      final previewResult=getFilePreviewHash(value);  // calculate preliminary hash of file

      // Check if already cached
      if (_previewHashIndex.containsKey(previewResult.previewHash)) {
        final existingIndex = _previewHashIndex[previewResult.previewHash]!;
        _items[existingIndex].addUse();
        return existingIndex;
      }

      final existingPathIndex = _items.indexWhere((i) => i.filePath == path);
      if (existingPathIndex != -1) return existingPathIndex;

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

      // Check if already cached
      if (_previewHashIndex.containsKey(previewResult.previewHash)) {
        final existingIndex = _previewHashIndex[previewResult.previewHash]!;
        _items[existingIndex].addUse();
        return existingIndex;
      }

      final existingPathIndex = _items.indexWhere((i) => i.filePath == path);
      if (existingPathIndex != -1) return existingPathIndex;

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


  Future<int> add(Object value) async {
    if (value is File) { // files are first compared by file path
      final path = value.path;

      // 1. Fast path check
      final existingPathIndex =
      _items.indexWhere((i) => i.filePath == path);
      if (existingPathIndex != -1) return existingPathIndex;

      // 2. Otherwise compute expensive content hash
      final bytes = await value.readAsBytes();
      final hash = calculateHash(bytes);

      final newItem = CacheItem(value, hash: hash, filePath: path);

      final existingHashIndex = _items.indexOf(newItem);
      if (existingHashIndex != -1) return existingHashIndex;

      _items.add(newItem);
      return _items.length - 1;
    } else if (value is FileImage) { // file images are first compared by file path
      final path = value.file.path;

      // 1. Fast path check
      final existingPathIndex =
      _items.indexWhere((i) => i.filePath == path);
      if (existingPathIndex != -1) return existingPathIndex;

      // 2. Otherwise compute expensive content hash
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
          'OrderedAssetCache.getBytes: unknown type ${item.runtimeType}');
    }
  }

  // finalize cache after it was filled using addSync - without calculation of hashes
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

  /// Vrátí reálný index (přes alias mapu)
  int resolveIndex(int index) {
    return _aliasMap[index] ?? index;
  }

  @override
  String toString() => _items.toString();
}
