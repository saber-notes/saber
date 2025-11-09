import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_to_regexp/path_to_regexp.dart';
import 'package:saber/components/canvas/save_indicator.dart';
import 'package:saber/components/navbar/horizontal_navbar.dart';
import 'package:saber/components/navbar/vertical_navbar.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/pages/home/home.dart';
import 'package:saber/pages/home/whiteboard.dart';
import 'package:stow_codecs/stow_codecs.dart';

class ResponsiveNavbar extends StatefulWidget {
  const ResponsiveNavbar({
    super.key,
    required this.body,
    this.selectedIndex = 0,
  });

  final Widget body;
  final int selectedIndex;

  @override
  State<ResponsiveNavbar> createState() => _ResponsiveNavbarState();

  static var isLargeScreen = true;
}

class _ResponsiveNavbarState extends State<ResponsiveNavbar> {
  @override
  void initState() {
    stows.locale.addListener(onChange);
    stows.layoutSize.addListener(onChange);
    super.initState();
  }

  void onChange() {
    setState(() {});
  }

  void onDestinationSelected(int index) {
    if (index == widget.selectedIndex) return;

    // if on whiteboard, check if saved
    final whiteboardPath = pathToFunction(RoutePaths.home)({
      'subpage': HomePage.whiteboardSubpage,
    });
    if (HomeRoutes.getRoute(widget.selectedIndex) == whiteboardPath) {
      final savingState = Whiteboard.savingState;
      switch (savingState) {
        case null:
        case SavingState.saved:
          break;
        case SavingState.waitingToSave:
          Whiteboard.triggerSave();
          return;
        case SavingState.saving:
          return;
      }
    }

    context.go(HomeRoutes.getRoute(index));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    ResponsiveNavbar.isLargeScreen = switch (stows.layoutSize.value) {
      LayoutSize.auto => mediaQuery.size.width >= 600,
      LayoutSize.phone => false,
      LayoutSize.tablet => true,
    };

    if (ResponsiveNavbar.isLargeScreen) {
      return Scaffold(
        body: Row(
          children: [
            IntrinsicWidth(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: VerticalNavbar(
                  destinations: HomeRoutes.navigationRailDestinations,
                  selectedIndex: widget.selectedIndex,
                  onDestinationSelected: onDestinationSelected,
                ),
              ),
            ),
            Expanded(child: widget.body),
          ],
        ),
      );
    } // else mobile

    final navbarClearance = HorizontalNavbar.clearanceHeightOf(context);
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: [
          MediaQuery(
            data: mediaQuery.copyWith(
              padding:
                  mediaQuery.padding + EdgeInsets.only(bottom: navbarClearance),
              viewPadding:
                  mediaQuery.viewPadding +
                  EdgeInsets.only(bottom: navbarClearance),
            ),
            child: widget.body,
          ),
          PositionedDirectional(
            bottom: 0,
            end: 0,
            child: HorizontalNavbar(
              destinations: HomeRoutes.navigationDestinations,
              selectedIndex: widget.selectedIndex,
              onDestinationSelected: onDestinationSelected,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    stows.locale.removeListener(onChange);
    stows.layoutSize.removeListener(onChange);
    super.dispose();
  }
}

enum LayoutSize {
  auto,
  phone,
  tablet;

  static const codec = EnumCodec(values);
}
