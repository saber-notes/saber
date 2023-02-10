import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/inner_canvas.dart';

typedef CanvasKey = GlobalKey<State<InnerCanvas>>;

class EditorPage extends Listenable {
  static const double defaultWidth = 1000;
  static const double defaultHeight = defaultWidth * 1.4;
  static const Size defaultSize = Size(defaultWidth, defaultHeight);

  final Size size;

  late final CanvasKey innerCanvasKey = CanvasKey();
  RenderBox? _renderBox;
  RenderBox? get renderBox {
    _renderBox ??= innerCanvasKey.currentState?.context.findRenderObject() as RenderBox?;
    return _renderBox;
  }

  bool _isRendered = false;
  bool get isRendered => _isRendered;
  set isRendered(bool isRendered) {
    if (isRendered == _isRendered) return;
    _isRendered = isRendered;

    // reset renderBox as renderObject has changed
    _renderBox = null;
  }

  final List<Stroke> strokes;
  final List<EditorImage> images;
  final QuillStruct quill;

  EditorImage? backgroundImage;

  bool get isEmpty => strokes.isEmpty
      && images.isEmpty
      && quill.controller.document.isEmpty()
      && backgroundImage == null;

  EditorPage({
    Size? size,
    double? width,
    double? height,
  }): assert((size == null) || (width == null && height == null),
        "size and width/height shouldn't both be specified"),
      size = size ?? Size(width ?? defaultWidth, height ?? defaultHeight),
      strokes = [],
      images = [],
      quill = QuillStruct(
        controller: QuillController.basic(),
        focusNode: FocusNode(debugLabel: 'Quill Focus Node'),
      );

  EditorPage.fromJson(Map<String, dynamic> json, {
    required bool readOnly,
  }):
      size = Size(json["w"] ?? defaultWidth, json["h"] ?? defaultHeight),
      strokes = parseStrokesJson(
        json["s"] as List?,
        onlyFirstPage: false,
      ),
      images = parseImagesJson(
        json["i"] as List?,
        allowCalculations: !readOnly,
        onlyFirstPage: false,
      ),
      quill = QuillStruct(
        controller: json["q"] != null ? QuillController(
          document: Document.fromJson(json["q"] as List),
          selection: const TextSelection.collapsed(offset: 0),
        ) : QuillController.basic(),
        focusNode: FocusNode(debugLabel: 'Quill Focus Node'),
      ),
      backgroundImage = json["b"] != null
        ? EditorImage.fromJson(json["b"] as Map<String, dynamic>)
        : null;

  Map<String, dynamic> toJson() => {
    "w": size.width,
    "h": size.height,
    "s": strokes,
    "i": images,
    "q": quill.controller.document.toDelta().toJson(),
    if (backgroundImage != null)
      "b": backgroundImage?.toJson(),
  };

  /// Inserts a stroke, while keeping the strokes sorted by
  /// pen type and color.
  void insertStroke(Stroke newStroke) {
    int newStrokeColor = newStroke.strokeProperties.color.value;

    int index = 0;
    for (final Stroke stroke in strokes) {
      int penTypeComparison = stroke.penType.compareTo(newStroke.penType);
      int color = stroke.strokeProperties.color.value;
      if (penTypeComparison > 0) {
        break; // this stroke's pen type comes after the new stroke's pen type
      } else if (penTypeComparison == 0 && color > newStrokeColor) {
        break; // this stroke's pen color comes after the new stroke's pen color
      }
      index++;
    }

    strokes.insert(index, newStroke);
  }
  /// Sorts the strokes by pen type and color.
  void sortStrokes() {
    strokes.sort((Stroke a, Stroke b) {
      int penTypeComparison = a.penType.compareTo(b.penType);
      if (penTypeComparison != 0) return penTypeComparison;
      return a.strokeProperties.color.value.compareTo(b.strokeProperties.color.value);
    });
  }

  static List<Stroke> parseStrokesJson(List<dynamic>? strokes, {
    required bool onlyFirstPage,
  }) => strokes
      ?.map((dynamic stroke) {
        final map = stroke as Map<String, dynamic>;
        if (onlyFirstPage && map['i'] > 0) return null;
        return Stroke.fromJson(map);
      })
      .where((element) => element != null)
      .cast<Stroke>()
      .toList() ?? [];

  static List<EditorImage> parseImagesJson(List<dynamic>? images, {
    required bool allowCalculations,
    required bool onlyFirstPage,
  }) => images
      ?.map((dynamic image) {
        final map = image as Map<String, dynamic>;
        if (onlyFirstPage && map['i'] > 0) return null;
        return EditorImage.fromJson(map, allowCalculations: allowCalculations);
      })
      .where((element) => element != null)
      .cast<EditorImage>()
      .toList() ?? [];

  final List<VoidCallback> _listeners = [];
  bool _disposed = false;
  bool get disposed => _disposed;

  /// Triggers a redraw of the strokes. If you need to redraw images,
  /// call [setState] instead.
  void redrawStrokes() {
    for (final VoidCallback listener in _listeners) {
      listener();
    }
  }

  @override
  void addListener(VoidCallback listener) {
    if (_disposed) throw Exception("Cannot add listener to disposed EditorPage");
    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void dispose() {
    _disposed = true;
    quill.changeSubscription?.cancel();
    quill.focusNode.dispose();
    quill.controller.dispose();
  }
}

class QuillStruct {
  final QuillController controller;
  late final FocusNode focusNode;
  StreamSubscription? changeSubscription;

  QuillStruct({
    required this.controller,
    required this.focusNode,
  });
}
