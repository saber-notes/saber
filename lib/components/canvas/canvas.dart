import 'package:flutter/material.dart';
import 'package:one_dollar_unistroke_recognizer/one_dollar_unistroke_recognizer.dart';
import 'package:onyxsdk_pen/onyxsdk_pen.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/pen.dart';
import 'package:saber/data/tools/select.dart';

class Canvas extends StatelessWidget {
  const Canvas({
    super.key,
    required this.path,
    required this.page,
    required this.pageIndex,
    required this.textEditing,
    required this.coreInfo,
    required this.currentStroke,
    required this.currentStrokeDetectedShape,
    required this.currentSelection,
    required this.setAsBackground,
    required this.currentTool,
    required this.currentScale,
    this.placeholder = false,
  });

  final String path;
  final EditorPage page;
  final int pageIndex;

  final bool textEditing;
  final EditorCoreInfo coreInfo;
  final Stroke? currentStroke;
  final RecognizedUnistroke? currentStrokeDetectedShape;
  final SelectResult? currentSelection;

  final void Function(EditorImage image)? setAsBackground;

  final Tool currentTool;
  final double currentScale;
  final bool placeholder;

  OnyxStrokeStyle getOnyxTool(Tool currentTool) {
    if (placeholder) return OnyxStrokeStyle.pen;
    switch (currentTool.toolId) {
      case ToolId.fountainPen:
        return OnyxStrokeStyle.brush;
      case ToolId.ballpointPen:
        return OnyxStrokeStyle.pen;
      case ToolId.highlighter:
        return OnyxStrokeStyle.marker;
      case ToolId.pencil:
        return OnyxStrokeStyle.pencil;
      case ToolId.shapePen:
        return OnyxStrokeStyle.disabled;
      case ToolId.eraser:
        return OnyxStrokeStyle.disabled;
      case ToolId.select:
        return OnyxStrokeStyle.pen;
      case ToolId.laserPointer:
        return OnyxStrokeStyle.pen;
      default:
        return OnyxStrokeStyle.disabled;
    }
  }

  Color getOnyxColor() {
    if (currentTool is Pen) {
      return (currentTool as Pen).color;
    } else {
      return Colors.black;
    }
  }

  double getOnyxWidth() {
    if (currentTool is Pen) {
      final baseSize = (currentTool as Pen).options.size * currentScale;
      if ((currentTool as Pen).pressureEnabled) {
        return baseSize;
      } else {
        return baseSize * 2;
      }
    } else {
      return 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(
                  alpha: 0.1,
                ), // dark regardless of theme
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: !placeholder
              ? SizedBox(
                  width: page.size.width,
                  height: page.size.height,
                  child: OnyxSdkPenArea(
                    refreshDelay: const Duration(seconds: 1),
                    strokeStyle: getOnyxTool(currentTool),
                    strokeColor: getOnyxColor(),
                    strokeWidth: getOnyxWidth(),
                    child: InnerCanvas(
                      key: page.innerCanvasKey,
                      pageIndex: pageIndex,
                      redrawPageListenable: page,
                      width: page.size.width,
                      height: page.size.height,
                      textEditing: textEditing,
                      coreInfo: coreInfo,
                      currentStroke: currentStroke,
                      currentStrokeDetectedShape: currentStrokeDetectedShape,
                      currentSelection: currentSelection,
                      setAsBackground: setAsBackground,
                      currentToolIsSelect: currentTool.toolId == ToolId.select,
                      currentScale: currentScale,
                    ),
                  ),
                )
              : SizedBox(width: page.size.width, height: page.size.height),
        ),
      ),
    );
  }
}
