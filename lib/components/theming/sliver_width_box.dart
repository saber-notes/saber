import 'package:flutter/material.dart';

class SliverWidthBox extends StatelessWidget {
  const SliverWidthBox({
    super.key,
    required this.width,
    required this.sliver,
  });

  final double width;
  final Widget sliver;

  @override
  Widget build(BuildContext context) {
    final windowSize = MediaQuery.of(context).size;
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: windowSize.width > width
            ? (windowSize.width - width) / 2
            : 0,
      ),
      sliver: sliver,
    );
  }
}
