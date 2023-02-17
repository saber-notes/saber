
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saber/components/canvas/color_extensions.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/components/toolbar/color_option.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

class ColorBar extends StatelessWidget {
  const ColorBar({
    super.key,
    required this.axis,
    required this.setColor,
    required this.currentColor,
    required this.invert,
  });

  final Axis axis;
  final ValueChanged<Color> setColor;
  final Color? currentColor;
  final bool invert;

  static List<Color> get colorPresets => Prefs.preferGreyscale.value ? greyScaleColorOptions : normalColorOptions;
  static final List<Color> normalColorOptions = [
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.white,
  ];
  static final List<Color> greyScaleColorOptions = [
    Colors.black,
    Colors.grey[800] ?? Colors.black54,
    Colors.grey,
    Colors.grey[200] ?? Colors.black12,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    final children = <Widget>[
      // recent colors
      for (String colorString in Prefs.recentColorsPositioned.value.reversed) ColorOption(
        isSelected: currentColor?.withAlpha(255).value == int.parse(colorString),
        enabled: currentColor != null,
        onTap: () => setColor(Color(int.parse(colorString))),
        child: Container(
          decoration: BoxDecoration(
            color: Color(int.parse(colorString)).withInversion(invert),
            shape: BoxShape.circle,
            border: Border.all(
              color: colorScheme.onSurface.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
      ),
      // placeholders for 5 recent colors
      for (int i = 0; i < 5 - Prefs.recentColorsPositioned.value.length; ++i) ColorOption(
        isSelected: false,
        enabled: currentColor != null,
        onTap: null,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: colorScheme.onSurface.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
      ),

      const ColorOptionSeparator(),

      // custom color
      ColorOption(
        isSelected: currentColor?.withAlpha(255).value == pickedColor.value,
        enabled: true,
        onTap: () => openColorPicker(context),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: const Center(child: FaIcon(FontAwesomeIcons.droplet, size: 16)),
        ),
      ),

      // color presets
      for (Color color in colorPresets) ColorOption(
        isSelected: currentColor?.withAlpha(255).value == color.value,
        enabled: currentColor != null,
        onTap: () => setColor(color),
        child: Container(
          decoration: BoxDecoration(
            color: color.withInversion(invert),
            shape: BoxShape.circle,
            border: Border.all(
              color: colorScheme.onSurface.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
      ),
    ];

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          scrollDirection: axis,
          child: axis == Axis.horizontal
              ? Row(children: children)
              : Column(children: children),
        ),
      ),
    );
  }

  static Color pickedColor = const Color.fromRGBO(255, 0, 0, 1);
  openColorPicker(BuildContext context) async {
    bool? confirmChange = await showDialog(
      context: context,
      builder: (BuildContext context) => _colorPickerDialog(context),
    );
    if (confirmChange == true) {
      setColor(pickedColor.withInversion(invert));
    }
  }

  Widget _colorPickerDialog(BuildContext context) => AdaptiveAlertDialog(
    title: Text(t.settings.accentColorPicker.pickAColor),
    content: SingleChildScrollView(
      child: ColorPicker(
        pickerColor: pickedColor,
        onColorChanged: (Color color) {
          pickedColor = color;
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
