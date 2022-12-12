
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/data/prefs.dart';

class SettingsSwitch extends StatefulWidget {
  const SettingsSwitch({
    super.key,
    required this.title,
    this.subtitle,
    required this.pref,
    this.afterChange,
  });

  final String title;
  final String? subtitle;
  final IPref<bool> pref;
  final ValueChanged<bool>? afterChange;

  @override
  State<SettingsSwitch> createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<SettingsSwitch> {
  @override
  void initState() {
    widget.pref.addListener(onChanged);
    super.initState();
  }

  void onChanged() {
    widget.afterChange?.call(widget.pref.value);
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      title: Text(widget.title),
      subtitle: Text(widget.subtitle ?? "", style: const TextStyle(fontSize: 13)),
      value: widget.pref.value,
      onChanged: (bool value) {
        widget.pref.value = value;
      },
    );
  }

  @override
  void dispose() {
    widget.pref.removeListener(onChanged);
    super.dispose();
  }
}
