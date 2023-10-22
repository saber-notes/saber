import 'dart:async';
import 'dart:math';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/canvas_preview.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/components/home/uploading_indicator.dart';
import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/extensions/color_extensions.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/pages/editor/editor.dart';

class PreviewCard extends StatefulWidget {
  PreviewCard({
    required this.filePath,
    required this.toggleSelection,
    required this.selected,
    required this.isAnythingSelected,
  }) : super(key: ValueKey('PreviewCard$filePath'));

  final String filePath;
  final bool selected;
  final bool isAnythingSelected;
  final void Function(String, bool) toggleSelection;

  @override
  State<PreviewCard> createState() => _PreviewCardState();

  static EditorCoreInfo getCachedCoreInfo(String filePath)
      => _PreviewCardState.getCachedCoreInfo(filePath);
  static void moveFileInCache(String oldPath, String newPath)
      => _PreviewCardState.moveFileInCache(oldPath, newPath);
}

class _PreviewCardState extends State<PreviewCard> {
  /// cache strokes so there's no delay the second time we see this preview card
  static final Map<String, EditorCoreInfo> _mapFilePathToEditorInfo = {};
  static EditorCoreInfo getCachedCoreInfo(String filePath) {
    return _mapFilePathToEditorInfo[filePath] ?? EditorCoreInfo(filePath: filePath);
  }
  static void moveFileInCache(String oldPath, String newPath) {
    if (oldPath.endsWith(Editor.extension)) {
      oldPath = oldPath.substring(0, oldPath.length - Editor.extension.length);
    } else if (oldPath.endsWith(Editor.extensionOldJson)) {
      oldPath = oldPath.substring(0, oldPath.length - Editor.extensionOldJson.length);
    } else {
      assert(false, 'oldPath must end with ${Editor.extension} or ${Editor.extensionOldJson}');
    }

    if (newPath.endsWith(Editor.extension)) {
      newPath = newPath.substring(0, newPath.length - Editor.extension.length);
    } else if (newPath.endsWith(Editor.extensionOldJson)) {
      newPath = newPath.substring(0, newPath.length - Editor.extensionOldJson.length);
    } else {
      assert(false, 'newPath must end with ${Editor.extension} or ${Editor.extensionOldJson}');
    }

    if (!_mapFilePathToEditorInfo.containsKey(oldPath)) return;
    _mapFilePathToEditorInfo[newPath] = _mapFilePathToEditorInfo[oldPath]!;
    _mapFilePathToEditorInfo.remove(oldPath);
  }

  ValueNotifier<bool> expanded = ValueNotifier(false);

  late double heightWidthRatio = _getHeightWidthRatio();
  late EditorCoreInfo _coreInfo = getCachedCoreInfo(widget.filePath);
  EditorCoreInfo get coreInfo => _coreInfo;
  set coreInfo(EditorCoreInfo coreInfo) {
    _mapFilePathToEditorInfo[widget.filePath] = _coreInfo = coreInfo;
    heightWidthRatio = _getHeightWidthRatio();
  }

  /// The cropped height of the first page
  /// as a percentage of the width of the canvas
  /// (cropped to its content for a masonry layout).
  ///
  /// The cropped height (not ratio) will be between 10% and 100% of the
  /// maximum height of the first page,
  /// or 0 if an error occurs.
  double _getHeightWidthRatio() {
    final EditorPage firstPage;
    if (coreInfo.pages.isEmpty) {
      firstPage = EditorPage();
    } else {
      firstPage = coreInfo.pages.first;
    }

    // avoid dividing by zero (this should never happen)
    assert(firstPage.size.height != 0);
    assert(firstPage.size.width != 0);
    if (firstPage.size.height == 0 || firstPage.size.width == 0) {
      return 0;
    }

    // if we have a background image, show full height
    if (firstPage.backgroundImage != null) {
      return firstPage.size.height / firstPage.size.width;
    }

    /// The maximum y value of any stroke, image, or text.
    double maxY = 0;
    for (Stroke stroke in firstPage.strokes) {
      maxY = max(maxY, stroke.maxY);
    }
    for (EditorImage image in firstPage.images) {
      maxY = max(maxY, image.dstRect.bottom);
    }
    if (!firstPage.quill.controller.document.isEmpty()) {
      // this does not account for text that wraps to the next line
      int linesOfText = firstPage.quill.controller.document.toPlainText().split('\n').length;
      maxY = max(maxY, linesOfText * coreInfo.lineHeight * 1.5); // ×1.5 fudge factor
    }

    /// The height of the first page (uncropped).
    /// e.g. the default height is 1400 [EditorPage.defaultHeight]
    /// and the default width is 1000 [EditorPage.defaultWidth].
    double fullHeight = firstPage.size.height;
    /// The height of the canvas (cropped),
    /// adjusted to be between 10% and 100% of the full height.
    final canvasHeight = min(
        fullHeight,
        max(maxY, 0) + (0.1 * fullHeight)
    );

    return canvasHeight / firstPage.size.width;
  }

