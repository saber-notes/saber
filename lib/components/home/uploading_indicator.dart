import 'package:flutter/material.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/nextcloud/file_syncer.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';

class UploadingIndicator extends StatefulWidget {
  const UploadingIndicator({
    super.key,
    required this.filePath,
  });

  final String filePath;

  @override
  State<UploadingIndicator> createState() => _UploadingIndicatorState();
}

class _UploadingIndicatorState extends State<UploadingIndicator> {
  @override
  void initState() {
    Prefs.username.addListener(onFileUploaded);
    Prefs.fileSyncUploadQueue.addListener(onFileUploaded);
    super.initState();
  }

  /// Called when some file is uploaded (or when login state changes)
  void onFileUploaded() {
    final wasInUploadQueue = isInUploadQueue;
    isInUploadQueue = _isInUploadQueue();
    if (wasInUploadQueue != isInUploadQueue) setState(() {});
  }

  bool _matchesPath(String path) {
    if (path == widget.filePath) return true;
    if (path == widget.filePath + Editor.extension) return true;
    if (path == widget.filePath + Editor.extensionOldJson) return true;
    return false;
  }

  bool _isInUploadQueue() => Prefs.fileSyncUploadQueue.value.any((path) {
        if (_matchesPath(path)) return true;

        if (FileManager.assetFileRegex.hasMatch(path)) {
          final assetOwner = path.substring(0, path.lastIndexOf('.'));
          if (_matchesPath(assetOwner)) return true;
        }

        return false;
      });
  late bool isInUploadQueue = _isInUploadQueue();

  @override
  Widget build(BuildContext context) {
    if (Prefs.username.value.isEmpty) return const SizedBox.shrink();

    return Positioned(
      top: 0,
      right: 0,
      child: AnimatedOpacity(
        opacity: isInUploadQueue ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(Icons.upload),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Prefs.username.removeListener(onFileUploaded);
    Prefs.fileSyncUploadQueue.removeListener(onFileUploaded);
    super.dispose();
  }
}
