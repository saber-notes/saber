import 'dart:convert';
import 'dart:io';

import 'package:flutter/painting.dart';

/// A cache for assets that are loaded from disk.
/// 
/// This is the analogue to Flutter's image cache,
/// but for non-image assets.
/// 
/// There should be one instance of this class per
/// [EditorCoreInfo] instance.
class AssetCache {
  AssetCache();

  final Map<File, Object> _cache = {};

  void add<T extends Object>(File key, T value) {
    _cache[key] = value;
  }

  /// Returns null if the key is not found.
  T? get<T extends Object>(File key) {
    return _cache[key] as T?;
  }

  void dispose() {
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
