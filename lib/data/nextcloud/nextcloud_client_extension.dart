
import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:saber/data/file_manager.dart';
import 'package:saber/data/pref_keys.dart';

extension NextCloudClientExtension on NextCloudClient {
  static Uri defaultNextCloudUri = Uri.parse('https://nc.saber.adil.hanney.org');

  static String appRootDirectoryPrefix = FileManager.appRootDirectoryPrefix;

  static const _utf8Decoder = Utf8Decoder(allowMalformed: true);

  /// generated with [BCrypt.gensalt()]
  static const String reproducibleSalt = r"8MnPs64@R&mF8XjWeLrD";

  static Future<NextCloudClient?> fromSavedDetails() async {
    final encryptedPrefs = EncryptedSharedPreferences();

    String url = await encryptedPrefs.getString(PrefKeys.encUrl);
    String username = await encryptedPrefs.getString(PrefKeys.encUsername);
    String password = await encryptedPrefs.getString(PrefKeys.encPassword);

    if (username.isEmpty || password.isEmpty) return null;

    // todo: get saved details from secure storage
    return NextCloudClient.withCredentials(
      url.isNotEmpty ? Uri.parse(url) : defaultNextCloudUri,
      username,
      password,
    );
  }

  Future<Map<String, String>> getPrefs() async {
    final Uint8List file;
    await webDav.mkdir(appRootDirectoryPrefix);
    try {
      file = await webDav.download('$appRootDirectoryPrefix/prefs.sba');
    } on RequestException {
      return {};
    }
    String json = _utf8Decoder.convert(file);
    return Map<String, String>.from(jsonDecode(json));
  }
  Future<void> setPrefs(Map<String, String> prefs) async {
    String json = jsonEncode(prefs);
    Uint8List file = Uint8List.fromList(json.codeUnits);
    await webDav.mkdir(appRootDirectoryPrefix);
    await webDav.upload(file, '$appRootDirectoryPrefix/prefs.sba');
  }

  Future<String> getEncryptionKey(String password) async {
    final List<int> encodedPassword = utf8.encode(password + reproducibleSalt);
    final List<int> hashedPasswordBytes = sha256.convert(encodedPassword).bytes;
    final Key passwordKey = Key(hashedPasswordBytes as Uint8List);
    final Encrypter encrypter = Encrypter(AES(passwordKey));

    final Map<String, String> prefs = await getPrefs();

    if (prefs.containsKey(PrefKeys.encKey) && prefs.containsKey(PrefKeys.encIv)) {
      final IV iv = IV.fromBase64(prefs[PrefKeys.encIv]!);
      final String encryptedKey = prefs[PrefKeys.encKey]!;
      try {
        return encrypter.decrypt64(encryptedKey, iv: iv);
      } catch (e) {
        // can't decrypt, so we need to get the previous encryption key (user's password)
        // todo: prompt user for previous password, instead of generating a new key (important)
      }
    }

    final Key key = Key.fromSecureRandom(32);
    final IV iv = IV.fromSecureRandom(16);
    prefs[PrefKeys.encKey] = encrypter.encrypt(key.base64, iv: iv).base64;
    prefs[PrefKeys.encIv] = iv.base64;
    await setPrefs(prefs);
    return key.base64;
  }
}
