import 'dart:convert';
import 'dart:io';

import 'package:flutter/painting.dart';

class AssetCache {
  AssetCache();

  final Map<String, Object> _cache = {};

  void add<T extends Object>(String key, T value) {
    _cache[key] = value;
  }

  /// Returns null if the key is not found.
  T? get<T extends Object>(String key) {
    return _cache[key] as T?;
  }

  /// Replaces [oldValue] with [newValue],
  /// or adds [newValue] if [oldValue] is not found.
  void replace<T extends Object, U extends Object>(T oldValue, U newValue) {
    final key = _cache.keys.firstWhere(
      (key) => _cache[key] == oldValue,
      orElse: () => '',
    );
    if (key.isNotEmpty) {
      _cache[key] = newValue;
    } else {
      add(key, newValue);
    }
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
