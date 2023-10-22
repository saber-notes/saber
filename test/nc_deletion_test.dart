import 'dart:collection';
import 'dart:io';

import 'package:encrypt/encrypt.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/nextcloud/file_syncer.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';

import 'utils/test_mock_channel_handlers.dart';
import 'utils/test_random.dart';

void main() {
  test('Test deleting a file and syncing it', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = null; // enable http requests in test
    setupMockPathProvider();

    FlavorConfig.setup();
    Prefs.testingMode = true;
    Prefs.init();

    Prefs.username.value = 'test.deletion';
    Prefs.ncPassword.value = 'PRmjb-NWLzz-Gisq5-TAbtj-RbpWP';
    Prefs.encPassword.value = 'test.deletion';

    final client = NextcloudClientExtension.withSavedDetails()!;
    final webdav = client.webdav;

    await client.loadEncryptionKey();

    // Use a random file name to avoid conflicts with simultaneous tests
    final String filePathLocal = '/test.deletion.${randomString(10)}';
    printOnFailure('File path local: $filePathLocal');

    const List<int> fileContent = [1, 2, 3];
    final String encryptedPath = await client.encrypter.then((encrypter) {
      final IV iv = IV.fromBase64(Prefs.iv.value);
      return encrypter.encrypt(filePathLocal, iv: iv).base16;
    });
    final syncFile = SyncFile(
      encryptedName: encryptedPath,
      localPath: filePathLocal,
    );

    // Create a file (to delete later)
    await FileManager.writeFile(filePathLocal, fileContent, awaitWrite: true, alsoUpload: false);

    // Upload file to Nextcloud
    Prefs.fileSyncUploadQueue.value = Queue.from([filePathLocal]);
    await FileSyncer.uploadFileFromQueue();

    // Check that the file exists on Nextcloud
    printOnFailure('Checking if ${syncFile.remotePath} exists on Nextcloud');
    final webDavFiles = await webdav.propfind(Uri.parse(syncFile.remotePath), depth: WebDavDepth.zero)
        .then((multistatus) => multistatus.toWebDavFiles());
    expect(webDavFiles.length, 1, reason: 'File should exist on Nextcloud');

    // Delete the file
    FileManager.deleteFile(filePathLocal, alsoUpload: false);

    // Upload deletion to Nextcloud
    Prefs.fileSyncUploadQueue.value = Queue.from([filePathLocal]);
    await FileSyncer.uploadFileFromQueue();

    // Check that the file is empty on Nextcloud
    final webDavFile = await webdav.propfind(Uri.parse(syncFile.remotePath), depth: WebDavDepth.zero, prop: WebDavPropWithoutValues.fromBools(
      davgetcontentlength: true,
    )).then((multistatus) => multistatus.toWebDavFiles().single);
    expect(webDavFile.size, 0, reason: 'File should be empty on Nextcloud');

    // Sync the file from Nextcloud
    syncFile.webDavFile = webDavFile;
    bool downloaded = await FileSyncer.downloadFile(syncFile, awaitWrite: true);
    expect(downloaded, true, reason: 'File was not downloaded successfully');

    // Check that the file is deleted locally
    bool exists = await FileManager.doesFileExist(filePathLocal);
    expect(exists, false, reason: 'File is not deleted locally');
  });
}
