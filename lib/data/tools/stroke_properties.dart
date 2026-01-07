import 'package:perfect_freehand/perfect_freehand.dart';

extension StrokeOptionsExtension on StrokeOptions {
  static void setDefaults() {
    StrokeOptions.defaultSize = 10;
    StrokeOptions.defaultThinning = 0.5;
    StrokeOptions.defaultSmoothing = 0;
    StrokeOptions.defaultStreamline = 0.5;
    StrokeEndOptions.defaultTaperEnabled = false;
    StrokeEndOptions.defaultCap = true;
    StrokeOptions.defaultSimulatePressure = true;
  }
}
