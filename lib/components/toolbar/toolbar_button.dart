
import 'package:flutter/material.dart';

class ToolbarIconButton extends StatelessWidget {
  const ToolbarIconButton({
    Key? key,
    this.tooltip,
    this.selected = false,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final String? tooltip;
  final bool selected;
  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Ink(
      decoration: ShapeDecoration(
        color: selected ? colorScheme.primary : null,
        shape: const CircleBorder(),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: IconButton(
        color: selected ? colorScheme.onPrimary : colorScheme.primary,
        onPressed: onPressed,
        tooltip: tooltip,
        iconSize: 20,
        splashRadius: 20,
        visualDensity: VisualDensity.compact,
        icon: child,
      ),
    );
  }
}
