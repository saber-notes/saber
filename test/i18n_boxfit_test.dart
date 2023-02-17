import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/i18n/extensions/box_fit_localized.dart';

void main() {
  test('Test that BoxFit is localized', () {
    // Expect translations for these box fits
    expect(BoxFit.fill.localizedName, isNotEmpty);
    expect(BoxFit.cover.localizedName, isNotEmpty);
    expect(BoxFit.contain.localizedName, isNotEmpty);

    // Expect exception for other box fits
    expect(() => BoxFit.fitWidth.localizedName, throwsException);
    expect(() => BoxFit.fitHeight.localizedName, throwsException);
    expect(() => BoxFit.scaleDown.localizedName, throwsException);
  });
}
