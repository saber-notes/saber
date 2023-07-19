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
    required this.existingPath,
  });

  final String existingPath;

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
              existingPath: existingPath,
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
    required this.existingPath,
  });

  final String existingPath;

  @override
  State<_MoveNoteDialog> createState() => _MoveNoteDialogState();
}
class _MoveNoteDialogState extends State<_MoveNoteDialog> {
  /// The original file name of the note.
  late String fileName = widget.existingPath.substring(
    widget.existingPath.lastIndexOf('/') + 1,
  );
  /// The original parent folder of the note,
  /// including the trailing slash.
  late String parentFolder = widget.existingPath.substring(
    0,
    widget.existingPath.lastIndexOf('/') + 1,
  );

  late String _currentFolder;
  /// The current folder browsed to in the dialog.
  String get currentFolder => _currentFolder;
  set currentFolder(String folder) {
    _currentFolder = folder;
    currentFolderChildren = null;
    newFileName = null;
    findChildrenOfCurrentFolder();
  }

  /// The children of [currentFolder].
  DirectoryChildren? currentFolderChildren;
  /// The file name that the note will be moved to.
  /// This is the same as [fileName], unless a file
  /// with the same name already exists in the
  /// destination folder. In that case, the file name
  /// will be suffixed with a number.
  String? newFileName;

  Future findChildrenOfCurrentFolder() async {
    currentFolderChildren = await FileManager.getChildrenOfDirectory(currentFolder);
    newFileName = await FileManager.suffixFilePathToMakeItUnique('$currentFolder$fileName', '${widget.existingPath}${Editor.extension}')
      .then((newPath) => newPath.substring(newPath.lastIndexOf('/') + 1));
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
    currentFolder = parentFolder;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveAlertDialog(
      title: Text(t.home.moveNote.moveName(f: fileName)),
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
            if (newFileName != null && newFileName != fileName)
              Text(t.home.moveNote.renamedTo(newName: newFileName ?? '?')),
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
            await FileManager.moveFile(
              '${widget.existingPath}${Editor.extension}',
              '$currentFolder$newFileName${Editor.extension}',
            );
            if (!mounted) return;
            Navigator.of(context).pop();
          },
          child: Text(t.home.moveNote.move),
        ),
      ],
    );
  }
}
