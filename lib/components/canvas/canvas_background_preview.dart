import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/canvas_image.dart';
import 'package:saber/data/extensions/color_extensions.dart';
import 'package:saber/components/canvas/inner_canvas.dart';

class CanvasBackgroundPreview extends StatelessWidget {
  const CanvasBackgroundPreview({
    super.key,
    required this.selected,
    required this.invert,
    required this.backgroundColor,
    required this.backgroundPattern,
    required this.backgroundImage,
    this.overrideBoxFit,
    required this.pageSize,
    required this.lineHeight,
  });

  final bool selected;
  final bool invert;
  final Color? backgroundColor;
  final String backgroundPattern;
  final EditorImage? backgroundImage;
  final BoxFit? overrideBoxFit;
  final Size pageSize;
  final int lineHeight;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: colorScheme.primary
            .withOpacity(0.5)
            .withSaturation(selected ? 1 : 0),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: FittedBox(
          child: SizedBox(
            width: pageSize.width / 4,
            height: pageSize.height / 4,
            child: CustomPaint(
              painter: CanvasBackgroundPainter(
                invert: invert,
                backgroundColor: backgroundColor ?? InnerCanvas.defaultBackgroundColor,
                backgroundPattern: backgroundPattern,
                lineHeight: lineHeight,
                primaryColor: colorScheme.primary
                  .withSaturation(selected ? 1 : 0),
                secondaryColor: colorScheme.secondary
                  .withSaturation(selected ? 1 : 0),
                preview: true,
              ),
              child: Stack(
                children: [
                  if (backgroundImage != null) CanvasImage(
                    filePath: '',
                    image: backgroundImage!,
                    overrideBoxFit: overrideBoxFit,
                    pageSize: pageSize,
                    setAsBackground: null,
                    isBackground: true,
                    readOnly: true,
                  ),
                ]
              )
            ),
          ),
        ),
      ),
    );
  }
}
