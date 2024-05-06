import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  void _logout() {
    Prefs.url.value = '';
    Prefs.username.value = '';
    Prefs.ncPassword.value = '';
    Prefs.encPassword.value = '';
    Prefs.pfp.value = null;
    Prefs.lastStorageQuota.value = null;
    Prefs.key.value = '';
    Prefs.iv.value = '';
    widget.recheckCurrentStep();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final quota = Prefs.lastStorageQuota.value;
    final server = Prefs.url.value.ifNotEmpty ?? 'Saber\'s Nextcloud server';
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
        const SizedBox(height: 4),
        Text(
          'You\'re using ${readableBytes(quota?.used)} of ${readableBytes(quota?.total)} (${quota?.relative}%).',
        ),
        LinearProgressIndicator(
          // At least 4% so the rounded corners render properly
          value: max((quota?.relative ?? 0) / 100, 0.04),
          minHeight: 32,
          borderRadius: BorderRadius.circular(8),
        ),
        const SizedBox(height: 4),
        ElevatedButton(
          onPressed: _logout,
          child: Text(t.profile.logout),
        ),
        const SizedBox(height: 32),
        Text('Connected to', style: textTheme.bodySmall?.copyWith(height: 1)),
        Text(server, style: textTheme.headlineSmall),
        const SizedBox(height: 4),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: ElevatedButton(
                onPressed: () => launchUrl(
                  Prefs.url.value.isEmpty
                      ? NextcloudClientExtension.defaultNextcloudUri
                      : Uri.parse(Prefs.url.value),
                ),
                child: Text(t.profile.quickLinks.serverHomepage),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              fit: FlexFit.tight,
              child: ElevatedButton(
                onPressed: () => launchUrl(
                    Uri.parse('$server/index.php/settings/user/drop_account')),
                child: Text(t.profile.quickLinks.deleteAccount),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
