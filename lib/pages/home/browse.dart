
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/data/routes.dart';

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
      body: const Center(
        child: Text("Browse"),
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
