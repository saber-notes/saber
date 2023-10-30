import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/components/toolbar/color_option.dart';
import 'package:saber/data/extensions/color_extensions.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

typedef NamedColor = ({String name, Color color});

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

  static List<NamedColor> get colorPresets => Prefs.preferGreyscale.value
      ? greyScaleColorOptions
      : normalColorOptions;
  static final List<NamedColor> normalColorOptions = [
    (name: t.editor.colors.black, color: Colors.black),
    (name: t.editor.colors.red, color: Colors.red),
    (name: t.editor.colors.orange, color: Colors.orange),
    (name: t.editor.colors.yellow, color: Colors.yellow),
    (name: t.editor.colors.green, color: Colors.green),
    (name: t.editor.colors.blue, color: Colors.blue),
    (name: t.editor.colors.purple, color: Colors.purple),
    (name: t.editor.colors.white, color: Colors.white),
    ..._pastelColorOptions,
  ];
  static final List<NamedColor> _pastelColorOptions = [
    (name: t.editor.colors.pastelRed, color: const Color.fromRGBO(255, 173, 173, 1)),
    (name: t.editor.colors.pastelOrange, color: const Color.fromRGBO(255, 214, 165, 1)),
    (name: t.editor.colors.pastelYellow, color: const Color.fromRGBO(253, 255, 182, 1)),
    (name: t.editor.colors.pastelGreen, color: const Color.fromRGBO(202, 255, 191, 1)),
    (name: t.editor.colors.pastelCyan, color: const Color.fromRGBO(155, 246, 255, 1)),
    (name: t.editor.colors.pastelBlue, color: const Color.fromRGBO(160, 196, 255, 1)),
    (name: t.editor.colors.pastelPurple, color: const Color.fromRGBO(189, 178, 255, 1)),
    (name: t.editor.colors.pastelPink, color: const Color.fromRGBO(255, 198, 255, 1)),
  ];
  static final List<NamedColor> greyScaleColorOptions = [
    (name: t.editor.colors.black, color: Colors.black),
    (name: t.editor.colors.darkGrey, color: Colors.grey[800] ?? Colors.black54),
    (name: t.editor.colors.grey, color: Colors.grey),
    (name: t.editor.colors.lightGrey, color: Colors.grey[200] ?? Colors.black12),
    (name: t.editor.colors.white, color: Colors.white),
  ];
  static final List<NamedColor> _allColors = [
    ...normalColorOptions,
    ...greyScaleColorOptions,
  ];
  static String? findColorName(Color searchColor) {
    for (NamedColor namedColor in _allColors) {
      if (namedColor.color == searchColor) {
        return namedColor.name;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    final children = <Widget>[
      // recent colors
      for (String colorString in Prefs.recentColorsPositioned.value.reversed) ColorOption(
        isSelected: currentColor?.withAlpha(255).value == int.parse(colorString),
        enabled: currentColor != null,
        onTap: () => setColor(Color(int.parse(colorString))),
        tooltip: findColorName(Color(int.parse(colorString))),
        child: DecoratedBox(
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
      // placeholders for `recentColorsLength` recent colors
      for (int i = 0; i < Prefs.recentColorsLength.value - Prefs.recentColorsPositioned.value.length; ++i) ColorOption(
        isSelected: false,
        enabled: currentColor != null,
        onTap: null,
        tooltip: null,
        child: DecoratedBox(
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
        tooltip: t.editor.colors.colorPicker,
        child: const DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Center(child: FaIcon(FontAwesomeIcons.droplet, size: 16)),
        ),
      ),

      // color presets
      for (NamedColor namedColor in colorPresets) ColorOption(
        isSelected: currentColor?.withAlpha(255).value == namedColor.color.value,
        enabled: currentColor != null,
        onTap: () => setColor(namedColor.color),
        tooltip: namedColor.name,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: namedColor.color.withInversion(invert),
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
  void openColorPicker(BuildContext context) async {
    bool? confirmChange = await showDialog(
      context: context,
      builder: (BuildContext context) => _colorPickerDialog(context),
    );
    if (confirmChange ?? false) {
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
