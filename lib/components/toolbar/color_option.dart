
import 'package:flutter/material.dart';

class ColorOption extends StatelessWidget {
  const ColorOption({
    super.key,
    required this.isSelected,
    this.enabled = true,
    this.onTap,
    required this.child,
  });

  final bool isSelected;
  final bool enabled;
  final VoidCallback? onTap;
  final Widget child;

  static const double diameter = 25;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(diameter / 2),
        onTap: enabled ? onTap : null,
        child: Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? colorScheme.onSurface : Colors.transparent,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: AnimatedOpacity(
              opacity: enabled ? 1 : 0.5,
              duration: const Duration(milliseconds: 200),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class ColorOptionSeparator extends StatelessWidget {
  const ColorOptionSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        width: 4,
        height: 4,
        decoration: BoxDecoration(
          color: colorScheme.onSurface,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
