import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:yaru/yaru.dart';

class EncLoginStep extends StatefulWidget {
  const EncLoginStep({super.key, required this.recheckCurrentStep});

  final void Function() recheckCurrentStep;

  @override
  State<EncLoginStep> createState() => _EncLoginStepState();
}

class _EncLoginStepState extends State<EncLoginStep> {
  static const width = 400.0;

  final _encPasswordController = TextEditingController();

  @override
  void dispose() {
    _encPasswordController.dispose();
    super.dispose();
  }

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
          'assets/images/undraw_mobile_encryption_re_yw3o.svg',
          width: width,
          height: width * 576 / 844.6693,
          excludeFromSemantics: true,
        ),
        const SizedBox(height: 64),
        Text('Hi ${Prefs.username.value}!', style: textTheme.headlineSmall),
        Text.rich(
          t.login.notYou(
            undoLogin: (text) => TextSpan(
              text: text,
              style: TextStyle(color: colorScheme.link),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Prefs.url.value = '';
                  Prefs.username.value = '';
                  Prefs.ncPassword.value = '';
                  widget.recheckCurrentStep();
                },
            ),
          ),
        ),
        const SizedBox(height: 32),
        Text('To protect your data, please enter your encryption password:',
            style: textTheme.headlineSmall),
        const SizedBox(height: 4),
        const Text('New to Saber? Just enter a new encryption password.'),
        const SizedBox(height: 16),
        TextField(
          controller: _encPasswordController,
          style: GoogleFonts.firaMono(),
          decoration: const InputDecoration(
            labelText: 'Encryption password',
          ),
        ),
        const SizedBox(height: 4),
        ValueListenableBuilder(
          valueListenable: _encPasswordController,
          builder: (context, encPassword, child) {
            return ElevatedButton(
              onPressed: encPassword.text.isEmpty ? null : () {},
              child: child,
            );
          },
          child: const Text('Continue'),
        ),
      ],
    );
  }
}
