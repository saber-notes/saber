
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/home/no_files.dart';
import 'package:saber/components/home/syncing_button.dart';

import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/components/home/grid_folders.dart';
import 'package:saber/components/home/masonry_files.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({
    super.key,
    String? path,
  }) : initialPath = path;

  final String? initialPath;

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}
class _BrowsePageState extends State<BrowsePage> {
  DirectoryChildren? children;
  bool failed = false;

  final List<String?> pathHistory = [];
  String? path;

  @override
  void initState() {
    path = widget.initialPath;

    findChildrenOfPath();
    FileManager.writeWatcher.addListener(findChildrenOfPath);

    super.initState();
  }

  Future findChildrenOfPath() async {
    if (!mounted) return;
    children = await FileManager.getChildrenOfDirectory(path ?? '/');
    failed = children == null || children!.isEmpty;
    if (mounted) setState(() {});
  }

  onDirectoryTap(String folder) {
    if (folder == "..") {
      path = pathHistory.isEmpty ? null : pathHistory.removeLast();
    } else {
      pathHistory.add(path);
      path = "${path ?? ''}/$folder";
    }
    context.go("${HomeRoutes.getRoute(1)}?path=${path ?? '/'}");
    findChildrenOfPath();
  }
  onFileTap(String filePath) {
    context.push("${RoutePaths.edit}?path=$filePath");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: Text("Browse${(path?.isNotEmpty ?? false) ? ": $path" : ""}"),
        actions: const [
          SyncingButton(),
        ],
      ),
      body: failed ? const NoFiles() : SingleChildScrollView(
        child: Column(
          children: [
            if (children != null && (path != null || children!.directories.isNotEmpty)) GridFolders(
              isAtRoot: path == null,
              folders: [
                for (String directoryPath in children!.directories) directoryPath,
              ],
              onTap: onDirectoryTap,
              physics: const NeverScrollableScrollPhysics(),
            ),
            MasonryFiles(
              files: [
                for (String filePath in children?.files ?? const Iterable.empty()) "${path ?? ""}/$filePath",
              ],
              onTap: onFileTap,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(RoutePaths.edit);
        },
        tooltip: "New note",
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    FileManager.writeWatcher.removeListener(findChildrenOfPath);
    super.dispose();
  }
}
