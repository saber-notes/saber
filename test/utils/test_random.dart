import 'dart:math';

final _r = Random();

/// Generates a random string of length [len].
///
/// From https://stackoverflow.com/a/63433194/.
String randomString(int len) {
  return String.fromCharCodes(List.generate(len, (index) => _r.nextInt(33) + 89));
}
