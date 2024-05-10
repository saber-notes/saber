import 'package:flutter/material.dart';

class RowCol extends StatelessWidget {
  const RowCol({
    super.key,
    required this.axis,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.children,
  });

  final Axis axis;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return axis == Axis.horizontal
        ? Row(
            mainAxisSize: mainAxisSize,
            mainAxisAlignment: mainAxisAlignment,
            children: children,
          )
        : Column(
            mainAxisSize: mainAxisSize,
            mainAxisAlignment: mainAxisAlignment,
            children: children,
          );
  }
}
