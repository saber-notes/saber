import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:http/io_client.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/provisioning_api.dart';
import 'package:nextcloud/webdav.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/nextcloud/errors.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/version.dart';

extension NextcloudClientExtension on NextcloudClient {
  static final Uri defaultNextcloudUri = Uri.parse(
    'https://nc.saber.adil.hanney.org',
  );

  static final userAgent =
      'Saber/$buildName '
      '(${Platform.operatingSystem}) '
      'Dart/${Platform.version.split(' ').first}';
  static IOClient newHttpClient() =>
      IOClient(HttpClient()..userAgent = userAgent);

  static const String appRootDirectoryPrefix =
      FileManager.appRootDirectoryPrefix;
  static const configFileName = 'config.sbc';
  static final configFileUri = PathUri.parse(
    '$appRootDirectoryPrefix/$configFileName',
  );

  static const _utf8Decoder = Utf8Decoder(allowMalformed: true);

  static const reproducibleSalt = r'8MnPs64@R&mF8XjWeLrD';

  static NextcloudClient? withSavedDetails() {
    if (!stows.loggedIn) return null;

    final url = stows.url.value;
    final username = stows.username.value;
    final ncPassword = stows.ncPassword.value;

    final client = NextcloudClient(
      url.isNotEmpty ? Uri.parse(url) : defaultNextcloudUri,
      loginName: username,
      password: ncPassword,
      appPassword: ncPassword,
      httpClient: NextcloudClientExtension.newHttpClient(),
    );

    void deAuth() {
      // Logout if the username changes
      if (stows.username.value == username) return;
      stows.username.removeListener(deAuth);
      client.authentications?.clear();
    }

    stows.username.addListener(deAuth);

    return client;
  }

  /// Downloads the config from Nextcloud
  Future<Map<String, String>> getConfig() async {
    final Uint8List bytes;
    try {
      bytes = await webdav.get(configFileUri);
    } on DynamiteApiException {
      return {};
    }

    final json = _utf8Decoder.convert(bytes);
    final decoded = jsonDecode(json) as Map<String, dynamic>;
    return decoded.cast<String, String>();
  }

  /// Generates a config using known values (i.e. from [stows]),
  /// updating the given [config] in place.
  ///
  /// This is usually preceded by a call to [getConfig]
  /// and followed by a call to [setConfig].
  ///
  /// Returns the existing [config] for convenience.
  Future<Map<String, String>> generateConfig({
    required Map<String, String> config,
    Encrypter? encrypter,
    IV? iv,
    Key? key,
  }) async {
    encrypter ??= this.encrypter;
    iv ??= IV.fromBase64(stows.iv.value);
    key ??= Key.fromBase64(stows.key.value);

    config[stows.key.key] = encrypter.encrypt(key.base64, iv: iv).base64;
    config[stows.iv.key] = iv.base64;

    return config;
  }

  /// Uploads the given [config] to Nextcloud
  Future<void> setConfig(Map<String, String> config) async {
    final json = jsonEncode(config);
    final file = Uint8List.fromList(json.codeUnits);
    try {
      await webdav.mkcol(PathUri.parse(appRootDirectoryPrefix));
    } on DynamiteStatusCodeException catch (e) {
      if (e.statusCode != HttpStatus.methodNotAllowed) rethrow;
    }
    await webdav.put(file, configFileUri);
  }

  Future<String> loadEncryptionKey({bool generateKeyIfMissing = true}) async {
    final Encrypter encrypter = this.encrypter;

    final Map<String, String> config = await getConfig();
    if (config.containsKey(stows.key.key) && config.containsKey(stows.iv.key)) {
      final IV iv = IV.fromBase64(config[stows.iv.key]!);
      final encryptedKey = config[stows.key.key]!;
      try {
        final key = encrypter.decrypt64(encryptedKey, iv: iv);
        stows.key.value = key;
        stows.iv.value = iv.base64;
        return key;
      } catch (e) {
        // can't decrypt, so we need to get the previous encryption key (user's password)
        throw EncLoginFailure();
      }
    }

    if (!generateKeyIfMissing) throw EncLoginFailure();

    final Key key = Key.fromSecureRandom(32);
    final IV iv = IV.fromSecureRandom(16);

    await generateConfig(
      config: config,
      encrypter: encrypter,
      iv: iv,
      key: key,
    );
    await setConfig(config);

    stows.key.value = key.base64;
    stows.iv.value = iv.base64;

    return key.base64;
  }

  Future<String> getUsername() async {
    final user = await provisioningApi.users.getCurrentUser();
    return user.body.ocs.data.id;
  }

  Encrypter get encrypter {
    final List<int> encodedPassword = utf8.encode(
      stows.encPassword.value + reproducibleSalt,
    );
    final List<int> hashedPasswordBytes = sha256.convert(encodedPassword).bytes;
    final Key passwordKey = Key(hashedPasswordBytes as Uint8List);
    return Encrypter(AES(passwordKey));
  }
}
