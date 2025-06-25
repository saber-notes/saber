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

  final customDataDir = PlainPref<String?>('customDataDir', null);

  final allowInsecureConnections = EncPref('allowInsecureConnections', false);
  final url = EncPref('url', '');
  final username = EncPref('username', '');

  /// the password used to login to Nextcloud
  final ncPassword = EncPref('ncPassword', '');
  // TODO(adil192): maybe deprecate?
  final ncPasswordIsAnAppPassword =
      PlainPref('ncPasswordIsAnAppPassword', false);

  /// the password used to encrypt/decrypt notes
  final encPassword = EncPref('encPassword', '');

  /// Whether the user is logged in and has provided both passwords.
  /// Please ensure that the relevant Prefs are loaded before using this.
  bool get loggedIn =>
      (url.loaded || !_isOnMainIsolate) &&
      username.value.isNotEmpty &&
      ncPassword.value.isNotEmpty &&
      encPassword.value.isNotEmpty;

  final key = EncPref('key', '');
  final iv = EncPref('iv', '');

  final pfp = PlainPref<Uint8List?>('pfp', null);
  final syncInBackground = PlainPref('syncInBackground', true);

  final appTheme = PlainPref('appTheme', ThemeMode.system);

  /// The type of platform to theme. Default value is [defaultTargetPlatform].
  final platform = PlainPref('platform', defaultTargetPlatform);
  final layoutSize = PlainPref('layoutSize', LayoutSize.auto);

  /// The accent color of the app. If 0, the system accent color will be used.
  final accentColor = PlainPref('accentColor', 0);
  final hyperlegibleFont = PlainPref('hyperlegibleFont', false);

  final editorToolbarAlignment =
      PlainPref('editorToolbarAlignment', AxisDirection.down);
  final editorToolbarShowInFullscreen =
      PlainPref('editorToolbarShowInFullscreen', true);
  final editorFingerDrawing = PlainPref('editorFingerDrawing', true);
  final editorAutoInvert = PlainPref('editorAutoInvert', true,
      historicalKeys: const ['editorAutoDarken']);
  @Deprecated('Backgrounds are always opaque now. Use [true] instead.')
  final editorOpaqueBackgrounds = PlainPref('__editorOpaqueBackgrounds', true,
      deprecatedKeys: const ['editorOpaqueBackgrounds']);
  final preferGreyscale = PlainPref('preferGreyscale', false);
  @Deprecated(
      'Straight line detection now only happens with ShapePen (and happens immediately)')
  final editorStraightenDelay = PlainPref('__editorStraightenDelay', 500,
      deprecatedKeys: const ['editorStraightenDelay']);
  final editorPromptRename = PlainPref('editorPromptRename', isDesktop);
  final autosaveDelay = PlainPref('autosaveDelay', 10000);
  final shapeRecognitionDelay = PlainPref('shapeRecognitionDelay', 500);
  final autoStraightenLines = PlainPref('autoStraightenLines', true);
  final pencilSound =
      PlainPref('pencilSound', PencilSoundSetting.onButNotInSilentMode);

  final simplifiedHomeLayout = PlainPref('simplifiedHomeLayout', false);
  final hideHomeBackgrounds = PlainPref('hideHomeBackgrounds', false);
  final printPageIndicators = PlainPref('printPageIndicators', false);

  final maxImageSize = PlainPref<double>('maxImageSize', 1000);

  final autoClearWhiteboardOnExit =
      PlainPref('autoClearWhiteboardOnExit', false);

  final disableEraserAfterUse = PlainPref('disableEraserAfterUse', false);
  final hideFingerDrawingToggle = PlainPref('hideFingerDrawingToggle', false);

  final recentColorsChronological =
      PlainPref('recentColorsChronological', <String>[]);
  final recentColorsPositioned = PlainPref('recentColorsPositioned', <String>[],
      historicalKeys: const ['recentColors']);
  final pinnedColors = PlainPref('pinnedColors', <String>[]);
  final recentColorsDontSavePresets = PlainPref('dontSavePresetColors', false);
  final recentColorsLength = PlainPref('recentColorsLength', 5);

  final lastTool = PlainPref('lastTool', ToolId.fountainPen);
  final lastFountainPenOptions = PlainPref(
          'lastFountainPenProperties', Pen.fountainPenOptions,
          deprecatedKeys: const ['lastPenColor']),
      lastBallpointPenOptions =
          PlainPref('lastBallpointPenProperties', Pen.ballpointPenOptions),
      lastHighlighterOptions = PlainPref(
          'lastHighlighterProperties', Pen.highlighterOptions,
          deprecatedKeys: const ['lastHighlighterColor']),
      lastPencilOptions = PlainPref('lastPencilProperties', Pen.pencilOptions),
      lastShapePenOptions =
          PlainPref('lastShapePenProperties', Pen.shapePenOptions);
  final lastFountainPenColor =
          PlainPref('lastFountainPenColor', Colors.black.toARGB32()),
      lastBallpointPenColor =
          PlainPref('lastBallpointPenColor', Colors.black.toARGB32()),
      lastHighlighterColor = PlainPref('lastHighlighterColor',
          Colors.yellow.withAlpha(Highlighter.alpha).toARGB32()),
      lastPencilColor = PlainPref('lastPencilColor', Colors.black.toARGB32()),
      lastShapePenColor =
          PlainPref('lastShapePenColor', Colors.black.toARGB32());
  final lastBackgroundPattern =
      PlainPref('lastBackgroundPattern', CanvasBackgroundPattern.none);
  static const defaultLineHeight = 40;
  static const defaultLineThickness = 3;
  final lastLineHeight = PlainPref('lastLineHeight', defaultLineHeight);
  final lastLineThickness =
      PlainPref('lastLineThickness', defaultLineThickness);
  final lastZoomLock = PlainPref('lastZoomLock', false),
      lastSingleFingerPanLock = PlainPref('lastSingleFingerPanLock', false,
          historicalKeys: const ['lastPanLock']),
      lastAxisAlignedPanLock = PlainPref('lastAxisAlignedPanLock', false);

  final recentFiles = PlainPref('recentFiles', <String>[],
      historicalKeys: const ['recentlyAccessed']);

  /// File paths that have been deleted locally
  final fileSyncAlreadyDeleted =
      PlainPref('fileSyncAlreadyDeleted', <String>{});

  /// File paths that are known to be corrupted on Nextcloud
  final fileSyncCorruptFiles = PlainPref('fileSyncCorruptFiles', <String>{});

  /// Set when we want to resync everything.
  /// Files on the server older than this date will be
  /// reuploaded with the local version.
  /// By default, we resync everything uploaded before v0.18.4, since uploads before then resulted in 0B files.
  final fileSyncResyncEverythingDate = PlainPref('fileSyncResyncEverythingDate',
      DateTime.parse('2023-12-10T10:06:31.000Z'));

  /// The last storage quota that was fetched from Nextcloud
  final lastStorageQuota = PlainPref<Quota?>('lastStorageQuota', null);

  final shouldCheckForUpdates = PlainPref('shouldCheckForUpdates',
      FlavorConfig.shouldCheckForUpdatesByDefault && !Platform.isLinux);
  final shouldAlwaysAlertForUpdates = PlainPref('shouldAlwaysAlertForUpdates',
      (kDebugMode || FlavorConfig.dirty) ? true : false,
      deprecatedKeys: const ['updatesToIgnore']);

  final locale = PlainPref('locale', '');

  static bool get isDesktop =>
      Platform.isLinux || Platform.isWindows || Platform.isMacOS;
}

