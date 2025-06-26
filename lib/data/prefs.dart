import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import 'package:nextcloud/provisioning_api.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/data/editor/pencil_sound.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/highlighter.dart';
import 'package:saber/data/tools/pen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stow/stow.dart';

typedef Quota = UserDetailsQuota;

/// If false, all stows are stuck at their default values.
bool _isOnMainIsolate = false;

final stows = Stows();

class Stows {
  Stows() {
    recentColorsLength.addListener(() {
      // truncate if needed
      while (recentColorsLength.value < recentColorsPositioned.value.length) {
        // remove oldest color
        final removed = recentColorsChronological.value.removeAt(0);
        recentColorsPositioned.value.remove(removed);
      }
    });
  }

  /// Call this before [runApp] to set [_isOnMainIsolate] to true.
  static void markAsOnMainIsolate() {
    _isOnMainIsolate = true;
  }

  final log = Logger('Stows');

  final customDataDir =
      PlainPref<String?>('customDataDir', null, autoRead: _isOnMainIsolate);

  final allowInsecureConnections =
      EncPref('allowInsecureConnections', false, autoRead: _isOnMainIsolate);
  final url = EncPref('url', '', autoRead: _isOnMainIsolate);
  final username = EncPref('username', '', autoRead: _isOnMainIsolate);

  /// the password used to login to Nextcloud
  final ncPassword = EncPref('ncPassword', '', autoRead: _isOnMainIsolate);
  // TODO(adil192): maybe deprecate?
  final ncPasswordIsAnAppPassword =
      PlainPref('ncPasswordIsAnAppPassword', false, autoRead: _isOnMainIsolate);

  /// the password used to encrypt/decrypt notes
  final encPassword = EncPref('encPassword', '', autoRead: _isOnMainIsolate);

  /// Whether the user is logged in and has provided both passwords.
  /// Please ensure that the relevant Prefs are loaded before using this.
  bool get loggedIn =>
      username.value.isNotEmpty &&
      ncPassword.value.isNotEmpty &&
      encPassword.value.isNotEmpty;

  final key = EncPref('key', '', autoRead: _isOnMainIsolate);
  final iv = EncPref('iv', '', autoRead: _isOnMainIsolate);

  final pfp = PlainPref<Uint8List?>('pfp', null, autoRead: _isOnMainIsolate);
  final syncInBackground =
      PlainPref('syncInBackground', true, autoRead: _isOnMainIsolate);

  final appTheme =
      PlainPref('appTheme', ThemeMode.system, autoRead: _isOnMainIsolate);

  /// The type of platform to theme. Default value is [defaultTargetPlatform].
  final platform =
      PlainPref('platform', defaultTargetPlatform, autoRead: _isOnMainIsolate);
  final layoutSize =
      PlainPref('layoutSize', LayoutSize.auto, autoRead: _isOnMainIsolate);

  /// The accent color of the app. If 0, the system accent color will be used.
  final accentColor =
      PlainPref<Color?>('accentColor', null, autoRead: _isOnMainIsolate);
  final hyperlegibleFont =
      PlainPref('hyperlegibleFont', false, autoRead: _isOnMainIsolate);

  final editorToolbarAlignment = PlainPref(
      'editorToolbarAlignment', AxisDirection.down,
      autoRead: _isOnMainIsolate);
  final editorToolbarShowInFullscreen = PlainPref(
      'editorToolbarShowInFullscreen', true,
      autoRead: _isOnMainIsolate);
  final editorFingerDrawing =
      PlainPref('editorFingerDrawing', true, autoRead: _isOnMainIsolate);
  final editorAutoInvert = PlainPref('editorAutoInvert', true,
      historicalKeys: const ['editorAutoDarken'], autoRead: _isOnMainIsolate);
  @Deprecated('Backgrounds are always opaque now. Use [true] instead.')
  final editorOpaqueBackgrounds = PlainPref('__editorOpaqueBackgrounds', true,
      deprecatedKeys: const ['editorOpaqueBackgrounds'],
      autoRead: _isOnMainIsolate);
  final preferGreyscale =
      PlainPref('preferGreyscale', false, autoRead: _isOnMainIsolate);
  @Deprecated(
      'Straight line detection now only happens with ShapePen (and happens immediately)')
  final editorStraightenDelay = PlainPref('__editorStraightenDelay', 500,
      deprecatedKeys: const ['editorStraightenDelay'],
      autoRead: _isOnMainIsolate);
  final editorPromptRename =
      PlainPref('editorPromptRename', isDesktop, autoRead: _isOnMainIsolate);
  final autosaveDelay =
      PlainPref('autosaveDelay', 10000, autoRead: _isOnMainIsolate);
  final shapeRecognitionDelay =
      PlainPref('shapeRecognitionDelay', 500, autoRead: _isOnMainIsolate);
  final autoStraightenLines =
      PlainPref('autoStraightenLines', true, autoRead: _isOnMainIsolate);
  final pencilSound = PlainPref(
      'pencilSound', PencilSoundSetting.onButNotInSilentMode,
      autoRead: _isOnMainIsolate);

