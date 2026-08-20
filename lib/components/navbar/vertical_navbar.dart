import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:saber/components/files/file_tree.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/data/routes.dart';

class const VerticalNavbar({
  super.key,
  final int selectedIndex = 0,
  final ValueChanged<int>? onDestinationSelected,
}) extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final expandAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    final expandAnimation = expandAnimationController.drive(
      CurveTween(curve: Curves.easeInOut),
    );

    final isFullyCollapsed = useListenableSelector(
      expandAnimation,
      () => expandAnimation.value <= 0,
    );
    final hasBeenExpanded = useRef(false);
    hasBeenExpanded.value |= !isFullyCollapsed;

    final theme = Theme.of(context);
    final backgroundColor = switch (theme.platform) {
      .linux => Colors.transparent,
      _ => theme.colorScheme.surfaceContainer,
    };

    /// May be wider depending on the destination labels
    const minExpandedWidth = 300.0;

    final routes = HomeRoutes.routes;

    return Semantics(
      container: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: theme.platform == .linux
              ? BoxBorder.fromSTEB(end: BorderSide(color: theme.dividerColor))
              : null,
        ),
        child: Padding(
          padding: const .symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 12,
            children: [
              const SizedBox(height: kToolbarHeight - 2),
              TextButton(
                onPressed: () {
                  if (expandAnimationController.isForwardOrCompleted) {
                    expandAnimationController.reverse();
                  } else {
                    expandAnimationController.forward();
                  }
                },
                child: RotationTransition(
                  turns: expandAnimation.drive(Tween(begin: 0, end: 0.5)),
                  child: const AdaptiveIcon(
                    icon: Icons.chevron_right,
                    cupertinoIcon: CupertinoIcons.chevron_right,
                  ),
                ),
              ),
              const SizedBox(),
              for (int i = 0; i < routes.length; ++i)
                _RouteTile(
                  route: routes[i],
                  selected: i == selectedIndex,
                  onTap: () => onDestinationSelected?.call(i),
                  expandAnimation: expandAnimation,
                ),

              Expanded(
                child: SizeTransition(
                  sizeFactor: expandAnimation.drive(
                    // Extra easing to hide FileTree loading
                    CurveTween(curve: Curves.easeIn),
                  ),
                  axis: .horizontal,
                  alignment: .topStart,
                  child: SizedBox(
                    width: minExpandedWidth,
                    child: hasBeenExpanded.value
                        ? Offstage(
                            offstage: isFullyCollapsed,
                            child: const FileTree(),
                          )
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class const _RouteTile({
  required final HomeRoute route,
  required final bool selected,
  required final VoidCallback onTap,
  required final Animation<double> expandAnimation,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: selected
                ? theme.navigationRailTheme.indicatorColor ??
                      theme.colorScheme.secondaryContainer
                : null,
            borderRadius: const .all(.circular(32)),
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: const .all(.circular(32)),
            child: Padding(
              padding: const .symmetric(vertical: 6, horizontal: 18),
              child: Semantics(
                label: route.destination.label,
                selected: selected,
                child: route.destination.icon,
              ),
            ),
          ),
        ),
        ExcludeSemantics(
          // semantics redundant with icon label above
          child: SizeTransition(
            sizeFactor: expandAnimation,
            axis: .horizontal,
            alignment: .centerStart,
            child: GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const .directional(start: 8),
                child: Text(route.destination.label),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
