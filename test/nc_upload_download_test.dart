import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/nextcloud/saber_syncer.dart';
import 'package:saber/data/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/test_mock_channel_handlers.dart';
import 'utils/test_random.dart';

void main() async {
  test('Upload and download file', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = null; // enable http requests in test
    setupMockPathProvider();
    setupMockFlutterSecureStorage();
    SharedPreferences.setMockInitialValues({});

    FileManager.documentsDirectory =
        '$tmpDir/nc_upload_download_test/'
        '${FileManager.appRootDirectoryPrefix}';
    FlavorConfig.setup();
    await FileManager.init();

    stows.username.value = 'test.issue.118';
    stows.ncPassword.value = 'riNLA-2fXWY-Kay3x-jEMX5-bZr6m';
    stows.encPassword.value = 'test.issue.118';

    final client = SaberSyncInterface.client!;
    await client.loadEncryptionKey();

    final localFile = FileManager.getFile('/helloworld${randomString(10)}.txt');
    final syncFile = await syncer.interface.getSyncFileFromLocalFile(localFile);
    printOnFailure(syncFile.toString());
    expect(syncFile.remotePath, matches(RegExp(r'^Saber/[a-zA-Z0-9]+\.sbe$')));

    // Create local file
    const content = 'Hello, world!';
    await localFile.create(recursive: true);
    await localFile.writeAsString(content);

    // Upload
    final upBytes = await syncer.interface.readLocalFile(syncFile);
    expect(upBytes.length, greaterThan(0));
    await syncer.interface.uploadRemoteFile(syncFile, upBytes);

    // Get the sync file again, this time starting with the remote file
    final remoteFile = await syncer.interface.getWebDavFile(
      syncFile.remotePath,
    );
    if (remoteFile == null) fail('Remote file not found after upload');
    final syncFile2 = await syncer.interface.getSyncFileFromRemoteFile(
      remoteFile,
    );
    expect(syncFile2, equals(syncFile));

    // Download
    final downBytes = await syncer.interface.downloadRemoteFile(syncFile);
    expect(downBytes.length, greaterThan(0));
    expect(downBytes, equals(upBytes));
    await syncer.interface.writeLocalFile(
      syncFile,
      downBytes,
      awaitWrite: true,
    );
    expect(await localFile.readAsString(), equals(content));
  });
}
