import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/components/theming/adaptive_text_field.dart';
import 'package:saber/i18n/strings.g.dart';

class NewFolderDialog extends StatefulWidget {
  const NewFolderDialog({
    // ignore: unused_element
    super.key,
    required this.createFolder,
    required this.doesFolderExist,
  });

  final void Function(String) createFolder;
  final bool Function(String) doesFolderExist;

  @override
  State<NewFolderDialog> createState() => _NewFolderDialogState();
}
class _NewFolderDialogState extends State<NewFolderDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  String? validateFolderName(String? folderName) {
    if (folderName == null || folderName.isEmpty) {
      return t.home.newFolder.folderNameEmpty;
    }
    if (folderName.contains('/') || folderName.contains('\\')) {
      return t.home.newFolder.folderNameContainsSlash;
    }
    if (widget.doesFolderExist(folderName)) {
      return t.home.newFolder.folderNameExists;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveAlertDialog(
      title: Text(t.home.newFolder.newFolder),
      content: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: AdaptiveTextField(
          controller: _controller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          focusOrder: const NumericFocusOrder(1),
          placeholder: t.home.newFolder.folderName,
          prefixIcon: const AdaptiveIcon(
            icon: Icons.create_new_folder,
            cupertinoIcon: CupertinoIcons.folder_badge_plus,
          ),
          validator: validateFolderName,
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
            if (!_formKey.currentState!.validate()) return;
            widget.createFolder(_controller.text);
            Navigator.of(context).pop();
          },
          child: Text(t.home.newFolder.create),
        ),
      ],
    );
  }
}
