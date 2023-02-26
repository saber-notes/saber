import 'package:flutter/material.dart';

class CanvasGestureLockBtn extends StatelessWidget {
  const CanvasGestureLockBtn({
    super.key,
    required this.lock,
    required this.setLock,
    required this.icon,
    required this.tooltip,
  });

  final bool lock;
  final ValueChanged<bool> setLock;
  final IconData icon;
  final String tooltip;

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
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Tooltip(
            message: tooltip,
            child: Icon(
              icon,
              color: colorScheme.onBackground,
              key: ValueKey(icon),
            ),
          ),
        ),
      ),
    );
  }
}
