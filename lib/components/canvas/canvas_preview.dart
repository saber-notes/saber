
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/prefs.dart';

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

    return SizedOverflowBox(
      size: Size(pageSize.width, height ?? pageSize.height),
      alignment: Alignment.topCenter,
      child: InnerCanvas(
        pageIndex: pageIndex,
        width: pageSize.width,
        height: pageSize.height,
        isPreview: true,
        coreInfo: coreInfo,
        currentStroke: null,
        currentStrokeDetectedShape: null,
        currentSelection: null,
        hideBackground: Prefs.hideHomeBackgrounds.value,
        currentToolIsSelect: false,
      ),
    );
  }
}
