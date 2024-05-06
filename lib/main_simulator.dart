import 'package:saber/data/flavor_config.dart';
import 'package:saber/main_common.dart' as common;
import 'package:simulator/simulator.dart';

Future<void> main() async {
  FlavorConfig.setup();

  await common.main(
    initWidgetsBinding: SimulatorWidgetsFlutterBinding.ensureInitialized,
    runApp: runSimulatorApp,
  );
}
