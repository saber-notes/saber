
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Prefs {

  static EncPref url = EncPref("url", "");
  static EncPref username = EncPref("username", "");
  static EncPref password = EncPref("password", "");

  static EncPref key = EncPref("key", "");
  static EncPref iv = EncPref("iv", "");

  static PlainPref<String> pfp = PlainPref("pfp", "");

  static PlainPref<bool> editorToolbarOnBottom = PlainPref("editorToolbarOnBottom", true);

}

abstract class IPref<T, Preferences extends dynamic> extends ValueNotifier<T> {
  final String key;

  Preferences? _prefs;

  IPref(this.key, T defaultValue) : super(defaultValue) {
    _load().then((_) => addListener(() {
      _prefs?.setString(key, value.toString());
    }));
  }

  Future<void> _load();
}
class PlainPref<T> extends IPref<T, SharedPreferences> {
  PlainPref(super.key, super.defaultValue);

  @override
  Future _load() async {
    _prefs = await SharedPreferences.getInstance();
    final T? currentValue = _prefs!.get(key) as T?;
    if (currentValue != null) {
      value = currentValue;
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
}
