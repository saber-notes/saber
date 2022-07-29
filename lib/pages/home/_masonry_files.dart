
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import 'package:saber/data/routes.dart';

class MasonryFiles extends StatelessWidget {
  const MasonryFiles({
    Key? key,
    required this.files,
    required this.onTap,
    this.physics = const AlwaysScrollableScrollPhysics(),
  }) : super(key: key);

  final List<String> files;
  final Function(String) onTap;
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
              onTap: () { onTap(files[index]); },
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.note, size: 50),
                    const SizedBox(height: 8),
                    Text(files[index].substring(files[index].lastIndexOf("/") + 1)),
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