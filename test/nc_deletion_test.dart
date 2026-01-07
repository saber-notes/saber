import 'dart:async';
import 'dart:io';

import 'package:abstract_sync/abstract_sync.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nextcloud/webdav.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/nextcloud/saber_syncer.dart';
import 'package:saber/data/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/test_mock_channel_handlers.dart';
import 'utils/test_random.dart';

void main() {
  test('Test deleting a file and syncing it', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = null; // enable http requests in test
    setupMockPathProvider();
    setupMockFlutterSecureStorage();
    SharedPreferences.setMockInitialValues({});

    FlavorConfig.setup();
    await FileManager.init();

    stows.username.value = 'test.deletion';
    stows.ncPassword.value = 'PRmjb-NWLzz-Gisq5-TAbtj-RbpWP';
    stows.encPassword.value = 'test.deletion';

    final client = NextcloudClientExtension.withSavedDetails()!;
    final webdav = client.webdav;

    await client.loadEncryptionKey();

    // Use a random file name to avoid conflicts with simultaneous tests
    final filePathLocal = '/test.deletion.${randomString(10)}';
    printOnFailure('File path local: $filePathLocal');

    const fileContent = <int>[1, 2, 3];
    final syncFile = await const SaberSyncInterface().getSyncFileFromLocalFile(
      FileManager.getFile(filePathLocal),
    );

    // Create a file (to delete later)
    await FileManager.writeFile(
      filePathLocal,
      fileContent,
      awaitWrite: true,
      alsoUpload: false,
    );

    // Upload file to Nextcloud
    syncer.uploader.clearPending();
    syncer.uploader.enqueue(syncFile: syncFile);
    await syncer.uploader.waitUntilEmpty();

    // Check that the file exists on Nextcloud
    printOnFailure('Checking if ${syncFile.remotePath} exists on Nextcloud');
    final webDavFiles = await webdav
        .propfind(PathUri.parse(syncFile.remotePath), depth: WebDavDepth.zero)
        .then((multistatus) => multistatus.toWebDavFiles());
    expect(webDavFiles.length, 1, reason: 'File should exist on Nextcloud');

    // Delete the file
    FileManager.deleteFile(filePathLocal, alsoUpload: false);

    // Upload deletion to Nextcloud
    syncer.uploader.clearPending();
    syncer.uploader.enqueue(syncFile: syncFile);
    await syncer.uploader.waitUntilEmpty();

    // Check that the file is empty on Nextcloud
    final webDavFile = await webdav
        .propfind(
          PathUri.parse(syncFile.remotePath),
          depth: WebDavDepth.zero,
          prop: const WebDavPropWithoutValues.fromBools(
            davGetcontentlength: true,
          ),
        )
        .then((multistatus) => multistatus.toWebDavFiles().single);
    expect(webDavFile.size, 0, reason: 'File should be empty on Nextcloud');

    // Sync the file from Nextcloud
    syncFile.remoteFile = webDavFile;
    syncer.downloader.clearPending();
    syncer.downloader.enqueue(syncFile: syncFile);
    await syncer.downloader.waitUntilEmpty();

    // Check that the file is deleted locally
    final exists = FileManager.doesFileExist(filePathLocal);
    expect(exists, false, reason: 'File is not deleted locally');
  }, retry: 2);
}

extension on SyncerComponent {
  Future<void> waitUntilEmpty() async {
    if (numPending <= 0) return;

    final completer = Completer<void>();
    late final StreamSubscription subscription;
    subscription = queueStream.listen((event) {
      if (numPending > 0) return;
      subscription.cancel();
      if (!completer.isCompleted) completer.complete();
    });
    return completer.future;
  }
}
