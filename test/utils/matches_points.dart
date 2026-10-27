import 'package:flutter_test/flutter_test.dart';

/// Matches points with an allowance of 0.1
class MatchesPoints(final List<Offset> points) extends Matcher {
  @override
  bool matches(Object? actual, Map matchState) {
    if (actual is! List<Offset>) return false;
    if (actual.length != points.length) return false;

    const epsilon = 0.1;
    for (var i = 0; i < points.length; ++i) {
      if ((actual[i].dx - points[i].dx).abs() > epsilon) return false;
      if ((actual[i].dy - points[i].dy).abs() > epsilon) return false;
    }

    return true;
  }

  @override
  Description describe(Description description) =>
      description.addDescriptionOf(points);
}
