import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saber/components/home/preview_card.dart';

class MasonryFiles extends StatelessWidget {
  const MasonryFiles({
    super.key,
    required this.files,
  });

  final List<String> files;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SliverMasonryGrid.count(
      childCount: files.length,
      crossAxisCount: mediaQuery.size.width ~/ 300 + 1,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemBuilder: (context, index) => LayoutBuilder(
        builder: (context, constraints) {
          return PreviewCard(
            filePath: files[index],
            width: constraints.maxWidth,
          );
        }
      ),
    );
  }
}
