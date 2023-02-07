import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_to_regexp/path_to_regexp.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/nextcloud/file_syncer.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:saber/pages/home/home.dart';
import 'package:saber/pages/nextcloud/login.dart';
import 'package:worker_manager/worker_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Prefs.init();
  FileManager.init();

  await Future.wait([
    Executor().warmUp(),
    Prefs.locale.waitUntilLoaded(),
  ]);

  setLocale();
  Prefs.locale.addListener(setLocale);

  runApp(TranslationProvider(child: const App()));
  startSyncAfterUsernameLoaded();
}

void startSyncAfterUsernameLoaded() async {
  await Prefs.username.waitUntilLoaded();

  Prefs.username.removeListener(startSyncAfterUsernameLoaded);
  if (Prefs.username.value.isEmpty) { // try again when logged in
    return Prefs.username.addListener(startSyncAfterUsernameLoaded);
  }

  // wait for other prefs to load
  await Future.delayed(const Duration(milliseconds: 100));

  // start syncing
  FileSyncer.startSync();
}

void setLocale() {
  if (Prefs.locale.value.isNotEmpty && AppLocaleUtils.supportedLocalesRaw.contains(Prefs.locale.value)) {
    LocaleSettings.setLocaleRaw(Prefs.locale.value);
  } else {
    LocaleSettings.useDeviceLocale();
  }
}

class App extends StatefulWidget {
  const App({super.key});

  static String initialLocation = pathToFunction(RoutePaths.home)({"subpage": HomePage.recentSubpage});
  static final GoRouter _router = GoRouter(
    initialLocation: initialLocation,
    routes: <GoRoute>[
      GoRoute(
        path: "/",
        redirect: (context, state) => initialLocation,
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
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return DynamicMaterialApp(
      title: 'Saber',
      router: App._router,
    );
  }
}
