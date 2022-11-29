
import 'package:flutter/material.dart';
import 'package:saber/i18n/strings.g.dart';

class EditorBottomSheet extends StatelessWidget {
  const EditorBottomSheet({
    super.key,
    required this.clearPage,
    required this.clearAllPages,
  });

  final VoidCallback? clearPage;
  final VoidCallback? clearAllPages;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 200,
              maxWidth: 500,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                        ),
                        onPressed: clearPage != null ? () {
                          clearPage!();
                          Navigator.pop(context);
                        } : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.delete),
                            const SizedBox(width: 8),
                            Text(t.editor.menu.clearPage),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                        ),
                        onPressed: clearAllPages != null ? () {
                          clearAllPages!();
                          Navigator.pop(context);
                        } : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.delete_sweep),
                            const SizedBox(width: 8),
                            Text(t.editor.menu.clearAllPages),
                          ],
                        )
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
