import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saber/components/home/preview_card.dart';
import 'package:saber/data/extensions/change_notifier_extensions.dart';
import 'package:saber/data/prefs.dart';

class MasonryFiles extends StatefulWidget {
  const MasonryFiles({
    super.key,
    required this.files,
    required this.selectedFiles,
    required this.crossAxisCount,
  });

  final List<String> files;
  final int crossAxisCount;
  final ValueNotifier<List<String>> selectedFiles;

  @override
  State<MasonryFiles> createState() => _MasonryFilesState();
}

class _MasonryFilesState extends State<MasonryFiles> {
  final ValueNotifier<bool> isAnythingSelected = ValueNotifier(false);

  void toggleSelection(String filePath, bool selected) {
    if (selected) {
      widget.selectedFiles.value.add(filePath);
    } else {
      widget.selectedFiles.value.remove(filePath);
    }
    isAnythingSelected.value = widget.selectedFiles.value.isNotEmpty;
    widget.selectedFiles.notifyListenersPlease();
  }

  Widget itemBuilder(BuildContext context, int index) {
    if (index >= widget.files.length) {
      return const SizedBox.shrink();
    }

    final file = widget.files[index];
    return ValueListenableBuilder(
      valueListenable: isAnythingSelected,
      builder: (context, isAnythingSelected, _) {
        return Align(
          alignment: .bottomCenter,
          child: PreviewCard(
            filePath: file,
            toggleSelection: toggleSelection,
            selected: widget.selectedFiles.value.contains(file),
            isAnythingSelected: isAnythingSelected,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    isAnythingSelected.value = widget.selectedFiles.value.isNotEmpty;

    return SliverPadding(
      padding: const .symmetric(horizontal: 16, vertical: 8),
      sliver: stows.simplifiedHomeLayout.value
          ? SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.crossAxisCount,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                // This aspect ratio was chosen to fit an A4 page and
                // two lines for the title.
                childAspectRatio: 0.60,
              ),
              itemCount: widget.files.length,
              itemBuilder: itemBuilder,
            )
          : SliverMasonryGrid.count(
              crossAxisCount: widget.crossAxisCount,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childCount: widget.files.length,
              itemBuilder: itemBuilder,
            ),
    );
  }
}
