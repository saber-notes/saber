import 'package:flutter/material.dart';
import 'package:saber/components/home/sentry_consent_dialog.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/sentry/sentry_init.dart';
import 'package:saber/i18n/strings.g.dart';

class SettingsSentryConsent extends StatelessWidget {
  const SettingsSentryConsent({super.key});

  String _getSubtitle() {
    final isActive = isSentryEnabled;
    if (isActive) {
      final willStayActive = stows.sentryConsent.value == .granted;
      return willStayActive
          ? t.settings.prefDescriptions.sentry.active
          : t.settings.prefDescriptions.sentry.activeUntilRestart;
    } else {
      final willStayInactive = stows.sentryConsent.value != .granted;
      return willStayInactive
          ? t.settings.prefDescriptions.sentry.inactive
          : t.settings.prefDescriptions.sentry.inactiveUntilRestart;
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = t.settings.prefLabels.sentry;
    return ValueListenableBuilder(
      valueListenable: stows.sentryConsent,
      builder: (context, consent, child) {
        final subtitle = _getSubtitle();
        return ListTile(
          contentPadding: const .symmetric(vertical: 4, horizontal: 16),
          leading: const Icon(Icons.bug_report),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontStyle:
                  stows.sentryConsent.value != stows.sentryConsent.defaultValue
                  ? FontStyle.italic
                  : null,
            ),
          ),
          subtitle: Text(subtitle, style: const TextStyle(fontSize: 13)),
          onTap: () => SentryConsentDialog.show(context),
          onLongPress: () => SentryConsentDialog.show(context),
        );
      },
    );
  }
}
