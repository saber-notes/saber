import 'package:flutter/material.dart' hide TransformationController;
import 'package:saber/components/canvas/interactive_canvas.dart';

class CanvasZoomIndicator extends StatefulWidget {
  const CanvasZoomIndicator({
    super.key,
    required this.transformationController,
  });

  final TransformationController transformationController;

  @override
  State<CanvasZoomIndicator> createState() => _CanvasZoomIndicatorState();
}

class _CanvasZoomIndicatorState extends State<CanvasZoomIndicator> {
  double lastZoomLevel = 1;

  @override
  void initState() {
    lastZoomLevel = widget.transformationController.value.getMaxScaleOnAxis();
    widget.transformationController.addListener(_onTransformationChanged);
    super.initState();
  }

  void _onTransformationChanged() {
    final double zoomLevel = widget.transformationController.value.getMaxScaleOnAxis();
    if (zoomLevel != lastZoomLevel) {
      setState(() {
        lastZoomLevel = zoomLevel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.background.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(5),
      child: Text(
        '${lastZoomLevel.toStringAsFixed(1)}x',
        style: TextStyle(color: colorScheme.onBackground),
      ),
    );
  }

  @override
  void dispose() {
    widget.transformationController.removeListener(_onTransformationChanged);
    super.dispose();
  }
}
