
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/home/settings.dart';

class SettingsColor extends StatefulWidget {
  const SettingsColor({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconBuilder,

    required this.pref,
    this.afterChange,
  }): assert(icon == null || iconBuilder == null, 'Cannot set both icon and iconBuilder');

  final String title;
  final String? subtitle;
  final IconData? icon;
  final IconData? Function(Color?)? iconBuilder;

  final IPref<int> pref;
  final ValueChanged<Color?>? afterChange;

  @override
  State<SettingsColor> createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<SettingsColor> {
  Color? get color => widget.pref.value == 0 ? null : Color(widget.pref.value);
  static Color defaultColor = const Color(0xffffd32e);

  @override
  void initState() {
    widget.pref.addListener(onChanged);
    super.initState();
  }

  void onChanged() {
    Color? color = this.color;
    if (color != null) {
      defaultColor = color;
    }
    widget.afterChange?.call(color);
    setState(() { });
  }

  AdaptiveAlertDialog get colorPickerDialog {
    final platform = Theme.of(context).platform;
    final cupertino = platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;
    return AdaptiveAlertDialog(
      title: Text(t.settings.accentColorPicker.pickAColor),
      content: SingleChildScrollView(
        child: ColorPicker(
          colorPickerWidth: cupertino ? 270 : 300,
          portraitOnly: cupertino,
          pickerColor: color ?? defaultColor,
          onColorChanged: (Color color) {
            Prefs.accentColor.value = color.value;
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
    icon ??= widget.iconBuilder?.call(color);
    icon ??= Icons.settings;

    return ListTile(
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
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color ?? defaultColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Switch.adaptive(
            value: color != null,
            onChanged: (bool? value) {
              if (value == null) return;
              widget.pref.value = value ? defaultColor.value : 0;
            },
          )
        ],
      ),
      onTap: () async {
        int previousColor = widget.pref.value;
        widget.pref.value = defaultColor.value; // enable custom accent color

        bool? confirmChange = await showDialog(
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
