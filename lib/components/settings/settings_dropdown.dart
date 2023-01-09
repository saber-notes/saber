
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/adaptive_toggle_buttons.dart';
import 'package:saber/data/prefs.dart';

class SettingsDropdown<T> extends StatefulWidget {
  const SettingsDropdown({
    super.key,
    required this.title,
    this.subtitle,
    required this.pref,
    required this.options,
    this.afterChange,
  });

  final String title;
  final String? subtitle;
  final IPref<T> pref;
  final List<ToggleButtonsOption<T>> options;
  final ValueChanged<T>? afterChange;

  int? indexOf(T value) {
    for (int i = 0; i < options.length; i++) {
      if (options[i].value == value) return i;
    }
    return null;
  }

  @override
  State<SettingsDropdown> createState() => _SettingsDropdownState();
}

class _SettingsDropdownState<T> extends State<SettingsDropdown<T>> {
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
    if (widget.indexOf(widget.pref.value) == null) {
      if (kDebugMode) throw Exception("SettingsDropdown (${widget.pref.key}): Value ${widget.pref.value} is not in the list of values, set it to ${widget.options.first.value}?");
      widget.pref.value = widget.options.first.value;
    }

    final dropdown = DropdownButton<T>(
      value: widget.pref.value,
      onChanged: (T? value) {
        if (value == null) return;
        widget.pref.value = value;
      },
      items: widget.options.map((ToggleButtonsOption<T> option) {
        return DropdownMenuItem<T>(
          value: option.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: option.widget,
          ),
        );
      }).toList(),
      borderRadius: BorderRadius.circular(32),
      underline: const SizedBox.shrink(),
    );

    return MergeSemantics(
      child: ListTile(
        onTap: () { // cycle through options // todo: remove
          final int i = widget.indexOf(widget.pref.value)!;
          widget.pref.value = widget.options[(i + 1) % widget.options.length].value;
        },
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        title: Text(widget.title),
        subtitle: Text(widget.subtitle ?? "", style: const TextStyle(fontSize: 13)),
        trailing: dropdown,
      ),
    );
  }

  @override
  void dispose() {
    widget.pref.removeListener(onChanged);
    super.dispose();
  }
}
