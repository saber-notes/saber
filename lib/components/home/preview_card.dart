
import 'dart:math';

import 'package:animations/animations.dart';
import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/canvas_preview.dart';
import 'package:saber/components/home/uploading_indicator.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/pages/editor/editor.dart';

class PreviewCard extends StatefulWidget {
  PreviewCard({
    required this.filePath,
  }) : super(key: ValueKey("PreviewCard$filePath"));

  final String filePath;

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

  double get height {
    double fullHeight = coreInfo.pages.isNotEmpty ? coreInfo.pages[0].size.height : EditorPage.defaultHeight;
    double maxY = coreInfo.strokes.isEmpty ? 0 : coreInfo.strokes.map((stroke) => stroke.maxY).reduce(max);
    for (EditorImage image in coreInfo.images) {
      maxY = max(maxY, image.dstRect.bottom);
    }
    if (coreInfo.pages.isNotEmpty && !coreInfo.pages[0].quill.controller.document.isEmpty()) {
      // this does not account for text that wraps to the next line
      maxY = max(maxY, coreInfo.pages[0].quill.controller.document.toPlainText().split("\n").length * coreInfo.lineHeight * 1.0);
    }
    return min(fullHeight, max(maxY, 0) + fullHeight * 0.1);
  }

  @override
  void initState() {
    if (_coreInfo.isEmpty) {
      findStrokes();
    }
    FileManager.writeWatcher.addListener(findStrokes);

    super.initState();
  }

  Future findStrokes() async {
    if (!mounted) return;

    EditorCoreInfo coreInfo = await EditorCoreInfo.loadFromFilePath(widget.filePath, readOnly: true);
    this.coreInfo = coreInfo.copyWith( // only keep first page
      readOnly: true,
      readOnlyBecauseOfVersion: false,
      strokes: coreInfo.strokes.where((stroke) => stroke.pageIndex == 0).toList(growable: false),
      images: coreInfo.images
          .where((image) => image.pageIndex == 0)
          .toList(growable: false)
          // use thumbnail to reduce memory usage
          ..forEach((image) => image.isThumbnail = true),
      pages: coreInfo.pages.isNotEmpty ? [coreInfo.pages[0]] : [],
    );

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget card = Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onSecondaryTap: () => setState(() { expanded = !expanded; }),
          onLongPress: () => setState(() { expanded = !expanded; }),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CanvasPreview(
                    path: widget.filePath,
                    height: height,
                    coreInfo: coreInfo,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(widget.filePath.substring(widget.filePath.lastIndexOf("/") + 1)),
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
      openColor: colorScheme.background,
      closedBuilder: (context, action) => card,
      openBuilder: (context, action) => Editor(path: widget.filePath),
      routeSettings: RouteSettings(
        name: "${RoutePaths.edit}?path=${widget.filePath}"
      ),
    );
  }

  @override
  void dispose() {
    FileManager.writeWatcher.removeListener(findStrokes);
    super.dispose();
  }
}
