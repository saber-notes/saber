import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/data/extensions/color_extensions.dart';
import 'package:sbn/canvas_background_pattern.dart';

class CanvasBackgroundPainter extends CustomPainter {
  const CanvasBackgroundPainter({
    required this.invert,
    required this.backgroundColor,
    this.backgroundPattern = .none,
    required this.lineHeight,
    required this.lineThickness,
    this.lineColor,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.red,
    this.preview = false,
    this.intensity = 0.0,
    this.textureImage,
    this.textureOpacity = 0.1,
    this.textureBlendMode = BlendMode.multiply,
    this.backgroundGradient,
    this.vignetteIntensity = 0.0,
    this.grainIntensity = 0.0,
  });

  final bool invert;
  final Color backgroundColor;
  final double intensity;

  /// The pattern to use for the background. See [CanvasBackgroundPatterns].
  final CanvasBackgroundPattern backgroundPattern;

  /// The height between each line in the background pattern
  final int lineHeight;
  final int lineThickness;
  final Color? lineColor;
  final Color primaryColor, secondaryColor;

  /// Whether to draw the background pattern in a preview mode (more opaque).
  final bool preview;

  final ui.Image? textureImage;
  final double textureOpacity;
  final BlendMode textureBlendMode;

  final List<Color>? backgroundGradient;
  final double vignetteIntensity;
  final double grainIntensity;

  @override
  void paint(Canvas canvas, Size size) {
    final canvasRect = Offset.zero & size;
    final paint = Paint();

    paint.color = backgroundColor.withInversion(invert);
    
    if (backgroundGradient != null && backgroundGradient!.isNotEmpty) {
      final gradient = RadialGradient(
        colors: backgroundGradient!.map((c) => c.withInversion(invert)).toList(),
        center: Alignment.center,
        radius: 1.2,
      ).createShader(canvasRect);
      paint.shader = gradient;
    }
    
    canvas.drawRect(canvasRect, paint);
    paint.shader = null; // Reset shader for subsequent operations

    if (textureImage != null) {
      final imageRect = Offset.zero & size;
      final texturePaint = Paint()
        ..color = Colors.white.withValues(alpha: textureOpacity)
        ..blendMode = textureBlendMode;
      // Note: canvas.drawImage needs an ui.Image, not a Rect. 
      // If we want to draw the image covering the rect, we should use drawImageRect.
      canvas.drawImageRect(
        textureImage!,
        Rect.fromLTWH(0, 0, textureImage!.width.toDouble(), textureImage!.height.toDouble()),
        imageRect,
        texturePaint,
      );
    }

    // 2. Dynamic Vignette
    if (vignetteIntensity > 0) {
      final vignettePaint = Paint()
        ..shader = RadialGradient(
          colors: [
            Colors.transparent,
            Colors.black.withValues(alpha: vignetteIntensity * 0.5),
            Colors.black.withValues(alpha: vignetteIntensity),
          ],
          stops: const [0.6, 0.85, 1.0],
        ).createShader(canvasRect)
        ..blendMode = BlendMode.multiply;
      canvas.drawRect(canvasRect, vignettePaint);
    }

    // 3. Ritual Grain (Custom implementation)
    if (grainIntensity > 0) {
      final grainPaint = Paint()
        ..color = Colors.white.withValues(alpha: grainIntensity * 0.1)
        ..style = PaintingStyle.fill;
      
      final random = Random(42);
      for (int i = 0; i < 2000; i++) {
        final x = random.nextDouble() * size.width;
        final y = random.nextDouble() * size.height;
        final dotSize = random.nextDouble() * 1.2;
        
        final dotColor = random.nextBool() 
          ? Colors.black.withValues(alpha: grainIntensity) 
          : Colors.white.withValues(alpha: grainIntensity);
        
        canvas.drawCircle(Offset(x, y), dotSize, grainPaint..color = dotColor);
      }
    }

    paint.strokeWidth = lineThickness.toDouble();

    if (backgroundPattern.requiresClipping) {
      canvas.save();
      canvas.clipRect(canvasRect);
    }

    for (final element in getPatternElements(
      pattern: backgroundPattern,
      size: size,
      lineHeight: lineHeight,
    )) {
      if (element.secondaryColor) {
        paint.color = (lineColor ?? secondaryColor).withValues(alpha: (preview ? 0.5 : 0.2) + (intensity * 0.3));
      } else {
        paint.color = (lineColor ?? primaryColor).withValues(alpha: (preview ? 0.5 : 0.2) + (intensity * 0.3));
      }
      
      if (intensity > 0.5) {
        paint.maskFilter = MaskFilter.blur(BlurStyle.normal, (intensity - 0.5) * 4.0); // Line glow at high intensity
      }

      if (element.isLine) {
        canvas.drawLine(element.start, element.end, paint);
      } else {
        canvas.drawCircle(element.start, paint.strokeWidth * 4 / 3, paint);
      }
    }

    if (backgroundPattern.requiresClipping) {
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(CanvasBackgroundPainter oldDelegate) =>
      kDebugMode ||
      oldDelegate.invert != invert ||
      oldDelegate.backgroundColor != backgroundColor ||
      oldDelegate.backgroundPattern != backgroundPattern ||
      oldDelegate.lineHeight != lineHeight ||
      oldDelegate.lineColor != lineColor ||
      oldDelegate.primaryColor != primaryColor ||
      oldDelegate.secondaryColor != secondaryColor ||
      oldDelegate.intensity != intensity ||
      oldDelegate.textureImage != textureImage ||
      oldDelegate.textureOpacity != textureOpacity ||
      oldDelegate.textureBlendMode != textureBlendMode;

  static Iterable<PatternElement> getPatternElements({
    required CanvasBackgroundPattern pattern,
    required Size size,
    required int lineHeight,
  }) sync* {
    switch (pattern) {
      case .none:
        return;
      case .collegeLtr:
      case .collegeRtl:
      case .lined:
        // horizontal lines
        for (double y = lineHeight * 2; y < size.height; y += lineHeight) {
          yield PatternElement(
            Offset(0, y),
            Offset(size.width, y),
            isLine: true,
          );
        }

        // vertical line
        if (pattern == .collegeLtr) {
          yield PatternElement(
            Offset(lineHeight * 2, 0),
            Offset(lineHeight * 2, size.height),
            isLine: true,
            secondaryColor: true,
          );
        } else if (pattern == .collegeRtl) {
          yield PatternElement(
            Offset(size.width - lineHeight * 2, 0),
            Offset(size.width - lineHeight * 2, size.height),
            isLine: true,
            secondaryColor: true,
          );
        }
      case .grid:
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
      case .dots:
        for (double y = lineHeight * 2; y <= size.height; y += lineHeight) {
          for (double x = 0; x <= size.width; x += lineHeight) {
            yield PatternElement(Offset(x, y), Offset(x, y), isLine: false);
          }
        }
      case .staffs:
      case .tablature:
        final staffSpaces = pattern == .staffs ? 4 : 5;
        final staffHeight = lineHeight * staffSpaces;
        final staffSpacing = lineHeight * 3;

        for (
          double topOfStaff = staffSpacing.toDouble() - lineHeight;
          topOfStaff + staffHeight < size.height;
          topOfStaff += staffHeight + staffSpacing
        ) {
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
      case .cornell:
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

  PatternElement(
    this.start,
    this.end, {
    this.isLine = true,
    this.secondaryColor = false,
  });
}
