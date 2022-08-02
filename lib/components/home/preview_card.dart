
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_stroke.dart';
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
  State<StatefulWidget> createState() => _PreviewCardState();
}
class _PreviewCardState extends State<PreviewCard> {
  List<Stroke> strokes = [];

  @override
  initState() {
    super.initState();
    findStrokes();
  }

  Future findStrokes() async {
    strokes = await loadStrokesFromPath(widget.filePath);
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
              CanvasPreview(strokes: strokes),
              const SizedBox(height: 8),
              Text(widget.filePath.substring(widget.filePath.lastIndexOf("/") + 1)),
            ],
          ),
        ),
      ),
    );
  }
}
