import 'package:saber/devils_book/stylus/devils_stylus_event.dart';

/// An enriched high-resolution sample representing a single moment of stylus contact.
/// Extends standard X/Y/Pressure coordinates with complete 6-DOF data.
class InkSample {
  final double x;
  final double y;
  final double pressure;
  
  /// The altitude (tilt) of the stylus at this moment in radians.
  /// 0 is flat on the screen, pi/2 is perpendicular.
  final double altitude;
  
  /// The azimuth (orientation in the X/Y plane) at this moment in radians.
  final double azimuth;
  
  /// The hardware barrel roll of the stylus shell.
  final double barrelRoll;
  
  /// The duration since the start of the stroke, useful for velocity profiling.
  final Duration timeOffset;

  const InkSample({
    required this.x,
    required this.y,
    required this.pressure,
    required this.altitude,
    required this.azimuth,
    required this.barrelRoll,
    required this.timeOffset,
  });

  /// Extracts a sample from a real-time stylus tick.
  factory InkSample.fromStylusEvent(DevilsStylusEvent event, Duration timeOffset) {
    return InkSample(
      x: event.position.dx,
      y: event.position.dy,
      pressure: event.pressure,
      altitude: event.altitude,
      azimuth: event.azimuth,
      barrelRoll: event.barrelRoll ?? 0.0,
      timeOffset: timeOffset,
    );
  }

  /// A computed absolute rotation matrix capturing the final physical footprint 
  /// of the nib on the glass for this exact sample.
  double get effectiveRotation => azimuth + barrelRoll;
}
