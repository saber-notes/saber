
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to Saber", style: textTheme.headline4),
            const SizedBox(height: 8),
            Text("Tap the + button to create a new note", style: textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}
