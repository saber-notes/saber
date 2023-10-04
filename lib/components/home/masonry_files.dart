import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saber/components/home/banner_ad_widget.dart';
import 'package:saber/components/home/preview_card.dart';

class MasonryFiles extends StatefulWidget {
  const MasonryFiles({
    super.key,
    required this.files,
    required this.crossAxisCount,
    required this.setSelectedFiles,
  });

  @override
  State<MasonryFiles> createState() => _MasonryFilesState();

  final List<String> files;
  final int crossAxisCount;

  /// The number of files to display before showing an ad.
  final int itemsBeforeAd = 5;
  
  final void Function(List<String>) setSelectedFiles;

}

class _MasonryFilesState extends State<MasonryFiles> {
  List<String> selectedFiles = [];
  ValueNotifier<bool> isAnythingSelected = ValueNotifier(false);

  void toggleSelection(String filepath, bool selected) {
    if(selected) {
      selectedFiles.add(filepath);
    } else {
      selectedFiles.remove(filepath);
    }
    isAnythingSelected.value = selectedFiles.isNotEmpty;
    widget.setSelectedFiles(selectedFiles);
  }

  @override
  Widget build(BuildContext context) {
    /// List of file paths with ads inserted every [itemsBeforeAd] items
    /// (ads are represented by null).
    final List<String?> files = List.from(widget.files);
    if (AdState.adsEnabled) {
      int numAds = 0;
      for (int i = widget.itemsBeforeAd; i < files.length; i += widget.itemsBeforeAd) {
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
        crossAxisCount: widget.crossAxisCount,
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
            return ValueListenableBuilder(
              valueListenable: isAnythingSelected,
              builder: (context, isAnythingSelected, _) {
                return PreviewCard(
                  filePath: file,
                  toggleSelection: toggleSelection,
                  selected: selectedFiles.contains(file),
                  isAnythingSelected: isAnythingSelected,
                );
              }
            );
          }
        },
      ),
    );
  }
}
