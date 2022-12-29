
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/color_extensions.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';

import '_stroke.dart';
import 'inner_canvas.dart';

class Canvas extends StatelessWidget {
  const Canvas({
    super.key,
    required this.path,
    required this.pageIndex,
    required this.innerCanvasKey,
    required this.textEditing,
    required this.coreInfo,
    required this.currentStroke,
    this.placeholder = false,
  });

  final String path;
  final int pageIndex;

  final GlobalKey<State<InnerCanvas>>? innerCanvasKey;

  final bool textEditing;
  final EditorCoreInfo coreInfo;
  final Stroke? currentStroke;

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
            child: InnerCanvas(
              key: innerCanvasKey,
              pageIndex: pageIndex,
              width: pageSize.width,
              height: pageSize.height,
              textEditing: textEditing,
              coreInfo: coreInfo,
              currentStroke: currentStroke,
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
