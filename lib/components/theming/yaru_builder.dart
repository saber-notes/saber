import 'package:flutter/material.dart';
import 'package:saber/components/theming/saber_theme.dart';
import 'package:yaru/yaru.dart';

var _lastPrimary = Colors.transparent;
var _closestYaruVariant = YaruVariant.orange;

class YaruBuilder extends StatefulWidget {
  const YaruBuilder({
    super.key,
    required this.primary,
    this.platform = .linux,
    required this.builder,
  });

  final Color? primary;
  final TargetPlatform platform;
  final Widget Function(
    BuildContext context,
    ({
      ThemeData theme,
      ThemeData darkTheme,
      ThemeData highContrastTheme,
      ThemeData highContrastDarkTheme,
    }),
  )
  builder;

  @override
  State<YaruBuilder> createState() => _YaruBuilderState();

  /// Returns the closest yaru theme variant to the given primary color,
  /// or a cached value if the same color was provided previously.
  /// Returns null if and only if [primary] is null.
  static YaruVariant getYaruVariant(Color primary) {
    if (primary == _lastPrimary) {
      return _closestYaruVariant;
    }
    _closestYaruVariant = computeClosestYaruVariant(primary);
    _lastPrimary = primary;
    return _closestYaruVariant;
  }

  /// Finds the closest yaru theme variant to the given primary color
  /// by comparing their hues.
  /// For a cached value, use [getYaruVariant].
  @visibleForTesting
  static YaruVariant computeClosestYaruVariant(Color primary) {
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
  @override
  void initState() {
    super.initState();
    YaruBuilder.getYaruVariant(widget.primary ?? _lastPrimary);
  }

  @override
  void didUpdateWidget(YaruBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    YaruBuilder.getYaruVariant(widget.primary ?? _lastPrimary);
  }

  @override
  Widget build(BuildContext context) {
    return YaruTheme(
      data: YaruThemeData(useMaterial3: true, variant: _closestYaruVariant),
      builder: (context, yaru, _) {
        return widget.builder(context, (
          theme: SaberTheme.getThemeFromYaru(
            yaru,
            .light,
            widget.platform,
            false,
          ),
          darkTheme: SaberTheme.getThemeFromYaru(
            yaru,
            .dark,
            widget.platform,
            false,
          ),
          highContrastTheme: SaberTheme.getThemeFromYaru(
            yaru,
            .light,
            widget.platform,
            true,
          ),
          highContrastDarkTheme: SaberTheme.getThemeFromYaru(
            yaru,
            .dark,
            widget.platform,
            true,
          ),
        ));
      },
    );
  }
}
