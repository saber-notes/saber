import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/i18n/strings.g.dart';

class SelectionBar extends StatelessWidget {
  final VoidCallback copySelection;
  final VoidCallback duplicateSelection;
  final VoidCallback deleteSelection;
  final VoidCallback paste;
  final bool hasSelection;

  const SelectionBar({
    super.key,
    required this.copySelection,
    required this.duplicateSelection,
    required this.deleteSelection,
    required this.paste,
    required this.hasSelection,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (hasSelection) ...[
          IconButton(
            onPressed: copySelection,
            style: TextButton.styleFrom(
              foregroundColor: colorScheme.secondary,
              backgroundColor: Colors.transparent,
              shape: const CircleBorder(),
            ),
            tooltip: t.editor.selectionBar.copy,
            icon: const AdaptiveIcon(
              icon: Icons.content_copy,
              cupertinoIcon: CupertinoIcons.doc_on_clipboard,
            ),
          ),
          IconButton(
            onPressed: duplicateSelection,
            style: TextButton.styleFrom(
              foregroundColor: colorScheme.secondary,
              backgroundColor: Colors.transparent,
              shape: const CircleBorder(),
            ),
            tooltip: t.editor.selectionBar.duplicate,
            icon: const AdaptiveIcon(
              icon: Icons.control_point_duplicate,
              cupertinoIcon: CupertinoIcons.plus_square_on_square,
            ),
          ),
          IconButton(
            onPressed: deleteSelection,
            style: TextButton.styleFrom(
              foregroundColor: colorScheme.secondary,
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
        IconButton(
          onPressed: paste,
          style: TextButton.styleFrom(
            foregroundColor: colorScheme.secondary,
            backgroundColor: Colors.transparent,
            shape: const CircleBorder(),
          ),
          tooltip: t.editor.selectionBar.paste,
          icon: const AdaptiveIcon(
            icon: Icons.content_paste,
            cupertinoIcon: CupertinoIcons.doc_on_clipboard_fill,
          ),
        ),
      ],
    );
  }
}
