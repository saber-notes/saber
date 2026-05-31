import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saber/data/extensions/axis_extensions.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/eraser.dart';
import 'package:saber/i18n/strings.g.dart';

class EraserModal extends StatefulWidget {
  const EraserModal({super.key, required this.getTool});

  final Eraser Function() getTool;

  @override
  State<EraserModal> createState() => _EraserModalState();
}

class _EraserModalState extends State<EraserModal> {
  @override
  Widget build(BuildContext context) {
    final eraser = widget.getTool();
    final axis = stows.editorToolbarAlignment.value.axis.opposite;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Flex(
        direction: axis,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _EraserSizePicker(
            eraser: eraser,
            axis: axis,
            onDrag: (percent) {
              setState(() {
                percent = percent.clamp(0.0, 1.0);
                final stepsFromMin =
                    (percent * eraser.sizeStepsBetweenMinAndMax).round();
                final newSize = eraser.sizeMin + stepsFromMin * eraser.sizeStep;
                eraser.size = newSize;
              });
            },
          ),
          SizedBox(
            width: axis == Axis.horizontal ? 8 : 0,
            height: axis == Axis.vertical ? 8 : 0,
          ),
          Flex(
            direction: axis,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _EraserModeButton(
                selected: !eraser.areaEraser,
                tooltip: t.editor.eraserOptions.strokeEraser,
                onPressed: () {
                  setState(() {
                    eraser.areaEraser = false;
                  });
                },
                icon: SvgPicture.asset(
                  'assets/images/eraser-stroke.svg',
                  width: 32,
                  height: 32,
                  theme: SvgTheme(
                    currentColor: !eraser.areaEraser
                        ? ColorScheme.of(context).secondary
                        : ColorScheme.of(context).onSurface,
                  ),
                ),
              ),
              SizedBox(
                width: axis == Axis.horizontal ? 8 : 0,
                height: axis == Axis.vertical ? 8 : 0,
              ),
              _EraserModeButton(
                selected: eraser.areaEraser,
                tooltip: t.editor.eraserOptions.areaEraser,
                onPressed: () {
                  setState(() {
                    eraser.areaEraser = true;
                  });
                },
                icon: SvgPicture.asset(
                  'assets/images/eraser-area.svg',
                  width: 32,
                  height: 32,
                  theme: SvgTheme(
                    currentColor: eraser.areaEraser
                        ? ColorScheme.of(context).secondary
                        : ColorScheme.of(context).onSurface,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EraserSizePicker extends StatelessWidget {
  const _EraserSizePicker({
    required this.axis,
    required this.eraser,
    required this.onDrag,
  });

  final Axis axis;
  final Eraser eraser;
  final ValueChanged<double> onDrag;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return Flex(
      direction: axis,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            Text(
              t.editor.penOptions.size,
              style: TextStyle(
                color: colorScheme.onSurface.withValues(alpha: 0.8),
                fontSize: 10,
                height: 1,
              ),
            ),
            Text(eraser.size.round().toString()),
          ],
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: _EraserSizeSlider(axis: axis, eraser: eraser, onDrag: onDrag),
        ),
      ],
    );
  }
}

class _EraserSizeSlider extends StatelessWidget {
  const _EraserSizeSlider({
    required this.axis,
    required this.eraser,
    required this.onDrag,
  });

  final Axis axis;
  final Eraser eraser;
  final ValueChanged<double> onDrag;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return GestureDetector(
      // Map drag gestures to a normalized 0..1 percent value used by the
      // parent. For horizontal layout we use the local dx; for vertical we
      // use local dy. The fixed divisor (150) approximates the slider pixel
      // range used by the CustomPaint size.
      onHorizontalDragStart: axis == Axis.horizontal
          ? (details) => onDrag(details.localPosition.dx / 150)
          : null,
      onHorizontalDragUpdate: axis == Axis.horizontal
          ? (details) => onDrag(details.localPosition.dx / 150)
          : null,
      onVerticalDragStart: axis == Axis.vertical
          ? (details) => onDrag(details.localPosition.dy / 150)
          : null,
      onVerticalDragUpdate: axis == Axis.vertical
          ? (details) => onDrag(details.localPosition.dy / 150)
          : null,
      child: RotatedBox(
        quarterTurns: axis == Axis.horizontal ? 0 : 1,
        child: CustomPaint(
          size: const Size(150, 25),
          painter: _EraserSizeSliderPainter(
            axis: axis,
            minSize: eraser.sizeMin,
            maxSize: eraser.sizeMax,
            currentSize: eraser.size,
            trackColor: colorScheme.onSurface.withValues(alpha: 0.2),
            thumbColor: colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class _EraserModeButton extends StatelessWidget {
  const _EraserModeButton({
    required this.selected,
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final bool selected;
  final Widget icon;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final iconColor = selected ? colorScheme.secondary : colorScheme.onSurface;

    return IconButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: iconColor,
        backgroundColor: selected
            ? colorScheme.secondary.withAlpha((0.1 * 255).round())
            : Colors.transparent,
        shape: const CircleBorder(),
      ),
      tooltip: tooltip,
      icon: icon,
    );
  }
}

class _EraserSizeSliderPainter extends CustomPainter {
  _EraserSizeSliderPainter({
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
    final leftHeight = size.height * minSize / maxSize;
    final topLeft = Offset(0, (size.height - leftHeight) / 2);
    final bottomLeft = Offset(0, topLeft.dy + leftHeight);
    final topRight = Offset(size.width, 0);
    final bottomRight = Offset(size.width, size.height);

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
    return oldDelegate is! _EraserSizeSliderPainter ||
        oldDelegate.axis != axis ||
        oldDelegate.minSize != minSize ||
        oldDelegate.maxSize != maxSize ||
        oldDelegate.currentSize != currentSize ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.thumbColor != thumbColor;
  }
}
