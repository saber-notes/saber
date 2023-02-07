import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide TransformationController;
import 'package:saber/components/canvas/hud/canvas_hud.dart';
import 'package:saber/components/canvas/interactive_canvas.dart';
import 'package:saber/data/editor/page.dart';
import 'package:vector_math/vector_math_64.dart';

class CanvasGestureDetector extends StatefulWidget {
  const CanvasGestureDetector({
    super.key,

    required this.filePath,

    required this.isDrawGesture,
    this.onInteractionEnd,
    required this.onDrawStart,
    required this.onDrawUpdate,
    required this.onDrawEnd,
    required this.onPressureChanged,

    required this.undo,
    required this.redo,

    required this.pages,
    required this.initialPageIndex,
    required this.pageBuilder,
    required this.placeholderPageBuilder,
  });

  final String filePath;

  final bool Function(ScaleStartDetails scaleDetails) isDrawGesture;
  final ValueChanged<ScaleEndDetails>? onInteractionEnd;
  final ValueChanged<ScaleStartDetails> onDrawStart;
  final ValueChanged<ScaleUpdateDetails> onDrawUpdate;
  final ValueChanged<ScaleEndDetails> onDrawEnd;
  /// Called when the pressure of the stylus changes,
  /// pressure is negative if stylus button is pressed
  final ValueChanged<double?> onPressureChanged;

  final VoidCallback undo;
  final VoidCallback redo;

  final List<EditorPage> pages;
  final int? initialPageIndex;
  final Widget Function(BuildContext context, int pageIndex) pageBuilder;
  final Widget Function(BuildContext context, int pageIndex) placeholderPageBuilder;

  @override
  State<CanvasGestureDetector> createState() => _CanvasGestureDetectorState();
}

class _CanvasGestureDetectorState extends State<CanvasGestureDetector> {
  final TransformationController _transformationController = TransformationController();

  bool zoomLock = false;

  @override
  initState() {
    setInitialTransform();
    super.initState();
  }

  /// When the widget is created, we still have an empty coreInfo.
  /// Wait for note to be loaded before setting the initial transform.
  @override
  didUpdateWidget(CanvasGestureDetector oldWidget) {
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
    if (!_transformationController.value.isIdentity()) return;

    final transformCacheItem = CanvasTransformCache.get(widget.filePath);

    if (transformCacheItem != null) {
      // if we're opening the same note, restore the last transform
      _transformationController.value = transformCacheItem.transform;
      return;
    } else if (widget.initialPageIndex != null) {
      // if we're opening a different note, scroll to the last recorded page
      _transformationController.value = Matrix4.translationValues(
        0,
        -getTopOfPage(widget.initialPageIndex!),
        0,
      );
    }
  }

  _listenerPointerEvent(PointerEvent event) {
    double? pressure;
    if (event.kind == PointerDeviceKind.stylus) {
      pressure = event.pressure;
    } else if (event.kind == PointerDeviceKind.invertedStylus) {
      pressure = -event.pressure;
    }
    widget.onPressureChanged(pressure);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Listener(
          onPointerDown: _listenerPointerEvent,
          onPointerMove: _listenerPointerEvent,
          child: GestureDetector(
            onSecondaryTapUp: (TapUpDetails details) => widget.undo(),
            onTertiaryTapUp: (TapUpDetails details) => widget.redo(),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return InteractiveCanvasViewer.builder(
                  minScale: 0.01,
                  maxScale: 5,
                  scaleEnabled: !zoomLock,

                  transformationController: _transformationController,

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
                      containerWidth: constraints.maxWidth,
                    );
                  },
                );
              },
            ),
          ),
        ),
        Positioned.fill(
          child: CanvasHud(
            transformationController: _transformationController,
            zoomLock: zoomLock,
            onZoomLockChanged: (bool zoomLock) => setState(() {
              this.zoomLock = zoomLock;
            }),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    CanvasTransformCache.add(widget.filePath, _transformationController.value);
    _transformationController.dispose();

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

  double getTopOfPage(int pageIndex) {
    final double screenWidth = MediaQuery.of(context).size.width;

    double top = 0;

    if (pageIndex <= 0) return top;

    // Slight upwards offset so that the page is not flush with the top of the screen.
    top = -50;

    for (int i = 0; i < pageIndex && i < widget.pages.length; i++) {
      final pageSize = widget.pages[i].size;
      top += 16;
      top += screenWidth / pageSize.width * pageSize.height;
    }

    return top;
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
      const SizedBox(height: 16),
      const SizedBox(height: 16),
    ];

    double topOfPage = 16 * 2;
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

      children.add(const SizedBox(height: 16));

      topOfPage = bottomOfPage + 16;
    }

    children.add(const SizedBox(height: 16));
    return Column(children: children);
  }
}

@visibleForTesting
class CanvasTransformCache {
  static const int _maxCacheSize = 5;
  static final List<CanvasTransformCacheItem> _cache = [];

  CanvasTransformCache._();

  static void add(String filePath, Matrix4 transform) {
    _cache.removeWhere((item) => item.filePath == filePath);

    _cache.add(CanvasTransformCacheItem(filePath, transform));

    if (_cache.length > _maxCacheSize) {
      _cache.removeAt(0);
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
class CanvasTransformCacheItem {
  final String filePath;
  final Matrix4 transform;

  CanvasTransformCacheItem(this.filePath, this.transform);
}
