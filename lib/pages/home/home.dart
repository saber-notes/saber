
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/components/settings/update_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
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
    super.initState();
    UpdateManager.showUpdateDialog(context);
    tellUserNotToUseEmail(context);
  }

  void tellUserNotToUseEmail(BuildContext context) async {
    await Prefs.username.waitUntilLoaded();
    if (!Prefs.username.value.contains("@")) return;

    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.usernameNotEmail.title),
        content: Text(t.usernameNotEmail.description),
        actions: [
          TextButton(
            child: Text(t.update.dismiss),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text(t.login.form.login),
            onPressed: () => context.push(RoutePaths.login),
          ),
        ],
      ),
    );
  }

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
    return ResponsiveNavbar(
      selectedIndex: HomePage.subpages.indexOf(widget.subpage),
      body: body,
    );
  }
}
