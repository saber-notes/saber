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
    const ritualGold = Color(0xFFD4AF37);
    const ritualScarlet = Color(0xFFFF2200);
    const ritualObsidian = Color(0xFF0A0A0A);

    final backgroundColor = WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ritualScarlet.withOpacity(0.15);
      }
      return Colors.transparent;
    });

    final foregroundColor = WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return ritualGold.withOpacity(0.2);
      }
      if (states.contains(WidgetState.selected)) {
        return ritualGold;
      }
      return ritualGold.withOpacity(0.6);
    });

    final buttonStyle = ButtonStyle(
      backgroundColor: backgroundColor,
      iconColor: foregroundColor,
      foregroundColor: foregroundColor,
      iconSize: const WidgetStatePropertyAll(18),
      padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      overlayColor: WidgetStateProperty.all(ritualScarlet.withOpacity(0.1)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: selected ? ritualGold.withOpacity(0.3) : Colors.transparent,
            width: 1.0,
          ),
        ),
      ),
    );

    return Padding(
      padding: padding,
      child: IconButton.filled(
        style: buttonStyle,
        onPressed: (enabled) ? onPressed : null,
        tooltip: tooltip,
        isSelected: selected,
        icon: child,
      ),
    );
  }
}
