
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/pages/home/_grid_folders.dart';
import '_masonry_files.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: const Text("Browse"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridFolders(
              folders: [
                for (int i = 0; i < 4; ++i) "This is example folder $i",
              ],
              physics: const NeverScrollableScrollPhysics(),
            ),
            MasonryFiles(
              files: [
                for (int i = 0; i < 30; ++i) "Browsed to example note $i",
              ],
              physics: const NeverScrollableScrollPhysics(),
            ),
          ]
        )
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
