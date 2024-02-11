import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/painting.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:logging/logging.dart';

/// A cache for assets that are loaded from disk.
///
/// This is the analogue to Flutter's image cache,
/// but for non-image assets.
///
/// There should be one instance of this class per
/// [EditorCoreInfo] instance.
class AssetCache {
  AssetCache();
  static final log = Logger('AssetCache');
  /// Maps a file to its value.
  final Map<String, Object> _cache = {};

  /// Maps a file to the visible images that use it.
  final Map<String, Set<EditorImage>> _images = {};

  bool EnabledRemove=true;  // if EnabledRemove then items from cache can be removed. During File save is set to false
  bool get GetEnabledRemove=>EnabledRemove;

  set SetEnabledRemove(bool EnabledRemoveIn){
    EnabledRemove=EnabledRemoveIn;
  }


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
    if (!EnabledRemove){
      // removing from cache is disabled, probably saving to file and cannot manipulate cache
      return false;
    }
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
  static final log = Logger('OrderedAssetCache');

  final List<Object> _cache = [];

  Function eq = const ListEquality().equals;  // compares Lists for equality. Used in add

  /// Adds [value] to the cache if it is not already present and
  /// returns the index of the added item.
  int add<T extends Object>(T value) {
    int index = _cache.indexOf(value);
    log.info('Index in OrederdAssetCache is ${index} of file ${value}');
    if (index==-1){
      if (value is List<int>) {
        // sometimes are lists compared as different but are the same. This is second check
        for (int i=0;i<_cache.length;i++) {
          Object x = _cache[i];
          if (x is List<int>) {
            // compare lists manually
            if (eq(value,x)){
              log.info('Value is the same as cache index ${i}');
              index=i;
              break;
            }
          }
        }
      }
    }
    if (index == -1) {
      _cache.add(value);
      log.info('File ${value} was added to OrederdAssetCache as ${_cache.length-1}');
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
