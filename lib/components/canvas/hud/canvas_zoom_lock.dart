import 'package:flutter/material.dart';

class CanvasZoomLock extends StatelessWidget {
  const CanvasZoomLock({
    super.key,
    required this.zoomLock,
    required this.onZoomLockChanged,
  });

  final bool zoomLock;
  final ValueChanged<bool> onZoomLockChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final IconData icon = zoomLock ? Icons.lock : Icons.lock_open;
    return GestureDetector(
      onTap: () => onZoomLockChanged(!zoomLock),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.background.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(5),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Icon(icon, color: colorScheme.onBackground, key: ValueKey(icon)),
        ),
      ),
    );
  }
}
