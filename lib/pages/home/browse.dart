import 'dart:async';

import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/home/grid_folders.dart';
import 'package:saber/components/home/masonry_files.dart';
import 'package:saber/components/home/move_note_button.dart';
import 'package:saber/components/home/new_note_button.dart';
import 'package:saber/components/home/no_files.dart';
import 'package:saber/components/home/rename_note_button.dart';
import 'package:saber/components/home/syncing_button.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

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

  final ValueNotifier<List<String>> selectedFiles = ValueNotifier([]);

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
    findChildrenOfPath(fromFileListener: true);
  }

  Future findChildrenOfPath({bool fromFileListener = false}) async {
    if (!mounted) return;

    if (fromFileListener) {
      // don't refresh if we're not on the home page
      final location = GoRouterState.of(context).uri.toString();
      if (!location.startsWith(RoutePaths.prefixOfHome)) return;
    }

    children = await FileManager.getChildrenOfDirectory(path ?? '/');

    if (mounted) setState(() {});
  }

  void onDirectoryTap(String folder) {
    selectedFiles.value = [];
    if (folder == '..') {
      path = pathHistory.isEmpty ? null : pathHistory.removeLast();
    } else {
      pathHistory.add(path);
      path = "${path ?? ''}/$folder";
    }
    context.go(HomeRoutes.browseFilePath(path ?? '/'));
    findChildrenOfPath();
  }

  Future<void> createFolder(String folderName) async {
    final folderPath = '${path ?? ''}/$folderName';
    await FileManager.createFolder(folderPath);
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

    final crossAxisCount = MediaQuery.of(context).size.width ~/ 300 + 1;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.wait([
          findChildrenOfPath(),
          Future.delayed(const Duration(milliseconds: 500)),
        ]),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(
                bottom: 8,
              ),
              sliver: SliverAppBar(
                collapsedHeight: kToolbarHeight,
                expandedHeight: 200,
                pinned: true,
                scrolledUnderElevation: 1,
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
            ),
            GridFolders(
              isAtRoot: path?.isEmpty ?? true,
              crossAxisCount: crossAxisCount,
              onTap: onDirectoryTap,
              createFolder: createFolder,
              doesFolderExist: (String folderName) {
                return children?.directories.contains(folderName) ?? false;
              },
              renameFolder: (String oldName, String newName) async {
                final oldPath = '${path ?? ''}/$oldName';
                await FileManager.renameDirectory(oldPath, newName);
                findChildrenOfPath();
              },
              isFolderEmpty: (String folderName) async {
                final folderPath = '${path ?? ''}/$folderName';
                final children = await FileManager.getChildrenOfDirectory(folderPath);
                return children?.isEmpty ?? true;
              },
              deleteFolder: (String folderName) async {
                final folderPath = '${path ?? ''}/$folderName';
                await FileManager.deleteDirectory(folderPath);
                findChildrenOfPath();
              },
              folders: [
                for (String directoryPath in children?.directories ?? const [])
                  directoryPath,
              ],
            ),

            if (children == null) ...[
              // loading
            ] else if (children!.isEmpty) ...[
              const SliverSafeArea(
                sliver: SliverToBoxAdapter(
                  child: NoFiles(),
                ),
              ),
            ] else ...[
              SliverSafeArea(
                minimum: const EdgeInsets.only(
                  // Allow space for the FloatingActionButton
                  bottom: 70,
                ),
                sliver: MasonryFiles(
                  crossAxisCount: crossAxisCount,
                  files: [
                    for (String filePath in children?.files ?? const [])
                      "${path ?? ""}/$filePath",
                  ],
                  selectedFiles: selectedFiles,
                ),
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: NewNoteButton(
        cupertino: cupertino,
        path: path,
      ),
      persistentFooterButtons: [
        ValueListenableBuilder(
          valueListenable: selectedFiles,
          builder: (context, selectedFiles, _) {
            return Collapsible(
              axis: CollapsibleAxis.vertical,
              collapsed: selectedFiles.length != 1,
              child: RenameNoteButton(
                existingPath: selectedFiles.isEmpty
                  ? ''
                  : selectedFiles.first,
              )
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: selectedFiles,
          builder: (context, selectedFiles, _) {
            return Collapsible(
              axis: CollapsibleAxis.vertical,
              collapsed: selectedFiles.isEmpty,
              child: MoveNoteButton(
                filesToMove: selectedFiles,
              ),
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: selectedFiles,
          builder: (context, selectedFiles, child) {
            return Collapsible(
              axis: CollapsibleAxis.vertical,
              collapsed: selectedFiles.isEmpty,
              child: child!,
            );
          },
          child: IconButton(
            padding: EdgeInsets.zero,
            tooltip: t.home.deleteNote,
            onPressed: () async {
              await Future.wait([
                for (String filePath in selectedFiles.value)
                  FileManager.doesFileExist(filePath + Editor.extensionOldJson)
                    .then((oldExtension) => FileManager.deleteFile(
                      filePath + (oldExtension ? Editor.extensionOldJson : Editor.extension)
                    )),
              ]);
            },
            icon: const Icon(Icons.delete_forever),
          ),
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
