import 'dart:async';
import 'dart:math';

import 'package:animations/animations.dart';
import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/canvas_preview.dart';
import 'package:saber/data/extensions/color_extensions.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/components/home/uploading_indicator.dart';
import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/pages/editor/editor.dart';

class PreviewCard extends StatefulWidget {
  PreviewCard({
    required this.filePath,
    required this.width,
  }) : super(key: ValueKey('PreviewCard$filePath'));

  final String filePath;
  final double width;

  @override
  State<PreviewCard> createState() => _PreviewCardState();

  static EditorCoreInfo getCachedCoreInfo(String filePath) {
    return _PreviewCardState.getCachedCoreInfo(filePath);
  }
}

class _PreviewCardState extends State<PreviewCard> {
  /// cache strokes so there's no delay the second time we see this preview card
  static final Map<String, EditorCoreInfo> _mapFilePathToEditorInfo = {};
  static EditorCoreInfo getCachedCoreInfo(String filePath) {
    return _mapFilePathToEditorInfo[filePath] ?? EditorCoreInfo(filePath: filePath);
  }

  bool expanded = false;

  late EditorCoreInfo _coreInfo = getCachedCoreInfo(widget.filePath);
  EditorCoreInfo get coreInfo => _coreInfo;
  set coreInfo(EditorCoreInfo coreInfo) {
    _mapFilePathToEditorInfo[widget.filePath] = _coreInfo = coreInfo;
  }

  /// The cropped height of the first page
  /// as a percentage of the width of the canvas
  /// (cropped to its content for a masonry layout).
  /// The cropped height (not ratio) will be between 10% and 100% of the
  /// maximum height of the first page.
  double get heightWidthRatio {
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
      findStrokes();
    } else {
      throw Exception('Unknown file operation type: ${event.type}');
    }
  }

  Future findStrokes() async {
    if (!mounted) return;

    coreInfo = await EditorCoreInfo.loadFromFilePath(
      widget.filePath,
      readOnly: true,
      onlyFirstPage: true, // only keep first page
    )
      ..readOnlyBecauseOfVersion = false;
    assert(coreInfo.pages.length <= 1);

    if (mounted) setState(() {});
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
    final heightWidthRatio = this.heightWidthRatio;

    Widget card = MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onSecondaryTap: () => setState(() { expanded = !expanded; }),
        onLongPress: () => setState(() { expanded = !expanded; }),
        child: ColoredBox(
          color: colorScheme.primary.withOpacity(0.05),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: transitionDuration,
                    width: widget.width,
                    height: heightWidthRatio * widget.width,
                    color: background.withInversion(invert),
                    child: ClipRect(
                      child: OverflowBox(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: CanvasPreview(
                            key: ValueKey(coreInfo),
                            height: heightWidthRatio == 0
                                ? null
                                : heightWidthRatio * coreInfo.pages.first.size.width,
                            coreInfo: coreInfo,
                          ),
                        ),
                      ),
                    ),
                  ),
        
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(widget.filePath.substring(widget.filePath.lastIndexOf('/') + 1)),
                  ),
        
                  Collapsible(
                    collapsed: !expanded,
                    axis: CollapsibleAxis.vertical,
                    maintainState: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            FileManager.deleteFile(widget.filePath + Editor.extension);
                          },
                          icon: const Icon(Icons.delete_forever),
                        ),
                      ],
                    ),
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

    return OpenContainer(
      closedColor: colorScheme.surface,
      closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
        if (!GoRouter.of(context).location.startsWith('/home')) return;
        ResponsiveNavbar.setAndroidNavBarColor(theme);
      },
    );
  }

  @override
  void dispose() {
    fileWriteSubscription?.cancel();
    super.dispose();
  }
}
