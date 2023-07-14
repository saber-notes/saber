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
    flavor: const String.fromEnvironment('FLAVOR'),
    appStore: const String.fromEnvironment('APP_STORE'),
    shouldCheckForUpdatesByDefault: const bool.fromEnvironment('UPDATE_CHECK', defaultValue: true),
    dirty: const bool.fromEnvironment('DIRTY', defaultValue: false),
  );
  
  if (const bool.fromEnvironment('OFFLINE_FONTS_ONLY', defaultValue: false)) {
    // All fonts should already be included (offline) in the app, but in case
    // I've forgot to add one, it'll be fetched from the internet.
    // This prevents the app from fetching fonts from Google Servers,
    // to comply with F-Droid requirements.
    GoogleFonts.config.allowRuntimeFetching = false;
  }

  await common.main();
}
