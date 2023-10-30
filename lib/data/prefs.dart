import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import 'package:nextcloud/provisioning_api.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/stroke_properties.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef Quota = UserDetailsQuota;

abstract class Prefs {
  static final log = Logger('Prefs');

  /// If true, the user's preferences will not be loaded and the default values will be used instead.
  /// The values will not be saved either.
  @visibleForTesting
  static bool testingMode = false;

  /// The current Android version.
  /// 
  /// If the user is on Android 9 or older, we can't use
  /// platform views (e.g. ads) performantly.
  /// 
  /// If the device is not an Android device, this will be 9999.
  static int androidVersion = 9999;

  /// If true, a warning will be printed if a pref is accessed before it is loaded.
  ///
  /// If [testingMode] is true, the warning will not be printed even if this is true.
  @visibleForTesting
  static bool warnIfPrefAccessedBeforeLoaded = true;

  static late final PlainPref<bool> disableAds;

  static late final EncPref<bool> allowInsecureConnections;
  static late final EncPref<String> url;
  static late final EncPref<String> username;
  /// the password used to login to Nextcloud
  static late final EncPref<String> ncPassword;
  /// the password used to encrypt/decrypt notes
  static late final EncPref<String> encPassword;

  static late final EncPref<String> key;
  static late final EncPref<String> iv;

  static late final PlainPref<Uint8List?> pfp;

  static late final PlainPref<ThemeMode> appTheme;
  /// The type of platform to theme. Default value is [defaultTargetPlatform].
  static late final PlainPref<TargetPlatform> platform;
  static late final PlainPref<LayoutSize> layoutSize;
  /// The accent color of the app. If 0, the system accent color will be used.
  static late final PlainPref<int> accentColor;
  static late final PlainPref<bool> hyperlegibleFont;

  static late final PlainPref<AxisDirection> editorToolbarAlignment;
  static late final PlainPref<bool> editorToolbarShowInFullscreen;
  static late final PlainPref<bool> editorFingerDrawing;
  static late final PlainPref<bool> editorAutoInvert;
  static late final PlainPref<bool> editorOpaqueBackgrounds;
  static late final PlainPref<bool> preferGreyscale;
  @Deprecated('Straight line detection now only happens with ShapePen (and happens immediately)')
  static late final PlainPref<int> editorStraightenDelay;
  static late final PlainPref<bool> editorPromptRename;
  static late final PlainPref<int> autosaveDelay;

  static late final PlainPref<bool> hideHomeBackgrounds;
  static late final PlainPref<bool> printPageIndicators;

  static late final PlainPref<double> maxImageSize;

  static late final PlainPref<bool> autoClearWhiteboardOnExit;

  static late final PlainPref<bool> disableEraserAfterUse;
  static late final PlainPref<bool> hideFingerDrawingToggle;

  static late final PlainPref<List<String>> recentColorsChronological;
  static late final PlainPref<List<String>> recentColorsPositioned;
  static late final PlainPref<List<String>> pinnedColors;
  static late final PlainPref<bool> recentColorsDontSavePresets;
  static late final PlainPref<int> recentColorsLength;

  static late final PlainPref<ToolId> lastTool;
  static late final PlainPref<StrokeProperties>
      lastFountainPenProperties,
      lastBallpointPenProperties,
      lastHighlighterProperties,
      lastShapePenProperties;
  static late final PlainPref<CanvasBackgroundPattern> lastBackgroundPattern;
  static late final PlainPref<int> lastLineHeight;
  static late final PlainPref<bool> lastZoomLock,
      lastSingleFingerPanLock,
      lastAxisAlignedPanLock;

  static late final PlainPref<bool> hasDraggedSizeIndicatorBefore;

  static late final PlainPref<List<String>> recentFiles;

