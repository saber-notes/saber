import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:saber/data/file_manager/file_manager.dart';

/// Deleted files should be moved to a hidden `.trash` folder
/// in the app's directory.
/// Inside the `.trash` folder, a folder exists for each
/// timestamp when files were deleted, in
/// `DateTime.toIso8601String()` format.
/// Inside each timestamp folder, the deleted file(s) are stored.
///
/// E.g. `.trash/2024-02-22T12:00:00Z/file1.sbn2`.
class TrashPage extends StatefulWidget {
  const TrashPage({
    super.key,
  });

  @override
  State<TrashPage> createState() => _TrashPageState();
}

class _TrashPageState extends State<TrashPage> {
  static const _trashFolderName = '.trash';
  var _trash = <DateTime, DirectoryChildren>{};

  static Future<Map<DateTime, DirectoryChildren>> _findTrash() async {
    final trashFolder = FileManager.getDirectory(_trashFolderName);
    if (!trashFolder.existsSync()) return {};
    final timestamps = trashFolder
        .listSync()
        .whereType<Directory>()
        .map((child) => DateTime.tryParse(child.path.split('/').last))
        .where((timestamp) => timestamp != null)
        .map((timestamp) => timestamp!)
        .toList()
      ..sort();
    final trash = <DateTime, DirectoryChildren>{};
    await Future.wait(timestamps.map((timestamp) async {
      final children = await FileManager.getChildrenOfDirectory(
        '$_trashFolderName/${timestamp.toIso8601String()}',
      );
      if (children == null) return;
      trash[timestamp] = children;
    }));
    return trash;
  }

  @override
  void initState() {
    unawaited(_refresh());
    super.initState();
  }

  Future<void> _refresh() async {
    _trash = await _findTrash();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.builder(
          itemCount: _trash.length,
          itemBuilder: (context, index) {
            final timestamp = _trash.keys.elementAt(index);
            final children = _trash[timestamp]!;
            return ListTile(
              title: Text(timestamp.toIso8601String()),
              subtitle: Text(
                '${children.files.length} files, '
                '${children.directories.length} directories',
              ),
            );
          },
        ),
      ),
    );
  }
}
