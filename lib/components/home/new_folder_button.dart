import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/components/theming/adaptive_text_field.dart';
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
      icon: const AdaptiveIcon(
        icon: Icons.create_new_folder,
        cupertinoIcon: CupertinoIcons.folder_badge_plus,
      ),
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AdaptiveAlertDialog(
      title: Text(t.home.newFolder.newFolder),
      content: AdaptiveTextField(
        controller: _controller,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        focusOrder: const NumericFocusOrder(1),
        placeholder: t.home.newFolder.folderName,
        prefixIcon: const AdaptiveIcon(
          icon: Icons.create_new_folder,
          cupertinoIcon: CupertinoIcons.folder_badge_plus,
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
