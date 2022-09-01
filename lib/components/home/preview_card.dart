
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:saber/components/canvas/canvas.dart';
import 'package:saber/components/canvas/canvas_preview.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/file_manager.dart';

class PreviewCard extends StatefulWidget {
  const PreviewCard({
    super.key,
    required this.filePath,
    required this.onTap,
  });

  final String filePath;
  final Function(String) onTap;

  @override
  State<PreviewCard> createState() => _PreviewCardState();
}

class _PreviewCardState extends State<PreviewCard> {
  /// cache strokes so there's no delay the second time we see this preview card
  static final Map<String, EditorCoreInfo> _mapFilePathToEditorInfo = {};

  late EditorCoreInfo _coreInfo;
  EditorCoreInfo get coreInfo => _coreInfo;
  set coreInfo(EditorCoreInfo coreInfo) {
    _mapFilePathToEditorInfo[widget.filePath] = _coreInfo = coreInfo;
  }

  double get height {
    double fullHeight = Canvas.canvasHeight;
    double maxY = coreInfo.strokes.isEmpty ? 0 : coreInfo.strokes.map((stroke) => stroke.maxY).reduce(max);
    return min(fullHeight, max(maxY, 0) + fullHeight * 0.1);
  }

  @override
  void initState() {
    _coreInfo = _mapFilePathToEditorInfo[widget.filePath] ?? EditorCoreInfo();

    findStrokes();
    FileManager.writeWatcher.addListener(findStrokes);

    super.initState();
  }

  Future findStrokes() async {
    if (!mounted) return;

    coreInfo = await EditorCoreInfo.loadFromFilePath(widget.filePath);

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () { widget.onTap(widget.filePath); },
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CanvasPreview(
                path: widget.filePath,
                height: height,
                coreInfo: coreInfo.copyWith(strokes: coreInfo.strokes.where((stroke) => stroke.pageIndex == 0).toList()),
              ),
              const SizedBox(height: 8),
              Text(widget.filePath.substring(widget.filePath.lastIndexOf("/") + 1)),
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
