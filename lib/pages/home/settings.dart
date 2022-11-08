
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/settings/settings_color.dart';
import 'package:saber/components/settings/settings_selection.dart';
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
              SettingsSelection(
                title: t.settings.prefLabels.appTheme,
                pref: Prefs.appTheme,
                values: [
                  SettingsSelectionValue(ThemeMode.system.index, t.settings.themeModes.system),
                  SettingsSelectionValue(ThemeMode.light.index, t.settings.themeModes.light),
                  SettingsSelectionValue(ThemeMode.dark.index, t.settings.themeModes.dark),
                ],
              ),
              SettingsColor(
                title: t.settings.prefLabels.customAccentColor,
                pref: Prefs.accentColor,
              ),
              SettingsSwitch(
                title: t.settings.prefLabels.hyperlegibleFont,
                subtitle: t.settings.prefDescriptions.hyperlegibleFont,
                pref: Prefs.hyperlegibleFont,
              ),
              SettingsSwitch(
                title: t.settings.prefLabels.shouldCheckForUpdates,
                subtitle: (){
                  // Windows, macOS, and iOS aren't on app stores, so they will be updated manually
                  if (kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isIOS) {
                    return null;
                  }
                  return t.settings.prefDescriptions.shouldCheckForUpdates;
                }(),
                pref: Prefs.shouldCheckForUpdates,
              ),
              SettingsSwitch(
                title: t.settings.prefLabels.editorToolbarOnBottom,
                pref: Prefs.editorToolbarOnBottom,
              ),
              SettingsSwitch(
                title: t.settings.prefLabels.editorAutoInvert,
                subtitle: t.settings.prefDescriptions.editorAutoInvert,
                pref: Prefs.editorAutoInvert,
              ),
              SettingsSwitch(
                title: t.settings.prefLabels.preferGreyscale,
                subtitle: t.settings.prefDescriptions.preferGreyscale,
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
