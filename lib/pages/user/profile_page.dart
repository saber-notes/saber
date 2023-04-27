import 'dart:io';

import 'package:flutter/material.dart';
import 'package:saber/components/misc/faq.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void logout() {
    Prefs.url.value = '';
    Prefs.username.value = '';
    Prefs.ncPassword.value = '';
    Prefs.encPassword.value = '';
    Prefs.pfp.value = null;
    Prefs.lastStorageQuota.value = null;
    Prefs.key.value = '';
    Prefs.iv.value = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: Text(t.profile.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              children: [
                const SizedBox(height: 16),
                if (Prefs.pfp.value == null)
                  const Icon(Icons.account_circle, size: 48 * 2)
                else
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20 * 2),
                    child: Image.memory(
                      Prefs.pfp.value!,
                      width: 48 * 2,
                      height: 48 * 2,
                    ),
                  ),
                const SizedBox(height: 16),
                Text(Prefs.username.value),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    launchUrl(
                      Uri.parse(Prefs.url.value),
                      mode: Platform.isIOS
                          ? LaunchMode.inAppWebView
                          : LaunchMode.externalApplication
                    );
                  },
                  child: Text(Prefs.url.value),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    logout();
                    Navigator.of(context).pop();
                  },
                  child: Text(t.profile.logout),
                ),
                const SizedBox(height: 16),

                Faq(
                  items: [
                    for (final item in t.profile.faq) FaqItem(item.q, item.a),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
