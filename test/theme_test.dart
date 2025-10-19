import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

void main() {
  group('Theme', () {
    setUpAll(() {
      FlavorConfig.setup();
    });

    for (final platform in TargetPlatform.values)
      for (final hyperlegible in const [false, true])
        for (final hasAccent in const [false, true])
          _testTheme(
            platform: platform,
            hyperlegible: hyperlegible,
            hasAccent: hasAccent,
          );
  });
}

void _testTheme({
  required TargetPlatform platform,
  required bool hyperlegible,
  required bool hasAccent,
}) {
  final repr =
      '${platform.name}_'
      '${hyperlegible ? 'hyperlegible' : 'inter'}_'
      '${hasAccent ? 'with-accent' : 'no-accent'}';
  testWidgets(repr, (tester) async {
    final router = GoRouter(
      routes: [GoRoute(path: '/', builder: (_, _) => const Text('hi'))],
    );

    stows.platform.value = platform;
    stows.hyperlegibleFont.value = hyperlegible;
    stows.accentColor.value = hasAccent ? const Color(0xFF00FF00) : null;
    addTearDown(() {
      stows.platform.value = stows.platform.defaultValue;
      stows.hyperlegibleFont.value = stows.hyperlegibleFont.defaultValue;
      stows.accentColor.value = stows.accentColor.defaultValue;
    });

    await tester.pumpWidget(
      TranslationProvider(
        child: DynamicMaterialApp(title: 'title', router: router),
      ),
    );

    final app = tester.widget<ExplicitlyThemedApp>(
      find.byType(ExplicitlyThemedApp),
    );
    for (final theme in [app.theme, app.darkTheme]) {
      expect(theme.platform, platform);

      if (hasAccent) {
        final actualAccent = HSVColor.fromColor(theme.colorScheme.primary);
        expect(
          [actualAccent.hue, actualAccent.saturation, actualAccent.value],
          [inInclusiveRange(90, 150), greaterThan(0.25), greaterThan(0.4)],
          reason: 'Accent should be green',
        );
      }

      final expectedFontFamily = hyperlegible
          ? 'AtkinsonHyperlegibleNext'
          : switch (platform) {
              TargetPlatform.iOS => RegExp('CupertinoSystem(Display|Text)'),
              TargetPlatform.linux => 'packages/yaru/Ubuntu',
              TargetPlatform.macOS => '.AppleSystemUIFont',
              TargetPlatform.windows => 'Segoe UI',
              _ => 'Roboto',
            };
      for (final font in _extractFonts(theme.textTheme)) {
        expect(font, matches(expectedFontFamily));
      }
    }
  });
}

List<String?> _extractFonts(TextTheme textTheme) {
  return [textTheme.displayLarge?.fontFamily, textTheme.bodyLarge?.fontFamily];
}
