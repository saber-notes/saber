import 'dart:convert';
import 'dart:async';

import 'package:collapsible/collapsible.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:keybinder/keybinder.dart';
import 'package:printing/printing.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_svg_editor_image.dart';
import 'package:saber/components/canvas/canvas_gesture_detector.dart';
import 'package:saber/components/canvas/canvas_image.dart';
import 'package:saber/components/canvas/tools/_tool.dart';
import 'package:saber/components/canvas/tools/eraser.dart';
import 'package:saber/components/canvas/tools/highlighter.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/components/canvas/tools/select.dart';
import 'package:saber/components/home/preview_card.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/components/toolbar/editor_bottom_sheet.dart';
import 'package:saber/components/toolbar/editor_page_manager.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/editor_exporter.dart';
import 'package:saber/data/editor/editor_history.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';

import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/toolbar/toolbar.dart';
import 'package:saber/components/canvas/canvas.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/home/whiteboard.dart';

class Editor extends StatefulWidget {
  Editor({
    super.key,
    String? path,
    this.customTitle,
  }) : initialPath = path != null ? Future.value(path) : FileManager.newFilePath("/"),
        needsNaming = path == null;

  final Future<String> initialPath;
  final bool needsNaming;

  final String? customTitle;

  static const String extension = '.sbn';
  /// Hidden files used by other functions of the app
  static List<String> reservedFileNames = [Whiteboard.filePath];

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  late EditorCoreInfo coreInfo = EditorCoreInfo(filePath: "");

  EditorHistory history = EditorHistory();

  late bool needsNaming = widget.needsNaming && Prefs.editorPromptRename.value;

  Tool currentTool = Pen.currentPen;

  /// Whether the note has changed since it was last saved
  bool _hasEdited = false;
  Timer? _delayedSaveTimer;

  // used to prevent accidentally drawing when pinch zooming
  int lastSeenPointerCount = 0;
  Timer? _lastSeenPointerCountTimer;

  QuillStruct? lastFocusedQuill;

  /// Whether the platform can rasterize a pdf
  bool canRasterPdf = true;

