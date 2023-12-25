import 'dart:ui' as ui;

import 'package:flutter/material.dart';

typedef ShaderBuilder = ui.FragmentShader? Function(ui.Image, Size);

/// A widget that renders an [image] with a shader applied to it.
///
/// See also:
/// * [ShaderSampler], which applies a shader to an arbitrary child widget.
///
/// This widget is based on the documentation's bare-bones
/// Image widget example, but using a RenderObject to apply
/// the shader:
/// https://api.flutter.dev/flutter/painting/ImageProvider-class.html#painting.ImageProvider.1
class ShaderImage extends StatefulWidget {
  const ShaderImage({
    super.key,
    this.shaderEnabled = true,
    required this.shaderBuilder,
    required this.image,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
  });

  final bool shaderEnabled;
  final ShaderBuilder shaderBuilder;
  final ImageProvider image;
  final BoxFit fit;
  final Alignment alignment;

  @override
  State<ShaderImage> createState() => _ShaderImageState();
}

class _ShaderImageState extends State<ShaderImage> {
  ImageStream? _imageStream;
  ImageInfo? _imageInfo;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // We call _getImage here because createLocalImageConfiguration() needs to
    // be called again if the dependencies changed, in case the changes relate
    // to the DefaultAssetBundle, MediaQuery, etc, which that method uses.
    _getImage();
  }

  @override
  void didUpdateWidget(ShaderImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.image != oldWidget.image) {
      _getImage();
    }
  }

  void _getImage() {
    final ImageStream? oldImageStream = _imageStream;
    _imageStream = widget.image.resolve(createLocalImageConfiguration(context));
    if (_imageStream!.key != oldImageStream?.key) {
      // If the keys are the same, then we got the same image back, and so we don't
      // need to update the listeners. If the key changed, though, we must make sure
      // to switch our listeners to the new image stream.
      final ImageStreamListener listener = ImageStreamListener(_updateImage);
      oldImageStream?.removeListener(listener);
      _imageStream!.addListener(listener);
    }
  }

  void _updateImage(ImageInfo imageInfo, bool synchronousCall) {
    setState(() {
      // Trigger a build whenever the image changes.
      _imageInfo?.dispose();
      _imageInfo = imageInfo;
    });
  }

  @override
  void dispose() {
    _imageStream?.removeListener(ImageStreamListener(_updateImage));
    _imageInfo?.dispose();
    _imageInfo = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _ShaderImageRenderObjectWidget(
      shaderBuilder: widget.shaderEnabled ? widget.shaderBuilder : null,
      imageInfo: _imageInfo,
      fit: widget.fit,
      alignment: widget.alignment,
    );
  }
}

class _ShaderImageRenderObjectWidget extends LeafRenderObjectWidget {
  const _ShaderImageRenderObjectWidget({
    // ignore: unused_element
    super.key,
    required this.shaderBuilder,
    required this.imageInfo,
    required this.fit,
    required this.alignment,
  });

  final ShaderBuilder? shaderBuilder;
  final ImageInfo? imageInfo;
  final BoxFit fit;
  final Alignment alignment;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _ShaderImageRenderObject()
      ..shaderBuilder = shaderBuilder
      ..image = imageInfo?.image
      ..fit = fit
      ..alignment = alignment;
  }

  @override
  void updateRenderObject(
      BuildContext context, _ShaderImageRenderObject renderObject) {
    renderObject
      ..shaderBuilder = shaderBuilder
      ..image = imageInfo?.image
      ..fit = fit
      ..alignment = alignment;
  }
}

class _ShaderImageRenderObject extends RenderBox {
  ShaderBuilder? _shaderBuilder;

  /// The shader builder function.
  /// Set this to null to disable the shader
  /// and render the image normally.
  ShaderBuilder? get shaderBuilder => _shaderBuilder;
  set shaderBuilder(ShaderBuilder? value) {
    if (_shaderBuilder == value) return;
    _shaderBuilder = value;
    markNeedsPaint();
  }

  ui.Image? _image;
  late Size imageSize = Size.zero;
  ui.Image? get image => _image;
  set image(ui.Image? value) {
    if (_image == value) return;
    _image = value;
    imageSize = Size(
      value?.width.toDouble() ?? 0.0,
      value?.height.toDouble() ?? 0.0,
    );
    markNeedsPaint();
  }

  late BoxFit _fit = BoxFit.contain;
  BoxFit get fit => _fit;
  set fit(BoxFit value) {
    if (_fit == value) return;
    _fit = value;
    markNeedsLayout();
  }

  late Alignment _alignment = Alignment.center;
  Alignment get alignment => _alignment;
  set alignment(Alignment value) {
    if (_alignment == value) return;
    _alignment = value;
    markNeedsLayout();
  }

  late Rect srcRect = Rect.zero, dstRect = Rect.zero;

  @override
  void performLayout() {
    if (image == null) {
      size = constraints.smallest;
      return;
    }

    final parentSize = constraints.biggest;
    final FittedSizes sizes = applyBoxFit(fit, imageSize, parentSize);
    size = sizes.destination;
    srcRect = alignment.inscribe(sizes.source, Offset.zero & imageSize);
    dstRect = alignment.inscribe(sizes.destination, Offset.zero & parentSize);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (image == null) return;

    final shader = image == null ? null : shaderBuilder?.call(image!, size);
    final paint = Paint()
      ..filterQuality = FilterQuality.medium
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    if (shader == null) {
      // no shader, just draw the image
      context.canvas.drawImageRect(
        image!,
        srcRect,
        dstRect,
        paint,
      );
    } else {
      // draw the shader
      // TODO(adil192): test/implement srcRect
      paint.shader = shader;
      context.pushTransform(
        true,
        Offset.zero,
        Matrix4.translationValues(offset.dx, offset.dy, 0),
        (context, offset) => context.canvas.drawRect(Offset.zero & size, paint),
      );
    }
  }
}
