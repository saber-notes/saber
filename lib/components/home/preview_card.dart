import 'dart:async';
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
  }) : super(key: ValueKey('PreviewCard$filePath'));

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
    final firstPage = coreInfo.pages.isNotEmpty ? coreInfo.pages[0] : EditorPage();
    double fullHeight = firstPage.size.height;

    double maxY = 0;
    if (firstPage.strokes.isNotEmpty) {
      maxY = firstPage.strokes.map((stroke) => stroke.maxY).reduce(max);
    }
    for (EditorImage image in firstPage.images) {
      maxY = max(maxY, image.dstRect.bottom);
    }
    if (!firstPage.quill.controller.document.isEmpty()) {
      // this does not account for text that wraps to the next line
      int linesOfText = firstPage.quill.controller.document.toPlainText().split('\n').length;
      maxY = max(maxY, linesOfText * coreInfo.lineHeight * 1.0);
    }

    return min(fullHeight, max(maxY, 0) + fullHeight * 0.1);
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
    final colorScheme = Theme.of(context).colorScheme;
    final disableAnimations = MediaQuery.of(context).disableAnimations;

    Widget card = MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onSecondaryTap: () => setState(() { expanded = !expanded; }),
        onLongPress: () => setState(() { expanded = !expanded; }),
        child: Container(
          color: colorScheme.primary.withOpacity(0.05),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CanvasPreview(
                    height: height,
                    coreInfo: coreInfo,
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

    return Padding(
      padding: const EdgeInsets.all(8),
      child: OpenContainer(
        closedColor: colorScheme.surface,
        closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        closedBuilder: (context, action) => card,

        openColor: colorScheme.background,
        openBuilder: (context, action) => Editor(path: widget.filePath),

        transitionDuration: Duration(milliseconds: disableAnimations ? 0 : 300),
        routeSettings: RouteSettings(
          name: RoutePaths.editFilePath(widget.filePath),
        ),

        onClosed: (_) {
          findStrokes();
        },
      ),
    );
  }

  @override
  void dispose() {
    fileWriteSubscription?.cancel();
    super.dispose();
  }
}
