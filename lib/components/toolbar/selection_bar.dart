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
    const ritualGold = Color(0xFFD4AF37);
    const ritualScarlet = Color(0xFFFF2200);

    return Row(
      mainAxisAlignment: .center,
      children: [
        IconButton(
          onPressed: duplicateSelection,
          style: TextButton.styleFrom(
            foregroundColor: ritualGold,
            backgroundColor: ritualGold.withOpacity(0.05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: ritualGold.withOpacity(0.2)),
            ),
          ),
          tooltip: t.editor.selectionBar.duplicate,
          icon: const AdaptiveIcon(
            icon: Icons.content_copy,
            cupertinoIcon: CupertinoIcons.doc_on_clipboard,
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: deleteSelection,
          style: TextButton.styleFrom(
            foregroundColor: ritualScarlet,
            backgroundColor: ritualScarlet.withOpacity(0.05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: ritualScarlet.withOpacity(0.2)),
            ),
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
