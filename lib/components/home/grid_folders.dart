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
    final extraCards = <_FolderCardType>[
      if (!isAtRoot) _FolderCardType.backFolder,
      _FolderCardType.newFolder,
    ];

    return SliverAlignedGrid.count(
      itemCount: folders.length + extraCards.length,
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 10,
      itemBuilder: (context, index) {
        final cardType = extraCards.get(index, _FolderCardType.realFolder);
        return _GridFolder(
          cardType: cardType,
          folder: cardType == _FolderCardType.realFolder
              ? folders[index - extraCards.length]
              : null,
          createFolder: createFolder,
          doesFolderExist: doesFolderExist,
          onTap: onTap,
        );
      },
    );
  }
}

class _GridFolder extends StatelessWidget {
  const _GridFolder({
    // ignore: unused_element
    super.key,
    required this.cardType,
    required this.folder,
    required this.createFolder,
    required this.doesFolderExist,
    required this.onTap,
  })  : assert((folder == null) ^ (cardType == _FolderCardType.realFolder));

  final _FolderCardType cardType;
  final String? folder;
  final void Function(String) createFolder;
  final bool Function(String) doesFolderExist;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: switch (cardType) {
        _FolderCardType.backFolder => t.home.backFolder,
        _FolderCardType.newFolder => t.home.newFolder.newFolder,
        _FolderCardType.realFolder => folder!,
      },
      waitDuration: const Duration(milliseconds: 500),
      child: Card(
        child: InkWell(
          onTap: () {
            switch (cardType) {
              case _FolderCardType.newFolder:
                showDialog(
                  context: context,
                  builder: (context) => NewFolderDialog(
                    createFolder: createFolder,
                    doesFolderExist: doesFolderExist,
                  ),
                );
              case _FolderCardType.backFolder:
                onTap('..');
              case _FolderCardType.realFolder:
                onTap(folder!);
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
                    _FolderCardType.backFolder => Icons.folder_open,
                    _FolderCardType.newFolder => Icons.create_new_folder,
                    _FolderCardType.realFolder => Icons.folder,
                  },
                  cupertinoIcon: switch (cardType) {
                    _FolderCardType.backFolder => CupertinoIcons.folder_open,
                    _FolderCardType.newFolder => CupertinoIcons.folder_fill_badge_plus,
                    _FolderCardType.realFolder => CupertinoIcons.folder_fill,
                  },
                  size: 50,
                ),
    
                const SizedBox(height: 8),
    
                switch (cardType) {
                  _FolderCardType.backFolder => const Icon(Icons.arrow_back),
                  _FolderCardType.newFolder => Text(t.home.newFolder.newFolder),
                  _FolderCardType.realFolder => Text(folder!),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum _FolderCardType {
  backFolder,
  newFolder,
  realFolder;
}
