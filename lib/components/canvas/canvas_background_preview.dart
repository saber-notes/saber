import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/canvas_image.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/data/extensions/color_extensions.dart';
import 'package:saber/data/prefs.dart';

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
    final previewSize = Size(
      150,
      pageSize.height / pageSize.width * 150,
    );
    return Container(
      width: previewSize.width,
      height: previewSize.height,
      decoration: BoxDecoration(
        border: Border.all(
          color: colorScheme.primary
            .withOpacity(0.5)
            .withSaturation(selected ? 1 : 0),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CustomPaint(
          painter: CanvasBackgroundPainter(
            invert: invert,
            backgroundColor: () {
              if (backgroundImage != null && Prefs.editorOpaqueBackgrounds.value) {
                return Colors.white;
              } else {
                return backgroundColor ?? InnerCanvas.defaultBackgroundColor;
              }
            }(),
            backgroundPattern: () {
              if (backgroundImage != null && Prefs.editorOpaqueBackgrounds.value) {
                return CanvasBackgroundPatterns.none;
              } else {
                return backgroundPattern;
              }
            }(),
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
                pageSize: previewSize,
                setAsBackground: null,
                isBackground: true,
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
