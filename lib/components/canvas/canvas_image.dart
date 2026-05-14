import 'dart:math';

import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:saber/components/canvas/canvas_image_dialog.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/data/extensions/change_notifier_extensions.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

// type of activity with image
enum Active {
  none,        // no active image manipulation
  destination, // setting destination rect
  crop,        // setting crop rect
}

/// Clips image to a given rect — used to implement cropping.
class ImgClipper extends CustomClipper<Rect> {
  ImgClipper(this._clipRect);

  Rect _clipRect;
  Rect get clipRect => _clipRect;
  set clipRect(Rect clipRect) {
    _clipRect = clipRect;
  }

  @override
  Rect getClip(Size size) => _clipRect;

  @override
  bool shouldReclip(ImgClipper oldClipper) => clipRect != oldClipper.clipRect;
}

class CanvasImage extends StatefulHookWidget {
  CanvasImage({
    required this.filePath,
    required this.image,
    this.overrideBoxFit,
    required this.pageSize,
    required this.setAsBackground,
    this.isBackground = false,
    this.readOnly = false,
    this.selected = false,
  }) : super(key: Key('CanvasImage$filePath/${image.id}'));

  /// The path to the note that this image is in.
  final String filePath;
  final EditorImage image;
  final BoxFit? overrideBoxFit;
  final Size pageSize;
  final void Function(EditorImage image)? setAsBackground;
  final bool isBackground;
  final bool readOnly;
  final bool selected;

  /// When notified, all [CanvasImage]s will have their [activeType] reset to [Active.none].
  static var activeListener = ChangeNotifier();

  /// The minimum size of the interactive area for the image.
  static double minInteractiveSize = 50;

  /// The minimum size of the image itself, inside of the interactive area.
  static double minImageSize = 10;

  @override
  State<CanvasImage> createState() => _CanvasImageState();
}

class _CanvasImageState extends State<CanvasImage> {
  Active _activeType = Active.none;

  bool isActive() => _activeType != Active.none;

  Active get activeType => _activeType;
  set activeType(Active value) {
    if (_activeType == value) return;

    if (!isActive() && value != Active.none) {
      // Deactivate all other images before activating this one.
      CanvasImage.activeListener.notifyListenersPlease();
    }
    _activeType = value;
    widget.image.showCroppedImage = _activeType != Active.crop;
    if (widget.isBackground) {
      getClipRect();
    }
    if (mounted) {
      try {
        setState(() {});
      } catch (e) {
        // setState may throw if the widget is currently building.
      }
    }
  }

  /// Advances to the next [Active] state in the cycle.
  Active setNextActive() {
    switch (_activeType) {
      case Active.none:
        return Active.destination;
      case Active.destination:
        return Active.crop;
      case Active.crop:
        return Active.none;
    }
  }

  Brightness imageBrightness = Brightness.light;

  // Used when dragging or resizing the image.
  Rect panStartRect = Rect.zero;
  Offset panStartPosition = Offset.zero;

  // Used when cropping the image.
  Rect cropRect = Rect.zero;
  Rect cropStartRect = Rect.zero;

  /// Returns the clip rectangle used to display the (possibly cropped) image.
  Rect getClipRect() {
    if (widget.isBackground) {
      // Fit the background image to fill the full page.
      final Rect fullRect =
      Offset.zero & Size(widget.pageSize.width, widget.pageSize.height);
      final FittedSizes sizes =
      applyBoxFit(BoxFit.contain, widget.image.dstRect.size, fullRect.size);
      final Rect dstBackgroundRect =
      Alignment.center.inscribe(sizes.destination, fullRect);
      widget.image.dstRect = dstBackgroundRect;
      widget.image.dstFullRect = widget.image.getDstFullRect();
    }
    if (widget.image.showCroppedImage) {
      // Clip to only the visible (cropped) portion.
      final Offset o =
          widget.image.dstRect.topLeft - widget.image.dstFullRect.topLeft;
      return o & widget.image.dstRect.size;
    } else {
      // Show the full image while the crop rect is being set.
      return Offset.zero & widget.image.dstFullRect.size;
    }
  }

