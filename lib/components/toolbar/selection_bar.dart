import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/i18n/strings.g.dart';

class SelectionBar extends StatelessWidget {
  final VoidCallback duplicateSelection;
  final VoidCallback deleteSelection;

  const SelectionBar({
    super.key,
    required this.duplicateSelection,
    required this.deleteSelection,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: duplicateSelection,
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.secondary,
            backgroundColor: Colors.transparent,
            shape: const CircleBorder(),
          ),
          tooltip: t.editor.selectionBar.duplicate,
          icon: const AdaptiveIcon(
            icon: Icons.content_copy,
            cupertinoIcon: CupertinoIcons.doc_on_clipboard,
          ),
        ),
        IconButton(
          onPressed: deleteSelection,
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.secondary,
            backgroundColor: Colors.transparent,
            shape: const CircleBorder(),
          ),
          tooltip: t.editor.selectionBar.delete,
          icon: const AdaptiveIcon(
            icon: Icons.delete,
            cupertinoIcon: CupertinoIcons.delete,
          ),
        ),
      ],
    );
  }
}
