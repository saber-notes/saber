
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:saber/components/nextcloud/login_group.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class NcLoginPage extends StatefulWidget {
  const NcLoginPage({Key? key}) : super(key: key);

  static final Uri signupUrl = Uri.parse("https://nc.saber.adil.hanney.org/index.php/apps/registration/");

  @override
  State<NcLoginPage> createState() => _NcLoginPageState();
}

class _NcLoginPageState extends State<NcLoginPage> {
  Future<bool> _tryLogin(String? url, String username, String password) async {
    NextCloudClient client = NextCloudClient.withCredentials(
      url != null ? Uri.parse(url) : NextCloudClientExtension.defaultNextCloudUri,
      username,
      password,
    );

    bool success = await client.isLoggedIn();

    if (success) _finishLogin(url, username, password, client); // don't await

    return success;
  }

  Future _finishLogin(String? url, String username, String password, NextCloudClient client) async {
    // todo: check nextcloud for existing random key
    // todo: if not found, generate new random key, encrypt it, then save to nextcloud
    // todo: store key securely on device
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
