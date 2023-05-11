import 'dart:math';

final _r = Random();

/// Generates a random string of length [len].
///
/// From https://stackoverflow.com/a/63433194/.
String randomString(int len) {
  final start = 'a'.codeUnitAt(0);
  final end = 'z'.codeUnitAt(0);
  return String.fromCharCodes(List.generate(len, (_) => _r.nextInt(end - start) + start));
}
