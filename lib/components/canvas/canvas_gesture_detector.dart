import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keybinder/keybinder.dart';
import 'package:saber/components/canvas/hud/canvas_hud.dart';
import 'package:saber/components/canvas/interactive_canvas.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/extensions/change_notifier_extensions.dart';
import 'package:saber/data/extensions/matrix4_extensions.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:vector_math/vector_math_64.dart';

class CanvasGestureDetector extends StatefulWidget {
  CanvasGestureDetector({
    super.key,
    required this.filePath,
    required this.isInfinite,
    required this.isDrawGesture,
    this.onInteractionEnd,
    required this.onDrawStart,
    required this.onDrawUpdate,
    required this.onDrawEnd,
    required this.updatePointerData,
    required this.onHovering,
    required this.onHoveringEnd,
    required this.onStylusButtonChanged,
    required this.undo,
    required this.redo,
    required this.pages,
    required this.initialPageIndex,
    required this.pageBuilder,
    required this.placeholderPageBuilder,
    required this.isTextEditing,
    TransformationController? transformationController,
  }) : _transformationController =
           transformationController ?? TransformationController();

  final String filePath;

  // Whether this note is an infinite canvas.
  final bool isInfinite;

  final bool Function(ScaleStartDetails scaleDetails) isDrawGesture;
  final ValueChanged<ScaleEndDetails>? onInteractionEnd;
  final ValueChanged<ScaleStartDetails> onDrawStart;
  final ValueChanged<ScaleUpdateDetails> onDrawUpdate;
  final ValueChanged<ScaleEndDetails> onDrawEnd;

  /// Called when the pressure of the stylus changes
  final void Function(PointerDeviceKind kind, double? pressure)
  updatePointerData;
  final VoidCallback onHovering;
  final VoidCallback onHoveringEnd;
  final ValueChanged<bool> onStylusButtonChanged;

  final VoidCallback undo;
  final VoidCallback redo;

  final List<EditorPage> pages;
  final int? initialPageIndex;
  final Widget Function(BuildContext context, int pageIndex) pageBuilder;
  final Widget Function(BuildContext context, int pageIndex)
  placeholderPageBuilder;

  final bool Function() isTextEditing;

  late final TransformationController _transformationController;

  @override
  State<CanvasGestureDetector> createState() => CanvasGestureDetectorState();

  // Visual bounds expressed as logical units by dividing by the visual
  // multiplier. Set so visual MIN = 0.1x and visual MAX = 10x.
  static const kMinScale = 0.1 / InteractiveCanvasViewer.kVisualScaleMultiplier;

  // Allow very large logical zoom so initial desired visual values can be used;
  // adjusted now so VISUAL max is 10x.
  static const kMaxScale = 10.0 / InteractiveCanvasViewer.kVisualScaleMultiplier;

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
  late var containerBounds = const BoxConstraints();

  /// If zooming is locked, this is the zoom level.
  /// Otherwise, this is null.
  late double? zoomLockedValue = stows.lastZoomLock.value
      ? widget._transformationController.value.approxScale
      : null;

  /// Whether single-finger panning is locked.
  /// Two-finger panning is always enabled.
  late bool singleFingerPanLock = stows.lastSingleFingerPanLock.value;

  /// Whether panning is locked to being horizontal or vertical.
  /// Otherwise, panning can be done in any (i.e. diagonal) direction.
  late bool axisAlignedPanLock = stows.lastAxisAlignedPanLock.value;

