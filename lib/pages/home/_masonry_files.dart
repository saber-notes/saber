
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import 'package:saber/data/routes.dart';

class MasonryFiles extends StatelessWidget {
  const MasonryFiles({
    Key? key,
    required this.files,
    this.physics = const AlwaysScrollableScrollPhysics(),
  }) : super(key: key);

  final List<String> files;
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (context, constraints) => MasonryGridView.count(
        itemCount: files.length,
        crossAxisCount: constraints.maxWidth ~/ 300 + 1,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        physics: physics,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () { context.push("${RoutePaths.edit}?path=/example/path/to/note-$index"); },
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: (100.0 * index) % 500 + 100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    Text("Note $index"),
                    const SizedBox(height: 10),
                    Text(files[index]),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}