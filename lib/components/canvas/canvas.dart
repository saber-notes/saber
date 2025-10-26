import 'package:flutter/material.dart';
import 'package:one_dollar_unistroke_recognizer/one_dollar_unistroke_recognizer.dart';
import 'package:onyxsdk_pen/onyxsdk_pen.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
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
    required this.currentToolIsSelect,
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

  final bool currentToolIsSelect;
  final double currentScale;
  final bool placeholder;

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
                      currentToolIsSelect: currentToolIsSelect,
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
