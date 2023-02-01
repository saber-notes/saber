
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_stroke.dart';

import '_tool.dart';

class Select extends Tool {
  Select._();

  static final Select _currentSelect = Select._();
  static Select get currentSelect => _currentSelect;

  SelectResult selectResult = SelectResult(-1, const [], Path());
  bool doneSelecting = false;

  void onDragStart(Offset position, int pageIndex) {
    doneSelecting = false;
    selectResult = SelectResult(pageIndex, [], Path());
    selectResult.path.moveTo(position.dx, position.dy);
    onDragUpdate(position);
  }

  void onDragUpdate(Offset position) {
    selectResult.path.lineTo(position.dx, position.dy);
  }

  /// Returns the indices of any [strokes] that are inside the selection area
  void onDragEnd(List<Stroke> strokes) {
    selectResult.path.close();
    doneSelecting = true;

    for (int i = 0; i < strokes.length; i++) {
      final Stroke stroke = strokes[i];
      // .every: all points must be inside the path
      // .any: at least one point must be inside the path
      // Currently, we use .every
      if (stroke.polygon.every((strokeVertex) {
        Offset translated = strokeVertex + stroke.offset;
        return selectResult.path.contains(translated);
      })) {
        selectResult.indices.add(i);
      }
    }
  }
}

class SelectResult {
  int pageIndex;
  final List<int> indices;
  Path path;

  SelectResult(this.pageIndex, this.indices, this.path);
}
