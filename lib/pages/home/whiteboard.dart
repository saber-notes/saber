
import 'package:flutter/material.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

class Whiteboard extends StatefulWidget {
  const Whiteboard({super.key});

  @override
  State<Whiteboard> createState() => _WhiteboardPageState();
}

class _WhiteboardPageState extends State<Whiteboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.home.titles.whiteboard),
      ),
      body: Editor(
        path: "/_whiteboard",
        embedded: true,
      ),
    );
  }
}
