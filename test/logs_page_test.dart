import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_screenshot/golden_screenshot.dart';
import 'package:logging/logging.dart';
import 'package:saber/pages/logs.dart';

void main() {
  group('LogsPage', () {
    testGoldens('empty', (tester) async {
      logsHistory.clear();

      await tester.pumpWidget(_LogsApp());

      await tester.loadFonts();
      await tester.precacheImagesInWidgetTree();
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/logs_page_empty.png'),
      );
    });

    testGoldens('with logs', (tester) async {
      final stackTrace = StackTrace.fromString(
        '#0      main.<anonymous closure>.<anonymous closure> (file:///home/ahann/Documents/GitHub/saber/test/logs_page_test.dart:31:24)\n'
        '#1      testGoldens.<anonymous closure> (package:golden_screenshot/src/test_goldens.dart:28:25)\n'
        '#2      testWidgets.<anonymous closure>.<anonymous closure> (package:flutter_test/src/widget_tester.dart:193:29)\n'
        '<asynchronous suspension>\n'
        '#3      TestWidgetsFlutterBinding._runTestBody (package:flutter_test/src/binding.dart:1064:5)\n'
        '<asynchronous suspension>\n'
        '#4      StackZoneSpecification._registerCallback.<anonymous closure> (package:stack_trace/src/stack_zone_specification.dart:114:42)\n'
        '<asynchronous suspension>\n',
      );
      logsHistory.clear();
      logsHistory.add(
        LogRecord(Level.INFO, 'This is an info log', 'TestLogger'),
      );
      logsHistory.add(
        LogRecord(
          Level.WARNING,
          'This is a warning log',
          'TestLogger',
          UnimplementedError('Test error'),
          stackTrace,
        ),
      );
      logsHistory.add(
        LogRecord(
          Level.SEVERE,
          'Oh no!',
          'TestLogger',
          TypeError(),
          stackTrace,
        ),
      );

      await tester.pumpWidget(_LogsApp());

      await tester.loadFonts();
      await tester.precacheImagesInWidgetTree();
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/logs_page_with_logs.png'),
      );
    });
  });
}

class _LogsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenshotApp.withConditionalTitlebar(
      device: GoldenSmallDevices.androidPhone.device,
      title: 'Saber',
      home: const LogsPage(),
    );
  }
}
