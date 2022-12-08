
import 'package:integration_test/integration_test.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';

void initialiseForTests() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  FlavorConfig.setup();

  Prefs.testingMode = true;
  Prefs.init();

  FileManager.init();
}
