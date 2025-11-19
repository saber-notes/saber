import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/test_mock_channel_handlers.dart';

void main() {
  test('Test new notes having distinct names', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    setupMockPathProvider();
    SharedPreferences.setMockInitialValues({});

    FlavorConfig.setup();
    await FileManager.init();

    const filePath = '/tests/distinct_name.sbn2';
    const filePath2 = '/tests/distinct_name (2).sbn2';
    const filePath3 = '/tests/distinct_name (3).sbn2';
    String suffixedPath;

    // Make sure files don't exist
    await Future.wait([
      FileManager.deleteFile(filePath, alsoUpload: false),
      FileManager.deleteFile(filePath2, alsoUpload: false),
      FileManager.deleteFile(filePath3, alsoUpload: false),
    ]);

    suffixedPath = await FileManager.suffixFilePathToMakeItUnique(filePath);
    expect(
      suffixedPath == filePath,
      true,
      reason: "filePath doesn't exist, so it should be returned as is",
    );

    await FileManager.writeFile(
      suffixedPath,
      [1, 2, 3],
      awaitWrite: true,
      alsoUpload: false,
    );

    suffixedPath = await FileManager.suffixFilePathToMakeItUnique(filePath);
    expect(
      suffixedPath == filePath2,
      true,
      reason:
          "filePath exists, but filePath2 doesn't, so filePath2 should be returned",
    );

    await FileManager.writeFile(
      suffixedPath,
      [1, 2, 3],
      awaitWrite: true,
      alsoUpload: false,
    );

    suffixedPath = await FileManager.suffixFilePathToMakeItUnique(filePath);
    expect(
      suffixedPath == filePath3,
      true,
      reason:
          "filePath and filePath2 exist, but filePath3 doesn't, so filePath3 should be returned",
    );

    // cleanup
    await Future.wait([
      FileManager.deleteFile(filePath, alsoUpload: false),
      FileManager.deleteFile(filePath2, alsoUpload: false),
      FileManager.deleteFile(filePath3, alsoUpload: false),
    ]);
  });
}
