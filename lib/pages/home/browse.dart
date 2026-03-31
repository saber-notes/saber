import 'dart:async';

import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as p;
import 'package:saber/components/home/export_note_button.dart';
import 'package:saber/components/home/grid_folders.dart';
import 'package:saber/components/home/masonry_files.dart';
import 'package:saber/components/home/move_note_button.dart';
import 'package:saber/components/home/new_note_button.dart';
import 'package:saber/components/home/no_files.dart';
import 'package:saber/components/home/path_components.dart';
import 'package:saber/components/home/rename_note_button.dart';
import 'package:saber/components/home/syncing_button.dart';
import 'package:saber/components/theming/saber_theme.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:saber/devils_book/components/atmosphere_overlay.dart';
import 'package:saber/devils_book/components/ritual_background.dart';
import 'package:saber/devils_book/sessions/session_controller.dart';
import 'package:saber/devils_book/models/loadout_manager.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key, String? path}) : initialPath = path;

  final String? initialPath;

  @visibleForTesting
  static DirectoryChildren? overrideChildren;

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  DirectoryChildren? children;

  String? path;

  final ValueNotifier<List<String>> selectedFiles = ValueNotifier([]);

  @override
  void initState() {
    path = widget.initialPath;

    findChildrenOfPath();
    fileWriteSubscription = FileManager.fileWriteStream.stream.listen(
      fileWriteListener,
    );
    selectedFiles.addListener(_setState);

    super.initState();
  }

  @override
  void dispose() {
    selectedFiles.removeListener(_setState);
    fileWriteSubscription?.cancel();
    super.dispose();
  }

  StreamSubscription? fileWriteSubscription;
  void fileWriteListener(FileOperation event) {
    if (!event.filePath.startsWith(path ?? '/')) return;
    findChildrenOfPath(fromFileListener: true);
  }

  void _setState() => setState(() {});

  Future findChildrenOfPath({bool fromFileListener = false}) async {
    if (!mounted) return;

    if (fromFileListener) {
      // don't refresh if we're not on the home page
      final location = GoRouterState.of(context).uri.toString();
      if (!location.startsWith(RoutePaths.prefixOfHome)) return;
    }

    children =
        BrowsePage.overrideChildren ??
        await FileManager.getChildrenOfDirectory(path ?? '/');

    if (mounted) setState(() {});
  }

  void onDirectoryTap(String folder) {
    selectedFiles.value = [];
    if (folder == '..') {
      path = p.dirname(path ?? '/');
      if (path == '/') path = null;
    } else {
      path = p.join(path ?? '/', folder);
    }
    context.go(HomeRoutes.browseFilePath(path ?? '/'));
    findChildrenOfPath();
  }

  void onPathComponentTap(String? newPath) {
    selectedFiles.value = [];
    if (newPath == null || newPath.isEmpty || newPath == '/') {
      newPath = null;
    }
    path = newPath;
    context.go(HomeRoutes.browseFilePath(path ?? '/'));
    findChildrenOfPath();
  }

  Future<void> createFolder(String folderName) async {
    final folderPath = '${path ?? ''}/$folderName';
    await FileManager.createFolder(folderPath);
    findChildrenOfPath();
  }

  PreferredSizeWidget appBar() {
    const ritualGold = Color(0xFFD4AF37);
    const ritualObsidian = Color(0xFF070707);

    return AppBar(
      collapsedHeight: kToolbarHeight,
      toolbarHeight: 180,
      backgroundColor: ritualObsidian,
      shape: const Border(bottom: BorderSide(color: ritualGold, width: 1.0)),
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'GRIMOIRE',
          style: TextStyle(
              color: ritualGold,
              fontWeight: FontWeight.w900,
              letterSpacing: 4.0),
        ),
        centerTitle: false,
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [ritualObsidian, ritualObsidian.withOpacity(0.8), Colors.transparent],
            ),
          ),
          child: Center(
            child: Icon(
              Icons.auto_stories,
              size: 100,
              color: ritualGold.withOpacity(0.05),
            ),
          ),
        ),
        titlePadding: const EdgeInsetsDirectional.only(
          start: 16,
          bottom: 16,
        ),
      ),
      actions: const [SyncingButton(), SizedBox(width: 8)],
    );
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final crossAxisCount = MediaQuery.sizeOf(context).width ~/ 300 + 1;

    return ListenableBuilder(
      listenable: Listenable.merge([LoadoutManager(), SessionController()]),
      builder: (context, _) {
        final loadout = LoadoutManager().currentLoadout;
        final theme = loadout.theme;
        final intensity = SessionController().getSessionIntensity();

        return Stack(
          children: [
            RitualBackground(theme: theme, intensity: intensity),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: appBar(),
              body: RefreshIndicator(
                onRefresh: () => Future.wait([
                  findChildrenOfPath(),
                  Future.delayed(const Duration(milliseconds: 500)),
                ]),
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      collapsedHeight: kToolbarHeight,
                      expandedHeight: 180,
                      pinned: true,
                      scrolledUnderElevation: 1,
                      backgroundColor: ritualObsidian,
                      shape: const Border(bottom: BorderSide(color: ritualGold, width: 1.0)),
                      flexibleSpace: FlexibleSpaceBar(
                        title: const Text(
                          'GRIMOIRE',
                          style: TextStyle(
                              color: ritualGold,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 4.0),
                        ),
                        centerTitle: false,
                        background: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [ritualObsidian, ritualObsidian.withOpacity(0.8), Colors.transparent],
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.auto_stories,
                              size: 100,
                              color: ritualGold.withOpacity(0.05),
                            ),
                          ),
                        ),
                        titlePadding: const EdgeInsetsDirectional.only(
                          start: 16,
                          bottom: 16,
                        ),
                      ),
                      actions: const [SyncingButton(), SizedBox(width: 8)],
                    ),
                    SliverToBoxAdapter(
                      child: PathComponents(
                        path,
                        onPathComponentTap: onPathComponentTap,
                      ),
                    ),
                    const SliverPadding(padding: EdgeInsets.only(bottom: 16)),
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
                        final children = await FileManager.getChildrenOfDirectory(
                          folderPath,
                        );
                        return children?.isEmpty ?? true;
                      },
                      deleteFolder: (String folderName) async {
                        final folderPath = '${path ?? ''}/$folderName';
                        await FileManager.deleteDirectory(folderPath);
                        findChildrenOfPath();
                      },
                      folders: [
                        for (final directoryPath
                            in children?.directories ?? const [])
                          directoryPath,
                      ],
                    ),
                    if (children == null) ...[
                      // loading
                    ] else if (children!.isEmpty) ...[
                      const SliverSafeArea(
                        sliver: SliverToBoxAdapter(child: NoFiles()),
                      ),
                    ] else ...[
                      SliverSafeArea(
                        top: false,
                        minimum: const EdgeInsets.only(
                          top: 8,
                          // Allow space for the FloatingActionButton
                          bottom: 70,
                        ),
                        sliver: MasonryFiles(
                          crossAxisCount: crossAxisCount,
                          files: [
                            for (final filePath in children?.files ?? const [])
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
                cupertino: platform.isCupertino,
                path: path,
              ),
              persistentFooterButtons: selectedFiles.value.isEmpty
                  ? null
                  : [
                      Collapsible(
                        axis: CollapsibleAxis.vertical,
                        collapsed: selectedFiles.value.length != 1,
                        child: RenameNoteButton(
                          existingPath: selectedFiles.value.isEmpty
                              ? ''
                              : selectedFiles.value.first,
                          unselectNotes: () => selectedFiles.value = [],
                        ),
                      ),
                      MoveNoteButton(
                        filesToMove: selectedFiles.value,
                        unselectNotes: () => selectedFiles.value = [],
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        tooltip: t.home.deleteNote,
                        onPressed: () async {
                          await Future.wait([
                            for (final filePath in selectedFiles.value)
                              Future.value(
                                FileManager.doesFileExist(
                                  filePath + Editor.extensionOldJson,
                                ),
                              ).then(
                                (oldExtension) => FileManager.deleteFile(
                                  filePath +
                                      (oldExtension
                                          ? Editor.extensionOldJson
                                          : Editor.extension),
                                ),
                              ),
                          ]);
                          selectedFiles.value = [];
                        },
                        icon: const Icon(Icons.delete_forever),
                      ),
                      ExportNoteButton(selectedFiles: selectedFiles.value),
                    ],
            ),
            AtmosphereOverlay(theme: theme),
          ],
        );
      },
    );
  }
}
