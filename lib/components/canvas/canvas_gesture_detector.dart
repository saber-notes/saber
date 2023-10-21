import 'dart:collection';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keybinder/keybinder.dart';
import 'package:saber/components/canvas/hud/canvas_hud.dart';
import 'package:saber/components/canvas/interactive_canvas.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:vector_math/vector_math_64.dart';

class CanvasGestureDetector extends StatefulWidget {
  CanvasGestureDetector({
    super.key,

    required this.filePath,

    required this.isDrawGesture,
    this.onInteractionEnd,
    required this.onDrawStart,
    required this.onDrawUpdate,
    required this.onDrawEnd,
    required this.onPressureChanged,
    required this.onStylusButtonChanged,

    required this.undo,
    required this.redo,

    required this.pages,
    required this.initialPageIndex,
    required this.pageBuilder,
    required this.placeholderPageBuilder,

    TransformationController? transformationController,
  })  : _transformationController = transformationController ?? TransformationController();

  final String filePath;

  final bool Function(ScaleStartDetails scaleDetails) isDrawGesture;
  final ValueChanged<ScaleEndDetails>? onInteractionEnd;
  final ValueChanged<ScaleStartDetails> onDrawStart;
  final ValueChanged<ScaleUpdateDetails> onDrawUpdate;
  final ValueChanged<ScaleEndDetails> onDrawEnd;
  /// Called when the pressure of the stylus changes,
  /// pressure is negative if stylus button is pressed
  final ValueChanged<double?> onPressureChanged;
  final ValueChanged<bool> onStylusButtonChanged;

  final VoidCallback undo;
  final VoidCallback redo;

  final List<EditorPage> pages;
  final int? initialPageIndex;
  final Widget Function(BuildContext context, int pageIndex) pageBuilder;
  final Widget Function(BuildContext context, int pageIndex) placeholderPageBuilder;

  late final TransformationController _transformationController;

  @override
  State<CanvasGestureDetector> createState() => CanvasGestureDetectorState();

  static const double kMinScale = 0.3;
  static const double kMaxScale = 5;

  static double getTopOfPage({
    required int pageIndex,
    required List<EditorPage> pages,
    required double screenWidth,
  }) {
    if (pageIndex <= 0) return 0;

    double top = 0;

    for (int i = 0; i < pageIndex && i < pages.length; i++) {
      final pageSize = pages[i].size;

      /// Since we use a FittedBox, the actual width of the page
      /// is the minimum of the page width and the screen width.
      final pageWidthFitted = min(pageSize.width, screenWidth);

      top += 16;
      top += pageSize.height * (pageWidthFitted / pageSize.width);
    }

    return top;
  }
  static void scrollToPage({
    required int pageIndex,
    required List<EditorPage> pages,
    required double screenWidth,
    required TransformationController transformationController,
  }) {
    final topOfPage = -CanvasGestureDetector.getTopOfPage(
      pageIndex: pageIndex,
      pages: pages,
      screenWidth: screenWidth,
    );
    transformationController.value = Matrix4.translationValues(
      0,
      // Slight upwards offset so that the page is not flush with the top of the screen
      topOfPage + 50,
      0,
    );
  }
  static int getPageIndex({
    required double scrollY,
    required List<EditorPage> pages,
    required double screenWidth,
  }) {
    if (scrollY <= 0) return 0;

    double top = 0;

    for (int i = 0; i < pages.length; i++) {
      final pageSize = pages[i].size;

      /// Since we use a FittedBox, the actual width of the page
      /// is the minimum of the page width and the screen width.
      final pageWidthFitted = min(pageSize.width, screenWidth);

      top += 16;
      top += pageSize.height * (pageWidthFitted / pageSize.width);

      if (top > scrollY) return i;
    }

    return pages.length - 1;
  }
}

class CanvasGestureDetectorState extends State<CanvasGestureDetector> {
  late BoxConstraints containerBounds = const BoxConstraints();

  /// If zooming is locked, this is the zoom level.
  /// Otherwise, this is null.
  late double? zoomLockedValue = Prefs.lastZoomLock.value
      ? widget._transformationController.value.getMaxScaleOnAxis()
      : null;
  /// Whether single-finger panning is locked.
  /// Two-finger panning is always enabled.
  late bool singleFingerPanLock = Prefs.lastSingleFingerPanLock.value;
  /// Whether panning is locked to being horizontal or vertical.
  /// Otherwise, panning can be done in any (i.e. diagonal) direction.
  late bool axisAlignedPanLock = Prefs.lastAxisAlignedPanLock.value;

