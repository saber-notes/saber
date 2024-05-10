import 'package:flutter/material.dart';
import 'package:saber/data/prefs.dart';

/// toolbar buttons sizes
enum ToolbarSize{
  small(buttonSize: 12, padding: 2, colorOptionDiameter: 18, penModalSize: 22, sizePickerFontSize: 8, sizePickerSize: Size(150,18)),
  normal(buttonSize: 18, padding: 6, colorOptionDiameter: 28, penModalSize: 32, sizePickerFontSize: 10, sizePickerSize: Size(150,28)),
  big(buttonSize: 22, padding: 8, colorOptionDiameter: 30, penModalSize: 40, sizePickerFontSize: 14, sizePickerSize: Size(150,30));

  const ToolbarSize({
    required this.buttonSize,
    required this.padding,
    required this.colorOptionDiameter,
    required this.penModalSize,
    required this.sizePickerFontSize,
    required this.sizePickerSize,
  }
  );

  final double buttonSize;          // size of button
  final double padding;             // padding between button
  final double colorOptionDiameter; // diameter of color option cirle
  final double penModalSize;        // Size of PenModal icons
  final double sizePickerFontSize;  //Size of font in pen Size picker
  final Size sizePickerSize;        // width and height of pen size picker height should be colorOptionDiameter
}


class ToolbarIconButton extends StatelessWidget {
  const ToolbarIconButton({
    super.key,
    this.tooltip,
    this.selected = false,
    this.enabled = true,
    required this.onPressed,
    required this.padding,
    required this.child,
  });

  final String? tooltip;
  final bool selected;
  final bool enabled;
  final VoidCallback? onPressed;

  final EdgeInsets padding;
  final Widget child;


  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Ink(
      decoration: ShapeDecoration(
        color: (selected && enabled) ? colorScheme.primary : null,
        shape: const CircleBorder(),
      ),
      padding: padding,
      child: IconButton(
        color:
            (selected && enabled) ? colorScheme.onPrimary : colorScheme.primary,
        disabledColor: colorScheme.onSurface.withOpacity(0.4),
        onPressed: (enabled) ? onPressed : null,
        tooltip: tooltip,
        iconSize: Prefs.editorToolbarSize.value.buttonSize,
        splashRadius: Prefs.editorToolbarSize.value.buttonSize,
        visualDensity: VisualDensity.compact,
        icon: child,
      ),
    );
  }
}