abstract class IPref<T> extends ValueNotifier<T> {
  final String key;

  /// The keys that were used in the past for this Pref. If one of these keys is found, the value will be migrated to the current key.
  final List<String> historicalKeys;

  /// The keys that were used in the past for a similar Pref. If one of these keys is found, it will be deleted.
  final List<String> deprecatedKeys;

  final T defaultValue;

  IPref(
    this.key,
    this.defaultValue, {
    List<String>? historicalKeys,
    List<String>? deprecatedKeys,
  })  : historicalKeys = historicalKeys ?? [],
        deprecatedKeys = deprecatedKeys ?? [],
        super(defaultValue) {
    _load().then((T? loadedValue) {
      loaded = true;
      if (loadedValue != null) {
        value = loadedValue;
      }
      _afterLoad();
      addListener(_save);
    });
  }

  Future<T?> _load();
  Future<void> _afterLoad();
  Future<void> _save();
  @protected
  Future<T?> getValueWithKey(String key);

  /// Removes the value from shared preferences, and resets the pref to its default value.
  @visibleForTesting
  Future<void> delete();

  bool _loaded = false;
  Completer<void>? _loadedCompleter = Completer();
  bool get loaded => _loaded;
  @protected
  set loaded(bool loaded) {
    _loaded = loaded;

    if (loaded) {
      if (!_loadedCompleter!.isCompleted) _loadedCompleter!.complete();
      _loadedCompleter = null;
    }
  }

  final _saved = ValueNotifier<bool>(true);

  /// Whether this pref has changes that have yet to be saved to disk.
  bool get saved => _saved.value;
  @protected
  set saved(bool saved) {
    _saved.value = saved;
  }

  Future<void> waitUntilLoaded() async {
    if (loaded) return;
    assert(_loadedCompleter != null,
        '_loadedCompleter should be non-null until loaded');
    return _loadedCompleter!.future;
  }

