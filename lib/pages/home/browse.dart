
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:saber/data/file_manager.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/pages/home/_grid_folders.dart';
import '_masonry_files.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({
    Key? key,
    String? path,
  }) : initialPath = path, super(key: key);

  final String? initialPath;

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}
class _BrowsePageState extends State<BrowsePage> {
  final List<String> directoryPaths = [];
  final List<String> filePaths = [];
  bool failed = false;

  final List<String?> pathHistory = [];
  String? path;

  @override
  void initState() {
    super.initState();
    path = widget.initialPath;
    findChildrenOfPath();
  }

  Future findChildrenOfPath() async {
    List<String>? children = await FileManager.getChildrenOfDirectory(path ?? '/');
    directoryPaths.clear();
    filePaths.clear();
    if (children == null) {
      failed = true;
    } else {
      failed = false;
      for (String child in children) {
        if (await FileManager.isDirectory("${path ?? '/'}/$child")) {
          directoryPaths.add(child);
        } else {
          filePaths.add(child);
        }
      }
    }
    setState(() {});
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
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: Text("Browse${(path?.isNotEmpty ?? false) ? ": $path" : ""}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (failed) ...[
              const Text("Failed to load directory"),
            ] else ...[
              GridFolders(
                isAtRoot: path == null,
                folders: [
                  for (String directoryPath in directoryPaths) directoryPath,
                ],
                onTap: onDirectoryTap,
                physics: const NeverScrollableScrollPhysics(),
              ),
              MasonryFiles(
                files: [
                  for (String filePath in filePaths) "${path ?? ""}/$filePath",
                ],
                onTap: onFileTap,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("${RoutePaths.edit}?path=/new-note");
        },
        tooltip: "New note",
        child: const Icon(Icons.add),
      ),
    );
  }
}
