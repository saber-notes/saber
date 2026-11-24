import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mutex/mutex.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stow/stow.dart';
import 'package:stow_codecs/stow_codecs.dart';

/// A [Stow] implementation that stores values with [SharedPreferences].
///
/// 与上游 `stow_secure` 的唯一区别是底层存储:这里用 `shared_preferences`
/// 而不是 `flutter_secure_storage`(后者暂无鸿蒙实现)。
///
/// 安全性说明:鸿蒙端 `shared_preferences` 落在应用沙箱内的
/// `preferences` 文件中,与应用私有目录同级,其它应用无法访问;
/// 但它不像 KeyStore 那样提供硬件级加密,因此**不要**用它保存真正的密钥。
/// Saber 里用它保存的是 Nextcloud 账号 / 口令与笔记加密口令,
/// 正式上架前建议替换为鸿蒙的 `huks`(密钥托管服务)实现。
class SecureStow<Value> extends Stow<String, Value, String?> {
  /// Creates a [SecureStow] to store values using [SharedPreferences].
  ///
  /// This constructor requires the codec to output Strings.
  /// If your codec of choice outputs something else, consider using:
  /// - [SecureStow.int] for integers
  /// - [SecureStow.bool] for booleans
  SecureStow(super.key, super.defaultValue, {super.codec, super.volatile})
    : assert(key.isNotEmpty),
      assert(
        Value == String || codec != null,
        'SecureStow requires a codec for non-string values.',
      );

  /// Creates a [SecureStow] to store integer values.
  ///
  /// This constructor automatically converts the integer value to a string
  /// using [IntToStringCodec] before storing it.
  factory SecureStow.int(
    String key,
    Value defaultValue, {
    Codec<Value, int?>? codec,
    bool volatile = false,
  }) {
    assert(
      Value == int || codec != null,
      'SecureStow.int requires a codec for non-integer values.',
    );
    final valueToStringCodec =
        codec?.fuse(const IntToStringCodec()) ??
        (const IntToStringCodec() as Codec<Value, String?>);
    return SecureStow(
      key,
      defaultValue,
      codec: valueToStringCodec,
      volatile: volatile,
    );
  }

  /// Creates a [SecureStow] to store boolean values.
  ///
  /// This constructor automatically converts the boolean value to a string
  /// using [BoolToStringCodec] before storing it.
  factory SecureStow.bool(
    String key,
    Value defaultValue, {
    Codec<Value, bool?>? codec,
    bool volatile = false,
  }) {
    assert(
      Value == bool || codec != null,
      'SecureStow.bool requires a codec for non-boolean values.',
    );
    final valueToStringCodec =
        codec?.fuse(const BoolToStringCodec()) ??
        (const BoolToStringCodec() as Codec<Value, String?>);
    return SecureStow(
      key,
      defaultValue,
      codec: valueToStringCodec,
      volatile: volatile,
    );
  }

  /// Creates a [SecureStow] to store integer values.
  @Deprecated('Use SecureStow.int instead.')
  factory SecureStow.numerical(
    String key,
    Value defaultValue, {
    Codec<Value, int?>? codec,
    bool volatile,
  }) = SecureStow.int;

  /// 前缀,避免与 `stow_plain`(同样使用 shared_preferences)的 key 冲突。
  static const keyPrefix = 'secure_';

  @visibleForTesting
  late final Future<SharedPreferences> storage = SharedPreferences.getInstance();

  String get _storageKey => '$keyPrefix$key';

  @override
  Future<String?> protectedRead() async {
    final prefs = await storage;
    return prefs.getString(_storageKey);
  }

  @override
  Future<void> protectedWrite(String? encodedValue) async {
    final prefs = await storage;
    if (encodedValue == null || encodedValue == encodedDefaultValue) {
      await prefs.remove(_storageKey);
    } else {
      await prefs.setString(_storageKey, encodedValue);
    }
  }

  @override
  String toString() => 'SecureStow<$Value>($key, $value, $codec)';

  @override
  @visibleForOverriding
  final writeMutex = _globalWriteMutex;

  /// shared_preferences 一次只能写一个 key,
  /// so we use one write mutex across all secure stows.
  static final _globalWriteMutex = Mutex();
}
