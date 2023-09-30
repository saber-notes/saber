import 'package:flutter/material.dart';
import 'package:saber/i18n/strings.g.dart';

class SelectModal extends StatefulWidget {
  final VoidCallback duplicateSelection;
  final VoidCallback deleteSelection;

  const SelectModal({
    super.key,
    required this.duplicateSelection,
    required this.deleteSelection,
  });

  @override
  State<SelectModal> createState() => _SelectModalState();
}

class _SelectModalState extends State<SelectModal> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: widget.duplicateSelection,
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.secondary,
            backgroundColor: Colors.transparent,
            shape: const CircleBorder(),
          ),
          tooltip: t.editor.selectionOptions.duplicate,
          icon: const AdaptiveIcon(
            icon: Icons.content_copy,
            cupertinoIcon: CupertinoIcons.doc_on_clipboard,
          ),
        ),
        IconButton(
          onPressed: widget.deleteSelection,
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.secondary,
            backgroundColor: Colors.transparent,
            shape: const CircleBorder(),
          ),
          tooltip: t.editor.selectionOptions.delete,
          icon: const Icon(Icons.delete_rounded),
        ),
      ],
    );
  }
}
