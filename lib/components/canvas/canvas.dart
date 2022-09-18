
import 'package:flutter/material.dart';
import 'package:saber/data/editor/editor_core_info.dart';

import '_stroke.dart';
import 'inner_canvas.dart';

class Canvas extends StatelessWidget {
  const Canvas({
    super.key,
    required this.path,
    required this.pageIndex,
    required this.innerCanvasKey,
    required this.coreInfo,
    required this.currentStroke,
  });

  final String path;
  final int pageIndex;

  final EditorCoreInfo coreInfo;
  final Stroke? currentStroke;

  final GlobalKey<State<InnerCanvas>>? innerCanvasKey;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "inner-canvas-$path-page$pageIndex",

      child: ClipRect(
        child: Center(
          child: FittedBox(
            child: InnerCanvas(
              key: innerCanvasKey,
              width: coreInfo.width,
              height: coreInfo.height,
              coreInfo: coreInfo,
              currentStroke: currentStroke,
            ),
          ),
        ),
      ),
    );
  }
}
