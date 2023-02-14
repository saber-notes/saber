import 'package:saber/data/flavor_config.dart';
import 'main_common.dart' as common;

void main() {
  FlavorConfig.setup(
    flavor: "App Store",
    appStore: "App Store",
    shouldCheckForUpdatesByDefault: false,
  );

  common.main();
}
