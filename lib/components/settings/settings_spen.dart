import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saber/components/settings/settings_button.dart';
import 'package:saber/components/settings/settings_subtitle.dart';
import 'package:saber/components/settings/settings_switch.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/spen_remote.dart';
import 'package:saber/i18n/strings.g.dart';

/// Configures remote Undo on Samsung devices without changing pen erasing.
class SettingsSpen extends StatefulWidget {
  const new({super.key});

  @override
  State<SettingsSpen> createState() => _SettingsSpenState();
}

class _SettingsSpenState extends State<SettingsSpen> {
  late final _supported = SpenRemote.isSupported();

  Future<void> _openSettings() async {
    try {
      await SpenRemote.openSystemSettings();
    } on PlatformException {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.settings.spen.settingsUnavailable)),
      );
    }
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<bool>(
    future: _supported,
    builder: (context, snapshot) {
      if (snapshot.data != true) return const SizedBox.shrink();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SettingsSubtitle(subtitle: t.settings.spen.title),
          SettingsSwitch(
            title: t.settings.spen.undo,
            subtitle: t.settings.spen.description,
            icon: Icons.undo,
            pref: stows.spenRemoteUndo,
          ),
          SettingsButton(
            title: t.settings.spen.configure,
            subtitle: t.settings.spen.settingsPath,
            icon: Icons.settings_remote,
            onPressed: _openSettings,
          ),
        ],
      );
    },
  );
}
