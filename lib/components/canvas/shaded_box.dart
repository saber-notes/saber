import 'dart:ui' as ui;

import 'package:flutter/material.dart';

typedef ShaderBuilder = ui.FragmentShader? Function(ui.Image, Size);

/// A widget that renders an [image] with a shader applied to it.
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
  });

  final bool shaderEnabled;
  final ShaderBuilder shaderBuilder;
  final ImageProvider image;

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
      shaderBuilder: widget.shaderBuilder,
      imageInfo: _imageInfo,
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

  final ShaderBuilder shaderBuilder;
  final ImageInfo? imageInfo;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _ShaderImageRenderObject()
      ..shaderBuilder = shaderBuilder
      ..image = imageInfo?.image
      ..scale = imageInfo?.scale ?? 1.0;
  }

  @override
  void updateRenderObject(
      BuildContext context, _ShaderImageRenderObject renderObject) {
    renderObject
      ..shaderBuilder = shaderBuilder
      ..image = imageInfo?.image
      ..scale = imageInfo?.scale ?? 1.0;
  }
}

class _ShaderImageRenderObject extends RenderBox {
  late ShaderBuilder _shaderBuilder;
  ShaderBuilder get shaderBuilder => _shaderBuilder;
  set shaderBuilder(ShaderBuilder value) {
    if (_shaderBuilder == value) return;
    _shaderBuilder = value;
    markNeedsPaint();
  }

  late ui.Image? _image;
  ui.Image? get image => _image;
  set image(ui.Image? value) {
    if (_image == value) return;
    _image = value;
    markNeedsPaint();
  }

  late double _scale = 1;
  double get scale => _scale;
  set scale(double value) {
    if (_scale == value) return;
    _scale = value;
    markNeedsPaint();
  }

  ui.FragmentShader? shader;

  @override
  bool get sizedByParent => true;
  @override
  void performResize() => size = constraints.biggest;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (image == null) return;

    final shader = image == null ? null : shaderBuilder(image!, size);
    final paint = Paint()
      ..filterQuality = FilterQuality.medium
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    if (shader == null) {
      // paint the image directly
      context.canvas.drawImage(image!, offset, paint);
    } else {
      // paint the fragment shader (which samples the image)
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
