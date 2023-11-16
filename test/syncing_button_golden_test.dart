import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/home/syncing_button.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/nextcloud/file_syncer.dart';
import 'package:saber/data/prefs.dart';

void main() {
  testWidgets('SyncingButton', (tester) async {
    FlavorConfig.setup();
    Prefs.testingMode = true;
    Prefs.init();

    await tester.pumpWidget(const MaterialApp(
      home: Center(
        child: RepaintBoundary(
          child: SyncingButton(),
        ),
      ),
    ));

    await expectLater(
      find.byType(SyncingButton),
      matchesGoldenFile('goldens/syncing_button_inactive.png'),
    );

    Prefs.fileSyncUploadQueue.value = Queue()..add('/pendingUpload');
    Prefs.username.value = 'username';
    FileSyncer.filesDone.value = 1;
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(SyncingButton),
      matchesGoldenFile('goldens/syncing_button_uploading.png'),
    );
  });
}