  /// File paths that need to be uploaded to Nextcloud
  static late final PlainPref<Queue<String>> fileSyncUploadQueue;
  /// File paths that have been deleted locally
  static late final PlainPref<Set<String>> fileSyncAlreadyDeleted;
  /// File paths that are known to be corrupted on Nextcloud
  static late final PlainPref<Set<String>> fileSyncCorruptFiles;
  /// The last storage quota that was fetched from Nextcloud
  static late final PlainPref<Quota?> lastStorageQuota;

  static late final PlainPref<bool> shouldCheckForUpdates;
  static late final PlainPref<bool> shouldAlwaysAlertForUpdates;

  static late final PlainPref<String> locale;

  static void init() {
    final disableAdsDefault = androidVersion < 10;
    if (disableAdsDefault) {
      log.info('Disabling ads because Android version ($androidVersion) is < 10');
    }
    disableAds = PlainPref('disableAds', disableAdsDefault);

    allowInsecureConnections = EncPref('allowInsecureConnections', false);
    url = EncPref('url', '');
    username = EncPref('username', '');
    ncPassword = EncPref('ncPassword', '');
    encPassword = EncPref('encPassword', '');

    key = EncPref('key', '');
    iv = EncPref('iv', '');

    pfp = PlainPref('pfp', null);

    appTheme = PlainPref('appTheme', ThemeMode.system);
    platform = PlainPref('platform', defaultTargetPlatform);
    layoutSize = PlainPref('layoutSize', LayoutSize.auto);
    accentColor = PlainPref('accentColor', 0);
    hyperlegibleFont = PlainPref('hyperlegibleFont', false);

    editorToolbarAlignment = PlainPref('editorToolbarAlignment', AxisDirection.down);
    editorToolbarShowInFullscreen = PlainPref('editorToolbarShowInFullscreen', true);
    editorFingerDrawing = PlainPref('editorFingerDrawing', true);
    editorAutoInvert = PlainPref('editorAutoInvert', true, historicalKeys: const ['editorAutoDarken']);
    editorOpaqueBackgrounds = PlainPref('editorOpaqueBackgrounds', true);
    preferGreyscale = PlainPref('preferGreyscale', false);
    // ignore: deprecated_member_use_from_same_package
    editorStraightenDelay = PlainPref('__editorStraightenDelay', 500, deprecatedKeys: const ['editorStraightenDelay']);
    editorPromptRename = PlainPref('editorPromptRename', isDesktop);
    autosaveDelay = PlainPref('autosaveDelay', 10000);

    hideHomeBackgrounds = PlainPref('hideHomeBackgrounds', false);
    printPageIndicators = PlainPref('printPageIndicators', false);

    maxImageSize = PlainPref('maxImageSize', 1000);

    autoClearWhiteboardOnExit = PlainPref('autoClearWhiteboardOnExit', false);

    disableEraserAfterUse = PlainPref('disableEraserAfterUse', false);
    hideFingerDrawingToggle = PlainPref('hideFingerDrawingToggle', false);

    recentColorsChronological = PlainPref('recentColorsChronological', []);
    recentColorsPositioned = PlainPref('recentColorsPositioned', [], historicalKeys: const ['recentColors']);
    pinnedColors = PlainPref('pinnedColors', []);
    recentColorsDontSavePresets = PlainPref('dontSavePresetColors', false);
    recentColorsLength = PlainPref('recentColorsLength', 5)
        ..addListener(() {
          // truncate if needed
          while (recentColorsLength.value < recentColorsPositioned.value.length) {
            // remove oldest color
            final removed = recentColorsChronological.value.removeAt(0);
            recentColorsPositioned.value.remove(removed);
          }
        });

    lastTool = PlainPref('lastTool', ToolId.fountainPen);
    lastFountainPenProperties = PlainPref('lastFountainPenProperties', StrokeProperties.fountainPen, deprecatedKeys: const ['lastPenColor']);
    lastBallpointPenProperties = PlainPref('lastBallpointPenProperties', StrokeProperties.ballpointPen);
    lastHighlighterProperties = PlainPref('lastHighlighterProperties', StrokeProperties.highlighter, deprecatedKeys: const ['lastHighlighterColor']);
    lastShapePenProperties = PlainPref('lastShapePenProperties', StrokeProperties.shapePen);

    lastBackgroundPattern = PlainPref('lastBackgroundPattern', CanvasBackgroundPattern.none);
    lastLineHeight = PlainPref('lastLineHeight', 40);
    lastZoomLock = PlainPref('lastZoomLock', false);
    lastSingleFingerPanLock = PlainPref('lastSingleFingerPanLock', false, historicalKeys: const ['lastPanLock']);
    lastAxisAlignedPanLock = PlainPref('lastAxisAlignedPanLock', false);

    hasDraggedSizeIndicatorBefore = PlainPref('hasDraggedSizeIndicatorBefore', false);

    recentFiles = PlainPref('recentFiles', [], historicalKeys: const ['recentlyAccessed']);

    fileSyncUploadQueue = PlainPref('fileSyncUploadQueue', Queue<String>());
    fileSyncAlreadyDeleted = PlainPref('fileSyncAlreadyDeleted', {});
    fileSyncCorruptFiles = PlainPref('fileSyncCorruptFiles', {});
    lastStorageQuota = PlainPref('lastStorageQuota', null);

    shouldCheckForUpdates = PlainPref('shouldCheckForUpdates', FlavorConfig.shouldCheckForUpdatesByDefault && !Platform.isLinux);
    shouldAlwaysAlertForUpdates = PlainPref('shouldAlwaysAlertForUpdates', (kDebugMode || FlavorConfig.dirty) ? true : false, deprecatedKeys: const ['updatesToIgnore']);

    locale = PlainPref('locale', '');

    _migrateEmailToUsername();
  }

