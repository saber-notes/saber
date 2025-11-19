import 'package:flutter/material.dart';

class InvertWidget extends StatelessWidget {
  const InvertWidget({super.key, this.invert = true, required this.child});

  final bool invert;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!invert) return child;
    return ColorFiltered(colorFilter: _invertFilter, child: child);
  }

  static const _invertFilter = ColorFilter.matrix(_invertMatrix);
  static const _invertMatrix = <double>[
    1 - 2 * 0.213,
    -2 * 0.715,
    -2 * 0.072,
    0,
    255,
    -2 * 0.213,
    1 - 2 * 0.715,
    -2 * 0.072,
    0,
    255,
    -2 * 0.213,
    -2 * 0.715,
    1 - 2 * 0.072,
    0,
    255,
    0,
    0,
    0,
    1,
    0,
  ];
}
