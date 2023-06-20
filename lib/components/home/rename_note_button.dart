import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/components/theming/adaptive_text_field.dart';
import 'package:saber/i18n/strings.g.dart';

class RenameNoteButton extends StatelessWidget {
  const RenameNoteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const _RenameNoteDialog();
          },
        );
      },
      icon: const Icon(Icons.edit_square),
    );
  }
}

class _RenameNoteDialog extends StatefulWidget {
  const _RenameNoteDialog({
    // ignore: unused_element
    super.key,
  });

  @override
  State<_RenameNoteDialog> createState() => _RenameNoteDialogState();
}
class _RenameNoteDialogState extends State<_RenameNoteDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  String? validateNoteName(String? noteName) {
    if (noteName == null || noteName.isEmpty) {
      return t.home.renameNote.noteNameEmpty;
    }
    if (noteName.contains('/') || noteName.contains('\\')) {
      return t.home.renameNote.noteNameContainsSlash;
    }
    if (doesFileExist(noteName)) {
      return t.home.renameNote.noteNameExists;
    }
    return null;
  }

  bool doesFileExist(String noteName) {
    // TODO: implement doesFileExist
    return false;
  }

  Future renameNote(String newName) async {
    // TODO: implement renameNote
  }

  @override
  void initState() {
    super.initState();
    // TODO: get current note name
    _controller.text = 'Note';
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveAlertDialog(
      title: Text(t.home.renameNote.renameNote),
      content: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: AdaptiveTextField(
          controller: _controller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          focusOrder: const NumericFocusOrder(1),
          placeholder: t.home.renameNote.noteName,
          prefixIcon: const Icon(Icons.edit_square),
          validator: validateNoteName,
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
            await renameNote(_controller.text);
            if (!mounted) return;
            Navigator.of(context).pop();
          },
          child: Text(t.home.newFolder.create),
        ),
      ],
    );
  }
}
