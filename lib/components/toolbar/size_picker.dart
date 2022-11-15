
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/tools/pen.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({
    super.key,
    required this.currentTool,
    this.onSizeChanged,
  });

  final double max = 25;
  final Pen currentTool;
  final VoidCallback? onSizeChanged;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {

  Offset? startingOffset;
  double startingValue = 0;
  void onDrag(Offset currentOffset) {
    if (startingOffset == null) return;

    final double delta = (currentOffset.dx - startingOffset!.dx) / widget.max * 4;
    final double newValue = startingValue + delta;
    setState(() {
      widget.currentTool.strokeProperties.size = newValue.clamp(0, widget.max).roundToDouble();
      widget.onSizeChanged?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onPanStart: (DragStartDetails details) {
        startingOffset = details.globalPosition;
        startingValue = widget.currentTool.strokeProperties.size;
      },
      onPanUpdate: (DragUpdateDetails details) {
        onDrag(details.globalPosition);
      },
      onPanEnd: (DragEndDetails details) {
        startingOffset = null;
      },
      child: Container(
        width: widget.max,
        height: widget.max,
        decoration: BoxDecoration(
          border: Border.all(
            color: colorScheme.onBackground,
            width: 1,
          ),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: Pen.currentPen.strokeProperties.size,
            height: Pen.currentPen.strokeProperties.size,
            decoration: BoxDecoration(
              color: colorScheme.onBackground,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
