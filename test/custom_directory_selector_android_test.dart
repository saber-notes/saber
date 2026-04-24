import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/settings/custom_directory_selector_android.dart';

void main() {
  group('custom_directory_selector_android (Play Store stub)', () {
    test('isCustomDirSupported returns false', () {
      expect(isCustomDirSupported(), false);
    });

    testWidgets('onConfirmAndroid is a no-op and shows no dialog', (
      tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: SizedBox()));
      final context = tester.element(find.byType(SizedBox));

      await onConfirmAndroid(context, '/storage/emulated/0/Saber');

      await tester.pump();
      expect(find.byType(AlertDialog), findsNothing);
    });
  });
}
