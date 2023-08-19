import 'package:flutter/material.dart';
import 'package:saber/components/misc/faq.dart';
import 'package:saber/components/theming/sliver_width_box.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverWidthBox(
            width: 350,
            sliver: SliverList.list(
              children: [
                const SizedBox(height: 16),
                if (Prefs.pfp.value == null)
                  const Icon(Icons.account_circle, size: 48 * 2)
                else
                  Center(
                    child: ClipPath(
                      clipper: ShapeBorderClipper(
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(40 * 2),
                        ),
                      ),
                      child: Image.memory(
                        Prefs.pfp.value!,
                        width: 48 * 2,
                        height: 48 * 2,
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                Text(Prefs.username.value),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    logout();
                    Navigator.of(context).pop();
                  },
                  child: Text(t.profile.logout),
                ),
                const SizedBox(height: 16),
                Text(t.profile.quickLinks.title),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    TextButton(
                      onPressed: () {
                        launchUrl(Uri.parse(Prefs.url.value));
                      },
                      child: Text(t.profile.quickLinks.serverHomepage),
                    ),
                    TextButton(
                      onPressed: () {
                        launchUrl(
                          Uri.parse('${Prefs.url.value}/index.php/settings/user/drop_account'),
                        );
                      },
                      child: Text(t.profile.quickLinks.deleteAccount),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          SliverWidthBox(
            width: 350,
            sliver: SliverFaq(
              items: [
                for (final item in t.profile.faq) FaqItem(item.q, item.a),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
