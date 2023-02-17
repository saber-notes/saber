
import 'dart:math';

import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:worker_manager/worker_manager.dart';

class CanvasImage extends StatefulWidget {
  CanvasImage({
    required this.filePath,
    required this.image,
    this.overrideBoxFit,
    required this.pageSize,
    required this.setAsBackground,
    this.isBackground = false,
    this.readOnly = false,
  }) : super(key: Key('CanvasImage$filePath/${image.id}'));

  /// The path to the note that this image is in.
  final String filePath;
  final EditorImage image;
  final BoxFit? overrideBoxFit;
  final Size pageSize;
  final void Function(EditorImage image)? setAsBackground;
  final bool isBackground;
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

  Brightness imageBrightness = Brightness.light;

  bool invertStarted = false;

  Rect panStartRect = Rect.zero;
  Offset panStartPosition = Offset.zero;

  @override
  void initState() {
    if (widget.image.newImage) { // if the image is new, make it [active]
      active = true;
      widget.image.newImage = false;
    }

    if (Prefs.appTheme.value == ThemeMode.system.index || Prefs.appTheme.value == ThemeMode.dark.index) {
      // invert the image pre-emptively if we're likely to switch to dark mode
      invertImage();
    }

    CanvasImage.activeListener.addListener(disableActive);

    super.initState();
  }

  void disableActive() {
    if (!active) return;
    setState(() {
      active = false;
    });
  }

