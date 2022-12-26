
import 'package:flutter/material.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

class Whiteboard extends StatelessWidget {
  const Whiteboard({
    super.key = const ValueKey("whiteboard"),
  });

  // editor key
  static final GlobalKey _editorKey = GlobalKey(debugLabel: "whiteboardEditor");

  static const String filePath = "/_whiteboard";

  static bool needsToAutoClearWhiteboard = Prefs.autoClearWhiteboardOnExit.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DynamicMaterialApp.isFullscreen.value ? null : AppBar(
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
        path: filePath,
        embedded: true,
      ),
      floatingActionButton: (DynamicMaterialApp.isFullscreen.value && !Prefs.editorToolbarShowInFullscreen.value) ? FloatingActionButton(
        onPressed: () {
          DynamicMaterialApp.isFullscreen.value = false;
        },
        child: const Icon(Icons.fullscreen_exit),
      ) : null,
    );
  }
}
