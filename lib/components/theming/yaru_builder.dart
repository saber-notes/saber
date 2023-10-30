import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class YaruBuilder extends StatefulWidget {
  const YaruBuilder({
    super.key,
    this.enabled = true,
    required this.primary,
    required this.builder,
  });

  final bool enabled;
  final Color primary;
  final Widget Function(
    BuildContext context,
    YaruThemeData? yaruTheme,
    YaruThemeData? yaruHighContrastTheme,
  ) builder;

  @override
  State<YaruBuilder> createState() => _YaruBuilderState();
}

class _YaruBuilderState extends State<YaruBuilder> {
  Color lastPrimary = Colors.orange;
  YaruVariant closestYaruVariant = YaruVariant.orange;

  @override
  void didUpdateWidget(YaruBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);

    final newPrimary = widget.enabled ? widget.primary : lastPrimary;
    if (newPrimary != lastPrimary) {
      closestYaruVariant = findClosestYaruVariant(newPrimary);
      lastPrimary = newPrimary;
    }
  }

  /// Finds the closest yaru theme variant to the given primary color
  /// by comparing their hues.
  @visibleForTesting
  static YaruVariant findClosestYaruVariant(Color primary) {
    final primaryHue = HSLColor.fromColor(primary).hue;
    return YaruVariant.values
      .map((variant) {
        final variantHue = HSLColor.fromColor(variant.color).hue;
        return MapEntry(variant, (variantHue - primaryHue).abs());
      })
      .reduce((a, b) => a.value < b.value ? a : b).key;
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return widget.builder(context, null, null);
    }
    return YaruTheme(
      // manually set the yaru color variant
      data: YaruThemeData(
        variant: closestYaruVariant,
        useMaterial3: true,
      ),
      builder: (context, yaruTheme, _) {
        return widget.builder(
          context,
          yaruTheme,
          yaruTheme.copyWith(highContrast: true),
        );
      },
    );
  }
}
