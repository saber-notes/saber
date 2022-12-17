
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/interactive_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';

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
    Size pageSize = coreInfo.pages.isNotEmpty ? coreInfo.pages[0].size : EditorPage.defaultSize;
    return InteractiveCanvasViewer(
      maxScale: 5,
      scrollZoomEnabled: false,

      child: FittedBox(
        child: InnerCanvas(
          width: pageSize.width,
          height: height ?? pageSize.height * 0.1,
          coreInfo: coreInfo,
          currentStroke: null,
        ),
      ),
    );
  }
}
