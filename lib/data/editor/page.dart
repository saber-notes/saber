
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/inner_canvas.dart';

typedef CanvasKey = GlobalKey<State<InnerCanvas>>;

class EditorPage {
  final CanvasKey innerCanvasKey;

  RenderBox? _renderBox;
  RenderBox? get renderBox {
    _renderBox ??= innerCanvasKey.currentState!.context.findRenderObject() as RenderBox;
    return _renderBox;
  }

  EditorPage({
    CanvasKey? innerCanvasKey,
    List<Stroke>? strokes,
  }) : innerCanvasKey = innerCanvasKey ?? CanvasKey();
}