  /// Waits until the value has been saved to disk.
  /// Note that there is no guarantee with shared preferences that
  /// the value will actually be saved to disk.
  @visibleForTesting
  Future<void> waitUntilSaved() async {
    if (saved) return;

    final completer = Completer();

    void listener() {
      if (!saved) return;
      _saved.removeListener(listener);
      completer.complete();
    }

    _saved.addListener(listener);
    return completer.future;
  }

  /// Lets us use notifyListeners outside of the class
  /// as super.notifyListeners is @protected
  @override
  void notifyListeners() => super.notifyListeners();
}

class PlainPref<T> extends IPref<T> {
  SharedPreferences? _prefs;

  PlainPref(super.key, super.defaultValue,
      {super.historicalKeys, super.deprecatedKeys}) {
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
  Future<T?> _load() async {
    if (!_isOnMainIsolate) return null;

    _prefs ??= await SharedPreferences.getInstance();

    T? currentValue = await getValueWithKey(key);
    if (currentValue != null) return currentValue;

    for (String historicalKey in historicalKeys) {
      currentValue = await getValueWithKey(historicalKey);
      if (currentValue == null) continue;

      // migrate to new key
      await _save();
      _prefs!.remove(historicalKey);

      return currentValue;
    }

    for (String deprecatedKey in deprecatedKeys) {
      _prefs!.remove(deprecatedKey);
    }

    return null;
  }

  @override
  Future<void> _afterLoad() async {
    _prefs = null;
  }

  @override
  Future _save() async {
    if (!_isOnMainIsolate) return null;

    saved = false;
    try {
      _prefs ??= await SharedPreferences.getInstance();

      if (T == bool) {
        return await _prefs!.setBool(key, value as bool);
      } else if (T == int) {
        return await _prefs!.setInt(key, value as int);
      } else if (T == double) {
        return await _prefs!.setDouble(key, value as double);
      } else if (T == typeOf<Uint8List?>()) {
        Uint8List? bytes = value as Uint8List?;
        if (bytes == null) {
          return await _prefs!.remove(key);
        } else {
          return await _prefs!.setString(key, base64Encode(bytes));
        }
      } else if (T == typeOf<List<String>>()) {
        return await _prefs!.setStringList(key, value as List<String>);
      } else if (T == typeOf<Set<String>>()) {
        return await _prefs!
            .setStringList(key, (value as Set<String>).toList());
      } else if (T == typeOf<Queue<String>>()) {
        return await _prefs!
            .setStringList(key, (value as Queue<String>).toList());
      } else if (T == StrokeOptions) {
        return await _prefs!.setString(key, jsonEncode(value));
      } else if (T == typeOf<Quota?>()) {
        Quota? quota = value as Quota?;
        if (quota == null) {
          return await _prefs!.remove(key);
        } else {
          return await _prefs!.setStringList(
              key, [quota.used.toString(), quota.total.toString()]);
        }
      } else if (T == AxisDirection) {
        return await _prefs!.setInt(key, (value as AxisDirection).index);
      } else if (T == ThemeMode) {
        return await _prefs!.setInt(key, (value as ThemeMode).index);
      } else if (T == TargetPlatform) {
        return await _prefs!.setInt(key, (value as TargetPlatform).index);
      } else if (T == LayoutSize) {
        return await _prefs!.setInt(key, (value as LayoutSize).index);
      } else if (T == ToolId) {
        return await _prefs!.setString(key, (value as ToolId).id);
      } else if (T == CanvasBackgroundPattern) {
        return await _prefs!
            .setString(key, (value as CanvasBackgroundPattern).name);
      } else if (T == DateTime) {
        final date = value as DateTime;
        if (date.millisecondsSinceEpoch == 0) {
          return await _prefs!.remove(key);
        } else {
          return await _prefs!.setString(key, date.toIso8601String());
        }
      } else if (T == PencilSoundSetting) {
        return await _prefs!.setInt(key, (value as PencilSoundSetting).index);
      } else {
        return await _prefs!.setString(key, value as String);
      }
    } finally {
      saved = true;
    }
  }

  @override
  Future<T?> getValueWithKey(String key) async {
    if (!_isOnMainIsolate) return null;

    try {
      if (!_prefs!.containsKey(key)) {
        return null;
      } else if (T == typeOf<Uint8List?>()) {
        String? base64 = _prefs!.getString(key);
        if (base64 == null) return null;
        return base64Decode(base64) as T;
      } else if (T == typeOf<List<String>>()) {
        return _prefs!.getStringList(key) as T?;
      } else if (T == typeOf<Set<String>>()) {
        return _prefs!.getStringList(key)?.toSet() as T?;
      } else if (T == typeOf<Queue<String>>()) {
        List? list = _prefs!.getStringList(key);
        return list != null ? Queue<String>.from(list) as T : null;
      } else if (T == StrokeOptions) {
        return StrokeOptions.fromJson(jsonDecode(_prefs!.getString(key)!))
            as T?;
      } else if (T == typeOf<Quota?>()) {
        List<String>? list = _prefs!.getStringList(key);
        if (list == null || list.length != 2) return null;
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
        final index = _prefs!.getInt(key);
        return index != null ? AxisDirection.values[index] as T? : null;
      } else if (T == ThemeMode) {
        final index = _prefs!.getInt(key);
        return index != null ? ThemeMode.values[index] as T? : null;
      } else if (T == TargetPlatform) {
        final index = _prefs!.getInt(key);
        if (index == null) return null;
        if (index == -1) return defaultTargetPlatform as T?;
        return TargetPlatform.values[index] as T?;
      } else if (T == LayoutSize) {
        final index = _prefs!.getInt(key);
        if (index == null) return null;
        return LayoutSize.values[index] as T?;
      } else if (T == ToolId) {
        String id = _prefs!.getString(key)!;
        return ToolId.values
            .cast<ToolId?>()
            .firstWhere((toolId) => toolId?.id == id, orElse: () => null) as T?;
      } else if (T == CanvasBackgroundPattern) {
        String name = _prefs!.getString(key)!;
        return CanvasBackgroundPattern.values
            .cast<CanvasBackgroundPattern?>()
            .firstWhere((pattern) => pattern!.name == name,
                orElse: () => null) as T?;
      } else if (T == DateTime) {
        String? iso8601 = _prefs!.getString(key);
        if (iso8601 == null) return null;
        return DateTime.parse(iso8601) as T;
      } else if (T == PencilSoundSetting) {
        final index = _prefs!.getInt(key);
        return index != null ? PencilSoundSetting.values[index] as T? : null;
      } else {
        return _prefs!.get(key) as T?;
      }
    } catch (e) {
      stows.log.severe('Error loading $key: $e', e);
      return null;
    }
  }

  @override
  Future<void> delete() async {
    if (!_isOnMainIsolate) return;

    _prefs ??= await SharedPreferences.getInstance();
    await _prefs!.remove(key);
  }
}

class EncPref<T> extends IPref<T> {
  FlutterSecureStorage? _storage;

