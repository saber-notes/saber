import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/i18n/strings.g.dart';

class DeleteFolderButton extends StatelessWidget {
  const DeleteFolderButton({
    super.key,
    required this.folderName,
    required this.deleteFolder,
    required this.isFolderEmpty,
  });

  final String folderName;
  final Future<void> Function(String) deleteFolder;
  final Future<bool> Function(String) isFolderEmpty;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      tooltip: t.home.deleteFolder.deleteFolder,
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (context) => _DeleteFolderDialog(
            folderName: folderName,
            deleteFolder: deleteFolder,
            isFolderEmpty: isFolderEmpty,
          ),
        );
      },
      icon: const Icon(Icons.delete_forever),
    );
  }
}

class _DeleteFolderDialog extends StatefulWidget {
  const _DeleteFolderDialog({
    // ignore: unused_element
    super.key,
    required this.folderName,
    required this.deleteFolder,
    required this.isFolderEmpty,
  });

  final String folderName;
  final Future<void> Function(String) deleteFolder;
  final Future<bool> Function(String) isFolderEmpty;

  @override
  State<_DeleteFolderDialog> createState() => _DeleteFolderDialogState();
}

class _DeleteFolderDialogState extends State<_DeleteFolderDialog> {
  bool isFolderEmpty = false;
  bool alsoDeleteContents = false;

  @override
  void initState() {
    super.initState();
    checkIfFolderIsEmpty();
  }

  Future<void> checkIfFolderIsEmpty() async {
    isFolderEmpty = await widget.isFolderEmpty(widget.folderName);
    if (isFolderEmpty) alsoDeleteContents = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool deleteAllowed = isFolderEmpty || alsoDeleteContents;
    return AdaptiveAlertDialog(
      title: Text(t.home.deleteFolder.deleteName(f: widget.folderName)),
      content: isFolderEmpty ? const SizedBox.shrink() : Row(
        children: [
          Checkbox(
            value: alsoDeleteContents,
            onChanged: isFolderEmpty ? null : (value) {
              setState(() => alsoDeleteContents = value!);
            },
          ),
          Expanded(
            child: Text(t.home.deleteFolder.alsoDeleteContents),
          ),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(t.editor.newerFileFormat.cancel),
        ),
        CupertinoDialogAction(
          onPressed: deleteAllowed ? () async {
            await widget.deleteFolder(widget.folderName);
            if (mounted) Navigator.of(context).pop();
          } : null,
          isDestructiveAction: true,
          child: Text(t.home.deleteFolder.delete),
        ),
      ],
    );
  }
}
