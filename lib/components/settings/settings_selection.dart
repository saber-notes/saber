
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saber/components/theming/adaptive_toggle_buttons.dart';
import 'package:saber/data/prefs.dart';

class SettingsSelection extends StatefulWidget {
  const SettingsSelection({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconBuilder,

    required this.pref,
    required this.options,
    this.afterChange,
    this.optionsWidth = 72,
    this.optionsHeight = 40,
  }): assert(icon == null || iconBuilder == null, "Cannot set both icon and iconBuilder");

  final String title;
  final String? subtitle;
  final IconData? icon;
  final IconData? Function(int)? iconBuilder;

  final IPref<int> pref;
  final List<ToggleButtonsOption<int>> options;
  final ValueChanged<int>? afterChange;

  final double optionsWidth, optionsHeight;

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
    if (!widget.options.any((ToggleButtonsOption option) => widget.pref.value == option.value)) {
      if (kDebugMode) throw Exception("SettingsSelection (${widget.pref.key}): Value ${widget.pref.value} is not in the list of values, set it to ${widget.options.first.value}?");
      widget.pref.value = widget.options.first.value;
    }

    IconData? icon = widget.icon;
    icon ??= widget.iconBuilder?.call(widget.pref.value);
    icon ??= Icons.settings;

    return ListTile(
      onTap: () { // cycle through options
        final int i = widget.options.indexWhere((ToggleButtonsOption option) => option.value == widget.pref.value);
        widget.pref.value = widget.options[(i + 1) % widget.options.length].value;
      },
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      leading: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        child: FaIcon(icon, key: ValueKey(icon)),
      ),
      title: Text(widget.title),
      subtitle: Text(widget.subtitle ?? "", style: const TextStyle(fontSize: 13)),
      trailing: AdaptiveToggleButtons(
        value: widget.pref.value,
        options: widget.options,
        onChange: (int? value) {
          // setState is automatically called when the pref changes
          if (value != null) {
            widget.pref.value = value;
          }
        },
        optionsWidth: widget.optionsWidth,
        optionsHeight: widget.optionsHeight,
      ),
    );
  }

  @override
  void dispose() {
    widget.pref.removeListener(onChanged);
    super.dispose();
  }
}
