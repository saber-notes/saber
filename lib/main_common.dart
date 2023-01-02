import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:path_to_regexp/path_to_regexp.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/nextcloud/file_syncer.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:saber/pages/home/home.dart';
import 'package:saber/pages/nextcloud/login.dart';
import 'package:window_manager/window_manager.dart';
import 'package:worker_manager/worker_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Prefs.init();
  FileManager.init();
  await Future.wait([
    if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS))
      windowManager.ensureInitialized(),
    Executor().warmUp(),
  ]);
  LocaleSettings.useDeviceLocale();
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

  static void openFile(SharedMediaFile file) async {
    print("Opening file of type: ${file.type}");
    print("Value: ${file.path}");
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  StreamSubscription? _intentDataStreamSubscription;

  @override
  void initState() {
    try {
      // for files opened while the app is closed
      ReceiveSharingIntent.getInitialMedia().then((List<SharedMediaFile> files) {
        for (final file in files) {
          App.openFile(file);
        }
      });

      // for files opened while the app is open
      final stream = ReceiveSharingIntent.getMediaStream();
      _intentDataStreamSubscription = stream.listen((List<SharedMediaFile> files) {
        for (final file in files) {
          App.openFile(file);
        }
      });
    } on MissingPluginException {
      // ignore
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DynamicMaterialApp(
      title: 'Saber',
      router: App._router,
    );
  }

  @override
  void dispose() {
    _intentDataStreamSubscription?.cancel();
    super.dispose();
  }
}
