import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saber/components/home/banner_ad_widget.dart';
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
    if (AdState.adsEnabled) {
      int numAds = 0;
      for (int i = itemsBeforeAd; i < files.length; i += itemsBeforeAd) {
        files.insert(i, null);
        numAds++;
      }
      if (numAds == 0) {
        // insert an ad at the end if there are no ads
        files.add(null);
      }
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverMasonryGrid.count(
        childCount: files.length,
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemBuilder: (context, index) {
          if (index >= files.length) {
            return const SizedBox.shrink();
          }

          final file = files[index];
          if (file == null) { // ad
            return const BannerAdWidget(
              adSize: AdSize(
                width: 300,
                height: 450,
              ),
            );
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
