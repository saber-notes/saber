
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_stroke.dart';

import 'package:saber/components/canvas/tools/_tool.dart';

class Select extends Tool {
  Select._();

  static final Select _currentSelect = Select._();
  static Select get currentSelect => _currentSelect;

  SelectResult selectResult = SelectResult(-1, const [], Path());
  bool doneSelecting = false;

  @override
  ToolId get toolId => ToolId.select;

  void unselect() {
    doneSelecting = false;
    selectResult.pageIndex = -1;
  }

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

      final pointsInside = stroke.polygon.where((strokeVertex) {
        Offset translated = strokeVertex + stroke.offset;
        return selectResult.path.contains(translated);
      }).length;

      final ratio = pointsInside / stroke.polygon.length;

      // if more than 70% of the points are inside the path, select the stroke
      if (ratio > 0.7) {
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
