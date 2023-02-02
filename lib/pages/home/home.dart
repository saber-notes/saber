
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/components/settings/update_manager.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/home/browse.dart';
import 'package:saber/pages/home/recent_notes.dart';
import 'package:saber/pages/home/settings.dart';
import 'package:saber/pages/home/whiteboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.subpage,
    required this.path,
  });

  final String subpage;
  final String? path;

  @override
  State<HomePage> createState() => _HomePageState();

  static const String recentSubpage = "recent";
  static const String browseSubpage = "browse";
  static const String whiteboardSubpage = "whiteboard";
  static const String settingsSubpage = "settings";
  static const List<String> subpages = [recentSubpage, browseSubpage, whiteboardSubpage, settingsSubpage];
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    DynamicMaterialApp.addFullscreenListener(_setState);
    super.initState();
    UpdateManager.showUpdateDialog(context);
    showSPenWarning();
  }

  void showSPenWarning() async {
    if (kIsWeb) return;
    if (!Platform.isAndroid) return;

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (androidInfo.brand.toLowerCase() != "samsung") return;

    await Prefs.hasBeenWarnedAboutSPen.waitUntilLoaded();
    if (Prefs.hasBeenWarnedAboutSPen.value) return;

    await showDialog(
      context: context,
      builder: (context) => AdaptiveAlertDialog(
        title: Text(t.sPenWarning.title),
        content: Text(t.sPenWarning.description),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: Text(MaterialLocalizations.of(context).modalBarrierDismissLabel),
          ),
        ],
      ),
    );

    Prefs.hasBeenWarnedAboutSPen.value = true;
  }

  void _setState() => setState(() {});

  Widget get body {
    switch (widget.subpage) {
      case HomePage.browseSubpage:
        return BrowsePage(path: widget.path);
      case HomePage.whiteboardSubpage:
        return const Whiteboard();
      case HomePage.settingsSubpage:
        return const SettingsPage();
      default:
        return const RecentPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    // hide navbar in fullscreen whiteboard
    if (widget.subpage == HomePage.whiteboardSubpage && DynamicMaterialApp.isFullscreen) {
      return body;
    }

    return ResponsiveNavbar(
      selectedIndex: HomePage.subpages.indexOf(widget.subpage),
      body: body,
    );
  }

  @override
  void dispose() {
    DynamicMaterialApp.removeFullscreenListener(_setState);

    super.dispose();
  }
}
