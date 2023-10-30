import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bson/bson.dart';
import 'package:collapsible/collapsible.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart' as flutter_quill;
import 'package:keybinder/keybinder.dart';
import 'package:logging/logging.dart';
import 'package:printing/printing.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_pdf_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/_svg_editor_image.dart';
import 'package:saber/components/canvas/canvas.dart';
import 'package:saber/components/canvas/canvas_gesture_detector.dart';
import 'package:saber/components/canvas/canvas_image.dart';
import 'package:saber/components/canvas/save_indicator.dart';
import 'package:saber/components/home/preview_card.dart';
import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/components/toolbar/color_bar.dart';
import 'package:saber/components/toolbar/editor_bottom_sheet.dart';
import 'package:saber/components/toolbar/editor_page_manager.dart';
import 'package:saber/components/toolbar/toolbar.dart';
import 'package:saber/data/editor/_color_change.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/editor_exporter.dart';
import 'package:saber/data/editor/editor_history.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/extensions/change_notifier_extensions.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/eraser.dart';
import 'package:saber/data/tools/highlighter.dart';
import 'package:saber/data/tools/laser_pointer.dart';
import 'package:saber/data/tools/pen.dart';
import 'package:saber/data/tools/select.dart';
import 'package:saber/data/tools/shape_pen.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/home/whiteboard.dart';
import 'package:super_clipboard/super_clipboard.dart';

typedef _PhotoInfo = ({Uint8List bytes, String extension});

class Editor extends StatefulWidget {
  Editor({
    super.key,
    String? path,
    this.customTitle,
    this.pdfPath,
  }) : initialPath = path != null ? Future.value(path) : FileManager.newFilePath('/'),
        needsNaming = path == null;

  final Future<String> initialPath;
  final bool needsNaming;

  final String? customTitle;
  final String? pdfPath;

  /// The file extension used by the app.
  /// Files with this extension are
  /// encoded in BSON format.
  static const String extension = '.sbn2';
  /// The old file extension used by the app.
  /// Files with this extension are
  /// encoded in JSON format.
  static const String extensionOldJson = '.sbn';

  static const double gapBetweenPages = 16;

  /// Returns true if [path] belongs to a hidden file
  /// used by other functions of the app
  static bool isReservedPath(String path) {
    return _reservedFilePaths.any((regex) => regex.hasMatch(path));
  }
  static final List<RegExp> _reservedFilePaths = [
    RegExp(RegExp.escape(Whiteboard.filePath)),
  ];

  /// Whether the platform can rasterize a pdf
  static bool canRasterPdf = true;

  @override
  State<Editor> createState() => EditorState();
}

class EditorState extends State<Editor> {
  final log = Logger('EditorState');

  late EditorCoreInfo coreInfo = EditorCoreInfo(filePath: '');

  final _canvasGestureDetectorKey = GlobalKey<CanvasGestureDetectorState>();
  late final TransformationController _transformationController = TransformationController()
    ..addListener(() {
      PdfEditorImage.checkIfHighDpiNeeded(
        getZoom: () => _transformationController.value.getMaxScaleOnAxis(),
        getScrollY: () => scrollY,
        pages: coreInfo.pages,
        screenWidth: _canvasGestureDetectorKey.currentState?.containerBounds.maxWidth ?? double.infinity,
      );
    });
  double get scrollY {
    final transformation = _transformationController.value;
    final scale = transformation.getMaxScaleOnAxis();
    final translation = transformation.getTranslation();
    final gestureDetector = _canvasGestureDetectorKey.currentState;

    if (gestureDetector == null) {
      log.warning('scrollY: Could not find CanvasGestureDetectorState');
      return translation.y / scale;
    } else {
      final middle = gestureDetector.containerBounds.maxHeight / 2;
      return (translation.y - middle) / scale + middle;
    }
  }

  EditorHistory history = EditorHistory();

  late bool needsNaming = widget.needsNaming && Prefs.editorPromptRename.value;

  late Tool _currentTool = () {
    switch (Prefs.lastTool.value) {
      case ToolId.fountainPen:
        if (Pen.currentPen.toolId != Prefs.lastTool.value) {
          Pen.currentPen = Pen.fountainPen();
        }
        return Pen.currentPen;
      case ToolId.ballpointPen:
        if (Pen.currentPen.toolId != Prefs.lastTool.value) {
          Pen.currentPen = Pen.ballpointPen();
        }
        return Pen.currentPen;
      case ToolId.shapePen:
        if (Pen.currentPen.toolId != Prefs.lastTool.value) {
          Pen.currentPen = ShapePen();
        }
        return Pen.currentPen;
      case ToolId.highlighter:
        return Highlighter.currentHighlighter;
      case ToolId.eraser:
        return Eraser();
      case ToolId.select:
        return Select.currentSelect;
      case ToolId.textEditing:
        return Tool.textEditing;
      case ToolId.laserPointer:
        return LaserPointer.currentLaserPointer;
    }
  }();
  Tool get currentTool => _currentTool;
  set currentTool(Tool tool) {
    _currentTool = tool;
    Prefs.lastTool.value = tool.toolId;
  }

  ValueNotifier<SavingState> savingState = ValueNotifier(SavingState.saved);
  Timer? _delayedSaveTimer;

  // used to prevent accidentally drawing when pinch zooming
  int lastSeenPointerCount = 0;
  Timer? _lastSeenPointerCountTimer;

  ValueNotifier<QuillStruct?> quillFocus = ValueNotifier(null);

  /// The tool that was used before switching to the eraser.
  Tool? tmpTool;
  /// If the stylus button is pressed, or was pressed during the current draw gesture.
  bool stylusButtonPressed = false;

  @override
  void initState() {
    DynamicMaterialApp.addFullscreenListener(_setState);

    _initAsync();
    _assignKeybindings();

    super.initState();
  }
  void _initAsync() async {
    coreInfo = PreviewCard.getCachedCoreInfo(await widget.initialPath);
    filenameTextEditingController.text = _filename;

    if (needsNaming) {
      filenameTextEditingController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: filenameTextEditingController.text.length,
      );
    }

    await _initStrokes();

