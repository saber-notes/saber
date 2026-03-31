import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saber/components/home/delete_folder_button.dart';
import 'package:saber/components/home/new_folder_dialog.dart';
import 'package:saber/components/home/rename_folder_button.dart';
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
      if (!isAtRoot) .backFolder,
      .newFolder,
    ];

    return SliverPadding(
      padding: const .symmetric(horizontal: 12, vertical: 8),
      sliver: SliverAlignedGrid.count(
        itemCount: folders.length + extraCards.length,
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 8,
        itemBuilder: (context, index) {
          final cardType = extraCards.getOrNull(index) ?? .realFolder;
          final folderName = cardType == .realFolder
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
    // ignore: unused_element_parameter
    super.key,
    required this.cardType,
    required this.folderName,
    required this.createFolder,
    required this.doesFolderExist,
    required this.renameFolder,
    required this.isFolderEmpty,
    required this.deleteFolder,
    required this.onTap,
  }) : assert(
         (folderName == null) ^ (cardType == .realFolder),
         'Real folders must specify a folder name',
       );

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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (expanded.value) return;
          switch (widget.cardType) {
            case .newFolder:
              showDialog(
                context: context,
                builder: (context) => NewFolderDialog(
                  createFolder: widget.createFolder,
                  doesFolderExist: widget.doesFolderExist,
                ),
              );
            case .backFolder:
              widget.onTap('..');
            case .realFolder:
              widget.onTap(widget.folderName!);
          }
        },
        onLongPress: widget.cardType == .realFolder
            ? () => expanded.value = !expanded.value
            : null,
        onSecondaryTap: widget.cardType == .realFolder
            ? () => expanded.value = !expanded.value
            : null,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0D0D0D),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFD4AF37).withOpacity(widget.cardType == _FolderCardType.realFolder ? 0.3 : 0.1),
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
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
                          child: Icon(
                            switch (widget.cardType) {
                              _FolderCardType.backFolder => Icons.door_back_door_outlined,
                              _FolderCardType.newFolder => Icons.add_to_photos_outlined,
                              _FolderCardType.realFolder => Icons.auto_stories_outlined,
                            },
                            size: 48,
                            color: const Color(0xFFD4AF37).withOpacity(0.8),
                          ),
                        ),
                      ),
                      if (widget.cardType == _FolderCardType.realFolder)
                        Positioned.fill(
                          child: ValueListenableBuilder<bool>(
                            valueListenable: expanded,
                            builder: (context, expandedVal, child) =>
                                AnimatedOpacity(
                                  opacity: expandedVal ? 1 : 0,
                                  duration: const Duration(milliseconds: 200),
                                  child: IgnorePointer(
                                    ignoring: !expandedVal,
                                    child: child!,
                                  ),
                                ),
                            child: GestureDetector(
                              onTap: () => setState(() => expanded.value = !expanded.value),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      const Color(0xFF0D0D0D).withOpacity(0.4),
                                      const Color(0xFF0D0D0D).withOpacity(0.9),
                                      const Color(0xFF0D0D0D),
                                    ],
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: .center,
                                  crossAxisAlignment: .end,
                                  children: [
                                    RenameFolderButton(
                                      folderName: widget.folderName!,
                                      doesFolderExist: widget.doesFolderExist,
                                      renameFolder: (String folderName) async {
                                        await widget.renameFolder(
                                          widget.folderName!,
                                          folderName,
                                        );
                                        setState(() => expanded.value = false);
                                      },
                                    ),
                                    DeleteFolderButton(
                                      folderName: widget.folderName!,
                                      deleteFolder: (String folderName) async {
                                        await widget.deleteFolder(folderName);
                                        setState(() => expanded.value = false);
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
                const SizedBox(height: 12),
                switch (widget.cardType) {
                  _FolderCardType.backFolder => const Icon(Icons.arrow_upward_sharp, size: 16, color: Color(0xFFD4AF37)),
                  _FolderCardType.newFolder => Text(
                      t.home.newFolder.newFolder.toUpperCase(),
                      style: const TextStyle(color: Color(0xFFD4AF37), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                    ),
                  _FolderCardType.realFolder => Text(
                      widget.folderName!.toUpperCase(),
                      style: const TextStyle(color: Color(0xFFD4AF37), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                      textAlign: TextAlign.center,
                    ),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum _FolderCardType { backFolder, newFolder, realFolder }
