import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/components/theming/saber_theme.dart';

class HorizontalNavbar extends StatelessWidget {
  const HorizontalNavbar({
    super.key,
    required this.destinations,
    this.selectedIndex = 0,
    this.onDestinationSelected,
  });

  final List<NavigationDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  /// The height that should be cleared at the bottom of the screen,
  /// excluding padding/safe area, to avoid overlapping the navbar.
  static double clearanceHeightOf(BuildContext context) {
    if (ResponsiveNavbar.isLargeScreen) return 0;
    final platform = Theme.of(context).platform;
    MediaQuery.sizeOf(context); // ensure context is listening to size changes
    return _heightForPlatform(platform) + 16 + 16 - 8; // -8 for toolbar padding
  }

  static double _heightForPlatform(TargetPlatform platform) {
    return platform.isCupertino ? 56.0 : 64.0;
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: GlassyContainer(
            child: Padding(
              padding: platform.isCupertino
                  ? const EdgeInsets.all(4)
                  : const EdgeInsets.all(8),
              child: Semantics(
                role: SemanticsRole.tabBar,
                explicitChildNodes: true,
                container: true,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: platform.isCupertino ? 0 : 4,
                  children: [
                    for (int i = 0; i < destinations.length; i++)
                      MergeSemantics(
                        child: Semantics(
                          role: SemanticsRole.tab,
                          selected: i == selectedIndex,
                          child: _ToolbarButton(
                            destination: destinations[i],
                            selected: i == selectedIndex,
                            select: () {
                              onDestinationSelected?.call(i);
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GlassyContainer extends StatelessWidget {
  const GlassyContainer({
    super.key,
    required this.child,
    this.height,
    this.borderRadius,
  });
  final Widget child;
  final double? height;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final colorScheme = ColorScheme.of(context);
    final height = this.height ?? HorizontalNavbar._heightForPlatform(platform);
    final borderRadius = this.borderRadius ?? BorderRadius.circular(height / 2);

    final Color background;
    if (platform.isCupertino) {
      background = colorScheme.surfaceContainer.withValues(alpha: 0.7);
    } else {
      background = colorScheme.primaryContainer;
    }

    return SizedBox(
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.5),
              spreadRadius: -1,
              blurRadius: platform.isCupertino ? 2 : 4,
              offset: const Offset(0, 1),
              blurStyle: platform.isCupertino
                  ? BlurStyle.outer
                  : BlurStyle.normal,
            ),
          ],
        ),
        child: ClipRRect(
          clipBehavior: platform.isCupertino ? Clip.antiAlias : Clip.none,
          borderRadius: borderRadius,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border:
                  (platform.isCupertino &&
                      colorScheme.brightness == Brightness.dark)
                  ? _GlintBorder(width: 1)
                  : null,
              borderRadius: borderRadius,
            ),
            child: BackdropFilter(
              enabled: platform.isCupertino,
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Material(
                type: MaterialType.transparency,
                color: Colors.transparent,
                elevation: 3,
                shadowColor: Colors.white,
                borderRadius: borderRadius,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ToolbarButton extends StatelessWidget {
  const _ToolbarButton({
    required this.destination,
    required this.selected,
    this.select,
  });

  final NavigationDestination destination;
  final bool selected;
  final VoidCallback? select;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final platform = Theme.of(context).platform;
    final borderRadius = BorderRadius.circular(32);
    final selectedBgColor = platform.isCupertino
        ? colorScheme.onPrimaryContainer.withValues(alpha: 0.15)
        : (platform == TargetPlatform.linux &&
                  colorScheme.brightness == Brightness.light
              ? colorScheme.shadow.withValues(alpha: 0.15)
              : colorScheme.surface);
    final bgColor = selected ? selectedBgColor : Colors.transparent;
    final fgColor = selected
        ? (platform.isCupertino
              ? Color.lerp(
                  CupertinoColors.systemBlue,
                  colorScheme.onSurface,
                  0.4,
                )
              : colorScheme.onSurface)
        : colorScheme.onPrimaryContainer;
    return AspectRatio(
      aspectRatio: platform.isCupertino ? 1.5 : 1.4,
      child: DecoratedBox(
        decoration: BoxDecoration(color: bgColor, borderRadius: borderRadius),
        child: InkWell(
          borderRadius: borderRadius,
          onTap: select,
          hoverColor: selectedBgColor.withValues(
            alpha: selectedBgColor.a * 0.5,
          ),
          focusColor: selectedBgColor.withValues(
            alpha: selectedBgColor.a * 0.7,
          ),
          splashColor: platform.isCupertino
              ? CupertinoColors.systemBlue.withValues(alpha: 0.5)
              : colorScheme.primary.withValues(alpha: 0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 7,
                child: IconTheme.merge(
                  data: IconThemeData(color: fgColor),
                  child: destination.icon,
                ),
              ),
              Flexible(
                flex: 3,
                child: Text(
                  destination.label,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    height: 1,
                    overflow: TextOverflow.clip,
                    color: fgColor,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A border that lights up the top-left and bottom-right corners.
class _GlintBorder extends Border {
  _GlintBorder({double width = 1})
    : super.fromBorderSide(
        BorderSide(color: const Color(0x33FFFFFF), width: width),
      );

  static const gradient = LinearGradient(
    colors: [
      Color(0x77FFFFFF),
      Color(0x33FFFFFF),
      Color(0x00FFFFFF),
      Color(0x33FFFFFF),
      Color(0x77FFFFFF),
    ],
    stops: [0.0, 0.2, 0.5, 0.8, 1.0],
    begin: Alignment(-0.5, -1.5),
    end: Alignment(0.5, 1.5),
  );

  /// Copied from [BoxBorder._paintUniformBorderWithRadius] but with a
  /// gradient shader instead of a solid color.
  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    borderRadius ??= BorderRadius.zero;
    assert(top.style != BorderStyle.none);
    final paint = Paint()
      ..color = Colors.white
      ..shader = gradient.createShader(rect);
    if (top.width == 0.0) {
      paint
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.0;
      canvas.drawRRect(borderRadius.toRRect(rect), paint);
    } else {
      final borderRect = borderRadius.toRRect(rect);
      final inner = borderRect.deflate(top.strokeInset);
      final outer = borderRect.inflate(top.strokeOutset);
      canvas.drawDRRect(outer, inner, paint);
    }
  }

  @override
  bool get isUniform => true;

  @override
  Border scale(double t) => _GlintBorder(width: top.width * t);
}
