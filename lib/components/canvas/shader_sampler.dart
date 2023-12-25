import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:saber/components/canvas/shader_image.dart' show ShaderBuilder;

/// This widget applies a shader to an arbitrary child widget.
///
/// If the child widget is an Image, use [ShaderImage] instead.
class ShaderSampler extends StatefulWidget {
  const ShaderSampler({
    super.key,
    this.shaderEnabled = true,
    this.prepareForSnapshot,
    required this.shaderBuilder,
    required this.child,
  }) : assert(child is! Image,
            'Use ShaderImage instead of ShaderSampler for images.');

  final bool shaderEnabled;
  final Future Function()? prepareForSnapshot;
  final ShaderBuilder shaderBuilder;
  final Widget child;

  @override
  State<ShaderSampler> createState() => _ShaderSamplerState();
}

class _ShaderSamplerState extends State<ShaderSampler> {
  late final _controller = SnapshotController(
    allowSnapshotting: widget.shaderEnabled,
  );

  @override
  void initState() {
    widget.prepareForSnapshot?.call().then((_) {
      try {
        _controller.clear();
      } catch (e) {
        // ignore if controller is disposed by the time the future is done
      }
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant ShaderSampler oldWidget) {
    _controller.allowSnapshotting = widget.shaderEnabled;
    _controller.clear();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SnapshotWidget(
      painter: _ShaderSnapshotPainter(
        shaderBuilder: widget.shaderBuilder,
      ),
      controller: _controller,
      autoresize: true,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _ShaderSnapshotPainter extends SnapshotPainter {
  final ShaderBuilder shaderBuilder;
  _ShaderSnapshotPainter({
    required this.shaderBuilder,
  });

  @override
  void paint(PaintingContext context, Offset offset, Size size,
      PaintingContextCallback painter) {
    painter(context, offset);
  }

  @override
  void paintSnapshot(PaintingContext context, Offset offset, Size size,
      ui.Image image, Size sourceSize, double pixelRatio) {
    final shader = shaderBuilder(image, size);
    final paint = Paint()..shader = shader;
    context.pushTransform(
      true,
      Offset.zero,
      Matrix4.translationValues(offset.dx, offset.dy, 0),
      (context, offset) => context.canvas.drawRect(Offset.zero & size, paint),
    );
  }

  @override
  bool shouldRepaint(covariant _ShaderSnapshotPainter oldPainter) => true;
}
