import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:onyxsdk_pen/onyxsdk_pen_area.dart';
import 'package:open_as_default/open_as_default.dart';
import 'package:path_to_regexp/path_to_regexp.dart';
import 'package:printing/printing.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:saber/components/canvas/invert_shader.dart';
import 'package:saber/components/canvas/pencil_shader.dart';
import 'package:saber/components/home/banner_ad_widget.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/nextcloud/file_syncer.dart';
import 'package:saber/data/nextcloud/nc_http_overrides.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/data/tools/stroke_properties.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:saber/pages/home/home.dart';
import 'package:saber/pages/user/login.dart';
import 'package:saber/pages/user/profile_page.dart';
import 'package:window_manager/window_manager.dart';
import 'package:worker_manager/worker_manager.dart';
import 'package:workmanager/workmanager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();//Flutter插件系统初始化

  Logger.root.level = kDebugMode ? Level.INFO : Level.WARNING;//建立一個log(日誌)
  Logger.root.onRecord.listen((record) {//设置日志级别，并通过一个监听器打印出日志信息
    // ignore: avoid_print
    print('${record.level.name}: ${record.loggerName}: ${record.message}');
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

  await Future.wait([//初始化各种功能和组件
    FileManager.init(),
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS)
      windowManager.ensureInitialized(),
    workerManager.init(),
    Prefs.locale.waitUntilLoaded(),
    Prefs.disableAds.waitUntilLoaded(),
    Prefs.url.waitUntilLoaded(),
    Prefs.allowInsecureConnections.waitUntilLoaded(),
    InvertShader.init(),
    PencilShader.init(),
    Printing.info().then((info) {
      Editor.canRasterPdf = info.canRaster;
    }),
    OnyxSdkPenArea.init(),
  ]);

  AdState.init();

  setLocale();//用戶语言环境(寫在下面)
  Prefs.locale.addListener(setLocale);

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  HttpOverrides.global = NcHttpOverrides();//覆盖HTTP请求处理以支持特定的网络交互
  runApp(TranslationProvider(child: const App()));
  startSyncAfterUsernameLoaded();//用户登录状态的同步(寫在下面)
  setupBackgroundSync();//后台同步任务的设置(寫在下面)
}

void startSyncAfterUsernameLoaded() async {//用户登录状态的同步
  await Prefs.username.waitUntilLoaded();

  Prefs.username.removeListener(startSyncAfterUsernameLoaded);
  if (Prefs.username.value.isEmpty) {
    // try again when logged in
    return Prefs.username.addListener(startSyncAfterUsernameLoaded);
  }

  // wait for other prefs to load
  await Future.delayed(const Duration(milliseconds: 100));

  // start syncing
  FileSyncer.startSync();
}

void setLocale() {//用戶语言环境
  if (Prefs.locale.value.isNotEmpty &&
      AppLocaleUtils.supportedLocalesRaw.contains(Prefs.locale.value)) {
    LocaleSettings.setLocaleRaw(Prefs.locale.value);
  } else {
    LocaleSettings.useDeviceLocale();
  }
}

void setupBackgroundSync() {//后台同步任务的设置
  if (!Platform.isAndroid && !Platform.isIOS) return;
  if (!Prefs.syncInBackground.loaded) {
    return Prefs.syncInBackground.addListener(setupBackgroundSync);
  } else {
    Prefs.syncInBackground.removeListener(setupBackgroundSync);
  }
  if (!Prefs.syncInBackground.value) return;

  Workmanager().initialize(doBackgroundSync, isInDebugMode: kDebugMode);//安排后台任务，这些任务依据设备的网络和电量状态，定时执行数据同步。
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
void doBackgroundSync() {//具体的后台任务逻辑，如初始化系统状态、执行文件同步等
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

    final filesSynced = await FileSyncer.startSync(maxFilesToSync: 10);
    return filesSynced > 0;
  });
}

class App extends StatefulWidget {
  const App({super.key});

  static final log = Logger('App');

  static String initialLocation =
      pathToFunction(RoutePaths.home)({'subpage': HomePage.recentSubpage});//启动时默认的路由位置
  static final GoRouter _router = GoRouter(//使用GoRouter管理应用的页面路由
    initialLocation: initialLocation,
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        redirect: (context, state) => initialLocation,//启动时默认的路由位置  redirect重新定向
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
        path: RoutePaths.profile,
        builder: (context, state) => const ProfilePage(),
      ),
    ],
  );

  static void openFile(SharedMediaFile file) async {//应用可以处理外部共享的文件 导入到应用中后，根据文件类型进行相应的处理
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
      ReceiveSharingIntent.getInitialMedia()
          .then((List<SharedMediaFile> files) {
        for (final file in files) {
          App.openFile(file);
        }
      });

      // for files opened while the app is open
      final stream = ReceiveSharingIntent.getMediaStream();
      _intentDataStreamSubscription =
          stream.listen((List<SharedMediaFile> files) {
        for (final file in files) {
          App.openFile(file);
        }
      });
    }

    if (Platform.isAndroid) {
      // this only works for files opened while the app is closed
      OpenAsDefault.getFileIntent.then((File? file) {
        if (file == null) return;
        App.openFile(
          SharedMediaFile(path: file.path, type: SharedMediaType.file),
        );
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
