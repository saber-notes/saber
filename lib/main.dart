import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:saber/pages/home/recent_notes.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const RecentNotes(),
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
