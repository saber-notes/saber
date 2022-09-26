
import 'package:flutter/material.dart';
import 'package:saber/components/home/settings_dropdown.dart';
import 'package:saber/components/home/settings_switch.dart';

import 'package:saber/components/settings/nextcloud_profile.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/components/settings/update_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/settings/app_theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    UpdateManager.isUpdateAvailable.addListener(onUpdateAvailable);
    super.initState();
  }

  void onUpdateAvailable() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: const Text("Settings"),
        actions: [
          if (UpdateManager.isUpdateAvailable.value) IconButton(
            tooltip: "Show update dialog",
            icon: const Icon(Icons.system_update),
            onPressed: () {
              UpdateManager.showUpdateDialog(context, userTriggered: true);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ListView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              const NextcloudProfile(),
              SettingsDropdown(
                title: "App theme",
                pref: Prefs.appTheme,
                values: [
                  SettingsDropdownValue(ThemeMode.system.index, "System"),
                  SettingsDropdownValue(ThemeMode.light.index, "Light"),
                  SettingsDropdownValue(ThemeMode.dark.index, "Dark"),
                ],
              ),
              SettingsSwitch(
                title: "Automatically check for Saber updates",
                pref: Prefs.shouldCheckForUpdates,
              ),
              SettingsSwitch(
                title: "Align the editor toolbar to the bottom",
                pref: Prefs.editorToolbarOnBottom,
              ),
              SettingsSwitch(
                title: "Invert notes in dark mode",
                pref: Prefs.editorAutoInvert,
              ),
              SettingsSwitch(
                title: "Prefer greyscale colors",
                pref: Prefs.preferGreyscale,
              ),
            ],
          )),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: AppInfo(),
          ),

        ],
      ),
    );
  }

  @override
  void dispose() {
    UpdateManager.isUpdateAvailable.removeListener(onUpdateAvailable);
    super.dispose();
  }
}
