import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/sentry/sentry_consent.dart';
import 'package:saber/data/sentry/sentry_init.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:url_launcher/url_launcher.dart';

class SentryConsentDialog extends StatelessWidget {
  const SentryConsentDialog({super.key});

  static Future<void> showIfNeeded(BuildContext context) async {
    // Don't ask on FOSS builds
    if (!isSentryAvailable) return;

    // Don't ask if consent is already known
    assert(stows.sentryConsent.loaded,
        'Sentry consent should be loaded in initSentry');
    if (stows.sentryConsent.value != SentryConsent.unknown) return;

    // Show the dialog
    await show(context);
  }

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const SentryConsentDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(t.sentry.consent.title),
      scrollable: true,
      content: RichText(
        text: TextSpan(style: TextTheme.of(context).bodyMedium, children: [
          TextSpan(text: t.sentry.consent.description.question),
          const TextSpan(text: '\n\n'),
          TextSpan(text: t.sentry.consent.description.scope),
          const TextSpan(text: '\n\n'),
          TextSpan(
            text: isSentryEnabled
                ? t.sentry.consent.description.currentlyOn
                : t.sentry.consent.description.currentlyOff,
          ),
          const TextSpan(text: '\n\n'),
          t.sentry.consent.description.learnMoreInPrivacyPolicy(
            link: (text) => TextSpan(
              text: text,
              style: TextStyle(color: ColorScheme.of(context).primary),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrl(AppInfo.privacyPolicyUrl);
                },
            ),
          ),
        ]),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            stows.sentryConsent.value = SentryConsent.granted;
            Navigator.of(context).pop();
          },
          child: Text(t.sentry.consent.answers.yes),
        ),
        ElevatedButton(
          onPressed: () {
            stows.sentryConsent.value = SentryConsent.denied;
            Navigator.of(context).pop();
          },
          child: Text(t.sentry.consent.answers.no),
        ),
        if (stows.sentryConsent.value == SentryConsent.unknown)
          ElevatedButton(
            onPressed: () {
              stows.sentryConsent.value = SentryConsent.unknown;
              Navigator.of(context).pop();
            },
            child: Text(t.sentry.consent.answers.later),
          ),
      ],
    );
  }
}
