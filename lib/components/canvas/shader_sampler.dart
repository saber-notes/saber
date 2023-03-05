import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef ShaderBuilder = ui.FragmentShader? Function(ui.Image, Size);

class ShaderSampler extends StatefulWidget {
  const ShaderSampler({
    super.key,
    this.shaderEnabled = true,
    this.prepareForSnapshot,
    required this.shaderBuilder,
    required this.child,
  });

  final bool shaderEnabled;
  final Future<void> Function()? prepareForSnapshot;
  final ShaderBuilder shaderBuilder;
  final Widget child;

  @override
  State<ShaderSampler> createState() => _ShaderSamplerState();
}

class _ShaderSamplerState extends State<ShaderSampler> {
  late final SnapshotController _controller;
  bool preparedForSnapshot = false;

  @override
  void initState() {
    _controller = SnapshotController(allowSnapshotting: false);

    if (widget.prepareForSnapshot != null) {
      widget.prepareForSnapshot!().then((_) {
        preparedForSnapshot = true;
        _controller.allowSnapshotting = widget.shaderEnabled;
      });
    } else {
      preparedForSnapshot = true;
      _controller.allowSnapshotting = widget.shaderEnabled;
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant ShaderSampler oldWidget) {
    _controller.allowSnapshotting = widget.shaderEnabled && preparedForSnapshot;
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
  void paint(PaintingContext context, Offset offset, Size size, PaintingContextCallback painter) {
    painter(context, offset);
  }

  @override
  void paintSnapshot(PaintingContext context, Offset offset, Size size, ui.Image image, Size sourceSize, double pixelRatio) {
    final shader = shaderBuilder(image, size);
    final Paint paint = Paint()
      ..shader = shader;
    context.canvas.drawRect(offset & size, paint);
  }

  @override
  bool shouldRepaint(covariant _ShaderSnapshotPainter oldPainter) => true;
}
