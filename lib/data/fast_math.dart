
import 'dart:math' show pi;

/// A fast approximation of atan2, used to detect
/// horizontal and vertical lines.
/// (adjusted to have a range between 0 and pi/2)
/// Don't use this if the actual angle is needed.
/// https://math.stackexchange.com/a/1098585
double atan2(double y, double x) {
  if (x == 0) {
    return 0;
  }

  double z = y / x;

  if (z > 1) {
    return _atan(1 / z);
  } else if (z < -1) {
    return _atan(1 / -z);
  } else if (z < 0) {
    return _atan(-z);
  } else {
    return _atan(z);
  }

}

/// A fast approximation of atan.
/// [z] must be in the range [0, 1]
double _atan(double z) {
  assert(z >= 0 && z <= 1, 'z must be in the range [0, 1]');
  return z * (pi/4 - 0.2733 * (z - 1));
}
