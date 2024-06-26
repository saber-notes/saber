import 'package:saber/data/flavor_config.dart';
import 'package:saber/main_common.dart' as common;
import 'package:simulator/simulator.dart';

Future<void> main(List<String> args) async {
  FlavorConfig.setup();

  await common.main(
    args,
    initWidgetsBinding: SimulatorWidgetsFlutterBinding.ensureInitialized,
    runApp: runSimulatorApp,
  );
}
