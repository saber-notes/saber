
import 'dart:math';

import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_editor_image.dart';

class CanvasImage extends StatefulWidget {
  const CanvasImage({
    super.key,
    required this.image,
    required this.pageSize,
    this.readOnly = false,
  });

  final EditorImage image;
  final Size pageSize;
  final bool readOnly;

  /// When notified, all [CanvasImages] will have their [active] property set to false.
  static ChangeNotifier activeListener = ChangeNotifier();

  @override
  State<CanvasImage> createState() => _CanvasImageState();
}

class _CanvasImageState extends State<CanvasImage> {
  /// Whether this image can be dragged
  bool active = false;

  @override
  void initState() {
    super.initState();
    CanvasImage.activeListener.addListener(disableActive);
  }

  disableActive() {
    setState(() {
      active = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.image.dstRect.left,
      top: widget.image.dstRect.top,
      width: widget.image.dstRect.width,
      height: widget.image.dstRect.height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: !widget.readOnly ? () {
              setState(() {
                if (!active) {
                  CanvasImage.activeListener.notifyListeners();
                  active = true;
                } else {
                  active = false;
                }
              });
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
          for (double x = -10; x <= 10; x += 10 * 2)
            for (double y = -10; y <= 10; y += 10 * 2)
              CanvasImageResizeHandle(
                active: active,
                position: Offset(x, y),
                image: widget.image,
              ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    CanvasImage.activeListener.removeListener(disableActive);
    super.dispose();
  }
}

class CanvasImageResizeHandle extends StatelessWidget {
  const CanvasImageResizeHandle({
    super.key,
    required this.active,
    required this.position,
    required this.image,
  });

  final bool active;
  final Offset position;
  final EditorImage image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx < 0 ? position.dx : null,
      right: position.dx >= 0 ? -position.dx : null,
      top: position.dy < 0 ? position.dy : null,
      bottom: position.dy >= 0 ? -position.dy : null,
      child: GestureDetector(
        // todo: resize on pan
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
    );
  }
}
