import 'dart:io';
import 'dart:ui';

import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:material_ui/material_ui.dart';
import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/components/theming/saber_theme.dart';
import 'package:saber/data/is_this_a_test.dart';
import 'package:saber/data/routes.dart';

class const BottomNavbar({
  super.key,
  final int selectedIndex = 0,
  final ValueChanged<int>? onDestinationSelected,
}) extends StatelessWidget {
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
    final routes = HomeRoutes.routes;

    return SafeArea(
      child: Padding(
        padding: const .all(16),
        child: Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: GlassyContainer(
            child: Padding(
              padding: platform.isCupertino ? const .all(4) : const .all(8),
              child: Semantics(
                role: SemanticsRole.tabBar,
                explicitChildNodes: true,
                container: true,
                child: Row(
                  mainAxisSize: .min,
                  spacing: platform.isCupertino ? 0 : 4,
                  children: [
                    for (int i = 0; i < routes.length; i++)
                      MergeSemantics(
                        child: Semantics(
                          role: SemanticsRole.tab,
                          selected: i == selectedIndex,
                          child: _ToolbarButton(
                            destination: routes[i].destination,
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

/// A rounded container which uses liquid glass on iOS/macOS or an opaque card otherwise.
class const GlassyContainer({
  super.key,
  final double? height,
  final BorderRadius? borderRadius,
  required final Widget child,
}) extends StatelessWidget {
  /// Allows a test to temporarily hide liquid glass elements to take a clean screen capture.
  @visibleForTesting
  static var hideLiquidGlassElements = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height =
        this.height ?? BottomNavbar._heightForPlatform(theme.platform);
    final borderRadius = this.borderRadius ?? .circular(height / 2);
    if (theme.platform.isCupertino) {
      return Opacity(
        opacity: (isThisATest && hideLiquidGlassElements) ? 0 : 1,
        child: LiquidGlassLens(
          style: LiquidGlassStyle(
            adaptivity: LiquidGlassAdaptivity(
              glassColorOnDark: const Color(0x66000000),
              contentColorOnDark: const Color(0xFFFFFFFF),
              glassColorOnLight: const Color(0x77FFFFFF),
              contentColorOnLight: const Color(0xFF1C1C1E),
              permanentBrightness: theme.brightness,
              duration: isThisATest
                  ? Duration.zero
                  : const Duration(milliseconds: 300),
            ),
            shadow: const LiquidGlassShadow(),
            // Flutter warns that `liquid_glass.frag` may crash on Windows
            liteGlass: Platform.isWindows,
          ),
          child: SizedBox(
            height: height,
            child: Material(
              type: MaterialType.transparency,
              color: Colors.transparent,
              borderRadius: borderRadius,
              child: child,
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: height,
        child: Material(
          type: MaterialType.button,
          color: theme.colorScheme.primaryContainer,
          elevation: 3,
          borderRadius: borderRadius,
          child: child,
        ),
      );
    }
  }
}

class _ToolbarButton extends StatelessWidget {
  const new({required this.destination, required this.selected, this.select});

  final NavigationDestination destination;
  final bool selected;
  final VoidCallback? select;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final platform = Theme.of(context).platform;
    const borderRadius = BorderRadius.all(.circular(32));
    final selectedBgColor = platform.isCupertino
        ? colorScheme.onPrimaryContainer.withValues(alpha: 0.15)
        : (platform == .linux && colorScheme.brightness == .light
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
            mainAxisAlignment: .center,
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
                    fontWeight: .w500,
                    height: 1,
                    overflow: .clip,
                    color: fgColor,
                  ),
                  textAlign: .center,
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
