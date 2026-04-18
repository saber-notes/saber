import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/components/canvas/select_result.dart';
import 'package:saber/data/tools/_tool.dart';

abstract class Select extends Tool {
  var selectResult = SelectResult(
    pageIndex: -1,
    strokes: const [],
    images: const [],
    path: Path(),
  );
  var doneSelecting = false;

  void unselect() {}

  Color? getDominantStrokeColor() {
    return null;
  }

  void onDragStart(Offset position, int pageIndex);

  void onDragUpdate(Offset position);

  void onDragEnd(List<Stroke> strokes, List<EditorImage> images);
}
