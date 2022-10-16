
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/data/prefs.dart';

class SettingsDropdown extends StatefulWidget {
  const SettingsDropdown({
    super.key,
    required this.title,
    required this.pref,
    required this.values,
    this.afterChange,
  });

  final String title;
  final IPref<int, dynamic> pref;
  final List<SettingsDropdownValue> values;
  final ValueChanged<int>? afterChange;

  @override
  State<SettingsDropdown> createState() => _SettingsDropdownState();
}

class _SettingsDropdownState extends State<SettingsDropdown> {
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
      title: Text(widget.title, style: const TextStyle(fontSize: 14)),
      subtitle: kDebugMode ? Text(widget.pref.key) : null,
      trailing: DropdownButton<int>(
        value: widget.pref.value,
        onChanged: (value) {
          if (value == null) return;
          widget.pref.value = value;
        },
        items: widget.values.map((SettingsDropdownValue value) {
          return DropdownMenuItem<int>(
            value: value.value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(value.text)
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    widget.pref.removeListener(onChanged);
    super.dispose();
  }
}

class SettingsDropdownValue {
  final int value;
  final String text;

  const SettingsDropdownValue(this.value, this.text);
}
