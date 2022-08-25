
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsSwitch extends StatefulWidget {
  const SettingsSwitch({
    Key? key,
    required this.title,
    required this.prefKey,
    required this.isEncPref,
    this.defaultValue = false,
    this.afterChange,
  }) : super(key: key);

  final String title;
  final String prefKey;
  final bool isEncPref;
  final bool defaultValue;
  final ValueChanged<bool>? afterChange;

  @override
  State<SettingsSwitch> createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<SettingsSwitch> {
  late bool value;

  @override
  void initState() {
    value = widget.defaultValue;
    _loadValue();
    super.initState();
  }

  Future _loadValue() async {
    if (widget.isEncPref) {
      final prefs = EncryptedSharedPreferences();
      final String valueString = await prefs.getString(widget.prefKey);
      setState(() {
        value = valueString.isNotEmpty ? valueString == "true" : widget.defaultValue;
      });
    } else {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        value = prefs.getBool(widget.prefKey) ?? widget.defaultValue;
      });
    }
  }
  Future _saveValue() async {
    if (widget.isEncPref) {
      final prefs = EncryptedSharedPreferences();
      prefs.setString(widget.prefKey, value.toString());
    } else {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool(widget.prefKey, value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.title),
      value: value,
      onChanged: (bool newValue) {
        value = newValue;
        _saveValue();
        widget.afterChange?.call(newValue);
        setState(() {});
      },
    );
  }
}
