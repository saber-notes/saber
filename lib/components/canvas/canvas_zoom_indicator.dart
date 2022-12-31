
import 'dart:async';

import 'package:flutter/material.dart';

class CanvasZoomIndicator extends StatefulWidget {
  const CanvasZoomIndicator({
    super.key,
    required this.zoom,
  });

  final double zoom;

  @override
  State<CanvasZoomIndicator> createState() => _CanvasZoomIndicatorState();
}

class _CanvasZoomIndicatorState extends State<CanvasZoomIndicator> {
  Timer? _hideIndicatorTimer;
  double opacity = 0;

  @override
  void didUpdateWidget(covariant CanvasZoomIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.zoom != oldWidget.zoom) {
      _hideIndicatorTimer?.cancel();
      _hideIndicatorTimer = Timer(const Duration(milliseconds: 500), () {
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
          "${widget.zoom.toStringAsFixed(1)}x",
          style: TextStyle(color: colorScheme.onBackground),
        ),
      ),
    );
  }
}
