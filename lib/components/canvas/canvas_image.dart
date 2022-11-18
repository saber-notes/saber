
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_editor_image.dart';

class CanvasImage extends StatefulWidget {
  const CanvasImage({
    super.key,
    required this.image
  });

  final EditorImage image;

  @override
  State<CanvasImage> createState() => _CanvasImageState();
}

class _CanvasImageState extends State<CanvasImage> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.image.dstRect.left,
      top: widget.image.dstRect.top,
      width: widget.image.dstRect.width,
      height: widget.image.dstRect.height,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            widget.image.dstRect = widget.image.dstRect.translate(
              details.delta.dx,
              details.delta.dy,
            );
          });
        },
        child: SizedOverflowBox(
          size: widget.image.srcRect.size,
          child: Transform.translate(
            offset: -widget.image.srcRect.topLeft,
            child: Image.memory(
              widget.image.bytes,
              fit: BoxFit.none,
            ),
          ),
        ),
      ),
    );
  }
}
