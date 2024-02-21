import 'dart:math';
import 'dart:ui' as ui;

import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/canvas_image_dialog.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/components/canvas/invert_shader.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/data/extensions/change_notifier_extensions.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

// type of activity with image
enum Active {
  none,          // is not active any image manipulation
  destination,   // setting destination rect
  crop,          // setting crop rect
}

/// crop image by given rect - used to crop image
class ImgClipper extends CustomClipper<Rect> {
  ImgClipper(
      this.clipRect,
  );
  final Rect clipRect;  // rectangle used to crop Image

  @override
  Rect getClip(Size size) {//
    return clipRect;
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}

class CanvasImage extends StatefulWidget {
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
  Active _activeType = Active.none; // activity with image

  bool isActive(){
    /// return True if is active.
    /// only if active type is not none
    return(_activeType!=Active.none);
  }

  Active get activeType => _activeType;
  set activeType(Active value) {
    if (activeType == value) return;  // no change in activity

    if (!isActive() && value!=Active.none) {
      // activating Active - deactivate listeners
      CanvasImage.activeListener
          .notifyListenersPlease(); // de-activate all other images (even this image)
    }
    _activeType = value;  // set active state
    widget.image.showCroppedImage=_activeType!=Active.crop; // if active state is not crop, then show cropped image

    if (mounted) {
      try {
        setState(() {});
      } catch (e) {
        // setState throws error if widget is currently building
      }
    }
  }

  Active setNextActive(){
    /// provide next active type to the current one
    switch(_activeType) {
      case Active.none:
        return(Active.destination);
      case Active.destination:
        return(Active.crop);
      case Active.crop:
        return(Active.none);  // not active
    }
  }

  Brightness imageBrightness = Brightness.light;

  late ui.FragmentShader shader = InvertShader.create();

  // used when dragging or resizing image
  Rect panStartRect = Rect.zero;
  Offset panStartPosition = Offset.zero;
  // used when cropping image
  Rect cropRect = Rect.zero;
  Rect cropStartRect = Rect.zero;

  // return clip rectangle used to crop image
  Rect getClipRect(){
    if (widget.image.showCroppedImage) {
      Offset o = widget.image.dstRect.topLeft-widget.image.dstFullRect.topLeft;
      Rect clipRect=o&widget.image.dstRect.size; // offset dstRect by its distance from topLeft of full image
      return (clipRect);
    }
    else {
      return (Offset.zero & widget.image.dstFullRect.size);
    }
  }


