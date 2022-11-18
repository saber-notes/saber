
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_editor_image.dart';

class CanvasImage extends StatelessWidget {
  const CanvasImage({
    super.key,
    required this.image
  });

  final EditorImage image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: image.dstRect.left,
      top: image.dstRect.top,
      width: image.dstRect.width,
      height: image.dstRect.height,
      child: Image.memory(
        image.bytes,
        fit: BoxFit.contain,
        // todo: use image.srcRect to crop the image
      ),
    );
  }
}