  void zoomIn() => widget._transformationController.value =
      setZoom(
        scaleDelta: 0.1,
        transformation: widget._transformationController.value,
        containerBounds: containerBounds,
      ) ??
      widget._transformationController.value;
  void zoomOut() => widget._transformationController.value =
      setZoom(
        scaleDelta: -0.1,
        transformation: widget._transformationController.value,
        containerBounds: containerBounds,
      ) ??
      widget._transformationController.value;
  @visibleForTesting
  static Matrix4? setZoom({
    required double scaleDelta,
    required Matrix4 transformation,
    required BoxConstraints containerBounds,
  }) {
    // Convert current transformation's visual scale to logical scale so the
    // deltas are applied in logical units (what the user perceives as "1x").
    final double oldVisual = transformation.approxScale;
    final double multiplier = InteractiveCanvasViewer.kVisualScaleMultiplier;
    final double oldLogical = oldVisual / max(multiplier, 1.0);

    final double newLogical = oldLogical + scaleDelta;

    // Clamp logical scale to allowable bounds
    if (newLogical < CanvasGestureDetector.kMinScale) return null;
    if (newLogical > CanvasGestureDetector.kMaxScale) return null;

    final double newVisual = newLogical * max(multiplier, 1.0);

    final center = Vector3(
      containerBounds.maxWidth / 2,
      containerBounds.maxHeight / 2,
      0,
    );

    // Maintain the focal center while scaling by computing the translation
    // needed to keep the same point under the center.
    final translation =
        (transformation.getTranslation() - center) * (newVisual / oldVisual) +
        center;

    return Matrix4.translation(translation)
      ..scaleByDouble(newVisual, newVisual, newVisual, 1);
  }

  final Map<AxisDirection, Timer> _arrowKeyPanTimers = {};
  void arrowKeyPan(AxisDirection direction, bool pressed) {
    _arrowKeyPanTimers.remove(direction)?.cancel();
    if (!pressed) return;

    // arrow keys are used to navigate around text
    if (widget.isTextEditing()) return;

    _arrowKeyPanNow(direction);

    // Wait for 200ms, then pan every 100ms
    const ms100 = Duration(milliseconds: 100);
    const ms200 = Duration(milliseconds: 200);
    _arrowKeyPanTimers[direction] = Timer(ms200, () {
      _arrowKeyPanTimers[direction] = Timer.periodic(ms100, (_) {
        _arrowKeyPanNow(direction);
      });
    });
  }

  void _arrowKeyPanNow(AxisDirection direction) {
    final transformation = widget._transformationController.value;
    const panAmount = 50.0;

    transformation.leftTranslateByDouble(
      switch (direction) {
        AxisDirection.left => panAmount,
        AxisDirection.right => -panAmount,
        AxisDirection.up => 0.0,
        AxisDirection.down => 0.0,
      },
      switch (direction) {
        AxisDirection.left => 0.0,
        AxisDirection.right => 0.0,
        AxisDirection.up => panAmount,
        AxisDirection.down => -panAmount,
      },
      0,
      1,
    );
    widget._transformationController.notifyListenersPlease();
  }

  var _setupKeybindings = false;
  late Keybinding _ctrlPlus, _ctrlEquals, _ctrlMinus;
  late Keybinding _leftKey, _rightKey, _upKey, _downKey;
  void _assignKeybindings() {
    _ctrlPlus = Keybinding([
      KeyCode.ctrl,
      KeyCode.from(LogicalKeyboardKey.add),
    ], inclusive: true);
    _ctrlEquals = Keybinding([
      KeyCode.ctrl,
      KeyCode.from(LogicalKeyboardKey.equal),
    ], inclusive: true);
    _ctrlMinus = Keybinding([
      KeyCode.ctrl,
      KeyCode.from(LogicalKeyboardKey.minus),
    ], inclusive: true);
    Keybinder.bind(_ctrlPlus, zoomIn);
    Keybinder.bind(_ctrlEquals, zoomIn);
    Keybinder.bind(_ctrlMinus, zoomOut);

    _leftKey = Keybinding([
      KeyCode.from(LogicalKeyboardKey.arrowLeft),
    ], inclusive: true);
    _rightKey = Keybinding([
      KeyCode.from(LogicalKeyboardKey.arrowRight),
    ], inclusive: true);
    _upKey = Keybinding([
      KeyCode.from(LogicalKeyboardKey.arrowUp),
    ], inclusive: true);
    _downKey = Keybinding([
      KeyCode.from(LogicalKeyboardKey.arrowDown),
    ], inclusive: true);
    Keybinder.bind(
      _leftKey,
      (bool pressed) => arrowKeyPan(AxisDirection.left, pressed),
    );
    Keybinder.bind(
      _rightKey,
      (bool pressed) => arrowKeyPan(AxisDirection.right, pressed),
    );
    Keybinder.bind(
      _upKey,
      (bool pressed) => arrowKeyPan(AxisDirection.up, pressed),
    );
    Keybinder.bind(
      _downKey,
      (bool pressed) => arrowKeyPan(AxisDirection.down, pressed),
    );

    _setupKeybindings = true;
  }

