
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/canvas.dart';

import '_stroke.dart';
import 'inner_canvas.dart';

class CanvasPreview extends StatelessWidget {
  const CanvasPreview({
    Key? key,
    required this.strokes,
  }) : super(key: key);

  final List<Stroke> strokes;

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: 5,

      child: FittedBox(
        child: InnerCanvas(
          strokes: strokes,
          currentStroke: null,
        ),
      ),
    );
  }
}
