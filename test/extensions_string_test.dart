import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/extensions/string_extensions.dart';

void main() {
  test('String.replaceAllMappedAsync', () async {
    const str = 'This is a test string';

    final syncReplace = str.replaceAllMapped(
      RegExp(r'\w+'),
      (match) => match.group(0)!.toUpperCase(),
    );

    final asyncReplace = await str.replaceAllMappedAsync(
      RegExp(r'\w+'),
      (match) async => match.group(0)!.toUpperCase(),
    );

    expect(syncReplace, asyncReplace);
    expect(syncReplace, 'THIS IS A TEST STRING');
  });
}
