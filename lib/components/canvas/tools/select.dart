import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';

import 'package:saber/components/canvas/tools/_tool.dart';

class Select extends Tool {
  Select._();

  static final Select _currentSelect = Select._();
  static Select get currentSelect => _currentSelect;

  /// The minimum ratio of points inside a stroke or image
  /// for it to be selected.
  static const double minPercentInside = 0.7;

  SelectResult selectResult = SelectResult(
    pageIndex: -1,
    strokes: const [],
    images: const [],
    path: Path(),
  );
  bool doneSelecting = false;

  @override
  ToolId get toolId => ToolId.select;

  void unselect() {
    doneSelecting = false;
    selectResult.pageIndex = -1;
  }

  void onDragStart(Offset position, int pageIndex) {
    doneSelecting = false;
    selectResult = SelectResult(
      pageIndex: pageIndex,
      strokes: [],
      images: [],
      path: Path(),
    );
    selectResult.path.moveTo(position.dx, position.dy);
    onDragUpdate(position);
  }

  void onDragUpdate(Offset position) {
    selectResult.path.lineTo(position.dx, position.dy);
  }

  /// Adds the indices of any [strokes] that are inside the selection area
  /// to [selectResult.indices].
  void onDragEnd(List<Stroke> strokes, List<EditorImage> images) {

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
      if (ratio > minPercentInside) {
        selectResult.strokes.add(stroke);
      }
    }

    // test 5x5 grid of points inside each image
    for (int i = 0; i < images.length; i++) {
      final EditorImage image = images[i];

      const int gridSize = 5;
      final double gridCellWidth = image.dstRect.width / (gridSize - 1);
      final double gridCellHeight = image.dstRect.height / (gridSize - 1);

      int pointsInside = 0;
      for (int x = 0; x < gridSize; x++) {
        for (int y = 0; y < gridSize; y++) {
          if (selectResult.path.contains(Offset(
            image.dstRect.left + gridCellWidth * x,
            image.dstRect.top + gridCellHeight * y,
          ))) {
            pointsInside++;
          }
        }
      }

      // times 0.8 because the grid is not perfectly accurate
      final int minPointsInside = (gridSize * gridSize * minPercentInside * 0.8).floor();
      if (pointsInside >= minPointsInside) {
        selectResult.images.add(image);
      }
    }
  }
}

class SelectResult {
  int pageIndex;
  final List<Stroke> strokes;
  final List<EditorImage> images;
  Path path;

  SelectResult({
    required this.pageIndex,
    required this.strokes,
    required this.images,
    required this.path,
  });
}
