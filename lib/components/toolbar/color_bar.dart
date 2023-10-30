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

class ColorBar extends StatefulWidget {
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
    (name: t.editor.colors.cyan, color: Colors.cyan),
    (name: t.editor.colors.blue, color: Colors.blue),
    (name: t.editor.colors.purple, color: Colors.purple),
    (name: t.editor.colors.pink, color: Colors.pink),
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
  static String findColorName(Color searchColor) {
    for (NamedColor namedColor in _allColors) {
      if (namedColor.color == searchColor) {
        return namedColor.name;
      }
    }
    return describeColor(searchColor);
  }

  @visibleForTesting
  static String describeColor(Color color) {
    final hsl = HSLColor.fromColor(color);

    final String hueName;
    if (hsl.saturation < 0.1 || hsl.lightness < 0.05 || hsl.lightness > 0.95) {
      hueName = t.editor.colors.grey.toLowerCase();
    } else {
      hueName = switch (hsl.hue) {
        < 10 => t.editor.colors.red.toLowerCase(),
        < 35 => t.editor.colors.orange.toLowerCase(),
        < 70 => t.editor.colors.yellow.toLowerCase(),
        < 150 => t.editor.colors.green.toLowerCase(),
        < 200 => t.editor.colors.cyan.toLowerCase(),
        < 250 => t.editor.colors.blue.toLowerCase(),
        < 285 => t.editor.colors.purple.toLowerCase(),
        < 340 => t.editor.colors.pink.toLowerCase(),
        _ => t.editor.colors.red.toLowerCase(),
      };
    }

    final String? lightnessName = switch (hsl.lightness) {
      < 0.35 => t.editor.colors.dark,
      < 0.65 => null,
      _ => t.editor.colors.light,
    };

    if (lightnessName == null) {
      return t.editor.colors.customHue(h: hueName);
    } else {
      return t.editor.colors.customBrightnessHue(
        b: lightnessName,
        h: hueName,
      );
    }
  }

  /// Returns whether the color is now pinned.
  static bool toggleColorPinned(String colorString) {
    if (Prefs.pinnedColors.value.contains(colorString)) {
      // TODO(adil192): remove from pinned and add to recent colors
      Prefs.pinnedColors.value.remove(colorString);
      Prefs.recentColorsChronological.value.remove(colorString);
      Prefs.recentColorsPositioned.value.remove(colorString);
      if (Prefs.recentColorsChronological.value.length >= Prefs.recentColorsLength.value) {
        // if full, replace oldest
        final oldestColor = Prefs.recentColorsChronological.value.removeAt(0);
        Prefs.recentColorsChronological.value.add(colorString);
        final int oldestColorPosition = Prefs.recentColorsPositioned.value.indexOf(oldestColor);
        Prefs.recentColorsPositioned.value[oldestColorPosition] = colorString;
      } else {
        // not full, add to end
        Prefs.recentColorsChronological.value.add(colorString);
        Prefs.recentColorsPositioned.value.insert(0, colorString);
      }
      return false;
    } else {
      // add to pinned and remove from recent colors
      Prefs.pinnedColors.value.add(colorString);
      Prefs.recentColorsChronological.value.remove(colorString);
      Prefs.recentColorsPositioned.value.remove(colorString);
      return true;
    }
  }

  @override
  State<ColorBar> createState() => _ColorBarState();
}

class _ColorBarState extends State<ColorBar> {
  static Color pickedColor = const Color.fromRGBO(255, 0, 0, 1);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    final children = <Widget>[
      // pinned colors
      if (Prefs.pinnedColors.value.isNotEmpty) ...[
        const ColorOptionSeparatorIcon(
          icon: Icons.pin_drop,
        ),

        for (String colorString in Prefs.pinnedColors.value) ColorOption(
          isSelected: widget.currentColor?.withAlpha(255).value == int.parse(colorString),
          enabled: widget.currentColor != null,
          onTap: () => widget.setColor(Color(int.parse(colorString))),
          onLongPress: () => setState(() => ColorBar.toggleColorPinned(colorString)),
          tooltip: ColorBar.findColorName(Color(int.parse(colorString))),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(int.parse(colorString)).withInversion(widget.invert),
              shape: BoxShape.circle,
              border: Border.all(
                color: colorScheme.onSurface.withOpacity(0.2),
                width: 1,
              ),
            ),
          ),
        ),
      ],

      const ColorOptionSeparatorIcon(
        icon: Icons.history,
      ),

      // recent colors
      for (String colorString in Prefs.recentColorsPositioned.value.reversed) ColorOption(
        isSelected: widget.currentColor?.withAlpha(255).value == int.parse(colorString),
        enabled: widget.currentColor != null,
        onTap: () => widget.setColor(Color(int.parse(colorString))),
        onLongPress: () => setState(() => ColorBar.toggleColorPinned(colorString)),
        tooltip: ColorBar.findColorName(Color(int.parse(colorString))),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Color(int.parse(colorString)).withInversion(widget.invert),
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
        enabled: widget.currentColor != null,
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

      const ColorOptionSeparatorIcon(
        icon: Icons.palette,
      ),

      // custom color
      ColorOption(
        isSelected: widget.currentColor?.withAlpha(255).value == pickedColor.value,
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
      for (NamedColor namedColor in ColorBar.colorPresets) ColorOption(
        isSelected: widget.currentColor?.withAlpha(255).value == namedColor.color.value,
        enabled: widget.currentColor != null,
        onTap: () => widget.setColor(namedColor.color),
        tooltip: namedColor.name,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: namedColor.color.withInversion(widget.invert),
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
          scrollDirection: widget.axis,
          child: widget.axis == Axis.horizontal
              ? Row(children: children)
              : Column(children: children),
        ),
      ),
    );
  }

  void openColorPicker(BuildContext context) async {
    bool? confirmChange = await showDialog(
      context: context,
      builder: (BuildContext context) => _colorPickerDialog(context),
    );
    if (confirmChange ?? false) {
      widget.setColor(pickedColor.withInversion(widget.invert));
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
