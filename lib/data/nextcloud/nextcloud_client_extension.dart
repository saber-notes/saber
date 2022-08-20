
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:saber/data/pref_keys.dart';

extension NextCloudClientExtension on NextCloudClient {
  static Uri defaultNextCloudUri = Uri.parse('https://nc.saber.adil.hanney.org');

  static Future<NextCloudClient?> fromSavedDetails() async {
    final encryptedPrefs = EncryptedSharedPreferences();

    String url = await encryptedPrefs.getString(PrefKeys.url);
    String username = await encryptedPrefs.getString(PrefKeys.username);
    String password = await encryptedPrefs.getString(PrefKeys.password);

    if (username.isEmpty || password.isEmpty) return null;

    // todo: get saved details from secure storage
    return NextCloudClient.withCredentials(
      url.isNotEmpty ? Uri.parse(url) : defaultNextCloudUri,
      username,
      password,
    );
  }
}
