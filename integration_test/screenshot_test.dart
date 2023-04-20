import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/main_common.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('screenshot test', (WidgetTester tester) async {
    FlavorConfig.setup();
    Prefs.testingMode = true;
    Prefs.init();

    Prefs.username.value = 'saberdemo';
    // Prefs.ncPassword.value = '';
    // Prefs.encPassword.value = '';
    expect(Prefs.ncPassword.value, isNotEmpty);
    expect(Prefs.encPassword.value, isNotEmpty);

    final client = NextcloudClientExtension.withSavedDetails();
    await client!.loadEncryptionKey();

    tester.runAsync(app.main);
    await tester.pumpAndSettle();

    await binding.convertFlutterSurfaceToImage();
    await binding.takeScreenshot('screenshot');
  });
}
