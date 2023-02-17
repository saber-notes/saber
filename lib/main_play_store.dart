// This is the target for when Saber is distributed through the Google Play Store.
// e.g. flutter build appbundle -t lib/main_play_store.dart


import 'package:saber/data/flavor_config.dart';
import 'package:saber/main_common.dart' as common;

void main() {
  FlavorConfig.setup(
    flavor: 'Google Play',
    appStore: 'Google Play',
    shouldCheckForUpdatesByDefault: false,
  );

  common.main();
}
