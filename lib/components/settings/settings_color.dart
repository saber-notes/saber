import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/components/theming/adaptive_switch.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/home/settings.dart';
import 'package:stow/stow.dart';

class SettingsColor extends HookWidget {
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

  /// The last non-null color we know of.
  static var _lastKnownColor = const Color(0xffffd32e);

  AdaptiveAlertDialog buildDialog(BuildContext context) {
    return AdaptiveAlertDialog(
      title: Text(t.settings.accentColorPicker.pickAColor),
      content: SingleChildScrollView(
        child: ColorPicker(
          color: pref.value ?? _lastKnownColor,
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
    final color = useValueListenable(pref);
    useMemoized(() {
      if (color != null && color != Colors.transparent) {
        _lastKnownColor = color;
      }
      afterChange?.call(color);
    }, [color]);

    final icon = this.icon ?? iconBuilder?.call(color) ?? Icons.settings;

    return ListTile(
      contentPadding: const .symmetric(vertical: 4, horizontal: 16),
      leading: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        child: Icon(icon, key: ValueKey(icon)),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontStyle: color != pref.defaultValue ? FontStyle.italic : null,
        ),
      ),
      subtitle: Text(subtitle ?? '', style: const TextStyle(fontSize: 13)),
      trailing: Row(
        mainAxisSize: .min,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color ?? _lastKnownColor,
              shape: .circle,
            ),
          ),
          const SizedBox(width: 8),
          AdaptiveSwitch(
            value: color != null && color != Colors.transparent,
            onChanged: (value) => pref.value = value ? _lastKnownColor : null,
          ),
        ],
      ),
      onTap: () async {
        final previousColor = color;
        pref.value = _lastKnownColor; // enable accent color

        final bool? confirmChange = await showDialog(
          context: context,
          builder: buildDialog,
        );

        if (confirmChange != true) {
          // undo changes
          pref.value = previousColor;
        }
      },
      onLongPress: () {
        SettingsPage.showResetDialog(
          context: context,
          pref: pref,
          prefTitle: title,
        );
      },
    );
  }
}
