
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/interactive_canvas.dart';

class CanvasGestureDetector extends StatelessWidget {
  const CanvasGestureDetector({
    super.key,

    required this.isDrawGesture,
    required this.onDrawStart,
    required this.onDrawUpdate,
    required this.onDrawEnd,
    required this.onPressureChanged,

    required this.undo,
    required this.redo,

    required this.child,
  });

  final bool Function(ScaleStartDetails scaleDetails) isDrawGesture;
  final ValueChanged<ScaleStartDetails> onDrawStart;
  final ValueChanged<ScaleUpdateDetails> onDrawUpdate;
  final ValueChanged<ScaleEndDetails> onDrawEnd;
  /// Called when the pressure of the stylus changes,
  /// pressure is negative if stylus button is pressed
  final ValueChanged<double?> onPressureChanged;

  final VoidCallback undo;
  final VoidCallback redo;

  final Widget child;

  _listenerPointerEvent(PointerEvent event) {
    double? pressure;
    if (event.kind == PointerDeviceKind.stylus) {
      pressure = event.pressure;
    } else if (event.kind == PointerDeviceKind.invertedStylus) {
      pressure = -event.pressure;
    }
    onPressureChanged(pressure);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _listenerPointerEvent,
      onPointerMove: _listenerPointerEvent,
      child: GestureDetector(
        onSecondaryTapUp: (TapUpDetails details) => undo(),
        onTertiaryTapUp: (TapUpDetails details) => redo(),
        child: InteractiveCanvasViewer(
          minScale: 0.01,
          maxScale: 5,
          constrained: false,

          isDrawGesture: isDrawGesture,
          onDrawStart: onDrawStart,
          onDrawUpdate: onDrawUpdate,
          onDrawEnd: onDrawEnd,

          child: child,
        )
      )
    );
  }

}
