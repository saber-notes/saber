
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/data/prefs.dart';

class SettingsSwitch extends StatefulWidget {
  const SettingsSwitch({
    Key? key,
    required this.title,
    required this.pref,
    this.afterChange,
  }) : super(key: key);

  final String title;
  final IPref<bool, dynamic> pref;
  final ValueChanged<bool>? afterChange;

  @override
  State<SettingsSwitch> createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<SettingsSwitch> {
  @override
  void initState() {
    widget.pref.addListener(() => setState(() {}));
    widget.pref.addListener(() {
      widget.afterChange?.call(widget.pref.value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.title, style: const TextStyle(fontSize: 14)),
      subtitle: kDebugMode ? Text(widget.pref.key) : null,
      value: widget.pref.value,
      onChanged: (bool value) {
        widget.pref.value = value;
      },
    );
  }
}
