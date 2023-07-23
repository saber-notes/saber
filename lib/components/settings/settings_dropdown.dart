
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/adaptive_toggle_buttons.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/home/settings.dart';

class SettingsDropdown<T> extends StatefulWidget {
  const SettingsDropdown({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconBuilder,

    required this.pref,
    required this.options,
    this.afterChange,
  }): assert(icon == null || iconBuilder == null, 'Cannot set both icon and iconBuilder');

  final String title;
  final String? subtitle;
  final IconData? icon;
  final IconData? Function(T)? iconBuilder;

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
  late FocusNode dropdownFocusNode = FocusNode(debugLabel: 'dropdownFocusNode(${widget.pref.key})');

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
      if (kDebugMode) throw Exception('SettingsDropdown (${widget.pref.key}): Value ${widget.pref.value} is not in the list of values, set it to ${widget.options.first.value}?');
      widget.pref.value = widget.options.first.value;
    }

    IconData? icon = widget.icon;
    icon ??= widget.iconBuilder?.call(widget.pref.value);
    icon ??= Icons.settings;

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
      focusNode: dropdownFocusNode,
      borderRadius: BorderRadius.circular(32),
      underline: const SizedBox.shrink(),
    );

    return MergeSemantics(
      child: ListTile(
        onTap: () {
          dropdownFocusNode.requestFocus();
        },
        onLongPress: () {
          SettingsPage.showResetDialog(
            context: context,
            pref: widget.pref,
            prefTitle: widget.title,
          );
        },
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        leading: AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          child: Icon(icon, key: ValueKey(icon)),
        ),
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 18,
            fontStyle: widget.pref.value != widget.pref.defaultValue
                ? FontStyle.italic
                : null,
          ),
        ),
        subtitle: Text(widget.subtitle ?? '', style: const TextStyle(fontSize: 13)),
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