  @override
  void initState() {
    DynamicMaterialApp.addFullscreenListener(_setState);

    _initAsync();
    _assignKeybindings();

    Printing.info().then((info) {
      canRasterPdf = info.canRaster;
    });

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
  }
  Future _initStrokes() async {
    coreInfo = await EditorCoreInfo.loadFromFilePath(coreInfo.filePath);
    if (coreInfo.readOnly) {
      if (kDebugMode) print("Loaded file as read-only");
    }

    for (int pageIndex = 0; pageIndex < coreInfo.pages.length; pageIndex++) {
      listenToQuillChanges(coreInfo.pages[pageIndex].quill, pageIndex);
    }

    if (coreInfo.isEmpty) {
      createPage(-1);
    } else {
      for (EditorPage page in coreInfo.pages) {
        for (EditorImage image in page.images) {
          image.onMoveImage = onMoveImage;
          image.onDeleteImage = onDeleteImage;
          image.onMiscChange = autosaveAfterDelay;
        }
      }
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

  Keybinding? _ctrlZ;
  Keybinding? _ctrlY;
  Keybinding? _ctrlShiftZ;
  _assignKeybindings() {
    _ctrlZ = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyZ)], inclusive: true);
    _ctrlY = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.keyY)], inclusive: true);
    _ctrlShiftZ = Keybinding([KeyCode.ctrl, KeyCode.shift, KeyCode.from(LogicalKeyboardKey.keyZ)], inclusive: true);

    Keybinder.bind(_ctrlZ!, undo);
    Keybinder.bind(_ctrlY!, redo);
    Keybinder.bind(_ctrlShiftZ!, redo);
  }
  _removeKeybindings() {
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
    // remove excess pages if all pages >= this one are empty
    for (int i = coreInfo.pages.length - 1; i >= 1; --i) {
      final thisPage = coreInfo.pages[i];
      final prevPage = coreInfo.pages[i - 1];
      if (thisPage.isEmpty && prevPage.isEmpty) {
        EditorPage page = coreInfo.pages.removeAt(i);
        page.dispose();
      } else {
        break;
      }
    }
  }

  undo([EditorHistoryItem? item]) {
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
      if (item!.type == EditorHistoryItemType.draw) { // undo draw
        for (Stroke stroke in item.strokes) {
          coreInfo.pages[stroke.pageIndex].strokes.remove(stroke);
        }
        for (EditorImage image in item.images) {
          coreInfo.pages[image.pageIndex].images.remove(image);
        }
        removeExcessPages();
      } else if (item.type == EditorHistoryItemType.erase) { // undo erase
        for (Stroke stroke in item.strokes) {
          createPage(stroke.pageIndex);
          coreInfo.pages[stroke.pageIndex].insertStroke(stroke);
        }
        for (EditorImage image in item.images) {
          createPage(image.pageIndex);
          coreInfo.pages[image.pageIndex].images.add(image);
          image.newImage = true;
        }
      } else if (item.type == EditorHistoryItemType.move) { // undo move
        assert(item.offset != null);
        for (Stroke stroke in item.strokes) {
          stroke.offset -= Offset(
            item.offset!.left,
            item.offset!.top,
          );
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
      } else {
        throw Exception('Unknown history item type: ${item.type}');
      }

      if (item.type != EditorHistoryItemType.move) {
        Select.currentSelect.unselect();
      }
    });

    autosaveAfterDelay();
  }

  redo() {
    if (!history.canRedo) return;
    EditorHistoryItem item = history.redo();

    if (item.type == EditorHistoryItemType.draw) { // redo draw
      undo(item.copyWith(type: EditorHistoryItemType.erase));
    } else if (item.type == EditorHistoryItemType.erase) { // redo erase
      undo(item.copyWith(type: EditorHistoryItemType.draw));
    } else if (item.type == EditorHistoryItemType.move) { // redo move
      assert(item.offset != null);
      undo(item.copyWith(offset: Rect.fromLTRB(
        -item.offset!.left,
        -item.offset!.top,
        -item.offset!.right,
        -item.offset!.bottom,
      )));
    } else {
      throw Exception('Unknown history item type: ${item.type}');
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
  /// if [pressureWasNegative], switch back to pen when pressure becomes positive again
  bool pressureWasNegative = false;
  bool isDrawGesture(ScaleStartDetails details) {
    if (coreInfo.readOnly) return false;

    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    CanvasImage.activeListener.notifyListeners(); // un-select active image

    _lastSeenPointerCountTimer?.cancel();
    if (lastSeenPointerCount >= 2) { // was a zoom gesture, ignore
      lastSeenPointerCount = lastSeenPointerCount;
      return false;
    } else if (details.pointerCount >= 2) { // is a zoom gesture, remove accidental stroke
      if (lastSeenPointerCount == 1 && Prefs.editorFingerDrawing.value) {
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

    if (Prefs.editorFingerDrawing.value || currentPressure != null) {
      return true;
    } else if (currentTool == Tool.textEditing) {
      return true;
    } else {
      if (kDebugMode) print("Non-stylus found, rejected stroke");
      return false;
    }
  }
  onDrawStart(ScaleStartDetails details) {
    final page = coreInfo.pages[dragPageIndex!];
    final position = page.renderBox!.globalToLocal(details.focalPoint);
    history.canRedo = false;

    if (currentTool is Pen) {
      (currentTool as Pen).onDragStart(page.size, position, dragPageIndex!, currentPressure);
    } else if (currentTool is Eraser) {
      for (int i in (currentTool as Eraser).checkForOverlappingStrokes(position, page.strokes).reversed) {
        page.strokes.removeAt(i);
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
    }

    previousPosition = position;
    moveOffset = Offset.zero;

    if (currentTool is! Select) {
      Select.currentSelect.unselect();
    }

    // setState to let canvas know about currentStroke
    setState(() {});
  }
  onDrawUpdate(ScaleUpdateDetails details) {
    final page = coreInfo.pages[dragPageIndex!];
    final position = page.renderBox!.globalToLocal(details.focalPoint);
    final offset = position - previousPosition;
    if (currentTool is Pen) {
      (currentTool as Pen).onDragUpdate(page.size, position, currentPressure, page.redrawStrokes);
      page.redrawStrokes();
    } else if (currentTool is Eraser) {
      for (int i in (currentTool as Eraser).checkForOverlappingStrokes(position, page.strokes).reversed) {
        page.strokes.removeAt(i);
      }
      page.redrawStrokes();
      removeExcessPages();
    } else if (currentTool is Select) {
      Select select = currentTool as Select;
      if (select.doneSelecting) {
        for (int i in select.selectResult.indices) {
          page.strokes[i].offset += offset;
        }
        select.selectResult.path = select.selectResult.path.shift(offset);
      } else {
        select.onDragUpdate(position);
      }
      page.redrawStrokes();
    }
    previousPosition = position;
    moveOffset += offset;
  }
  onDrawEnd(ScaleEndDetails details) {
    final page = coreInfo.pages[dragPageIndex!];
    setState(() {
      if (currentTool is Pen) {
        Stroke newStroke = (currentTool as Pen).onDragEnd();
        createPage(newStroke.pageIndex);
        page.insertStroke(newStroke);
        history.recordChange(EditorHistoryItem(
          type: EditorHistoryItemType.draw,
          strokes: [newStroke],
          images: [],
        ));
      } else if (currentTool is Eraser) {
        history.recordChange(EditorHistoryItem(
          type: EditorHistoryItemType.erase,
          strokes: (currentTool as Eraser).onDragEnd(),
          images: [],
        ));
      } else if (currentTool is Select) {
        Select select = currentTool as Select;
        if (select.doneSelecting) {
          history.recordChange(EditorHistoryItem(
            type: EditorHistoryItemType.move,
            strokes: select.selectResult.indices
              .map((i) => page.strokes[i])
              .toList(),
            images: [],
            offset: Rect.fromLTRB(
              moveOffset.dx,
              moveOffset.dy,
              0,
              0,
            ),
          ));
        } else {
          select.onDragEnd(page.strokes);
        }
      }
    });
    autosaveAfterDelay();

    if (pressureWasNegative) {
      pressureWasNegative = false;
      currentTool = Pen.currentPen;
    }
  }
  onInteractionEnd(ScaleEndDetails details) {
    // reset after 1ms to keep track of the same gesture only
    _lastSeenPointerCountTimer?.cancel();
    _lastSeenPointerCountTimer = Timer(const Duration(milliseconds: 10), () {
      lastSeenPointerCount = 0;
    });
  }
  onPressureChanged(double? pressure) {
    currentPressure = pressure == 0.0 ? null : pressure;
    if (currentPressure == null) return;

    if (currentPressure! < 0) {
      pressureWasNegative = true;
      currentTool = Eraser();
    }
  }

  onMoveImage(EditorImage image, Rect offset) {
    history.recordChange(EditorHistoryItem(
      type: EditorHistoryItemType.move,
      strokes: [],
      images: [image],
      offset: offset,
    ));
    // setState to update undo button
    setState(() {});
    autosaveAfterDelay();
  }
  onDeleteImage(EditorImage image) {
    history.recordChange(EditorHistoryItem(
      type: EditorHistoryItemType.erase,
      strokes: [],
      images: [image],
    ));
    setState(() {
      coreInfo.pages[image.pageIndex].images.remove(image);
    });
    autosaveAfterDelay();
  }

  listenToQuillChanges(QuillStruct quill, int pageIndex) {
    quill.changeSubscription?.cancel();
    quill.changeSubscription = quill.controller.changes.listen((event) {
      onQuillChange(pageIndex);
    });
  }
  onQuillChange(int pageIndex) {
    createPage(pageIndex); // create empty last page
    autosaveAfterDelay();
  }

  autosaveAfterDelay() {
    _hasEdited = true;
    _delayedSaveTimer?.cancel();
    _delayedSaveTimer = Timer(const Duration(milliseconds: 1000), () {
      saveToFile();
    });
  }


  String get _filename => coreInfo.filePath.substring(coreInfo.filePath.lastIndexOf('/') + 1);
  String _saveToString() {
    coreInfo.initialPageIndex = currentPageIndex ?? coreInfo.initialPageIndex;
    return json.encode(coreInfo);
  }
  Future<void> saveToFile() async {
    if (coreInfo.readOnly) return;

    // avoid saving if nothing has changed
    if (!_hasEdited) return;

    String toSave = _saveToString();
    try {
      _hasEdited = false;
      await FileManager.writeFile(coreInfo.filePath + Editor.extension, toSave, awaitWrite: true);
    } catch (e) {
      _hasEdited = true;
      if (kDebugMode) rethrow;
    }
  }


  late final filenameTextEditingController = TextEditingController();
  Timer? _renameTimer;
  void renameFile(String newName) {
    _renameTimer?.cancel();

    if (newName.contains("/") || newName.isEmpty) { // if invalid name, don't rename
      _renameTimer = Timer(const Duration(milliseconds: 5000), () {
        filenameTextEditingController.value = filenameTextEditingController.value.copyWith(
          text: _filename,
          selection: TextSelection.fromPosition(TextPosition(offset: _filename.length)),
          composing: TextRange.empty,
        );
      });
    } else { // rename after a delay
      _renameTimer = Timer(const Duration(milliseconds: 500), () {
        _renameFileNow(newName);
      });
    }
  }
  Future _renameFileNow(String newName) async {
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
    final String newColorString = color.value.toString();

    // migrate from old pref format
    if (Prefs.recentColorsChronological.value.length != Prefs.recentColorsPositioned.value.length) {
      if (kDebugMode) print("MIGRATING recentColors: ${Prefs.recentColorsChronological.value.length} vs ${Prefs.recentColorsPositioned.value.length}");
      Prefs.recentColorsChronological.value = List.of(Prefs.recentColorsPositioned.value);
    }

    if (Prefs.recentColorsPositioned.value.contains(newColorString)) {
      // if the color is already in the list, move it to the top
      Prefs.recentColorsChronological.value.remove(newColorString);
      Prefs.recentColorsChronological.value.add(newColorString);
      Prefs.recentColorsChronological.notifyListeners();
    } else {
      if (Prefs.recentColorsPositioned.value.length >= 5) {
        // if full, replace the oldest color with the new one
        final String removedColorString = Prefs.recentColorsChronological.value.removeAt(0);
        Prefs.recentColorsChronological.value.add(newColorString);
        final int removedColorPosition = Prefs.recentColorsPositioned.value.indexOf(removedColorString);
        Prefs.recentColorsPositioned.value[removedColorPosition] = newColorString;
      } else {
        // if not full, add the new color to the end
        Prefs.recentColorsChronological.value.add(newColorString);
        Prefs.recentColorsPositioned.value.add(newColorString);
      }
      Prefs.recentColorsChronological.notifyListeners();
      Prefs.recentColorsPositioned.notifyListeners();
    }
  }

  /// Prompts the user to pick photos from their device.
  /// Returns the number of photos picked.
  Future<int> pickPhotos() async {
    if (coreInfo.readOnly) return 0;

    final int? currentPageIndex = this.currentPageIndex;
    if (currentPageIndex == null) return 0;

    List<PhotoInfo> photoInfos = await _pickPhotosWithFilePicker();
    if (photoInfos.isEmpty) return 0;

    List<EditorImage> images = [
      for (final PhotoInfo photoInfo in photoInfos)
        if (photoInfo.extension == ".svg")
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
      strokes: [],
      images: images,
    ));
    coreInfo.pages[currentPageIndex].images.addAll(images);
    autosaveAfterDelay();

    return images.length;
  }

  Future<List<PhotoInfo>> _pickPhotosWithFilePicker() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["bmp", "gif", "jpeg", "jpg", "png", "svg"],
      allowMultiple: true,
      withData: true,
    );
    if (result == null) return const [];

    return [
      for (final PlatformFile file in result.files)
        if (file.bytes != null && file.extension != null)
          PhotoInfo(
            bytes: file.bytes!,
            extension: ".${file.extension}",
          ),
    ];
  }

  /// Prompts the user to pick a PDF to import.
  /// Returns whether a PDF was picked.
  Future<bool> importPdf() async {
    if (coreInfo.readOnly) return false;
    if (!canRasterPdf) return false;

    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["pdf"],
      allowMultiple: false,
      withData: true,
    );
    if (result == null) return false;

    final PlatformFile file = result.files.single;
    if (file.bytes == null) return false;

    final emptyPage = coreInfo.pages.removeLast();
    assert(emptyPage.isEmpty);

    await for (final pdfPage in Printing.raster(file.bytes!)) {
      final Uint8List imageBytes = await pdfPage.toPng();

      // resize to [defaultWidth] to keep pen sizes consistent
      final Size pageSize = Size(
        EditorPage.defaultWidth,
        EditorPage.defaultWidth * pdfPage.height / pdfPage.width,
      );

      final editorPage = EditorPage(
        width: pageSize.width,
        height: pageSize.height,
      );
      final image = EditorImage(
        id: coreInfo.nextImageId++,
        extension: ".png",
        bytes: imageBytes,
        pageIndex: coreInfo.pages.length,
        pageSize: pageSize,
        maxSize: const Size.square(3000), // allow pdf images to be big
        onMoveImage: onMoveImage,
        onDeleteImage: onDeleteImage,
        onMiscChange: autosaveAfterDelay,
        onLoad: () => setState(() {}),
      );
      coreInfo.pages.add(editorPage);
      editorPage.backgroundImage = image;
    }

    coreInfo.pages.add(emptyPage);

    // todo: add to history

    autosaveAfterDelay();

    return true;
  }

  Future exportAsPdf() async {
    final pdf = await EditorExporter.generatePdf(coreInfo, context);
    await FileManager.exportFile("$_filename.pdf", await pdf.save());
  }
  Future exportAsSbn() async {
    final content = _saveToString();
    final encoded = utf8.encode(content) as Uint8List;
    await FileManager.exportFile("$_filename.sbn", encoded);
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final cupertino = platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;

    final Widget body = Column(
      verticalDirection: Prefs.editorToolbarOnBottom.value ? VerticalDirection.down : VerticalDirection.up,
      children: [
        Expanded(
          child: CanvasGestureDetector(
            filePath: coreInfo.filePath,

            isDrawGesture: isDrawGesture,
            onInteractionEnd: onInteractionEnd,
            onDrawStart: onDrawStart,
            onDrawUpdate: onDrawUpdate,
            onDrawEnd: onDrawEnd,
            onPressureChanged: onPressureChanged,

            undo: undo,
            redo: redo,

            pages: coreInfo.pages,
            initialPageIndex: coreInfo.initialPageIndex,
            pageBuilder: (BuildContext context, int pageIndex) {
              final page = coreInfo.pages[pageIndex];
              return Canvas(
                path: coreInfo.filePath,
                page: page,
                pageIndex: pageIndex,
                textEditing: currentTool == Tool.textEditing,
                coreInfo: coreInfo,
                currentStroke: () {
                  Stroke? currentStroke = Pen.currentPen.currentStroke
                    ?? Highlighter.currentHighlighter.currentStroke;
                  return (currentStroke?.pageIndex == pageIndex) ? currentStroke : null;
                }(),
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

                  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
                  CanvasImage.activeListener.notifyListeners(); // un-select active image

                  autosaveAfterDelay();
                  setState(() {});
                },
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
                currentSelection: null,
                placeholder: true,
                setAsBackground: null,
              );
            },
          ),
        ),

        SafeArea(
          child: Collapsible(
            axis: CollapsibleAxis.vertical,
            collapsed: DynamicMaterialApp.isFullscreen && !Prefs.editorToolbarShowInFullscreen.value,
            maintainState: true,
            child: Toolbar(
              readOnly: coreInfo.readOnly,

              setTool: (tool) {
                setState(() {
                  currentTool = tool;

                  if (currentTool is Highlighter) {
                    Highlighter.currentHighlighter = currentTool as Highlighter;
                  } else if (currentTool is Pen) {
                    Pen.currentPen = currentTool as Pen;
                  }
                });
              },
              currentTool: currentTool,
              setColor: (color) {
                setState(() {
                  updateColorBar(color);

                  if (currentTool is Highlighter) {
                    (currentTool as Highlighter).strokeProperties.color = color.withAlpha(Highlighter.alpha);
                  } else if (currentTool is Pen) {
                    (currentTool as Pen).strokeProperties.color = color;
                  }
                });
              },

              getCurrentQuill: () {
                for (EditorPage page in coreInfo.pages) {
                  if (!page.quill.focusNode.hasFocus) continue;
                  lastFocusedQuill = page.quill;
                  return page.quill;
                }
                return lastFocusedQuill;
              },
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
                  int? pageIndex = currentPageIndex;
                  if (pageIndex != null) {
                    lastFocusedQuill = coreInfo.pages[pageIndex].quill;
                    lastFocusedQuill!.focusNode.requestFocus();
                  }
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

              pickPhoto: pickPhotos,

              exportAsSbn: exportAsSbn,
              exportAsPdf: exportAsPdf,
              exportAsPng: null,
            ),
          ),
        ),

        if (coreInfo.readOnlyBecauseOfVersion) Collapsible(
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
        )
      ],
    );

    return Scaffold(
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
        actions: [
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
                backgroundColor: Colors.transparent,
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
    );
  }

  Widget bottomSheet(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final bool invert = Prefs.editorAutoInvert.value && brightness == Brightness.dark;
    final int? currentPageIndex = this.currentPageIndex;

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
        if (currentPageIndex == null) return;

        final page = coreInfo.pages[currentPageIndex];
        if (page.backgroundImage == null) return;
        page.images.add(page.backgroundImage!);
        page.backgroundImage = null;

        autosaveAfterDelay();
      }),
      clearPage: () {
        if (coreInfo.readOnly) return;
        if (currentPageIndex == null) return;
        final page = coreInfo.pages[currentPageIndex];

        setState(() {
          List<Stroke> removedStrokes = page.strokes.toList();
          List<EditorImage> removedImages = page.images.toList();
          page.strokes.clear();
          page.images.clear();
          removeExcessPages();
          history.recordChange(EditorHistoryItem(
            type: EditorHistoryItemType.erase,
            strokes: removedStrokes,
            images: removedImages,
          ));
          autosaveAfterDelay();
        });
      },

      clearAllPages: clearAllPages,

      redrawAndSave: () => setState(() {
        if (coreInfo.readOnly) return;
        autosaveAfterDelay();
      }),

      pickPhotos: pickPhotos,
      importPdf: importPdf,
      canRasterPdf: canRasterPdf,
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
    );
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

  /// The index of the page that is currently centered on screen.
  int? get currentPageIndex {
    final Size windowSize = MediaQuery.of(context).size;
    late Offset centre = Offset(windowSize.width / 2, windowSize.height / 2);

    for (int pageIndex = 0; pageIndex < coreInfo.pages.length; ++pageIndex) {
      final page = coreInfo.pages[pageIndex];
      if (page.renderBox == null) continue;
      final localCenter = page.renderBox!.globalToLocal(centre);

      if (page.renderBox!.hitTest(BoxHitTestResult(), position: localCenter)) {
        return pageIndex;
      }
    }

    return null;
  }

  @override
  void dispose() {
    saveToFile();

    DynamicMaterialApp.removeFullscreenListener(_setState);

    _delayedSaveTimer?.cancel();
    _lastSeenPointerCountTimer?.cancel();
    filenameTextEditingController.dispose();

    _removeKeybindings();

    for (EditorPage page in coreInfo.pages) {
      page.dispose();

      // dispose of images' cache
      for (EditorImage image in page.images) {
        image.invertedBytesCache = null;
      }
    }

    // manually save pen properties since the listeners don't fire if a property is changed
    Prefs.lastFountainPenProperties.notifyListeners();
    Prefs.lastBallpointPenProperties.notifyListeners();
    Prefs.lastHighlighterProperties.notifyListeners();

    super.dispose();
  }
}

class PhotoInfo {
  Uint8List bytes;
  String extension;
  PhotoInfo({required this.bytes, required this.extension});
}
