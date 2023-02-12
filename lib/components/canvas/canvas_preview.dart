
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/interactive_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/prefs.dart';

import 'inner_canvas.dart';

class CanvasPreview extends StatelessWidget {
  const CanvasPreview({
    super.key,
    this.pageIndex = 0,
    required this.height,
    required this.coreInfo,
  });

  final int pageIndex;
  final double? height;
  final EditorCoreInfo coreInfo;

  @override
  Widget build(BuildContext context) {
    Size pageSize = coreInfo.pages.isNotEmpty
        ? coreInfo.pages[pageIndex].size
        : EditorPage.defaultSize;

    return InteractiveCanvasViewer(
      maxScale: 5,
      scrollZoomEnabled: false,

      child: FittedBox(
        child: SizedOverflowBox(
          size: Size(pageSize.width, height ?? pageSize.height),
          alignment: Alignment.topCenter,
          child: InnerCanvas(
            pageIndex: pageIndex,
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
