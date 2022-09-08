
import 'package:flutter/material.dart';
import 'package:saber/components/home/settings_switch.dart';

import 'package:saber/components/settings/nextcloud_profile.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/data/prefs.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          Expanded(child: ListView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              const NextcloudProfile(),
              SettingsSwitch(
                title: "Automatically check for Saber updates",
                pref: Prefs.shouldCheckForUpdates,
              ),
              SettingsSwitch(
                title: "Editor toolbar on the bottom",
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
}
