
import 'package:integration_test/integration_test.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';

void initialiseForTests() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Prefs.init();

  FileManager.init();
}
