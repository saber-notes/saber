import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/i18n/strings.g.dart';

class NewFolderButton extends StatelessWidget {
  const NewFolderButton({
    super.key,
    required this.createFolder,
  });

  final void Function(String) createFolder;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => _NewFolderDialog(
            createFolder: createFolder,
          ),
        );
      },
      tooltip: t.home.newFolder.newFolder,
      icon: const Icon(Icons.create_new_folder),
    );
  }
}

class _NewFolderDialog extends StatefulWidget {
  const _NewFolderDialog({
    super.key,
    required this.createFolder,
  });

  final void Function(String) createFolder;

  @override
  State<_NewFolderDialog> createState() => _NewFolderDialogState();
}
class _NewFolderDialogState extends State<_NewFolderDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AdaptiveAlertDialog(
      title: Text(t.home.newFolder.newFolder),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: t.home.newFolder.folderName,
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
          onPressed: () {
            // todo: validate folder name
            widget.createFolder(_controller.text);
            Navigator.of(context).pop();
          },
          child: Text(t.home.newFolder.create),
        ),
      ],
    );
  }
}
