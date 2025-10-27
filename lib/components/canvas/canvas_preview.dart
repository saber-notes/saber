import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/extensions/list_extensions.dart';

class CanvasPreview extends StatelessWidget implements PreferredSizeWidget {
  CanvasPreview({
    super.key,
    this.pageIndex = 0,
    required this.height,
    required this.coreInfo,
    this.highQuality = false,
  });

  final int pageIndex;
  final double? height;
  final EditorCoreInfo coreInfo;

  /// Whether to draw [Stroke.highQualityPath] or [Stroke.lowQualityPath].
  final bool highQuality;

  late final pageSize =
      coreInfo.pages.getOrNull(pageIndex)?.size ?? EditorPage.defaultSize;
  @override
  late final preferredSize = Size(pageSize.width, height ?? pageSize.height);

  @override
  Widget build(BuildContext context) {
    return InnerCanvas(
      pageIndex: pageIndex,
      width: preferredSize.width,
      height: preferredSize.height,
      isPreview: true,
      coreInfo: coreInfo,
      currentStroke: null,
      currentStrokeDetectedShape: null,
      currentSelection: null,
      currentToolIsSelect: false,
      currentScale: highQuality ? double.maxFinite : double.minPositive,
    );
  }
}
