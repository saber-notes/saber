
import 'package:flutter/material.dart';

class NoFiles extends StatelessWidget {
  const NoFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No files found", style: textTheme.headline4),
            const SizedBox(height: 8),
            Text("Tap the + button to create a new note", style: textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}
