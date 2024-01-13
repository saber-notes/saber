import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/data/tools/highlighter.dart';

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
        taperEnabled: json['ts'] ?? StrokeEndOptions.defaultTaperEnabled,
        cap: json['cs'] ?? StrokeEndOptions.defaultCap,
      ),
      end: StrokeEndOptions.end(
        taperEnabled: json['te'] ?? StrokeEndOptions.defaultTaperEnabled,
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
          'ts': start.taperEnabled,
        if (start.cap != StrokeEndOptions.defaultCap) 'cs': start.cap,
        if (end.taperEnabled != StrokeEndOptions.defaultTaperEnabled)
          'te': end.taperEnabled,
        if (end.cap != StrokeEndOptions.defaultCap) 'ce': end.cap,
        if (simulatePressure != StrokeOptions.defaultSimulatePressure)
          'sp': simulatePressure,
        if (isComplete != true) 'f': isComplete,
      };
}

@Deprecated('Use StrokeOptions instead')
class StrokeProperties {
  static const Color defaultColor = Colors.black;
  static const double defaultSize = 10;
  static const double defaultThinning = 0.5;
  static const double defaultSmoothing = 0;
  static const double defaultStreamline = 0.5;
  static const double defaultTaperStart = 0;
  static const double defaultTaperEnd = 0;
  static const bool defaultCapStart = true;
  static const bool defaultCapEnd = true;
  static const bool defaultPressureEnabled = true;
  static const bool defaultSimulatePressure = true;

  Color color = defaultColor;
  double size = defaultSize;
  double thinning = defaultThinning;
  double smoothing = defaultSmoothing;
  double streamline = defaultStreamline;
  double taperStart = defaultTaperStart;
  double taperEnd = defaultTaperEnd;
  bool capStart = defaultCapStart;
  bool capEnd = defaultCapEnd;
  bool pressureEnabled = defaultPressureEnabled;
  bool simulatePressure = defaultSimulatePressure;

  StrokeProperties({
    this.color = defaultColor,
    this.size = defaultSize,
    this.thinning = defaultThinning,
    this.smoothing = defaultSmoothing,
    this.streamline = defaultStreamline,
    this.taperStart = defaultTaperStart,
    this.taperEnd = defaultTaperEnd,
    this.capStart = defaultCapStart,
    this.capEnd = defaultCapEnd,
    this.pressureEnabled = defaultPressureEnabled,
    this.simulatePressure = defaultSimulatePressure,
  });
  StrokeProperties.fromJson(Map<String, dynamic> json) {
    switch (json['c']) {
      case (int value):
        color = Color(value);
      case (Int64 value):
        color = Color(value.toInt());
      case null:
        color = defaultColor;
      default:
        throw Exception(
            'Invalid color value: (${json['c'].runtimeType}) ${json['c']}');
    }
    size = json['s'] ?? defaultSize;
    thinning = json['t'] ?? defaultThinning;
    smoothing = json['sm'] ?? defaultSmoothing;
    streamline = json['sl'] ?? defaultStreamline;
    taperStart = json['ts'] ?? defaultTaperStart;
    taperEnd = json['te'] ?? defaultTaperEnd;
    capStart = json['cs'] ?? defaultCapStart;
    capEnd = json['ce'] ?? defaultCapEnd;
    pressureEnabled = json['pe'] ?? defaultPressureEnabled;
    simulatePressure = json['sp'] ?? defaultSimulatePressure;
  }
  Map<String, dynamic> toJson() => {
        if (color != defaultColor) 'c': color.value,
        if (size != defaultSize) 's': size,
        if (thinning != defaultThinning) 't': thinning,
        if (smoothing != defaultSmoothing) 'sm': smoothing,
        if (streamline != defaultStreamline) 'sl': streamline,
        if (taperStart != defaultTaperStart) 'ts': taperStart,
        if (taperEnd != defaultTaperEnd) 'te': taperEnd,
        if (capStart != defaultCapStart) 'cs': capStart,
        if (capEnd != defaultCapEnd) 'ce': capEnd,
        if (pressureEnabled != defaultPressureEnabled) 'pe': pressureEnabled,
        if (simulatePressure != defaultSimulatePressure) 'sp': simulatePressure,
      };

  StrokeProperties copy() => StrokeProperties.fromJson(toJson());

  static StrokeProperties get fountainPen => StrokeProperties();
  static StrokeProperties get ballpointPen => StrokeProperties(
        pressureEnabled: false,
      );
  static StrokeProperties get shapePen => StrokeProperties(
        pressureEnabled: false,
      );
  static StrokeProperties get highlighter => StrokeProperties(
        size: defaultSize * 5,
        color: Colors.yellow.withAlpha(Highlighter.alpha),
        pressureEnabled: false,
      );
  static StrokeProperties get pencil => StrokeProperties(
        streamline: 0.1,
        taperStart: 1,
        taperEnd: 1,
      );
}
