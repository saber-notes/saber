
import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({
    Key? key,
    required this.undo,
    required this.redo,
  }) : super(key: key);

  final VoidCallback undo;
  final VoidCallback redo;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () { },
              style: TextButton.styleFrom(
                primary: colorScheme.onPrimary,
                backgroundColor: colorScheme.primary
              ),
              child: const Icon(Icons.brush),
            ),
            TextButton(
              child: const Icon(Icons.palette),
              onPressed: () { }
            ),
            TextButton(
              child: const Icon(Icons.photo_size_select_actual),
              onPressed: () { }
            ),
            TextButton(
              onPressed: undo,
              child: const Icon(Icons.undo),
            ),
            TextButton(
              onPressed: redo,
              child: const Icon(Icons.redo),
            ),
          ],
        ),
      ),
    );
  }
}
