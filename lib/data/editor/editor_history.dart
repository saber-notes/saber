import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/data/editor/page.dart';
import 'package:sbn/canvas_background_pattern.dart';
import 'package:sbn/change.dart';

class EditorHistory {
  static const maxHistoryLength = 100;

  /// A stack of the changes that have been made in the editor.
  /// The last element is used when undoing.
  ///
  /// See also: [_future]
  final List<Historic> _past = [];

  /// A stack of the changes that have been undone in the editor.
  /// The last element is used when redoing.
  ///
  /// See also: [_past]
  final List<Historic> _future = [];

  /// The last saved state in the history.
  /// This is used to determine whether an autosave is needed.
  Historic? _lastSaved;

  /// True if redo is possible.
  /// We don't directly clear [_future] because we sometimes need to
  /// reject strokes (i.e. accidental strokes when zooming).
  var _isRedoPossible = false;

  /// Removes an element from the [_past] stack,
  /// adds it to the [_future] stack, and returns it.
  ///
  /// Please check [canUndo] first: this method will
  /// throw an exception if there is nothing to undo.
  Historic undo() {
    if (_past.isEmpty) throw Exception('Nothing to undo');
    final item = _past.removeLast();
    _future.add(item);
    return item;
  }

  /// Removes an element from the [_future] stack,
  /// adds it to the [_past] stack, and returns it.
  ///
  /// Please check [canRedo] first: this method will
  /// throw an exception if there is nothing to redo.
  Historic redo() {
    if (_future.isEmpty) throw Exception('Nothing to redo');
    final item = _future.removeLast();
    _past.add(item);
    return item;
  }

  /// Allows you to see the last item in the [_past] stack
  /// without removing it.
  ///
  /// Please check [canUndo] first: this method will
  /// throw an exception if there is nothing to undo.
  Historic peekUndo() {
    if (_past.isEmpty) throw Exception('Nothing to undo');
    return _past.last;
  }

  /// Allows you to see the last item in the [_future] stack
  /// without removing it.
  ///
  /// Please check [canRedo] first: this method will
  /// throw an exception if there is nothing to redo.
  Historic peekRedo() {
    if (_future.isEmpty) throw Exception('Nothing to redo');
    return _future.last;
  }

  /// Adds an item to the [_past] stack.
  void recordChange(Historic item) {
    assert(
      item is! HistoricQuillReverseChange,
      'HistoricQuillReverseChange is just a hack to make undoing quill changes easier. It should just be recorded as a quill change.',
    );

    _past.add(item);
    if (_past.length > maxHistoryLength) _past.removeAt(0);
    _isRedoPossible = false;
  }

  /// Marks the last change as saved to disk.
  /// This does not modify the history stacks, but allows us to know
  /// whether the current state is saved or not.
  void markLastChangeAsSaved() {
    _lastSaved = _past.lastOrNull;
  }

  /// Whether the current state is saved to disk.
  ///
  /// Note that this explicitly checks the last change in the history,
  /// not whether _past is empty. This is because _past items can be discarded
  /// if the history exceeds [maxHistoryLength].
  bool get isCurrentStateSaved {
    return _past.lastOrNull == _lastSaved;
  }

  /// Removes the last history item due to a rejected stroke.
  /// This does essentially the opposite of [recordChange].
  Historic? removeAccidentalStroke() {
    _isRedoPossible = true;
    if (_past.isEmpty) return null;
    assert(
      _past.last is HistoricAdd,
      'No accidental stroke, found ${_past.last}',
    );
    assert(
      (_past.last as HistoricAdd).strokes.length == 1,
      'Accidental strokes should be single-stroke',
    );
    assert(
      (_past.last as HistoricAdd).images.isEmpty,
      'Accidental strokes should not contain images',
    );
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

/// A history item representing a change in the editor state.
sealed class Historic {
  @protected
  const new();

  /// The reverse of this change,
  /// e.g. switching between [HistoricAdd] and [HistoricDelete].
  Historic reverse();
}

/// A stroke or image was drawn/added.
class const HistoricAdd({
  required final List<Stroke> strokes,
  required final List<EditorImage> images,
}) extends Historic {
  @override
  HistoricDelete reverse() => .new(strokes: strokes, images: images);
}

/// A stroke or image was erased/deleted.
class const HistoricDelete({
  required final List<Stroke> strokes,
  required final List<EditorImage> images,
}) extends Historic {
  @override
  HistoricAdd reverse() => .new(strokes: strokes, images: images);
}

/// A stroke or image was moved.
///
/// If [pageIndex] does not equal [prevPageIndex],
/// they were moved across pages.
class const HistoricMove({
  required final int pageIndex,
  required final int prevPageIndex,
  required final List<Stroke> strokes,
  required final List<EditorImage> images,
  required final Rect offset,
}) extends Historic {
  @override
  HistoricMove reverse() => .new(
    pageIndex: prevPageIndex,
    prevPageIndex: pageIndex,
    strokes: strokes,
    images: images,
    offset: .fromLTRB(-offset.left, -offset.top, -offset.right, -offset.bottom),
  );
}

/// A [page] was inserted at [pageIndex].
class const HistoricPageInsert({
  required final int pageIndex,
  required final EditorPage page,
}) extends Historic {
  @override
  HistoricPageDelete reverse() => .new(pageIndex: pageIndex, page: page);
}

/// The [page] at [pageIndex] was deleted.
class const HistoricPageDelete({
  required final int pageIndex,
  required final EditorPage page,
}) extends Historic {
  @override
  HistoricPageInsert reverse() => .new(pageIndex: pageIndex, page: page);
}

/// A change in the Quill text editor.
class const HistoricQuillChange({
  required final int pageIndex,
  required final DocChange quillChange,
}) extends Historic {
  @override
  HistoricQuillReverseChange reverse() =>
      .new(pageIndex: pageIndex, quillChange: quillChange);
}

/// A reversed change in the Quill text editor.
///
/// The [quillChange] is equivalent to the non-reversed class' [quillChange].
/// This class is just a hack to make interfacing with Quill easier.
class const HistoricQuillReverseChange({
  required final int pageIndex,
  required final DocChange quillChange,
}) extends Historic {
  @override
  HistoricQuillChange reverse() =>
      .new(pageIndex: pageIndex, quillChange: quillChange);
}

/// Some strokes' colors were changed.
class const HistoricColorChange({
  required final int pageIndex,
  required final Map<Stroke, Change<Color>> colorChanges,
}) extends Historic {
  @override
  HistoricColorChange reverse() => .new(
    pageIndex: pageIndex,
    colorChanges: colorChanges.map(
      (key, value) => MapEntry(key, value.reverse()),
    ),
  );
}

/// A page's background pattern was changed.
class const HistoricBackgroundPatternChange({
  required final int pageIndex,
  required final Change<CanvasBackgroundPattern> change,
}) extends Historic {
  @override
  HistoricBackgroundPatternChange reverse() =>
      .new(pageIndex: pageIndex, change: change.reverse());
}
