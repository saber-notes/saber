
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/data/prefs.dart';

class SettingsSelection extends StatefulWidget {
  const SettingsSelection({
    super.key,
    required this.title,
    this.subtitle,
    required this.pref,
    required this.values,
    this.afterChange,
  });

  final String title;
  final String? subtitle;
  final IPref<int, dynamic> pref;
  final List<SettingsSelectionValue> values;
  final ValueChanged<int>? afterChange;

  @override
  State<SettingsSelection> createState() => _SettingsSelectionState();
}

class _SettingsSelectionState extends State<SettingsSelection> {
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
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      title: Text(widget.title),
      subtitle: Text(widget.subtitle ?? "", style: const TextStyle(fontSize: 13)),
      trailing: CupertinoSlidingSegmentedControl<int>(
        children: widget.values.asMap().map((_, SettingsSelectionValue value) => MapEntry<int, Widget>(value.value, Text(value.text))),
        groupValue: widget.pref.value,
        onValueChanged: (int? value) {
          if (value != null) {
            widget.pref.value = value;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    widget.pref.removeListener(onChanged);
    super.dispose();
  }
}

class SettingsSelectionValue {
  final int value;
  final String text;

  const SettingsSelectionValue(this.value, this.text);
}
