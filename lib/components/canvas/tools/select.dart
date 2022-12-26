
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_stroke.dart';

import '_tool.dart';

class Select extends Tool {
  Select._();

  static final Select _currentSelect = Select._();
  static Select get currentSelect => _currentSelect;

  Path? currentPath;

  onDragStart(Offset position) {
    currentPath = Path();
    currentPath!.moveTo(position.dx, position.dy);
    onDragUpdate(position);
  }

  onDragUpdate(Offset position) {
    currentPath!.lineTo(position.dx, position.dy);
  }

  /// Returns the indices of any [strokes] that are inside the selection area
  List<int> onDragEnd(List<Stroke> strokes) {
    Path currentPath = this.currentPath!..close();
    this.currentPath = null;

    final List<int> indices = [];
    for (int i = 0; i < strokes.length; i++) {
      final Stroke stroke = strokes[i];
      // .every: all points must be inside the path
      // .any: at least one point must be inside the path
      // Currently, we use .every
      if (stroke.polygon.every((strokeVertex) => currentPath.contains(strokeVertex))) {
        indices.add(i);
      }
    }
    return indices;
  }
}
