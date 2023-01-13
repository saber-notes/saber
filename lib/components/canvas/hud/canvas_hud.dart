import 'dart:async';

import 'package:flutter/material.dart' hide TransformationController;
import 'package:saber/components/canvas/hud/canvas_zoom_indicator.dart';
import 'package:saber/components/canvas/hud/canvas_zoom_lock.dart';
import 'package:saber/components/canvas/interactive_canvas.dart';

class CanvasHud extends StatefulWidget {
  const CanvasHud({
    super.key,
    required this.transformationController,
    required this.zoomLock,
    required this.onZoomLockChanged,
  });

  final TransformationController transformationController;
  final bool zoomLock;
  final ValueChanged<bool> onZoomLockChanged;

  @override
  State<CanvasHud> createState() => _CanvasHudState();
}

class _CanvasHudState extends State<CanvasHud> {
  Timer? _hideTimer;
  double opacity = 0;

  @override
  void initState() {
    widget.transformationController.addListener(_onTransformationChanged);
    super.initState();
  }

  void _onTransformationChanged() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(milliseconds: 2000), () {
      setState(() => opacity = 0);
    });

    if (opacity != 1) {
      setState(() => opacity = 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 200),
      child: Stack(
        children: [
          Positioned(
            top: 5,
            left: 5,
            child: CanvasZoomLock(
              zoomLock: widget.zoomLock,
              onZoomLockChanged: widget.onZoomLockChanged,
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: CanvasZoomIndicator(
              transformationController: widget.transformationController,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.transformationController.removeListener(_onTransformationChanged);
    _hideTimer?.cancel();
    super.dispose();
  }
}
