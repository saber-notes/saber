
import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide TransformationController;
import 'package:saber/components/canvas/canvas_zoom_indicator.dart';
import 'package:saber/components/canvas/interactive_canvas.dart';
import 'package:saber/data/editor/page.dart';
import 'package:vector_math/vector_math_64.dart';

class CanvasGestureDetector extends StatefulWidget {
  const CanvasGestureDetector({
    super.key,

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

  @override
  initState() {
    setInitialTransform();
    super.initState();
  }

  /// When the widget is created, we still have an empty coreInfo.
  /// Wait for [initialPageIndex] to be set before setting the initial transform.
  @override
  didUpdateWidget(CanvasGestureDetector oldWidget) {
    if (oldWidget.initialPageIndex != widget.initialPageIndex) {
      setInitialTransform();
    }
    super.didUpdateWidget(oldWidget);
  }

  /// Sets the initial transform so that we're scrolled to the correct page.
  /// Has no effect if [initialPageIndex] is null or if the user has already scrolled.
  void setInitialTransform() {
    if (widget.initialPageIndex == null) return;
    if (!_transformationController.value.isIdentity()) return;

    _transformationController.value = Matrix4.translationValues(
      0,
      -getTopOfPage(widget.initialPageIndex!),
      0,
    );
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
            child: InteractiveCanvasViewer.builder(
              minScale: 0.01,
              maxScale: 5,

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
                );
              },
            )
          )
        ),
        Positioned(
          top: 5,
          right: 5,
          child: CanvasZoomIndicator(
            zoom: _transformationController.value.getMaxScaleOnAxis(),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
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

    top += 16;
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
    super.key,

    required this.pages,
    required this.pageBuilder,
    required this.placeholderPageBuilder,
    required this.boundingBox,
  });

  final List<EditorPage> pages;
  final Widget Function(BuildContext context, int pageIndex) pageBuilder;
  final Widget Function(BuildContext context, int pageIndex) placeholderPageBuilder;
  final Rect boundingBox;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final List<Widget> children = [
      const SizedBox(height: 16),
      const SizedBox(height: 16),
    ];

    double topOfPage = 16 * 2;
    for (int pageIndex = 0; pageIndex < pages.length; pageIndex++) {
      final Size pageSize = pages[pageIndex].size;
      final double pageWidth = min(pageSize.width, screenWidth); // because of FittedBox
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
