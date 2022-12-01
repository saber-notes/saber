
import 'dart:convert';

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Prefs {

  /// If true, the user's preferences will not be loaded and the default values will be used instead.
  /// The values will not be saved either.
  static bool testingMode = false;

  static late EncPref<String> url;
  static late EncPref<String> username;
  /// the password used to login to NextCloud
  static late EncPref<String> ncPassword;
  /// the password used to encrypt/decrypt notes
  static late EncPref<String> encPassword;

  static late EncPref<String> key;
  static late EncPref<String> iv;

  static late PlainPref<String> pfp;

  static late PlainPref<int> appTheme;
  /// The accent color of the app. If 0, the system accent color will be used.
  static late PlainPref<int> accentColor;
  static late PlainPref<bool> hyperlegibleFont;

  static late PlainPref<bool> editorToolbarOnBottom;
  static late PlainPref<bool> editorFingerDrawing;
  static late PlainPref<bool> editorAutoInvert;
  static late PlainPref<bool> preferGreyscale;
  static late PlainPref<int> editorStraightenDelay;

  static late PlainPref<List<String>> recentColorsChronological;
  static late PlainPref<List<String>> recentColorsPositioned;

  static late PlainPref<int> lastPenColor;
  static late PlainPref<int> lastHighlighterColor;
  static late PlainPref<String> lastBackgroundPattern;
  static late PlainPref<int> lastLineHeight;

  static late PlainPref<List<String>> recentFiles;

  /// File paths that need to be uploaded to Nextcloud
  static late EncPref<List<String>> fileSyncUploadQueue;

  static late PlainPref<bool> shouldCheckForUpdates;

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
    editorFingerDrawing = PlainPref("editorFingerDrawing", true);
    editorAutoInvert = PlainPref("editorAutoInvert", true, historicalKeys: ["editorAutoDarken"]);
    preferGreyscale = PlainPref("preferGreyscale", false);
    editorStraightenDelay = PlainPref("editorStraightenDelay", 500);

    recentColorsChronological = PlainPref("recentColorsChronological", []);
    recentColorsPositioned = PlainPref("recentColorsPositioned", [], historicalKeys: ["recentColors"]);

    lastPenColor = PlainPref("lastPenColor", -1);
    lastHighlighterColor = PlainPref("lastHighlighterColor", -1);
    lastBackgroundPattern = PlainPref("lastBackgroundPattern", CanvasBackgroundPatterns.none);
    lastLineHeight = PlainPref("lastLineHeight", 40);

    recentFiles = PlainPref("recentFiles", [], historicalKeys: ["recentlyAccessed"]);

    fileSyncUploadQueue = EncPref("fileSyncUploadQueue", []);

    shouldCheckForUpdates = PlainPref("shouldCheckForUpdates", FlavorConfig.shouldCheckForUpdatesByDefault && !kIsWeb);
  }

}

abstract class IPref<T, Preferences extends dynamic> extends ValueNotifier<T> {
  final String key;
  final List<String> historicalKeys;
  bool _loaded = false;

  Preferences? _prefs;

  IPref(this.key, T defaultValue, {
    List<String>? historicalKeys
  }) : historicalKeys = historicalKeys ?? [], super(defaultValue) {
    if (Prefs.testingMode) {
      _loaded = true;
      return;
    } else {
      _load().then((T? loadedValue) {
        _loaded = true;
        if (loadedValue != null) {
          value = loadedValue;
        }
        addListener(_save);
      });
    }
  }

  Future<T?> _load();
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

  Future<void> waitUntilLoaded() {
    if (loaded) return Future.value();
    return Future.delayed(const Duration(milliseconds: 10), waitUntilLoaded);
  }

  /// Lets us use notifyListeners outside of the class
  /// as super.notifyListeners is @protected
  @override
  void notifyListeners() => super.notifyListeners();
}
class PlainPref<T> extends IPref<T, SharedPreferences> {
  PlainPref(super.key, super.defaultValue, {super.historicalKeys}) {
    // Accepted types
    assert(T == bool || T == int || T == double || T == typeOf<List<String>>() || T == String);
  }

  @override
  Future<T?> _load() async {
    _prefs = await SharedPreferences.getInstance();

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

    return null;
  }

  @override
  Future _save() {
    if (T == bool) {
      return _prefs!.setBool(key, value as bool);
    } else if (T == int) {
      return _prefs!.setInt(key, value as int);
    } else if (T == double) {
      return _prefs!.setDouble(key, value as double);
    } else if (T == typeOf<List<String>>()) {
      return _prefs!.setStringList(key, value as List<String>);
    } else {
      return _prefs!.setString(key, value as String);
    }
  }

  @override
  Future<T?> getValueWithKey(String key) async {
    try {
      if (!_prefs!.containsKey(key)) {
        return null;
      } else if (T == List<String>) {
        return _prefs!.getStringList(key) as T?;
      } else {
        return _prefs!.get(key) as T?;
      }
    } catch (e) {
      if (kDebugMode) print("Error loading $key: $e");
      return null;
    }
  }
}

class EncPref<T> extends IPref<T, EncryptedSharedPreferences> {
  EncPref(super.key, super.defaultValue, {super.historicalKeys}) {
    assert(T == String || T == typeOf<List<String>>());
  }

  @override
  Future<T?> _load() async {
    _prefs = EncryptedSharedPreferences();

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

    return null;
  }

  @override
  Future _save() {
    if (T == String) return _prefs!.setString(key, value as String);
    return _prefs!.setString(key, jsonEncode(value));
  }

  @override
  Future<T?> getValueWithKey(String key) async {
    try {
      final value = await _prefs!.getString(key);
      if (value.isEmpty) return null;
      if (T == String) {
        return value as T;
      } else {
        return List<String>.from(jsonDecode(value)) as T;
      }
    } catch (e) {
      if (kDebugMode) print("Error loading $key: $e");
      return null;
    }
  }
}

Type typeOf<T>() => T;
