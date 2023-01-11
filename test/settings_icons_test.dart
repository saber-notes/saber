
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/home/settings.dart';

void main() {
  testWidgets("Test Settings icons are properly chosen", (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    FlavorConfig.setup();
    Prefs.testingMode = true;
    Prefs.init();

    await tester.pumpWidget(const MaterialApp(home: SettingsPage()));
    await tester.pumpAndSettle();

    // Static icons
    expect(find.byIcon(Icons.language), findsAtLeastNWidgets(1));
    expect(find.byIcon(Icons.colorize), findsAtLeastNWidgets(1));
    expect(find.byIcon(Icons.system_update), findsAtLeastNWidgets(1));
    expect(find.byIcon(Icons.fullscreen), findsAtLeastNWidgets(1));
    expect(find.byIcon(Icons.cleaning_services), findsAtLeastNWidgets(1));

    // Dynamic icons...

    // App theme
    // findsAtLeastNWidgets(2) because of leading + trailing icons
    Prefs.appTheme.value = ThemeMode.system.index;
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.brightness_auto), findsAtLeastNWidgets(2));
    Prefs.appTheme.value = ThemeMode.light.index;
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.light_mode), findsAtLeastNWidgets(2));
    Prefs.appTheme.value = ThemeMode.dark.index;
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.dark_mode), findsAtLeastNWidgets(2));

    // Hyperlegible font
    Prefs.hyperlegibleFont.value = false;
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.font_download_off), findsAtLeastNWidgets(1));
    Prefs.hyperlegibleFont.value = true;
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.font_download), findsAtLeastNWidgets(1));

    // Editor toolbar on bottom
    Prefs.editorToolbarOnBottom.value = false;
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.vertical_align_top), findsAtLeastNWidgets(1));
    Prefs.editorToolbarOnBottom.value = true;
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.vertical_align_bottom), findsAtLeastNWidgets(1));

    // Editor auto invert
    Prefs.editorAutoInvert.value = false;
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.invert_colors_off), findsAtLeastNWidgets(1));
    Prefs.editorAutoInvert.value = true;
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.invert_colors_on), findsAtLeastNWidgets(1));

    // Prefer greyscale
    Prefs.preferGreyscale.value = false;
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.enhance_photo_translate), findsAtLeastNWidgets(1));
    Prefs.preferGreyscale.value = true;
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.monochrome_photos), findsAtLeastNWidgets(1));

    // Editor straighten lines
    Prefs.editorStraightenDelay.value = 0;
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.gesture), findsAtLeastNWidgets(1));
    Prefs.editorStraightenDelay.value = 500;
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.straighten), findsAtLeastNWidgets(1));
    Prefs.editorStraightenDelay.value = 1000;
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.straighten), findsAtLeastNWidgets(1));

    // Editor prompt rename
    Prefs.editorPromptRename.value = false;
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.keyboard_hide), findsAtLeastNWidgets(1));
    Prefs.editorPromptRename.value = true;
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.keyboard), findsAtLeastNWidgets(1));
  });
}
