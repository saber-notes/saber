
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/home/no_files.dart';
import 'package:saber/components/home/syncing_button.dart';

import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/components/home/grid_folders.dart';
import 'package:saber/components/home/masonry_files.dart';
import 'package:saber/i18n/strings.g.dart';

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

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final platform = Theme.of(context).platform;
    final appBarCentered = platform == TargetPlatform.iOS
        || platform == TargetPlatform.macOS;

    String title = t.home.titles.browse;
    if (path?.isNotEmpty ?? false) {
      title += ": $path";
    }

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.wait([
          findChildrenOfPath(),
          Future.delayed(const Duration(milliseconds: 500)),
        ]),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              collapsedHeight: kToolbarHeight,
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  title,
                  style: TextStyle(color: colorScheme.onBackground),
                ),
                centerTitle: appBarCentered,
                titlePadding: EdgeInsetsDirectional.only(
                    start: appBarCentered ? 0 : 16,
                    bottom: 16
                ),
              ),
              actions: const [
                SyncingButton(),
              ],
            ),
            SliverList(delegate: SliverChildListDelegate.fixed(
              failed ? [const NoFiles()] : [
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
                ),
              ],
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(RoutePaths.edit);
        },
        tooltip: t.home.tooltips.newNote,
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
