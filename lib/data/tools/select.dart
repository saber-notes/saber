import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/data/tools/_tool.dart';

class Select extends Tool {
  Select._();

  static final _currentSelect = Select._();
  static Select get currentSelect => _currentSelect;

  /// The minimum ratio of points inside a stroke or image
  /// for it to be selected.
  static const minPercentInside = 0.7;

  var selectResult = SelectResult(
    pageIndex: -1,
    strokes: const [],
    images: const [],
    path: Path(),
  );
  var doneSelecting = false;

  @override
  ToolId get toolId => .select;

  void unselect() {
    doneSelecting = false;
    selectResult.pageIndex = -1;
  }

  Color? getDominantStrokeColor() {
    if (!doneSelecting) return null;
    if (selectResult.strokes.isEmpty) return null;

    final colorDistribution = <Color, int>{};
    for (final stroke in selectResult.strokes) {
      colorDistribution.update(
        stroke.color,
        (value) => value + stroke.length,
        ifAbsent: () => stroke.length,
      );
    }
    assert(colorDistribution.isNotEmpty);

    return colorDistribution.entries.reduce((a, b) {
      return a.value > b.value ? a : b;
    }).key;
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
      final stroke = strokes[i];
      final percentInside = polygonPercentInside(
        selectResult.path,
        stroke.lowQualityPolygon,
      );
      if (percentInside > minPercentInside) {
        selectResult.strokes.add(stroke);
      }
    }

    for (int i = 0; i < images.length; i++) {
      final image = images[i];
      final percentInside = rectPercentInside(selectResult.path, image.dstRect);
      if (percentInside >= minPercentInside) {
        selectResult.images.add(image);
      }
    }
  }

  static double rectPercentInside(Path selection, Rect rect) {
    const int gridSize = 5;
    final gridCellWidth = rect.width / (gridSize - 1);
    final gridCellHeight = rect.height / (gridSize - 1);

    int pointsInside = 0;
    for (int x = 0; x < gridSize; x++) {
      for (int y = 0; y < gridSize; y++) {
        if (selection.contains(
          Offset(rect.left + gridCellWidth * x, rect.top + gridCellHeight * y),
        )) {
          pointsInside++;
        }
      }
    }

    // times 1.25 because the grid is not very accurate
    return pointsInside / (gridSize * gridSize) * 1.25;
  }

  static double polygonPercentInside(Path selection, List<Offset> polygon) {
    int pointsInside = 0;
    for (final point in polygon) {
      if (selection.contains(point)) {
        pointsInside++;
      }
    }
    return pointsInside / polygon.length;
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

  bool get isEmpty {
    return strokes.isEmpty && images.isEmpty;
  }

  SelectResult copyWith({
    int? pageIndex,
    List<Stroke>? strokes,
    List<EditorImage>? images,
    Path? path,
  }) {
    return SelectResult(
      pageIndex: pageIndex ?? this.pageIndex,
      strokes: strokes ?? this.strokes,
      images: images ?? this.images,
      path: path ?? this.path,
    );
  }
}
