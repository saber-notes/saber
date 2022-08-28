import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_to_regexp/path_to_regexp.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:saber/pages/home/home.dart';
import 'package:saber/pages/nextcloud/login.dart';

void main() {
  Prefs.init();
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

  static String initialLocation = pathToFunction(RoutePaths.home)({"subpage": HomePage.recentSubpage});
  final GoRouter _router = GoRouter(
    initialLocation: initialLocation,
    routes: <GoRoute>[
      GoRoute(
        path: RoutePaths.root,
        redirect: (state) => initialLocation,
      ),
      GoRoute(
        path: RoutePaths.home,
        builder: (context, state) => HomePage(
          subpage: state.params["subpage"] ?? HomePage.recentSubpage,
          path: state.queryParams["path"],
        ),
      ),
      GoRoute(
        path: RoutePaths.edit,
        builder: (context, state) => Editor(
          path: state.queryParams["path"],
        ),
      ),
      GoRoute(
        path: RoutePaths.login,
        builder: (context, state) => const NcLoginPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return DynamicMaterialApp(
      title: 'Flutter Demo',
      router: _router,
    );
  }
}