  static void _migrateEmailToUsername() async {
    await username.waitUntilLoaded();
    await ncPassword.waitUntilLoaded();

    if (!username.value.contains('@')) return;

    final client = NextcloudClientExtension.withSavedDetails();
    if (client == null) return;

    username.value = await client.getUsername();
  }

  static bool get isDesktop => Platform.isLinux || Platform.isWindows || Platform.isMacOS;
}

abstract class IPref<T> extends ValueNotifier<T> {
  final String key;
  /// The keys that were used in the past for this Pref. If one of these keys is found, the value will be migrated to the current key.
  final List<String> historicalKeys;
  /// The keys that were used in the past for a similar Pref. If one of these keys is found, it will be deleted.
  final List<String> deprecatedKeys;

  final T defaultValue;

  bool _loaded = false;

  /// Whether this pref has changes that have yet to be saved to disk.
  @protected
  bool _saved = true;

  IPref(this.key, this.defaultValue, {
    List<String>? historicalKeys,
    List<String>? deprecatedKeys,
  }) : historicalKeys = historicalKeys ?? [],
        deprecatedKeys = deprecatedKeys ?? [],
        super(defaultValue) {
    if (Prefs.testingMode) {
      _loaded = true;
      return;
    } else {
      _load().then((T? loadedValue) {
        _loaded = true;
        if (loadedValue != null) {
          value = loadedValue;
        }
        _afterLoad();
        addListener(_save);
      });
    }
  }

  Future<T?> _load();
  Future<void> _afterLoad();
  Future<void> _save();
  @protected
  Future<T?> getValueWithKey(String key);

  /// Removes the value from shared preferences, and resets the pref to its default value.
  @visibleForTesting
  Future<void> delete();

  @override
  T get value {
    if (!loaded && !Prefs.testingMode && Prefs.warnIfPrefAccessedBeforeLoaded) {
      Prefs.log.warning("Pref '$key' accessed before it was loaded.");
    }
    return super.value;
  }
  bool get loaded => _loaded;
  bool get saved => _saved;

  Future<void> waitUntilLoaded() async {
    while (!loaded) {
      await Future.delayed(const Duration(milliseconds: 10));
    }
  }

