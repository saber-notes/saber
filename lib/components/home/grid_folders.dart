import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saber/components/home/new_folder_dialog.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/data/extensions/list_extensions.dart';
import 'package:saber/i18n/strings.g.dart';

class GridFolders extends StatelessWidget {
  const GridFolders({
    super.key,
    required this.isAtRoot,
    required this.onTap,
    required this.crossAxisCount,
    required this.createFolder,
    required this.doesFolderExist,
    required this.folders,
  });

  final bool isAtRoot;
  final Function(String) onTap;
  final int crossAxisCount;

  final void Function(String) createFolder;
  final bool Function(String) doesFolderExist;

  final List<String> folders;

  @override
  Widget build(BuildContext context) {
    /// The cards that come before the actual folders
    final extraCards = <FolderCardType>[
      if (!isAtRoot) FolderCardType.backFolder,
      FolderCardType.newFolder,
    ];

    return SliverAlignedGrid.count(
      itemCount: folders.length + extraCards.length,
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 10,
      itemBuilder: (context, index) {
        final cardType = extraCards.get(index, FolderCardType.realFolder);
        return Tooltip(
          message: switch (cardType) {
            FolderCardType.backFolder => t.home.backFolder,
            FolderCardType.newFolder => t.home.newFolder.newFolder,
            FolderCardType.realFolder => folders[index - extraCards.length],
          },
          waitDuration: const Duration(milliseconds: 500),
          child: Card(
            child: InkWell(
              onTap: () {
                switch (cardType) {
                  case FolderCardType.newFolder:
                    showDialog(
                      context: context,
                      builder: (context) => NewFolderDialog(
                        createFolder: createFolder,
                        doesFolderExist: doesFolderExist,
                      ),
                    );
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
                    AdaptiveIcon(
                      icon: switch (cardType) {
                        FolderCardType.backFolder => Icons.folder_open,
                        FolderCardType.newFolder => Icons.create_new_folder,
                        FolderCardType.realFolder => Icons.folder,
                      },
                      cupertinoIcon: switch (cardType) {
                        FolderCardType.backFolder => CupertinoIcons.folder_open,
                        FolderCardType.newFolder => CupertinoIcons.folder_fill_badge_plus,
                        FolderCardType.realFolder => CupertinoIcons.folder_fill,
                      },
                      size: 50,
                    ),
        
                    const SizedBox(height: 8),
        
                    switch (cardType) {
                      FolderCardType.backFolder => const Icon(Icons.arrow_back),
                      FolderCardType.newFolder => Text(t.home.newFolder.newFolder),
                      FolderCardType.realFolder => Text(folders[index - extraCards.length]),
                    },
                  ],
                ),
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
