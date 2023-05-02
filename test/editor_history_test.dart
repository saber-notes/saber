import 'package:flutter_test/flutter_test.dart';
import 'package:saber/data/editor/editor_history.dart';

void main() {
  test('Test editor history', () {
    final EditorHistory history = EditorHistory();

    final EditorHistoryItem item1 = EditorHistoryItem(
      type: EditorHistoryItemType.draw,
      pageIndex: 0,
      strokes: [],
      images: [],
    );
    final EditorHistoryItem item2 = EditorHistoryItem(
      type: EditorHistoryItemType.draw,
      pageIndex: 0,
      strokes: [],
      images: [],
    );

    expect(history.canUndo, false, reason: 'History should be empty');
    expect(history.canRedo, false, reason: 'History should be empty');

    expect(() => history.undo(), throwsA(anything), reason: 'Undo should throw an exception if history is empty');
    expect(() => history.redo(), throwsA(anything), reason: 'Redo should throw an exception if history is empty');

    history.recordChange(item1);
    expect(history.canUndo, true);
    expect(history.canRedo, false);

    expect(history.undo(), item1, reason: 'Undo should return the last item');
    history.canRedo = true;
    expect(history.canUndo, false);
    expect(history.canRedo, true);

    expect(history.redo(), item1, reason: 'Redo should return the last item');
    expect(history.canUndo, true);
    expect(history.canRedo, false);

    expect(history.undo(), item1, reason: 'Undo should return the last item');
    history.canRedo = true;
    expect(history.canUndo, false);
    expect(history.canRedo, true);

    history.recordChange(item2);
    expect(history.canUndo, true);
    expect(history.canRedo, false);

    expect(history.undo(), item2, reason: 'Undo should return the last item');
  });
}