  /// Waits until the value has been saved to disk.
  /// Note that there is no guarantee with shared preferences that
  /// the value will actually be saved to disk.
  @visibleForTesting
  Future<void> waitUntilSaved() async {
    while (!saved) {
      await Future.delayed(const Duration(milliseconds: 10));
    }
  }

  /// Lets us use notifyListeners outside of the class
  /// as super.notifyListeners is @protected
  @override
  void notifyListeners() => super.notifyListeners();
}
class PlainPref<T> extends IPref<T> {
  SharedPreferences? _prefs;

  PlainPref(super.key, super.defaultValue, {super.historicalKeys, super.deprecatedKeys}) {
    // Accepted types
    assert(
      T == bool || T == int || T == double || T == String
        || T == typeOf<Uint8List?>()
        || T == typeOf<List<String>>() || T == typeOf<Set<String>>()
        || T == typeOf<Queue<String>>()
        || T == StrokeProperties || T == typeOf<Quota?>()
        || T == AxisDirection || T == ThemeMode || T == TargetPlatform
        || T == LayoutSize
        || T == ToolId || T == CanvasBackgroundPattern
    );
  }

  @override
  Future<T?> _load() async {
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
    _saved = false;
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
        return await _prefs!.setStringList(key, (value as Set<String>).toList());
      } else if (T == typeOf<Queue<String>>()) {
        return await _prefs!.setStringList(key, (value as Queue<String>).toList());
      } else if (T == StrokeProperties) {
        return await _prefs!.setString(key, jsonEncode(value));
      } else if (T == typeOf<Quota?>()) {
        Quota? quota = value as Quota?;
        if (quota == null) {
          return await _prefs!.remove(key);
        } else {
          return await _prefs!.setStringList(key, [quota.used.toString(), quota.total.toString()]);
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
        return await _prefs!.setString(key, (value as CanvasBackgroundPattern).name);
      } else {
        return await _prefs!.setString(key, value as String);
      }
    } finally {
      _saved = true;
    }
  }

  @override
  Future<T?> getValueWithKey(String key) async {
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
      } else if (T == StrokeProperties) {
        return StrokeProperties.fromJson(jsonDecode(_prefs!.getString(key)!)) as T?;
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
          'quota': total, // I don't know what this [quota] field is for, but I don't use it
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
            .firstWhere((toolId) => toolId?.id == id, orElse: () => null)
            as T?;
      } else if (T == CanvasBackgroundPattern) {
        String name = _prefs!.getString(key)!;
        return CanvasBackgroundPattern.values
            .cast<CanvasBackgroundPattern?>()
            .firstWhere((pattern) => pattern!.name == name, orElse: () => null)
            as T?;
      } else {
        return _prefs!.get(key) as T?;
      }
    } catch (e) {
      Prefs.log.severe('Error loading $key: $e', e);
      return null;
    }
  }

  @override
  Future<void> delete() async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs!.remove(key);
  }
}

class EncPref<T> extends IPref<T> {
  FlutterSecureStorage? _storage;

  EncPref(super.key, super.defaultValue, {super.historicalKeys, super.deprecatedKeys}) {
    assert(T == String || T == typeOf<List<String>>() || T == bool);
  }

  @override
  Future<T?> _load() async {
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
    _saved = false;
    try {
      _storage ??= const FlutterSecureStorage();
      if (T == String) return await _storage!.write(key: key, value: value as String);
      if (T == bool) return await _storage!.write(key: key, value: jsonEncode(value));
      return await _storage!.write(key: key, value: jsonEncode(value));
    } finally {
      _saved = true;
    }
  }

  @override
  Future<T?> getValueWithKey(String key) async {
    try {
      final String? value = await _storage!.read(key: key);
      return _parseString(value);
    } catch (e) {
      Prefs.log.severe('Error loading $key: $e', e);
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
