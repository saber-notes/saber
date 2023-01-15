
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
    return LayoutBuilder(
      builder: (context, constraints) => MasonryGridView.count(
        itemCount: files.length,
        crossAxisCount: constraints.maxWidth ~/ 300 + 1,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => PreviewCard(
          filePath: files[index],
        ),
      ),
    );
  }
}