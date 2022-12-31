
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:collapsible/collapsible.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart' show ChangeSource;
import 'package:image_picker/image_picker.dart';
import 'package:keybinder/keybinder.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/canvas_gesture_detector.dart';
import 'package:saber/components/canvas/canvas_image.dart';
import 'package:saber/components/canvas/tools/_tool.dart';
import 'package:saber/components/canvas/tools/eraser.dart';
import 'package:saber/components/canvas/tools/highlighter.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/components/home/preview_card.dart';
import 'package:saber/components/theming/dynamic_material_app.dart';
import 'package:saber/components/toolbar/editor_bottom_sheet.dart';
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
    this.embedded = false,
  }) : initialPath = path != null ? Future.value(path) : FileManager.newFilePath("/"),
        needsNaming = path == null;

  final Future<String> initialPath;
  final bool needsNaming;

  final bool embedded;

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

  @override
  void initState() {
    DynamicMaterialApp.isFullscreen.addListener(_setState);

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
  }
  Future _initStrokes() async {
    coreInfo = await EditorCoreInfo.loadFromFilePath(coreInfo.filePath);
    if (coreInfo.readOnly) {
      if (kDebugMode) print("Loaded file as read-only");
    }

    for (EditorPage page in coreInfo.pages) {
      page.quill.controller.addListener(onQuillChange);
    }

    if (coreInfo.strokes.isEmpty && coreInfo.images.isEmpty) {
      createPageOfStroke(-1);
    } else {
      for (Stroke stroke in coreInfo.strokes) {
        createPageOfStroke(stroke.pageIndex);
      }
      for (EditorImage image in coreInfo.images) {
        createPageOfStroke(image.pageIndex);
        image.onMoveImage = onMoveImage;
        image.onDeleteImage = onDeleteImage;
        image.onMiscChange = autosaveAfterDelay;
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

  void createPageOfStroke([int? pageIndex]) {
    int maxPageIndex;
    if (pageIndex != null) {
      maxPageIndex = pageIndex;
    } else {
      if (coreInfo.isEmpty) {
        maxPageIndex = -1;
      } else {
        maxPageIndex = [
          coreInfo.strokes.isNotEmpty ? coreInfo.strokes.map((e) => e.pageIndex).reduce(max) : -1,
          coreInfo.images.isNotEmpty ? coreInfo.images.map((e) => e.pageIndex).reduce(max) : -1,
        ].reduce(max);

        if (coreInfo.pages.length > maxPageIndex && !coreInfo.pages[coreInfo.pages.length - 1].quill.controller.document.isEmpty()) {
          maxPageIndex = coreInfo.pages.length;
        }
      }
    }

    while (maxPageIndex >= coreInfo.pages.length - 1) {
      coreInfo.pages.add(
        EditorPage()
          ..quill.controller.addListener(onQuillChange)
      );
    }
  }
  void removeExcessPagesAfterStroke(Stroke? stroke) {
    int minPageIndex = stroke?.pageIndex ?? 0;

    // remove excess pages if all pages >= this one are empty
    for (int i = coreInfo.pages.length - 1; i >= minPageIndex + 1; --i) {
      /// true if this page and the page before it are empty
      final pageEmpty = !coreInfo.strokes.any((stroke) => stroke.pageIndex == i || stroke.pageIndex == i - 1)
          && !coreInfo.images.any((image) => image.pageIndex == i || image.pageIndex == i - 1)
          && coreInfo.pages[i].quill.controller.document.isEmpty()
          && coreInfo.pages[i - 1].quill.controller.document.isEmpty();
      if (pageEmpty) {
        EditorPage page = coreInfo.pages.removeAt(i);
        page.quill.controller.removeListener(onQuillChange);
      } else {
        break;
      }
    }
  }

  undo() {
    if (!history.canUndo) return;

    // if we disabled redo, re-enable it
    if (!history.canRedo) {
      // no redo is possible, so clear the redo stack
      history.clearRedo();
      // don't disable redoing anymore
      history.canRedo = true;
    }

    setState(() {
      EditorHistoryItem item = history.undo();
      if (item.type == EditorHistoryItemType.draw) { // undo draw
        for (Stroke stroke in item.strokes) {
          coreInfo.strokes.remove(stroke);
        }
        for (EditorImage image in item.images) {
          coreInfo.images.remove(image);
        }
        removeExcessPagesAfterStroke(null);
      } else if (item.type == EditorHistoryItemType.erase) { // undo erase
        for (Stroke stroke in item.strokes) {
          coreInfo.strokes.add(stroke);
        }
        for (EditorImage image in item.images) {
          coreInfo.images.add(image);
          image.newImage = true;
        }
        createPageOfStroke(null);
      } else if (item.type == EditorHistoryItemType.move) { // undo move
        for (EditorImage image in item.images) {
          image.dstRect = Rect.fromLTRB(
            image.dstRect.left - item.offset!.left,
            image.dstRect.top - item.offset!.top,
            image.dstRect.right - item.offset!.right,
            image.dstRect.bottom - item.offset!.bottom,
          );
        }
      }
    });

    autosaveAfterDelay();
  }

  redo() {
    if (!history.canRedo) return;

    setState(() {
      EditorHistoryItem item = history.redo();
      if (item.type == EditorHistoryItemType.draw) { // redo draw
        for (Stroke stroke in item.strokes) {
          coreInfo.strokes.add(stroke);
        }
        for (EditorImage image in item.images) {
          coreInfo.images.add(image);
          image.newImage = true;
        }
        createPageOfStroke(null);
      } else if (item.type == EditorHistoryItemType.erase) { // redo erase
        for (Stroke stroke in item.strokes) {
          coreInfo.strokes.remove(stroke);
        }
        for (EditorImage image in item.images) {
          coreInfo.images.remove(image);
        }
        removeExcessPagesAfterStroke(null);
      } else if (item.type == EditorHistoryItemType.move) { // redo move
        for (EditorImage image in item.images) {
          image.dstRect = Rect.fromLTRB(
            image.dstRect.left + item.offset!.left,
            image.dstRect.top + item.offset!.top,
            image.dstRect.right + item.offset!.right,
            image.dstRect.bottom + item.offset!.bottom,
          );
        }
      }
    });

    autosaveAfterDelay();
  }

  int? onWhichPageIsFocalPoint(Offset focalPoint) {
    for (int i = 0; i < coreInfo.pages.length; ++i) {
      if (coreInfo.pages[i].renderBox == null) continue;
      Rect pageBounds = Offset.zero & coreInfo.pages[i].size;
      if (pageBounds.contains(coreInfo.pages[i].renderBox!.globalToLocal(focalPoint))) return i;
    }
    return null;
  }

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
        setState(() {
          EditorHistoryItem? item = history.removeAccidentalStroke();
          if (item != null) {
            if (item.type == EditorHistoryItemType.erase) {
              coreInfo.strokes.addAll(item.strokes);
            } else {
              for (Stroke stroke in item.strokes) {
                coreInfo.strokes.remove(stroke);
              }
            }
            // item.images is always empty
            removeExcessPagesAfterStroke(null);
          }
        });
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
    Offset position = coreInfo.pages[dragPageIndex!].renderBox!.globalToLocal(details.focalPoint);
    if (currentTool is Pen) {
      (currentTool as Pen).onDragStart(coreInfo.pages[dragPageIndex!].size, position, dragPageIndex!, currentPressure);
    } else if (currentTool is Eraser) {
      for (int i in (currentTool as Eraser).checkForOverlappingStrokes(dragPageIndex!, position, coreInfo.strokes).reversed) {
        Stroke removed = coreInfo.strokes.removeAt(i);
        removeExcessPagesAfterStroke(removed);
      }
    }

    history.canRedo = false;
  }
  onDrawUpdate(ScaleUpdateDetails details) {
    Offset position = coreInfo.pages[dragPageIndex!].renderBox!.globalToLocal(details.focalPoint);
    setState(() {
      if (currentTool is Pen) {
        (currentTool as Pen).onDragUpdate(coreInfo.pages[dragPageIndex!].size, position, currentPressure, () => setState(() {}));
      } else if (currentTool is Eraser) {
        for (int i in (currentTool as Eraser).checkForOverlappingStrokes(dragPageIndex!, position, coreInfo.strokes).reversed) {
          Stroke removed = coreInfo.strokes.removeAt(i);
          removeExcessPagesAfterStroke(removed);
        }
      }
    });
  }
  onDrawEnd(ScaleEndDetails details) {
    setState(() {
      if (currentTool is Pen) {
        Stroke newStroke = (currentTool as Pen).onDragEnd();
        coreInfo.strokes.add(newStroke);
        createPageOfStroke(newStroke.pageIndex);
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
      coreInfo.images.remove(image);
    });
    autosaveAfterDelay();
  }

  onQuillChange() {
    createPageOfStroke();
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
      await FileManager.writeFile(coreInfo.filePath + Editor.extension, toSave);
    } catch (e) {
      _hasEdited = true;
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

  Future pickPhoto() async {
    if (coreInfo.readOnly) return;

    final int? currentPageIndex = this.currentPageIndex;
    if (currentPageIndex == null) return;

    PhotoInfo? photoInfo;
    if (kIsWeb || Platform.isAndroid || Platform.isIOS) {
      photoInfo = await pickPhotoMobile();
    } else {
      photoInfo = await pickPhotoDesktop();
    }
    if (photoInfo == null) return;

    int pageIndex = currentPageIndex;
    EditorImage image = EditorImage(
      id: coreInfo.nextImageId++,
      extension: photoInfo.extension,
      bytes: photoInfo.bytes,
      pageIndex: pageIndex,
      pageSize: coreInfo.pages[pageIndex].size,
      onMoveImage: onMoveImage,
      onDeleteImage: onDeleteImage,
      onMiscChange: autosaveAfterDelay,
      onLoad: () => setState(() {}),
    );
    history.recordChange(EditorHistoryItem(
      type: EditorHistoryItemType.draw,
      strokes: [],
      images: [image],
    ));
    coreInfo.images.add(image);
    autosaveAfterDelay();
  }

  Future<PhotoInfo?> pickPhotoMobile() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1000,
      maxHeight: 1000,
      imageQuality: 90,
      requestFullMetadata: false,
    );
    if (image == null) return null;
    return PhotoInfo(
      bytes: await image.readAsBytes(),
      extension: image.path.substring(image.path.lastIndexOf('.')),
    );
  }
  Future<PhotoInfo?> pickPhotoDesktop() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      withData: true,
    );
    if (result == null) return null;

    Uint8List? bytes = result.files.single.bytes;
    String? extension = result.files.single.extension;
    if (bytes == null || extension == null) return null;

    return PhotoInfo(
      bytes: bytes,
      extension: ".$extension",
    );
  }

  Future exportAsPdf() async {
    final pdf = EditorExporter.generatePdf(coreInfo);
    await FileManager.exportFile("$_filename.pdf", await pdf.save());
  }
  Future exportAsSbn() async {
    final content = _saveToString();
    final encoded = utf8.encode(content) as Uint8List;
    await FileManager.exportFile("$_filename.sbn", encoded);
  }

  @override
  Widget build(BuildContext context) {
    final Widget body = Column(
      verticalDirection: Prefs.editorToolbarOnBottom.value ? VerticalDirection.down : VerticalDirection.up,
      children: [
        Expanded(
          child: CanvasGestureDetector(
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
              return Canvas(
                path: coreInfo.filePath,
                pageIndex: pageIndex,
                innerCanvasKey: coreInfo.pages[pageIndex].innerCanvasKey,
                textEditing: currentTool == Tool.textEditing,
                coreInfo: coreInfo.copyWith(
                  strokes: coreInfo.strokes.where((stroke) => stroke.pageIndex == pageIndex).toList(),
                  images: coreInfo.images.where((image) => image.pageIndex == pageIndex).toList(),
                ),
                currentStroke: () {
                  Stroke? currentStroke = Pen.currentPen.currentStroke ?? Highlighter.currentHighlighter.currentStroke;
                  return (currentStroke?.pageIndex == pageIndex) ? currentStroke : null;
                }(),
              );
            },
            placeholderPageBuilder: (BuildContext context, int pageIndex) {
              return Canvas(
                path: coreInfo.filePath,
                pageIndex: 0,
                innerCanvasKey: coreInfo.pages[pageIndex].innerCanvasKey,
                textEditing: false,
                coreInfo: EditorCoreInfo.empty,
                currentStroke: null,
                placeholder: true,
              );
            },
          ),
        ),

        SafeArea(
          child: Collapsible(
            axis: CollapsibleAxis.vertical,
            collapsed: DynamicMaterialApp.isFullscreen.value && !Prefs.editorToolbarShowInFullscreen.value,
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
                  return page.quill;
                }
                return null;
              },
              textEditing: currentTool == Tool.textEditing,
              toggleTextEditing: () => setState(() {
                if (currentTool == Tool.textEditing) {
                  currentTool = Pen.currentPen;
                  for (EditorPage page in coreInfo.pages) {
                    page.quill.focusNode.unfocus();
                    page.quill.controller.updateSelection( // unselect text
                      TextSelection.collapsed(
                        // maintain cursor position for when it regains focus
                        offset: page.quill.controller.selection.extentOffset
                      ),
                      ChangeSource.LOCAL
                    );
                  }
                } else {
                  currentTool = Tool.textEditing;
                  int? pageIndex = currentPageIndex;
                  if (pageIndex != null) {
                    coreInfo.pages[pageIndex].quill.focusNode.requestFocus();
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

              pickPhoto: pickPhoto,

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

    if (widget.embedded) return body;

    return Scaffold(
      appBar: DynamicMaterialApp.isFullscreen.value ? null : AppBar(
        toolbarHeight: kToolbarHeight,
        title: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          controller: filenameTextEditingController,
          onChanged: renameFile,
          autofocus: needsNaming,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => bottomSheet(context),
              );
            },
          )
        ],
      ),
      body: body,
      floatingActionButton: (DynamicMaterialApp.isFullscreen.value && !Prefs.editorToolbarShowInFullscreen.value) ? FloatingActionButton(
        onPressed: () {
          DynamicMaterialApp.isFullscreen.value = false;
        },
        child: const Icon(Icons.fullscreen_exit),
      ) : null,
    );
  }

  Widget bottomSheet(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final bool invert = Prefs.editorAutoInvert.value && brightness == Brightness.dark;

    return EditorBottomSheet(
      invert: invert,
      coreInfo: coreInfo,
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
      clearPage: () {
        if (coreInfo.readOnly) return;

        final int? currentPageIndex = this.currentPageIndex;
        if (currentPageIndex == null) return;

        setState(() {
          List<Stroke> removedStrokes = coreInfo.strokes.where((stroke) => stroke.pageIndex == currentPageIndex).toList();
          for (Stroke stroke in removedStrokes) {
            coreInfo.strokes.remove(stroke);
          }
          List<EditorImage> removedImages = coreInfo.images.where((image) => image.pageIndex == currentPageIndex).toList();
          for (EditorImage image in removedImages) {
            coreInfo.images.remove(image);
          }
          removeExcessPagesAfterStroke(null);
          history.recordChange(EditorHistoryItem(
            type: EditorHistoryItemType.erase,
            strokes: removedStrokes,
            images: removedImages,
          ));
          autosaveAfterDelay();
        });
      },

      clearAllPages: clearAllPages,
    );
  }

  void clearAllPages() {
    if (coreInfo.readOnly) return;
    setState(() {
      List<Stroke> removedStrokes = coreInfo.strokes.toList();
      List<EditorImage> removedImages = coreInfo.images.toList();
      coreInfo.strokes.clear();
      coreInfo.images.clear();
      removeExcessPagesAfterStroke(null);
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
      builder: (context) => AlertDialog(
        title: Text(t.editor.newerFileFormat.title),
        content: Text(t.editor.newerFileFormat.subtitle),
        actions: [
          TextButton(
            child: Text(t.editor.newerFileFormat.cancel),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
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

    DynamicMaterialApp.isFullscreen.removeListener(_setState);

    _delayedSaveTimer?.cancel();
    _lastSeenPointerCountTimer?.cancel();
    filenameTextEditingController.dispose();

    _removeKeybindings();

    for (EditorPage page in coreInfo.pages) {
      page.quill.controller.removeListener(onQuillChange);
    }

    // manually save pen properties since the listeners don't fire if a property is changed
    Prefs.lastFountainPenProperties.notifyListeners();
    Prefs.lastBallpointPenProperties.notifyListeners();
    Prefs.lastHighlighterProperties.notifyListeners();

    // dispose of images' cache
    for (EditorImage image in coreInfo.images) {
      image.invertedBytesCache = null;
    }

    super.dispose();
  }
}

class PhotoInfo {
  Uint8List bytes;
  String extension;
  PhotoInfo({required this.bytes, required this.extension});
}
