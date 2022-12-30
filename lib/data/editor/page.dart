
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
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

  final QuillStruct quill;

  EditorPage({
    Size? size,
    double? width,
    double? height,
  }): assert((size == null) || (width == null && height == null), "size and width/height shouldn't both be specified"),
      size = size ?? Size(width ?? defaultWidth, height ?? defaultHeight),
      quill = QuillStruct(
        controller: QuillController.basic(),
        focusNode: FocusNode(debugLabel: 'Quill Focus Node'),
      );

  EditorPage.fromJson(Map<String, dynamic> json):
      size = Size(json["w"] ?? defaultWidth, json["h"] ?? defaultHeight),
      quill = QuillStruct(
        controller: json["q"] != null ? QuillController(
          document: Document.fromJson(json["q"] as List),
          selection: const TextSelection.collapsed(offset: 0),
        ) : QuillController.basic(),
        focusNode: FocusNode(debugLabel: 'Quill Focus Node'),
      );

  Map<String, dynamic> toJson() => {
    "w": size.width,
    "h": size.height,
    "q": quill.controller.document.toDelta().toJson(),
  };
}

class QuillStruct {
  final QuillController controller;
  late final FocusNode focusNode;

  QuillStruct({
    required this.controller,
    required this.focusNode,
  });
}