  void _removeKeybindings() {
    if (!_setupKeybindings) return;
    _setupKeybindings = false;

    Keybinder.remove(_ctrlPlus);
    Keybinder.remove(_ctrlEquals);
    Keybinder.remove(_ctrlMinus);

    Keybinder.remove(_leftKey);
    Keybinder.remove(_rightKey);
    Keybinder.remove(_upKey);
    Keybinder.remove(_downKey);
    _arrowKeyPanTimers.forEach((_, timer) => timer.cancel());
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
    // Call setInitialTransform if the filePath or initialPageIndex changed,
    // or if the infinite flag flipped (coreInfo could be loaded after the
    // filePath was set). This ensures the initial zoom for infinite notes
    // gets applied when coreInfo.isInfinite becomes true.
    if (oldWidget.initialPageIndex != widget.initialPageIndex ||
        oldWidget.filePath != widget.filePath ||
        oldWidget.isInfinite != widget.isInfinite) {
      setInitialTransform();
    }
    super.didUpdateWidget(oldWidget);
  }

  /// Sets the initial transform so that we're scrolled to the correct page.
  /// Has no effect if note hasn't yet loaded or if the user has already scrolled.
  void setInitialTransform() {
    // wait for note to be loaded
    if (widget.filePath.isEmpty) return;

    // don't override user's scroll — allow applying initial zoom if the
    // current transform is approximately the identity (small FP noise may
    // make an otherwise-identity matrix non-exact). This avoids skipping the
    // initial zoom when the controller has tiny numerical differences.
    if (!_transformationIsApproximatelyIdentity(
        widget._transformationController.value)) return;

    final transformCacheItem = CanvasTransformCache.get(widget.filePath);

    if (transformCacheItem != null) {
      // if we're opening the same note, restore the last transform
      widget._transformationController.value = transformCacheItem.transform;
      if (zoomLockedValue != null) {
        zoomLockedValue = transformCacheItem.transform.approxScale;
      }
    } else if (widget.initialPageIndex != null) {
      // if we're opening a different note, scroll to the last recorded page
      CanvasGestureDetector.scrollToPage(
        pageIndex: widget.initialPageIndex!,
        pages: widget.pages,
        screenWidth: MediaQuery.sizeOf(context).width,
        transformationController: widget._transformationController,
      );
    } else {
      // Only apply a strong initial zoom for infinite notes; normal notes
      // should keep the default 1x unless the user or a cached transform
      // indicates otherwise.
      // NOTE: removed forced initial visual scale (previously 15x). Initial
      // zoom is now handled by user settings / cache. This avoids forcing
      // inconsistent startup zoom values.
      if (!widget.isInfinite) return;

      // no forced zoom anymore
    }
  }

  Timer? _snapZoomTimer;

  /// Corrects the transform if it's out of bounds.
  /// If the scale is less than 1, centers the pages horizontally.
  /// Otherwise, prevents the user from scrolling past the edges.
  void onTransformChanged() {
    // If suppressed until a timestamp, skip automatic clamping and snapping.
    // This allows callers to programmatically set the transform (for
    // example when expanding the canvas) without the automatic clamps
    // immediately overriding the desired transform.
    final now = DateTime.now();
    if (_suppressTransformAdjustmentUntil != null &&
        now.isBefore(_suppressTransformAdjustmentUntil!)) {
      return;
    }
     final translation = widget._transformationController.value.getTranslation();

     double adjustmentY = 0;

     // snap to 1.0x zoom
     _snapZoomTimer?.cancel();
     final scale = widget._transformationController.value.approxScale;
     final diffFrom1 = (scale - 1).abs();
     // allow 0.001 leeway for floating point error
     if (diffFrom1 < 0.05 && diffFrom1 > 0.001)
       _snapZoomTimer = Timer(const Duration(milliseconds: 200), resetZoom);

     // Allow free panning in all directions.
     // Only correct vertical translation to avoid panning above the top (translation.y > 0).
     if (translation.y > 0) {
       adjustmentY = -translation.y;
     }

    if (adjustmentY.abs() > 0.1) {
      widget._transformationController.value.leftTranslateByDouble(
        0,
        adjustmentY,
        0,
        1,
      );
    }
  }