  void zoomIn() => widget._transformationController.value = setZoom(
    scaleDelta: 0.1,
    transformation: widget._transformationController.value,
    containerBounds: containerBounds,
  ) ?? widget._transformationController.value;
  void zoomOut() => widget._transformationController.value = setZoom(
    scaleDelta: -0.1,
    transformation: widget._transformationController.value,
    containerBounds: containerBounds,
  ) ?? widget._transformationController.value;
  @visibleForTesting
  static Matrix4? setZoom({
    required double scaleDelta,
    required Matrix4 transformation,
    required BoxConstraints containerBounds,
  }) {
    final oldScale = transformation.getMaxScaleOnAxis();
    final newScale = oldScale + scaleDelta;

    if (newScale < CanvasGestureDetector.kMinScale) return null;
    if (newScale > CanvasGestureDetector.kMaxScale) return null;

    final center = Vector3(
      containerBounds.maxWidth / 2,
      containerBounds.maxHeight / 2,
      0,
    );
    final translation = (transformation.getTranslation() - center)
        * (newScale / oldScale) + center;

    return Matrix4.translation(translation)
        ..scale(newScale);
  }

  Keybinding? _ctrlPlus, _ctrlEquals, _ctrlMinus;
  void _assignKeybindings() {
    _ctrlPlus = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.add)], inclusive: true);
    _ctrlEquals = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.equal)], inclusive: true);
    _ctrlMinus = Keybinding([KeyCode.ctrl, KeyCode.from(LogicalKeyboardKey.minus)], inclusive: true);
    Keybinder.bind(_ctrlPlus!, zoomIn);
    Keybinder.bind(_ctrlEquals!, zoomIn);
    Keybinder.bind(_ctrlMinus!, zoomOut);
  }
  void _removeKeybindings() {
    if (_ctrlPlus != null) Keybinder.remove(_ctrlPlus!);
    if (_ctrlEquals != null) Keybinder.remove(_ctrlEquals!);
    if (_ctrlMinus != null) Keybinder.remove(_ctrlMinus!);
  }

  @override
  void initState() {
    setInitialTransform();
    widget._transformationController.addListener(onTransformChanged);
    _assignKeybindings();
    super.initState();
  }

  /// When the widget is created, we still have an empty coreInfo.
  /// Wait for note to be loaded before setting the initial transform.
  @override
  void didUpdateWidget(CanvasGestureDetector oldWidget) {
    if (oldWidget.initialPageIndex != widget.initialPageIndex
        || oldWidget.filePath != widget.filePath) {
      setInitialTransform();
    }
    super.didUpdateWidget(oldWidget);
  }

  /// Sets the initial transform so that we're scrolled to the correct page.
  /// Has no effect if note hasn't yet loaded or if the user has already scrolled.
  void setInitialTransform() {
    // wait for note to be loaded
    if (widget.filePath.isEmpty) return;

    // don't override user's scroll
    if (!widget._transformationController.value.isIdentity()) return;

    final transformCacheItem = CanvasTransformCache.get(widget.filePath);

    if (transformCacheItem != null) {
      // if we're opening the same note, restore the last transform
      widget._transformationController.value = transformCacheItem.transform;
      if (zoomLockedValue != null) {
        zoomLockedValue = transformCacheItem.transform.getMaxScaleOnAxis();
      }
    } else if (widget.initialPageIndex != null) {
      // if we're opening a different note, scroll to the last recorded page
      CanvasGestureDetector.scrollToPage(
        pageIndex: widget.initialPageIndex!,
        pages: widget.pages,
        screenWidth: MediaQuery.of(context).size.width,
        transformationController: widget._transformationController,
      );
    }
  }

  /// Corrects the transform if it's out of bounds.
  /// If the scale is less than 1, centers the pages horizontally.
  /// Otherwise, prevents the user from scrolling past the edges.
  void onTransformChanged() {
    final scale = widget._transformationController.value.getMaxScaleOnAxis();
    final translation = widget._transformationController.value.getTranslation();

    double adjustmentX = 0;
    double adjustmentY = 0;

    // horizontally center pages if zoomed out
    if (scale < 1) {
      final center = containerBounds.maxWidth * (1 - scale) / 2;
      adjustmentX = center - translation.x;
    }

    // if zoomed in, don't allow scrolling past the edges
    else {
      late final minX = containerBounds.maxWidth * (1 - scale);
      if (translation.x > 0) {
        adjustmentX = -translation.x;
      } else if (translation.x < minX) {
        adjustmentX = minX - translation.x;
      }

      if (translation.y > 0) {
        adjustmentY = -translation.y;
      }
    }

    if (adjustmentX.abs() > 0.1 || adjustmentY.abs() > 0.1) {
      widget._transformationController.value.leftTranslate(
        adjustmentX,
        adjustmentY,
      );
    }
  }

  /// Resets the zoom level to 1.0x
  void resetZoom() {
    final transformation = widget._transformationController.value;
    final scale = transformation.getMaxScaleOnAxis();
    if (scale == 1) return;

    widget._transformationController.value = setZoom(
      scaleDelta: 1 - scale,
      transformation: transformation,
      containerBounds: containerBounds,
    ) ?? transformation;
  }

  void _listenerPointerEvent(PointerEvent event) {
    double? pressure;
    bool stylusButtonPressed = false;

    if (event.kind == PointerDeviceKind.stylus) {
      pressure = event.pressure;
      stylusButtonPressed = event.buttons == kPrimaryStylusButton;
    } else if (event.kind == PointerDeviceKind.invertedStylus) {
      pressure = event.pressure;
      stylusButtonPressed = true; // treat eraser as stylus button
    } else if (Platform.isLinux && event.pressureMin != event.pressureMax) {
      // if min == max, then the device isn't pressure sensitive
      pressure = event.pressure;
    }

    widget.onPressureChanged(pressure);
    widget.onStylusButtonChanged(stylusButtonPressed);
  }

  void _listenerPointerUpEvent(PointerEvent event) {
    widget.onPressureChanged(null);
    widget.onStylusButtonChanged(false);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Listener(
          onPointerDown: _listenerPointerEvent,
          onPointerMove: _listenerPointerEvent,
          onPointerUp: _listenerPointerUpEvent,
          child: GestureDetector(
            onSecondaryTapUp: (TapUpDetails details) => widget.undo(),
            onTertiaryTapUp: (TapUpDetails details) => widget.redo(),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints containerBounds) {
                this.containerBounds = containerBounds;

                return InteractiveCanvasViewer.builder(
                  minScale: zoomLockedValue ?? CanvasGestureDetector.kMinScale,
                  maxScale: zoomLockedValue ?? CanvasGestureDetector.kMaxScale,
                  panEnabled: !singleFingerPanLock,
                  panAxis: axisAlignedPanLock ? PanAxis.aligned : PanAxis.free,

                  interactionEndFrictionCoefficient: InteractiveCanvasViewer.kDrag * 100,

                  // we need a non-zero boundary margin so we can zoom out
                  // past the size of the page (for minScale < 1)
                  boundaryMargin: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: screenSize.width * 2,
                  ),

                  transformationController: widget._transformationController,

                  isDrawGesture: widget.isDrawGesture,
                  onInteractionEnd: widget.onInteractionEnd,
                  onDrawStart: widget.onDrawStart,
                  onDrawUpdate: widget.onDrawUpdate,
                  onDrawEnd: widget.onDrawEnd,

                  builder: (BuildContext context, Quad viewport) {
                    return _PagesBuilder(
                      pages: widget.pages,
                      pageBuilder: widget.pageBuilder,
                      placeholderPageBuilder: widget.placeholderPageBuilder,
                      boundingBox: _axisAlignedBoundingBox(viewport),
                      containerWidth: containerBounds.maxWidth,
                    );
                  },
                );
              },
            ),
          ),
        ),
        Positioned.fill(
          child: CanvasHud(
            transformationController: widget._transformationController,
            zoomLock: zoomLockedValue != null,
            setZoomLock: (bool zoomLock) => setState(() {
              zoomLockedValue = zoomLock
                  ? widget._transformationController.value.getMaxScaleOnAxis()
                  : null;
              Prefs.lastZoomLock.value = zoomLock;
            }),
            resetZoom: zoomLockedValue != null ? null : resetZoom,
            singleFingerPanLock: singleFingerPanLock,
            setSingleFingerPanLock: (bool singleFingerPanLock) => setState(() {
              this.singleFingerPanLock = singleFingerPanLock;
              Prefs.lastSingleFingerPanLock.value = singleFingerPanLock;
            }),
            axisAlignedPanLock: axisAlignedPanLock,
            setAxisAlignedPanLock: (bool axisAlignedPanLock) => setState(() {
              this.axisAlignedPanLock = axisAlignedPanLock;
              Prefs.lastAxisAlignedPanLock.value = axisAlignedPanLock;
            }),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    CanvasTransformCache.add(widget.filePath, widget._transformationController.value);
    widget._transformationController.removeListener(onTransformChanged);
    widget._transformationController.dispose();
    _removeKeybindings();
    super.dispose();
  }

  /// Returns the axis aligned bounding box for the given Quad,
  /// which might not be axis aligned.
  /// From https://api.flutter.dev/flutter/widgets/InteractiveViewer/builder.html
  static Rect _axisAlignedBoundingBox(Quad quad) {
    final List<Vector3> points = [
      quad.point0,
      quad.point1,
      quad.point2,
      quad.point3,
    ];

    final List<double> xValues = points.map((Vector3 point) => point.x).toList();
    final List<double> yValues = points.map((Vector3 point) => point.y).toList();

    final double left = xValues.reduce(min);
    final double right = xValues.reduce(max);
    final double top = yValues.reduce(min);
    final double bottom = yValues.reduce(max);

    return Rect.fromLTRB(left, top, right, bottom);
  }
}

