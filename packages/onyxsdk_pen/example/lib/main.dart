import 'package:flutter/material.dart';
import 'package:onyxsdk_pen/onyxsdk_pen_area.dart';

const String explanation = '''
Try me out on an Onyx device!
You should be able to smoothly draw on the screen with your stylus.
With your finger, it'll be as laggy as a regular app.
''';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<List<Offset>> strokes = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: OnyxSdkPenArea(
          child: GestureDetector(
            onPanStart: (details) {
              strokes.add([details.localPosition]);
            },
            onPanUpdate: (details) {
              if (strokes.isEmpty) return;
              setState(() {
                strokes.last.add(details.localPosition);
              });
            },
            onPanEnd: (details) {
              setState(() {});
            },
            child: CustomPaint(
              painter: MyPainter(strokes),
              child: const Center(
                child: SelectableText(explanation),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final List<List<Offset>> strokes;
  MyPainter(this.strokes);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    for (final List<Offset> stroke in strokes) {
      for (int i = 0; i < stroke.length - 1; i++) {
        canvas.drawLine(stroke[i], stroke[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;
}
