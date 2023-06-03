import 'package:flutter/material.dart';

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
        color: (selected && enabled) ? colorScheme.onPrimary : colorScheme.primary,
        disabledColor: colorScheme.onSurface.withOpacity(0.4),
        onPressed: (enabled) ? onPressed : null,
        tooltip: tooltip,
        iconSize: 20,
        splashRadius: 20,
        visualDensity: VisualDensity.compact,
        icon: child,
      ),
    );
  }
}
