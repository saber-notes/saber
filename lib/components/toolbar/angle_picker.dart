import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/data/tools/calligraphy_pen.dart';
import 'package:saber/i18n/strings.g.dart';

class AnglePicker extends StatefulWidget {
  const new({super.key, required this.axis, required this.pen});

  final Axis axis;
  final CalligraphyPen pen;

  @override
  State<AnglePicker> createState() => _AnglePickerState();

  static const double smallLength = 25;
  static const double largeLength = 120;
}

class _AnglePickerState extends State<AnglePicker> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return Flex(
      direction: widget.axis,
      mainAxisSize: .min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              t.editor.penOptions.angle,
              style: TextStyle(
                color: colorScheme.onSurface.withValues(alpha: 0.8),
                fontSize: 10,
                height: 1,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${widget.pen.angleInDegrees.round()}°'),
                const SizedBox(width: 4),
                // Visual chisel nib orientation preview
                Transform.rotate(
                  angle: -widget.pen.angle,
                  child: Container(
                    width: 14,
                    height: 3,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const .symmetric(vertical: 8),
          child: _AngleSlider(
            pen: widget.pen,
            axis: widget.axis,
            setState: setState,
          ),
        ),
      ],
    );
  }
}

class _AngleSlider extends StatelessWidget {
  const new({required this.pen, required this.axis, required this.setState});

  final CalligraphyPen pen;
  final Axis axis;
  final void Function(void Function()) setState;

  void onDrag(double percent) {
    percent = clampDouble(percent, 0, 1);
    // Range 0 to 180 degrees in 1-degree steps (or 5-degree increments when near common angles like 30, 45, 60)
    var newDegrees = (percent * 180).roundToDouble();
    // Snap to 0, 30, 45, 60, 90, 135, 180 if within 2 degrees
    const snapAngles = [0.0, 30.0, 45.0, 60.0, 90.0, 135.0, 180.0];
    for (final snap in snapAngles) {
      if ((newDegrees - snap).abs() <= 2.5) {
        newDegrees = snap;
        break;
      }
    }

    if (newDegrees == pen.angleInDegrees) return;
    setState(() {
      pen.angleInDegrees = newDegrees;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return GestureDetector(
      onHorizontalDragStart: axis == Axis.horizontal
          ? (details) =>
                onDrag(details.localPosition.dx / AnglePicker.largeLength)
          : null,
      onHorizontalDragUpdate: axis == Axis.horizontal
          ? (details) =>
                onDrag(details.localPosition.dx / AnglePicker.largeLength)
          : null,
      onVerticalDragStart: axis == Axis.vertical
          ? (details) =>
                onDrag(details.localPosition.dy / AnglePicker.largeLength)
          : null,
      onVerticalDragUpdate: axis == Axis.vertical
          ? (details) =>
                onDrag(details.localPosition.dy / AnglePicker.largeLength)
          : null,
      child: RotatedBox(
        quarterTurns: axis == Axis.horizontal ? 0 : 1,
        child: CustomPaint(
          size: const Size(AnglePicker.largeLength, AnglePicker.smallLength),
          painter: _AngleSliderPainter(
            axis: axis,
            currentAngle: pen.angleInDegrees,
            trackColor: colorScheme.onSurface.withValues(alpha: 0.2),
            thumbColor: colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class _AngleSliderPainter extends CustomPainter {
  new({
    required this.axis,
    required this.currentAngle,
    required this.trackColor,
    required this.thumbColor,
  });

  final Axis axis;
  final double currentAngle; // 0 to 180
  final Color trackColor;
  final Color thumbColor;

  @override
  void paint(Canvas canvas, Size size) {
    const trackHeight = 4.0;
    final trackRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, (size.height - trackHeight) / 2, size.width, trackHeight),
      const Radius.circular(trackHeight / 2),
    );

    // Draw track
    canvas.drawRRect(trackRect, Paint()..color = trackColor);

    // Draw ticks at 0°, 45°, 90°, 135°, 180°
    final tickPaint = Paint()
      ..color = trackColor.withValues(alpha: 0.5)
      ..strokeWidth = 1.5;
    for (final angle in const [0.0, 45.0, 90.0, 135.0, 180.0]) {
      final x = (angle / 180.0) * (size.width - 16) + 8;
      canvas.drawLine(
        Offset(x, (size.height - 10) / 2),
        Offset(x, (size.height + 10) / 2),
        tickPaint,
      );
    }

    // Thumb position
    final ratio = clampDouble(currentAngle / 180.0, 0, 1);
    final thumbX = ratio * (size.width - 16) + 8;
    final thumbY = size.height / 2;

    // Draw thumb
    canvas.drawCircle(
      Offset(thumbX, thumbY),
      8,
      Paint()
        ..color = thumbColor
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! _AngleSliderPainter ||
        oldDelegate.axis != axis ||
        oldDelegate.currentAngle != currentAngle ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.thumbColor != thumbColor;
  }
}
