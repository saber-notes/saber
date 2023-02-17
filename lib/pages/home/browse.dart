import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/home/grid_folders.dart';
import 'package:saber/components/home/masonry_files.dart';
import 'package:saber/components/home/no_files.dart';
import 'package:saber/components/home/syncing_button.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/routes.dart';
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

  final List<String?> pathHistory = [];
  String? path;

  @override
  void initState() {
    path = widget.initialPath;

    findChildrenOfPath();
    fileWriteSubscription = FileManager.fileWriteStream.stream.listen(fileWriteListener);

    super.initState();
  }

  StreamSubscription? fileWriteSubscription;
  void fileWriteListener(FileOperation event) {
    if (!event.filePath.startsWith(path ?? '/')) return;
    findChildrenOfPath();
  }

  Future findChildrenOfPath() async {
    if (!mounted) return;
    children = await FileManager.getChildrenOfDirectory(path ?? '/');
    if (mounted) setState(() {});
  }

  onDirectoryTap(String folder) {
    if (folder == '..') {
      path = pathHistory.isEmpty ? null : pathHistory.removeLast();
    } else {
      pathHistory.add(path);
      path = "${path ?? ''}/$folder";
    }
    context.go(HomeRoutes.browseFilePath(path ?? '/'));
    findChildrenOfPath();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final platform = Theme.of(context).platform;
    final cupertino = platform == TargetPlatform.iOS
        || platform == TargetPlatform.macOS;

    String title = t.home.titles.browse;
    if (path?.isNotEmpty ?? false) {
      title += ': $path';
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
                centerTitle: cupertino,
                titlePadding: EdgeInsetsDirectional.only(
                  start: cupertino ? 0 : 16,
                  bottom: 16
                ),
              ),
              actions: const [
                SyncingButton(),
              ],
            ),
            if (children != null && (path != null || children!.directories.isNotEmpty))
              GridFolders(
                isAtRoot: path == null,
                folders: [
                  for (String directoryPath in children!.directories)
                    directoryPath,
                ],
                onTap: onDirectoryTap,
              ),
            if (children == null || children!.isEmpty) ...[
              const SliverSafeArea(
                sliver: SliverToBoxAdapter(
                  child: NoFiles(),
                ),
              ),
            ] else ...[
              SliverSafeArea(
                sliver: MasonryFiles(
                  files: [
                    for (String filePath in children?.files ?? const Iterable.empty()) "${path ?? ""}/$filePath",
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: cupertino ? const CircleBorder() : null,
        onPressed: () {
          context.push(RoutePaths.edit);
        },
        tooltip: t.home.tooltips.newNote,
        child: const AdaptiveIcon(
          icon: Icons.add,
          cupertinoIcon: CupertinoIcons.add,
        ),
      ),
    );
  }

  @override
  void dispose() {
    fileWriteSubscription?.cancel();
    super.dispose();
  }
}
