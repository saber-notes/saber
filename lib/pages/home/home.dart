
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/components/settings/update_manager.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/pages/home/browse.dart';
import 'package:saber/pages/home/recent_notes.dart';
import 'package:saber/pages/home/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.subpage,
    required this.path,
  }) : super(key: key);

  final String subpage;
  final String? path;

  @override
  State<HomePage> createState() => _HomePageState();

  static const String recentSubpage = "recent";
  static const String browseSubpage = "browse";
  static const String settingsSubpage = "settings";
  static const List<String> subpages = [recentSubpage, browseSubpage, settingsSubpage];
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    UpdateManager.showUpdateDialog(context);
    super.initState();
  }

  Widget get body {
    switch (widget.subpage) {
      case HomePage.browseSubpage:
        return BrowsePage(path: widget.path);
      case HomePage.settingsSubpage:
        return const SettingsPage();
      default:
        return const RecentPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return ResponsiveNavbar(
      selectedIndex: HomePage.subpages.indexOf(widget.subpage),
      body: body,
    );
  }
}
