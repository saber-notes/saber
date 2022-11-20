
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/interactive_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';

import 'inner_canvas.dart';

class CanvasPreview extends StatelessWidget {
  const CanvasPreview({
    super.key,
    required this.path,
    required this.height,
    required this.coreInfo,
  });

  final String path;
  final int pageIndex = 0;

  final double? height;
  final EditorCoreInfo coreInfo;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "inner-canvas-$path-page$pageIndex",

      child: InteractiveCanvasViewer(
        maxScale: 5,
        scrollZoomEnabled: false,

        child: FittedBox(
          child: InnerCanvas(
            width: coreInfo.width,
            height: height ?? coreInfo.height * 0.1,
            coreInfo: coreInfo,
            currentStroke: null,
            readOnly: true,
          ),
        ),
      ),
    );
  }
}
