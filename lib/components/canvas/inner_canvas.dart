
import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/canvas_image.dart';
import 'package:saber/components/canvas/color_extensions.dart';
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
    this.readOnly = false,
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

  final bool readOnly;

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
    final Brightness brightness = Theme.of(context).brightness;
    final bool invert = Prefs.editorAutoInvert.value && brightness == Brightness.dark;

    final Color backgroundColor;
    if (widget.coreInfo.backgroundColor != null) {
      backgroundColor = widget.coreInfo.backgroundColor!.withInversion(invert);
    } else {
      backgroundColor = const Color(0xFFFCFCFC).withInversion(invert);
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
        child: DeferredPointerHandler(
          child: Stack(
            children: [
              for (final EditorImage editorImage in widget.coreInfo.images)
                CanvasImage(
                  image: editorImage,
                  pageSize: Size(widget.width, widget.height),
                  readOnly: widget.readOnly,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
