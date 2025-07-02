import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:bson/bson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:saber/components/canvas/_asset_cache.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/components/canvas/pencil_shader.dart';
import 'package:saber/data/editor/binary_writer.dart';
import 'package:saber/data/tools/highlighter.dart';
import 'package:saber/data/tools/laser_pointer.dart';



typedef CanvasKey = GlobalKey<State<InnerCanvas>>;

class HasSize {
  const HasSize(this.size);
  final Size size;
}

class EditorPage extends Listenable implements HasSize {
  static const double defaultWidth = 1000;
  static const double defaultHeight = defaultWidth * 1.4;
  static const Size defaultSize = Size(defaultWidth, defaultHeight);

  @override
  final Size size;

  late final CanvasKey innerCanvasKey = CanvasKey();
  RenderBox? _renderBox;
  RenderBox? get renderBox {
    return _renderBox ??=
        innerCanvasKey.currentState?.context.findRenderObject() as RenderBox?;
  }

  bool _isRendered = false;
  bool get isRendered => _isRendered;
  set isRendered(bool isRendered) {
    if (isRendered == _isRendered) return;
    _isRendered = isRendered;

    // reset renderBox as renderObject has changed
    _renderBox = null;
  }

  late final pencilShader = PencilShader.create();

  final List<Stroke> strokes;
  final List<LaserStroke> laserStrokes;
  final List<EditorImage> images;
  final QuillStruct quill;

  EditorImage? backgroundImage;

  bool get isEmpty =>
      strokes.isEmpty &&
      images.isEmpty &&
      quill.controller.document.isEmpty() &&
      backgroundImage == null;
  bool get isNotEmpty => !isEmpty;

  /// The height of the canvas cropped to the content.
  double previewHeight({
    required int lineHeight,
  }) {
    // avoid dividing by zero (this should never happen)
    assert(size.height != 0);
    assert(size.width != 0);
    if (size.height == 0 || size.width == 0) {
      return 0;
    }

    // if we have a background image, show full height
    if (backgroundImage != null) {
      return size.height;
    }

    /// The maximum y value of any stroke, image, or text.
    double maxY = 0;
    for (final stroke in strokes) {
      maxY = max(maxY, stroke.maxY);
    }
    for (final image in images) {
      maxY = max(maxY, image.dstRect.bottom);
    }
    if (!quill.controller.document.isEmpty()) {
      // this does not account for text that wraps to the next line
      int linesOfText =
          quill.controller.document.toPlainText().split('\n').length;
      maxY = max(maxY, linesOfText * lineHeight * 1.5); // ×1.5 fudge factor
    }

    /// The uncropped height of the page.
    /// In lots of cases, this is [Editor.defaultHeight].
    final fullHeight = size.height;

    /// The height of the canvas (cropped),
    /// adjusted to be between 10% and 100% of the full height.
    final croppedHeight = min(fullHeight, max(maxY, 0) + (0.1 * fullHeight));

    return croppedHeight;
  }

  EditorPage({
    Size? size,
    double? width,
    double? height,
    List<Stroke>? strokes,
    List<EditorImage>? images,
    QuillStruct? quill,
    this.backgroundImage,
  })  : assert((size == null) || (width == null && height == null),
            "size and width/height shouldn't both be specified"),
        size = size ?? Size(width ?? defaultWidth, height ?? defaultHeight),
        strokes = strokes ?? [],
        laserStrokes = [],
        images = images ?? [],
        quill = quill ??
            QuillStruct(
              controller: QuillController.basic(),
              focusNode: FocusNode(debugLabel: 'Quill Focus Node'),
            );

  factory EditorPage.fromJson(
    Map<String, dynamic> json, {
    required List<Uint8List>? inlineAssets,
    required bool readOnly,
    required int fileVersion,
    required String sbnPath,
    required AssetCache assetCache,
  }) {
    final size = Size(json['w'] ?? defaultWidth, json['h'] ?? defaultHeight);
    return EditorPage(
      size: size,
      strokes: parseStrokesJson(
        json['s'] as List?,
        page: HasSize(size),
        onlyFirstPage: false,
        fileVersion: fileVersion,
      ),
      images: parseImagesJson(
        json['i'] as List?,
        inlineAssets: inlineAssets,
        isThumbnail: readOnly,
        onlyFirstPage: false,
        sbnPath: sbnPath,
        assetCache: assetCache,
      ),
      quill: QuillStruct(
        controller: json['q'] != null
            ? QuillController(
                document: Document.fromJson(json['q'] as List),
                selection: const TextSelection.collapsed(offset: 0),
              )
            : QuillController.basic(),
        focusNode: FocusNode(debugLabel: 'Quill Focus Node'),
      ),
      backgroundImage: json['b'] != null
          ? parseImageJson(
              json['b'],
              inlineAssets: inlineAssets,
              isThumbnail: false,
              sbnPath: sbnPath,
              assetCache: assetCache,
            )
          : null,
    );
  }

