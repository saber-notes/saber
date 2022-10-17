
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide TransformationController;
import 'package:saber/components/canvas/canvas_zoom_indicator.dart';
import 'package:saber/components/canvas/interactive_canvas.dart';

class CanvasGestureDetector extends StatefulWidget {
  const CanvasGestureDetector({
    super.key,

    required this.isDrawGesture,
    this.onInteractionEnd,
    required this.onDrawStart,
    required this.onDrawUpdate,
    required this.onDrawEnd,
    required this.onPressureChanged,

    required this.undo,
    required this.redo,

    required this.child,
  });

  final bool Function(ScaleStartDetails scaleDetails) isDrawGesture;
  final ValueChanged<ScaleEndDetails>? onInteractionEnd;
  final ValueChanged<ScaleStartDetails> onDrawStart;
  final ValueChanged<ScaleUpdateDetails> onDrawUpdate;
  final ValueChanged<ScaleEndDetails> onDrawEnd;
  /// Called when the pressure of the stylus changes,
  /// pressure is negative if stylus button is pressed
  final ValueChanged<double?> onPressureChanged;

  final VoidCallback undo;
  final VoidCallback redo;

  final Widget child;

  @override
  State<CanvasGestureDetector> createState() => _CanvasGestureDetectorState();
}

class _CanvasGestureDetectorState extends State<CanvasGestureDetector> {
  final TransformationController _transformationController = TransformationController();

  @override
  initState() {
    _transformationController.addListener(onTransformationChanged);
    super.initState();
  }

  _listenerPointerEvent(PointerEvent event) {
    double? pressure;
    if (event.kind == PointerDeviceKind.stylus) {
      pressure = event.pressure;
    } else if (event.kind == PointerDeviceKind.invertedStylus) {
      pressure = -event.pressure;
    }
    widget.onPressureChanged(pressure);
  }

  onTransformationChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Listener(
          onPointerDown: _listenerPointerEvent,
          onPointerMove: _listenerPointerEvent,
          child: GestureDetector(
            onSecondaryTapUp: (TapUpDetails details) => widget.undo(),
            onTertiaryTapUp: (TapUpDetails details) => widget.redo(),
            child: InteractiveCanvasViewer(
              minScale: 0.01,
              maxScale: 5,
              constrained: false,

              transformationController: _transformationController,

              isDrawGesture: widget.isDrawGesture,
              onInteractionEnd: widget.onInteractionEnd,
              onDrawStart: widget.onDrawStart,
              onDrawUpdate: widget.onDrawUpdate,
              onDrawEnd: widget.onDrawEnd,

              child: widget.child,
            )
          )
        ),
        Positioned(
          top: 5,
          right: 5,
          child: CanvasZoomIndicator(
            zoom: _transformationController.value.getMaxScaleOnAxis(),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _transformationController.removeListener(onTransformationChanged);
    super.dispose();
  }
}
