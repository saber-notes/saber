import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/routes.dart';

class const FileTree({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: .all(12),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: _FileTreeBranch(path: null, isDirectory: true),
      ),
    );
  }
}

class const _FileTreeBranch({
  required final String? path,
  required final bool isDirectory,
}) extends StatefulWidget {
  @override
  State<_FileTreeBranch> createState() => _FileTreeBranchState();
}

class _FileTreeBranchState extends State<_FileTreeBranch> {
  DirectoryChildren? children;
  var areChildrenVisible = false;

  StreamSubscription? fileWriteSubscription;

  @override
  void initState() {
    _getInfo();
    fileWriteSubscription = FileManager.fileWriteStream.stream.listen(_getInfo);
    super.initState();
  }

  void _getInfo([FileOperation? _]) async {
    if (widget.isDirectory)
      children = await FileManager.getChildrenOfDirectory(widget.path ?? '/');
    areChildrenVisible = children != null && children!.onlyOneChild();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return Column(
      crossAxisAlignment: .start,
      children: [
        if (widget.path != null)
          InkWell(
            borderRadius: const .all(.circular(8)),
            onTap: () {
              setState(() {
                if (widget.isDirectory) {
                  areChildrenVisible = !areChildrenVisible;
                } else {
                  context.push(RoutePaths.editFilePath(widget.path ?? '/'));
                }
              });
            },
            child: Row(
              children: [
                if (widget.isDirectory) ...[
                  Icon(
                    areChildrenVisible ? Icons.folder_open : Icons.folder,
                    color: colorScheme.primary,
                    size: 25,
                  ),
                ] else ...[
                  const Icon(Icons.insert_drive_file, size: 25),
                ],
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    widget.path!.substring(widget.path!.lastIndexOf('/') + 1),
                    style: TextTheme.of(context).bodyMedium
                        ?.copyWith(fontSize: 14),
                    overflow: .ellipsis,
                  ),
                ),
              ],
            ),
          ),
        if ((widget.path == null || areChildrenVisible) && children != null)
          Stack(
            children: [
              if (widget.path != null)
                Positioned.directional(
                  top: 8,
                  bottom: 8,
                  start: 0,
                  textDirection: Directionality.of(context),
                  child: const VerticalDivider(width: 24),
                ),
              Padding(
                padding: widget.path != null
                    ? const .directional(start: 24)
                    : .zero,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    for (var i = 0; i < children!.directories.length; i++)
                      _FileTreeBranch(
                        path:
                            "${widget.path ?? ""}/${children!.directories[i]}",
                        isDirectory: true,
                      ),
                    for (var i = 0; i < children!.files.length; i++)
                      _FileTreeBranch(
                        path: "${widget.path ?? ""}/${children!.files[i]}",
                        isDirectory: false,
                      ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }

  @override
  void dispose() {
    fileWriteSubscription?.cancel();
    super.dispose();
  }
}
