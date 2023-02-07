
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/home/settings.dart';

void main() {
  testWidgets("Test Settings icons are properly chosen", (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    FlavorConfig.setup();
    Prefs.testingMode = true;
    Prefs.init();

    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const SettingsPage(),
        ),
      ],
    );

    await tester.pumpWidget(TranslationProvider(
      child: DynamicMaterialApp(
        title: 'Saber',
        router: router,
      ),
    ));
    await tester.pumpAndSettle();

    // Static icons
    expect(findIcon(Icons.language), findsAtLeastNWidgets(1));
    expect(findIcon(Icons.colorize), findsAtLeastNWidgets(1));
    expect(findIcon(Icons.fullscreen), findsAtLeastNWidgets(1));
    expect(findIcon(Icons.cleaning_services), findsAtLeastNWidgets(1));
    expect(findIcon(Icons.photo_size_select_large), findsAtLeastNWidgets(1));

    // Dynamic icons...

    // App theme
    // findsAtLeastNWidgets(2) because of leading + trailing icons
    Prefs.appTheme.value = ThemeMode.system.index;
    await tester.pumpAndSettle();
    expect(findIcon(Icons.brightness_auto), findsAtLeastNWidgets(2));
    Prefs.appTheme.value = ThemeMode.light.index;
    await tester.pumpAndSettle();
    expect(findIcon(Icons.light_mode), findsAtLeastNWidgets(2));
    Prefs.appTheme.value = ThemeMode.dark.index;
    await tester.pumpAndSettle();
    expect(findIcon(Icons.dark_mode), findsAtLeastNWidgets(2));

    // Theme type
    // findsAtLeastNWidgets(2) because of leading + trailing icons
    Prefs.platform.value = -1;
    await tester.pumpAndSettle();
    expect(findIcon(FontAwesomeIcons.firefoxBrowser), findsAtLeastNWidgets(2));
    Prefs.platform.value = TargetPlatform.iOS.index;
    await tester.pumpAndSettle();
    expect(findIcon(Icons.apple), findsAtLeastNWidgets(2));
    Prefs.platform.value = -1;

    // Hyperlegible font
    Prefs.hyperlegibleFont.value = false;
    await tester.pumpAndSettle();
    expect(findIcon(Icons.font_download_off), findsAtLeastNWidgets(1));
    Prefs.hyperlegibleFont.value = true;
    await tester.pumpAndSettle();
    expect(findIcon(Icons.font_download), findsAtLeastNWidgets(1));

    // Editor toolbar on bottom
    Prefs.editorToolbarOnBottom.value = false;
    await tester.pumpAndSettle();
    expect(findIcon(Icons.vertical_align_top), findsAtLeastNWidgets(1));
    Prefs.editorToolbarOnBottom.value = true;
    await tester.pumpAndSettle();
    expect(findIcon(Icons.vertical_align_bottom), findsAtLeastNWidgets(1));

    // Editor auto invert
    Prefs.editorAutoInvert.value = false;
    await tester.pumpAndSettle();
    expect(findIcon(Icons.invert_colors_off), findsAtLeastNWidgets(1));
    Prefs.editorAutoInvert.value = true;
    await tester.pumpAndSettle();
    expect(findIcon(Icons.invert_colors_on), findsAtLeastNWidgets(1));

    // Prefer greyscale
    Prefs.preferGreyscale.value = false;
    await tester.pumpAndSettle();
    expect(findIcon(Icons.enhance_photo_translate), findsAtLeastNWidgets(1));
    Prefs.preferGreyscale.value = true;
    await tester.pumpAndSettle();
    expect(findIcon(Icons.monochrome_photos), findsAtLeastNWidgets(1));

    // Editor straighten lines
    Prefs.editorStraightenDelay.value = 0;
    await tester.pumpAndSettle();
    expect(findIcon(Icons.gesture), findsAtLeastNWidgets(1));
    Prefs.editorStraightenDelay.value = 500;
    await tester.pumpAndSettle();
    expect(findIcon(Icons.straighten), findsAtLeastNWidgets(1));
    Prefs.editorStraightenDelay.value = 1000;
    await tester.pumpAndSettle();
    expect(findIcon(Icons.straighten), findsAtLeastNWidgets(1));

    // Editor prompt rename
    Prefs.editorPromptRename.value = false;
    await tester.pumpAndSettle();
    expect(findIcon(Icons.keyboard_hide), findsAtLeastNWidgets(1));
    Prefs.editorPromptRename.value = true;
    await tester.pumpAndSettle();
    expect(findIcon(Icons.keyboard), findsAtLeastNWidgets(1));
  });
}

/// Finds an [Icon] or [FaIcon] widget with the given IconData.
Finder findIcon(IconData icon) {
  return find.byWidgetPredicate((widget) {
    if (widget is Icon) {
      return widget.icon == icon;
    } else if (widget is FaIcon) {
      return widget.icon == icon;
    }
    return false;
  });
}
