
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import 'package:saber/data/routes.dart';
import 'package:saber/pages/home/_masonry_files.dart';

class RecentPage extends StatelessWidget {
  const RecentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: const Text("Recent notes"),
      ),
      body: MasonryFiles(
        files: [
          for (int i = 0; i < 30; ++i) "This is example note $i",
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("${RoutePaths.edit}?path=/new-note");
        },
        tooltip: "New note",
        child: const Icon(Icons.add),
      ),
    );
  }
}
