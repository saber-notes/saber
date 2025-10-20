import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/components/settings/update_manager.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/components/theming/adaptive_linear_progress_indicator.dart';
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
  var downloadNotAvailableYet = false;

  /// Null if not started yet, or the [TaskStatus] of the download.
  TaskStatus? directDownloadStatus;

  /// Null if not started yet, or the progress (0.0 to 1.0) of the download.
  final directDownloadProgress = ValueNotifier<double?>(null);

  late final localeCode = LocaleSettings.currentLocale == AppLocale.en
      ? null
      : LocaleSettings.currentLocale.languageTag;
  String? englishChangelog;
  String? translatedChangelog;
  var showTranslatedChangelog = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    directDownloadProgress.dispose();
    super.dispose();
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

  bool get _canStartDownload {
    if (downloadNotAvailableYet) return false;
    if (directDownloadStatus?.isNotFinalState ?? false) return false;
    return true;
  }

  Future<void> _startDownload() async {
    if (!_canStartDownload) return;
    if (directDownloadLink == null) {
      launchUrl(AppInfo.releasesUrl);
      return;
    }
    if (!mounted) return;

    await UpdateManager.directlyDownloadUpdate(
      directDownloadLink!,
      onStatus: (status) {
        directDownloadStatus = status;
        if (mounted) setState(() {});
      },
      onProgress: (progress) {
        directDownloadProgress.value = progress;
      },
    );
    if (mounted) setState(() {});
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
              style: TextStyle(color: ColorScheme.of(context).error),
            ),

          ValueListenableBuilder(
            valueListenable: directDownloadProgress,
            builder: (context, progress, _) {
              if (progress == null) return const SizedBox();
              return Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: AdaptiveLinearProgressIndicator(value: progress),
              );
            },
          ),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context),
          child: Text(
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
          ),
        ),
        CupertinoDialogAction(
          onPressed: _canStartDownload ? _startDownload : null,
          child: Text(t.update.update),
        ),
      ],
    );
  }
}
