
import 'dart:math';
import 'dart:typed_data';

import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as image;
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/color_extensions.dart';
import 'package:saber/data/prefs.dart';

class CanvasImage extends StatefulWidget {
  static int _nextId = 0;
  CanvasImage({
    required this.image,
    required this.pageSize,
    this.readOnly = false,
  }) : super(key: Key('CanvasImage${_nextId++}'));

  final EditorImage image;
  final Size pageSize;
  final bool readOnly;

  /// When notified, all [CanvasImages] will have their [active] property set to false.
  static ChangeNotifier activeListener = ChangeNotifier();

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

  Uint8List? invertedImageBytes;
  bool invertStarted = false;

  Rect? panStartRect;

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
    setState(() {
      active = false;
    });
  }

  Future invertImage() async {
    if (invertStarted || !mounted) return;
    invertStarted = true;

    /// synchronous function run on an isolate using [compute]
    /// https://api.flutter.dev/flutter/foundation/compute-constant.html
    image.Image? invertImage(Uint8List originalImageBytes) {
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
      return decoded;
    }

    image.Image? inverted = await compute(invertImage, widget.image.bytes);
    if (!mounted) return;
    if (inverted == null) return;
    invertedImageBytes = image.encodePng(inverted) as Uint8List;
    setState(() {
      imageBytes = invertedImageBytes!;
    });
  }

  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    if (Prefs.editorAutoInvert.value && currentBrightness != imageBrightness) {
      if (currentBrightness == Brightness.light) {
        imageBytes = widget.image.bytes;
      } else {
        imageBytes = invertedImageBytes ?? imageBytes;
        invertImage();
      }
    }

    return Positioned(
      left: widget.image.dstRect.left,
      top: widget.image.dstRect.top,
      width: widget.image.dstRect.width,
      height: widget.image.dstRect.height,
      child: IgnorePointer(
        ignoring: widget.readOnly,
        child: Stack(
          fit: StackFit.expand,
          children: [
            MouseRegion(
              cursor: active ? SystemMouseCursors.grab : MouseCursor.defer,
              child: GestureDetector(
                onTap: () {
                  active = !active;
                },
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
                  if (panStartRect == null) return;
                  if (panStartRect == widget.image.dstRect) return;
                  widget.image.onMoveImage?.call(widget.image, Rect.fromLTRB(
                    widget.image.dstRect.left - panStartRect!.left,
                    widget.image.dstRect.top - panStartRect!.top,
                    widget.image.dstRect.right - panStartRect!.right,
                    widget.image.dstRect.bottom - panStartRect!.bottom,
                  ));
                  panStartRect = null;
                } : null,
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
            for (double x = -10; x <= 10; x += 10 * 2)
              for (double y = -10; y <= 10; y += 10 * 2)
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
            } : null,
            onPanUpdate: active ? (details) {
              final double aspectRatio = image.srcRect.width / image.srcRect.height;
              double newWidth = image.dstRect.width + (position.dx < 0 ? -1 : 1) * details.delta.dx;
              double newHeight = image.dstRect.height + (position.dy < 0 ? -1 : 1) * details.delta.dy;
              double left = image.dstRect.left, top = image.dstRect.top;

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
              if (parent.panStartRect == null) return;
              if (parent.panStartRect == image.dstRect) return;
              image.onMoveImage?.call(image, Rect.fromLTRB(
                image.dstRect.left - parent.panStartRect!.left,
                image.dstRect.top - parent.panStartRect!.top,
                image.dstRect.right - parent.panStartRect!.right,
                image.dstRect.bottom - parent.panStartRect!.bottom,
              ));
              parent.panStartRect = null;
            } : null,
            child: AnimatedOpacity(
              opacity: active ? 1 : 0,
              duration: const Duration(milliseconds: 100),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
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
