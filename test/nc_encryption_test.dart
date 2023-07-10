import 'package:encrypt/encrypt.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';

import 'utils/test_random.dart';

void main() {
  test('Test encrypting and decrypting a filename', () async {
    FlavorConfig.setup();
    Prefs.testingMode = true;
    Prefs.init();

    Prefs.username.value = 'test.issue.118';
    Prefs.ncPassword.value = 'riNLA-2fXWY-Kay3x-jEMX5-bZr6m';
    Prefs.encPassword.value = 'test.issue.118';

    final client = NextcloudClientExtension.withSavedDetails()!;

    final String key1;
    try {
      key1 = await client.loadEncryptionKey();
    } catch (e) {
      printOnFailure('Failed to load encryption key');
      rethrow;
    }

    // Use a random file name to avoid conflicts with simultaneous tests
    final String filePathUnencrypted = '/test.issue.118.${randomString(10)}';
    printOnFailure('File path unencrypted: $filePathUnencrypted');

    final Encrypter encrypter = await client.encrypter;
    final IV iv = IV.fromBase64(Prefs.iv.value);
    final String filePathEncrypted = encrypter.encrypt(filePathUnencrypted, iv: iv).base16;
    expect(filePathEncrypted.isNotEmpty, true, reason: 'Encrypted file path is empty');

    final key2 = await client.loadEncryptionKey();
    expect(key1 == key2, true, reason: 'Key changed');

    final String filePathDecrypted = encrypter.decrypt(Encrypted.fromBase16(filePathEncrypted), iv: iv);
    expect(filePathDecrypted == filePathUnencrypted, true, reason: 'Decrypted file path is not the same as the original');
  });
}
