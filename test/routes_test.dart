import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/routes.dart';

void main() {
  test('Test that browseFilePath returns the browse page', () {
    String url = HomeRoutes.browseFilePath('/');
    expect(url.startsWith('/home/browse'), true);
  });
}
