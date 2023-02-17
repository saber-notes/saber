
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saber/i18n/strings.g.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/undraw_learning_sketching_nd4f.svg',
              width: 300,
              height: 188,
              excludeFromSemantics: true,
            ),
            const SizedBox(height: 64),
            Text(t.home.welcome, style: textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(t.home.createNewNote, style: textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
