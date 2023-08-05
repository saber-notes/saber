import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/home/masonry_files.dart';
import 'package:saber/components/home/syncing_button.dart';
import 'package:saber/components/home/welcome.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/i18n/strings.g.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({super.key});

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  final List<String> filePaths = [];
  bool failed = false;

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
    var isDialOpen = ValueNotifier<bool>(false);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.wait([
          findRecentlyAccessedNotes(),
          Future.delayed(const Duration(milliseconds: 500)),
        ]),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
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
                ),
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        spacing: 3,
        mini: true,
        openCloseDial: isDialOpen,
        childPadding: const EdgeInsets.all(5),
        spaceBetweenChildren: 4,
        dialRoot: (ctx, open, toggleChildren) {
          return FloatingActionButton(
            shape: cupertino ? const CircleBorder() : null,
            onPressed: toggleChildren,
            tooltip: t.home.tooltips.newNote,
            child: const Icon(Icons.add)
          );
        },
        children: [
          SpeedDialChild(
            child: const Icon(Icons.create),
            label: t.home.create.newNote,
            onTap: () => context.push(RoutePaths.edit),
          ),
          SpeedDialChild(
            child: const Icon(Icons.note_add),
            label: t.home.create.importNote,
            onTap: () async {
              final result = await FilePicker.platform.pickFiles(
                type: FileType.any,

                allowMultiple: false,
                withData: false,
              );
              if (result == null) return;

              final filePath = result.files.single.path;
              if (filePath == null) return;

              if (filePath.endsWith('.sbn')) {
                FileManager.importFile(filePath, true);
              } else if (filePath.endsWith('.sbn2')) {
                FileManager.importFile(filePath, false);
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(t.home.invalidFormat),
                  ));
                }
              }        
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    fileWriteSubscription?.cancel();
    super.dispose();
  }
}
