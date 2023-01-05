
import 'dart:async';

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
  Timer? _hideIndicatorTimer;
  double opacity = 0;

  late double lastZoomLevel = widget.transformationController.value.getMaxScaleOnAxis();

  @override
  void initState() {
    lastZoomLevel = widget.transformationController.value.getMaxScaleOnAxis();
    widget.transformationController.addListener(_onTransformationChanged);
    super.initState();
  }

  void _onTransformationChanged() {
    final double zoomLevel = widget.transformationController.value.getMaxScaleOnAxis();
    if (zoomLevel != lastZoomLevel) {
      lastZoomLevel = zoomLevel;
      _showIndicatorTemporarily();
    }
  }

  void _showIndicatorTemporarily([Duration showDuration = const Duration(milliseconds: 500)]) {
    _hideIndicatorTimer?.cancel();
    _hideIndicatorTimer = Timer(showDuration, () {
      setState(() {
        opacity = 0;
      });
    });

    if (opacity != 1) {
      setState(() {
        opacity = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 200),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.background.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(5),
        child: Text(
          "${lastZoomLevel.toStringAsFixed(1)}x",
          style: TextStyle(color: colorScheme.onBackground),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _hideIndicatorTimer?.cancel();
    super.dispose();
  }
}