  @override
  void initState() {
    if (_coreInfo.isEmpty) {
      findStrokes();
    }
    fileWriteSubscription = FileManager.fileWriteStream.stream.listen(fileWriteListener);

    expanded.value = widget.selected;
    super.initState();
  }

  StreamSubscription? fileWriteSubscription;
  void fileWriteListener(FileOperation event) {
    if (event.filePath != widget.filePath) return;
    if (event.type == FileOperationType.delete) {
      setState(() {
        coreInfo = EditorCoreInfo(filePath: widget.filePath);
      });
    } else if (event.type == FileOperationType.write) {
      findStrokes(fromFileListener: true);
    } else {
      throw Exception('Unknown file operation type: ${event.type}');
    }
  }

  Future findStrokes({bool fromFileListener = false}) async {
    if (!mounted) return;

    if (fromFileListener) {
      // don't refresh if we're not on the home page
      final location = GoRouterState.of(context).uri.toString();
      if (!location.startsWith(RoutePaths.prefixOfHome)) return;
    }

    coreInfo = await EditorCoreInfo.loadFromFilePath(
      widget.filePath,
      readOnly: true,
      onlyFirstPage: true, // only keep first page
    )
      ..readOnlyBecauseOfVersion = false;
    assert(coreInfo.pages.length <= 1);

    for (final page in coreInfo.pages) {
      for (final stroke in page.strokes) {
        stroke.optimisePoints(thresholdMultiplier: 2);
      }
    }

    if (mounted) setState(() {});
  }

  void _toggleCardSelection() {
    expanded.value = !expanded.value;
    widget.toggleSelection(widget.filePath, expanded.value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final disableAnimations = MediaQuery.of(context).disableAnimations;
    final transitionDuration = Duration(milliseconds: disableAnimations ? 0 : 300);
    final background = coreInfo.backgroundColor
        ?? InnerCanvas.defaultBackgroundColor;
    final invert = theme.brightness == Brightness.dark
        && Prefs.editorAutoInvert.value;
    final firstPageWidth = coreInfo.pages.isEmpty
        ? EditorPage.defaultWidth
        : coreInfo.pages.first.size.width;

    Widget card = MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.isAnythingSelected
          ? _toggleCardSelection
          : null,
        onSecondaryTap: _toggleCardSelection,
        onLongPress: _toggleCardSelection,
        child: ColoredBox(
          color: colorScheme.primary.withOpacity(0.05),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      FittedBox(
                        child: AnimatedContainer(
                          duration: transitionDuration,
                          width: firstPageWidth,
                          height: heightWidthRatio * firstPageWidth,
                          color: background.withInversion(invert),
                          child: ClipRect(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: CanvasPreview(
                                key: ValueKey(coreInfo),
                                height: heightWidthRatio * firstPageWidth,
                                coreInfo: coreInfo,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Positioned.fill(
                        left: -1,
                        top: -1,
                        right: -1,
                        bottom: -1,
                        child: ValueListenableBuilder(
                          valueListenable: expanded,
                          builder: (context, expanded, child) => AnimatedOpacity(
                            opacity: expanded ? 1 : 0,
                            duration: const Duration(milliseconds: 200),
                            child: IgnorePointer(
                              ignoring: !expanded,
                              child: child!,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: _toggleCardSelection,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    colorScheme.surface.withOpacity(0.2),
                                    colorScheme.surface.withOpacity(0.8),
                                    colorScheme.surface.withOpacity(1),
                                  ],
                                ),
                              ),
                              child: ColoredBox(
                                color: colorScheme.primary.withOpacity(0.05),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
        
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(widget.filePath.substring(widget.filePath.lastIndexOf('/') + 1)),
                  ),
                ],
              ),
        
              UploadingIndicator(
                filePath: widget.filePath,
              ),
            ],
          ),
        ),
      ),
    );

    return ValueListenableBuilder(
      valueListenable: expanded,
      builder: (context, expanded, _) {
        return OpenContainer(
          closedColor: colorScheme.surface,
          closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          closedElevation: expanded ? 4 : 1,
          closedBuilder: (context, action) => card,

          openColor: colorScheme.background,
          openBuilder: (context, action) => Editor(path: widget.filePath),

          transitionDuration: transitionDuration,
          routeSettings: RouteSettings(
            name: RoutePaths.editFilePath(widget.filePath),
          ),

          onClosed: (_) async {
            findStrokes();

            await Future.delayed(transitionDuration);
            if (!mounted) return;
            if (!GoRouterState.of(context).uri.toString().startsWith(RoutePaths.prefixOfHome)) return;
            ResponsiveNavbar.setAndroidNavBarColor(theme);
          },
        );
      }
    );
  }

  @override
  void dispose() {
    fileWriteSubscription?.cancel();
    super.dispose();
  }
}
