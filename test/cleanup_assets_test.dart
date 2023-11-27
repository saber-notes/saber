import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';

import 'utils/test_mock_channel_handlers.dart';

void main() {
  test('Unused assets should be deleted', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    setupMockPathProvider();

    FlavorConfig.setup();
    Prefs.testingMode = true;
    Prefs.init();
    await FileManager.init();

    const sbnPath = '/test/sbn_examples/v19_separate_assets.sbn2';

    final usedFiles = [
      FileManager.getFile(sbnPath),
      FileManager.getFile('$sbnPath.0'),
      FileManager.getFile('$sbnPath.1'),
    ];
    final unusedFiles = [
      FileManager.getFile('$sbnPath.2'),
      FileManager.getFile('$sbnPath.3'),
      FileManager.getFile('$sbnPath.4'),
      FileManager.getFile('$sbnPath.5'),
    ];

    // create files
    await Future.wait([
      for (final file in [...usedFiles, ...unusedFiles])
        file.create(recursive: true),
    ]);

    FileManager.removeUnusedAssets(sbnPath, numAssets: usedFiles.length - 1);

    // check that used files are still there
    for (final file in usedFiles) {
      expect(file.existsSync(), isTrue);
    }
    // check that unused files are deleted
    for (final file in unusedFiles) {
      expect(file.existsSync(), isFalse);
    }
  });
}
