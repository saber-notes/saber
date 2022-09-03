
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:saber/components/nextcloud/login_group.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';
import 'package:url_launcher/url_launcher.dart';

class NcLoginPage extends StatefulWidget {
  const NcLoginPage({super.key});

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
    Prefs.url.value = url.toString();
    Prefs.username.value = username;
    Prefs.password.value = password;

    Prefs.pfp.value = ""; // trigger listeners while awaiting
    String avatar = await client.avatar.getAvatar(username, 512);
    Prefs.pfp.value = avatar;

    String key = await client.getEncryptionKey();
    if (kDebugMode) print("generated key: $key");

    // ignore: use_build_context_synchronously
    context.pop();
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
                Hero(
                  tag: Prefs.pfp.key,
                  child: const Image(image: AssetImage("assets/icon/icon.png"), width: 200, height: 200),
                ),

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
