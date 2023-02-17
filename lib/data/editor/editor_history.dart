
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';

class EditorHistory {
  static const int maxHistoryLength = 100;

  /// A stack of the changes that have been made in the editor.
  /// The last element is used when undoing.
  ///
  /// See also: [_future]
  final List<EditorHistoryItem> _past = [];

  /// A stack of the changes that have been undone in the editor.
  /// The last element is used when redoing.
  ///
  /// See also: [_past]
  final List<EditorHistoryItem> _future = [];

  /// True if redo is possible.
  /// We don't directly clear [_future] because we sometimes need to
  /// reject strokes (i.e. accidental strokes when zooming).
  bool _isRedoPossible = false;

  /// Removes an element from the [_past] stack,
  /// adds it to the [_future] stack, and returns it.
  ///
  /// Please check [canUndo] first: this method will
  /// throw an exception if there is nothing to undo.
  EditorHistoryItem undo() {
    if (_past.isEmpty) throw Exception('Nothing to undo');
    final EditorHistoryItem item = _past.removeLast();
    _future.add(item);
    return item;
  }

  /// Removes an element from the [_future] stack,
  /// adds it to the [_past] stack, and returns it.
  ///
  /// Please check [canRedo] first: this method will
  /// throw an exception if there is nothing to redo.
  EditorHistoryItem redo() {
    if (_future.isEmpty) throw Exception('Nothing to redo');
    final EditorHistoryItem item = _future.removeLast();
    _past.add(item);
    return item;
  }

  /// Adds an item to the [_past] stack.
  void recordChange(EditorHistoryItem item) {
    _past.add(item);
    if (_past.length > maxHistoryLength) _past.removeAt(0);
    _isRedoPossible = false;
  }

  /// Removes the last history item due to a rejected stroke.
  /// This does essentially the opposite of [recordChange].
  EditorHistoryItem? removeAccidentalStroke() {
    _isRedoPossible = true;
    if (_past.isEmpty) return null;
    assert(_past.last.type == EditorHistoryItemType.draw, 'Accidental stroke is not a draw');
    assert(_past.last.strokes.length == 1, 'Accidental strokes should be single-stroke');
    assert(_past.last.images.isEmpty, 'Accidental strokes should not contain images');
    return _past.removeLast();
  }

  /// Returns true if there is something to undo.
  bool get canUndo {
    return _past.isNotEmpty;
  }

  /// Returns true if there is something to redo.
  bool get canRedo {
    return _isRedoPossible && _future.isNotEmpty;
  }
  set canRedo(bool isRedoPossible) {
    _isRedoPossible = isRedoPossible;
  }

  void clearRedo() {
    _future.clear();
  }
}

class EditorHistoryItem {
  EditorHistoryItem({
    required this.type,
    required this.strokes,
    required this.images,
    this.offset,
  }): assert(type != EditorHistoryItemType.move || offset != null, 'Offset must be provided for move');

  final EditorHistoryItemType type;
  final List<Stroke> strokes;
  final List<EditorImage> images;
  final Rect? offset;

  EditorHistoryItem copyWith({
    EditorHistoryItemType? type,
    List<Stroke>? strokes,
    List<EditorImage>? images,
    Rect? offset,
  }) {
    return EditorHistoryItem(
      type: type ?? this.type,
      strokes: strokes ?? this.strokes,
      images: images ?? this.images,
      offset: offset ?? this.offset,
    );
  }
}

enum EditorHistoryItemType {
  draw,
  erase,
  move,
}
