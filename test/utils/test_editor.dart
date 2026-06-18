import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/tools/pen.dart';
import 'package:saber/pages/editor/editor.dart';

extension TestEditor on EditorState {
  /// Does the bare minimum to get a stroke in the editor.
  /// This is faster than using [WidgetTester.timedDrag] or similar.
  void drawTestStroke() {
    final pen = Pen.currentPen;
    currentTool = pen;
    const i = 0;
    dragPageIndex = i;
    pen.onDragStart(.zero, coreInfo.pages[i], i, null);
    onDrawEnd(.new());
  }
}
