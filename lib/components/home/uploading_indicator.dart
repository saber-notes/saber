
import 'package:flutter/material.dart';
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
    FileSyncer.uploadNotifier.addListener(onFileUploaded);
    super.initState();
  }

  /// Called when some file is uploaded.
  void onFileUploaded() {
    if (isInUploadQueue != _isInUploadQueue()) {
      setState(() {
        isInUploadQueue = !isInUploadQueue;
      });
    }
  }

  bool _isInUploadQueue() => Prefs.fileSyncUploadQueue.value.contains(widget.filePath)
      || Prefs.fileSyncUploadQueue.value.contains(widget.filePath + Editor.extension);
  late bool isInUploadQueue = _isInUploadQueue();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: AnimatedOpacity(
        opacity: isInUploadQueue ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.upload),
        ),
      ),
    );
  }

  @override
  void dispose() {
    FileSyncer.uploadNotifier.removeListener(onFileUploaded);
    super.dispose();
  }
}
