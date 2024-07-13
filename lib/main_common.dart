import 'dart:async';
import 'dart:developer' as dev;
import 'dart:io';

import 'package:args/args.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:onyxsdk_pen/onyxsdk_pen_area.dart';
import 'package:path_to_regexp/path_to_regexp.dart';
import 'package:printing/printing.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:saber/components/canvas/invert_shader.dart';
import 'package:saber/components/canvas/pencil_shader.dart';
import 'package:saber/components/home/banner_ad_widget.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/data/editor/pencil_sound.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/nextcloud/nc_http_overrides.dart';
import 'package:saber/data/nextcloud/saber_syncer.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/data/tools/stroke_properties.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:saber/pages/home/home.dart';
import 'package:saber/pages/user/login.dart';
import 'package:window_manager/window_manager.dart';
import 'package:worker_manager/worker_manager.dart';
import 'package:workmanager/workmanager.dart';

Future<void> main(
  List<String> args, {
  WidgetsBinding? Function() initWidgetsBinding =
      WidgetsFlutterBinding.ensureInitialized,
  void Function(Widget) runApp = runApp,
}) async {
  initWidgetsBinding();

  final parser = ArgParser()..addFlag('verbose', abbr: 'v', negatable: false);
  final parsedArgs = parser.parse(args);

  Logger.root.level =
      (kDebugMode || parsedArgs.flag('verbose')) ? Level.INFO : Level.WARNING;
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.loggerName}: ${record.message}');

    // also log to devtools
    dev.log(
      record.message,
      time: record.time,
      level: record.level.value,
      name: record.loggerName,
      zone: record.zone,
      error: record.error,
      stackTrace: record.stackTrace,
    );
  });

  if (Platform.isAndroid) {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    Logger.root
        .fine('androidInfo.version.release: ${androidInfo.version.release}');
    Prefs.androidVersion =
        int.tryParse(androidInfo.version.release) ?? Prefs.androidVersion;
  }

  StrokeOptionsExtension.setDefaults();
  Prefs.init();

  await Future.wait([
    Prefs.customDataDir.waitUntilLoaded().then((_) => FileManager.init()),
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS)
      windowManager.ensureInitialized(),
    workerManager.init(),
    Prefs.locale.waitUntilLoaded(),
    Prefs.disableAds.waitUntilLoaded(),
    Prefs.url.waitUntilLoaded(),
    Prefs.allowInsecureConnections.waitUntilLoaded(),
    InvertShader.init(),
    PencilShader.init(),
    PencilSound.preload(),
    Printing.info().then((info) {
      Editor.canRasterPdf = info.canRaster;
    }),
    OnyxSdkPenArea.init(),
  ]);

  AdState.init();

  setLocale();
  Prefs.locale.addListener(setLocale);
  Prefs.customDataDir.addListener(FileManager.migrateDataDir);

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  HttpOverrides.global = NcHttpOverrides();
  runApp(TranslationProvider(child: const App()));
  startSyncAfterLoaded();
  setupBackgroundSync();
}

void startSyncAfterLoaded() async {
  await Prefs.username.waitUntilLoaded();
  await Prefs.encPassword.waitUntilLoaded();

  Prefs.username.removeListener(startSyncAfterLoaded);
  Prefs.encPassword.removeListener(startSyncAfterLoaded);
  if (!Prefs.loggedIn) {
    // try again when logged in
    Prefs.username.addListener(startSyncAfterLoaded);
    Prefs.encPassword.addListener(startSyncAfterLoaded);
    return;
  }

  // wait for other prefs to load
  await Future.delayed(const Duration(milliseconds: 100));

  // start syncing
  syncer.downloader.refresh();
  syncer.uploader.refresh();
}

void setLocale() {
  if (Prefs.locale.value.isNotEmpty &&
      AppLocaleUtils.supportedLocalesRaw.contains(Prefs.locale.value)) {
    LocaleSettings.setLocaleRaw(Prefs.locale.value);
  } else {
    LocaleSettings.useDeviceLocale();
  }
}

void setupBackgroundSync() {
  if (!Platform.isAndroid && !Platform.isIOS) return;
  if (!Prefs.syncInBackground.loaded) {
    return Prefs.syncInBackground.addListener(setupBackgroundSync);
  } else {
    Prefs.syncInBackground.removeListener(setupBackgroundSync);
  }
  if (!Prefs.syncInBackground.value) return;

  Workmanager().initialize(doBackgroundSync, isInDebugMode: kDebugMode);
  const uniqueName = 'background-sync';
  const initialDelay = Duration(hours: 12);
  final constraints = Constraints(
    networkType: NetworkType.unmetered,
    requiresBatteryNotLow: true,
    requiresCharging: false,
    requiresDeviceIdle: true,
    requiresStorageNotLow: true,
  );

  if (Platform.isAndroid)
    Workmanager().registerPeriodicTask(uniqueName, uniqueName,
        frequency: initialDelay,
        initialDelay: initialDelay,
        constraints: constraints);
  else if (Platform.isIOS)
    Workmanager().registerOneOffTask(uniqueName, uniqueName,
        initialDelay: initialDelay, constraints: constraints);
}

