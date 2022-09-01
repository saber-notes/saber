
import 'package:flutter/material.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/prefs.dart';

import '_canvas_painter.dart';
import '_stroke.dart';

class InnerCanvas extends StatefulWidget {
  InnerCanvas({
    super.key,
    this.pageIndex = 0,
    required this.width,
    required this.height,
    required EditorCoreInfo coreInfo,
    required this.currentStroke,
    this.onRenderObjectChange,
  }) {
    this.coreInfo = coreInfo.copyWith(
      strokes: coreInfo.strokes.where((stroke) => isStrokeInPage(stroke)).toList(),
    );
  }

  final int pageIndex;
  final double width;
  final double height;

  late final EditorCoreInfo coreInfo;
  final Stroke? currentStroke;
  final ValueChanged<RenderObject>? onRenderObjectChange;

  bool isStrokeInPage(Stroke stroke) {
    final maxY = stroke.maxY;
    final startOfPageY = height * pageIndex;
    return maxY >= startOfPageY && maxY <= startOfPageY + height;
  }

  @override
  State<InnerCanvas> createState() => _InnerCanvasState();
}

class _InnerCanvasState extends State<InnerCanvas> {

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor;
    bool invert = false;
    if (widget.coreInfo.backgroundColor != null) {
      backgroundColor = widget.coreInfo.backgroundColor!;
    } else {
      Brightness brightness = Theme.of(context).brightness;
      if (Prefs.editorAutoInvert.value && brightness == Brightness.dark) {
        backgroundColor = Colors.black.withOpacity(0.95);
        invert = true;
      } else {
        backgroundColor = Colors.white.withOpacity(0.95);
      }
    }

    return CustomPaint(
      foregroundPainter: CanvasPainter(
        invert: invert,
        strokes: widget.coreInfo.strokes,
        currentStroke: widget.currentStroke,
      ),
      isComplex: true,
      willChange: widget.currentStroke != null,
      child: Container(
        width: widget.width,
        height: widget.height,
        color: backgroundColor,
      ),
    );
  }
}
