import 'package:vector_math/vector_math_64.dart';

extension Matrix4Extensions on Matrix4 {
  /// A fast approximation of the matrix's scale factor.
  /// This makes the assumptions that the matrix has a uniform scale
  /// and no rotation or skewing.
  double get approxScale => entry(0, 0);
}
