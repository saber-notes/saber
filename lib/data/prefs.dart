
import 'dart:convert';

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Prefs {

  static late EncPref<String> url;
  static late EncPref<String> username;
  /// the password used to login to NextCloud
  static late EncPref<String> ncPassword;
  /// the password used to encrypt/decrypt notes
  static late EncPref<String> encPassword;

  static late EncPref<String> key;
  static late EncPref<String> iv;

  static late PlainPref<String> pfp;

  static late PlainPref<bool> editorToolbarOnBottom;
  static late PlainPref<bool> editorFingerDrawing;
  static late PlainPref<bool> editorAutoInvert;
  static late PlainPref<bool> preferGreyscale;

  static late PlainPref<List<String>> recentColorsChronological;
  static late PlainPref<List<String>> recentColorsPositioned;

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

    editorToolbarOnBottom = PlainPref("editorToolbarOnBottom", true);
    editorFingerDrawing = PlainPref("editorFingerDrawing", true);
    editorAutoInvert = PlainPref("editorAutoInvert", true, historicalKeys: ["editorAutoDarken"]);
    preferGreyscale = PlainPref("preferGreyscale", false);

    recentColorsChronological = PlainPref("recentColorsChronological", []);
    recentColorsPositioned = PlainPref("recentColorsPositioned", [], historicalKeys: ["recentColors"]);

    recentFiles = PlainPref("recentFiles", [], historicalKeys: ["recentlyAccessed"]);

    fileSyncUploadQueue = EncPref("fileSyncUploadQueue", []);

    shouldCheckForUpdates = PlainPref("shouldCheckForUpdates", true);
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
    _load().then((_) {
      _loaded = true;
      addListener(_save);
    });
  }

  Future<void> _load();
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
  Future _load() async {
    _prefs = await SharedPreferences.getInstance();

    T? currentValue = await getValueWithKey(key);
    if (currentValue != null) {
      value = currentValue;
      return;
    }

    for (String historicalKey in historicalKeys) {
      currentValue = await getValueWithKey(historicalKey);
      if (currentValue == null) continue;

      value = currentValue;
      await _save();
      _prefs!.remove(historicalKey);
      return;
    }
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
  Future _load() async {
    _prefs = EncryptedSharedPreferences();
    T? currentValue = await getValueWithKey(key);
    if (currentValue != null) {
      value = currentValue;
      return;
    }

    for (String historicalKey in historicalKeys) {
      currentValue = await getValueWithKey(historicalKey);
      if (currentValue == null) continue;

      value = currentValue;
      await _save();
      _prefs!.remove(historicalKey);
      return;
    }
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
