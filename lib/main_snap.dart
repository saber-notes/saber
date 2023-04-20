
import 'package:saber/data/flavor_config.dart';
import 'package:saber/main_common.dart' as common;

Future<void> main() async {
  FlavorConfig.setup(
    flavor: 'Snap',
    appStore: 'Snap',
    shouldCheckForUpdatesByDefault: false,
  );

  await common.main();
}
