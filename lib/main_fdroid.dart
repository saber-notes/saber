import 'package:google_fonts/google_fonts.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/main_common.dart' as common;

void main() {
  FlavorConfig.setup(
    flavor: 'F-Droid',
    appStore: 'F-Droid',
    shouldCheckForUpdatesByDefault: false,
  );

  GoogleFonts.config.allowRuntimeFetching = false;

  common.main();
}
