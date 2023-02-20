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

void main() {
  test('Test deleting a file and syncing it', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = null; // enable http requests in test
    setupMockPathProvider();

    FlavorConfig.setup();
    Prefs.testingMode = true;
    Prefs.init();

    Prefs.username.value = 'test.deletion';
    Prefs.ncPassword.value = 'test.deletion';
    Prefs.encPassword.value = 'test.deletion';

    final client = NextcloudClientExtension.withSavedDetails()!;
    final webdav = client.webdav;
    late WebDavFile webDavFile;

    await client.loadEncryptionKey();

    const String filePathLocal = '/test.deletion';
    const String fileContent = 'test.deletion';
    final String filePathRemote = await () async {
      final Encrypter encrypter = await client.encrypter;
      final IV iv = IV.fromBase64(Prefs.iv.value);
      final String filePathEncrypted = encrypter.encrypt(filePathLocal, iv: iv).base16;
      return '${FileManager.appRootDirectoryPrefix}/$filePathEncrypted${FileSyncer.encExtension}';
    }();

    // Create a file (to delete later)
    await FileManager.writeFile(filePathLocal, fileContent, awaitWrite: true, alsoUpload: false);

    // Upload file to Nextcloud
    Prefs.fileSyncUploadQueue.value = Queue.from([filePathLocal]);
    await FileSyncer.uploadFileFromQueue();

    // Check that the file exists on Nextcloud
    webDavFile = await webdav.getProps(filePathRemote, props: {WebDavProps.davLastModified.name});
    expect(webDavFile.lastModified != null, true, reason: 'File does not exist on Nextcloud');

    // Delete the file
    FileManager.deleteFile(filePathLocal, alsoUpload: false);

    // Upload deletion to Nextcloud
    Prefs.fileSyncUploadQueue.value = Queue.from([filePathLocal]);
    await FileSyncer.uploadFileFromQueue();

    // Check that the file is empty on Nextcloud
    webDavFile = await webdav.getProps(filePathRemote, props: {WebDavProps.davContentLength.name});
    expect(webDavFile.size, 0, reason: 'File is not empty on Nextcloud');

    // Sync the file from Nextcloud
    SyncFile syncFile = SyncFile(
      remotePath: filePathRemote,
      localPath: filePathLocal,
      webDavFile: webDavFile,
    );
    bool downloaded = await FileSyncer.downloadFile(syncFile, awaitWrite: true);
    expect(downloaded, true, reason: 'File was not downloaded successfully');

    // Check that the file is deleted locally
    bool exists = await FileManager.doesFileExist(filePathLocal);
    expect(exists, false, reason: 'File is not deleted locally');
  });
}
