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
            return _MoveNoteDialog(filesToMove: filesToMove,);
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
  late List<String> fileNames = widget.filesToMove.map((path) => path.substring(path.lastIndexOf('/') + 1)).toList();

  /// The original parent folders of the notes,
  /// including the trailing slash.
  
  late List<String> parentFolders = widget.filesToMove.map((path) => path.substring(0, path.lastIndexOf('/') + 1)).toList();

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
  /// This is the same as [fileNames], unless a file
  /// with the same name already exists in the
  /// destination folder. In that case, the file name
  /// will be suffixed with a number.
  List<String> newFileNames = [];
  List<String> duplicateFileNames = [];


  Future findChildrenOfCurrentFolder() async {
    currentFolderChildren = await FileManager.getChildrenOfDirectory(currentFolder);
    newFileNames = [];
    duplicateFileNames = [];
    for(var i = 0; i < widget.filesToMove.length; i++){
      String newFileName = await FileManager.suffixFilePathToMakeItUnique('$currentFolder${widget.filesToMove[i]}', false, '${parentFolders[i]}${widget.filesToMove[i]}${Editor.extension}')
      .then((newPath) => newPath.substring(newPath.lastIndexOf('/') + 1));
      newFileNames.add(newFileName);
      if(newFileName != widget.filesToMove[i].substring(widget.filesToMove[i].lastIndexOf('/') + 1)) {
        duplicateFileNames.add(newFileName);
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
    currentFolder = parentFolders[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveAlertDialog(
      title: fileNames.toString().length < 300
      ? Text(t.home.moveNote.moveName(f: fileNames.toString().substring(1, fileNames.toString().length - 1)))
      : Text(t.home.moveNote.moveNotes(n: fileNames.length)),
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
            
            if (duplicateFileNames.length == 1)
              Text(t.home.moveNote.renamedTo(newName: newFileNames[0]))
            else if(duplicateFileNames.length > 1 && duplicateFileNames.toString().length < 300)
              Text(t.home.moveNote.multipleRenamedTo),
            if(duplicateFileNames.length > 1)
              duplicateFileNames.toString().length < 300
                ? Text(duplicateFileNames.toString().substring(1, duplicateFileNames.toString().length - 1))
                : Text(t.home.moveNote.numberRenamedTo(n: duplicateFileNames.length)),
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
            for(var i = 0; i < widget.filesToMove.length; i++){
              await FileManager.moveFile(
                '${widget.filesToMove[i]}${Editor.extension}',
                '$currentFolder${newFileNames![i]}${Editor.extension}',
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
