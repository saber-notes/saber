
import 'dart:convert';
import 'dart:io';

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/tools/stroke_properties.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Prefs {

  /// If true, the user's preferences will not be loaded and the default values will be used instead.
  /// The values will not be saved either.
  static bool testingMode = false;

  static late final EncPref<String> url;
  static late final EncPref<String> username;
  /// the password used to login to NextCloud
  static late final EncPref<String> ncPassword;
  /// the password used to encrypt/decrypt notes
  static late final EncPref<String> encPassword;

  static late final EncPref<String> key;
  static late final EncPref<String> iv;

  static late final PlainPref<String> pfp;

  static late final PlainPref<int> appTheme;
  /// The accent color of the app. If 0, the system accent color will be used.
  static late final PlainPref<int> accentColor;
  static late final PlainPref<bool> hyperlegibleFont;

  static late final PlainPref<bool> editorToolbarOnBottom;
  static late final PlainPref<bool> editorToolbarShowInFullscreen;
  static late final PlainPref<bool> editorFingerDrawing;
  static late final PlainPref<bool> editorAutoInvert;
  static late final PlainPref<bool> preferGreyscale;
  static late final PlainPref<int> editorStraightenDelay;
  static late final PlainPref<bool> editorPromptRename;

  static late final PlainPref<bool> autoClearWhiteboardOnExit;

  static late final PlainPref<List<String>> recentColorsChronological;
  static late final PlainPref<List<String>> recentColorsPositioned;

  static late final PlainPref<StrokeProperties>
      lastFountainPenProperties,
      lastBallpointPenProperties,
      lastHighlighterProperties;
  static late final PlainPref<String> lastBackgroundPattern;
  static late final PlainPref<int> lastLineHeight;

  static late final PlainPref<bool> hasDraggedSizeIndicatorBefore;

  static late final PlainPref<List<String>> recentFiles;

  /// File paths that need to be uploaded to Nextcloud
  static late final PlainPref<List<String>> fileSyncUploadQueue;

  static late final PlainPref<bool> shouldCheckForUpdates;

  static void init() {
    url = EncPref("url", "");
    username = EncPref("username", "");
    ncPassword = EncPref("ncPassword", "");
    encPassword = EncPref("encPassword", "");

    key = EncPref("key", "");
    iv = EncPref("iv", "");

    pfp = PlainPref("pfp", "");

    appTheme = PlainPref("appTheme", ThemeMode.system.index);
    accentColor = PlainPref("accentColor", 0);
    hyperlegibleFont = PlainPref("hyperlegibleFont", false);

    editorToolbarOnBottom = PlainPref("editorToolbarOnBottom", true);
    editorToolbarShowInFullscreen = PlainPref("editorToolbarShowInFullscreen", true);
    editorFingerDrawing = PlainPref("editorFingerDrawing", true);
    editorAutoInvert = PlainPref("editorAutoInvert", true, historicalKeys: ["editorAutoDarken"]);
    preferGreyscale = PlainPref("preferGreyscale", false);
    editorStraightenDelay = PlainPref("editorStraightenDelay", 500);
    editorPromptRename = PlainPref("editorPromptRename", isDesktop);

    autoClearWhiteboardOnExit = PlainPref("autoClearWhiteboardOnExit", false);

    recentColorsChronological = PlainPref("recentColorsChronological", []);
    recentColorsPositioned = PlainPref("recentColorsPositioned", [], historicalKeys: ["recentColors"]);

    lastFountainPenProperties = PlainPref("lastFountainPenProperties", StrokeProperties.fountainPen, deprecatedKeys: ["lastPenColor"]);
    lastBallpointPenProperties = PlainPref("lastBallpointPenProperties", StrokeProperties.ballpointPen);
    lastHighlighterProperties = PlainPref("lastHighlighterProperties", StrokeProperties.highlighter, deprecatedKeys: ["lastHighlighterColor"]);

    lastBackgroundPattern = PlainPref("lastBackgroundPattern", CanvasBackgroundPatterns.none);
    lastLineHeight = PlainPref("lastLineHeight", 40);

    hasDraggedSizeIndicatorBefore = PlainPref("hasDraggedSizeIndicatorBefore", false);

    recentFiles = PlainPref("recentFiles", [], historicalKeys: ["recentlyAccessed"]);

    fileSyncUploadQueue = PlainPref("fileSyncUploadQueue", []);

    shouldCheckForUpdates = PlainPref("shouldCheckForUpdates", FlavorConfig.shouldCheckForUpdatesByDefault && !kIsWeb);

    _migrateEmailToUsername();
  }

  static void _migrateEmailToUsername() async {
    await username.waitUntilLoaded();
    await ncPassword.waitUntilLoaded();

    if (!username.value.contains("@")) return;

    final client = await NextcloudClientExtension.withSavedDetails();
    if (client == null) return;

    username.value = await client.getUsername();
  }

  static bool get isDesktop => !kIsWeb && (Platform.isLinux || Platform.isWindows || Platform.isMacOS);

}

