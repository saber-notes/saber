
import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:saber/data/file_manager.dart';
import 'package:saber/data/prefs.dart';

extension NextCloudClientExtension on NextCloudClient {
  static Uri defaultNextCloudUri = Uri.parse('https://nc.saber.adil.hanney.org');

  static String appRootDirectoryPrefix = FileManager.appRootDirectoryPrefix;
  static String configFilePath = "$appRootDirectoryPrefix/config.sbc";

  static const _utf8Decoder = Utf8Decoder(allowMalformed: true);

  static const String reproducibleSalt = r"8MnPs64@R&mF8XjWeLrD";

  static Future<NextCloudClient?> withSavedDetails() async {
    String url = Prefs.url.value;
    String username = Prefs.username.value;
    String password = Prefs.password.value;

    if (username.isEmpty || password.isEmpty) return null;

    return NextCloudClient.withCredentials(
      url.isNotEmpty ? Uri.parse(url) : defaultNextCloudUri,
      username,
      password,
    );
  }

  Future<Map<String, String>> getConfig() async {
    final Uint8List file;
    await webDav.mkdir(appRootDirectoryPrefix);
    try {
      file = await webDav.download(configFilePath);
    } on RequestException {
      return {};
    }
    String json = _utf8Decoder.convert(file);
    return Map<String, String>.from(jsonDecode(json));
  }
  Future<void> setConfig(Map<String, String> config) async {
    String json = jsonEncode(config);
    Uint8List file = Uint8List.fromList(json.codeUnits);
    await webDav.mkdir(appRootDirectoryPrefix);
    await webDav.upload(file, configFilePath);
  }

  Future<String> getEncryptionKey() async {
    final Encrypter encrypter = await this.encrypter;

    final Map<String, String> config = await getConfig();

    if (config.containsKey(Prefs.key.key) && config.containsKey(Prefs.iv.key)) {
      final IV iv = IV.fromBase64(config[Prefs.iv.key]!);
      final String encryptedKey = config[Prefs.key.key]!;
      try {
        return encrypter.decrypt64(encryptedKey, iv: iv);
      } catch (e) {
        // can't decrypt, so we need to get the previous encryption key (user's password)
        // todo: prompt user for previous password, instead of generating a new key (important)
      }
    }

    final Key key = Key.fromSecureRandom(32);
    final IV iv = IV.fromSecureRandom(16);
    config[Prefs.key.key] = encrypter.encrypt(key.base64, iv: iv).base64;
    config[Prefs.iv.key] = iv.base64;
    await setConfig(config);
    return key.base64;
  }

  Future<Encrypter> get encrypter async {
    final List<int> encodedPassword = utf8.encode(Prefs.password.value + reproducibleSalt);
    final List<int> hashedPasswordBytes = sha256.convert(encodedPassword).bytes;
    final Key passwordKey = Key(hashedPasswordBytes as Uint8List);
    return Encrypter(AES(passwordKey));
  }
}
