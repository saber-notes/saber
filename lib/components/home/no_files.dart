
import 'package:flutter/material.dart';
import 'package:saber/i18n/strings.g.dart';

class NoFiles extends StatelessWidget {
  const NoFiles({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(t.home.noFiles, style: textTheme.headline4),
            const SizedBox(height: 8),
            Text(t.home.createNewNote, style: textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}
