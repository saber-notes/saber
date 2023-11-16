import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/home/no_files.dart';
import 'package:saber/components/home/welcome.dart';

void main() {
  testWidgets('Welcome', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Welcome(),
    ));
    await expectLater(
      find.byType(Welcome),
      matchesGoldenFile('goldens/welcome.png'),
    );
  });

  testWidgets('NoFiles', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: NoFiles(),
    ));
    await expectLater(
      find.byType(NoFiles),
      matchesGoldenFile('goldens/no_files.png'),
    );
  });
}
