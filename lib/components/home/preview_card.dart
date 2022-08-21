
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/canvas.dart';
import 'package:saber/components/canvas/canvas_preview.dart';
import 'package:saber/pages/editor/editor.dart';

class PreviewCard extends StatefulWidget {
  const PreviewCard({
    Key? key,
    required this.filePath,
    required this.onTap,
  }) : super(key: key);

  final String filePath;
  final Function(String) onTap;

  @override
  State<PreviewCard> createState() => _PreviewCardState();
}

class _PreviewCardState extends State<PreviewCard> {
  /// cache strokes so there's no delay the second time we see this preview card
  static final Map<String, Iterable<Stroke>> _mapFilePathToStrokes = {};

  late Iterable<Stroke> _strokes;
  Iterable<Stroke> get strokes => _strokes;
  set strokes(Iterable<Stroke> strokes) {
    _mapFilePathToStrokes[widget.filePath] = _strokes = strokes;
  }

  double get height {
    double fullHeight = Canvas.canvasHeight;
    double maxY = strokes.isEmpty ? 0 : strokes.map((stroke) => stroke.maxY).reduce(max);
    return min(fullHeight, max(maxY, 0) + fullHeight * 0.1);
  }

  @override
  void initState() {
    _strokes = _mapFilePathToStrokes[widget.filePath] ?? [];

    findStrokes();

    super.initState();
  }

  Future findStrokes() async {
    strokes = (await loadStrokesFromPath(widget.filePath)).where((stroke) => stroke.pageIndex == 0);

    setState(() {});
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
                strokes: strokes,
              ),
              const SizedBox(height: 8),
              Text(widget.filePath.substring(widget.filePath.lastIndexOf("/") + 1)),
            ],
          ),
        ),
      ),
    );
  }
}