  EncPref(super.key, super.defaultValue,
      {super.historicalKeys, super.deprecatedKeys}) {
    assert(T == String || T == typeOf<List<String>>() || T == bool);
  }

  @override
  Future<T?> _load() async {
    if (!_isOnMainIsolate) return null;

    _storage ??= const FlutterSecureStorage();

    T? currentValue = await getValueWithKey(key);
    if (currentValue != null) return currentValue;

    for (String key in historicalKeys) {
      currentValue = await getValueWithKey(key);
      if (currentValue == null) continue;

      // migrate to new key
      await _save();
      _storage!.delete(key: key);

      return currentValue;
    }

    for (String key in deprecatedKeys) {
      _storage!.delete(key: key);
    }

    return null;
  }

  @override
  Future<void> _afterLoad() async {
    _storage = null;
  }

  @override
  Future _save() async {
    if (!_isOnMainIsolate) return null;

    saved = false;
    try {
      _storage ??= const FlutterSecureStorage();
      if (T == String)
        return await _storage!.write(key: key, value: value as String);
      if (T == bool)
        return await _storage!.write(key: key, value: jsonEncode(value));
      return await _storage!.write(key: key, value: jsonEncode(value));
    } finally {
      saved = true;
    }
  }

  @override
  Future<T?> getValueWithKey(String key) async {
    if (!_isOnMainIsolate) return null;

    try {
      final String? value = await _storage!.read(key: key);
      return _parseString(value);
    } catch (e) {
      stows.log.severe('Error loading $key: $e', e);
      return null;
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
}

/// An [IPref] that transforms the value of another [IPref].
///
/// Only instantiate this once during the lifetime of the app
/// (e.g. in a static field) to avoid extraneous
/// listeners being added to the underlying [IPref].
class TransformedPref<T_in, T_out> extends IPref<T_out> {
  final IPref<T_in> pref;
  final T_out Function(T_in) transform;
  final T_in Function(T_out) reverseTransform;

  @override
  T_out get value => transform(pref.value);

  @override
  set value(T_out value) => pref.value = reverseTransform(value);

  @override
  bool get loaded => pref.loaded;

  @override
  bool get saved => pref.saved;

  TransformedPref(this.pref, this.transform, this.reverseTransform)
      : super(pref.key, transform(pref.defaultValue)) {
    pref.addListener(notifyListeners);
  }

  @override
  Future<void> _afterLoad() async {}

  @override
  Future<T_out?> _load() async => null;

  @override
  Future<void> _save() async {}

  @override
  Future<void> delete() async {}

  @override
  Future<T_out?> getValueWithKey(String key) async => null;
}

Type typeOf<T>() => T;