  @override
  void initState() {
    widget.image.loadIn();

    if (widget.image.newImage) {
      // if the image is new, make it [active]
      activeType = Active.destination;  // set active to destination rect
      widget.image.newImage = false;
    }

    widget.image.addListener(imageListener);
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
    final colorScheme = Theme.of(context).colorScheme;

    Brightness currentBrightness = Theme.of(context).brightness;
    if (!widget.image.invertible) currentBrightness = Brightness.light;

    if (Prefs.editorAutoInvert.value && currentBrightness != imageBrightness) {
      imageBrightness = currentBrightness;
    }

    Widget unpositioned = IgnorePointer(
      ignoring: widget.readOnly,
      child: Stack(
        fit: StackFit.expand,
        children: [
          MouseRegion(
            cursor: isActive() ? SystemMouseCursors.grab : MouseCursor.defer,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                activeType = setNextActive();  // set next type of activity with image
              },
              onLongPress: isActive() ? showModal : null,
              onSecondaryTap: isActive() ? showModal : null,
              onPanStart: isActive()
                  ? (details) {
                      panStartRect = widget.image.dstRect;
                      cropRect= widget.image.dstRect;
                    }
                  : null,
              onPanUpdate: isActive()
                  ? (details) {
                      setState(() {
                        double fivePercent = min(widget.pageSize.width * 0.05,
                            widget.pageSize.height * 0.05);
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
                        widget.image.dstFullRect=widget.image.getDstFullRect(); // update full rect
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
                          ));
                      panStartRect = Rect.zero;
                    }
                  : null,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                      isActive() ? colorScheme.onBackground : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: SizedBox(
                    width: widget.isBackground
                        ? widget.pageSize.width
                        : max(widget.image.dstFullRect.width,
                            CanvasImage.minImageSize),
                    height: widget.isBackground
                        ? widget.pageSize.height
                        : max(widget.image.dstFullRect.height,
                            CanvasImage.minImageSize),
//                    child: Container(
//                      color: Colors.red,
                    child: ClipRect( // cliping is done in the sized box. I means that full image topLeft is (0,0)
                      clipper: ImgClipper(
                          getClipRect() // return clip rectangle according to actual action
                      ),
                      child: SizedOverflowBox(
                        size: widget.image.naturalSize,  // size of full image
                        child: Transform.translate(
                          offset: Offset.zero, //-widget.image.srcRect.topLeft,
//                          child: Container(
//                            color: Colors.blue,
                            child: SizedBox(
                              height: widget.image.dstFullRect.height,
                              width: widget.image.dstFullRect.width,
                                  child: Container(
                                    height: widget.image.dstFullRect.height,
                                    width: widget.image.dstFullRect.width,
                                  color: Colors.yellow,
                                  child: widget.image.buildImageWidget(
                                    context: context,
                                    overrideBoxFit: widget.overrideBoxFit,
                                    isBackground: widget.isBackground,
                                    shaderEnabled: imageBrightness == Brightness.dark,
                                    shaderBuilder: (ui.Image image, Size size) {
                                      shader.setFloat(0, size.width);
                                      shader.setFloat(1, size.height);
                                      shader.setImageSampler(0, image);
                                      return shader;
                                    },
                                  ),
                                ),
                              ),
//                            ),
                          ),
                        ),
                      ),
//                    ),
                  ),
                ),
              ),
            ),
          ),
          if (widget.selected) // tint image if selected
            ColoredBox(
              color: colorScheme.primary.withOpacity(0.5),
            ),
          if (!widget.readOnly)
            ...buildResizeHandles(_activeType),  // add set of handles manipulating image to Stack using spread separator ...
        ],
      ),
    );

    if (widget.isBackground) {
      return AnimatedPositioned(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        left: 0,
        top: 0,
        right: 0,
        bottom: 0,
        child: unpositioned,
      );
    }
    if (_activeType!=Active.crop) {
      return AnimatedPositioned(
        // no animation if the image is being dragged or it's selected
        duration: (panStartRect != Rect.zero || widget.selected)
            ? Duration.zero
            : const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        left: widget.image.dstFullRect.left,
        top: widget.image.dstFullRect.top,
        width: max(widget.image.dstFullRect.width, CanvasImage.minInteractiveSize),
        height: max(
            widget.image.dstFullRect.height, CanvasImage.minInteractiveSize),
        child: unpositioned,
      );
    }
    else {
      // image is cropped, actualize image FullRect
      widget.image.dstFullRect=widget.image.getDstFullRect();
      // and set that animated handles can move over Full image rectangle
      return AnimatedPositioned(
        // no animation if the image is being dragged or it's selected
        duration: (panStartRect != Rect.zero || widget.selected)
            ? Duration.zero
            : const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        left: widget.image.dstFullRect.left,
        top: widget.image.dstFullRect.top,
        width: max(widget.image.dstFullRect.width, CanvasImage.minInteractiveSize),
        height: max(
            widget.image.dstFullRect.height, CanvasImage.minInteractiveSize),

        child: unpositioned,
      );
    }
  }


  /// create a set of handles to manipulate image depending of type of Active
  List<Widget> buildResizeHandles(Active activeType){
    /// create "handles" to resize image or crop image
    List<Widget> handles = [];
    switch(activeType) {
      case Active.none:
        break;
      case Active.destination:
        // create handles in corners and centers of edges
        for (double x = -20; x <= 20; x += 20){
          for (double y = -20; y <= 20; y += 20){
            if (x != 0 || y != 0){ // ignore (0,0)
              handles.add(
                  _CanvasImageResizeHandle(
                    active: isActive(),
                    position: Offset (x, y),
                    image: widget.image,
                    parent: this,
                    afterDrag: () => setState(() {}),
                  )
              );
            }
          }
        }
      case Active.crop:
        // first record of dstRect to auxiliary cropRect
        cropRect= widget.image.dstRect;
        // create handles in corners
        for (double x = -20; x <= 20; x += 40){
          for (double y = -20; y <= 20; y += 40){
            handles.add(
                _CanvasImageCropHandle(
                  active: isActive(),
                  position: Offset (x, y),
                  image: widget.image,
                  parent: this,
                  afterDrag: () => setState(() {}),
                )
            );
          }
        }
    }
    return(handles);
  }


  @override
  void dispose() {
    widget.image.loadOut();
    widget.image.removeListener(imageListener);
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
      left: (image.dstRect.topLeft-image.dstFullRect.topLeft).dx+ (position.dx.sign + 1) / 2 * image.dstRect.width - 20,// calculate position of handle according to current dstRect
      top: (image.dstRect.topLeft-image.dstFullRect.topLeft).dy+ (position.dy.sign + 1) / 2 * image.dstRect.height - 20,// dstRect is recalculated when moving handles
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

                    // preserve aspect ratio if diagonal
                    if (position.dx != 0 && position.dy != 0) {
                      // if diagonal
                      final double aspectRatio =
                          image.dstRect.width / image.dstRect.height;
                      if (newWidth / newHeight > aspectRatio) {
                        newHeight = newWidth / aspectRatio;
                      } else {
                        newWidth = newHeight * aspectRatio;
                      }
                    }

                    // resize from the correct corner
                    double left = image.dstRect.left, top = image.dstRect.top;
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
                    image.dstFullRect=image.getDstFullRect(); // update image full rect according new dstRect
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
                        ));
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

