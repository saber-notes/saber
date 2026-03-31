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
import 'package:saber/components/home/syncing_button.dart';
import 'package:saber/components/home/welcome.dart';
import 'package:saber/components/theming/saber_theme.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/devils_book/components/atmosphere_overlay.dart';
import 'package:saber/devils_book/components/ritual_background.dart';
import 'package:saber/devils_book/models/loadout_manager.dart';
import 'package:saber/devils_book/sessions/session_controller.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({super.key});

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  final List<String> filePaths = [];
  var failed = false;

  final ValueNotifier<List<String>> selectedFiles = ValueNotifier([]);

  final log = Logger('RecentPage');

  /// Mitigates a bug where files got imported starting with `null/` instead of `/`.
  ///
  /// This caused them to be written to `Documents/Sabernull/...` instead of `Documents/Saber/...`.
  ///
  /// See https://github.com/saber-notes/saber/issues/996
  /// and https://github.com/saber-notes/saber/pull/977.
  void moveIncorrectlyImportedFiles() async {
    for (final filePath in stows.recentFiles.value) {
      if (filePath.startsWith('/')) continue;

      final String newFilePath;
      if (filePath.startsWith('null/')) {
        newFilePath = await FileManager.suffixFilePathToMakeItUnique(
          filePath.substring('null'.length),
        );
      } else {
        newFilePath = await FileManager.suffixFilePathToMakeItUnique(
          '/$filePath',
        );
      }

      log.warning(
        'Found incorrectly imported file at `$filePath`; moving to `$newFilePath`',
      );
      await FileManager.moveFile(filePath, newFilePath);
    }
  }

  @override
  void initState() {
    findRecentlyAccessedNotes();
    fileWriteSubscription = FileManager.fileWriteStream.stream.listen(
      fileWriteListener,
    );
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

  StreamSubscription? fileWriteSubscription;
  void fileWriteListener(FileOperation event) {
    findRecentlyAccessedNotes(fromFileListener: true);
  }

  void _setState() => setState(() {});

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
    final platform = Theme.of(context).platform;
    final crossAxisCount = MediaQuery.sizeOf(context).width ~/ 300 + 1;

    return ListenableBuilder(
      listenable: Listenable.merge([LoadoutManager(), SessionController()]),
      builder: (context, _) {
        final loadout = LoadoutManager().currentLoadout;
        final theme = loadout.theme;
        final intensity = SessionController().getSessionIntensity();
        const ritualGold = Color(0xFFD4AF37);
        const ritualObsidian = Color(0xFF070707);

        return Stack(
          children: [
            RitualBackground(theme: theme, intensity: intensity),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: RefreshIndicator(
                onRefresh: () => Future.wait([
                  findRecentlyAccessedNotes(),
                  Future.delayed(const Duration(milliseconds: 500)),
                ]),
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(bottom: 8),
                      sliver: SliverAppBar(
                        collapsedHeight: kToolbarHeight,
                        expandedHeight: 180,
                        pinned: true,
                        backgroundColor: ritualObsidian,
                        shape: const Border(bottom: BorderSide(color: ritualGold, width: 1.0)),
                        flexibleSpace: FlexibleSpaceBar(
                          title: Text(
                            t.home.titles.home.toUpperCase(),
                            style: const TextStyle(
                              color: ritualGold,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 4.0,
                            ),
                          ),
                          centerTitle: false,
                          background: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [ritualObsidian, ritualObsidian.withValues(alpha: 0.8), Colors.transparent],
                                  ),
                                ),
                              ),
                              Center(
                                child: Icon(
                                  Icons.history_edu,
                                  size: 100,
                                  color: ritualGold.withValues(alpha: 0.05),
                                ),
                              ),
                            ],
                          ),
                          titlePadding: const EdgeInsetsDirectional.only(
                            start: 16,
                            bottom: 16,
                          ),
                        ),
                        actions: const [SyncingButton(), SizedBox(width: 8)],
                      ),
                    ),
                    if (failed) ...[
                      const SliverSafeArea(
                        sliver: SliverToBoxAdapter(child: Welcome()),
                      ),
                    ] else ...[
                      SliverSafeArea(
                        minimum: const EdgeInsets.only(
                          // Allow space for the FloatingActionButton
                          bottom: 70,
                        ),
                        sliver: MasonryFiles(
                          crossAxisCount: crossAxisCount,
                          files: [for (final filePath in filePaths) filePath],
                          selectedFiles: selectedFiles,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              floatingActionButton: NewNoteButton(cupertino: platform.isCupertino),
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
                        icon: const Icon(Icons.delete_forever, color: Color(0xFFD32F2F)), // Ritual Scarlet for destruction
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
