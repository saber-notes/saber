
import 'package:saber/data/flavor_config.dart';
import 'package:saber/main_common.dart' as common;

void main() {
  // Use default config
  FlavorConfig.setup(
    flavor: null,
    dirty: null,
  );

  common.main();
}
