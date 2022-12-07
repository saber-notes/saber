
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saber/components/navbar/responsive_navbar.dart';
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
              "assets/images/undraw_learning_sketching_nd4f.svg",
              width: isWatch ? 100 : 300,
              excludeFromSemantics: true,
            ),
            if (!isWatch) const SizedBox(height: 64),
            Text(t.home.welcome, style: isWatch ? null : textTheme.headline4),
            if (!isWatch) const SizedBox(height: 8),
            Text(t.home.createNewNote, style: isWatch ? null : textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}
