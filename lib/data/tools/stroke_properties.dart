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

  static StrokeOptions fromJson(Map<String, dynamic> json) {
    return StrokeOptions(
      size: json['s'] ?? StrokeOptions.defaultSize,
      thinning: json['t'] ?? StrokeOptions.defaultThinning,
      smoothing: json['sm'] ?? StrokeOptions.defaultSmoothing,
      streamline: json['sl'] ?? StrokeOptions.defaultStreamline,
      start: StrokeEndOptions.start(
        taperEnabled: (json['ts'] ?? 0.0) > 0,
        cap: json['cs'] ?? StrokeEndOptions.defaultCap,
      ),
      end: StrokeEndOptions.end(
        taperEnabled: (json['te'] ?? 0.0) > 0,
        cap: json['ce'] ?? StrokeEndOptions.defaultCap,
      ),
      simulatePressure: json['sp'] ?? StrokeOptions.defaultSimulatePressure,
      isComplete: json['f'] ?? true,
    );
  }

  Map<String, dynamic> toJson() => {
        if (size != StrokeOptions.defaultSize) 's': size,
        if (thinning != StrokeOptions.defaultThinning) 't': thinning,
        if (smoothing != StrokeOptions.defaultSmoothing) 'sm': smoothing,
        if (streamline != StrokeOptions.defaultStreamline) 'sl': streamline,
        if (start.taperEnabled != StrokeEndOptions.defaultTaperEnabled)
          'ts': start.taperEnabled ? 1.0 : 0.0,
        if (start.cap != StrokeEndOptions.defaultCap) 'cs': start.cap,
        if (end.taperEnabled != StrokeEndOptions.defaultTaperEnabled)
          'te': end.taperEnabled ? 1.0 : 0.0,
        if (end.cap != StrokeEndOptions.defaultCap) 'ce': end.cap,
        if (simulatePressure != StrokeOptions.defaultSimulatePressure)
          'sp': simulatePressure,
        if (isComplete != true) 'f': isComplete,
      };
}
