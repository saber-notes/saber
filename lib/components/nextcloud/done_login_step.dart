import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

class DoneLoginStep extends StatefulWidget {
  const DoneLoginStep({super.key, required this.recheckCurrentStep});

  final void Function() recheckCurrentStep;

  @override
  State<DoneLoginStep> createState() => _DoneLoginStepState();
}

class _DoneLoginStepState extends State<DoneLoginStep> {
  static const width = 400.0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth > width ? (screenWidth - width) / 2 : 16,
        vertical: 16,
      ),
      children: [
        const SizedBox(height: 16),
        SvgPicture.asset(
          'assets/images/undraw_my_files_swob.svg',
          width: width,
          height: width * 576 / 844.6693,
          excludeFromSemantics: true,
        ),
        const SizedBox(height: 64),
        Row(
          children: [
            if (Prefs.pfp.value == null)
              if (Prefs.url.value.isEmpty)
                Image.asset('assets/icon/resized/icon-128x128.png',
                    width: 32, height: 32)
              else
                const Icon(Icons.account_circle, size: 32)
            else
              Image.memory(Prefs.pfp.value!, width: 32, height: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Text(t.login.status.hi(u: Prefs.username.value),
                  style: textTheme.headlineSmall),
            ),
          ],
        ),
      ],
    );
  }
}
