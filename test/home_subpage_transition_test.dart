import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_screenshot/golden_screenshot.dart';
import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/components/theming/saber_theme.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/data/sentry/sentry_consent.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/main.dart';
import 'package:saber/pages/home/home.dart';

void main() {
  group('Home subpage transition', () {
    for (final brightness in Brightness.values)
      for (final mobile in [true, false])
        testGoldens(brightness.name + (mobile ? 'phone' : 'tablet'), (
          tester,
        ) async {
          FlavorConfig.setup();
          stows.sentryConsent.value = SentryConsent.granted;
          stows.layoutSize.value = mobile
              ? LayoutSize.phone
              : LayoutSize.tablet;

          final theme = SaberTheme.createThemeFromSeed(
            Colors.yellow,
            brightness,
            TargetPlatform.android,
          );
          final router = GoRouter(
            initialLocation: App.initialLocation,
            routes: <GoRoute>[
              GoRoute(
                path: '/',
                redirect: (context, state) => App.initialLocation,
              ),
              GoRoute(
                path: RoutePaths.home,
                builder: (context, state) => HomePage(
                  subpage:
                      state.pathParameters['subpage'] ?? HomePage.recentSubpage,
                  path: state.uri.queryParameters['path'],
                ),
              ),
            ],
          );
          await tester.pumpWidget(
            TranslationProvider(
              child: ExplicitlyThemedApp(
                title: 'Saber',
                router: router,
                themeMode: ThemeMode.light,
                theme: theme,
                darkTheme: theme,
              ),
            ),
          );
          await tester.loadAssets();
          await tester.pumpAndSettle();

          await tester.tap(find.byIcon(Icons.settings));
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 150));

          await expectLater(
            find.byType(MaterialApp),
            matchesGoldenFile(
              'goldens/home_subpage_transition_${brightness.name}_${mobile ? 'phone' : 'tablet'}.png',
            ),
          );
        });
  });
}
