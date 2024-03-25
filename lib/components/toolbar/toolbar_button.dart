import 'package:flutter/material.dart';
import 'package:saber/data/prefs.dart';

/// toolbar button size
enum ToolbarSize {
  big,
  normal,
  small,
}

extension ToolbarSizeGet on ToolbarSize {

  double getButtonSize(){
    /// return size of toolbar button
    switch (this){
      case ToolbarSize.small:
        return(12.0);
      case ToolbarSize.normal:
        return(18.0);
      case ToolbarSize.big:
        return(22.0);
    }
  }

  double getToolbarPadding(){
    /// return padding of toolbar
    switch (this){
      case ToolbarSize.small:
        return(2.0);
      case ToolbarSize.normal:
        return(6.0);
      case ToolbarSize.big:
        return(8.0);
    }
  }
  double getColorOptionDiameter(){
    /// return diameter of color option circle
    switch (this){
      case ToolbarSize.small:
        return(18.0);
      case ToolbarSize.normal:
        return(25.0);
      case ToolbarSize.big:
        return(30.0);
    }
  }

  double getPenModalSize(){
    /// return Size of PenModal icons
    switch (this){
      case ToolbarSize.small:
        return(22);
      case ToolbarSize.normal:
        return(32);
      case ToolbarSize.big:
        return(40);
    }
  }

  double getSizePickerFontSize(){
    /// return Size of font in pen Size picker
    switch (this){
      case ToolbarSize.small:
        return(8);
      case ToolbarSize.normal:
        return(10);
      case ToolbarSize.big:
        return(14);
    }
  }

  Size getSizePickerSize(){
    /// return Size of SizePicker slider
    return(
        Size(150, getColorOptionDiameter())
    );
  }

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
        iconSize: switch (Prefs.editorToolbarSize.value) {
            ToolbarSize.small => 12,
            ToolbarSize.normal => 16,
            ToolbarSize.big => 22,},
        splashRadius: switch (Prefs.editorToolbarSize.value) {
            ToolbarSize.small => 12,
            ToolbarSize.normal => 16,
            ToolbarSize.big => 22,},
        visualDensity: VisualDensity.compact,
        icon: child,
      ),
    );
  }
}