  final simplifiedHomeLayout =
      PlainPref('simplifiedHomeLayout', false, autoRead: _isOnMainIsolate);
  final hideHomeBackgrounds =
      PlainPref('hideHomeBackgrounds', false, autoRead: _isOnMainIsolate);
  final printPageIndicators =
      PlainPref('printPageIndicators', false, autoRead: _isOnMainIsolate);

  final maxImageSize =
      PlainPref<double>('maxImageSize', 1000, autoRead: _isOnMainIsolate);

  final autoClearWhiteboardOnExit =
      PlainPref('autoClearWhiteboardOnExit', false, autoRead: _isOnMainIsolate);

  final disableEraserAfterUse =
      PlainPref('disableEraserAfterUse', false, autoRead: _isOnMainIsolate);
  final hideFingerDrawingToggle =
      PlainPref('hideFingerDrawingToggle', false, autoRead: _isOnMainIsolate);

  final recentColorsChronological = PlainPref(
      'recentColorsChronological', <String>[],
      autoRead: _isOnMainIsolate);
  final recentColorsPositioned = PlainPref('recentColorsPositioned', <String>[],
      historicalKeys: const ['recentColors'], autoRead: _isOnMainIsolate);
  final pinnedColors =
      PlainPref('pinnedColors', <String>[], autoRead: _isOnMainIsolate);
  final recentColorsDontSavePresets =
      PlainPref('dontSavePresetColors', false, autoRead: _isOnMainIsolate);
  final recentColorsLength =
      PlainPref('recentColorsLength', 5, autoRead: _isOnMainIsolate);

  final lastTool =
      PlainPref('lastTool', ToolId.fountainPen, autoRead: _isOnMainIsolate);
  final lastFountainPenOptions = PlainPref(
          'lastFountainPenProperties', Pen.fountainPenOptions,
          deprecatedKeys: const ['lastPenColor'], autoRead: _isOnMainIsolate),
      lastBallpointPenOptions = PlainPref(
          'lastBallpointPenProperties', Pen.ballpointPenOptions,
          autoRead: _isOnMainIsolate),
      lastHighlighterOptions = PlainPref(
          'lastHighlighterProperties', Pen.highlighterOptions,
          deprecatedKeys: const ['lastHighlighterColor'],
          autoRead: _isOnMainIsolate),
      lastPencilOptions = PlainPref('lastPencilProperties', Pen.pencilOptions,
          autoRead: _isOnMainIsolate),
      lastShapePenOptions = PlainPref(
          'lastShapePenProperties', Pen.shapePenOptions,
          autoRead: _isOnMainIsolate);
  final lastFountainPenColor = PlainPref(
          'lastFountainPenColor', Colors.black.toARGB32(),
          autoRead: _isOnMainIsolate),
      lastBallpointPenColor = PlainPref(
          'lastBallpointPenColor', Colors.black.toARGB32(),
          autoRead: _isOnMainIsolate),
      lastHighlighterColor = PlainPref('lastHighlighterColor',
          Colors.yellow.withAlpha(Highlighter.alpha).toARGB32(),
          autoRead: _isOnMainIsolate),
      lastPencilColor = PlainPref('lastPencilColor', Colors.black.toARGB32(),
          autoRead: _isOnMainIsolate),
      lastShapePenColor = PlainPref(
          'lastShapePenColor', Colors.black.toARGB32(),
          autoRead: _isOnMainIsolate);
  final lastBackgroundPattern = PlainPref(
      'lastBackgroundPattern', CanvasBackgroundPattern.none,
      autoRead: _isOnMainIsolate);
  static const defaultLineHeight = 40;
  static const defaultLineThickness = 3;
  final lastLineHeight = PlainPref('lastLineHeight', defaultLineHeight,
      autoRead: _isOnMainIsolate);
  final lastLineThickness = PlainPref('lastLineThickness', defaultLineThickness,
      autoRead: _isOnMainIsolate);
  final lastZoomLock =
          PlainPref('lastZoomLock', false, autoRead: _isOnMainIsolate),
      lastSingleFingerPanLock = PlainPref('lastSingleFingerPanLock', false,
          historicalKeys: const ['lastPanLock'], autoRead: _isOnMainIsolate),
      lastAxisAlignedPanLock = PlainPref('lastAxisAlignedPanLock', false,
          autoRead: _isOnMainIsolate);

