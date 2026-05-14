/// 🤖 Generated partially with Claude Code; Google Antigravity
library;

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

  /// Whether the user is currently dragging the rotation handle.
  var isRotating = false;

  /// The center of the selection when rotation started.
  Offset? rotateCenter;

  /// The initial angle from center to the touch point when rotation started.
  double? initialTouchAngle;

  /// The initial selection angle when rotation started.
  double? initialSelectionAngle;

  /// Whether the user is currently dragging a resize handle.
  var isResizing = false;

  /// Which resize handle is being dragged.
  ResizeHandle? activeResizeHandle;

  /// The bounds of the selection when resizing started.
  Rect? initialResizeBounds;

  /// The anchor (opposite corner) to scale from.
  Offset? resizeAnchor;

  /// Cumulative scale applied so far in the current resize gesture.
  double resizeScalePrevX = 1.0;
  double resizeScalePrevY = 1.0;

  /// Whether the user is currently dragging a straight line endpoint.
  var isEditingEndpoint = false;

  /// The stroke whose endpoint is being edited.
  Stroke? activeEndpointStroke;

  /// Which endpoint is being edited (0 = start, 1 = end).
  int activeEndpointIndex = 0;

  /// The minimum ratio of points inside a stroke or image
  /// for it to be selected.
  static const minPercentInside = 0.7;

  void unselect() {
    doneSelecting = false;
    isRotating = false;
    isResizing = false;
    activeResizeHandle = null;
    initialResizeBounds = null;
    resizeAnchor = null;
    resizeScalePrevX = 1.0;
    resizeScalePrevY = 1.0;
    isEditingEndpoint = false;
    activeEndpointStroke = null;
    activeEndpointIndex = 0;
    selectResult = SelectResult(
      pageIndex: -1,
      strokes: const [],
      images: const [],
      path: Path(),
    );
  }

  Color? getDominantStrokeColor() {
    return null;
  }

  // Kept from PR-1085: implementation initialises pageIndexStart so that
  // cross-page moves can track the origin page of a selection.
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

  void onDragUpdate(Offset position);

  /// Adds the indices of any [strokes] that are inside the selection area
  /// to [selectResult.indices].
  // Kept from PR-1085: full implementation including cross-page helpers.
  void onDragEnd(List<Stroke> strokes, List<EditorImage> images) {
    selectResult.path.close();
    doneSelecting = true;

    for (int i = 0; i < strokes.length; i++) {
      final stroke = strokes[i];
      final percentInside =
      polygonPercentInside(selectResult.path, stroke.lowQualityPolygon);
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
    final double gridCellWidth = rect.width / (gridSize - 1);
    final double gridCellHeight = rect.height / (gridSize - 1);

    int pointsInside = 0;
    for (int x = 0; x < gridSize; x++) {
      for (int y = 0; y < gridSize; y++) {
        if (selection.contains(Offset(
          rect.left + gridCellWidth * x,
          rect.top + gridCellHeight * y,
        ))) {
          pointsInside++;
        }
      }
    }

    // times 1.25 because the grid is not very accurate
    return pointsInside / (gridSize * gridSize) * 1.25;
  }

  static double polygonPercentInside(Path selection, List<Offset> polygon) {
    int pointsInside = 0;
    for (Offset point in polygon) {
      if (selection.contains(point)) {
        pointsInside++;
      }
    }
    return pointsInside / polygon.length;
  }
}