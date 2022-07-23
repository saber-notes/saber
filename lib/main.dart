import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:saber/pages/home/browse.dart';

import 'package:saber/pages/home/recent_notes.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/pages/home/settings.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  static Widget fadeTransitionBuilder(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: child,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: RoutePaths.root,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const RecentNotes(),
          transitionsBuilder: fadeTransitionBuilder,
        ),
      ),
      GoRoute(
        path: RoutePaths.browse,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const Browse(),
          transitionsBuilder: fadeTransitionBuilder,
        ),
      ),
      GoRoute(
        path: RoutePaths.settings,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const SettingsPage(),
          transitionsBuilder: fadeTransitionBuilder,
        ),
      ),
      GoRoute(
        path: RoutePaths.edit,
        builder: (context, state) => Editor(
          path: state.queryParams["path"],
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return DynamicMaterialApp(
      title: 'Flutter Demo',
      defaultSwatch: Colors.deepPurple,
      router: _router,
    );
  }
}
