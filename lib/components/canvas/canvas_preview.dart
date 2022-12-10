
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

  final double? height;
  final EditorCoreInfo coreInfo;

  @override
  Widget build(BuildContext context) {
    Size pageSize = coreInfo.pageSizes.isNotEmpty ? coreInfo.pageSizes[0] : EditorCoreInfo.defaultPageSize;
    return Hero(
      tag: "inner-canvas-$path-page0",

      child: InteractiveCanvasViewer(
        maxScale: 5,
        scrollZoomEnabled: false,

        child: FittedBox(
          child: InnerCanvas(
            width: pageSize.width,
            height: height ?? pageSize.height * 0.1,
            coreInfo: coreInfo,
            currentStroke: null,
            readOnly: true,
          ),
        ),
      ),
    );
  }
}
