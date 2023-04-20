import 'package:google_fonts/google_fonts.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/main_common.dart' as common;

Future<void> main() async {
  FlavorConfig.setup(
    flavor: 'F-Droid',
    appStore: 'F-Droid',
    shouldCheckForUpdatesByDefault: false,
  );

  GoogleFonts.config.allowRuntimeFetching = false;

  await common.main();
}