class _PagesBuilder extends StatelessWidget {
  const _PagesBuilder({
    // ignore: unused_element
    super.key,

    required this.pages,
    required this.pageBuilder,
    required this.placeholderPageBuilder,
    required this.boundingBox,
    required this.containerWidth,
  });

  final List<EditorPage> pages;
  final Widget Function(BuildContext context, int pageIndex) pageBuilder;
  final Widget Function(BuildContext context, int pageIndex) placeholderPageBuilder;
  final Rect boundingBox;
  final double containerWidth;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      const SizedBox.square(dimension: Editor.gapBetweenPages),
      const SizedBox.square(dimension: Editor.gapBetweenPages),
    ];

    double topOfPage = Editor.gapBetweenPages * 2;
    for (int pageIndex = 0; pageIndex < pages.length; pageIndex++) {
      final Size pageSize = pages[pageIndex].size;
      final double pageWidth = min(pageSize.width, containerWidth); // because of FittedBox
      final double pageHeight = pageWidth / pageSize.width * pageSize.height;
      final double bottomOfPage = topOfPage + pageHeight;

      if (topOfPage > boundingBox.bottom || bottomOfPage < boundingBox.top) {
        pages[pageIndex].isRendered = false;
        children.add(placeholderPageBuilder(context, pageIndex));
      } else {
        pages[pageIndex].isRendered = true;
        children.add(pageBuilder(context, pageIndex));
      }

      children.add(const SizedBox.square(dimension: Editor.gapBetweenPages));

      topOfPage = bottomOfPage + Editor.gapBetweenPages;
    }

    children.add(const SizedBox.square(dimension: Editor.gapBetweenPages));
    return Column(children: children);
  }
}

@visibleForTesting
class CanvasTransformCache {
  static const int _maxCacheSize = 5;
  static final _cache = LinkedList<CanvasTransformCacheItem>();

  CanvasTransformCache._();

  static void add(String filePath, Matrix4 transform) {
    for (final entry in _cache) {
      if (entry.filePath != filePath) continue;
      entry.unlink();
      break;
    }
    _cache.add(CanvasTransformCacheItem(filePath, transform));

    if (_cache.length > _maxCacheSize) {
      _cache.first.unlink();
    }
  }

  static CanvasTransformCacheItem? get(String filePath) {
    try {
      return _cache.firstWhere((item) => item.filePath == filePath);
    } on StateError {
      return null;
    }
  }

  @visibleForTesting
  static void clear() {
    _cache.clear();
  }
}

@visibleForTesting
base class CanvasTransformCacheItem extends LinkedListEntry<CanvasTransformCacheItem> {
  final String filePath;
  final Matrix4 transform;

  CanvasTransformCacheItem(this.filePath, this.transform);
}
