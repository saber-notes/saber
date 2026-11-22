/// OpenHarmony 版的 `stow_secure`。
///
/// 上游 `stow_secure` 依赖 `flutter_secure_storage`,而该插件至今没有官方
/// 鸿蒙实现,会导致应用启动时抛 `MissingPluginException`。
///
/// 本包保持与上游 **完全一致的 API**(`SecureStow` / `SecureStow.int` /
/// `SecureStow.bool` / `SecureStow.numerical`),只是把底层存储从
/// `FlutterSecureStorage` 换成 `shared_preferences`
/// (OpenHarmony-TPC/flutter_packages 提供了鸿蒙实现)。
///
/// 通过 `pubspec_overrides.yaml` 覆盖即可,业务代码一行都不用改。
library;

export 'src/secure_stow.dart';
