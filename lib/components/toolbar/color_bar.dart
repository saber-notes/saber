
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/color_extensions.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/components/toolbar/color_option.dart';
import 'package:saber/data/prefs.dart';

class ColorBar extends StatelessWidget {
  const ColorBar({
    Key? key,
    required this.setColor,
  }) : super(key: key);

  final ValueChanged<Color> setColor;

  static const double diameter = 25;

  static List<Color> get colorOptions => Prefs.preferGreyscale.value ? greyScaleColorOptions : normalColorOptions;
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

    Brightness brightness = Theme.of(context).brightness;
    bool invert = Prefs.editorAutoInvert.value && brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // recent colors
              for (String colorString in Prefs.recentColorsPositioned.value.reversed) ColorOption(
                isSelected: Pen.currentPen.strokeProperties.color.value == int.parse(colorString),
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
                onTap: () {},
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

              // all colors
              for (Color color in colorOptions) ColorOption(
                isSelected: Pen.currentPen.strokeProperties.color.value == color.value,
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
            ],
          ),
        ),
      ),
    );
  }
}