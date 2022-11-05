// This is the target for when Saber is distributed through an app store
// which handles updates by itself, such as the Google Play Store.
// e.g. flutter build appbundle -t lib/main_appstore.dart


import 'package:saber/data/flavor_config.dart';
import 'main_common.dart' as common;

void main() {
  FlavorConfig.setup(
    flavor: "App Store",
    shouldCheckForUpdatesByDefault: false,
  );

  common.main();
}
