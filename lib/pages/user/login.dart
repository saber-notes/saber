import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:nextcloud/core.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:saber/components/misc/faq.dart';
import 'package:saber/components/nextcloud/login_group.dart';
import 'package:saber/components/theming/sliver_width_box.dart';
import 'package:saber/data/nextcloud/nc_http_overrides.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

class NcLoginPage extends StatefulWidget {
  const NcLoginPage({super.key});

  static final Uri signupUrl = Uri.parse('https://nc.saber.adil.hanney.org/index.php/apps/registration/');

  @override
  State<NcLoginPage> createState() => _NcLoginPageState();
}

class _NcLoginPageState extends State<NcLoginPage> {
  final log = Logger('_NcLoginPageState');

  Future<void> _tryLogin(LoginDetailsStruct loginDetails) async {
    NcHttpOverrides.tempAcceptBadCertificateFrom(loginDetails.uri);
    NextcloudClient client = NextcloudClient(
      loginDetails.uri,
      loginName: loginDetails.loginName,
      password: loginDetails.ncPassword,
    );

    final OcsGetCapabilitiesResponseApplicationJson_Ocs_Data capabilities;
    final bool ncServerIsSupported;
    final int ncSupportedVersion;
    try {
      capabilities = await client.core.ocs.getCapabilities()
        .then((capabilities) => capabilities.body.ocs.data);
      (isSupported: ncServerIsSupported, minimumVersion: ncSupportedVersion) = client.core.isSupported(capabilities);
      log.info('ncServerIsSupported: $ncServerIsSupported, ncSupportedVersion: $ncSupportedVersion');
    } catch (e) {
      log.severe('Failed to get capabilities: $e', e);
      throw NcLoginFailure();
    }
    if (!ncServerIsSupported) {
      log.warning('Nextcloud server is not supported');
      throw NcUnsupportedFailure(
        currentVersion: capabilities.version.major,
        supportedVersion: ncSupportedVersion,
      );
    }

    final String username;
    try {
      username = await client.getUsername();
    } catch (e) {
      log.severe('Failed to get username: $e', e);
      throw NcLoginFailure();
    }

    // set username so we can use WebDAV
    client = NextcloudClient(
      loginDetails.uri,
      loginName: username,
      password: loginDetails.ncPassword,
    );

    String previousEncPassword = Prefs.encPassword.value;
    try {
      Prefs.encPassword.value = loginDetails.encPassword;
      await client.loadEncryptionKey();
    } on EncLoginFailure {
      // If the encryption password is wrong, we don't want to save it
      log.severe('Failed to load encryption key, wrong encryption password');
      Prefs.encPassword.value = previousEncPassword;
      rethrow;
    } catch (e) { // Probably a webdav error
      log.severe('Failed to load encryption key: $e', e);
      Prefs.encPassword.value = previousEncPassword;
      if (kDebugMode) rethrow;
      throw NcLoginFailure();
    }

    Prefs.url.value = loginDetails.uri.toString();
    Prefs.username.value = username;
    Prefs.ncPassword.value = loginDetails.ncPassword;

    Prefs.pfp.value = null;
    client.core.avatar.getAvatar(userId: username, size: 512)
        .then((response) => response.body)
        .then((Uint8List pfp) {
          Prefs.pfp.value = pfp;
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
      body: CustomScrollView(
        slivers: [
          SliverWidthBox(
            width: 350,
            sliver: SliverList.list(
              children: [
                const SizedBox(height: 16),
                SvgPicture.asset(
                  'assets/images/undraw_cloud_sync_re_02p1.svg',
                  width: 350,
                  height: 240,
                  excludeFromSemantics: true,
                ),

                const SizedBox(height: 64),
                LoginInputGroup(
                  tryLogin: _tryLogin,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          SliverWidthBox(
            width: 350,
            sliver: SliverFaq(
              items: [
                for (final item in t.login.faq) FaqItem(item.q, item.a),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
