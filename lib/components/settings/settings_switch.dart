import 'package:flutter/material.dart';
import 'package:saber/components/theming/adaptive_switch_list_tile.dart';
import 'package:saber/pages/home/settings.dart';
import 'package:stow/stow.dart';

class SettingsSwitch extends StatefulWidget {
  const SettingsSwitch({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconBuilder,
    required this.pref,
    this.afterChange,
  }) : assert(
         icon == null || iconBuilder == null,
         'Cannot set both icon and iconBuilder',
       );

  final String title;
  final String? subtitle;
  final IconData? icon;
  final IconData? Function(bool)? iconBuilder;

  final Stow<dynamic, bool, dynamic> pref;
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    IconData? icon = widget.icon;
    icon ??= widget.iconBuilder?.call(widget.pref.value);
    icon ??= Icons.settings;

    return GestureDetector(
      onLongPress: () {
        SettingsPage.showResetDialog(
          context: context,
          pref: widget.pref,
          prefTitle: widget.title,
        );
      },
      child: AdaptiveSwitchListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        secondary: AnimatedSwitcher(
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
        subtitle: Text(
          widget.subtitle ?? '',
          style: const TextStyle(fontSize: 13),
        ),
        value: widget.pref.value,
        onChanged: (bool value) {
          widget.pref.value = value;
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
