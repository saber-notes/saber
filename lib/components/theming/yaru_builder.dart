import 'package:dynamic_yaru/dynamic_yaru.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:saber/components/theming/saber_theme.dart';
import 'package:saber/data/prefs.dart';
import 'package:sbn/font_fallbacks.dart';
import 'package:yaru/yaru.dart';

class YaruBuilder extends StatefulHookWidget {
  const new({
    super.key,
    required this.primary,
    this.platform = .linux,
    required this.builder,
  });

  final Color? primary;
  final TargetPlatform platform;
  final Widget Function(BuildContext context, ThemeData theme) builder;

  @override
  State<YaruBuilder> createState() => _YaruBuilderState();
}

class _YaruBuilderState extends State<YaruBuilder> {
  @override
  Widget build(BuildContext context) {
    // Use colors from KDE theme where possible.
    final themeMode = useValueListenable(stows.appTheme);
    final accentColor = useValueListenable(stows.accentColor);
    final hyperlegibleFont = useValueListenable(stows.hyperlegibleFont);
    final highContrast = MediaQuery.highContrastOf(context);
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final Brightness brightness = switch (themeMode) {
      .system => platformBrightness,
      .light => .light,
      .dark => .dark,
    };
    final usePlatformBrightness = brightness == platformBrightness;
    final dynamicYaru = useMemoized(() {
      if (accentColor != null) return null; // custom theme, not system
      if (!usePlatformBrightness) return null;

      DynamicYaru.refresh();
      final theme = DynamicYaru.getTheme(
        fontFamily: hyperlegibleFont
            ? 'AtkinsonHyperlegibleNext'
            : 'Adwaita Sans',
        fontFamilyFallback: saberSansSerifFontFallbacks,
      );
      if (theme == null) return null;

      return SaberTheme.getThemeFromYaruFixed(theme, widget.platform);
    }, [accentColor, usePlatformBrightness, widget.platform, hyperlegibleFont]);

    if (dynamicYaru != null) {
      return widget.builder(context, dynamicYaru);
    }

    return YaruTheme(
      builder: (context, yaru, _) {
        final theme = SaberTheme.getThemeFromYaru(
          widget.primary ?? yaru.variant?.color ?? Colors.yellow,
          brightness,
          widget.platform,
          highContrast,
        );

        return widget.builder(context, theme);
      },
    );
  }
}
