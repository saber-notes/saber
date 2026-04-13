import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logging/logging.dart';
import 'package:saber/components/misc/faq.dart';
import 'package:saber/data/nextcloud/errors.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:sbn/font_fallbacks.dart';
import 'package:yaru/yaru.dart';

class EncLoginStep extends HookWidget {
  const EncLoginStep({super.key, required this.recheckCurrentStep});

  final void Function() recheckCurrentStep;

  static const width = 400.0;

  static final log = Logger('EncLoginStep');

  @override
  Widget build(BuildContext context) {
    final encPasswordController = useTextEditingController();
    final errorMessage = useState('');
    final isChecking = useState(false);

    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return ListView(
      padding: .symmetric(
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
          SizedBox(height: min(64, screenHeight * 0.05)),
        ],
        Text(
          t.login.status.hi(u: stows.username.value),
          style: textTheme.headlineSmall,
        ),
        Text.rich(
          t.login.notYou(
            undoLogin: (text) => TextSpan(
              text: text,
              style: TextStyle(color: colorScheme.link),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  stows.url.value = '';
                  stows.username.value = '';
                  stows.ncPassword.value = '';
                  recheckCurrentStep();
                },
            ),
          ),
        ),
        const SizedBox(height: 32),
        Text(
          t.login.encLoginStep.enterEncPassword,
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: 4),
        Text(t.login.encLoginStep.newToSaber),
        const SizedBox(height: 16),
        TextField(
          controller: encPasswordController,
          style: const TextStyle(
            fontFamily: 'FiraMono',
            fontFamilyFallback: saberMonoFontFallbacks,
          ),
          decoration: InputDecoration(
            labelText: t.login.encLoginStep.encPassword,
          ),
          autofillHints: const [AutofillHints.password],
          autofocus: true,
        ),
        ValueListenableBuilder(
          valueListenable: errorMessage,
          builder: (context, errorMessage, _) {
            if (errorMessage.isEmpty) return const SizedBox.shrink();
            return Padding(
              padding: const .only(top: 4),
              child: Text(
                errorMessage,
                style: TextStyle(color: colorScheme.error),
              ),
            );
          },
        ),
        const SizedBox(height: 4),
        ListenableBuilder(
          listenable: encPasswordController,
          builder: (context, child) {
            final encPassword = encPasswordController.text;
            return ElevatedButton(
              onPressed: (encPassword.isEmpty || isChecking.value)
                  ? null
                  : () async {
                      isChecking.value = true;
                      try {
                        await _checkEncPassword(encPassword, errorMessage);
                      } finally {
                        isChecking.value = false;
                      }
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

  Future<void> _checkEncPassword(
    String encPassword,
    ValueNotifier<String> errorMessage,
  ) async {
    errorMessage.value = '';
    if (encPassword.isEmpty) return;

    try {
      stows.encPassword.value = encPassword;
      final client = NextcloudClientExtension.withSavedDetails()!;
      await client.loadEncryptionKey();
      recheckCurrentStep();
    } on EncLoginFailure {
      stows.encPassword.value = '';
      errorMessage.value = t.login.encLoginStep.wrongEncPassword;
    } catch (e, st) {
      stows.encPassword.value = '';
      log.severe('Failed to load encryption key: $e', e, st);
      errorMessage.value = '${t.login.encLoginStep.connectionFailed}\n\n$e';
      if (kDebugMode) rethrow;
    }
  }
}
