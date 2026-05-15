/// 🤖 Generated with Claude Code
library;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saber/components/toolbar/size_picker.dart';
import 'package:saber/data/extensions/axis_extensions.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

class EraserModal extends StatefulWidget {
  const EraserModal({super.key});

  @override
  State<EraserModal> createState() => _EraserModalState();
}

class _EraserModalState extends State<EraserModal> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final axis = stows.editorToolbarAlignment.value.axis.opposite;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Flex(
          direction: axis,
          mainAxisSize: MainAxisSize.min,
          children: [
            _EraserSizeSlider(axis: axis),
            const SizedBox(width: 8),
            ValueListenableBuilder(
              valueListenable: stows.partialEraser,
              builder: (context, value, child) {
                return IconButton(
                  onPressed: () {
                    stows.partialEraser.value = !value;
                  },
                  tooltip: t.editor.eraserOptions.partialEraser,
                  icon: Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: .circle,
                      color: value
                          ? colorScheme.secondary.withValues(alpha: 0.2)
                          : Colors.transparent,
                      border: Border.all(
                        color: value
                            ? colorScheme.secondary
                            : colorScheme.onSurface.withValues(alpha: 0.5),
                        width: 2,
                      ),
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.eraser,
                      size: 14,
                      color: value
                          ? colorScheme.secondary
                          : colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _EraserSizeSlider extends StatelessWidget {
  const _EraserSizeSlider({required this.axis});

  final Axis axis;

  static const double sizeMin = 5;
  static const double sizeMax = 50;
  static const double sizeStep = 1;

  void onDrag(double percent) {
    percent = percent.clamp(0.0, 1.0);
    final stepsFromMin = (percent * (sizeMax - sizeMin) / sizeStep).round();
    final newSize = sizeMin + stepsFromMin * sizeStep;
    if (newSize == stows.eraserSize.value) return;
    stows.eraserSize.value = newSize;
  }

  void setState(void Function() fn) => fn();

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return ValueListenableBuilder(
      valueListenable: stows.eraserSize,
      builder: (context, size, child) {
        return GestureDetector(
          onHorizontalDragStart: axis == Axis.horizontal
              ? (details) =>
                    onDrag(details.localPosition.dx / SizePicker.largeLength)
              : null,
          onHorizontalDragUpdate: axis == Axis.horizontal
              ? (details) =>
                    onDrag(details.localPosition.dx / SizePicker.largeLength)
              : null,
          onVerticalDragStart: axis == Axis.vertical
              ? (details) =>
                    onDrag(details.localPosition.dy / SizePicker.largeLength)
              : null,
          onVerticalDragUpdate: axis == Axis.vertical
              ? (details) =>
                    onDrag(details.localPosition.dy / SizePicker.largeLength)
              : null,
          child: RotatedBox(
            quarterTurns: axis == Axis.horizontal ? 0 : 1,
            child: CustomPaint(
              size: const Size(SizePicker.largeLength, SizePicker.smallLength),
              painter: _SizeSliderPainter(
                axis: axis,
                minSize: sizeMin,
                maxSize: sizeMax,
                currentSize: size,
                trackColor: colorScheme.onSurface.withValues(alpha: 0.2),
                thumbColor: colorScheme.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SizeSliderPainter extends CustomPainter {
  _SizeSliderPainter({
    required this.axis,
    required this.minSize,
    required this.maxSize,
    required this.currentSize,
    required this.trackColor,
    required this.thumbColor,
  });

  final Axis axis;
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
        ..style = .fill,
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
        ..style = .fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! _SizeSliderPainter ||
        oldDelegate.axis != axis ||
        oldDelegate.minSize != minSize ||
        oldDelegate.maxSize != maxSize ||
        oldDelegate.currentSize != currentSize ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.thumbColor != thumbColor;
  }
}