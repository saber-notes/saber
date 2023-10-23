import 'dart:async';

import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/home/masonry_files.dart';
import 'package:saber/components/home/move_note_button.dart';
import 'package:saber/components/home/new_note_button.dart';
import 'package:saber/components/home/rename_note_button.dart';
import 'package:saber/components/home/syncing_button.dart';
import 'package:saber/components/home/welcome.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({super.key});

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  final List<String> filePaths = [];
  bool failed = false;

  final ValueNotifier<List<String>> selectedFiles = ValueNotifier([]);

  @override
  void initState() {
    findRecentlyAccessedNotes();
    fileWriteSubscription = FileManager.fileWriteStream.stream.listen(fileWriteListener);

    super.initState();
  }

  StreamSubscription? fileWriteSubscription;
  void fileWriteListener(FileOperation event) {
    findRecentlyAccessedNotes(fromFileListener: true);
  }

  Future findRecentlyAccessedNotes({bool fromFileListener = false}) async {
    if (!mounted) return;

    if (fromFileListener) {
      // don't refresh if we're not on the home page
      final location = GoRouterState.of(context).uri.toString();
      if (!location.startsWith(RoutePaths.prefixOfHome)) return;
    }

    final children = await FileManager.getRecentlyAccessed();
    filePaths.clear();
    if (children.isEmpty) {
      failed = true;
    } else {
      failed = false;
      filePaths.addAll(children);
    }

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final platform = Theme.of(context).platform;
    final cupertino = platform == TargetPlatform.iOS
        || platform == TargetPlatform.macOS;
    final crossAxisCount = MediaQuery.of(context).size.width ~/ 300 + 1;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.wait([
          findRecentlyAccessedNotes(),
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
                    t.home.titles.home,
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
            if (failed) ...[
              const SliverSafeArea(
                sliver: SliverToBoxAdapter(
                  child: Welcome(),
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
                    for (String filePath in filePaths) filePath,
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
              ),
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