  final recentFiles = PlainPref('recentFiles', <String>[],
      historicalKeys: const ['recentlyAccessed'], autoRead: _isOnMainIsolate);

  /// File paths that have been deleted locally
  final fileSyncAlreadyDeleted = PlainPref('fileSyncAlreadyDeleted', <String>{},
      autoRead: _isOnMainIsolate);

  /// File paths that are known to be corrupted on Nextcloud
  final fileSyncCorruptFiles =
      PlainPref('fileSyncCorruptFiles', <String>{}, autoRead: _isOnMainIsolate);

  /// Set when we want to resync everything.
  /// Files on the server older than this date will be
  /// reuploaded with the local version.
  /// By default, we resync everything uploaded before v0.18.4, since uploads before then resulted in 0B files.
  final fileSyncResyncEverythingDate = PlainPref('fileSyncResyncEverythingDate',
      DateTime.parse('2023-12-10T10:06:31.000Z'),
      autoRead: _isOnMainIsolate);

  /// The last storage quota that was fetched from Nextcloud
  final lastStorageQuota =
      PlainPref<Quota?>('lastStorageQuota', null, autoRead: _isOnMainIsolate);

  final shouldCheckForUpdates = PlainPref('shouldCheckForUpdates',
      FlavorConfig.shouldCheckForUpdatesByDefault && !Platform.isLinux,
      autoRead: _isOnMainIsolate);
  final shouldAlwaysAlertForUpdates = PlainPref('shouldAlwaysAlertForUpdates',
      (kDebugMode || FlavorConfig.dirty) ? true : false,
      deprecatedKeys: const ['updatesToIgnore'], autoRead: _isOnMainIsolate);

  final locale = PlainPref('locale', '', autoRead: _isOnMainIsolate);

  static bool get isDesktop =>
      Platform.isLinux || Platform.isWindows || Platform.isMacOS;
}

abstract class IPref<T> extends Stow<String, T, Object?> {
  /// The keys that were used in the past for this Pref. If one of these keys is found, the value will be migrated to the current key.
  @deprecated
  final List<String> historicalKeys = const [];

  /// The keys that were used in the past for a similar Pref. If one of these keys is found, it will be deleted.
  @deprecated
  final List<String> deprecatedKeys = const [];

  IPref(
    super.key,
    super.defaultValue, {
    @deprecated List<String>? historicalKeys,
    @deprecated List<String>? deprecatedKeys,
    super.codec,
    super.autoRead,
  });

  /// Removes the value from shared preferences, and resets the pref to its default value.
  @visibleForTesting
  @Deprecated('Just set the value to the default value instead')
  Future<void> delete() async {
    value = defaultValue;
    await waitUntilWritten();
  }

  @Deprecated('No alternative, use [waitUntilRead] if needed')
  bool get loaded => true;

  /// Whether this pref has changes that have yet to be saved to disk.
  @Deprecated('No alternative, use [waitUntilWritten] if needed')
  bool get saved => true;

  /// Waits until the value has been saved to disk.
  /// Note that there is no guarantee with shared preferences that
  /// the value will actually be saved to disk.
  @visibleForTesting
  @Deprecated('Use [waitUntilWritten] instead')
  Future<void> waitUntilSaved() => waitUntilWritten();
}

