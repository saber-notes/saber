import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/home/syncing_button.dart';

import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/components/home/masonry_files.dart';
import 'package:saber/components/home/welcome.dart';
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
    FileManager.writeWatcher.addListener(findRecentlyAccessedNotes);

    super.initState();
  }

  Future findRecentlyAccessedNotes() async {
    if (!mounted) return;
    List<String> children = await FileManager.getRecentlyAccessed();
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
    final appBarCentered = platform == TargetPlatform.iOS
        || platform == TargetPlatform.macOS;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: kToolbarHeight,
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                t.home.titles.home,
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
            [
              failed ? const Welcome() : MasonryFiles(
                files: [
                  for (String filePath in filePaths) filePath,
                ],
              ),
            ],
            addRepaintBoundaries: !failed,
          )),
        ],
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
    FileManager.writeWatcher.removeListener(findRecentlyAccessedNotes);
    super.dispose();
  }
}
