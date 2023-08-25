
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/data/extensions/color_extensions.dart';
import 'package:saber/i18n/strings.g.dart';

class CanvasBackgroundPainter extends CustomPainter {
  const CanvasBackgroundPainter({
    required this.invert,
    required this.backgroundColor,
    this.backgroundPattern = CanvasBackgroundPattern.none,
    required this.lineHeight,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.red,
    this.preview = false,
  });

  final bool invert;
  final Color backgroundColor;
  /// The pattern to use for the background. See [CanvasBackgroundPatterns].
  final CanvasBackgroundPattern backgroundPattern;
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
    for (PatternElement element in getPatternElements(
      pattern: backgroundPattern,
      size: size,
      lineHeight: lineHeight,
    )) {
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

  static Iterable<PatternElement> getPatternElements({
    required CanvasBackgroundPattern pattern,
    required Size size,
    required int lineHeight,
  }) sync* {
    switch (pattern) {
      case CanvasBackgroundPattern.none:
        return;
      case CanvasBackgroundPattern.collegeLtr:
      case CanvasBackgroundPattern.collegeRtl:
      case CanvasBackgroundPattern.lined:
        // horizontal lines
        for (double y = lineHeight * 2; y < size.height; y += lineHeight) {
          yield PatternElement(
            Offset(0, y),
            Offset(size.width, y),
            isLine: true,
          );
        }

        // vertical line
        if (pattern == CanvasBackgroundPattern.collegeLtr) {
          yield PatternElement(
            Offset(lineHeight * 2, 0),
            Offset(lineHeight * 2, size.height),
            isLine: true,
            secondaryColor: true,
          );
        } else if (pattern == CanvasBackgroundPattern.collegeRtl) {
          yield PatternElement(
            Offset(size.width - lineHeight * 2, 0),
            Offset(size.width - lineHeight * 2, size.height),
            isLine: true,
            secondaryColor: true,
          );
        }
      case CanvasBackgroundPattern.grid:
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
      case CanvasBackgroundPattern.dots:
        for (double y = lineHeight * 2; y <= size.height; y += lineHeight) {
          for (double x = 0; x <= size.width; x += lineHeight) {
            yield PatternElement(
              Offset(x, y),
              Offset(x, y),
              isLine: false,
            );
          }
        }
      case CanvasBackgroundPattern.staffs:
      case CanvasBackgroundPattern.tablature:
        final staffSpaces = pattern == CanvasBackgroundPattern.staffs ? 4 : 5;
        final staffHeight = lineHeight * staffSpaces;
        final staffSpacing = lineHeight * 3;

        for (double topOfStaff = staffSpacing.toDouble() - lineHeight;
             topOfStaff + staffHeight < size.height;
             topOfStaff += staffHeight + staffSpacing) {
          // horizontal lines
          for (int line = 0; line < staffSpaces + 1; line++) {
            yield PatternElement(
              Offset(lineHeight.toDouble(), topOfStaff + lineHeight * line),
              Offset(size.width - lineHeight, topOfStaff + lineHeight * line),
              isLine: true,
            );
          }

          // vertical lines on either side
          yield PatternElement(
            Offset(lineHeight.toDouble(), topOfStaff),
            Offset(lineHeight.toDouble(), topOfStaff + staffHeight),
            isLine: true,
          );
          yield PatternElement(
            Offset(size.width - lineHeight, topOfStaff),
            Offset(size.width - lineHeight, topOfStaff + staffHeight),
            isLine: true,
          );
        }
      case CanvasBackgroundPattern.cornell:
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

enum CanvasBackgroundPattern {
  /// No background pattern
  none(''),

  /// College ruled paper (ltr): horizontal lines with one
  /// vertical line along the left margin
  collegeLtr('college'),
  /// College ruled paper (rtl): horizontal lines with one
  /// vertical line along the right margin
  collegeRtl('college-rtl'),

  /// Horizontal lines. This is the same as college ruled paper
  /// but without the vertical line
  lined('lined'),

  /// A grid of squares
  grid('grid'),

  /// A grid of dots. This is the same as "grid" except it has dots on the
  /// corners instead of the whole square border.
  dots('dots'),

  /// Music staffs
  staffs('staffs'),
  /// Music tablature
  /// 
  /// Like staffs but with 6 lines instead of 5 (and 5 spaces instead of 4).
  tablature('tablature'),

  /// Cornell notes
  cornell('cornell');

  final String name;
  const CanvasBackgroundPattern(this.name);

  static String localizedName(CanvasBackgroundPattern pattern) {
    switch (pattern) {
      case CanvasBackgroundPattern.none:
        return t.editor.menu.bgPatterns.none;
      case CanvasBackgroundPattern.collegeLtr:
        return t.editor.menu.bgPatterns.college;
      case CanvasBackgroundPattern.collegeRtl:
        return t.editor.menu.bgPatterns.collegeRtl;
      case CanvasBackgroundPattern.lined:
        return t.editor.menu.bgPatterns.lined;
      case CanvasBackgroundPattern.grid:
        return t.editor.menu.bgPatterns.grid;
      case CanvasBackgroundPattern.dots:
        return t.editor.menu.bgPatterns.dots;
      case CanvasBackgroundPattern.staffs:
        return t.editor.menu.bgPatterns.staffs;
      case CanvasBackgroundPattern.tablature:
        return t.editor.menu.bgPatterns.tablature;
      case CanvasBackgroundPattern.cornell:
        return t.editor.menu.bgPatterns.cornell;
    }
  }
}
