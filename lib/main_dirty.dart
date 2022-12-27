
import 'package:saber/data/flavor_config.dart';
import 'main_common.dart' as common;

void main() {
  // Use default config
  FlavorConfig.setup(
    dirty: true,
  );

  common.main();
}
