import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/home/grid_folders.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/i18n/strings.g.dart';

class MoveFolderButton extends StatelessWidget {
  const MoveFolderButton({
    super.key,
    required this.folderName,
    required this.currentFolder,
    required this.onMoved,
  });

  final String folderName;
  final String currentFolder;
  final void Function() onMoved;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      tooltip: t.home.moveFolder.moveFolder,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return _MoveFolderDialog(
              folderName: folderName,
              currentFolder: currentFolder,
              onMoved: onMoved,
            );
          },
        );
      },
      icon: const Icon(Icons.drive_file_move),
    );
  }
}

class _MoveFolderDialog extends StatefulWidget {
  const _MoveFolderDialog({
    required this.folderName,
    required this.currentFolder,
    required this.onMoved,
  });

  final String folderName;
  final String currentFolder;
  final void Function() onMoved;

  @override
  State<_MoveFolderDialog> createState() => _MoveFolderDialogState();
}

class _MoveFolderDialogState extends State<_MoveFolderDialog> {
  /// The full path of the folder being moved
  late final sourceFolderPath =
      '${widget.currentFolder}${widget.folderName}';

  late String _destinationFolder;

  /// The current folder browsed to in the dialog (destination parent folder).
  String get destinationFolder => _destinationFolder;
  set destinationFolder(String folder) {
    _destinationFolder = folder;
    destinationFolderChildren = null;
    findChildrenOfDestinationFolder();
  }

  /// The children of [destinationFolder].
  DirectoryChildren? destinationFolderChildren;

  /// The final folder name at the destination (might be renamed if conflict).
  String? newFolderName;

  /// Whether the folder will be renamed due to conflict.
  bool get willBeRenamed =>
      newFolderName != null && newFolderName != widget.folderName;

  /// Whether moving to the destination is invalid (moving into itself).
  bool get isInvalidDestination {
    final destinationPath = '$destinationFolder${widget.folderName}';
    // Cannot move a folder into itself or its subdirectory
    return destinationPath.startsWith('$sourceFolderPath/') ||
        destinationPath == sourceFolderPath;
  }

  Future findChildrenOfDestinationFolder() async {
    destinationFolderChildren = await FileManager.getChildrenOfDirectory(
      destinationFolder,
    );

    // Check if folder name conflicts with existing directory
    if (destinationFolderChildren?.directories.contains(widget.folderName) ??
        false) {
      // Find a unique name
      int i = 2;
      String candidateName = '${widget.folderName} ($i)';
      while (destinationFolderChildren?.directories.contains(candidateName) ??
          false) {
        i++;
        candidateName = '${widget.folderName} ($i)';
      }
      newFolderName = candidateName;
    } else {
      newFolderName = widget.folderName;
    }

    if (!mounted) return;
    setState(() {});
  }

  Future<void> createFolder(String folderName) async {
    final folderPath = '$destinationFolder$folderName';
    await FileManager.createFolder(folderPath);
    findChildrenOfDestinationFolder();
  }

  @override
  void initState() {
    // Start at the parent of the folder's current location
    destinationFolder = widget.currentFolder;
    if (!destinationFolder.startsWith('/')) {
      destinationFolder = '/$destinationFolder';
    }
    super.initState();

    findChildrenOfDestinationFolder();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveAlertDialog(
      title: Text(t.home.moveFolder.moveName(f: widget.folderName)),
      content: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            Text(destinationFolder),
            Expanded(
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  GridFolders(
                    isAtRoot: destinationFolder == '/',
                    crossAxisCount: 3,
                    onTap: (String folder) {
                      setState(() {
                        if (folder == '..') {
                          destinationFolder = destinationFolder.substring(
                            0,
                            destinationFolder.lastIndexOf(
                                  '/',
                                  destinationFolder.length - 2,
                                ) +
                                1,
                          );
                        } else {
                          destinationFolder = '$destinationFolder$folder/';
                        }
                      });
                    },
                    createFolder: createFolder,
                    doesFolderExist: (String folderName) {
                      return destinationFolderChildren?.directories.contains(
                            folderName,
                          ) ??
                          false;
                    },
                    renameFolder: (String oldName, String newName) async {
                      final oldPath = '$destinationFolder$oldName';
                      await FileManager.renameDirectory(oldPath, newName);
                      findChildrenOfDestinationFolder();
                    },
                    isFolderEmpty: (String folderName) async {
                      final folderPath = '$destinationFolder$folderName';
                      final children = await FileManager.getChildrenOfDirectory(
                        folderPath,
                      );
                      return children?.isEmpty ?? true;
                    },
                    deleteFolder: (String folderName) async {
                      final folderPath = '$destinationFolder$folderName';
                      await FileManager.deleteDirectory(folderPath);
                      findChildrenOfDestinationFolder();
                    },
                    folders: [
                      for (final directoryPath
                          in destinationFolderChildren?.directories ?? const [])
                        directoryPath,
                    ],
                  ),
                ],
              ),
            ),
            if (isInvalidDestination)
              Text(
                t.home.moveFolder.cantMoveHere,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              )
            else if (willBeRenamed)
              Text(t.home.moveFolder.renamedTo(newName: newFolderName!)),
          ],
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(t.common.cancel),
        ),
        CupertinoDialogAction(
          onPressed: isInvalidDestination
              ? null
              : () async {
                  final destinationPath = '$destinationFolder${widget.folderName}';
                  await FileManager.moveDirectory(
                    sourceFolderPath,
                    destinationPath,
                  );
                  widget.onMoved();
                  if (!context.mounted) return;
                  Navigator.of(context).pop();
                },
          child: Text(t.home.moveFolder.move),
        ),
      ],
    );
  }
}
