
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:saber/components/nextcloud/login_group.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/pref_keys.dart';
import 'package:url_launcher/url_launcher.dart';

class NcLoginPage extends StatefulWidget {
  const NcLoginPage({Key? key}) : super(key: key);

  static final Uri signupUrl = Uri.parse("https://nc.saber.adil.hanney.org/index.php/apps/registration/");

  @override
  State<NcLoginPage> createState() => _NcLoginPageState();
}

class _NcLoginPageState extends State<NcLoginPage> {
  Future<bool> _tryLogin(String? urlString, String usernameEmail, String password) async {
    final Uri url = urlString != null ? Uri.parse(urlString) : NextCloudClientExtension.defaultNextCloudUri;

    final NextCloudClient client = NextCloudClient.withCredentials(
      url,
      usernameEmail,
      password,
    );

    final String username;
    try {
      UserData userData = await client.user.getUser();
      username = userData.displayName;
    } catch (e) {
      return false;
    }

    _finishLogin(url, username, password, client); // don't await

    return true;
  }

  Future _finishLogin(Uri url, String username, String password, NextCloudClient client) async {
    // encrypted prefs
    var encryptedPrefs = EncryptedSharedPreferences();
    await encryptedPrefs.setString(PrefKeys.url, url.toString());
    await encryptedPrefs.setString(PrefKeys.username, username);

    /// unencrypted prefs
    var unsafePrefs = await encryptedPrefs.getInstance();
    var avatar = await client.avatar.getAvatar(username, 512);
    await unsafePrefs.setString(PrefKeys.pfp, avatar);

    // todo: check nextcloud for existing random key
    // todo: if not found, generate new random key, encrypt it, then save to nextcloud
    // todo: store key in encrypted prefs
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Image(image: AssetImage("assets/icon/icon.png"), width: 200, height: 200),
                const SizedBox(height: 64),
                LoginInputGroup(
                  tryLogin: _tryLogin,
                ),

                const SizedBox(height: 64),

                RichText(
                  text: TextSpan(
                    style: TextStyle(color: colorScheme.onBackground),
                    children: [
                      const TextSpan(text: "Don't have an account yet? "),
                      TextSpan(
                        text: "Sign up now",
                        style: TextStyle(color: colorScheme.primary),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          launchUrl(
                            NcLoginPage.signupUrl,
                            mode: LaunchMode.externalApplication,
                          );
                        },
                      ),
                      const TextSpan(text: "!"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
