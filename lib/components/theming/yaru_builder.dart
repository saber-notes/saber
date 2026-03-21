import 'package:dynamic_yaru/dynamic_yaru.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:saber/components/theming/saber_theme.dart';
import 'package:saber/data/prefs.dart';
import 'package:yaru/yaru.dart';

var _lastPrimary = Colors.transparent;
var _closestYaruVariant = YaruVariant.orange;

class YaruBuilder extends StatefulHookWidget {
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
      ThemeData? darkTheme,
      ThemeData? highContrastTheme,
      ThemeData? highContrastDarkTheme,
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
    // Use colors from KDE theme where possible.
    final themeMode = useValueListenable(stows.appTheme);
    final accentColor = useValueListenable(stows.accentColor);
    final hyperlegibleFont = useValueListenable(stows.hyperlegibleFont);
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final usePlatformBrightness = switch (themeMode) {
      .system => true,
      .light => platformBrightness == .light,
      .dark => platformBrightness == .dark,
    };
    final dynamicYaru = useMemoized(() {
      if (accentColor != null) return null; // custom theme, not system
      if (!usePlatformBrightness) return null;

      DynamicYaru.refresh();
      final theme = DynamicYaru.getTheme();
      if (theme == null) return null;

      return SaberTheme.getThemeFromYaruFixed(theme, widget.platform);
    }, [accentColor, usePlatformBrightness, widget.platform, hyperlegibleFont]);

    if (dynamicYaru != null) {
      return Builder(
        builder: (context) => widget.builder(context, (
          theme: dynamicYaru,
          darkTheme: null,
          highContrastTheme: null,
          highContrastDarkTheme: null,
        )),
      );
    }

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