  /// Resets the zoom level to 1.0x
  void resetZoom() {
      final transformation = widget._transformationController.value;
      final double currentVisual = transformation.approxScale;
      const double desiredVisual = 1.0;
      // If already approximately 1x, no-op
      if ((currentVisual - desiredVisual).abs() < 0.00001) return;

      // Temporarily suppress automatic transform adjustments so clamping
      // doesn't immediately override this programmatic change.
      suppressNextTransformAdjustment(const Duration(milliseconds: 300));

      // Compute the translation required to keep the same center point under
      // the viewport center while changing visual scale.
      final double oldVisual = currentVisual;
      final double newVisual = desiredVisual;

      final center = Vector3(
        containerBounds.maxWidth / 2,
        containerBounds.maxHeight / 2,
        0,
      );

      final translation =
          (transformation.getTranslation() - center) * (newVisual / oldVisual) +
          center;

      widget._transformationController.value = Matrix4.translation(translation)
        ..scaleByDouble(newVisual, newVisual, newVisual, 1);
    }

  // Suppression window for automatic transform adjustments. When a programmatic
  // transform is applied (e.g. to compensate when expanding a page), callers
  // should call [suppressNextTransformAdjustment] to avoid the listener
  // immediately overriding the programmatic transform.
  DateTime? _suppressTransformAdjustmentUntil;
  void suppressNextTransformAdjustment([Duration duration = const Duration(milliseconds: 250)]) {
    _suppressTransformAdjustmentUntil = DateTime.now().add(duration);
  }

   bool _transformationIsApproximatelyIdentity(Matrix4 matrix) {
     // Approximate the transform being identity: scale near 1 and small
     // translation. This tolerates tiny numeric differences from previous
     // operations.
    final double scale = matrix.getMaxScaleOnAxis();
    if ((scale - 1.0).abs() > 0.001) return false;
    final Vector3 t = matrix.getTranslation();
    if (t.x.abs() > 1.0 || t.y.abs() > 1.0) return false;
    return true;
  }

  void _listenerPointerEvent(PointerEvent event) {
    final isStylus =
        event.kind == PointerDeviceKind.stylus ||
        event.kind == PointerDeviceKind.invertedStylus;

    final double? pressure;
    if (isStylus) {
      if (event.pressureMin != event.pressureMax) {
        pressure = event.pressure;
      } else {
        // Detected as stylus, but no pressure values
        pressure = null;
      }
    } else {
      pressure = null;
    }
    widget.updatePointerData(event.kind, pressure);

    if (isStylus &&
        stows.autoDisableFingerDrawingWhenStylusDetected.value &&
        // Don't change if the user has a fixed value for finger drawing
        !stows.hideFingerDrawingToggle.value) {
      stows.editorFingerDrawing.value = false;
    }
  }

  var stylusButtonWasPressed = false;

  void _listenerPointerHoverEvent(PointerEvent event) {
    if (event.kind != PointerDeviceKind.stylus) return;

    // Apparently flutter synthesizes a hover event on pointer down,
    // so these are used to detect when hovering ends
    if (event.synthesized) {
      widget.onHoveringEnd();
    } else {
      widget.onHovering();
      if (stylusButtonWasPressed != (event.buttons == kPrimaryStylusButton)) {
        stylusButtonWasPressed = event.buttons == kPrimaryStylusButton;
        widget.onStylusButtonChanged(stylusButtonWasPressed);
      }
    }
  }

