import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/nextcloud/spinning_loading_icon.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/components/settings/update_manager.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/data/locales.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateDialog extends StatefulWidget {
  const UpdateDialog({super.key});

  @override
  State<UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  String? directDownloadLink;
  bool downloadNotAvailableYet = false;
  bool directDownloadStarted = false;

  late final localeCode = LocaleSettings.currentLocale == AppLocale.en
      ? null
      : LocaleSettings.currentLocale.languageTag;
  String? englishChangelog;
  String? translatedChangelog;
  bool showTranslatedChangelog = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    directDownloadLink = await UpdateManager.getLatestDownloadUrl();
    if (!mounted) return;
    downloadNotAvailableYet =
        UpdateManager.platformFileRegex.containsKey(defaultTargetPlatform) &&
            directDownloadLink == null;

    englishChangelog = await UpdateManager.getChangelog();
    if (!mounted) return;
    translatedChangelog = localeCode == null
        ? null
        : await UpdateManager.getChangelog(localeCode: localeCode!);
    if (!mounted) return;
    showTranslatedChangelog = translatedChangelog != null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveAlertDialog(
      title: Text(t.update.updateAvailable),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(t.update.updateAvailableDescription),
          if (showTranslatedChangelog && translatedChangelog != null)
            Text(translatedChangelog!)
          else if (englishChangelog != null)
            Text(englishChangelog!),
          if (translatedChangelog != null && englishChangelog != null)
            TextButton(
              onPressed: () => setState(() {
                showTranslatedChangelog = !showTranslatedChangelog;
              }),
              child: Text(
                showTranslatedChangelog
                    ? localeNames[localeCode] ?? localeCode!
                    : localeNames['en']!,
              ),
            ),
          if (downloadNotAvailableYet)
            Text(
              t.update.downloadNotAvailableYet,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context),
          child:
              Text(MaterialLocalizations.of(context).modalBarrierDismissLabel),
        ),
        CupertinoDialogAction(
          onPressed: (directDownloadStarted || downloadNotAvailableYet)
              ? null
              : () {
                  if (directDownloadStarted || downloadNotAvailableYet) return;
                  if (directDownloadLink == null) {
                    launchUrl(AppInfo.releasesUrl);
                    return;
                  }
                  UpdateManager.directlyDownloadUpdate(directDownloadLink!)
                      .then((_) {
                    directDownloadStarted = false;
                    if (mounted) setState(() {});
                  });
                  setState(() => directDownloadStarted = true);
                },
          child: directDownloadStarted
              ? const SpinningLoadingIcon()
              : Text(t.update.update),
        ),
      ],
    );
  }
}
