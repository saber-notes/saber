import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:saber/components/misc/faq.dart';
import 'package:saber/components/nextcloud/login_group.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

class NcLoginPage extends StatefulWidget {
  const NcLoginPage({super.key});

  static final Uri signupUrl = Uri.parse("https://nc.saber.adil.hanney.org/index.php/apps/registration/");

  @override
  State<NcLoginPage> createState() => _NcLoginPageState();
}

class _NcLoginPageState extends State<NcLoginPage> {
  Future<void> _tryLogin(LoginDetailsStruct loginDetails) async {
    NextcloudClient client = NextcloudClient(
      loginDetails.url,
      loginName: loginDetails.loginName,
      password: loginDetails.ncPassword,
    );

    final String username;
    try {
      username = await client.getUsername();
    } catch (e) {
      throw NcLoginFailure();
    }

    // set username so we can use WebDAV
    client = NextcloudClient(
      loginDetails.url,
      loginName: username,
      username: username,
      password: loginDetails.ncPassword,
    );

    String previousEncPassword = Prefs.encPassword.value;
    try {
      Prefs.encPassword.value = loginDetails.encPassword;
      await client.loadEncryptionKey();
    } on EncLoginFailure {
      // If the encryption password is wrong, we don't want to save it
      Prefs.encPassword.value = previousEncPassword;
      rethrow;
    } catch (e) { // Probably a webdav error
      Prefs.encPassword.value = previousEncPassword;
      if (kDebugMode) rethrow;
      throw NcLoginFailure();
    }

    Prefs.url.value = loginDetails.url.toString();
    Prefs.username.value = username;
    Prefs.ncPassword.value = loginDetails.ncPassword;

    Prefs.pfp.value = "";
    client.core.getAvatar(userId: username, size: 512)
        .then((Uint8List avatar) {
      Prefs.pfp.value = base64Encode(avatar);
    });

    Prefs.lastStorageQuota.value = null;

    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: Text(t.login.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              children: [
                const SizedBox(height: 16),
                SvgPicture.asset(
                  "assets/images/undraw_cloud_sync_re_02p1.svg",
                  width: 350,
                  height: 240,
                  excludeFromSemantics: true,
                ),

                const SizedBox(height: 64),
                LoginInputGroup(
                  tryLogin: _tryLogin,
                ),
                const SizedBox(height: 40),

                Faq(
                  items: [
                    for (final item in t.login.faq) FaqItem(item.q, item.a),
                  ],
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
