
import 'package:flutter/material.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 200,
            maxWidth: 500,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Clear this page'),
                onTap: clearPage,
              ),
              ListTile(
                leading: const Icon(Icons.delete_sweep),
                title: const Text('Clear all pages'),
                onTap: clearAllPages,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
