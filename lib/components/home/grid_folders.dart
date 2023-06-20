import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/data/extensions/list_extensions.dart';

class GridFolders extends StatelessWidget {
  const GridFolders({
    super.key,
    required this.isAtRoot,
    required this.folders,
    required this.onTap,
    required this.crossAxisCount,
  });

  final bool isAtRoot;
  final List<String> folders;
  final Function(String) onTap;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    /// The cards that come before the actual folders
    final extraCards = <FolderCardType>[
      if (!isAtRoot) FolderCardType.backFolder,
      // todo: implement new folder button
      // FolderCardType.NewFolder,
    ];

    return SliverAlignedGrid.count(
      itemCount: folders.length + extraCards.length,
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 10,
      itemBuilder: (context, index) {
        final cardType = extraCards.get(index, FolderCardType.realFolder);
        return Card(
          child: InkWell(
            onTap: () {
              switch (cardType) {
                case FolderCardType.newFolder:
                  // todo: new folder prompt
                  break;
                case FolderCardType.backFolder:
                  onTap('..');
                case FolderCardType.realFolder:
                  onTap(folders[index - extraCards.length]);
              }
            },
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  switch (cardType) {
                    FolderCardType.backFolder => const AdaptiveIcon(
                      icon: Icons.folder_open,
                      cupertinoIcon: CupertinoIcons.folder_open,
                      size: 50,
                    ),
                    FolderCardType.newFolder => const AdaptiveIcon(
                      icon: Icons.create_new_folder,
                      cupertinoIcon: CupertinoIcons.folder_fill_badge_plus,
                      size: 50,
                    ),
                    FolderCardType.realFolder => const AdaptiveIcon(
                      icon: Icons.folder,
                      cupertinoIcon: CupertinoIcons.folder_fill,
                      size: 50,
                    ),
                  },

                  const SizedBox(height: 8),

                  switch (cardType) {
                    FolderCardType.backFolder => const Icon(Icons.arrow_back),
                    FolderCardType.newFolder => const Icon(Icons.add),
                    FolderCardType.realFolder => Text(folders[index - extraCards.length]),
                  },
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

enum FolderCardType {
  backFolder,
  newFolder,
  realFolder;
}