class _CanvasImageCropHandle extends StatelessWidget {
  // handles in corners of image handling croprect
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
      left: (image.dstRect.topLeft-image.dstFullRect.topLeft).dx+ (position.dx.sign + 1) / 2 * parent.cropRect.width - 20,  // use positions of handles according to cropRect stored in parent
      top: (image.dstRect.topLeft-image.dstFullRect.topLeft).dy+ (position.dy.sign + 1) / 2 * parent.cropRect.height - 20,
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

              // resize from the correct corner
              double left = parent.cropRect.left, top = parent.cropRect.top;
              if (position.dx < 0) {
                left = parent.cropRect.right - newWidth;
              }
              if (position.dy < 0) {
                top = parent.cropRect.bottom - newHeight;
              }
              double right=left+newWidth;
              double bottom=top+newHeight;

              // check if crop rect is not over full rect of image in destination coordinates
              Rect fullImageRect=image.getDstFullRect();
              if (left<fullImageRect.left) {
                left=fullImageRect.left;
              }
              if (top<fullImageRect.top) {
                top=fullImageRect.top;
              }
              // because left and top can have changed, we should check size with respect to original left and top
              if (right>fullImageRect.right) {
                newWidth=fullImageRect.right-left;
              }
              if (bottom>fullImageRect.bottom) {
                newHeight=fullImageRect.bottom-top;
              }
              parent.cropRect=Rect.fromLTWH( // this is rectangle given by handles is cropRect and also dstRect
                left,
                top,
                newWidth,
                newHeight,
              );
              // recalculate given crop rect given by current selection to image source coordinates
              image.srcRect=image.transformRectFromDstToSrcDuringCrop(parent.cropRect);
              image.dstRect=parent.cropRect;
              // image dstFullRect is not changed, because we are not scaling image
              afterDrag();
            }
                : null,
            onPanEnd: active
                ? (details) {
              if (parent.panStartRect == parent.cropRect) return;
              // now parent.cropRect is new image.dstRect
              // image.cropRect should be recalculated with respect to rectangle of image.srcRect
              parent.cropRect=parent.panStartRect.topLeft&parent.panStartRect.size/2;
              parent.cropRect=parent.cropRect.shift(Offset(50,50));
              image.srcRect=image.transformRectFromDstToSrcDuringCrop(parent.cropRect); // this is full rect
              image.dstRect=parent.cropRect;  // and set destination rect to size of cropRect
              image.dstFullRect=image.getDstFullRect(); // update full rect
//              image.onMoveImage?.call(
//                  image,
//                  Rect.fromLTRB(
//                    image.dstRect.left - parent.panStartRect.left,
//                    image.dstRect.top - parent.panStartRect.top,
//                    image.dstRect.right - parent.panStartRect.right,
//                    image.dstRect.bottom - parent.panStartRect.bottom,
//                  ));
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
                  color: colorScheme.onBackground,
                  shape: BoxShape.rectangle,
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
