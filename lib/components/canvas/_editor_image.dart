
import 'dart:typed_data';

import 'package:flutter/material.dart';

class EditorImage {
  final Uint8List bytes;
  final int pageIndex;
  final Rect rect;

  EditorImage({
    required this.bytes,
    required this.pageIndex,
    this.rect = const Rect.fromLTWH(0, 0, 0, 0),
  });

  EditorImage.fromJson(Map<String, dynamic> json) :
        bytes = Uint8List.fromList(json['b'] as List<int>? ?? []),
        pageIndex = json['i'] ?? 0,
        rect = Rect.fromLTWH(
          json['x'] ?? 0.0,
          json['y'] ?? 0.0,
          json['w'] ?? 0.0,
          json['h'] ?? 0.0,
        );

  Map<String, dynamic> toJson() => {
    'b': bytes,
    'i': pageIndex,
    'x': rect.left,
    'y': rect.top,
    'w': rect.width,
    'h': rect.height,
  };

}
