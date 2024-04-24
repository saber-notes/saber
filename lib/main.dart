import 'package:flutter/foundation.dart';//Flutter 基礎的庫
import 'package:google_fonts/google_fonts.dart';// Google 字體的包
import 'package:saber/data/flavor_config.dart';//自定義配置檔案，用來設定不同的應用版本（如 Google Play 版本）
import 'package:saber/main_common.dart' as common;

Future<void> main() async {//異步函數，允許使用 await
  /// To set the flavor config e.g. for the Play Store, use:
  /// flutter build \
  ///   --dart-define=FLAVOR="Google Play" \
  ///   --dart-define=APP_STORE="Google Play" \
  ///   --dart-define=UPDATE_CHECK="false" \
  ///   --dart-define=DIRTY="false"
  FlavorConfig.setup(//setup 函數用於設置應用的不同版本（flavor），例如 Google Play 版本
    flavor: const String.fromEnvironment('FLAVOR'),//從環境變量獲取配置
    appStore: const String.fromEnvironment('APP_STORE'),
    shouldCheckForUpdatesByDefault:
        const bool.fromEnvironment('UPDATE_CHECK', defaultValue: true),
    dirty: const bool.fromEnvironment('DIRTY', defaultValue: false),
  );

  if (const bool.fromEnvironment('OFFLINE_FONTS_ONLY',//字體配置
      defaultValue: kDebugMode)) {
    // All fonts should already be included (offline) in the app, but in case
    // I've forgot to add one, it'll be fetched from the internet.
    // This prevents the app from fetching fonts from Google Servers,
    // to comply with F-Droid requirements.
    // Offline fonts are also enforced by default in debug mode.
    GoogleFonts.config.allowRuntimeFetching = false;
  }

  await common.main();//呼叫main_common.dart
}
