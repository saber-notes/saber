
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/settings/settings_color.dart';
import 'package:saber/components/settings/settings_selection.dart';
import 'package:saber/components/settings/settings_switch.dart';

import 'package:saber/components/settings/nextcloud_profile.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/components/settings/update_manager.dart';
import 'package:saber/components/theming/adaptive_toggle_buttons.dart';
import 'package:saber/data/flavor_config.dart';
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
    final bool requiresManualUpdates = !kIsWeb && FlavorConfig.appStore == null;
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
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const NextcloudProfile(),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: AppInfo(),
                ),
                SettingsSelection(
                  title: t.settings.prefLabels.appTheme,
                  pref: Prefs.appTheme,
                  optionWidth: 20,
                  options: [
                    ToggleButtonsOption(ThemeMode.system.index, Icon(Icons.brightness_auto, semanticLabel: t.settings.themeModes.system)),
                    ToggleButtonsOption(ThemeMode.light.index, Icon(Icons.light_mode, semanticLabel: t.settings.themeModes.light)),
                    ToggleButtonsOption(ThemeMode.dark.index, Icon(Icons.dark_mode, semanticLabel: t.settings.themeModes.dark)),
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
                if (requiresManualUpdates) SettingsSwitch(
                  title: t.settings.prefLabels.shouldCheckForUpdates,
                  pref: Prefs.shouldCheckForUpdates,
                ),
                SettingsSwitch(
                  title: t.settings.prefLabels.editorToolbarOnBottom,
                  pref: Prefs.editorToolbarOnBottom,
                ),
                SettingsSwitch(
                  title: t.settings.prefLabels.editorToolbarShowInFullscreen,
                  pref: Prefs.editorToolbarShowInFullscreen,
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
                SettingsSelection(
                  title: t.settings.prefLabels.editorStraightenLines,
                  subtitle: (){
                    if (Prefs.editorStraightenDelay.value == 0) return t.settings.straightenDelay.off;
                    return "${Prefs.editorStraightenDelay.value}ms";
                  }(),
                  pref: Prefs.editorStraightenDelay,
                  options: [
                    ToggleButtonsOption(0, Text(t.settings.straightenDelay.off)),
                    ToggleButtonsOption(500, Text(t.settings.straightenDelay.regular)),
                    ToggleButtonsOption(1000, Text(t.settings.straightenDelay.slow)),
                  ],
                  afterChange: (_) => setState(() {}),
                ),
                SettingsSwitch(
                  title: t.settings.prefLabels.autoClearWhiteboardOnExit,
                  subtitle: t.settings.prefDescriptions.autoClearWhiteboardOnExit,
                  pref: Prefs.autoClearWhiteboardOnExit,
                ),
                SettingsSwitch(
                  title: t.settings.prefLabels.editorPromptRename,
                  subtitle: t.settings.prefDescriptions.editorPromptRename,
                  pref: Prefs.editorPromptRename,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    UpdateManager.status.removeListener(onUpdateAvailable);
    super.dispose();
  }
}