class PlainPref<T> extends IPref<T> {
  PlainPref(
    super.key,
    super.defaultValue, {
    super.historicalKeys,
    super.deprecatedKeys,
    super.codec,
    super.autoRead,
  }) {
    // Accepted types
    assert(T == bool ||
        T == int ||
        T == double ||
        T == String ||
        T == typeOf<String?>() ||
        T == typeOf<Uint8List?>() ||
        T == typeOf<List<String>>() ||
        T == typeOf<Set<String>>() ||
        T == typeOf<Queue<String>>() ||
        T == StrokeOptions ||
        T == typeOf<Quota?>() ||
        T == AxisDirection ||
        T == ThemeMode ||
        T == TargetPlatform ||
        T == LayoutSize ||
        T == ToolId ||
        T == CanvasBackgroundPattern ||
        T == DateTime ||
        T == PencilSoundSetting);
  }

  @override
  Future protectedWrite(T value) async {
    final prefs = await SharedPreferences.getInstance();

    if (T == bool) {
      return await prefs.setBool(key, value as bool);
    } else if (T == int) {
      return await prefs.setInt(key, value as int);
    } else if (T == double) {
      return await prefs.setDouble(key, value as double);
    } else if (T == typeOf<Uint8List?>()) {
      Uint8List? bytes = value as Uint8List?;
      if (bytes == null) {
        return await prefs.remove(key);
      } else {
        return await prefs.setString(key, base64Encode(bytes));
      }
    } else if (T == typeOf<List<String>>()) {
      return await prefs.setStringList(key, value as List<String>);
    } else if (T == typeOf<Set<String>>()) {
      return await prefs.setStringList(key, (value as Set<String>).toList());
    } else if (T == typeOf<Queue<String>>()) {
      return await prefs.setStringList(key, (value as Queue<String>).toList());
    } else if (T == StrokeOptions) {
      return await prefs.setString(key, jsonEncode(value));
    } else if (T == typeOf<Quota?>()) {
      Quota? quota = value as Quota?;
      if (quota == null) {
        return await prefs.remove(key);
      } else {
        return await prefs.setStringList(
            key, [quota.used.toString(), quota.total.toString()]);
      }
    } else if (T == AxisDirection) {
      return await prefs.setInt(key, (value as AxisDirection).index);
    } else if (T == ThemeMode) {
      return await prefs.setInt(key, (value as ThemeMode).index);
    } else if (T == TargetPlatform) {
      return await prefs.setInt(key, (value as TargetPlatform).index);
    } else if (T == LayoutSize) {
      return await prefs.setInt(key, (value as LayoutSize).index);
    } else if (T == ToolId) {
      return await prefs.setString(key, (value as ToolId).id);
    } else if (T == CanvasBackgroundPattern) {
      return await prefs.setString(
          key, (value as CanvasBackgroundPattern).name);
    } else if (T == DateTime) {
      final date = value as DateTime;
      if (date.millisecondsSinceEpoch == 0) {
        return await prefs.remove(key);
      } else {
        return await prefs.setString(key, date.toIso8601String());
      }
    } else if (T == PencilSoundSetting) {
      return await prefs.setInt(key, (value as PencilSoundSetting).index);
    } else {
      return await prefs.setString(key, value as String);
    }
  }

