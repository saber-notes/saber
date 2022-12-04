
import 'package:flutter/material.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

class Whiteboard extends StatelessWidget {
  const Whiteboard({
    super.key = const ValueKey("whiteboard"),
  });

  // editor key
  static final GlobalKey _editorKey = GlobalKey(debugLabel: "whiteboardEditor");

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
                builder: (context) => editorState!.bottomSheet(context),
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
