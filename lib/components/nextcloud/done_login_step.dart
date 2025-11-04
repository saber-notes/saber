import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logging/logging.dart';
import 'package:saber/components/misc/faq.dart';
import 'package:saber/data/extensions/quota_extension.dart';
import 'package:saber/data/extensions/string_extensions.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/nextcloud/readable_bytes.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:url_launcher/url_launcher.dart';

class DoneLoginStep extends StatefulWidget {
  const DoneLoginStep({super.key, required this.recheckCurrentStep});

  final void Function() recheckCurrentStep;

  @override
  State<DoneLoginStep> createState() => _DoneLoginStepState();
}

class _DoneLoginStepState extends State<DoneLoginStep> {
  static const width = 400.0;

  late final log = Logger('DoneLoginStep');

  void _logout() {
    stows.url.value = '';
    stows.username.value = '';
    stows.ncPassword.value = '';
    stows.encPassword.value = '';
    stows.pfp.value = null;
    stows.lastStorageQuota.value = null;
    stows.key.value = '';
    stows.iv.value = '';
    widget.recheckCurrentStep();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final quota = stows.lastStorageQuota.value;
    final serverName =
        stows.url.value.ifNotEmpty ?? t.login.ncLoginStep.saberNcServer;
    late final serverUri = stows.url.value.isEmpty
        ? NextcloudClientExtension.defaultNextcloudUri
        : Uri.parse(stows.url.value);
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth > width ? (screenWidth - width) / 2 : 16,
        vertical: 16,
      ),
      children: [
        const SizedBox(height: 16),
        if (screenHeight > 500) ...[
          SvgPicture.asset(
            'assets/images/undraw_my_files_swob.svg',
            width: width,
            height: min(width * 576 / 844.6693, screenHeight * 0.25),
            excludeFromSemantics: true,
          ),
          SizedBox(height: min(64, screenHeight * 0.05)),
        ],
        Row(
          children: [
            if (stows.pfp.value == null)
              if (stows.url.value.isEmpty)
                SvgPicture.asset('assets/icon/icon.svg', width: 32, height: 32)
              else
                const Icon(Icons.account_circle, size: 32)
            else
              Image.memory(stows.pfp.value!, width: 32, height: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                t.login.status.hi(u: stows.username.value),
                style: textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          t.profile.quotaUsage(
            used: readableBytes(quota?.used),
            total: readableBytes(quota?.total),
            percent: quota?.percentRounded ?? 0,
          ),
        ),
        const SizedBox(height: 2),
        LinearProgressIndicator(
          value: quota?.progressIndicatorValue,
          minHeight: 32,
          borderRadius: _elevatedButtonBorderRadiusOf(context),
        ),
        const SizedBox(height: 4),
        ElevatedButton(onPressed: _logout, child: Text(t.profile.logout)),
        const SizedBox(height: 32),
        Text(t.profile.connectedTo, style: const TextStyle(height: 0.8)),
        Text(serverName, style: textTheme.headlineSmall),
        const SizedBox(height: 4),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: ElevatedButton(
                onPressed: () {
                  log.info('Opening URL: $serverUri');
                  launchUrl(serverUri);
                },
                child: Text(t.profile.quickLinks.serverHomepage),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              fit: FlexFit.tight,
              child: ElevatedButton(
                onPressed: () {
                  final url = '$serverUri/index.php/settings/user/drop_account';
                  log.info('Opening URL: $url');
                  launchUrl(Uri.parse(url));
                },
                child: Text(t.profile.quickLinks.deleteAccount),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Text(t.profile.faqTitle, style: textTheme.headlineSmall),
        FaqListView(
          shrinkWrap: true,
          items: [for (final item in t.profile.faq) FaqItem(item.q, item.a)],
        ),
      ],
    );
  }
}

BorderRadius _elevatedButtonBorderRadiusOf(BuildContext context) {
  final shape = ElevatedButtonTheme.of(context).style?.shape?.resolve({});
  if (shape is RoundedRectangleBorder) {
    return shape.borderRadius.resolve(TextDirection.ltr);
  } else {
    return BorderRadius.circular(8);
  }
}
