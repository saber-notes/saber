import 'dart:math';
import 'ink_sample.dart';

/// Defines the physical geometry and dynamic behavior of a writer's nib.
abstract class NibProfile {
  /// Computes the thickness of the line at a given [sample].
  double computeThickness(InkSample sample, {required double baseThickness});
  
  /// Computes the angular deformation (calligraphic angle) mapping to the 
  /// organic rotation of the stroke joint.
  double computeAngle(InkSample sample);
}

/// A classic ballpoint profile that scales predominantly with pressure, 
/// ignoring specific hardware orientation.
class BallpointNibProfile extends NibProfile {
  @override
  double computeThickness(InkSample sample, {required double baseThickness}) {
    // Pure linear scaling based on pressure
    return baseThickness * max(0.1, sample.pressure);
  }

  @override
  double computeAngle(InkSample sample) => 0.0;
}

/// A premium calligraphic fountain nib that reacts heavily to the physical orientation
/// and barrel roll of the stylus to create organic thin/thick contrasts dynamically.
class CalligraphicNibProfile extends NibProfile {
  @override
  double computeThickness(InkSample sample, {required double baseThickness}) {
    // When drawing parallel to the wide side of the nib, thickness is minimal.
    // Thus, thickness is modulated by `sin(altitude)` to shrink when tipped low.
    final altitudeFactor = sin(sample.altitude.clamp(0.2, pi / 2));
    
    // In advanced implementations, we compare the velocity vector of the stroke 
    // against `sample.effectiveRotation` to drastically thin the stroke if moving 
    // "against the grain" of the nib.
    // For now, altitude and pressure strictly rule the core thickness baseline.
    return baseThickness * sample.pressure * altitudeFactor; 
  }

  @override
  double computeAngle(InkSample sample) {
    // The angle of the stroke joint is explicitly locked to the true rotation of the hardware instrument!
    return sample.effectiveRotation;
  }
}
