import 'package:material_ui/material_ui.dart';

extension AxisExtensions on Axis {
  Axis get opposite => switch (this) {
    .horizontal => .vertical,
    .vertical => .horizontal,
  };
}

extension AxisDirectionExtensions on AxisDirection {
  Axis get axis => switch (this) {
    .up || .down => .vertical,
    .left || .right => .horizontal,
  };
}
