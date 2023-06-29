import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saber/components/home/native_ad_widget.dart';
import 'package:saber/components/home/preview_card.dart';

class MasonryFiles extends StatelessWidget {
  const MasonryFiles({
    super.key,
    required this.files,
    required this.crossAxisCount,
  });

  final List<String> files;
  final int crossAxisCount;

  /// The number of files to display before showing an ad.
  static const int itemsBeforeAd = 5;

  @override
  Widget build(BuildContext context) {
    /// List of file paths with ads inserted every [itemsBeforeAd] items
    /// (ads are represented by null).
    final List<String?> files = List.from(this.files);
    for (int i = itemsBeforeAd; i < files.length; i += itemsBeforeAd) {
      files.insert(i, null);
    }

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

          final file = files[index];
          if (file == null) { // ad
            return const NativeAdWidget();
          } else {
            return PreviewCard(
              filePath: file,
            );
          }
        },
      ),
    );
  }
}
