import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/inner_canvas.dart';

typedef CanvasKey = GlobalKey<State<InnerCanvas>>;

class EditorPage {
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
      && quill.controller.document.isEmpty();

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

  EditorPage.fromJson(Map<String, dynamic> json, {bool readOnly = false}):
      size = Size(json["w"] ?? defaultWidth, json["h"] ?? defaultHeight),
      strokes = parseStrokesJson(json["s"] as List?),
      images = parseImagesJson(
        json["i"] as List?,
        allowCalculations: !readOnly,
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

  static List<Stroke> parseStrokesJson(List<dynamic>? strokes) => strokes
      ?.map((dynamic stroke) => Stroke.fromJson(stroke as Map<String, dynamic>))
      .toList() ?? [];

  static List<EditorImage> parseImagesJson(List<dynamic>? images, {required bool allowCalculations}) => images
      ?.map((dynamic image) => EditorImage.fromJson(image as Map<String, dynamic>, allowCalculations: allowCalculations))
      .toList() ?? [];
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
