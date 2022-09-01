
import 'package:flutter/material.dart';

class SpinningLoadingIcon extends StatefulWidget {
  const SpinningLoadingIcon({super.key});

  @override
  State<SpinningLoadingIcon> createState() => _SpinningLoadingIconState();
}

class _SpinningLoadingIconState extends State<SpinningLoadingIcon> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(() {
      setState(() {});
    });
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(turns: _controller, child: const Icon(Icons.refresh));
  }
}
