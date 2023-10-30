import 'package:flutter/material.dart';

class ColorOption extends StatelessWidget {
  const ColorOption({
    super.key,
    required this.isSelected,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    required this.tooltip,
    required this.child,
  });

  final bool isSelected;
  final bool enabled;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final String? tooltip;
  final Widget child;

  static const double diameter = 25;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Tooltip(
      message: tooltip ?? '',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: InkWell(
          borderRadius: BorderRadius.circular(diameter / 2),
          onTap: enabled ? onTap : null,
          onLongPress: enabled ? onLongPress : null,
          onSecondaryTap: enabled ? onLongPress : null,
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
      ),
    );
  }
}

class ColorOptionSeparatorIcon extends StatelessWidget {
  const ColorOptionSeparatorIcon({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Icon(
        icon,
        size: 16,
        color: Color.lerp(
          colorScheme.onSurface,
          colorScheme.primary,
          0.2,
        )!.withOpacity(0.7),
      ),
    );
  }
}