  void _listenerPointerUpEvent(PointerEvent event) {
    widget.updatePointerData(event.kind, null);
    stylusButtonWasPressed = false;
    widget.onStylusButtonChanged(false);
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Listener(
          onPointerDown: _listenerPointerEvent,
          onPointerMove: _listenerPointerEvent,
          onPointerUp: _listenerPointerUpEvent,
          onPointerHover: _listenerPointerHoverEvent,
          child: GestureDetector(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints containerBounds) {
                this.containerBounds = containerBounds;

                return InteractiveCanvasViewer.builder(
                  // If zoom is locked, zoomLockedValue holds a VISUAL scale
                  // (approxScale). Convert to logical units for the widget's
                  // minScale/maxScale parameters by dividing by the visual
                  // multiplier. Otherwise use the configured logical bounds.
                  minScale: zoomLockedValue != null
                      ? (zoomLockedValue! / InteractiveCanvasViewer.kVisualScaleMultiplier)
                      : CanvasGestureDetector.kMinScale,
                  maxScale: zoomLockedValue != null
                      ? (zoomLockedValue! / InteractiveCanvasViewer.kVisualScaleMultiplier)
                      : CanvasGestureDetector.kMaxScale,
                   panEnabled: !singleFingerPanLock,
                   panAxis: axisAlignedPanLock ? PanAxis.aligned : PanAxis.free,
                   interactionEndFrictionCoefficient:
                       InteractiveCanvasViewer.kDrag * 100,
                  boundaryMargin: const EdgeInsets.all(double.infinity),
                  alignment: Alignment.topLeft,
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
                      containerWidth: containerBounds.maxWidth,
                      isInfinite: widget.isInfinite,
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
                  ? widget._transformationController.value.approxScale
                  : null;
              stows.lastZoomLock.value = zoomLock;
            }),
            resetZoom: zoomLockedValue != null ? null : resetZoom,
            singleFingerPanLock: singleFingerPanLock,
            setSingleFingerPanLock: (bool singleFingerPanLock) => setState(() {
              this.singleFingerPanLock = singleFingerPanLock;
              stows.lastSingleFingerPanLock.value = singleFingerPanLock;
            }),
            axisAlignedPanLock: axisAlignedPanLock,
            setAxisAlignedPanLock: (bool axisAlignedPanLock) => setState(() {
              this.axisAlignedPanLock = axisAlignedPanLock;
              stows.lastAxisAlignedPanLock.value = axisAlignedPanLock;
            }),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    CanvasTransformCache.add(
      widget.filePath,
      widget._transformationController.value,
    );
    widget._transformationController.removeListener(onTransformChanged);
    widget._transformationController.dispose();
    _removeKeybindings();
    super.dispose();
  }

}

class _PagesBuilder extends StatelessWidget {
  const _PagesBuilder({
    // ignore: unused_element_parameter
    super.key,
    required this.pages,
    required this.pageBuilder,
    required this.containerWidth,
    required this.isInfinite,
  });

  final List<EditorPage> pages;
  final Widget Function(BuildContext context, int pageIndex) pageBuilder;
  final double containerWidth;

  final bool isInfinite;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      const SizedBox.square(dimension: Editor.gapBetweenPages),
      const SizedBox.square(dimension: Editor.gapBetweenPages),
    ];

    double topOfPage = Editor.gapBetweenPages * 2;
    for (int pageIndex = 0; pageIndex < pages.length; pageIndex++) {
      final page = pages[pageIndex];
      final pageWidth = isInfinite
          ? page.size.width
          : min(
              page.size.width,
              containerWidth,
            ); // because of FittedBox
      final pageHeight = isInfinite
          ? page.size.height
          : pageWidth / page.size.width * page.size.height;
      final bottomOfPage = topOfPage + pageHeight;

      // Always render pages - never use placeholder
      page.isRendered = true;

      final pageWidget = pageBuilder(context, pageIndex);

      children.add(
        ClipRRect(
          child: pageWidget,
        ),
      );

      children.add(const SizedBox.square(dimension: Editor.gapBetweenPages));

      topOfPage = bottomOfPage + Editor.gapBetweenPages;
    }

    children.add(const SizedBox.square(dimension: Editor.gapBetweenPages));
    return Column(children: children);
  }
}

@visibleForTesting
class CanvasTransformCache {
  static const _maxCacheSize = 5;
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
base class CanvasTransformCacheItem
    extends LinkedListEntry<CanvasTransformCacheItem> {
  final String filePath;
  final Matrix4 transform;

  CanvasTransformCacheItem(this.filePath, this.transform);
}
