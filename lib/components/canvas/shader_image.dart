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
    return FittedBox(
      fit: widget.fit,
      alignment: widget.alignment,
      child: _ShaderImageRenderObjectWidget(
        shaderBuilder: widget.shaderEnabled ? widget.shaderBuilder : null,
        imageInfo: _imageInfo,
      ),
    );
  }
}

class _ShaderImageRenderObjectWidget extends LeafRenderObjectWidget {
  const _ShaderImageRenderObjectWidget({
    // ignore: unused_element
    super.key,
    required this.shaderBuilder,
    required this.imageInfo,
  });

  final ShaderBuilder? shaderBuilder;
  final ImageInfo? imageInfo;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _ShaderImageRenderObject()
      ..shaderBuilder = shaderBuilder
      ..image = imageInfo?.image;
  }

  @override
  void updateRenderObject(
      BuildContext context, _ShaderImageRenderObject renderObject) {
    renderObject
      ..shaderBuilder = shaderBuilder
      ..image = imageInfo?.image;
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

  /// The last known image size.
  ///
  /// Note that if the image is set to null,
  /// the size will be kept until a new image is set.
  /// This is to avoid layout changes when the image is null.
  ///
  /// Also note that this shouldn't be zero,
  /// as that would fail an assert in Flutter.
  late Size imageSize = const Size.square(1);

  ui.Image? _image;
  ui.Image? get image => _image;
  set image(ui.Image? value) {
    if (_image == value) return;
    _image = value;
    if (value != null) {
      imageSize = Size(
        value.width.toDouble(),
        value.height.toDouble(),
      );
    }
    markNeedsLayout();
  }

  @override
  void performLayout() {
    size = imageSize;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (image == null) return;

    final shader = shaderBuilder?.call(image!, size);
    final paint = Paint()..filterQuality = FilterQuality.medium;

    if (shader == null) {
      // no shader, just draw the image
      context.canvas.drawImage(
        image!,
        offset,
        paint,
      );
    } else {
      // draw the shader
      paint.shader = shader;
      context.pushTransform(
        needsCompositing,
        Offset.zero,
        Matrix4.translationValues(offset.dx, offset.dy, 0),
        (context, offset) => context.canvas.drawRect(
          offset & size,
          paint,
        ),
      );
    }
  }
}
