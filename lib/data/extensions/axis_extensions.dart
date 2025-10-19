import 'package:flutter/material.dart';

extension AxisExtensions on Axis {
  Axis get opposite => switch (this) {
    Axis.horizontal => Axis.vertical,
    Axis.vertical => Axis.horizontal,
  };
}

extension AxisDirectionExtensions on AxisDirection {
  Axis get axis => switch (this) {
    AxisDirection.up || AxisDirection.down => Axis.vertical,
    AxisDirection.left || AxisDirection.right => Axis.horizontal,
  };
}
