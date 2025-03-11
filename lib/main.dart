import 'package:saber/data/flavor_config.dart';
import 'package:saber/main_common.dart' as common;

Future<void> main(List<String> args) async {
  /// To set the flavor config e.g. for the Play Store, use:
  /// flutter build \
  ///   --dart-define=FLAVOR="Google Play" \
  ///   --dart-define=APP_STORE="Google Play" \
  ///   --dart-define=UPDATE_CHECK="false" \
  ///   --dart-define=DIRTY="false"
  FlavorConfig.setup(
    flavor: const String.fromEnvironment('FLAVOR'),
    appStore: const String.fromEnvironment('APP_STORE'),
    shouldCheckForUpdatesByDefault:
        const bool.fromEnvironment('UPDATE_CHECK', defaultValue: true),
    dirty: const bool.fromEnvironment('DIRTY', defaultValue: false),
  );

  await common.main(args);
}
