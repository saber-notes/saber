
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/canvas/canvas_preview.dart';
import 'package:saber/components/home/preview_card.dart';

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
        itemBuilder: (context, index) => PreviewCard(
          filePath: files[index],
          onTap: onTap
        ),
      ),
    );
  }
}