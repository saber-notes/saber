
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:saber/components/canvas/interactive_canvas.dart';

class CanvasGestureDetector extends StatelessWidget {
  const CanvasGestureDetector({
    Key? key,

    required this.isDrawGesture,
    required this.onDrawStart,
    required this.onDrawUpdate,
    required this.onDrawEnd,
    required this.onPressureChanged,

    required this.undo,
    required this.redo,

    required this.child,
  }) : super(key: key);

  final bool Function(ScaleStartDetails scaleDetails) isDrawGesture;
  final ValueChanged<ScaleStartDetails> onDrawStart;
  final ValueChanged<ScaleUpdateDetails> onDrawUpdate;
  final ValueChanged<ScaleEndDetails> onDrawEnd;
  final ValueChanged<double?> onPressureChanged;

  final VoidCallback undo;
  final VoidCallback redo;

  final Widget child;

  bool _isPointerDeviceAStylus(PointerDeviceKind kind) {
    return kind == PointerDeviceKind.stylus || kind == PointerDeviceKind.invertedStylus;
  }

  _listenerPointerEvent(PointerEvent event) {
    onPressureChanged(_isPointerDeviceAStylus(event.kind) ? event.pressure : null);
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
