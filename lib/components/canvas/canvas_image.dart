
import 'dart:math';
import 'dart:typed_data';

import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as image;
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/color_extensions.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

class CanvasImage extends StatefulWidget {
  CanvasImage({
    required this.image,
    required this.pageSize,
    this.readOnly = false,
  }) : super(key: Key("CanvasImage${image.id}"));

  final EditorImage image;
  final Size pageSize;
  final bool readOnly;

  /// When notified, all [CanvasImages] will have their [active] property set to false.
  static ChangeNotifier activeListener = ChangeNotifier();

  /// The minimum size of the interactive area for the image.
  static double minInteractiveSize = 50;
  /// The minimum size of the image itself, inside of the interactive area.
  static double minImageSize = 10;

  @override
  State<CanvasImage> createState() => _CanvasImageState();
}

class _CanvasImageState extends State<CanvasImage> {
  bool _active = false;
  /// Whether this image can be dragged
  bool get active => _active;
  set active(bool value) {
    if (active == value) return;

    if (value) {
      // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
      CanvasImage.activeListener.notifyListeners(); // de-activate all other images
    }

    setState(() {
      _active = value;
    });
  }

  late Uint8List imageBytes;
  Brightness imageBrightness = Brightness.light;

  bool invertStarted = false;

  Rect panStartRect = Rect.zero;
  Offset panStartPosition = Offset.zero;

  @override
  void initState() {
    imageBytes = widget.image.bytes;

    if (widget.image.newImage) { // if the image is new, make it [active]
      active = true;
      widget.image.newImage = false;
    }

    CanvasImage.activeListener.addListener(disableActive);

    super.initState();
  }

  disableActive() {
    if (!active) return;
    setState(() {
      active = false;
    });
  }

