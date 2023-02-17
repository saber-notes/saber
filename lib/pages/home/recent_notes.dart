import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/home/masonry_files.dart';
import 'package:saber/components/home/syncing_button.dart';
import 'package:saber/components/home/welcome.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
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
    findRecentlyAccessedNotes();
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
    final cupertino = platform == TargetPlatform.iOS
        || platform == TargetPlatform.macOS;
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
                sliver: MasonryFiles(
                  files: [
                    for (String filePath in filePaths) filePath,
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
