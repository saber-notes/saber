import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/components/theming/saber_theme.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/data/sentry/sentry_consent.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/home/browse.dart';
import 'package:saber/pages/home/home.dart';

import 'utils/test_mock_channel_handlers.dart';

void main() {
  group('Browse page folder navigation', () {
    setUp(() {
      FlavorConfig.setup();
      setupMockPathProvider();
      stows.sentryConsent.value = SentryConsent.granted;
      FileManager.init(shouldWatchRootDirectory: false);
      BrowsePage.overrideChildren = DirectoryChildren(
        const ['subfolder1', 'subfolder2'],
        const ['file1', 'file2', 'file3'],
      );
    });
    testWidgets('No back folder at root', (tester) async {
      await tester.pumpWidget(const _BrowseApp());
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.arrow_back), findsNothing);
    });
    testWidgets('Back folder present in subfolder', (tester) async {
      await tester.pumpWidget(const _BrowseApp(path: '/helloworld'));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });
    testWidgets('Navigate back to root', (tester) async {
      await tester.pumpWidget(const _BrowseApp(path: '/helloworld'));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.arrow_back), findsNothing);
    });
    testWidgets('Navigate back twice to root', (tester) async {
      await tester.pumpWidget(const _BrowseApp(path: '/helloworld'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('subfolder1'));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.arrow_back), findsNothing);
    });
  });
}

class _BrowseApp extends StatelessWidget {
  const _BrowseApp({this.path});
  final String? path;
  @override
  Widget build(BuildContext context) {
    final theme = SaberTheme.createThemeFromSeed(
      Colors.yellow,
      Brightness.light,
      TargetPlatform.android,
    );
    final router = GoRouter(
      initialLocation: HomeRoutes.browseFilePath(path ?? ''),
      routes: [
        GoRoute(
          path: RoutePaths.home,
          builder: (context, state) => HomePage(
            subpage: state.pathParameters['subpage'] ?? HomePage.recentSubpage,
            path: state.uri.queryParameters['path'],
          ),
        ),
      ],
    );
    return TranslationProvider(
      child: ExplicitlyThemedApp(
        title: 'Saber',
        router: router,
        themeMode: ThemeMode.light,
        theme: theme,
        darkTheme: theme,
      ),
    );
  }
}
