
import 'package:flutter/material.dart';
import 'package:saber/components/settings/settings_dropdown.dart';
import 'package:saber/components/settings/settings_switch.dart';

import 'package:saber/components/settings/nextcloud_profile.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/components/settings/update_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    UpdateManager.status.addListener(onUpdateAvailable);
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
        title: Text(t.home.titles.settings),
        actions: [
          if (UpdateManager.status.value != UpdateStatus.upToDate) IconButton(
            tooltip: t.home.tooltips.showUpdateDialog,
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
                title: t.settings.prefLabels.appTheme,
                pref: Prefs.appTheme,
                values: [
                  SettingsDropdownValue(ThemeMode.system.index, t.settings.themeModes.system),
                  SettingsDropdownValue(ThemeMode.light.index, t.settings.themeModes.light),
                  SettingsDropdownValue(ThemeMode.dark.index, t.settings.themeModes.dark),
                ],
              ),
              SettingsSwitch(
                title: t.settings.prefLabels.shouldCheckForUpdates,
                pref: Prefs.shouldCheckForUpdates,
              ),
              SettingsSwitch(
                title: t.settings.prefLabels.editorToolbarOnBottom,
                pref: Prefs.editorToolbarOnBottom,
              ),
              SettingsSwitch(
                title: t.settings.prefLabels.editorAutoInvert,
                pref: Prefs.editorAutoInvert,
              ),
              SettingsSwitch(
                title: t.settings.prefLabels.preferGreyscale,
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
    UpdateManager.status.removeListener(onUpdateAvailable);
    super.dispose();
  }
}
