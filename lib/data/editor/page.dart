import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/data/tools/highlighter.dart';

typedef CanvasKey = GlobalKey<State<InnerCanvas>>;

class EditorPage extends Listenable {
  static const double defaultWidth = 1000;
  static const double defaultHeight = defaultWidth * 1.4;
  static const Size defaultSize = Size(defaultWidth, defaultHeight);

  final Size size;

  late final CanvasKey innerCanvasKey = CanvasKey();
  RenderBox? _renderBox;
  RenderBox? get renderBox {
    return _renderBox
      ??= innerCanvasKey.currentState?.context.findRenderObject() as RenderBox?;
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
  final List<Stroke> laserStrokes;
  final List<EditorImage> images;
  final QuillStruct quill;

  EditorImage? backgroundImage;

  bool get isEmpty => strokes.isEmpty
      && images.isEmpty
      && quill.controller.document.isEmpty()
      && backgroundImage == null;
  bool get isNotEmpty => !isEmpty;

  EditorPage({
    Size? size,
    double? width,
    double? height,

    List<Stroke>? strokes,
    List<EditorImage>? images,
    QuillStruct? quill,
    this.backgroundImage,
  }): assert((size == null) || (width == null && height == null),
        "size and width/height shouldn't both be specified"),
      size = size ?? Size(width ?? defaultWidth, height ?? defaultHeight),
      strokes = strokes ?? [],
      laserStrokes = [],
      images = images ?? [],
      quill = quill ?? QuillStruct(
        controller: QuillController.basic(),
        focusNode: FocusNode(debugLabel: 'Quill Focus Node'),
      );

  factory EditorPage.fromJson(Map<String, dynamic> json, {
    required List<Uint8List> assets,
    required bool readOnly,
    required int fileVersion,
  }) {
    return EditorPage(
      size: Size(json['w'] ?? defaultWidth, json['h'] ?? defaultHeight),
      strokes: parseStrokesJson(
        json['s'] as List?,
        onlyFirstPage: false,
        fileVersion: fileVersion,
      ),
      images: parseImagesJson(
        json['i'] as List?,
        assets: assets,
        isThumbnail: readOnly,
        onlyFirstPage: false,
      ),
      quill: QuillStruct(
        controller: json['q'] != null ? QuillController(
          document: Document.fromJson(json['q'] as List),
          selection: const TextSelection.collapsed(offset: 0),
        ) : QuillController.basic(),
        focusNode: FocusNode(debugLabel: 'Quill Focus Node'),
      ),
      backgroundImage: json['b'] != null
          ? parseImageJson(
              json['b'],
              assets: assets,
              isThumbnail: false,
            )
          : null,
    );
  }

  Map<String, dynamic> toJson(List<Uint8List> assets) => {
    'w': size.width,
    'h': size.height,
    if (strokes.isNotEmpty)
      's': strokes,
    if (images.isNotEmpty)
      'i': images.map((image) => image.toJson(assets)).toList(),
    if (!quill.controller.document.isEmpty())
      'q': quill.controller.document.toDelta().toJson(),
    if (backgroundImage != null)
      'b': backgroundImage?.toJson(assets)
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
      } else if (stroke.penType == (Highlighter).toString()
          && penTypeComparison == 0 && color > newStrokeColor) {
        break; // this highlighter color comes after the new highlighter color
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
      if (a.penType != (Highlighter).toString()) return 0;
      return a.strokeProperties.color.value.compareTo(b.strokeProperties.color.value);
    });
  }

  static List<Stroke> parseStrokesJson(List<dynamic>? strokes, {
    required bool onlyFirstPage,
    required int fileVersion,
  }) => strokes
      ?.map((dynamic stroke) {
        final map = stroke as Map<String, dynamic>;
        if (onlyFirstPage && map['i'] > 0) return null;
        return Stroke.fromJson(map, fileVersion);
      })
      .where((element) => element != null)
      .cast<Stroke>()
      .toList() ?? [];

  static List<EditorImage> parseImagesJson(List<dynamic>? images, {
    required List<Uint8List> assets,
    required bool isThumbnail,
    required bool onlyFirstPage,
  }) => images
      ?.cast<Map<String, dynamic>>()
      .map((Map<String, dynamic> image) {
        if (onlyFirstPage && image['i'] > 0) return null;
        return parseImageJson(
          image,
          assets: assets,
          isThumbnail: isThumbnail,
        );
      })
      .where((element) => element != null)
      .cast<EditorImage>()
      .toList() ?? [];

  static EditorImage parseImageJson(Map<String, dynamic> json, {
    required List<Uint8List> assets,
    required bool isThumbnail,
  }) => EditorImage.fromJson(
    json,
    assets: assets,
    isThumbnail: isThumbnail,
    onMainThread: false,
  );

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
    if (_disposed) throw Exception('Cannot add listener to disposed EditorPage');
    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void dispose() {
    _disposed = true;
    quill.dispose();
  }

  EditorPage copyWith({
    Size? size,
    List<Stroke>? strokes,
    List<EditorImage>? images,
    QuillStruct? quill,
    EditorImage? backgroundImage,
  }) => EditorPage(
    size: size ?? this.size,
    strokes: strokes ?? this.strokes,
    images: images ?? this.images,
    quill: quill ?? this.quill,
    backgroundImage: backgroundImage ?? this.backgroundImage,
  );
}

class QuillStruct {
  final QuillController controller;
  late final FocusNode focusNode;
  StreamSubscription? changeSubscription;

  QuillStruct({
    required this.controller,
    required this.focusNode,
  });

  void dispose() {
    changeSubscription?.cancel();
    focusNode.dispose();
    controller.dispose();
  }
}
