import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logging/logging.dart';
import 'package:saber/components/misc/faq.dart';
import 'package:saber/components/theming/font_fallbacks.dart';
import 'package:saber/data/nextcloud/errors.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
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
  final _errorMessage = ValueNotifier('');
  final _isChecking = ValueNotifier(false);

  final log = Logger('EncLoginStep');

  @override
  void dispose() {
    _encPasswordController.dispose();
    _errorMessage.dispose();
    _isChecking.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth > width ? (screenWidth - width) / 2 : 16,
        vertical: 16,
      ),
      children: [
        const SizedBox(height: 16),
        if (screenHeight > 500) ...[
          SvgPicture.asset(
            'assets/images/undraw_mobile_encryption_re_yw3o.svg',
            width: width,
            height: min(width * 576 / 844.6693, screenHeight * 0.25),
            excludeFromSemantics: true,
          ),
          SizedBox(
            height: min(64, screenHeight * 0.05),
          ),
        ],
        Text(t.login.status.hi(u: Prefs.username.value),
            style: textTheme.headlineSmall),
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
        Text(t.login.encLoginStep.enterEncPassword,
            style: textTheme.headlineSmall),
        const SizedBox(height: 4),
        Text(t.login.encLoginStep.newToSaber),
        const SizedBox(height: 16),
        TextField(
          controller: _encPasswordController,
          style: TextStyle(
            fontFamily: 'FiraMono',
            fontFamilyFallback: saberMonoFontFallbacks,
          ),
          decoration: InputDecoration(
            labelText: t.login.encLoginStep.encPassword,
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _errorMessage,
          builder: (context, errorMessage, _) {
            if (errorMessage.isEmpty) return const SizedBox.shrink();
            return Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(errorMessage,
                  style: TextStyle(color: colorScheme.error)),
            );
          },
        ),
        const SizedBox(height: 4),
        ValueListenableBuilder(
          valueListenable: _encPasswordController,
          builder: (context, encPassword, child) {
            return ValueListenableBuilder(
              valueListenable: _isChecking,
              builder: (context, isChecking, child) {
                return ElevatedButton(
                  onPressed: (encPassword.text.isEmpty || isChecking)
                      ? null
                      : _checkEncPassword,
                  child: child,
                );
              },
              child: child,
            );
          },
          child: Text(t.common.continueBtn),
        ),
        const SizedBox(height: 32),
        Text(t.login.encLoginStep.encFaqTitle, style: textTheme.headlineSmall),
        FaqListView(
          shrinkWrap: true,
          items: [
            for (final item in t.login.encLoginStep.encFaq)
              FaqItem(item.q, item.a),
          ],
        ),
      ],
    );
  }

  void _checkEncPassword() async {
    _errorMessage.value = '';

    final encPassword = _encPasswordController.text;
    if (encPassword.isEmpty) return;

    try {
      Prefs.encPassword.value = encPassword;
      final client = NextcloudClientExtension.withSavedDetails()!;
      _isChecking.value = true;
      await client.loadEncryptionKey();
      widget.recheckCurrentStep();
    } on EncLoginFailure {
      Prefs.encPassword.value = '';

      _errorMessage.value = t.login.encLoginStep.wrongEncPassword;
    } catch (e) {
      Prefs.encPassword.value = '';
      log.severe('Failed to load encryption key: $e', e);

      _errorMessage.value = '${t.login.encLoginStep.connectionFailed}\n\n$e';

      if (kDebugMode) rethrow;
    } finally {
      _isChecking.value = false;
    }
  }
}
