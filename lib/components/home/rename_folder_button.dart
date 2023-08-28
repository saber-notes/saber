import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/components/theming/adaptive_text_field.dart';
import 'package:saber/i18n/strings.g.dart';

class RenameFolderButton extends StatelessWidget {
  const RenameFolderButton({
    super.key,
    required this.folderName,
    required this.doesFolderExist,
    required this.renameFolder,
  });

  final String folderName;
  final bool Function(String) doesFolderExist;
  final Future<void> Function(String newName) renameFolder;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      tooltip: t.home.renameFolder.renameFolder,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return _RenameFolderDialog(
              folderName: folderName,
              doesFolderExist: doesFolderExist,
              renameFolder: renameFolder,
            );
          },
        );
      },
      icon: const Icon(Icons.edit_square),
    );
  }
}

class _RenameFolderDialog extends StatefulWidget {
  const _RenameFolderDialog({
    // ignore: unused_element
    super.key,
    required this.folderName,
    required this.doesFolderExist,
    required this.renameFolder,
  });

  final String folderName;
  final bool Function(String) doesFolderExist;
  final Future<void> Function(String newName) renameFolder;

  @override
  State<_RenameFolderDialog> createState() => _RenameFolderDialogState();
}
class _RenameFolderDialogState extends State<_RenameFolderDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  String? validateFolderName(String? folderName) {
    if (folderName == null || folderName.isEmpty) {
      return t.home.renameFolder.folderNameEmpty;
    }
    if (folderName.contains('/') || folderName.contains('\\')) {
      return t.home.renameFolder.folderNameContainsSlash;
    }
    if (folderName != widget.folderName && widget.doesFolderExist(folderName)) {
      return t.home.renameFolder.folderNameExists;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _controller.text = widget.folderName;
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveAlertDialog(
      title: Text(t.home.renameFolder.renameFolder),
      content: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: AdaptiveTextField(
          controller: _controller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          focusOrder: const NumericFocusOrder(1),
          placeholder: t.home.renameFolder.folderName,
          prefixIcon: const Icon(Icons.edit_square),
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
          onPressed: () async {
            if (!_formKey.currentState!.validate()) return;
            if (_controller.text != widget.folderName) {
              await widget.renameFolder(_controller.text);
              if (!mounted) return;
            }
            Navigator.of(context).pop();
          },
          child: Text(t.home.renameFolder.rename),
        ),
      ],
    );
  }
}
