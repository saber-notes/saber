import 'dart:async';

import 'package:flutter/material.dart' hide TransformationController;
import 'package:saber/components/canvas/hud/canvas_gesture_lock_btn.dart';
import 'package:saber/components/canvas/hud/canvas_zoom_indicator.dart';
import 'package:saber/components/canvas/interactive_canvas.dart';
import 'package:saber/i18n/strings.g.dart';

class CanvasHud extends StatefulWidget {
  const CanvasHud({
    super.key,
    required this.transformationController,
    required this.zoomLock,
    required this.setZoomLock,
    required this.resetZoom,
    required this.singleFingerPanLock,
    required this.setSingleFingerPanLock,
  });

  final TransformationController transformationController;
  final bool zoomLock;
  final ValueChanged<bool> setZoomLock;
  final VoidCallback? resetZoom;
  final bool singleFingerPanLock;
  final ValueChanged<bool> setSingleFingerPanLock;

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
    _hideTimer = Timer(const Duration(seconds: 5), () {
      setState(() => opacity = 0);
    });

    if (opacity != 1) {
      setState(() => opacity = 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: opacity < 0.5,
      child: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 200),
        child: Stack(
          children: [
            Positioned(
              top: 5,
              left: 5,
              child: CanvasGestureLockBtn(
                lock: widget.zoomLock,
                setLock: widget.setZoomLock,
                icon: widget.zoomLock ? Icons.lock : Icons.lock_open,
                tooltip: widget.zoomLock ? t.editor.hud.unlockZoom : t.editor.hud.lockZoom,
              ),
            ),
            Positioned(
              top: 45,
              left: 5,
              child: CanvasGestureLockBtn(
                lock: widget.singleFingerPanLock,
                setLock: widget.setSingleFingerPanLock,
                icon: widget.singleFingerPanLock ? Icons.pinch : Icons.swipe_up,
                tooltip: widget.singleFingerPanLock ? t.editor.hud.unlockPan : t.editor.hud.lockPan,
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: AnimatedBuilder(
                animation: widget.transformationController,
                builder: (context, _) => CanvasZoomIndicator(
                  scale: widget.transformationController.value.getMaxScaleOnAxis(),
                  resetZoom: widget.resetZoom,
                ),
              ),
            ),
          ],
        ),
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
