
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/interactive_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/prefs.dart';

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
        child: SizedOverflowBox(
          size: Size(pageSize.width, height ?? pageSize.height * 0.1),
          alignment: Alignment.topCenter,
          child: InnerCanvas(
            width: pageSize.width,
            height: pageSize.height,
            isPreview: true,
            coreInfo: coreInfo,
            currentStroke: null,
            currentSelection: null,
            hideBackground: Prefs.hideHomeBackgrounds.value,
          ),
        ),
      ),
    );
  }
}
