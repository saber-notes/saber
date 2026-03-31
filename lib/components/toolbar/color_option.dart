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
    const ritualGold = Color(0xFFD4AF37);
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
                color: isSelected ? ritualGold : Colors.white10,
                width: isSelected ? 2.5 : 1.0,
              ),
              boxShadow: isSelected ? [
                BoxShadow(
                  color: const Color(0xFFFF2200).withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 1,
                )
              ] : null,
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
  const ColorOptionSeparatorIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    const ritualGold = Color(0xFFD4AF37);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Icon(
        icon,
        size: 14,
        color: ritualGold.withOpacity(0.5),
      ),
    );
  }
}
