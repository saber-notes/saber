
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/data/extensions/color_extensions.dart';
import 'package:saber/i18n/strings.g.dart';

class CanvasBackgroundPainter extends CustomPainter {
  const CanvasBackgroundPainter({
    required this.invert,
    required this.backgroundColor,
    this.backgroundPattern = CanvasBackgroundPatterns.none,
    required this.lineHeight,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.red,
    this.preview = false,
  });

  final bool invert;
  final Color backgroundColor;
  /// The pattern to use for the background. See [CanvasBackgroundPatterns].
  final String backgroundPattern;
  /// The height between each line in the background pattern
  final int lineHeight;
  final Color primaryColor, secondaryColor;
  /// Whether to draw the background pattern in a preview mode (more opaque).
  final bool preview;

  @override
  void paint(Canvas canvas, Size size) {
    Rect canvasRect = Offset.zero & size;
    Paint paint = Paint();

    paint.color = backgroundColor.withInversion(invert);
    canvas.drawRect(canvasRect, paint);

    paint.strokeWidth = 3;
    for (PatternElement element in getPatternElements(backgroundPattern, size, lineHeight)) {
      if (element.secondaryColor) {
        paint.color = secondaryColor.withOpacity(preview ? 0.5 : 0.2);
      } else {
        paint.color = primaryColor.withOpacity(preview ? 0.5 : 0.2);
      }

      if (element.isLine) {
        canvas.drawLine(element.start, element.end, paint);
      } else {
        canvas.drawCircle(element.start, 4, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CanvasBackgroundPainter oldDelegate) => kDebugMode
        || oldDelegate.invert != invert
        || oldDelegate.backgroundColor != backgroundColor
        || oldDelegate.backgroundPattern != backgroundPattern
        || oldDelegate.lineHeight != lineHeight
        || oldDelegate.primaryColor != primaryColor
        || oldDelegate.secondaryColor != secondaryColor;

  static Iterable<PatternElement> getPatternElements(String pattern, Size size, int lineHeight) sync* {
    switch (pattern) {
      case CanvasBackgroundPatterns.none:
        return;
      case CanvasBackgroundPatterns.college:
      case CanvasBackgroundPatterns.lined:
        // horizontal lines
        for (double y = lineHeight * 2; y < size.height; y += lineHeight) {
          yield PatternElement(
            Offset(0, y),
            Offset(size.width, y),
            isLine: true,
          );
        }
        if (pattern == CanvasBackgroundPatterns.college) {
          // vertical line
          yield PatternElement(
            Offset(lineHeight * 2, 0),
            Offset(lineHeight * 2, size.height),
            isLine: true,
            secondaryColor: true,
          );
        }
        break;
      case CanvasBackgroundPatterns.grid:
        for (double y = lineHeight * 2; y < size.height; y += lineHeight) {
          yield PatternElement(
            Offset(0, y),
            Offset(size.width, y),
            isLine: true,
          );
        }
        for (double x = 0; x < size.width; x += lineHeight) {
          yield PatternElement(
            Offset(x, lineHeight * 2),
            Offset(x, size.height),
            isLine: true,
          );
        }
        break;
      case CanvasBackgroundPatterns.dots:
        for (double y = lineHeight * 2; y <= size.height; y += lineHeight) {
          for (double x = 0; x <= size.width; x += lineHeight) {
            yield PatternElement(
              Offset(x, y),
              Offset(x, y),
              isLine: false,
            );
          }
        }
        break;
      case CanvasBackgroundPatterns.staffs:
        for (double topOfStaff = lineHeight * 2;
             topOfStaff + lineHeight * 5 < size.height;
             topOfStaff += lineHeight * 7) {
          for (int line = 0; line < 5; line++) {
            yield PatternElement(
              Offset(lineHeight.toDouble(), topOfStaff + lineHeight * line),
              Offset(size.width - lineHeight, topOfStaff + lineHeight * line),
              isLine: true,
            );
          }
        }
        break;
      case CanvasBackgroundPatterns.cornell:
        // half-width line for name field
        yield PatternElement(
          Offset(lineHeight.toDouble(), lineHeight * 2),
          Offset(size.width / 2 - lineHeight / 2, lineHeight * 2),
          isLine: true,
        );
        // half-width line for date field
        yield PatternElement(
          Offset(size.width / 2 + lineHeight / 2, lineHeight * 2),
          Offset(size.width - lineHeight, lineHeight * 2),
          isLine: true,
        );
        // full-width line for title field
        yield PatternElement(
          Offset(lineHeight.toDouble(), lineHeight * 3),
          Offset(size.width - lineHeight, lineHeight * 3),
          isLine: true,
        );

        // lines for main notes
        final left = size.width * 0.35; // 35% width reserved for cues column
        final bottom = size.height * 0.7; // 30% height reserved for summary
        for (double y = lineHeight * 5; y < bottom; y += lineHeight) {
          yield PatternElement(
            Offset(left, y),
            Offset(size.width - lineHeight, y),
            isLine: true,
          );
        }
        break;
    }
  }

}

class PatternElement {
  final Offset start, end;
  /// Whether this is a line or a dot
  final bool isLine;
  /// Whether this should use a secondary color
  final bool secondaryColor;

  PatternElement(this.start, this.end, {this.isLine = true, this.secondaryColor = false});
}

abstract class CanvasBackgroundPatterns {
  /// No background pattern
  static const String none = '';

  /// College ruled paper: horizontal lines with one
  /// vertical line along the left margin
  static const String college = 'college';

  /// Horizontal lines. This is the same as college ruled paper
  /// but without the vertical line
  static const String lined = 'lined';

  /// A grid of squares
  static const String grid = 'grid';

  /// A grid of dots. This is the same as "grid" except it has dots on the
  /// corners instead of the whole square border.
  static const String dots = 'dots';

  /// Music staffs
  static const String staffs = 'staffs';

  // Cornell notes
  static const String cornell = 'cornell';

  static const List<String> all = [
    none,
    college,
    lined,
    grid,
    dots,
    staffs,
    cornell,
  ];

  static String localizedName(String pattern) {
    switch (pattern) {
      case CanvasBackgroundPatterns.none:
        return t.editor.menu.bgPatterns.none;
      case CanvasBackgroundPatterns.college:
        return t.editor.menu.bgPatterns.college;
      case CanvasBackgroundPatterns.lined:
        return t.editor.menu.bgPatterns.lined;
      case CanvasBackgroundPatterns.grid:
        return t.editor.menu.bgPatterns.grid;
      case CanvasBackgroundPatterns.dots:
        return t.editor.menu.bgPatterns.dots;
      case CanvasBackgroundPatterns.staffs:
        return t.editor.menu.bgPatterns.staffs;
      case CanvasBackgroundPatterns.cornell:
        return t.editor.menu.bgPatterns.cornell;
    }
    if (kDebugMode) throw Exception('Untranslated background pattern: $pattern');
    return '';
  }
}
