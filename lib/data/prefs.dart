
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Prefs {

  static EncPref url = EncPref("url", "");
  static EncPref username = EncPref("username", "");
  static EncPref password = EncPref("password", "");

  static EncPref key = EncPref("key", "");
  static EncPref iv = EncPref("iv", "");

  static PlainPref<String> pfp = PlainPref("pfp", "");

  static PlainPref<bool> editorToolbarOnBottom = PlainPref("editorToolbarOnBottom", true);
  static PlainPref<bool> editorFingerDrawing = PlainPref("editorFingerDrawing", true);

  static PlainPref<List<String>> recentColors = PlainPref("recentColors", []);

}

abstract class IPref<T, Preferences extends dynamic> extends ValueNotifier<T> {
  final String key;

  Preferences? _prefs;

  IPref(this.key, T defaultValue) : super(defaultValue) {
    _load().then((_) => addListener(_save));
  }

  Future<void> _load();
  Future<void> _save();

  /// Lets us use notifyListeners outside of the class
  /// as super.notifyListeners is @protected
  @override
  void notifyListeners() => super.notifyListeners();
}
class PlainPref<T> extends IPref<T, SharedPreferences> {
  PlainPref(super.key, super.defaultValue);

  @override
  Future _load() async {
    _prefs = await SharedPreferences.getInstance();
    final T? currentValue;

    try {
      if (T == List<String>) {
        currentValue = _prefs!.getStringList(key) as T?;
      } else {
        currentValue = _prefs!.get(key) as T?;
      }
    } catch (e) {
      if (kDebugMode) print("Error loading $key: $e");
      return;
    }

    if (currentValue != null) {
      value = currentValue;
    }
  }

  @override
  Future _save() {
    if (value is bool) {
      return _prefs!.setBool(key, value as bool);
    } else if (value is int) {
      return _prefs!.setInt(key, value as int);
    } else if (value is double) {
      return _prefs!.setDouble(key, value as double);
    } else if (value is List<String>) {
      return _prefs!.setStringList(key, value as List<String>);
    } else {
      return _prefs!.setString(key, value as String);
    }
  }
}

class EncPref<T extends String> extends IPref<T, EncryptedSharedPreferences> {
  EncPref(super.key, super.defaultValue);

  @override
  Future _load() async {
    _prefs = EncryptedSharedPreferences();
    final T currentValue = await _prefs!.getString(key) as T;
    if (currentValue.isNotEmpty) {
      value = currentValue;
    }
  }

  @override
  Future _save() => _prefs!.setString(key, value);
}
