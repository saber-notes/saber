import 'package:flutter/painting.dart';

class ColorChange {
  final Color previous;
  final Color current;

  const ColorChange({
    required this.previous,
    required this.current,
  });

  ColorChange swap() {
    return ColorChange(previous: current, current: previous);
  }
}