  @override
  void initState() {
    widget.image.loadIn();

    if (widget.image.newImage) {
      // New images start in destination-rect mode so they can be positioned.
      activeType = Active.destination;
      widget.image.newImage = false;
    }

    CanvasImage.activeListener.addListener(disableActive);
    super.initState();
  }

  void disableActive() {
    activeType = Active.none;
  }

  void imageListener() {
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant CanvasImage oldWidget) {
    if (widget.readOnly && isActive()) {
      activeType = Active.none;
    }
    if (widget.image != oldWidget.image) {
      oldWidget.image.removeListener(imageListener);
      widget.image.addListener(imageListener);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    useListenable(widget.image);
    // Keep _activeType in sync when switching to read-only without going
    // through didUpdateWidget (e.g. during an animated rebuild).
    if (widget.readOnly) _activeType = Active.none;

    final currentBrightness = widget.image.invertible
        ? Theme.brightnessOf(context)
        : Brightness.light;

    if (stows.editorAutoInvert.value && currentBrightness != imageBrightness) {
      imageBrightness = currentBrightness;
    }

    final Widget unpositioned = IgnorePointer(
      ignoring: widget.readOnly,
      child: Stack(
        fit: StackFit.expand,
        children: [
          MouseRegion(
            cursor:
            isActive() ? SystemMouseCursors.grab : MouseCursor.defer,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                activeType = setNextActive();
              },
              onLongPress: isActive() ? showModal : null,
              onSecondaryTap: isActive() ? showModal : null,
              onPanStart: isActive()
                  ? (details) {
                panStartRect = widget.image.dstRect;
                cropRect = widget.image.dstRect;
              }
                  : null,
              onPanUpdate: isActive()
                  ? (details) {
                setState(() {
                  final fivePercent = min(
                    widget.pageSize.width * 0.05,
                    widget.pageSize.height * 0.05,
                  );
                  widget.image.dstRect = Rect.fromLTWH(
                    (widget.image.dstRect.left + details.delta.dx)
                        .clamp(
                      fivePercent - widget.image.dstRect.width,
                      widget.pageSize.width - fivePercent,
                    )
                        .toDouble(),
                    (widget.image.dstRect.top + details.delta.dy)
                        .clamp(
                      fivePercent - widget.image.dstRect.height,
                      widget.pageSize.height - fivePercent,
                    )
                        .toDouble(),
                    widget.image.dstRect.width,
                    widget.image.dstRect.height,
                  );
                  widget.image.dstFullRect =
                      widget.image.getDstFullRect();
                });
              }
                  : null,
              onPanEnd: isActive()
                  ? (details) {
                if (panStartRect == widget.image.dstRect) return;
                widget.image.onMoveImage?.call(
                  widget.image,
                  Rect.fromLTRB(
                    widget.image.dstRect.left - panStartRect.left,
                    widget.image.dstRect.top - panStartRect.top,
                    widget.image.dstRect.right - panStartRect.right,
                    widget.image.dstRect.bottom - panStartRect.bottom,
                  ),
                );
                panStartRect = Rect.zero;
              }
                  : null,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isActive()
                        ? colorScheme.onSurface
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                // The SizedBox always covers dstFullRect; the ClipRect
                // limits what is visible to the crop selection.
                child: SizedBox(
                  width: max(
                    widget.image.dstFullRect.width,
                    CanvasImage.minImageSize,
                  ),
                  height: max(
                    widget.image.dstFullRect.height,
                    CanvasImage.minImageSize,
                  ),
                  child: ClipRect(
                    clipper: ImgClipper(getClipRect()),
                    child: SizedOverflowBox(
                      size: widget.image.naturalSize,
                      child: SizedBox(
                        height: widget.image.dstFullRect.height,
                        width: widget.image.dstFullRect.width,
                        child: widget.image.buildImageWidget(
                          context: context,
                          overrideBoxFit: widget.overrideBoxFit,
                          isBackground: widget.isBackground,
                          invert: imageBrightness == Brightness.dark,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (widget.selected)
            ColoredBox(color: colorScheme.primary.withValues(alpha: 0.5)),
          if (!widget.readOnly)
            ...buildResizeHandles(_activeType),
        ],
      ),
    );

    if (widget.isBackground) {
      return AnimatedPositioned(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        left: widget.image.dstFullRect.left,
        top: widget.image.dstFullRect.top,
        width: widget.image.dstFullRect.width,
        height: widget.image.dstFullRect.height,
        child: unpositioned,
      );
    }

    if (_activeType != Active.crop) {
      return AnimatedPositioned(
        // No animation while dragging or when externally selected.
        duration: (panStartRect != Rect.zero || widget.selected)
            ? Duration.zero
            : const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        left: widget.image.dstFullRect.left,
        top: widget.image.dstFullRect.top,
        width: max(
            widget.image.dstFullRect.width, CanvasImage.minInteractiveSize),
        height: max(
            widget.image.dstFullRect.height, CanvasImage.minInteractiveSize),
        child: unpositioned,
      );
    } else {
      // During crop mode, ensure dstFullRect reflects the latest dstRect so
      // the crop handles are positioned over the full (un-cropped) image.
      widget.image.dstFullRect = widget.image.getDstFullRect();
      return AnimatedPositioned(
        duration: (panStartRect != Rect.zero || widget.selected)
            ? Duration.zero
            : const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        left: widget.image.dstFullRect.left,
        top: widget.image.dstFullRect.top,
        width: max(
            widget.image.dstFullRect.width, CanvasImage.minInteractiveSize),
        height: max(
            widget.image.dstFullRect.height, CanvasImage.minInteractiveSize),
        child: unpositioned,
      );
    }
  }

  /// Builds the set of drag handles appropriate for the current [Active] mode.
  List<Widget> buildResizeHandles(Active activeType) {
    final List<Widget> handles = [];
    switch (activeType) {
      case Active.none:
        break;

      case Active.destination:
      // Eight handles: corners + edge midpoints.
        for (double x = -20; x <= 20; x += 20) {
          for (double y = -20; y <= 20; y += 20) {
            if (x != 0 || y != 0) {
              handles.add(
                _CanvasImageResizeHandle(
                  active: isActive(),
                  position: Offset(x, y),
                  image: widget.image,
                  parent: this,
                  afterDrag: () => setState(() {}),
                ),
              );
            }
          }
        }

      case Active.crop:
      // Four corner handles for the crop rect.
        cropRect = widget.image.dstRect;
        for (double x = -20; x <= 20; x += 40) {
          for (double y = -20; y <= 20; y += 40) {
            handles.add(
              _CanvasImageCropHandle(
                active: isActive(),
                position: Offset(x, y),
                image: widget.image,
                parent: this,
                afterDrag: () => setState(() {}),
              ),
            );
          }
        }
    }
    return handles;
  }

  @override
  void dispose() {
    widget.image.loadOut();
    CanvasImage.activeListener.removeListener(disableActive);
    super.dispose();
  }

  void showModal() {
    showDialog(
      context: context,
      builder: (context) {
        return AdaptiveAlertDialog(
          title: Text(t.editor.imageOptions.title),
          content: CanvasImageDialog(
            filePath: widget.filePath,
            image: widget.image,
            redrawImage: () => setState(() {}),
            isBackground: false,
            toggleAsBackground: () {
              widget.setAsBackground?.call(widget.image);
            },
          ),
          actions: const [],
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Resize handles (destination rect)
// ---------------------------------------------------------------------------

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
    final colorScheme = ColorScheme.of(context);
    return Positioned(
      left: (image.dstRect.topLeft - image.dstFullRect.topLeft).dx +
          (position.dx.sign + 1) / 2 * image.dstRect.width -
          20,
      top: (image.dstRect.topLeft - image.dstFullRect.topLeft).dy +
          (position.dy.sign + 1) / 2 * image.dstRect.height -
          20,
      child: DeferPointer(
        paintOnTop: true,
        child: MouseRegion(
          cursor: () {
            if (!active) return MouseCursor.defer;
            if (position.dx == 0 && position.dy < 0)
              return SystemMouseCursors.resizeUp;
            if (position.dx == 0 && position.dy > 0)
              return SystemMouseCursors.resizeDown;
            if (position.dx < 0 && position.dy == 0)
              return SystemMouseCursors.resizeLeft;
            if (position.dx > 0 && position.dy == 0)
              return SystemMouseCursors.resizeRight;
            if (position.dx < 0 && position.dy < 0)
              return SystemMouseCursors.resizeUpLeft;
            if (position.dx < 0 && position.dy > 0)
              return SystemMouseCursors.resizeDownLeft;
            if (position.dx > 0 && position.dy < 0)
              return SystemMouseCursors.resizeUpRight;
            if (position.dx > 0 && position.dy > 0)
              return SystemMouseCursors.resizeDownRight;
            return MouseCursor.defer;
          }(),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanStart: active
                ? (details) {
              parent.panStartRect = parent.widget.image.dstRect;
              parent.panStartPosition = details.localPosition;
            }
                : null,
            onPanUpdate: active
                ? (details) {
              final Offset delta =
                  details.localPosition - parent.panStartPosition;

              double newWidth;
              if (position.dx < 0) {
                newWidth = parent.panStartRect.width - delta.dx;
              } else if (position.dx > 0) {
                newWidth = parent.panStartRect.width + delta.dx;
              } else {
                newWidth = parent.panStartRect.width;
              }

              double newHeight;
              if (position.dy < 0) {
                newHeight = parent.panStartRect.height - delta.dy;
              } else if (position.dy > 0) {
                newHeight = parent.panStartRect.height + delta.dy;
              } else {
                newHeight = parent.panStartRect.height;
              }

              if (newWidth <= 0 || newHeight <= 0) return;

              // Preserve aspect ratio for corner (diagonal) handles.
              if (position.dx != 0 && position.dy != 0) {
                final aspectRatio =
                    image.dstRect.width / image.dstRect.height;
                if (newWidth / newHeight > aspectRatio) {
                  newHeight = newWidth / aspectRatio;
                } else {
                  newWidth = newHeight * aspectRatio;
                }
              }

              // Resize from the correct anchor corner.
              double left = image.dstRect.left,
                  top = image.dstRect.top;
              if (position.dx < 0) left = image.dstRect.right - newWidth;
              if (position.dy < 0) top = image.dstRect.bottom - newHeight;

              image.dstRect =
                  Rect.fromLTWH(left, top, newWidth, newHeight);
              image.dstFullRect = image.getDstFullRect();
              afterDrag();
            }
                : null,
            onPanEnd: active
                ? (details) {
              if (parent.panStartRect == image.dstRect) return;
              image.onMoveImage?.call(
                image,
                Rect.fromLTRB(
                  image.dstRect.left - parent.panStartRect.left,
                  image.dstRect.top - parent.panStartRect.top,
                  image.dstRect.right - parent.panStartRect.right,
                  image.dstRect.bottom - parent.panStartRect.bottom,
                ),
              );
              parent.panStartRect = Rect.zero;
            }
                : null,
            child: AnimatedOpacity(
              opacity: active ? 1 : 0,
              duration: const Duration(milliseconds: 100),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: colorScheme.onSurface,
                  shape: BoxShape.circle,
                  border:
                  Border.all(color: colorScheme.surface, width: 2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Crop handles (crop rect)
// ---------------------------------------------------------------------------

class _CanvasImageCropHandle extends StatelessWidget {
  const _CanvasImageCropHandle({
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
      // Positioned relative to dstFullRect, using cropRect for dimensions.
      left: (image.dstRect.topLeft - image.dstFullRect.topLeft).dx +
          (position.dx.sign + 1) / 2 * parent.cropRect.width -
          20,
      top: (image.dstRect.topLeft - image.dstFullRect.topLeft).dy +
          (position.dy.sign + 1) / 2 * parent.cropRect.height -
          20,
      child: DeferPointer(
        paintOnTop: true,
        child: MouseRegion(
          cursor: () {
            if (!active) return MouseCursor.defer;
            if (position.dx < 0 && position.dy < 0)
              return SystemMouseCursors.resizeUpLeft;
            if (position.dx < 0 && position.dy > 0)
              return SystemMouseCursors.resizeDownLeft;
            if (position.dx > 0 && position.dy < 0)
              return SystemMouseCursors.resizeUpRight;
            if (position.dx > 0 && position.dy > 0)
              return SystemMouseCursors.resizeDownRight;
            return MouseCursor.defer;
          }(),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onPanStart: active
                ? (details) {
              parent.panStartRect = parent.widget.image.dstRect;
              parent.panStartPosition = details.localPosition;
            }
                : null,
            onPanUpdate: active
                ? (details) {
              final Offset delta =
                  details.localPosition - parent.panStartPosition;

              double newWidth;
              if (position.dx < 0) {
                newWidth = parent.panStartRect.width - delta.dx;
              } else if (position.dx > 0) {
                newWidth = parent.panStartRect.width + delta.dx;
              } else {
                newWidth = parent.panStartRect.width;
              }

              double newHeight;
              if (position.dy < 0) {
                newHeight = parent.panStartRect.height - delta.dy;
              } else if (position.dy > 0) {
                newHeight = parent.panStartRect.height + delta.dy;
              } else {
                newHeight = parent.panStartRect.height;
              }

              if (newWidth <= 0 || newHeight <= 0) return;

              double left = parent.cropRect.left,
                  top = parent.cropRect.top;
              if (position.dx < 0)
                left = parent.cropRect.right - newWidth;
              if (position.dy < 0)
                top = parent.cropRect.bottom - newHeight;

              double right = left + newWidth;
              double bottom = top + newHeight;

              // Clamp crop rect to the full image bounds.
              final Rect fullImageRect = image.getDstFullRect();
              if (left < fullImageRect.left) left = fullImageRect.left;
              if (top < fullImageRect.top) top = fullImageRect.top;
              if (right > fullImageRect.right)
                newWidth = fullImageRect.right - left;
              if (bottom > fullImageRect.bottom)
                newHeight = fullImageRect.bottom - top;

              parent.cropRect =
                  Rect.fromLTWH(left, top, newWidth, newHeight);
              image.srcRect = image
                  .transformRectFromDstToSrcDuringCrop(parent.cropRect);
              image.dstRect = parent.cropRect;
              afterDrag();
            }
                : null,
            onPanEnd: active
                ? (details) {
              if (parent.panStartRect == parent.cropRect) return;
              image.srcRect = image
                  .transformRectFromDstToSrcDuringCrop(parent.cropRect);
              image.dstRect = parent.cropRect;
              image.dstFullRect = image.getDstFullRect();
              image.onMoveImage?.call(
                image,
                Rect.fromLTRB(
                  image.dstRect.left - parent.panStartRect.left,
                  image.dstRect.top - parent.panStartRect.top,
                  image.dstRect.right - parent.panStartRect.right,
                  image.dstRect.bottom - parent.panStartRect.bottom,
                ),
              );
              parent.panStartRect = Rect.zero;
            }
                : null,
            child: AnimatedOpacity(
              opacity: active ? 1 : 0,
              duration: const Duration(milliseconds: 100),
              // Square handle to visually distinguish from round resize handles.
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: colorScheme.onSurface,
                  shape: BoxShape.rectangle,
                  border:
                  Border.all(color: colorScheme.surface, width: 2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}