abstract class IPref<T> extends ValueNotifier<T> {
  final String key;
  /// The keys that were used in the past for this Pref. If one of these keys is found, the value will be migrated to the current key.
  final List<String> historicalKeys;
  /// The keys that were used in the past for a similar Pref. If one of these keys is found, it will be deleted.
  final List<String> deprecatedKeys;

  bool _loaded = false;

  IPref(this.key, T defaultValue, {
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

  @override
  get value {
    if (!loaded) {
      if (kDebugMode) print("WARNING: Pref '$key' accessed before it was loaded.");
    }
    return super.value;
  }
  get loaded => _loaded;

  Future<void> waitUntilLoaded() async {
    while (!loaded) {
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
    assert(T == bool || T == int || T == double || T == typeOf<List<String>>() || T == String
        || T == StrokeProperties);
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
  _afterLoad() async {
    _prefs = null;
  }

  @override
  Future _save() async {
    _prefs ??= await SharedPreferences.getInstance();

    if (T == bool) {
      return await _prefs!.setBool(key, value as bool);
    } else if (T == int) {
      return await _prefs!.setInt(key, value as int);
    } else if (T == double) {
      return await _prefs!.setDouble(key, value as double);
    } else if (T == typeOf<List<String>>()) {
      return await _prefs!.setStringList(key, value as List<String>);
    } else if (T == StrokeProperties) {
      return await _prefs!.setString(key, jsonEncode(value));
    } else {
      return await _prefs!.setString(key, value as String);
    }
  }

  @override
  Future<T?> getValueWithKey(String key) async {
    try {
      if (!_prefs!.containsKey(key)) {
        return null;
      } else if (T == typeOf<List<String>>()) {
        return _prefs!.getStringList(key) as T?;
      } else if (T == StrokeProperties) {
        return StrokeProperties.fromJson(jsonDecode(_prefs!.getString(key)!)) as T?;
      } else {
        return _prefs!.get(key) as T?;
      }
    } catch (e) {
      if (kDebugMode) print("Error loading $key: $e");
      return null;
    }
  }
}

class EncPref<T> extends IPref<T> {
  FlutterSecureStorage? _storage;

  EncPref(super.key, super.defaultValue, {super.historicalKeys, super.deprecatedKeys}) {
    assert(T == String || T == typeOf<List<String>>());
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

    // try to load from EncryptedSharedPreferences (deprecated)
    try {
      final prefs = EncryptedSharedPreferences();
      for (String key in [key, ...historicalKeys]) {
        currentValue = _parseString(await prefs.getString(key));

        // migrate to new key
        prefs.remove(key);
        await _save();

        return currentValue;
      }
      for (String key in deprecatedKeys) {
        try {
          prefs.remove(key);
        } catch (e) {
          // ignore
        }
      }
    } catch (e) {
      if (kDebugMode) rethrow;
    }

    return null;
  }
  @override
  _afterLoad() async {
    _storage = null;
  }

  @override
  Future _save() async {
    _storage ??= const FlutterSecureStorage();

    if (T == String) return await _storage!.write(key: key, value: value as String);
    return await _storage!.write(key: key, value: jsonEncode(value));
  }

  @override
  Future<T?> getValueWithKey(String key) async {
    try {
      final value = await _storage!.read(key: key);
      return _parseString(value);
    } catch (e) {
      if (kDebugMode) print("Error loading $key: $e");
      return null;
    }
  }

  T? _parseString(String? value) {
    if (value == null || value.isEmpty) return null;

    if (T == String) {
      return value as T;
    } else {
      return List<String>.from(jsonDecode(value)) as T;
    }
  }
}

Type typeOf<T>() => T;