  Future invertImage() async {
    if (!mounted) return;

    // wait for thumbnail to be inverted if needed
    while (!widget.image.loaded) {
      await Future.delayed(const Duration(milliseconds: 50));
    }

    if (widget.image.invertedBytesCache != null) {
      // if we've already inverted the image, use the cached version
      return;
    } else if (widget.image.extension == '.svg') {
      // SVGs are inverted when they're loaded
      return;
    } else if (widget.image.isThumbnail || widget.image.thumbnailBytes == null) {
      // if image is a thumbnail (or thumbnail sized), we've already inverted it
      return;
    }

    if (invertStarted) return;
    invertStarted = true;

    Uint8List? inverted = await Executor().execute(fun1: EditorImage.invertImageIsolate, arg1: widget.image.bytes);
    if (!mounted) return;
    if (inverted == null) return;
    setState(() {
      widget.image.invertedBytesCache = inverted;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Brightness currentBrightness = Theme.of(context).brightness;
    if (!widget.image.invertible) currentBrightness = Brightness.light;

    if (Prefs.editorAutoInvert.value && currentBrightness != imageBrightness) {
      if (currentBrightness == Brightness.dark) {
        invertImage();
      }
      imageBrightness = currentBrightness;
    }

    Widget unpositioned = IgnorePointer(
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
                    width: widget.isBackground
                      ? widget.pageSize.width
                      : max(widget.image.dstRect.width, CanvasImage.minImageSize),
                    height: widget.isBackground
                      ? widget.pageSize.height
                      : max(widget.image.dstRect.height, CanvasImage.minImageSize),
                    child: SizedOverflowBox(
                      size: widget.image.srcRect.size,
                      child: Transform.translate(
                        offset: -widget.image.srcRect.topLeft,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          switchInCurve: Curves.fastLinearToSlowEaseIn,
                          switchOutCurve: Curves.fastLinearToSlowEaseIn.flipped,
                          child: widget.image.buildImageWidget(
                            imageBrightness: imageBrightness,
                            overrideBoxFit: widget.overrideBoxFit,
                            isBackground: widget.isBackground,
                          ),
                          layoutBuilder: (currentChild, previousChildren) {
                            return SizedBox(
                              width: widget.image.naturalSize.width,
                              height: widget.image.naturalSize.height,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  ...previousChildren,
                                  if (currentChild != null) currentChild
                                  else Container(
                                    color: Colors.grey,
                                    child: const Center(
                                      child: Icon(Icons.image, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (!widget.readOnly)
            for (double x = -20; x <= 20; x += 20)
              for (double y = -20; y <= 20; y += 20)
                if (x != 0 || y != 0) // ignore (0,0)
                  _CanvasImageResizeHandle(
                    active: active,
                    position: Offset(x, y),
                    image: widget.image,
                    parent: this,
                    afterDrag: () => setState(() {}),
                  ),
        ],
      ),
    );

    if (widget.isBackground) {
      return AnimatedPositioned(
        left: 0,
        top: 0,
        right: 0,
        bottom: 0,
        duration: const Duration(milliseconds: 200),
        child: unpositioned,
      );
    }
    return AnimatedPositioned(
      // duration is zero if we're currently dragging the image
      duration: (panStartRect != Rect.zero) ? Duration.zero : const Duration(milliseconds: 200),

      left: widget.image.dstRect.left,
      top: widget.image.dstRect.top,
      width: max(widget.image.dstRect.width, CanvasImage.minInteractiveSize),
      height: max(widget.image.dstRect.height, CanvasImage.minInteractiveSize),

      child: unpositioned,
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
        return AdaptiveAlertDialog(
          title: Text(t.editor.imageOptions.title),
          content: _CanvasImageDialog(
            image: widget.image,
            parent: this,
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
      left: (position.dx.sign + 1) / 2 * image.dstRect.width - 20,
      top: (position.dy.sign + 1) / 2 * image.dstRect.height - 20,
      child: DeferPointer(
        paintOnTop: true,
        child: MouseRegion(
          cursor: (){
            if (!active) return MouseCursor.defer;

            if (position.dx == 0 && position.dy < 0) return SystemMouseCursors.resizeUp;
            if (position.dx == 0 && position.dy > 0) return SystemMouseCursors.resizeDown;
            if (position.dx < 0 && position.dy == 0) return SystemMouseCursors.resizeLeft;
            if (position.dx > 0 && position.dy == 0) return SystemMouseCursors.resizeRight;

            if (position.dx < 0 && position.dy < 0) return SystemMouseCursors.resizeUpLeft;
            if (position.dx < 0 && position.dy > 0) return SystemMouseCursors.resizeDownLeft;
            if (position.dx > 0 && position.dy < 0) return SystemMouseCursors.resizeUpRight;
            if (position.dx > 0 && position.dy > 0) return SystemMouseCursors.resizeDownRight;

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
              if (position.dx != 0 && position.dy != 0) { // if diagonal
                final double aspectRatio = image.dstRect.width / image.dstRect.height;
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
  void setInvertible([bool? value]) => setState(() {
    widget.image.invertible = value ?? !widget.image.invertible;
    widget.image.onMiscChange?.call();
    widget.parent.setState(() {});
  });

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final cupertino = platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;

    final gridView = GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      shrinkWrap: true,
      children: [
        MergeSemantics(
          child: _CanvasImageDialogItem(
            onTap: Prefs.editorAutoInvert.value ? setInvertible : null,
            title: t.editor.imageOptions.invertible,
            child: Switch.adaptive(
              value: widget.image.invertible,
              onChanged: Prefs.editorAutoInvert.value ? setInvertible : null,
              thumbIcon: MaterialStateProperty.all(
                widget.image.invertible
                  ? const Icon(Icons.invert_colors)
                  : const Icon(Icons.invert_colors_off)
              ),
            ),
          ),
        ),
        _CanvasImageDialogItem(
          onTap: () {
            final String filePathSanitized = widget.parent.widget.filePath.replaceAll(RegExp(r'[^a-zA-Z\d]'), '_');
            final String imageFileName = "image$filePathSanitized${widget.image.id}${widget.image.extension}";
            FileManager.exportFile(imageFileName, widget.image.bytes, isImage: true);
            Navigator.of(context).pop();
          },
          title: t.editor.imageOptions.download,
          child: const AdaptiveIcon(
            icon: Icons.download,
            cupertinoIcon: CupertinoIcons.arrow_down_circle_fill,
          ),
        ),
        _CanvasImageDialogItem(
          onTap: () {
            widget.parent.widget.setAsBackground?.call(widget.image);
            Navigator.of(context).pop();
          },
          title: t.editor.imageOptions.setAsBackground,
          child: const AdaptiveIcon(
            icon: Icons.wallpaper,
            cupertinoIcon: CupertinoIcons.photo_fill_on_rectangle_fill,
          ),
        ),
        _CanvasImageDialogItem(
          onTap: () {
            widget.image.onDeleteImage?.call(widget.image);
            Navigator.of(context).pop();
          },
          title: t.editor.imageOptions.delete,
          child: const AdaptiveIcon(
            icon: Icons.delete,
            cupertinoIcon: CupertinoIcons.trash_fill,
          ),
        ),
      ],
    );

    // issues with intrinsic sizes with each type of dialog
    if (cupertino) {
      return AspectRatio(
        aspectRatio: 1,
        child: gridView,
      );
    } else {
      return SizedBox(
        width: 250,
        child: gridView,
      );
    }
  }

}

class _CanvasImageDialogItem extends StatelessWidget {
  const _CanvasImageDialogItem({
    // ignore: unused_element
    super.key,
    required this.onTap,
    required this.title,
    required this.child,
  });

  final VoidCallback? onTap;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: colorScheme.primary.withOpacity(0.05),
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            children: [
              Expanded(child: child),
              Text(
                title,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
