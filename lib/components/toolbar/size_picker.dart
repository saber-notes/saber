import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/toolbar/toolbar_button.dart';
import 'package:saber/data/tools/pen.dart';
import 'package:saber/i18n/strings.g.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({
    super.key,
    required this.pen,
    required this.toolbarSize,
  });

  final Pen pen;
  final ToolbarSize toolbarSize;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

/// Returns a string representation of [num] that:
/// - Has no decimal point if [num] is an integer
/// - Has one decimal point if [num] has a non-zero fractional part
String _prettyNum(double num) {
  final rounded = num.round();
  if (num == rounded) return rounded.toString();
  return num.toStringAsFixed(1);
}

class _SizePickerState extends State<SizePicker> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            Text(
              t.editor.penOptions.size,
              style: TextStyle(
                color: colorScheme.onSurface.withOpacity(0.8),
                fontSize: widget.toolbarSize.sizePickerFontSize,
                height: 1,
              ),
            ),
            Text(_prettyNum(widget.pen.options.size)),
          ],
        ),
        SizedBox(width: widget.toolbarSize.padding),
        Padding(
          padding: EdgeInsets.symmetric(vertical: widget.toolbarSize.padding),
          child: _SizeSlider(
            pen: widget.pen,
            setState: setState,
            toolbarSize: widget.toolbarSize,
          ),
        ),
      ],
    );
  }
}

class _SizeSlider extends StatelessWidget {
  const _SizeSlider({
    // ignore: unused_element
    super.key,
    required this.pen,
    required this.setState,
    required this.toolbarSize,
  });

  final Pen pen;
  final ToolbarSize toolbarSize;
  final void Function(void Function()) setState;

  void onDrag(double localDx) {
    final relX = clampDouble(localDx / toolbarSize.sizePickerSize.width, 0, 1);
    final stepsFromMin = (relX * pen.sizeStepsBetweenMinAndMax).round();
    final newSize = pen.sizeMin + stepsFromMin * pen.sizeStep;
    if (newSize == pen.options.size) return;
    setState(() {
      pen.options.size = newSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onHorizontalDragStart: (details) => onDrag(details.localPosition.dx),
      onHorizontalDragUpdate: (details) => onDrag(details.localPosition.dx),
      child: CustomPaint(
        size: toolbarSize.sizePickerSize,
        painter: _SizeSliderPainter(
          minSize: pen.sizeMin,
          maxSize: pen.sizeMax,
          currentSize: pen.options.size,
          trackColor: colorScheme.onBackground.withOpacity(0.2),
          thumbColor: colorScheme.primary,
        ),
      ),
    );
  }
}

class _SizeSliderPainter extends CustomPainter {
  _SizeSliderPainter({
    required this.minSize,
    required this.maxSize,
    required this.currentSize,
    required this.trackColor,
    required this.thumbColor,
  });

  final double minSize;
  final double maxSize;
  final double currentSize;
  final Color trackColor;
  final Color thumbColor;

  @override
  void paint(Canvas canvas, Size size) {
    /// The smallest height the track can be
    final leftHeight = size.height * minSize / maxSize;
    final topLeft = Offset(0, (size.height - leftHeight) / 2);
    final bottomLeft = Offset(0, topLeft.dy + leftHeight);
    final topRight = Offset(size.width, 0);
    final bottomRight = Offset(size.width, size.height);

    // track
    canvas.drawPath(
      Path()
        ..moveTo(topLeft.dx, topLeft.dy)
        ..lineTo(bottomLeft.dx, bottomLeft.dy)
        ..lineTo(bottomRight.dx, bottomRight.dy)
        ..lineTo(topRight.dx, topRight.dy)
        ..close(),
      Paint()
        ..color = trackColor
        ..style = PaintingStyle.fill,
    );

    // thumb
    final ratio = (currentSize - minSize) / (maxSize - minSize);
    final thumbHeight = size.height * ratio;
    final thumbRight = size.width * ratio;
    final thumbTop = (size.height - thumbHeight) / 2;
    canvas.drawPath(
      Path()
        ..moveTo(topLeft.dx, topLeft.dy)
        ..lineTo(bottomLeft.dx, bottomLeft.dy)
        ..lineTo(thumbRight, thumbTop + thumbHeight)
        ..lineTo(thumbRight, thumbTop)
        ..close(),
      Paint()
        ..color = thumbColor
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! _SizeSliderPainter ||
        oldDelegate.minSize != minSize ||
        oldDelegate.maxSize != maxSize ||
        oldDelegate.currentSize != currentSize ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.thumbColor != thumbColor;
  }
}