  Map<String, dynamic> toJson(OrderedAssetCache assets) => {
        'w': size.width,
        'h': size.height,
        if (strokes.isNotEmpty)
          's': strokes.map((stroke) => stroke.toJson()).toList(),
        if (images.isNotEmpty)
          'i': images.map((image) => image.toJson(assets)).toList(),
        if (!quill.controller.document.isEmpty())
          'q': quill.controller.document.toDelta().toJson(),
        if (backgroundImage != null) 'b': backgroundImage?.toJson(assets)
      };

  /// Adds page contents to binary representation of note
  void toBinary(BinaryWriter writer,OrderedAssetCache assets) {
    writer.writeInt(PageBinaryKeys.version, 1);
    writer.writeScaledFloat(PageBinaryKeys.width,size.width);
    writer.writeScaledFloat(PageBinaryKeys.height,size.height);
    if (strokes.isNotEmpty) {
      writer.writeInt(PageBinaryKeys.strokes, strokes.length);
      for (final stroke in strokes) {
        stroke.toBinary(writer);
      }
    }
    else {
      writer.writeInt(PageBinaryKeys.strokes, 0);
    }
    if (images.isNotEmpty) {
      writer.writeInt(PageBinaryKeys.images, images.length);
      for (final image in images) {
        image.toBinary(writer,assets);
      }
    }
    else {
      writer.writeInt(PageBinaryKeys.images, 0);
    }
    if (backgroundImage != null) {
      writer.writeInt(PageBinaryKeys.backgroundImage, 1);
      backgroundImage?.toBinary(writer, assets);
    }
    else{
      writer.writeInt(PageBinaryKeys.backgroundImage, 0);
    }

    if (!quill.controller.document.isEmpty()) {
      // TO DO
      final quillJson=quill.controller.document.toDelta().toJson();
      final bson = BsonCodec.serialize(quillJson);
      writer.writeString(PageBinaryKeys.quill,  String.fromCharCodes(bson.byteList));
    }
    else{
      writer.writeString(PageBinaryKeys.quill,"");
    }
  }

  factory EditorPage.fromBinary(
      BinaryReader reader, {
        required List<Uint8List>? inlineAssets,
        required bool readOnly,
        required int fileVersion,
        required String sbnPath,
        required AssetCache assetCache,
      }) {

    int key;
    final int  version;
    key=reader.readKey();
    if (key!=PageBinaryKeys.version) {
      throw Exception('page.fromBinary: version not set');
    }
    version = reader.readIntNoKey();

    final double width;
    key=reader.readKey();
    if (key!=PageBinaryKeys.width){
      throw Exception('page.fromBinary: width not set');
    }
    width = reader.readScaledFloat();

    final double height;
    key=reader.readKey();
    if (key!=PageBinaryKeys.height){
      throw Exception('page.fromBinary: height not set');
    }
    height = reader.readScaledFloat();
    final size = Size(width,height);

    final int  strokesCount;
    key=reader.readKey();
    if (key!=PageBinaryKeys.strokes){
      throw Exception('page.fromBinary: strokes not set');
    }
    strokesCount = reader.readIntNoKey();
    final List<Stroke> strokes=EditorPage.parseStrokesBinary(
      reader, strokesCount,
      page: HasSize(size),
      onlyFirstPage: false,
      fileVersion: fileVersion);

    final int  imagesCount;
    key=reader.readKey();
    if (key!=PageBinaryKeys.images){
      throw Exception('page.fromBinary: images not set');
    }
    imagesCount = reader.readIntNoKey();

    final imagesParsed=EditorPage.parseImagesBinary(
      reader,imagesCount,
      inlineAssets: inlineAssets,
      isThumbnail: readOnly,
      onlyFirstPage: false,
      sbnPath: sbnPath,
      assetCache: assetCache,
    );

    final int  backgroundImageCnt;
    key=reader.readKey();
    if (key!=PageBinaryKeys.backgroundImage){
      throw Exception('page.fromBinary: backgroundImage not set');
    }
    backgroundImageCnt = reader.readIntNoKey();

    final String  quillString;
    final Map<String, dynamic> quillJson;
    key=reader.readKey();
    if (key!=PageBinaryKeys.quill){
      throw Exception('page.fromBinary: quill not set');
    }
    quillString = reader.readStringNoKey();
    if (quillString!="") {
      final bytes = Uint8List.fromList(quillString.codeUnits); // Convert String to bytes
      final bson = BsonBinary.from(bytes);
      quillJson={'q': BsonCodec.deserialize(bson)};   // and to Json
    }
    else {
      quillJson={'q': ""};  //
    }
    final qList=List.generate(quillJson['q'].length,(index) => quillJson['q']['$index']);
    final EditorImage? backgroundImage;
    if (backgroundImageCnt>0) {
      final imageInfo=EditorImage.readBinary(reader,assetCache);
      backgroundImage = EditorPage.parseImageBinary(
        reader, backgroundImageCnt,
        imageInfo: imageInfo,
        inlineAssets: inlineAssets,
        isThumbnail: false,
        sbnPath: sbnPath,
        assetCache: assetCache,
      );
    }
    else {
      backgroundImage=null;
    }

    return EditorPage(
      size: size,
      strokes: strokes,
      images: imagesParsed,
      quill: QuillStruct(
        controller: quillJson['q'] != ""
            ? QuillController(
          document: Document.fromJson(qList),
          selection: const TextSelection.collapsed(offset: 0),
        )
            : QuillController.basic(),
        focusNode: FocusNode(debugLabel: 'Quill Focus Node'),
      )
      ,
      backgroundImage: backgroundImage,
    );
  }



