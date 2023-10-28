import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/home/grid_folders.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

class MoveNoteButton extends StatelessWidget {
  const MoveNoteButton({
    super.key,
    required this.filesToMove,
  });

  final List<String> filesToMove;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      tooltip: t.home.moveNote.moveNote,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return _MoveNoteDialog(
              filesToMove: filesToMove,
            );
          },
        );
      },
      icon: const Icon(Icons.drive_file_move),
    );
  }
}

class _MoveNoteDialog extends StatefulWidget {
  const _MoveNoteDialog({
    // ignore: unused_element
    super.key,
    required this.filesToMove,
  });

  final List<String> filesToMove;

  @override
  State<_MoveNoteDialog> createState() => _MoveNoteDialogState();
}
class _MoveNoteDialogState extends State<_MoveNoteDialog> {
  /// The original file names of the notes.
  late final List<String> originalFileNames = widget.filesToMove
      .map((path) => path.substring(path.lastIndexOf('/') + 1))
      .toList();

  /// The original parent folders of the notes,
  /// including the trailing slash.
  late final List<String> parentFolders = widget.filesToMove
      .map((path) => path.substring(0, path.lastIndexOf('/') + 1))
      .toList();

  /// Whether each file uses [Editor.extensionOldJson].
  /// This is populated in [findOldExtensions].
  late List<bool> oldExtensions = widget.filesToMove
      .map((name) => false)
      .toList();
  Future<void> findOldExtensions() async {
    final futures = <Future<bool>>[];
    for (int i = 0; i < widget.filesToMove.length; ++i) {
      futures.add(FileManager.doesFileExist(
        '${widget.filesToMove[i]}${Editor.extensionOldJson}',
      ));
    }
    oldExtensions = await Future.wait(futures);
  }

  late String _currentFolder;
  /// The current folder browsed to in the dialog.
  String get currentFolder => _currentFolder;
  set currentFolder(String folder) {
    _currentFolder = folder;
    currentFolderChildren = null;
    findChildrenOfCurrentFolder();
  }

  /// The children of [currentFolder].
  DirectoryChildren? currentFolderChildren;
  /// The file names that the notes will be moved to.
  /// 
  /// These will be the same as in [fileNames], unless
  /// a file needs to be renamed to avoid a name conflict.
  /// Such a file will also be in [changedFileNames].
  late List<String> newFileNames = [];
  /// The new names of the files that needed to be renamed.
  late List<String> changedFileNames = [];

  Future findChildrenOfCurrentFolder() async {
    currentFolderChildren = await FileManager.getChildrenOfDirectory(currentFolder);

    newFileNames = [];
    changedFileNames = [];
    for (int i = 0; i < widget.filesToMove.length; ++i) {
      final oldExtension = oldExtensions[i];
      final newFileName = await FileManager.suffixFilePathToMakeItUnique(
        '$currentFolder${originalFileNames[i]}',
        oldExtension,
        '${widget.filesToMove[i]}${oldExtension ? Editor.extensionOldJson : Editor.extension}',
      ).then((newPath) => newPath.substring(newPath.lastIndexOf('/') + 1));

      newFileNames.add(newFileName);

      if (newFileName != originalFileNames[i]) {
        changedFileNames.add(newFileName);
      }
    }

    if (!mounted) return;
    setState(() {});
  }

  Future<void> createFolder(String folderName) async {
    final folderPath = '$currentFolder/$folderName';
    await FileManager.createFolder(folderPath);
    findChildrenOfCurrentFolder();
  }

  @override
  void initState() {
    currentFolder = _findMostCommonParentFolder();
    super.initState();

    findOldExtensions()
      .then((_) => findChildrenOfCurrentFolder());
  }

  String _findMostCommonParentFolder() {
    final parentFolderCounts = <String, int>{};
    for (final parentFolder in parentFolders) {
      parentFolderCounts[parentFolder] = (parentFolderCounts[parentFolder] ?? 0) + 1;
    }
    return parentFolderCounts.entries
        .reduce((a, b) => a.value >= b.value ? a : b)
        .key;
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveAlertDialog(
      title: originalFileNames.length < 5
        ? Text(t.home.moveNote.moveName(
            f: originalFileNames.join(', '),
          ))
        : Text(t.home.moveNote.moveNotes(
            n: originalFileNames.length,
          )),
      content: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            Text(currentFolder),
            Expanded(
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  GridFolders(
                    isAtRoot: currentFolder == '/',
                    crossAxisCount: 3,
                    onTap: (String folder) {
                      setState(() {
                        if (folder == '..') {
                          currentFolder = currentFolder.substring(
                            0,
                            currentFolder.lastIndexOf('/', currentFolder.length - 2) + 1,
                          );
                        } else {
                          currentFolder = '$currentFolder$folder/';
                        }
                      });
                    },
                    createFolder: createFolder,
                    doesFolderExist: (String folderName) {
                      return currentFolderChildren?.directories.contains(folderName) ?? false;
                    },
                    renameFolder: (String oldName, String newName) async {
                      final oldPath = '$currentFolder$oldName';
                      await FileManager.renameDirectory(oldPath, newName);
                      findChildrenOfCurrentFolder();
                    },
                    isFolderEmpty: (String folderName) async {
                      final folderPath = '$currentFolder$folderName';
                      final children = await FileManager.getChildrenOfDirectory(folderPath);
                      return children?.isEmpty ?? true;
                    },
                    deleteFolder: (String folderName) async {
                      final folderPath = '$currentFolder$folderName';
                      await FileManager.deleteDirectory(folderPath);
                      findChildrenOfCurrentFolder();
                    },
                    folders: [
                      for (final directoryPath in currentFolderChildren?.directories ?? const [])
                        directoryPath,
                    ],
                  ),
                ],
              ),
            ),

            if (changedFileNames.isEmpty)
              const SizedBox.shrink()
            else if (changedFileNames.length == 1)
              Text(t.home.moveNote.renamedTo(newName: changedFileNames.single))
            else if (changedFileNames.length < 5) ...[
              Text(t.home.moveNote.multipleRenamedTo),
              Text(changedFileNames.join(', ')),
            ] else
              Text(t.home.moveNote.numberRenamedTo(n: changedFileNames.length)),
          ],
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(t.editor.newerFileFormat.cancel),
        ),
        CupertinoDialogAction(
          onPressed: () async {
            for (int i = 0; i < widget.filesToMove.length; ++i) {
              final extension = oldExtensions[i] ? Editor.extensionOldJson : Editor.extension;
              await FileManager.moveFile(
                '${widget.filesToMove[i]}$extension',
                '$currentFolder${newFileNames[i]}$extension',
              );
            }
            if (!mounted) return;
            Navigator.of(context).pop();
          },
          child: Text(t.home.moveNote.move),
        ),
      ],
    );
  }
}
