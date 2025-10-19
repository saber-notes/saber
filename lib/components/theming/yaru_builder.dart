import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class YaruBuilder extends StatefulWidget {
  const YaruBuilder({
    super.key,
    required this.primary,
    required this.builder,
    this.child,
  });

  final Color? primary;
  final Widget Function(BuildContext context, YaruThemeData yaru, Widget? child)
  builder;
  final Widget? child;

  @override
  State<YaruBuilder> createState() => _YaruBuilderState();

  /// Finds the closest yaru theme variant to the given primary color
  /// by comparing their hues.
  @visibleForTesting
  static YaruVariant? findClosestYaruVariant(Color? primary) {
    if (primary == null) return null;
    final primaryHue = HSLColor.fromColor(primary).hue;
    return YaruVariant.values
        .map((variant) {
          final variantHue = HSLColor.fromColor(variant.color).hue;
          return MapEntry(variant, (variantHue - primaryHue).abs());
        })
        .reduce((a, b) => a.value < b.value ? a : b)
        .key;
  }
}

class _YaruBuilderState extends State<YaruBuilder> {
  Color? lastPrimary;
  YaruVariant? closestYaruVariant;

  @override
  void initState() {
    super.initState();
    _updateVariant();
  }

  @override
  void didUpdateWidget(YaruBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateVariant();
  }

  void _updateVariant() {
    if (widget.primary == lastPrimary) return;
    closestYaruVariant = YaruBuilder.findClosestYaruVariant(widget.primary);
    lastPrimary = widget.primary;
  }

  @override
  Widget build(BuildContext context) {
    return YaruTheme(
      data: YaruThemeData(useMaterial3: true, variant: closestYaruVariant),
      builder: widget.builder,
      child: widget.child,
    );
  }
}
