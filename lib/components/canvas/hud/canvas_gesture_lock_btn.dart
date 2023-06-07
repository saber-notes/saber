import 'package:flutter/material.dart';

class CanvasGestureLockBtn extends StatelessWidget {
  /// Either [icon] or [child] must be provided.
  /// If both are provided, [child] will be used.
  /// If [child] is provided, you are required to handle the animation.
  const CanvasGestureLockBtn({
    super.key,
    required this.lock,
    required this.setLock,
    required this.tooltip,
    this.icon,
    this.child,
  })  : assert(icon != null || child != null);

  final bool lock;
  final ValueChanged<bool> setLock;
  final String tooltip;
  final IconData? icon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => setLock(!lock),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.background.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(5),
        child: Tooltip(
          message: tooltip,
          child: child ?? AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              icon,
              color: colorScheme.onBackground,
            ),
          ),
        ),
      ),
    );
  }
}
