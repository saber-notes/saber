
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/data/routes.dart';

class RecentNotes extends StatelessWidget {
  const RecentNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return ResponsiveNavbar(
      body: Scaffold(
        appBar: AppBar(
          toolbarHeight: kToolbarHeight,
          title: const Text("Recent notes"),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => MasonryGridView.count(
            itemCount: 30,
            crossAxisCount: constraints.maxWidth ~/ 300 + 1,
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Card(
                child: InkWell(
                  onTap: () { context.go("${RoutePaths.edit}?path=example/path/to/note-$index"); },
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: (100.0 * index) % 500 + 100,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10),
                        Text("Note $index"),
                        const SizedBox(height: 10),
                        Text("This is an example note"),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      )
    );
  }
}