  @override
  Future<T> protectedRead() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey(key)) {
      return defaultValue;
    } else if (T == typeOf<Uint8List?>()) {
      String? base64 = prefs.getString(key);
      if (base64 == null) return defaultValue;
      return base64Decode(base64) as T;
    } else if (T == typeOf<List<String>>()) {
      return prefs.getStringList(key) as T? ?? defaultValue;
    } else if (T == typeOf<Set<String>>()) {
      return prefs.getStringList(key)?.toSet() as T? ?? defaultValue;
    } else if (T == typeOf<Queue<String>>()) {
      List? list = prefs.getStringList(key);
      return list != null ? Queue<String>.from(list) as T : defaultValue;
    } else if (T == StrokeOptions) {
      return StrokeOptions.fromJson(jsonDecode(prefs.getString(key)!)) as T;
    } else if (T == typeOf<Quota?>()) {
      List<String>? list = prefs.getStringList(key);
      if (list == null || list.length != 2) return defaultValue;
      int used = int.tryParse(list[0]) ?? 0;
      int total = int.tryParse(list[1]) ?? 1; // avoid division by zero
      return Quota.fromJson({
        'free': total - used,
        'used': used,
        'total': total,
        'relative': used / total * 100,
        'quota':
            total, // I don't know what this [quota] field is for, but I don't use it
      }) as T;
    } else if (T == AxisDirection) {
      final index = prefs.getInt(key);
      return index != null ? AxisDirection.values[index] as T : defaultValue;
    } else if (T == ThemeMode) {
      final index = prefs.getInt(key);
      return index != null ? ThemeMode.values[index] as T : defaultValue;
    } else if (T == TargetPlatform) {
      final index = prefs.getInt(key);
      if (index == null) return defaultValue;
      if (index == -1) return defaultTargetPlatform as T;
      return TargetPlatform.values[index] as T;
    } else if (T == LayoutSize) {
      final index = prefs.getInt(key);
      if (index == null) return defaultValue;
      return LayoutSize.values[index] as T;
    } else if (T == ToolId) {
      String id = prefs.getString(key)!;
      return ToolId.values.firstWhere((toolId) => toolId.id == id,
          orElse: () => defaultValue as ToolId) as T;
    } else if (T == CanvasBackgroundPattern) {
      String name = prefs.getString(key)!;
      return CanvasBackgroundPattern.values.firstWhere(
          (pattern) => pattern.name == name,
          orElse: () => defaultValue as CanvasBackgroundPattern) as T;
    } else if (T == DateTime) {
      String? iso8601 = prefs.getString(key);
      if (iso8601 == null) return defaultValue;
      return DateTime.parse(iso8601) as T;
    } else if (T == PencilSoundSetting) {
      final index = prefs.getInt(key);
      return index != null
          ? PencilSoundSetting.values[index] as T
          : defaultValue;
    } else {
      return prefs.get(key) as T;
    }
  }

  @override
  String toString() {
    return 'PlainPref<$T>($key, $value, $codec)';
  }
}

class EncPref<T> extends IPref<T> {
  FlutterSecureStorage? _storage;

  EncPref(
    super.key,
    super.defaultValue, {
    super.historicalKeys,
    super.deprecatedKeys,
    super.codec,
    super.autoRead,
  }) {
    assert(T == String || T == typeOf<List<String>>() || T == bool);
  }

  @override
  Future protectedWrite(T value) async {
    _storage ??= const FlutterSecureStorage();
    if (T == String)
      return await _storage!.write(key: key, value: value as String);
    if (T == bool)
      return await _storage!.write(key: key, value: jsonEncode(value));
    return await _storage!.write(key: key, value: jsonEncode(value));
  }

  @override
  Future<T> protectedRead() async {
    if (!_isOnMainIsolate) return defaultValue;

    try {
      final String? value = await _storage!.read(key: key);
      return _parseString(value) ?? defaultValue;
    } catch (e) {
      stows.log.severe('Error loading $key: $e', e);
      return defaultValue;
    }
  }

  T? _parseString(String? value) {
    if (value == null || value.isEmpty) return null;

    if (T == String) {
      return value as T;
    } else if (T == bool) {
      return jsonDecode(value) as T;
    } else {
      return List<String>.from(jsonDecode(value)) as T;
    }
  }

  @override
  Future<void> delete() async {
    if (!_isOnMainIsolate) return;

    _storage ??= const FlutterSecureStorage();
    await _storage!.delete(key: key);
  }

  @override
  String toString() {
    return 'EncPref<$T>($key, $value, $codec)';
  }
}

/// An [IPref] that transforms the value of another [IPref].
///
/// Only instantiate this once during the lifetime of the app
/// (e.g. in a static field) to avoid extraneous
/// listeners being added to the underlying [IPref].
class TransformedPref<T_in, T_out> extends IPref<T_out> {
  final Stow<dynamic, T_in, dynamic> pref;
  final T_out Function(T_in) transform;
  final T_in Function(T_out) reverseTransform;

  @override
  T_out get value => transform(pref.value);

  @override
  set value(T_out value) => pref.value = reverseTransform(value);

  TransformedPref(this.pref, this.transform, this.reverseTransform)
      : super(pref.key, transform(pref.defaultValue)) {
    pref.addListener(notifyListeners);
  }

  @override
  Future<T_out> protectedRead() async => defaultValue;

  @override
  Future<void> protectedWrite(T_out value) async {}

  @override
  String toString() {
    return 'TransformedPref<$T_in, $T_out>(from ${pref.key}, $value)';
  }
}

Type typeOf<T>() => T;
