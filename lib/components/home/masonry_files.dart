
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saber/components/home/preview_card.dart';
import 'package:saber/pages/editor/editor.dart';

class MasonryFiles extends StatelessWidget {
  MasonryFiles({
    super.key,
    required List<String> files,
    required this.onTap,
    this.physics = const AlwaysScrollableScrollPhysics(),
  }) : files = files.where((path) => !Editor.reservedFileNames.contains(path)).toList();

  final List<String> files;
  final Function(String) onTap;
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => MasonryGridView.count(
        itemCount: files.length,
        crossAxisCount: constraints.maxWidth ~/ 300 + 1,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        physics: physics,
        itemBuilder: (context, index) => PreviewCard(
          filePath: files[index],
          onTap: onTap,
        ),
      ),
    );
  }
}