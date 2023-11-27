import 'dart:convert';
import 'dart:io';

import 'package:flutter/painting.dart';
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

  /// Maps a file to its value.
  final Map<File, Object> _cache = {};
  /// Maps a file to the visible images that use it.
  final Map<File, Set<EditorImage>> _images = {};

  /// Marks [image] as currently visible.
  ///
  /// It's safe to call this method multiple times.
  void addImage<T extends Object>(EditorImage image, File file, T value) {
    _images.putIfAbsent(file, () => {}).add(image);
    _cache[file] = value;
  }

  /// Returns null if [file] is not found.
  T? get<T extends Object>(File file) {
    return _cache[file] as T?;
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
    for (final file in _images.keys) {
      if (_images[file]!.remove(image)) {
        _images.remove(file);
        _cache.remove(file);
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

  final List<Object> _cache = [];

  /// Adds [value] to the cache if it is not already present and
  /// returns the index of the added item.
  int add<T extends Object>(T value) {
    final index = _cache.indexOf(value);
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
      throw Exception('OrderedAssetCache.getBytes: unknown type ${item.runtimeType}');
    }
  }
}
