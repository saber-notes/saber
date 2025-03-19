import 'package:flutter/material.dart';
import 'package:one_dollar_unistroke_recognizer/one_dollar_unistroke_recognizer.dart';
import 'package:onyxsdk_pen/onyxsdk_pen_area.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/highlighter.dart';
import 'package:saber/data/tools/eraser.dart';
import 'package:saber/data/tools/pencil.dart';
import 'package:saber/data/tools/laser_pointer.dart';
import 'package:saber/data/tools/select.dart';
import 'package:saber/data/tools/pen.dart';

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

  int toolToOnyx(Tool currentTool) {
    if (placeholder) return 5;
    if (currentTool is Pencil) {
      return 3;
    } else if (currentTool is Highlighter) {
      return 4;
    } else if (currentTool is Eraser) {
      return 4;
    } else if (currentTool is Select) {
      return 3;
    } else if (currentTool is LaserPointer) {
      return 4;
    } else if (currentTool is Pen) {
      if ((currentTool as Pen).isPressureEnabled()) {
        return 0;
      } else {
        return 1;
      }
    } else {
      return 5;
    }
  }

  int getColor() {
      if (currentTool is Pen) {
        var color = (currentTool as Pen).color.toARGB32();
      	print('color is $color');
        return color;
      } else {
        return 0;
      }
  }
  double getWidth() {
      if (currentTool is Highlighter) {
        print('highlighter detected');
        return 50.0;
      } else {
        return 5;
      }
  }
  
  @override
  Widget build(BuildContext context) {
    print('currentTool: $currentTool');
    return Center(
      child: FittedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withValues(alpha: 0.1), // dark regardless of theme
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: !placeholder
              ? ClipRect(
                  child: SizedBox(
                    width: page.size.width,
                    height: page.size.height,
                    child: OnyxSdkPenArea(
		      refreshDelay: const Duration(seconds: 1),
		      strokeStyle: toolToOnyx(currentTool),
		      strokeColor: getColor(),
		      strokeWidth: getWidth(),
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
                        currentToolIsSelect: currentTool is Select,
                        currentScale: currentScale,
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  width: page.size.width,
                  height: page.size.height,
                ),
        ),
      ),
    );
  }
}
