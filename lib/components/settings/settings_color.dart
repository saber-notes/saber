import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/components/theming/adaptive_switch.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/home/settings.dart';
import 'package:stow/stow.dart';

class SettingsColor extends StatefulWidget {
  const SettingsColor({
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
  final IconData? Function(Color?)? iconBuilder;

  final Stow<dynamic, Color?, dynamic> pref;
  final ValueChanged<Color?>? afterChange;

  @override
  State<SettingsColor> createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<SettingsColor> {
  static var defaultColor = const Color(0xffffd32e);

  @override
  void initState() {
    widget.pref.addListener(onChanged);
    super.initState();
  }

  void onChanged() {
    final color = widget.pref.value;
    if (color != null && color != Colors.transparent) {
      defaultColor = color;
    }
    widget.afterChange?.call(color);
    setState(() {});
  }

  AdaptiveAlertDialog get colorPickerDialog {
    return AdaptiveAlertDialog(
      title: Text(t.settings.accentColorPicker.pickAColor),
      content: SingleChildScrollView(
        child: ColorPicker(
          color: widget.pref.value ?? defaultColor,
          pickersEnabled: const {ColorPickerType.wheel: true},
          onColorChanged: (Color color) {
            stows.accentColor.value = color;
          },
        ),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(MaterialLocalizations.of(context).saveButtonLabel),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    IconData? icon = widget.icon;
    icon ??= widget.iconBuilder?.call(widget.pref.value);
    icon ??= Icons.settings;

    return ListTile(
      contentPadding: const .symmetric(vertical: 4, horizontal: 16),
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
      subtitle: Text(
        widget.subtitle ?? '',
        style: const TextStyle(fontSize: 13),
      ),
      trailing: Row(
        mainAxisSize: .min,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: widget.pref.value ?? defaultColor,
              shape: .circle,
            ),
          ),
          const SizedBox(width: 8),
          AdaptiveSwitch(
            value:
                widget.pref.value != null &&
                widget.pref.value != Colors.transparent,
            onChanged: (bool? value) {
              widget.pref.value = value! ? defaultColor : null;
            },
          ),
        ],
      ),
      onTap: () async {
        final previousColor = widget.pref.value;
        widget.pref.value = defaultColor; // enable accent color

        final bool? confirmChange = await showDialog(
          context: context,
          builder: (BuildContext context) => colorPickerDialog,
        );

        if (confirmChange != true) {
          // restore to previous accent color
          widget.pref.value = previousColor;
        }
      },
      onLongPress: () {
        SettingsPage.showResetDialog(
          context: context,
          pref: widget.pref,
          prefTitle: widget.title,
        );
      },
    );
  }

  @override
  void dispose() {
    widget.pref.removeListener(onChanged);
    super.dispose();
  }
}
