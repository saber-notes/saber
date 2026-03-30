import 'dart:math';
import 'package:saber/components/canvas/_stroke.dart';

class ScribbleRecognizer {
  /// Minimum consecutive sharp turn reversals to be considered a scribble.
  static const int requiredReversals = 4;

  /// The maximum size a scribble is allowed to be before it's considered "just drawing fast art".
  static const double maxBoundingBoxDimension = 200.0;

  /// Returns true if the drawn path exhibits distinct scribble behavior (rapid densely-packed axis reversals)
  static bool isEraseScribble(Stroke stroke) {
    final points = stroke.points;
    if (points.length < 15) return false; 

    int xReversals = 0;
    int yReversals = 0;
    
    double minX = double.infinity, maxX = double.negativeInfinity;
    double minY = double.infinity, maxY = double.negativeInfinity;

    double? lastDx;
    double? lastDy;

    for (int i = 1; i < points.length; i++) {
        final p1 = points[i - 1];
        final p2 = points[i];
        
        final dx = p2.dx - p1.dx;
        final dy = p2.dy - p1.dy;
        
        minX = min(minX, p2.dx);
        maxX = max(maxX, p2.dx);
        minY = min(minY, p2.dy);
        maxY = max(maxY, p2.dy);

        if (dx.abs() > 3.0) {
            if (lastDx != null && (dx.sign != lastDx.sign)) {
                xReversals++;
            }
            lastDx = dx;
        }

        if (dy.abs() > 3.0) {
            if (lastDy != null && (dy.sign != lastDy.sign)) {
                yReversals++;
            }
            lastDy = dy;
        }
    }

    final width = maxX - minX;
    final height = maxY - minY;

    if (width > maxBoundingBoxDimension || height > maxBoundingBoxDimension) {
        return false; // Spread too wide, likely just jagged text or art.
    }

    if (xReversals >= requiredReversals || yReversals >= requiredReversals) {
        return true;
    }

    return false;
  }
}
