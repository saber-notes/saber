import 'package:flutter/material.dart';
import 'package:onyxsdk_pen/onyxsdk_pen_area.dart';

const String explanation = '''
This text is a child of the OnyxSdkPenArea widget.
If you are running this app on an Onyx device,
you should be able to draw on the screen.
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
        body: const OnyxSdkPenArea(
          child: Center(
            child: SelectableText(explanation),
          ),
        ),
      ),
    );
  }
}
