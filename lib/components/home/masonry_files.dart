import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saber/components/home/preview_card.dart';

class MasonryFiles extends StatelessWidget {
  const MasonryFiles({
    super.key,
    required this.files,
    required this.crossAxisCount,
  });

  final List<String> files;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverMasonryGrid.count(
        childCount: files.length,
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          if (index >= files.length) {
            return const SizedBox.shrink();
          }
          return PreviewCard(
            filePath: files[index],
          );
        },
      ),
    );
  }
}