  Future invertImage() async {
    if (!mounted) return;
    if (widget.image.invertedBytesCache != null) return;
    if (invertStarted) return;
    invertStarted = true;

    Uint8List? inverted = await compute(invertImageIsolate, widget.image.bytes);
    if (!mounted) return;
    if (inverted == null) return;
    setState(() {
      widget.image.invertedBytesCache = inverted;
      imageBytes = inverted;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Brightness currentBrightness = Theme.of(context).brightness;
    if (!widget.image.invertible) currentBrightness = Brightness.light;

    if (Prefs.editorAutoInvert.value && currentBrightness != imageBrightness) {
      if (currentBrightness == Brightness.light) {
        imageBytes = widget.image.bytes;
      } else {
        imageBytes = widget.image.invertedBytesCache ?? imageBytes;
        invertImage();
      }
      imageBrightness = currentBrightness;
    }

    return AnimatedPositioned(
      // duration is zero if we're currently dragging the image
      duration: (panStartRect != Rect.zero) ? Duration.zero : const Duration(milliseconds: 200),

      left: widget.image.dstRect.left,
      top: widget.image.dstRect.top,
      width: max(widget.image.dstRect.width, CanvasImage.minInteractiveSize),
      height: max(widget.image.dstRect.height, CanvasImage.minInteractiveSize),

      child: IgnorePointer(
        ignoring: widget.readOnly,
        child: Stack(
          fit: StackFit.expand,
          children: [
            MouseRegion(
              cursor: active ? SystemMouseCursors.grab : MouseCursor.defer,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  active = !active;
                },
                onLongPress: active ? showModal : null,
                onSecondaryTap: active ? showModal : null,
                onPanStart: active ? (details) {
                  panStartRect = widget.image.dstRect;
                } : null,
                onPanUpdate: active ? (details) {
                  setState(() {
                    double fivePercent = min(widget.pageSize.width * 0.05, widget.pageSize.height * 0.05);
                    widget.image.dstRect = Rect.fromLTWH(
                      (widget.image.dstRect.left + details.delta.dx).clamp(
                        fivePercent - widget.image.dstRect.width,
                        widget.pageSize.width - fivePercent,
                      ).toDouble(),
                      (widget.image.dstRect.top + details.delta.dy).clamp(
                        fivePercent - widget.image.dstRect.height,
                        widget.pageSize.height - fivePercent,
                      ).toDouble(),
                      widget.image.dstRect.width,
                      widget.image.dstRect.height,
                    );
                  });
                } : null,
                onPanEnd: active ? (details) {
                  if (panStartRect == widget.image.dstRect) return;
                  widget.image.onMoveImage?.call(widget.image, Rect.fromLTRB(
                    widget.image.dstRect.left - panStartRect.left,
                    widget.image.dstRect.top - panStartRect.top,
                    widget.image.dstRect.right - panStartRect.right,
                    widget.image.dstRect.bottom - panStartRect.bottom,
                  ));
                  panStartRect = Rect.zero;
                } : null,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: active ? colorScheme.onBackground : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: max(widget.image.dstRect.width, CanvasImage.minImageSize),
                      height: max(widget.image.dstRect.height, CanvasImage.minImageSize),
                      child: SizedOverflowBox(
                        size: widget.image.srcRect.size,
                        child: Transform.translate(
                          offset: -widget.image.srcRect.topLeft,
                          child: Image.memory(
                            imageBytes,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            for (double x = -20; x <= 20; x += 20 * 2)
              for (double y = -20; y <= 20; y += 20 * 2)
                _CanvasImageResizeHandle(
                  active: active,
                  position: Offset(x, y),
                  image: widget.image,
                  parent: this,
                  afterDrag: () => setState(() {}),
                ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    CanvasImage.activeListener.removeListener(disableActive);
    super.dispose();
  }

  void showModal() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(t.editor.imageOptions.title),
          content: _CanvasImageDialog(
            image: widget.image,
            parent: this,
          ),
        );
      },
    );
  }

  /// synchronous function run on an isolate using [compute]
  /// https://api.flutter.dev/flutter/foundation/compute-constant.html
  static Uint8List? invertImageIsolate(Uint8List originalImageBytes) {
    image.Image? decoded = image.decodeImage(originalImageBytes);
    if (decoded == null) return null;

    for (int x = 0; x < decoded.width; ++x) {
      for (int y = 0; y < decoded.height; ++y) {
        int pixel = decoded.getPixel(x, y);
        int r = image.getRed(pixel),
            g = image.getGreen(pixel),
            b = image.getBlue(pixel),
            a = image.getAlpha(pixel);
        Color inverted = Color.fromRGBO(r, g, b, 1).withInversion();
        int invertedInt = image.getColor(inverted.red, inverted.green, inverted.blue, a);
        decoded.setPixel(x, y, invertedInt);
      }
    }

    return image.encodePng(decoded) as Uint8List;
  }
}

class _CanvasImageResizeHandle extends StatelessWidget {
  const _CanvasImageResizeHandle({
    required this.active,
    required this.position,
    required this.image,
    required this.parent,
    required this.afterDrag,
  });

  final bool active;
  final Offset position;
  final EditorImage image;
  final _CanvasImageState parent;
  final void Function() afterDrag;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Positioned(
      left: position.dx < 0 ? position.dx : null,
      right: position.dx >= 0 ? -position.dx : null,
      top: position.dy < 0 ? position.dy : null,
      bottom: position.dy >= 0 ? -position.dy : null,
      child: DeferPointer(
        paintOnTop: true,
        child: MouseRegion(
          cursor: (){
            if (!active) return MouseCursor.defer;
            if (position.dx < 0 && position.dy < 0) return SystemMouseCursors.resizeUpLeft;
            if (position.dx < 0 && position.dy >= 0) return SystemMouseCursors.resizeDownLeft;
            if (position.dx >= 0 && position.dy < 0) return SystemMouseCursors.resizeUpRight;
            if (position.dx >= 0 && position.dy >= 0) return SystemMouseCursors.resizeDownRight;
            return MouseCursor.defer;
          }(),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanStart: active ? (details) {
              parent.panStartRect = parent.widget.image.dstRect;
              parent.panStartPosition = details.localPosition;
            } : null,
            onPanUpdate: active ? (details) {
              final Offset delta = details.localPosition - parent.panStartPosition;
              double newWidth = parent.panStartRect.width + (position.dx < 0 ? -1 : 1) * delta.dx;
              double newHeight = parent.panStartRect.height + (position.dy < 0 ? -1 : 1) * delta.dy;
              double left = image.dstRect.left, top = image.dstRect.top;

              if (newWidth <= 0 || newHeight <= 0) return;

              final double aspectRatio = image.srcRect.width / image.srcRect.height;
              if (newWidth / newHeight > aspectRatio) {
                newHeight = newWidth / aspectRatio;
              } else {
                newWidth = newHeight * aspectRatio;
              }

              if (position.dx < 0) {
                left = image.dstRect.right - newWidth;
              }
              if (position.dy < 0) {
                top = image.dstRect.bottom - newHeight;
              }

              image.dstRect = Rect.fromLTWH(
                left,
                top,
                newWidth,
                newHeight,
              );
              afterDrag();
            } : null,
            onPanEnd: active ? (details) {
              if (parent.panStartRect == image.dstRect) return;
              image.onMoveImage?.call(image, Rect.fromLTRB(
                image.dstRect.left - parent.panStartRect.left,
                image.dstRect.top - parent.panStartRect.top,
                image.dstRect.right - parent.panStartRect.right,
                image.dstRect.bottom - parent.panStartRect.bottom,
              ));
              parent.panStartRect = Rect.zero;
            } : null,
            child: AnimatedOpacity(
              opacity: active ? 1 : 0,
              duration: const Duration(milliseconds: 100),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: colorScheme.onBackground,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorScheme.background,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CanvasImageDialog extends StatefulWidget {
  const _CanvasImageDialog({
    required this.image,
    required this.parent,
  });

  final EditorImage image;
  final _CanvasImageState parent;

  @override
  State<_CanvasImageDialog> createState() => _CanvasImageDialogState();
}
class _CanvasImageDialogState extends State<_CanvasImageDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (Prefs.editorAutoInvert.value) ListTile(
          onTap: () => setState(() {
            widget.image.invertible = !widget.image.invertible;
            widget.parent.setState(() {});
          }),
          title: Text(t.editor.imageOptions.invertible),
          trailing: Switch.adaptive(
            value: widget.image.invertible,
            onChanged: (bool value) => setState(() {
              widget.image.invertible = value;
            }),
          ),
        ),
        ListTile(
          onTap: () {
            widget.image.onDeleteImage?.call(widget.image);
            Navigator.of(context).pop();
          },
          title: Text(t.editor.imageOptions.delete),
          trailing: const Icon(Icons.delete),
        ),
      ],
    );
  }

}