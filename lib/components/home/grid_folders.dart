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
  });

  final bool isAtRoot;
  final List<String> folders;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    /// The cards that come before the actual folders
    final extraCards = <FolderCardType>[
      if (!isAtRoot) FolderCardType.BackFolder,
      FolderCardType.NewFolder,
    ];

    return SliverAlignedGrid.count(
      itemCount: folders.length + extraCards.length,
      crossAxisCount: mediaQuery.size.width ~/ 150 + 1,
      mainAxisSpacing: 10,
      itemBuilder: (context, index) {
        final cardType = extraCards.get(index, FolderCardType.RealFolder);
        return Card(
          child: InkWell(
            onTap: () {
              switch (cardType) {
                case FolderCardType.NewFolder:
                  // todo: new folder prompt
                  break;
                case FolderCardType.BackFolder:
                  onTap('..');
                case FolderCardType.RealFolder:
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
                    FolderCardType.BackFolder => const AdaptiveIcon(
                      icon: Icons.folder_open,
                      cupertinoIcon: CupertinoIcons.folder_open,
                      size: 50,
                    ),
                    FolderCardType.NewFolder => const AdaptiveIcon(
                      icon: Icons.create_new_folder,
                      cupertinoIcon: CupertinoIcons.folder_fill_badge_plus,
                      size: 50,
                    ),
                    FolderCardType.RealFolder => const AdaptiveIcon(
                      icon: Icons.folder,
                      cupertinoIcon: CupertinoIcons.folder_fill,
                      size: 50,
                    ),
                  },

                  const SizedBox(height: 8),

                  switch (cardType) {
                    FolderCardType.BackFolder => const Icon(Icons.arrow_back),
                    FolderCardType.NewFolder => const Icon(Icons.add),
                    FolderCardType.RealFolder => Text(folders[index - extraCards.length]),
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
  BackFolder,
  NewFolder,
  RealFolder;
}