@pragma('vm:entry-point')
void doBackgroundSync() {
  Workmanager().executeTask((_, __) async {
    StrokeOptionsExtension.setDefaults();
    Prefs.init();
    Editor.canRasterPdf = false;

    await Future.wait([
      FileManager.init(),
      workerManager.init(),
      Prefs.url.waitUntilLoaded(),
      Prefs.allowInsecureConnections.waitUntilLoaded(),
    ]);

    /// Only sync a few files to avoid using too much data/battery
    const maxFilesSynced = 10;
    var filesSynced = 0;
    final completer = Completer<bool>();
    late final StreamSubscription<SaberSyncFile> transferSubscription;
    void transferListener([_]) {
      filesSynced++;
      if (filesSynced >= maxFilesSynced ||
          syncer.downloader.numPending <= 0 ||
          completer.isCompleted) {
        transferSubscription.cancel();
        if (!completer.isCompleted) completer.complete(filesSynced > 0);
      }
    }

    transferSubscription =
        syncer.downloader.transferStream.listen(transferListener);
    return completer.future;
  });
}

class App extends StatefulWidget {
  const App({super.key});

  static final log = Logger('App');

  static String initialLocation =
      pathToFunction(RoutePaths.home)({'subpage': HomePage.recentSubpage});
  static final GoRouter _router = GoRouter(
    initialLocation: initialLocation,
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        redirect: (context, state) => initialLocation,
      ),
      GoRoute(
        path: RoutePaths.home,
        builder: (context, state) => HomePage(
          subpage: state.pathParameters['subpage'] ?? HomePage.recentSubpage,
          path: state.uri.queryParameters['path'],
        ),
      ),
      GoRoute(
        path: RoutePaths.edit,
        builder: (context, state) => Editor(
          path: state.uri.queryParameters['path'],
          pdfPath: state.uri.queryParameters['pdfPath'],
        ),
      ),
      GoRoute(
        path: RoutePaths.login,
        builder: (context, state) => const NcLoginPage(),
      ),
      GoRoute(
        path: '/profile',
        redirect: (context, state) => RoutePaths.login,
      ),
    ],
  );

  static void openFile(SharedMediaFile file) async {
    log.info('Opening file: (${file.type}) ${file.path}');

    if (file.type != SharedMediaType.file) return;

    final String extension;
    if (file.path.contains('.')) {
      extension = file.path.split('.').last;
    } else {
      extension = 'sbn2';
    }

    if (extension == 'sbn' || extension == 'sbn2' || extension == 'sba') {
      final String? path = await FileManager.importFile(
        file.path,
        null,
        extension: '.$extension',
      );
      if (path == null) return;

      // allow file to finish writing
      await Future.delayed(const Duration(milliseconds: 100));

      _router.push(RoutePaths.editFilePath(path));
    } else if (extension == 'pdf' && Editor.canRasterPdf) {
      final fileNameWithoutExtension = file.path
          .split('/')
          .last
          .split('\\')
          .last
          .substring(0, file.path.length - '.pdf'.length);
      final sbnFilePath = await FileManager.suffixFilePathToMakeItUnique(
        '/$fileNameWithoutExtension',
      );
      _router.push(RoutePaths.editImportPdf(sbnFilePath, file.path));
    } else {
      log.warning('openFile: Unsupported file type: $extension');
    }
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  StreamSubscription? _intentDataStreamSubscription;

  @override
  void initState() {
    setupSharingIntent();
    super.initState();
  }

  void setupSharingIntent() {
    if (Platform.isAndroid || Platform.isIOS) {
      // for files opened while the app is closed
      ReceiveSharingIntent.instance
          .getInitialMedia()
          .then((List<SharedMediaFile> files) {
        for (final file in files) {
          App.openFile(file);
        }
      });

      // for files opened while the app is open
      final stream = ReceiveSharingIntent.instance.getMediaStream();
      _intentDataStreamSubscription =
          stream.listen((List<SharedMediaFile> files) {
        for (final file in files) {
          App.openFile(file);
        }
      });
    }
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
