import 'dart:async';

import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:saber/components/home/export_note_button.dart';
import 'package:saber/components/home/masonry_files.dart';
import 'package:saber/components/home/move_note_button.dart';
import 'package:saber/components/home/new_note_button.dart';
import 'package:saber/components/home/rename_note_button.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> filePaths = [];
  List<String> filteredFiles = [];
  bool failed = false;

  ValueNotifier<List<String>> selectedFiles = ValueNotifier([]);
  final log = Logger('SearchPage');

  /// Mitigates a bug where files got imported starting with `null/` instead of `/`.
  ///
  /// This caused them to be written to `Documents/Sabernull/...` instead of `Documents/Saber/...`.
  ///
  /// See https://github.com/saber-notes/saber/issues/996
  /// and https://github.com/saber-notes/saber/pull/977.
  void moveIncorrectlyImportedFiles() async {
    for (final filePath in Prefs.recentFiles.value) {
      if (filePath.startsWith('/')) continue;

      final String newFilePath;
      if (filePath.startsWith('null/')) {
        newFilePath = await FileManager.suffixFilePathToMakeItUnique(
            filePath.substring('null'.length));
      } else {
        newFilePath =
        await FileManager.suffixFilePathToMakeItUnique('/$filePath');
      }

      log.warning(
          'Found incorrectly imported file at `$filePath`; moving to `$newFilePath`');
      await FileManager.moveFile(filePath, newFilePath);
    }
  }

  @override
  void initState() {
    findAllNotes();
    fileWriteSubscription =
        FileManager.fileWriteStream.stream.listen(fileWriteListener);
    selectedFiles.addListener(_setState);

    super.initState();
    moveIncorrectlyImportedFiles();
  }

  @override
  void dispose() {
    selectedFiles.removeListener(_setState);
    fileWriteSubscription?.cancel();
    super.dispose();
  }

  void filterFiles(String search) {
    if (search== '') {
      filteredFiles = filePaths;
    }
    search = search.toLowerCase();
    filteredFiles = filePaths.where((file) => file.toLowerCase().contains(search)).toList();
  }

  StreamSubscription? fileWriteSubscription;
  void fileWriteListener(FileOperation event) {
    findAllNotes(fromFileListener: true);
  }

  void _setState() => setState(() {});

  Future findAllNotes({bool fromFileListener = false}) async {
    if (!mounted) return;

    if (fromFileListener) {
      // don't refresh if we're not on the home page
      final location = GoRouterState.of(context).uri.toString();
      if (!location.startsWith(RoutePaths.prefixOfHome)) return;
    }

    final children = await FileManager.getAllFiles();
    filePaths.clear();
    if (children.isEmpty) {
      failed = true;
    } else {
      failed = false;
      filePaths.addAll(children);
      filteredFiles = filePaths;
    }

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final cupertino =
        platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;
    final crossAxisCount = MediaQuery.sizeOf(context).width ~/ 300 + 1;
    return Scaffold(
        body: RefreshIndicator(
            onRefresh: () => Future.wait(
                [Future.delayed(const Duration(milliseconds: 500))]),
            child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.only(
                    bottom: 8,
                    ),
                  sliver: SliverAppBar(
                    toolbarHeight: 70,
                      title: Center(
                        child: SearchBar(
                          keyboardType: TextInputType.text,
                          hintText: t.home.titles.search,
                          onChanged: (value) {
                            setState(() {
                              filterFiles(value);
                            });
                          },
                        ),
                      )
                  )
              ),
                  SliverSafeArea(
                    minimum: const EdgeInsets.only(
                      bottom: 70
                    ),
                    sliver: MasonryFiles(
                      crossAxisCount: crossAxisCount,
                      files: [
                        for (String filePath in filteredFiles) filePath,
                      ],
                      selectedFiles: selectedFiles,
                    ),
                  )
            ]
            )
        ),floatingActionButton: NewNoteButton(
      cupertino: cupertino,
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
              for (String filePath in selectedFiles.value)
                FileManager.doesFileExist(
                    filePath + Editor.extensionOldJson)
                    .then((oldExtension) => FileManager.deleteFile(
                    filePath +
                        (oldExtension
                            ? Editor.extensionOldJson
                            : Editor.extension))),
            ]);
            selectedFiles.value = [];
          },
          icon: const Icon(Icons.delete_forever),
        ),
        ExportNoteButton(
          selectedFiles: selectedFiles.value,
        ),
      ],
    );
  }
}
