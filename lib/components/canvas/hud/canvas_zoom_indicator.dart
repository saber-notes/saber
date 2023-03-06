import 'package:flutter/material.dart' hide TransformationController;

class CanvasZoomIndicator extends StatelessWidget {
  const CanvasZoomIndicator({
    super.key,
    required this.scale,
    required this.resetZoom,
  });

  final double scale;
  final VoidCallback? resetZoom;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: resetZoom,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.background.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(5),
        child: Text(
          '${scale.toStringAsFixed(1)}x',
          style: TextStyle(color: colorScheme.onBackground),
        ),
      ),
    );
  }
}
