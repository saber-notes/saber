import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/main_common.dart' as common;

Future<void> main() async {

  /// To set the flavor config e.g. for the Play Store, use:
  /// flutter build \
  ///   --dart-define=FLAVOR="Google Play" \
  ///   --dart-define=APP_STORE="Google Play" \
  ///   --dart-define=UPDATE_CHECK="false" \
  ///   --dart-define=DIRTY="false"
  FlavorConfig.setup(
    flavor: _stringFromBuild('FLAVOR') ?? '',
    appStore: _stringFromBuild('APP_STORE'),
    shouldCheckForUpdatesByDefault: _boolFromBuild('UPDATE_CHECK') ?? true,
    dirty: _boolFromBuild('DIRTY') ?? false,
  );
  
  if (_boolFromBuild('OFFLINE_FONTS_ONLY') ?? false) {
    // All fonts should already be included (offline) in the app, but in case
    // I've forgot to add one, it'll be fetched from the internet.
    // This prevents the app from fetching fonts from Google Servers,
    // to comply with F-Droid requirements.
    GoogleFonts.config.allowRuntimeFetching = false;
  }

  await common.main();
}

/// Modified form of [String.fromEnvironment]
/// that returns null if the value is empty.
String? _stringFromBuild(String key) {
  final value = String.fromEnvironment(key);
  if (value.isNotEmpty) return value;
  return null;
}
/// Modified form of [bool.fromEnvironment]
/// that returns null if the value is empty.
/// It also recognises '0' and '1' as valid bools.
bool? _boolFromBuild(String key) {
  final value = String.fromEnvironment(key);

  if (value == 'true') return true;
  if (value == '1') return true;
  if (value == 'false') return false;
  if (value == '0') return false;

  if (value.isNotEmpty) {
    if (kDebugMode) print('WARNING: "$value" is not a valid bool in --dart-define=$key="$value"');
  }

  return null;
}
