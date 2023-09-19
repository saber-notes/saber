import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saber/components/home/delete_folder_button.dart';
import 'package:saber/components/home/new_folder_dialog.dart';
import 'package:saber/components/home/rename_folder_button.dart';
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
    required this.renameFolder,
    required this.isFolderEmpty,
    required this.deleteFolder,
    required this.doesFolderExist,
    required this.folders,
  });

  final bool isAtRoot;
  final Function(String) onTap;
  final int crossAxisCount;

  final void Function(String) createFolder;
  final bool Function(String) doesFolderExist;
  final Future<void> Function(String oldName, String newName) renameFolder;
  final Future<bool> Function(String) isFolderEmpty;
  final Future<void> Function(String) deleteFolder;

  final List<String> folders;

  @override
  Widget build(BuildContext context) {
    /// The cards that come before the actual folders
    final extraCards = <_FolderCardType>[
      if (!isAtRoot) _FolderCardType.backFolder,
      _FolderCardType.newFolder,
    ];

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      sliver: SliverAlignedGrid.count(
        itemCount: folders.length + extraCards.length,
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 8,
        itemBuilder: (context, index) {
          final cardType = extraCards.get(index, _FolderCardType.realFolder);
          final folderName = cardType == _FolderCardType.realFolder
              ? folders[index - extraCards.length]
              : null;
          return _GridFolder(
            cardType: cardType,
            folderName: folderName,
            createFolder: createFolder,
            doesFolderExist: doesFolderExist,
            renameFolder: renameFolder,
            isFolderEmpty: isFolderEmpty,
            deleteFolder: deleteFolder,
            onTap: onTap,
          );
        },
      ),
    );
  }
}

class _GridFolder extends StatefulWidget {
  const _GridFolder({
    // ignore: unused_element
    super.key,
    required this.cardType,
    required this.folderName,
    required this.createFolder,
    required this.doesFolderExist,
    required this.renameFolder,
    required this.isFolderEmpty,
    required this.deleteFolder,
    required this.onTap,
  })  : assert((folderName == null) ^ (cardType == _FolderCardType.realFolder), 'Real folders must specify a folder name');

  final _FolderCardType cardType;
  final String? folderName;
  final void Function(String) createFolder;
  final bool Function(String) doesFolderExist;
  final Future<void> Function(String oldName, String newName) renameFolder;
  final Future<bool> Function(String) isFolderEmpty;
  final Future<void> Function(String) deleteFolder;
  final Function(String) onTap;

  @override
  State<_GridFolder> createState() => _GridFolderState();
}

class _GridFolderState extends State<_GridFolder> {
  ValueNotifier<bool> expanded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final cardElevatedColor = Color.alphaBlend(
      colorScheme.primary.withOpacity(0.05),
      colorScheme.surface,
    );
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (expanded.value) return;
          switch (widget.cardType) {
            case _FolderCardType.newFolder:
              showDialog(
                context: context,
                builder: (context) => NewFolderDialog(
                  createFolder: widget.createFolder,
                  doesFolderExist: widget.doesFolderExist,
                ),
              );
            case _FolderCardType.backFolder:
              widget.onTap('..');
            case _FolderCardType.realFolder:
              widget.onTap(widget.folderName!);
          }
        },
        onLongPress: widget.cardType == _FolderCardType.realFolder
            ? () => expanded.value = !expanded.value
            : null,
        onSecondaryTap: widget.cardType == _FolderCardType.realFolder
            ? () => expanded.value = !expanded.value
            : null,
        child: Card(
          color: colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Center(
                        child: Tooltip(
                          message: switch (widget.cardType) {
                            _FolderCardType.backFolder => t.home.backFolder,
                            _FolderCardType.newFolder => t.home.newFolder.newFolder,
                            _FolderCardType.realFolder => '',
                          },
                          child: AdaptiveIcon(
                            icon: switch (widget.cardType) {
                              _FolderCardType.backFolder => Icons.folder_open,
                              _FolderCardType.newFolder => Icons.create_new_folder,
                              _FolderCardType.realFolder => Icons.folder,
                            },
                            cupertinoIcon: switch (widget.cardType) {
                              _FolderCardType.backFolder => CupertinoIcons.folder_open,
                              _FolderCardType.newFolder => CupertinoIcons.folder_fill_badge_plus,
                              _FolderCardType.realFolder => CupertinoIcons.folder_fill,
                            },
                            size: 50,
                          ),
                        ),
                      ),
                      
                      if (widget.cardType == _FolderCardType.realFolder)
                        Positioned.fill(
                          child: ValueListenableBuilder(
                            valueListenable: expanded,
                            builder: (context, expanded, child) => AnimatedOpacity(
                              opacity: expanded ? 1 : 0,
                              duration: const Duration(milliseconds: 200),
                              child: IgnorePointer(
                                ignoring: !expanded,
                                child: child!,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () => expanded.value = !expanded.value,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      cardElevatedColor.withOpacity(0.3),
                                      cardElevatedColor.withOpacity(0.9),
                                      cardElevatedColor.withOpacity(1),
                                    ],
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    RenameFolderButton(
                                      folderName: widget.folderName!,
                                      doesFolderExist: widget.doesFolderExist,
                                      renameFolder: (String folderName) async {
                                        await widget.renameFolder(widget.folderName!, folderName);
                                        expanded.value = false;
                                      },
                                    ),
                                    DeleteFolderButton(
                                      folderName: widget.folderName!,
                                      deleteFolder: (String folderName) async {
                                        await widget.deleteFolder(folderName);
                                        expanded.value = false;
                                      },
                                      isFolderEmpty: widget.isFolderEmpty,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
      
                const SizedBox(height: 8),
      
                switch (widget.cardType) {
                  _FolderCardType.backFolder => const Icon(Icons.arrow_back),
                  _FolderCardType.newFolder => Text(t.home.newFolder.newFolder),
                  _FolderCardType.realFolder => Text(widget.folderName!),
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
