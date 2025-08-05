import 'package:flutter/material.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/sentry/sentry_consent.dart';
import 'package:saber/data/sentry/sentry_init.dart';
import 'package:saber/i18n/strings.g.dart';

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
      content: SelectableText(
        [
          t.sentry.consent.description.question,
          t.sentry.consent.description.scope,
          if (isSentryEnabled)
            t.sentry.consent.description.currentlyOn
          else
            t.sentry.consent.description.currentlyOff,
        ].join('\n\n'),
        // TODO(adil192): add sentry consent to settings
        // TODO(adil192): add link to privacy policy
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
