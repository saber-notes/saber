
import 'dart:math';

import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/canvas_preview.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/pages/editor/editor.dart';

class PreviewCard extends StatefulWidget {
  PreviewCard({
    required this.filePath,
    required this.onTap,
  }) : super(key: ValueKey("PreviewCard$filePath"));

  final String filePath;
  final Function(String) onTap;

  @override
  State<PreviewCard> createState() => _PreviewCardState();
}

class _PreviewCardState extends State<PreviewCard> {
  /// cache strokes so there's no delay the second time we see this preview card
  static final Map<String, EditorCoreInfo> _mapFilePathToEditorInfo = {};

  bool expanded = false;

  late EditorCoreInfo _coreInfo;
  EditorCoreInfo get coreInfo => _coreInfo;
  set coreInfo(EditorCoreInfo coreInfo) {
    _mapFilePathToEditorInfo[widget.filePath] = _coreInfo = coreInfo;
  }

  double get height {
    double fullHeight = coreInfo.pageSizes.isNotEmpty ? coreInfo.pageSizes[0].height : EditorCoreInfo.defaultHeight;
    double maxY = coreInfo.strokes.isEmpty ? 0 : coreInfo.strokes.map((stroke) => stroke.maxY).reduce(max);
    for (EditorImage image in coreInfo.images) {
      if (image.dstRect.bottom > maxY) maxY = image.dstRect.bottom;
    }
    return min(fullHeight, max(maxY, 0) + fullHeight * 0.1);
  }

  @override
  void initState() {
    init();
    FileManager.writeWatcher.addListener(findStrokes);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant PreviewCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.filePath != oldWidget.filePath) init(refresh: false);
  }

  init({refresh = true}) {
    _coreInfo = _mapFilePathToEditorInfo[widget.filePath] ?? EditorCoreInfo();
    if (_coreInfo.strokes.isEmpty || refresh) {
      findStrokes();
    } else {
      if (mounted) setState(() { });
    }
  }

  Future findStrokes() async {
    if (!mounted) return;

    coreInfo = await EditorCoreInfo.loadFromFilePath(widget.filePath, ignoreVersion: true);

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
        onSecondaryTap: () => setState(() { expanded = !expanded; }),
        child: InkWell(
          onTap: () => widget.onTap(widget.filePath),
          onLongPress: () => setState(() { expanded = !expanded; }),
          borderRadius: BorderRadius.circular(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CanvasPreview(
                path: widget.filePath,
                height: height,
                coreInfo: coreInfo.copyWith(strokes: coreInfo.strokes.where((stroke) => stroke.pageIndex == 0).toList()),
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    FileManager.writeWatcher.removeListener(findStrokes);
    super.dispose();
  }
}
