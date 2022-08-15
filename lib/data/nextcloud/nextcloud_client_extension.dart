
import 'package:nextcloud/nextcloud.dart';

extension NextCloudClientExtension on NextCloudClient {
  static Uri defaultNextCloudUri = Uri.parse('https://nc.saber.adil.hanney.org');

  static Future<NextCloudClient> fromSavedDetails() async {
    // todo: get saved details from secure storage
    return NextCloudClient.withCredentials(
      defaultNextCloudUri,
      'USERNAME',
      'PASSWORD',
    );
  }
}
