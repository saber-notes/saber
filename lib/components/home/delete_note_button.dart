import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

class DeleteNoteButton extends StatelessWidget {
  const DeleteNoteButton({
    super.key,
    required this.filesToDelete,
    required this.unselectNotes,
  });

  final List<String> filesToDelete;
  final void Function() unselectNotes;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      tooltip: t.home.deleteNote,
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (context) => _DeleteNoteDialog(
            filesToDelete: filesToDelete,
            unselectNotes: unselectNotes,
          ),
        );
      },
      icon: const Icon(Icons.delete_forever),
    );
  }
}

class _DeleteNoteDialog extends StatefulWidget {
  const _DeleteNoteDialog({
    required this.filesToDelete,
    required this.unselectNotes,
  });

  final List<String> filesToDelete;
  final void Function() unselectNotes;

  @override
  State<_DeleteNoteDialog> createState() => _DeleteNoteDialogState();
}

class _DeleteNoteDialogState extends State<_DeleteNoteDialog> {
  var deleteAllowed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveAlertDialog(
      title: widget.filesToDelete.length < 5
          ? Text(
              t.home.deleteNoteDialog.deleteName(
                f: widget.filesToDelete.join(', '),
              ),
            )
          : Text(
              t.home.deleteNoteDialog.deleteNotes(
                n: widget.filesToDelete.length,
              ),
            ),
      content: Row(
        children: [
          Checkbox(
            value: deleteAllowed,
            onChanged: (value) => setState(() => deleteAllowed = value!),
          ),
          Expanded(child: Text(t.home.deleteNoteDialog.deleteAllowed)),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(t.common.cancel),
        ),
        CupertinoDialogAction(
          onPressed: deleteAllowed
              ? () async {
                  await Future.wait([
                    for (final String filePath in widget.filesToDelete)
                      Future.value(
                        FileManager.doesFileExist(
                          filePath + Editor.extensionOldJson,
                        ),
                      ).then(
                        (oldExtension) => FileManager.deleteFile(
                          filePath +
                              (oldExtension
                                  ? Editor.extensionOldJson
                                  : Editor.extension),
                        ),
                      ),
                  ]);
                  if (context.mounted) Navigator.of(context).pop();
                  widget.unselectNotes();
                }
              : null,
          isDestructiveAction: true,
          child: Text(t.home.deleteNoteDialog.delete),
        ),
      ],
    );
  }
}
