
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/i18n/strings.g.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({
    super.key,
    required this.currentTool,
  });

  final double max = 25;
  final Pen currentTool;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {

  final TextEditingController _controller = TextEditingController();

  Offset? startingOffset;
  double startingValue = 0;

  @override
  void initState() {
    super.initState();
    updateValue();
    _controller.addListener(() {
      updateValue(
        newValue: double.tryParse(_controller.text),
        manuallyTypedIn: true,
      );
    });
  }

  Timer? updateTextFieldTimer;
  void updateValue({double? newValue, bool manuallyTypedIn = false}) {
    if (newValue != null) {
      setState(() {
        widget.currentTool.strokeProperties.size = newValue.clamp(1, widget.max).roundToDouble();
      });
    }

    String valueString = widget.currentTool.strokeProperties.size.round().toString();
    updateTextFieldTimer?.cancel();
    if (manuallyTypedIn) {
      updateTextFieldTimer = Timer(const Duration(milliseconds: 3000), () {
        _controller.text = valueString;
      });
    } else if (_controller.text != valueString) {
      _controller.text = valueString;
    }
  }

  void onDrag(Offset currentOffset) {
    if (startingOffset == null) return;

    final double delta = (currentOffset.dx - startingOffset!.dx) / widget.max * 4;
    final double newValue = startingValue + delta;
    setState(() {
      updateValue(newValue: newValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return MouseRegion(
      cursor: SystemMouseCursors.resizeLeftRight,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(t.editor.penOptions.size),
              Container(
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
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: widget.max * 2),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
