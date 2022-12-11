
import 'package:flutter/material.dart';
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
    _renderBox ??= innerCanvasKey.currentState!.context.findRenderObject() as RenderBox;
    return _renderBox;
  }

  EditorPage({
    Size? size,
    double? width,
    double? height,
  }): assert((size == null) || (width == null && height == null), "size and width/height shouldn't both be specified"),
      size = size ?? Size(width ?? defaultWidth, height ?? defaultHeight);

  EditorPage.fromJson(Map<String, dynamic> json):
      size = Size(json["w"] ?? defaultWidth, json["h"] ?? defaultHeight);

  Map<String, dynamic> toJson() => {
    "w": size.width,
    "h": size.height,
  };
}
