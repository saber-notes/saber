import 'package:flutter/material.dart';
import 'package:onyxsdk_pen/onyxsdk_pen_area.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/tools/select.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';

import '_stroke.dart';
import 'inner_canvas.dart';

class Canvas extends StatelessWidget {
  const Canvas({
    super.key,
    required this.path,
    required this.page,
    required this.pageIndex,
    required this.textEditing,
    required this.coreInfo,
    required this.currentStroke,
    required this.currentSelection,
    required this.setAsBackground,
    this.placeholder = false,
  });

  final String path;
  final EditorPage page;
  final int pageIndex;

  final bool textEditing;
  final EditorCoreInfo coreInfo;
  final Stroke? currentStroke;
  final SelectResult? currentSelection;

  final void Function(EditorImage image)? setAsBackground;

  final bool placeholder;

  @override
  Widget build(BuildContext context) {
    Size pageSize = coreInfo.pages.isNotEmpty ? coreInfo.pages[pageIndex].size : EditorPage.defaultSize;

    return Center(
      child: FittedBox(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(
              color: Colors.black.withOpacity(0.1), // dark regardless of theme
              blurRadius: 10,
              spreadRadius: 2,
            )],
          ),
          child: !placeholder ? ClipRect(
            child: SizedBox(
              width: pageSize.width,
              height: pageSize.height,
              child: OnyxSdkPenArea(
                child: InnerCanvas(
                  key: page.innerCanvasKey,
                  pageIndex: pageIndex,
                  redrawPageListenable: page,
                  width: pageSize.width,
                  height: pageSize.height,
                  textEditing: textEditing,
                  coreInfo: coreInfo,
                  currentStroke: currentStroke,
                  currentSelection: currentSelection,
                  setAsBackground: setAsBackground,
                ),
              ),
            ),
          ) : SizedBox(
            width: pageSize.width,
            height: pageSize.height,
          ),
        ),
      ),
    );
  }
}
