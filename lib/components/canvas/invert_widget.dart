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
  // dart format off
  static const _invertMatrix = <double>[
    1 - 2 * lumaR,   - 2 * lumaG,   - 2 * lumaB, 0, 255,
      - 2 * lumaR, 1 - 2 * lumaG,   - 2 * lumaB, 0, 255,
      - 2 * lumaR,   - 2 * lumaG, 1 - 2 * lumaB, 0, 255,
                0,             0,             0, 1,   0,
  ];
  // dart format on

  // Rec. 709 luma coefficients:
  // https://en.wikipedia.org/wiki/Luma_%28video%29
  static const lumaR = 0.2126;
  static const lumaG = 0.7152;
  static const lumaB = 0.0722;
}