    if (widget.pdfPath != null) {
      await importPdfFromFilePath(widget.pdfPath!);
    }
  }
  Future _initStrokes() async {
    coreInfo = await EditorCoreInfo.loadFromFilePath(coreInfo.filePath);
    if (coreInfo.readOnly) {
      log.info('Loaded file as read-only');
    }

    for (int pageIndex = 0; pageIndex < coreInfo.pages.length; pageIndex++) {
      listenToQuillChanges(coreInfo.pages[pageIndex].quill, pageIndex);
    }

    if (coreInfo.isEmpty) {
      createPage(-1);
    } else {
      for (EditorPage page in coreInfo.pages) {
        page.backgroundImage?.onMoveImage = onMoveImage;
        page.backgroundImage?.onDeleteImage = onDeleteImage;
        page.backgroundImage?.onMiscChange = autosaveAfterDelay;
        for (EditorImage image in page.images) {
          image.onMoveImage = onMoveImage;
          image.onDeleteImage = onDeleteImage;
          image.onMiscChange = autosaveAfterDelay;
        }
      }
    }

    if (currentTool == Tool.textEditing) {
      int pageIndex;
      if (coreInfo.initialPageIndex != null) {
        pageIndex = coreInfo.initialPageIndex!;
      } else {
        pageIndex = 0;
      }
      assert(pageIndex < coreInfo.pages.length);

      quillFocus.value = coreInfo.pages[pageIndex].quill
          ..focusNode.requestFocus();
    }

    if (coreInfo.filePath == Whiteboard.filePath && Prefs.autoClearWhiteboardOnExit.value && Whiteboard.needsToAutoClearWhiteboard) {
      // clear whiteboard (and add to history)
      clearAllPages();

      // save cleared whiteboard
      await saveToFile();
      Whiteboard.needsToAutoClearWhiteboard = false;
    } else {
      setState(() {});
    }
  }

  void _setState() => setState(() {});

  Keybinding? _ctrlZ, _ctrlY, _ctrlShiftZ;
  void _assignKeybindings() {
    _ctrlZ = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyZ)], inclusive: true);
    _ctrlY = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyY)], inclusive: true);
    _ctrlShiftZ = Keybinding([KeyCode.ctrl, KeyCode.shift, KeyCode.from(LogicalKeyboardKey.keyZ)], inclusive: true);
    Keybinder.bind(_ctrlZ!, undo);
    Keybinder.bind(_ctrlY!, redo);
    Keybinder.bind(_ctrlShiftZ!, redo);
  }
  void _removeKeybindings() {
    if (_ctrlZ != null) Keybinder.remove(_ctrlZ!);
    if (_ctrlY != null) Keybinder.remove(_ctrlY!);
    if (_ctrlShiftZ != null) Keybinder.remove(_ctrlShiftZ!);
  }

  /// Creates pages until the given page index exists,
  /// plus an extra blank page
  void createPage(int pageIndex) {
    while (pageIndex >= coreInfo.pages.length - 1) {
      final page = EditorPage();
      coreInfo.pages.add(page);
      listenToQuillChanges(page.quill, coreInfo.pages.length - 1);
    }
  }
  void removeExcessPages() {
    bool removedAPage = false;

    // remove excess pages if all pages >= this one are empty
    for (int i = coreInfo.pages.length - 1; i >= 1; --i) {
      final thisPage = coreInfo.pages[i];
      final prevPage = coreInfo.pages[i - 1];
      if (thisPage.isEmpty && prevPage.isEmpty) {
        EditorPage page = coreInfo.pages.removeAt(i);
        page.dispose();
        removedAPage = true;
      } else {
        break;
      }
    }

    if (removedAPage) {
      // scroll to the last page (only if we're below the last page)

      final scrollY = this.scrollY;
      late final topOfLastPage = -CanvasGestureDetector.getTopOfPage(
        pageIndex: coreInfo.pages.length - 1,
        pages: coreInfo.pages,
        screenWidth: MediaQuery.of(context).size.width,
      );
      final bottomOfLastPage = -CanvasGestureDetector.getTopOfPage(
        pageIndex: coreInfo.pages.length,
        pages: coreInfo.pages,
        screenWidth: MediaQuery.of(context).size.width,
      );

      if (scrollY < bottomOfLastPage) {
        _transformationController.value = Matrix4.translationValues(
          0,
          // Slight upwards offset so that the page is not flush with the top of the screen
          topOfLastPage + 50,
          0,
        );
      }
    }
  }

  void undo([EditorHistoryItem? item]) {
    if (item == null) {
      if (!history.canUndo) return;

      // if we disabled redo, re-enable it
      if (!history.canRedo) {
        // no redo is possible, so clear the redo stack
        history.clearRedo();
        // don't disable redoing anymore
        history.canRedo = true;
      }

      item = history.undo();
    }

    setState(() {
      switch (item!.type) {
        case EditorHistoryItemType.draw:
          for (Stroke stroke in item.strokes) {
            coreInfo.pages[stroke.pageIndex].strokes.remove(stroke);
          }
          for (EditorImage image in item.images) {
            coreInfo.pages[image.pageIndex].images.remove(image);
          }
          removeExcessPages();

        case EditorHistoryItemType.erase:
          for (Stroke stroke in item.strokes) {
            createPage(stroke.pageIndex);
            coreInfo.pages[stroke.pageIndex].insertStroke(stroke);
          }
          for (EditorImage image in item.images) {
            createPage(image.pageIndex);
            coreInfo.pages[image.pageIndex].images.add(image);
            image.newImage = true;
          }

        case EditorHistoryItemType.deletePage:
          // make sure we already have a (blank/otherwise) page at this index
          createPage(item.pageIndex - 1);

          // insert the page at the correct index
          coreInfo.pages.insert(item.pageIndex, item.page!);

          // fix the page indices of all pages after this one
          for (int i = item.pageIndex + 1; i < coreInfo.pages.length; ++i) {
            final page = coreInfo.pages[i];
            for (Stroke stroke in page.strokes) {
              stroke.pageIndex = i;
            }
            for (EditorImage image in page.images) {
              image.pageIndex = i;
            }
            page.backgroundImage?.pageIndex = i;
          }

        case EditorHistoryItemType.insertPage:
          // remove the page at the given index
          coreInfo.pages.removeAt(item.pageIndex);

          // fix the page indices of all pages after this one
          for (int i = item.pageIndex; i < coreInfo.pages.length; ++i) {
            final page = coreInfo.pages[i];
            for (Stroke stroke in page.strokes) {
              stroke.pageIndex = i;
            }
            for (EditorImage image in page.images) {
              image.pageIndex = i;
            }
            page.backgroundImage?.pageIndex = i;
          }

        case EditorHistoryItemType.move:
          for (Stroke stroke in item.strokes) {
            stroke.shift(Offset(
              -item.offset!.left,
              -item.offset!.top,
            ));
          }
          Select select = Select.currentSelect;
          if (select.doneSelecting) {
            select.selectResult.path = select.selectResult.path.shift(Offset(
              -item.offset!.left,
              -item.offset!.top,
            ));
          }
          for (EditorImage image in item.images) {
            image.dstRect = Rect.fromLTRB(
              image.dstRect.left - item.offset!.left,
              image.dstRect.top - item.offset!.top,
              image.dstRect.right - item.offset!.right,
              image.dstRect.bottom - item.offset!.bottom,
            );
          }

        case EditorHistoryItemType.quillChange:
          final quill = coreInfo.pages[item.pageIndex].quill;
          quill.controller.undo();

        case EditorHistoryItemType.quillUndoneChange:
          final quill = coreInfo.pages[item.pageIndex].quill;
          quill.controller.redo();
        case EditorHistoryItemType.changeColor:
          for (Stroke stroke in item.strokes) {
            stroke.strokeProperties.color = item.colorChange![stroke]!.previous;
          }
      }

      if (item.type != EditorHistoryItemType.move) {
        Select.currentSelect.unselect();
      }
    });

    autosaveAfterDelay();
  }

  void redo() {
    if (!history.canRedo) return;
    EditorHistoryItem item = history.redo();

    switch (item.type) {
      case EditorHistoryItemType.draw:
        undo(item.copyWith(type: EditorHistoryItemType.erase));
      case EditorHistoryItemType.erase:
        undo(item.copyWith(type: EditorHistoryItemType.draw));
      case EditorHistoryItemType.deletePage:
        undo(item.copyWith(type: EditorHistoryItemType.insertPage));
      case EditorHistoryItemType.insertPage:
        undo(item.copyWith(type: EditorHistoryItemType.deletePage));
      case EditorHistoryItemType.move:
        undo(item.copyWith(offset: Rect.fromLTRB(
          -item.offset!.left,
          -item.offset!.top,
          -item.offset!.right,
          -item.offset!.bottom,
        )));
      case EditorHistoryItemType.quillChange:
        undo(item.copyWith(type: EditorHistoryItemType.quillUndoneChange));
      case EditorHistoryItemType.quillUndoneChange: // this will never happen
        throw Exception('history should not contain quillUndoneChange items');
      case EditorHistoryItemType.changeColor:
        undo(item.copyWith(colorChange: item.colorChange!.map((key, value) => MapEntry(key, value.swap()))));
    }
  }

  int? onWhichPageIsFocalPoint(Offset focalPoint) {
    for (int i = 0; i < coreInfo.pages.length; ++i) {
      if (coreInfo.pages[i].renderBox == null) continue;
      Rect pageBounds = Offset.zero & coreInfo.pages[i].size;
      if (pageBounds.contains(coreInfo.pages[i].renderBox!.globalToLocal(focalPoint))) return i;
    }
    return null;
  }

  /// The position of the previous draw gesture event.
  /// Used to move a selection.
  Offset previousPosition = Offset.zero;
  /// The total offset of the current move gesture.
  /// Used to record a move in the history.
  Offset moveOffset = Offset.zero;

  int? dragPageIndex;
  double? currentPressure;
  bool isDrawGesture(ScaleStartDetails details) {
    if (coreInfo.readOnly) return false;

    CanvasImage.activeListener.notifyListenersPlease(); // un-select active image

    _lastSeenPointerCountTimer?.cancel();
    if (lastSeenPointerCount >= 2) { // was a zoom gesture, ignore
      lastSeenPointerCount = lastSeenPointerCount;
      return false;
    } else if (details.pointerCount >= 2) { // is a zoom gesture, remove accidental stroke
      if (lastSeenPointerCount == 1
          && Prefs.editorFingerDrawing.value
          && (currentTool is Pen || currentTool is Eraser)) {
        EditorHistoryItem? item = history.removeAccidentalStroke();
        if (item != null) undo(item);
      }
      lastSeenPointerCount = details.pointerCount;
      return false;
    } else { // is a stroke
      lastSeenPointerCount = details.pointerCount;
    }

    dragPageIndex = onWhichPageIsFocalPoint(details.focalPoint);
    if (dragPageIndex == null) return false;

    if (currentTool == Tool.textEditing) {
      return false;
    } else if (Prefs.editorFingerDrawing.value || currentPressure != null) {
      return true;
    } else {
      log.fine('Non-stylus found, rejected stroke');
      return false;
    }
  }
  void onDrawStart(ScaleStartDetails details) {
    final page = coreInfo.pages[dragPageIndex!];
    final position = page.renderBox!.globalToLocal(details.focalPoint);
    history.canRedo = false;

    if (currentTool is Pen) {
      (currentTool as Pen).onDragStart(position, dragPageIndex!, currentPressure);
    } else if (currentTool is Eraser) {
      for (Stroke stroke in (currentTool as Eraser).checkForOverlappingStrokes(position, page.strokes)) {
        page.strokes.remove(stroke);
      }
      removeExcessPages();
    } else if (currentTool is Select) {
      Select select = currentTool as Select;
      if (select.doneSelecting
          && select.selectResult.pageIndex == dragPageIndex!
          && select.selectResult.path.contains(position)) {
        // drag selection in onDrawUpdate
      } else {
        select.onDragStart(position, dragPageIndex!);
        history.canRedo = true; // selection doesn't affect history
      }
    } else if (currentTool is LaserPointer) {
      (currentTool as LaserPointer).onDragStart(position, dragPageIndex!);
    }

    previousPosition = position;
    moveOffset = Offset.zero;

    if (currentTool is! Select) {
      Select.currentSelect.unselect();
    }

    // setState to let canvas know about currentStroke
    setState(() {});
  }
  void onDrawUpdate(ScaleUpdateDetails details) {
    final page = coreInfo.pages[dragPageIndex!];
    final position = page.renderBox!.globalToLocal(details.focalPoint);
    final offset = position - previousPosition;
    if (currentTool is Pen) {
      (currentTool as Pen).onDragUpdate(position, currentPressure);
      page.redrawStrokes();
    } else if (currentTool is Eraser) {
      for (Stroke stroke in (currentTool as Eraser).checkForOverlappingStrokes(position, page.strokes)) {
        page.strokes.remove(stroke);
      }
      page.redrawStrokes();
      removeExcessPages();
    } else if (currentTool is Select) {
      Select select = currentTool as Select;
      if (select.doneSelecting) {
        for (Stroke stroke in select.selectResult.strokes) {
          stroke.shift(offset);
        }
        for (EditorImage image in select.selectResult.images) {
          image.dstRect = image.dstRect.shift(offset);
        }
        select.selectResult.path = select.selectResult.path.shift(offset);
      } else {
        select.onDragUpdate(position);
      }
      page.redrawStrokes();
    } else if (currentTool is LaserPointer) {
      (currentTool as LaserPointer).onDragUpdate(position);
      page.redrawStrokes();
    }
    previousPosition = position;
    moveOffset += offset;
  }
  void onDrawEnd(ScaleEndDetails details) {
    final page = coreInfo.pages[dragPageIndex!];
    setState(() {
      if (currentTool is Pen) {
        Stroke newStroke = (currentTool as Pen).onDragEnd();
        if (newStroke.isEmpty) return;
        createPage(newStroke.pageIndex);
        page.insertStroke(newStroke);
        history.recordChange(EditorHistoryItem(
          type: EditorHistoryItemType.draw,
          pageIndex: dragPageIndex!,
          strokes: [newStroke],
          images: [],
        ));
      } else if (currentTool is Eraser) {
        final erased = (currentTool as Eraser).onDragEnd();
        if (stylusButtonPressed || Prefs.disableEraserAfterUse.value) { // restore previous tool
          stylusButtonPressed = false;
          currentTool = tmpTool!;
          tmpTool = null;
        }
        if (erased.isEmpty) return;
        history.recordChange(EditorHistoryItem(
          type: EditorHistoryItemType.erase,
          pageIndex: dragPageIndex!,
          strokes: erased,
          images: [],
        ));
      } else if (currentTool is Select) {
        if (moveOffset == Offset.zero) return;
        Select select = currentTool as Select;
        if (select.doneSelecting) {
          history.recordChange(EditorHistoryItem(
            type: EditorHistoryItemType.move,
            pageIndex: dragPageIndex!,
            strokes: select.selectResult.strokes,
            images: select.selectResult.images,
            offset: Rect.fromLTRB(
              moveOffset.dx,
              moveOffset.dy,
              moveOffset.dx,
              moveOffset.dy,
            ),
          ));
        } else {
          select.onDragEnd(page.strokes, page.images);

          if (select.selectResult.isEmpty) {
            Select.currentSelect.unselect();
          }
        }
      } else if (currentTool is LaserPointer) {
        Stroke newStroke = (currentTool as LaserPointer).onDragEnd(
          page.redrawStrokes,
          (Stroke stroke) {
            page.laserStrokes.remove(stroke);
          },
        );
        page.laserStrokes.add(newStroke);
      }
    });
    autosaveAfterDelay();
  }
  void onInteractionEnd(ScaleEndDetails details) {
    // reset after 1ms to keep track of the same gesture only
    _lastSeenPointerCountTimer?.cancel();
    _lastSeenPointerCountTimer = Timer(const Duration(milliseconds: 10), () {
      lastSeenPointerCount = 0;
    });
  }

  void onPressureChanged(double? pressure) {
    currentPressure = pressure == 0 ? null : pressure;
  }
  void onStylusButtonChanged(bool buttonPressed) {
    // whether the stylus button is or was pressed
    stylusButtonPressed = stylusButtonPressed || buttonPressed;

    // if needed, switch to eraser
    if (!stylusButtonPressed) return;
    if (currentTool is Eraser) return;
    if (currentTool is Pen && dragPageIndex != null) {
      // if the pen is currently drawing, end the stroke
      (currentTool as Pen).onDragEnd();
    }
    tmpTool = currentTool;
    currentTool = Eraser();
    setState(() {});
  }

  void onMoveImage(EditorImage image, Rect offset) {
    history.recordChange(EditorHistoryItem(
      type: EditorHistoryItemType.move,
      pageIndex: image.pageIndex,
      strokes: [],
      images: [image],
      offset: offset,
    ));
    // setState to update undo button
    setState(() {});
    autosaveAfterDelay();
  }
  void onDeleteImage(EditorImage image) {
    history.recordChange(EditorHistoryItem(
      type: EditorHistoryItemType.erase,
      pageIndex: image.pageIndex,
      strokes: [],
      images: [image],
    ));
    setState(() {
      coreInfo.pages[image.pageIndex].images.remove(image);
    });
    autosaveAfterDelay();
  }

  void listenToQuillChanges(QuillStruct quill, int pageIndex) {
    quill.changeSubscription?.cancel();
    quill.changeSubscription = quill.controller.changes.listen((event) {
      final undoRedoButtonsNeedUpdating = !history.canUndo || history.canRedo;
      _addQuillChangeToHistory(
        quill: quill,
        pageIndex: pageIndex,
        event: event,
      );
      createPage(pageIndex); // create empty last page
      if (undoRedoButtonsNeedUpdating) {
        setState(() {});
      }
      autosaveAfterDelay();
    });
    quill.focusNode.addListener(_onQuillFocusChange);
  }
  void _onQuillFocusChange() {
    for (EditorPage page in coreInfo.pages) {
      if (!page.quill.focusNode.hasFocus) continue;
      quillFocus.value = page.quill;
    }
  }
  void _addQuillChangeToHistory({
    required QuillStruct quill,
    required int pageIndex,
    required flutter_quill.DocChange event,
  }) {
    final eventWasUndo = quill.controller.hasRedo;
    if (eventWasUndo) return;

    // the change subscription sometimes fires multiple times for the same change
    // so compare the "before" of each change to merge them
    if (history.canUndo && !history.canRedo) {
      final lastChange = history.peekUndo();
      if (lastChange.type == EditorHistoryItemType.quillChange &&
          lastChange.pageIndex == pageIndex &&
          lastChange.quillChange!.before == event.before) {
        history.undo(); // remove the last change, to be replaced
      }
    }

    history.recordChange(EditorHistoryItem(
      type: EditorHistoryItemType.quillChange,
      pageIndex: pageIndex,
      strokes: const [],
      images: const [],
      quillChange: event,
    ));
  }

  void autosaveAfterDelay() {
    savingState.value = SavingState.waitingToSave;
    _delayedSaveTimer?.cancel();
    if (Prefs.autosaveDelay.value < 0) return;
    _delayedSaveTimer = Timer(Duration(milliseconds: Prefs.autosaveDelay.value), () {
      saveToFile();
    });
  }


  String get _filename => coreInfo.filePath.substring(coreInfo.filePath.lastIndexOf('/') + 1);
  Uint8List _saveToBinary() {
    coreInfo.initialPageIndex = currentPageIndex;
    final bsonBinary = BSON().serialize(coreInfo);
    return bsonBinary.byteList;
  }
  Future<void> saveToFile() async {
    if (coreInfo.readOnly) return;

    switch (savingState.value) {
      case SavingState.saved:
        // avoid saving if nothing has changed
        return;
      case SavingState.saving:
        // avoid saving if already saving
        log.warning('saveToFile() called while already saving');
        return;
      case SavingState.waitingToSave:
        // continue
        _delayedSaveTimer?.cancel();
        savingState.value = SavingState.saving;
    }

    final toSave = _saveToBinary();
    try {
      await FileManager.writeFile(coreInfo.filePath + Editor.extension, toSave, awaitWrite: true);
      savingState.value = SavingState.saved;
    } catch (e) {
      log.severe('Failed to save file: $e', e);
      savingState.value = SavingState.waitingToSave;
      if (kDebugMode) rethrow;
    }
  }


  late final filenameTextEditingController = TextEditingController();
  Timer? _renameTimer;
  void renameFile(String newName) {
    _renameTimer?.cancel();

    if (newName.contains('/') || newName.isEmpty) { // if invalid name, don't rename
      _renameTimer = Timer(const Duration(milliseconds: 5000), () {
        filenameTextEditingController.value = filenameTextEditingController.value.copyWith(
          text: _filename,
          selection: TextSelection.fromPosition(TextPosition(offset: _filename.length)),
          composing: TextRange.empty,
        );
      });
    } else { // rename after a delay
      _renameTimer = Timer(const Duration(milliseconds: 5000), () {
        _renameFileNow(newName);
      });
    }
  }
  Future<void> _renameFileNow(String newName) async {
    if (newName == _filename) return;

    coreInfo.filePath = await FileManager.moveFile(coreInfo.filePath + Editor.extension, newName + Editor.extension);
    coreInfo.filePath = coreInfo.filePath.substring(0, coreInfo.filePath.lastIndexOf(Editor.extension));
    needsNaming = false;

    final String actualName = _filename;
    if (actualName != newName) { // update text field if renamed differently
      filenameTextEditingController.value = filenameTextEditingController.value.copyWith(
        text: actualName,
        selection: TextSelection.fromPosition(TextPosition(offset: actualName.length)),
        composing: TextRange.empty,
      );
    }
  }

  void updateColorBar(Color color) {
    if (Prefs.recentColorsDontSavePresets.value) {
      if (ColorBar.colorPresets.any((colorPreset) => colorPreset.color == color)) {
        return;
      }
    }

    final String newColorString = color.value.toString();

    // migrate from old pref format
    if (Prefs.recentColorsChronological.value.length != Prefs.recentColorsPositioned.value.length) {
      log.info('MIGRATING recentColors: ${Prefs.recentColorsChronological.value.length} vs ${Prefs.recentColorsPositioned.value.length}');
      Prefs.recentColorsChronological.value = List.of(Prefs.recentColorsPositioned.value);
    }

    if (Prefs.pinnedColors.value.contains(newColorString)) {
      // do nothing, color is already pinned
    } else if (Prefs.recentColorsPositioned.value.contains(newColorString)) {
      // if it's already a recent color, move it to the top
      Prefs.recentColorsChronological.value.remove(newColorString);
      Prefs.recentColorsChronological.value.add(newColorString);
      Prefs.recentColorsChronological.notifyListeners();
    } else {
      if (Prefs.recentColorsPositioned.value.length >= Prefs.recentColorsLength.value) {
        // if full, replace the oldest color with the new one
        final String removedColorString = Prefs.recentColorsChronological.value.removeAt(0);
        Prefs.recentColorsChronological.value.add(newColorString);
        final int removedColorPosition = Prefs.recentColorsPositioned.value.indexOf(removedColorString);
        Prefs.recentColorsPositioned.value[removedColorPosition] = newColorString;
      } else {
        // if not full, add the new color to the end
        Prefs.recentColorsChronological.value.add(newColorString);
        Prefs.recentColorsPositioned.value.insert(0, newColorString);
      }
      Prefs.recentColorsChronological.notifyListeners();
      Prefs.recentColorsPositioned.notifyListeners();
    }
  }

  /// Prompts the user to pick photos from their device.
  /// Returns the number of photos picked.
  ///
  /// If [photoInfos] is provided, it will be used instead of the file picker.
  Future<int> _pickPhotos([List<_PhotoInfo>? photoInfos]) async {
    if (coreInfo.readOnly) return 0;

    final currentPageIndex = this.currentPageIndex;

    photoInfos ??= await _pickPhotosWithFilePicker();
    if (photoInfos.isEmpty) return 0;

    // use the Select tool so that the user can move the new image
    currentTool = Select.currentSelect;

    List<EditorImage> images = [
      for (final _PhotoInfo photoInfo in photoInfos)
        if (photoInfo.extension == '.svg')
          SvgEditorImage(
            id: coreInfo.nextImageId++,
            svgString: utf8.decode(photoInfo.bytes),
            pageIndex: currentPageIndex,
            pageSize: coreInfo.pages[currentPageIndex].size,
            onMoveImage: onMoveImage,
            onDeleteImage: onDeleteImage,
            onMiscChange: autosaveAfterDelay,
            onLoad: () => setState(() {}),
          )
        else
          EditorImage(
            id: coreInfo.nextImageId++,
            extension: photoInfo.extension,
            bytes: photoInfo.bytes,
            pageIndex: currentPageIndex,
            pageSize: coreInfo.pages[currentPageIndex].size,
            onMoveImage: onMoveImage,
            onDeleteImage: onDeleteImage,
            onMiscChange: autosaveAfterDelay,
            onLoad: () => setState(() {}),
          ),
    ];

    history.recordChange(EditorHistoryItem(
      type: EditorHistoryItemType.draw,
      pageIndex: currentPageIndex,
      strokes: [],
      images: images,
    ));
    createPage(currentPageIndex);
    coreInfo.pages[currentPageIndex].images.addAll(images);
    autosaveAfterDelay();

    return images.length;
  }

  Future<List<_PhotoInfo>> _pickPhotosWithFilePicker() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      // Taken from
      // https://github.com/brendan-duncan/image/blob/main/doc/formats.md
      // (plus .svg)
      allowedExtensions: [
        'jpg', 'jpeg', 'png',
        'gif', 'tiff', 'bmp',
        'tga', 'ico', 'pvrtc',

        'svg',

        'webp', 'psd', 'exr',
      ],
      allowMultiple: true,
      withData: true,
    );
    if (result == null) return const [];

    return [
      for (final PlatformFile file in result.files)
        if (file.bytes != null && file.extension != null)
          (
            bytes: file.bytes!,
            extension: '.${file.extension}',
          ),
    ];
  }

  /// Prompts the user to pick a PDF to import.
  /// Returns whether a PDF was picked.
  Future<bool> importPdf() async {
    if (coreInfo.readOnly) return false;
    if (!Editor.canRasterPdf) return false;

    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
      withData: false,
    );
    if (result == null) return false;

    final PlatformFile file = result.files.single;
    return importPdfFromFilePath(file.path!);
  }

  Future<bool> importPdfFromFilePath(String path) async{
    final File tempFile = File(path);
    final Uint8List pdfBytes;
    try {
      pdfBytes = await tempFile.readAsBytes();
    } catch (e) {
      log.severe('Failed to read file when importing $path: $e', e);
      return false;
    }

    final emptyPage = coreInfo.pages.removeLast();
    assert(emptyPage.isEmpty);

    final raster = Printing.raster(
      pdfBytes,
      dpi: 1,
    );

    int currentPdfPage = -1;
    await for (final pdfPage in raster) {
      ++currentPdfPage;
      assert(currentPdfPage >= 0);

      // resize to [defaultWidth] to keep pen sizes consistent
      final pageSize = Size(
        EditorPage.defaultWidth,
        EditorPage.defaultWidth * pdfPage.height / pdfPage.width,
      );

      final page = EditorPage(
        width: pageSize.width,
        height: pageSize.height,
      );
      page.backgroundImage = PdfEditorImage(
        id: coreInfo.nextImageId++,
        pdfBytes: pdfBytes,
        pdfPage: currentPdfPage,
        pageIndex: coreInfo.pages.length,
        pageSize: pageSize,
        naturalSize: Size(pdfPage.width.toDouble(), pdfPage.height.toDouble()),
        onMoveImage: onMoveImage,
        onDeleteImage: onDeleteImage,
        onMiscChange: autosaveAfterDelay,
        onLoad: () => setState(() {}),
      );
      coreInfo.pages.add(page);
      history.recordChange(EditorHistoryItem(
        type: EditorHistoryItemType.insertPage,
        pageIndex: coreInfo.pages.length - 1,
        strokes: const [],
        images: const [],
        page: page,
      ));

      if (currentPdfPage == 0) {
        // update ui after we've rastered the first page
        // so that the user has some indication that the import is working
        setState(() {});
      }
    }

    coreInfo.pages.add(emptyPage);
    setState(() {});

    autosaveAfterDelay();

    return true;
  }

  Future paste() async {
    /// Maps image formats to their file extension.
    const Map<SimpleFileFormat, String> formats = {
      Formats.jpeg: '.jpeg',
      Formats.png: '.png',
      Formats.gif: '.gif',
      Formats.tiff: '.tiff',
      Formats.bmp: '.bmp',
      Formats.ico: '.ico',

      Formats.svg: '.svg',

      Formats.webp: '.webp',
    };

    final reader = await ClipboardReader.readClipboard();
    final List<_PhotoInfo> photoInfos = [];
    final List<ReadProgress> progresses = [];

    for (SimpleFileFormat format in formats.keys) {
      if (!reader.canProvide(format)) continue;
      final progress = reader.getFile(
        format,
        (file) async {
          final stream = file.getStream();
          final List<int> bytes = [];
          await for (final chunk in stream) {
            bytes.addAll(chunk);
          }
          if (bytes.isEmpty) {
            log.warning('Pasted empty file: $file (${formats[format]})');
            return;
          }

          String extension;
          if (file.fileName != null) {
            extension = file.fileName!.substring(file.fileName!.lastIndexOf('.'));
          } else {
            extension = formats[format]!;
          }

          photoInfos.add((
            bytes: Uint8List.fromList(bytes),
            extension: extension,
          ));
        },
      );
      if (progress != null) progresses.add(progress);
    }

    while (progresses.isNotEmpty) {
      progresses.removeWhere((progress) => progress.fraction.value == 1);
      await Future.delayed(const Duration(milliseconds: 50));
    }

    await _pickPhotos(photoInfos);
  }

  Future exportAsPdf() async {
    final pdf = await EditorExporter.generatePdf(coreInfo, context);
    await FileManager.exportFile('$_filename.pdf', await pdf.save());
  }
  Future exportAsSbn() async {
    final content = _saveToBinary();
    await FileManager.exportFile('$_filename${Editor.extension}', content);
  }

  void setAndroidNavBarColor() async {
    if (coreInfo.filePath.isEmpty) return; // not loaded yet

    final theme = Theme.of(context);

    // whiteboard on mobile should keep home screen navbar color
    if (coreInfo.filePath == Whiteboard.filePath && !ResponsiveNavbar.isLargeScreen) {
      return ResponsiveNavbar.setAndroidNavBarColor(theme);
    }

    await null;
    if (!mounted) return;

    final brightness = theme.brightness;
    final otherBrightness = brightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;
    final overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;

    SystemChrome.setSystemUIOverlayStyle(overlayStyle.copyWith(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: otherBrightness,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final platform = Theme.of(context).platform;
    final cupertino = platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;
    final isToolbarVertical = Prefs.editorToolbarAlignment.value == AxisDirection.left
        || Prefs.editorToolbarAlignment.value == AxisDirection.right;

    setAndroidNavBarColor();

    final Widget canvas = CanvasGestureDetector(
      key: _canvasGestureDetectorKey,

      filePath: coreInfo.filePath,

      isDrawGesture: isDrawGesture,
      onInteractionEnd: onInteractionEnd,
      onDrawStart: onDrawStart,
      onDrawUpdate: onDrawUpdate,
      onDrawEnd: onDrawEnd,
      onStylusButtonChanged: onStylusButtonChanged,
      onPressureChanged: onPressureChanged,

      undo: undo,
      redo: redo,

      pages: coreInfo.pages,
      initialPageIndex: coreInfo.initialPageIndex,
      pageBuilder: (BuildContext context, int pageIndex) {
        final page = coreInfo.pages[pageIndex];
        final currentStroke = Pen.currentStroke?.pageIndex == pageIndex
            ? Pen.currentStroke
            : null;
        return Canvas(
          path: coreInfo.filePath,
          page: page,
          pageIndex: pageIndex,
          textEditing: currentTool == Tool.textEditing,
          coreInfo: coreInfo,
          currentStroke: currentStroke,
          currentStrokeDetectedShape: currentTool is ShapePen && currentStroke != null
              ? ShapePen.detectedShape
              : null,
          currentSelection: () {
            if (currentTool is! Select) return null;
            final selectResult = (currentTool as Select).selectResult;
            if (selectResult.pageIndex != pageIndex) return null;
            return selectResult;
          }(),
          setAsBackground: (EditorImage image) {
            if (page.backgroundImage != null) {
              // restore previous background image as normal image
              page.images.add(page.backgroundImage!);
            }
            page.images.remove(image);
            page.backgroundImage = image;

            CanvasImage.activeListener.notifyListenersPlease(); // un-select active image

            autosaveAfterDelay();
            setState(() {});
          },
          currentToolIsSelect: currentTool is Select,
        );
      },
      placeholderPageBuilder: (BuildContext context, int pageIndex) {
        return Canvas(
          path: coreInfo.filePath,
          page: coreInfo.pages[pageIndex],
          pageIndex: 0,
          textEditing: false,
          coreInfo: EditorCoreInfo.empty,
          currentStroke: null,
          currentStrokeDetectedShape: null,
          currentSelection: null,
          placeholder: true,
          setAsBackground: null,
          currentToolIsSelect: currentTool is Select,
        );
      },

      transformationController: _transformationController,
    );

    final Widget? readonlyBanner = coreInfo.readOnlyBecauseOfVersion ? Collapsible(
      collapsed: !(coreInfo.readOnly && coreInfo.readOnlyBecauseOfVersion),
      axis: CollapsibleAxis.vertical,
      child: SafeArea(
        child: ListTile(
          onTap: askUserToDisableReadOnly,
          title: Text(t.editor.newerFileFormat.readOnlyMode),
          subtitle: Text(t.editor.newerFileFormat.title),
          trailing: const Icon(Icons.edit_off),
        ),
      ),
    ) : null;

    final Widget toolbar = Collapsible(
      axis: isToolbarVertical ? CollapsibleAxis.horizontal : CollapsibleAxis.vertical,
      collapsed: DynamicMaterialApp.isFullscreen && !Prefs.editorToolbarShowInFullscreen.value,
      maintainState: true,
      child: SafeArea(
        bottom: Prefs.editorToolbarAlignment.value != AxisDirection.up,
        child: Toolbar(
          readOnly: coreInfo.readOnly,

          setTool: (tool) {
            setState(() {
              if (tool is Eraser) {
                // setTool(Eraser) is called to toggle eraser
                if (currentTool is Eraser && tmpTool != null) {
                  // switch to previous tool
                  tool = tmpTool!;
                  tmpTool = null;
                } else {
                  // store previous tool to restore it later
                  tmpTool = currentTool;
                }
              }

              currentTool = tool;

              if (currentTool is Highlighter) {
                Highlighter.currentHighlighter = currentTool as Highlighter;
              } else if (currentTool is Pen) {
                Pen.currentPen = currentTool as Pen;
              }
            });
          },
          currentTool: currentTool,
          duplicateSelection: () {
            final select = currentTool as Select;
            if (!select.doneSelecting) return;

            setState(() {
              final page = coreInfo.pages[select.selectResult.pageIndex];
              final strokes = select.selectResult.strokes;
              final images = select.selectResult.images;

              const duplicationFeedbackOffset = Offset(25, -25);

              final duplicatedStrokes = strokes
                  .map((stroke) {
                    return stroke.copy()
                      ..shift(duplicationFeedbackOffset);
                  })
                  .toList();

              final duplicatedImages = images
                  .map((image) {
                    return image.copy()
                      ..id = coreInfo.nextImageId++
                      ..dstRect.shift(duplicationFeedbackOffset);
                  })
                  .toList();

              page.strokes.addAll(duplicatedStrokes);
              page.images.addAll(duplicatedImages);

              select.selectResult = select.selectResult.copyWith(
                strokes: duplicatedStrokes,
                images: duplicatedImages,
                path: select.selectResult.path.shift(duplicationFeedbackOffset),
              );

              history.recordChange(EditorHistoryItem(
                type: EditorHistoryItemType.draw,
                pageIndex: select.selectResult.pageIndex,
                strokes: duplicatedStrokes,
                images: duplicatedImages,
              ));
              autosaveAfterDelay();
            });
          },
          deleteSelection: () {
            final select = currentTool as Select;
            if (!select.doneSelecting) {
              return;
            }

            setState(() {
              final page = coreInfo.pages[select.selectResult.pageIndex];
              final strokes = select.selectResult.strokes;
              final images = select.selectResult.images;

              for (Stroke stroke in strokes) {
                page.strokes.remove(stroke);
              }
              for (EditorImage image in images) {
                page.images.remove(image);
              }

              select.unselect();

              history.recordChange(EditorHistoryItem(
                type: EditorHistoryItemType.erase,
                pageIndex: strokes.first.pageIndex,
                strokes: strokes,
                images: images,
              ));
              autosaveAfterDelay();
            });
          },
          setColor: (color) {
            setState(() {
              updateColorBar(color);

              if (currentTool is Highlighter) {
                (currentTool as Highlighter).strokeProperties.color = color.withAlpha(Highlighter.alpha);
              } else if (currentTool is Pen) {
                (currentTool as Pen).strokeProperties.color = color;
              } else if (currentTool is Select) { // Changes color of selected strokes
                final select = currentTool as Select;
                if (select.doneSelecting) {
                  final strokes = select.selectResult.strokes;
                  
                  Map<Stroke, ColorChange> colorChange = {};
                  for (Stroke stroke in strokes) {
                    colorChange[stroke] = ColorChange(previous: stroke.strokeProperties.color, current: color);
                    stroke.strokeProperties.color = color;
                  }

                  history.recordChange(EditorHistoryItem(
                    type: EditorHistoryItemType.changeColor,
                    pageIndex: strokes.first.pageIndex,
                    strokes: strokes,
                    colorChange: colorChange,
                    images: [],
                  ));
                  autosaveAfterDelay();
                }
              }
            });
          },

          quillFocus: quillFocus,
          textEditing: currentTool == Tool.textEditing,
          toggleTextEditing: () => setState(() {
            if (currentTool == Tool.textEditing) {
              currentTool = Pen.currentPen;
              for (EditorPage page in coreInfo.pages) {
                // unselect text, but maintain cursor position
                page.quill.controller.moveCursorToPosition(page.quill.controller.selection.extentOffset);
                page.quill.focusNode.unfocus();
              }
            } else {
              currentTool = Tool.textEditing;
              quillFocus.value = coreInfo.pages[currentPageIndex].quill
                  ..focusNode.requestFocus();
            }
          }),

          undo: undo,
          isUndoPossible: history.canUndo,
          redo: redo,
          isRedoPossible: history.canRedo,
          toggleFingerDrawing: () {
            setState(() {
              Prefs.editorFingerDrawing.value = !Prefs.editorFingerDrawing.value;
              lastSeenPointerCount = 0;
            });
          },

          pickPhoto: _pickPhotos,
          paste: paste,

          exportAsSbn: exportAsSbn,
          exportAsPdf: exportAsPdf,
          exportAsPng: null,
        ),
      ),
    );

    final Widget body;
    if (isToolbarVertical) {
      body = Row(
        textDirection: Prefs.editorToolbarAlignment.value == AxisDirection.left ? TextDirection.ltr : TextDirection.rtl,
        children: [
          toolbar,
          Expanded(child: Column(
            children: [
              Expanded(child: canvas),
              if (readonlyBanner != null) readonlyBanner,
            ],
          )),
        ],
      );
    } else {
      body = Column(
        verticalDirection: Prefs.editorToolbarAlignment.value == AxisDirection.up ? VerticalDirection.up : VerticalDirection.down,
        children: [
          Expanded(child: canvas),
          toolbar,
          if (readonlyBanner != null) readonlyBanner,
        ],
      );
    }

    return WillPopScope(
      // don't allow user to go back until saving is done
      onWillPop: () async => switch (savingState.value) {
        SavingState.waitingToSave => (){
          saveToFile(); // trigger save now
          snackBarNeedsToSaveBeforeExiting();
          return false;
        }(),
        SavingState.saving => (){
          snackBarNeedsToSaveBeforeExiting();
          return false;
        }(),
        SavingState.saved => true,
      },
      child: Scaffold(
        appBar: DynamicMaterialApp.isFullscreen ? null : AppBar(
          toolbarHeight: kToolbarHeight,
          title: widget.customTitle != null ? Text(widget.customTitle!) : TextField(
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            controller: filenameTextEditingController,
            onChanged: renameFile,
            autofocus: needsNaming,
          ),
          leading: SaveIndicator(
            savingState: savingState,
            triggerSave: saveToFile,
          ),
          actions: [
            IconButton(
              icon: const AdaptiveIcon(
                icon: Icons.insert_page_break,
                cupertinoIcon: CupertinoIcons.add,
              ),
              tooltip: t.editor.menu.insertPage,
              onPressed: () => setState(() {
                final currentPageIndex = this.currentPageIndex;
                insertPageAfter(currentPageIndex);
                CanvasGestureDetector.scrollToPage(
                  pageIndex: currentPageIndex + 1,
                  pages: coreInfo.pages,
                  screenWidth: MediaQuery.of(context).size.width,
                  transformationController: _transformationController,
                );
              }),
            ),
            IconButton(
              icon: const AdaptiveIcon(
                icon: Icons.grid_view,
                cupertinoIcon: CupertinoIcons.rectangle_grid_2x2,
              ),
              tooltip: t.editor.pages,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AdaptiveAlertDialog(
                    title: Text(t.editor.pages),
                    content: pageManager(context),
                    actions: const [],
                  ),
                );
              },
            ),
            IconButton(
              icon: const AdaptiveIcon(
                icon: Icons.more_vert,
                cupertinoIcon: CupertinoIcons.ellipsis_vertical,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => bottomSheet(context),
                  isScrollControlled: true,
                  showDragHandle: true,
                  backgroundColor: colorScheme.surface,
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                  ),
                );
              },
            )
          ],
        ),
        body: body,
        floatingActionButton: (DynamicMaterialApp.isFullscreen && !Prefs.editorToolbarShowInFullscreen.value) ? FloatingActionButton(
          shape: cupertino ? const CircleBorder() : null,
          onPressed: () {
            DynamicMaterialApp.setFullscreen(false, updateSystem: true);
          },
          child: const Icon(Icons.fullscreen_exit),
        ) : null,
      ),
    );
  }

  void snackBarNeedsToSaveBeforeExiting() {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(t.editor.needsToSaveBeforeExiting),
    ));
  }

  Widget bottomSheet(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final bool invert = Prefs.editorAutoInvert.value && brightness == Brightness.dark;
    final int currentPageIndex = this.currentPageIndex;

    return EditorBottomSheet(
      invert: invert,
      coreInfo: coreInfo,
      currentPageIndex: currentPageIndex,
      setBackgroundPattern: (pattern) => setState(() {
        if (coreInfo.readOnly) return;
        coreInfo.backgroundPattern = pattern;
        Prefs.lastBackgroundPattern.value = pattern;
        autosaveAfterDelay();
      }),
      setLineHeight: (lineHeight) => setState(() {
        if (coreInfo.readOnly) return;
        coreInfo.lineHeight = lineHeight;
        Prefs.lastLineHeight.value = lineHeight;
        autosaveAfterDelay();
      }),
      removeBackgroundImage: () => setState(() {
        if (coreInfo.readOnly) return;

        final page = coreInfo.pages[currentPageIndex];
        if (page.backgroundImage == null) return;
        page.images.add(page.backgroundImage!);
        page.backgroundImage = null;

        autosaveAfterDelay();
      }),
      redrawImage: () => setState(() {}),
      clearPage: () {
        clearPage(currentPageIndex);
      },

      clearAllPages: clearAllPages,

      redrawAndSave: () => setState(() {
        if (coreInfo.readOnly) return;
        autosaveAfterDelay();
      }),

      pickPhotos: _pickPhotos,
      importPdf: importPdf,
      canRasterPdf: Editor.canRasterPdf,
    );
  }

  Widget pageManager(BuildContext context) {
    return EditorPageManager(
      coreInfo: coreInfo,
      currentPageIndex: currentPageIndex,
      redrawAndSave: () => setState(() {
        if (coreInfo.readOnly) return;
        autosaveAfterDelay();
      }),
      insertPageAfter: insertPageAfter,
      duplicatePage: (int pageIndex) => setState(() {
        if (coreInfo.readOnly) return;
        final page = coreInfo.pages[pageIndex];
        final newPage = page.copyWith(
          strokes: page.strokes
              .map((stroke) => stroke.copy()..pageIndex += 1)
              .toList(),
          images: page.images
              .map((image) => image.copy()..pageIndex += 1)
              .toList(),
          quill: QuillStruct(
            controller: flutter_quill.QuillController(
              document: flutter_quill.Document.fromDelta(
                page.quill.controller.document.toDelta()
              ),
              selection: const TextSelection.collapsed(offset: 0),
            ),
            focusNode: FocusNode(debugLabel: 'Quill Focus Node'),
          ),
          backgroundImage: page.backgroundImage?.copy()?..pageIndex += 1,
        );
        coreInfo.pages.insert(pageIndex + 1, newPage);
        listenToQuillChanges(newPage.quill, pageIndex + 1);
        history.recordChange(EditorHistoryItem(
          type: EditorHistoryItemType.insertPage,
          pageIndex: pageIndex,
          strokes: const [],
          images: const [],
          page: newPage,
        ));
        autosaveAfterDelay();
      }),
      clearPage: clearPage,
      deletePage: (int pageIndex) => setState(() {
        if (coreInfo.readOnly) return;
        final page = coreInfo.pages.removeAt(pageIndex);
        createPage(pageIndex - 1);
        history.recordChange(EditorHistoryItem(
          type: EditorHistoryItemType.deletePage,
          pageIndex: pageIndex,
          strokes: const [],
          images: const [],
          page: page,
        ));
        autosaveAfterDelay();
      }),
      transformationController: _transformationController,
    );
  }

  void insertPageAfter(int pageIndex) => setState(() {
    if (coreInfo.readOnly) return;
    final page = EditorPage();
    coreInfo.pages.insert(pageIndex + 1, page);
    listenToQuillChanges(page.quill, pageIndex + 1);
    history.recordChange(EditorHistoryItem(
      type: EditorHistoryItemType.insertPage,
      pageIndex: pageIndex + 1,
      strokes: const [],
      images: const [],
      page: page,
    ));
    autosaveAfterDelay();
  });

  void clearPage(int pageIndex) {
    if (coreInfo.readOnly) return;
    final page = coreInfo.pages[pageIndex];
    setState(() {
      List<Stroke> removedStrokes = page.strokes.toList();
      List<EditorImage> removedImages = page.images.toList();
      page.strokes.clear();
      page.images.clear();
      removeExcessPages();
      history.recordChange(EditorHistoryItem(
        type: EditorHistoryItemType.erase,
        pageIndex: pageIndex,
        strokes: removedStrokes,
        images: removedImages,
      ));
      autosaveAfterDelay();
    });
  }
  void clearAllPages() {
    if (coreInfo.readOnly) return;
    setState(() {
      List<Stroke> removedStrokes = [];
      List<EditorImage> removedImages = [];
      for (final page in coreInfo.pages) {
        removedStrokes.addAll(page.strokes);
        removedImages.addAll(page.images);
        page.strokes.clear();
        page.images.clear();
      }
      removeExcessPages();
      history.recordChange(EditorHistoryItem(
        type: EditorHistoryItemType.erase,
        pageIndex: 0,
        strokes: removedStrokes,
        images: removedImages,
      ));
    });
    autosaveAfterDelay();
  }

  Future askUserToDisableReadOnly() async {
    bool disableReadOnly = await showDialog(
      context: context,
      builder: (context) => AdaptiveAlertDialog(
        title: Text(t.editor.newerFileFormat.title),
        content: Text(t.editor.newerFileFormat.subtitle),
        actions: [
          CupertinoDialogAction(
            child: Text(t.editor.newerFileFormat.cancel),
            onPressed: () => Navigator.pop(context, false),
          ),
          CupertinoDialogAction(
            child: Text(t.editor.newerFileFormat.allowEditing),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    ) ?? false;

    if (!mounted) return;
    if (!disableReadOnly) return;

    setState(() {
      coreInfo.readOnly = false;
    });
  }

  late int _lastCurrentPageIndex = coreInfo.initialPageIndex ?? 0;
  /// The index of the page that is currently centered on screen.
  int get currentPageIndex {
    if (!mounted) return _lastCurrentPageIndex;

    final screenWidth = MediaQuery.of(context).size.width;

    return _lastCurrentPageIndex = getPageIndexFromScrollPosition(
      scrollY: -scrollY,
      screenWidth: screenWidth,
      pages: coreInfo.pages,
    );
  }
  @visibleForTesting
  static int getPageIndexFromScrollPosition({
    required double scrollY,
    required double screenWidth,
    required List<EditorPage> pages,
  }) {
    for (int pageIndex = 0; pageIndex < pages.length; pageIndex++) {
      final bottomOfPage = CanvasGestureDetector.getTopOfPage(
        pageIndex: pageIndex + 1, // top of next page
        pages: pages,
        screenWidth: screenWidth,
      );

      if (scrollY < bottomOfPage) {
        return pageIndex;
      }
    }
    // below the last page
    return pages.length - 1;
  }

  @override
  void dispose() {
    (() async {
      if (_renameTimer?.isActive ?? false) {
        _renameTimer!.cancel();
        await _renameFileNow(filenameTextEditingController.text);
        filenameTextEditingController.dispose();
      }
      await saveToFile();
    })();

    DynamicMaterialApp.removeFullscreenListener(_setState);

    _delayedSaveTimer?.cancel();
    _lastSeenPointerCountTimer?.cancel();

    _removeKeybindings();

    for (EditorPage page in coreInfo.pages) {
      page.dispose();
    }

    // manually save pen properties since the listeners don't fire if a property is changed
    Prefs.lastFountainPenProperties.notifyListeners();
    Prefs.lastBallpointPenProperties.notifyListeners();
    Prefs.lastHighlighterProperties.notifyListeners();

    super.dispose();
  }
}
