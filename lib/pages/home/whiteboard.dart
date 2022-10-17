
import 'package:flutter/material.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

class Whiteboard extends StatefulWidget {
  const Whiteboard({super.key});

  @override
  State<Whiteboard> createState() => _WhiteboardPageState();
}

class _WhiteboardPageState extends State<Whiteboard> {
  // editor key
  final GlobalKey _editorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.home.titles.whiteboard),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              dynamic editorState = _editorKey.currentState;
              if (editorState == null) return;
              showModalBottomSheet(
                context: context,
                builder: (context) => editorState!.bottomSheet,
              );
            },
          )
        ],
      ),
      body: Editor(
        key: _editorKey,
        path: "/_whiteboard",
        embedded: true,
      ),
    );
  }
}
