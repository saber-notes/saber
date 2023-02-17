
import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:saber/components/nextcloud/login_group.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';

extension NextcloudClientExtension on NextcloudClient {
  static const String defaultNextCloudUri = 'https://nc.saber.adil.hanney.org';

  static String appRootDirectoryPrefix = FileManager.appRootDirectoryPrefix;
  static String configFilePath = '$appRootDirectoryPrefix/config.sbc';

  static const _utf8Decoder = Utf8Decoder(allowMalformed: true);

  static const String reproducibleSalt = r'8MnPs64@R&mF8XjWeLrD';

  static NextcloudClient? withSavedDetails() {
    String url = Prefs.url.value;
    String username = Prefs.username.value;
    String ncPassword = Prefs.ncPassword.value;

    if (username.isEmpty || ncPassword.isEmpty) return null;

    return NextcloudClient(
      url.isNotEmpty ? url : defaultNextCloudUri,
      loginName: username,
      username: username,
      password: ncPassword,
    );
  }

  Future<Map<String, String>> getConfig() async {
    final Uint8List file;
    await webdav.mkdir(appRootDirectoryPrefix);
    try {
      file = await webdav.download(configFilePath);
    } on NextcloudApiException {
      return {};
    }
    List bytes = jsonDecode(_utf8Decoder.convert(file));
    String json = _utf8Decoder.convert(bytes.cast<int>());
    return Map<String, String>.from(jsonDecode(json));
  }
  Future<void> setConfig(Map<String, String> config) async {
    String json = jsonEncode(config);
    Uint8List file = Uint8List.fromList(json.codeUnits);
    await webdav.mkdir(appRootDirectoryPrefix);
    await webdav.upload(file, configFilePath);
  }

  Future<String> loadEncryptionKey() async {
    final Encrypter encrypter = await this.encrypter;

    final Map<String, String> config = await getConfig();
    if (config.containsKey(Prefs.key.key) && config.containsKey(Prefs.iv.key)) {
      final IV iv = IV.fromBase64(config[Prefs.iv.key]!);
      final String encryptedKey = config[Prefs.key.key]!;
      try {
        final String key = encrypter.decrypt64(encryptedKey, iv: iv);
        Prefs.key.value = key;
        Prefs.iv.value = iv.base64;
        return key;
      } catch (e) {
        // can't decrypt, so we need to get the previous encryption key (user's password)
        throw EncLoginFailure();
      }
    }

    final Key key = Key.fromSecureRandom(32);
    final IV iv = IV.fromSecureRandom(16);

    config[Prefs.key.key] = encrypter.encrypt(key.base64, iv: iv).base64;
    config[Prefs.iv.key] = iv.base64;
    await setConfig(config);

    Prefs.key.value = key.base64;
    Prefs.iv.value = iv.base64;

    return key.base64;
  }

  Future<String> getUsername() async {
    try {
      return (await provisioningApi.getCurrentUser()).ocs.data.id;
    } catch (e) {
      throw NcLoginFailure();
    }
  }

  Future<Encrypter> get encrypter async {
    final List<int> encodedPassword = utf8.encode(Prefs.encPassword.value + reproducibleSalt);
    final List<int> hashedPasswordBytes = sha256.convert(encodedPassword).bytes;
    final Key passwordKey = Key(hashedPasswordBytes as Uint8List);
    return Encrypter(AES(passwordKey));
  }
}
