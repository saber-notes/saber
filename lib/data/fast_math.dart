
import 'dart:math' show pi;

/// Returns how close this is to a right angle,
/// using a fast approximation of atan2.
/// (adjusted to have a range between 0 and pi/4).
/// Don't use this if the actual angle is needed.
/// https://math.stackexchange.com/a/1098585
double diffToRightAngle(double y, double x, [double Function(double z) atan = _fastAtan]) {
  if (x == 0 || y == 0) {
    return 0;
  }

  double z = (y / x).abs();

  double angle;
  if (z > 1) {
    angle = atan(1 / z);
  } else {
    angle = atan(z);
  }

  if (angle > pi/4) {
    return pi/2 - angle;
  } else {
    return angle;
  }
}

/// A fast approximation of atan.
/// [z] must be in the range [0, 1]
double _fastAtan(double z) {
  assert(z >= 0 && z <= 1, 'z must be in the range [0, 1]');
  return z * (pi/4 - 0.2733 * (z - 1));
}
