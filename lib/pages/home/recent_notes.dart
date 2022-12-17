
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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: Text(t.home.titles.home),
        actions: const [
          SyncingButton(),
        ],
      ),
      body: failed ? const Welcome() : MasonryFiles(
        files: [
          for (String filePath in filePaths) filePath,
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
