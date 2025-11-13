import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/nextcloud/saber_syncer.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';

class SyncIndicator extends StatefulWidget {
  const SyncIndicator({super.key, required this.filePath});

  final String filePath;

  @override
  State<SyncIndicator> createState() => _SyncIndicatorState();
}

class _SyncIndicatorState extends State<SyncIndicator> {
  late final StreamSubscription uploaderListener, downloaderListener;
  final status = ValueNotifier(_SyncIndicatorStatus.done);

  @override
  void initState() {
    stows.username.addListener(onFileTransfer);
    uploaderListener = syncer.uploader.transferStream.listen(onFileTransfer);
    downloaderListener = syncer.downloader.transferStream.listen(
      onFileTransfer,
    );
    super.initState();
  }

  /// Called when some file is uploaded/downloaded (or when login state changes)
  void onFileTransfer([SaberSyncFile? _]) {
    final isInUploadQueue = _isInQueue(syncer.uploader.pending);
    final isInDownloadQueue = _isInQueue(syncer.downloader.pending);

    if (isInUploadQueue && isInDownloadQueue) {
      status.value = .merging;
    } else if (isInUploadQueue) {
      status.value = .uploading;
    } else if (isInDownloadQueue) {
      status.value = .downloading;
    } else {
      status.value = .done;
    }
  }

  bool _matchesPath(String path) {
    if (path == widget.filePath) return true;
    if (path == widget.filePath + Editor.extension) return true;
    if (path == widget.filePath + Editor.extensionOldJson) return true;
    return false;
  }

  bool _isInQueue(Iterable<SaberSyncFile> pending) => pending.any((syncFile) {
    final path = syncFile.relativeLocalPath;

    if (_matchesPath(path)) return true;

    if (FileManager.assetFileRegex.hasMatch(path)) {
      final assetOwner = path.substring(0, path.lastIndexOf('.'));
      if (_matchesPath(assetOwner)) return true;
    }

    return false;
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: IgnorePointer(
        child: Padding(
          padding: const .all(8),
          child: ValueListenableBuilder(
            valueListenable: status,
            builder: (context, status, _) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: switch (status) {
                  .done => null,
                  .uploading => const Icon(Icons.upload),
                  .downloading => const Icon(Icons.download),
                  .merging => const Icon(Icons.sync),
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    stows.username.removeListener(onFileTransfer);
    uploaderListener.cancel();
    downloaderListener.cancel();
    super.dispose();
  }
}

enum _SyncIndicatorStatus { done, uploading, downloading, merging }