  /// Inserts a stroke, while keeping the strokes sorted by
  /// pen type and color.
  void insertStroke(Stroke newStroke) {
    int newStrokeColor = newStroke.color.toARGB32();

    int index = 0;
    for (final Stroke stroke in strokes) {
      int penTypeComparison = stroke.penType.compareTo(newStroke.penType);
      int color = stroke.color.toARGB32();
      if (penTypeComparison > 0) {
        break; // this stroke's pen type comes after the new stroke's pen type
      } else if (stroke.penType == (Highlighter).toString() &&
          penTypeComparison == 0 &&
          color > newStrokeColor) {
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
      return a.color.toARGB32().compareTo(b.color.toARGB32());
    });
  }

  static List<Stroke> parseStrokesJson(
    List<dynamic>? strokes, {
    required HasSize page,
    required bool onlyFirstPage,
    required int fileVersion,
  }) =>
      (strokes ?? [])
          .map((dynamic stroke) {
            final map = stroke as Map<String, dynamic>;
            final pageIndex = map['i'] ?? 0;
            if (onlyFirstPage && pageIndex > 0) return null;
            return Stroke.fromJson(
              map,
              fileVersion: fileVersion,
              pageIndex: pageIndex,
              page: page,
            );
          })
          .where((element) => element != null)
          .cast<Stroke>()
          .toList();


  static List<Stroke> parseStrokesBinary(
      BinaryReader reader,
      int strokesCount,{
        required HasSize page,
        required bool onlyFirstPage,
        required int fileVersion,
      }) {
    final strokes = <Stroke>[];

    for (int i = 0; i < strokesCount; i++) {
      final stroke = Stroke.fromBinary(
        reader,
        fileVersion: fileVersion,
        page: page,
      );

      if (onlyFirstPage && stroke.pageIndex > 0) {
        continue;
      }
      strokes.add(stroke);
    }
    return strokes;
  }

  static List<EditorImage> parseImagesJson(
    List<dynamic>? images, {
    required List<Uint8List>? inlineAssets,
    required bool isThumbnail,
    required bool onlyFirstPage,
    required String sbnPath,
    required AssetCache assetCache,
  }) =>
      images
          ?.cast<Map<String, dynamic>>()
          .map((Map<String, dynamic> image) {
            if (onlyFirstPage && image['i'] > 0) return null;
            return parseImageJson(
              image,
              inlineAssets: inlineAssets,
              isThumbnail: isThumbnail,
              sbnPath: sbnPath,
              assetCache: assetCache,
            );
          })
          .where((element) => element != null)
          .cast<EditorImage>()
          .toList() ??
      [];

  static EditorImage parseImageJson(
    Map<String, dynamic> json, {
    required List<Uint8List>? inlineAssets,
    required bool isThumbnail,
    required String sbnPath,
    required AssetCache assetCache,
  }) =>
      EditorImage.fromJson(
        json,
        inlineAssets: inlineAssets,
        isThumbnail: isThumbnail,
        sbnPath: sbnPath,
        assetCache: assetCache,
      );

  static List<EditorImage> parseImagesBinary(
      BinaryReader reader,
      int imagesCount,{
        required List<Uint8List>? inlineAssets,
        required bool isThumbnail,
        required bool onlyFirstPage,
        required String sbnPath,
        required AssetCache assetCache,
      }) {
    final images = <EditorImage>[];

    for (int i = 0; i < imagesCount; i++) {
      final imageInfo=EditorImage.readBinary(reader,assetCache);
      if (onlyFirstPage && imageInfo['pageIndex'] > 0) {
        // Skip this image
        EditorImage.skipImageBinary(reader,
          imageInfo: imageInfo,
          inlineAssets: inlineAssets,
          isThumbnail: isThumbnail,
          sbnPath: sbnPath,
          assetCache: assetCache,
        );
        continue;
      }

      final image = EditorImage.fromBinary(
        reader,
        imageInfo: imageInfo,
        inlineAssets: inlineAssets,
        isThumbnail: isThumbnail,
        sbnPath: sbnPath,
        assetCache: assetCache,
      );

      images.add(image);
    }
    return images;
  }

  static EditorImage parseImageBinary(
      BinaryReader reader,
      int imageCount,{
        required Map<String, dynamic> imageInfo,
        required List<Uint8List>? inlineAssets,
        required bool isThumbnail,
        required String sbnPath,
        required AssetCache assetCache,
      })=> EditorImage.fromBinary(
        reader,
        imageInfo: imageInfo,
        inlineAssets: inlineAssets,
        isThumbnail: isThumbnail,
        sbnPath: sbnPath,
        assetCache: assetCache,
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
    if (_disposed)
      throw Exception('Cannot add listener to disposed EditorPage');
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
  }) =>
      EditorPage(
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
