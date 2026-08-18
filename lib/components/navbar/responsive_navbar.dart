import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:path_to_regexp/path_to_regexp.dart';
import 'package:saber/components/navbar/horizontal_navbar.dart';
import 'package:saber/components/navbar/vertical_navbar.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/pages/home/home.dart';
import 'package:saber/pages/home/whiteboard.dart';
import 'package:stow_codecs/stow_codecs.dart';

class ResponsiveNavbar extends HookWidget {
  const new({super.key, required this.body, this.selectedIndex = 0});

  final Widget body;
  final int selectedIndex;

  static var isLargeScreen = true;

  void onDestinationSelected(BuildContext context, int index) {
    if (index == selectedIndex) return;
    final routes = HomeRoutes.routes;

    // if leaving whiteboard, check if saved
    final whiteboardPath = pathToFunction(RoutePaths.home)({
      'subpage': HomePage.whiteboardSubpage,
    });
    final prevRoute = HomeRoutes.routes[selectedIndex];
    if (prevRoute.path == whiteboardPath) {
      switch (Whiteboard.savingState) {
        case null:
        case .saved:
          break;
        case .waitingToSave:
          Whiteboard.triggerSave();
          return;
        case .saving:
          return;
      }
    }

    final route = routes[index];
    context.go(route.path);
  }

  @override
  Widget build(BuildContext context) {
    useListenable(stows.locale); // update navbar text

    final screenSize = MediaQuery.sizeOf(context);
    isLargeScreen = useListenableSelector(
      stows.layoutSize,
      () => switch (stows.layoutSize.value) {
        .auto => screenSize.width >= 600,
        .phone => false,
        .tablet => true,
      },
    );

    if (isLargeScreen) {
      return Scaffold(
        body: Row(
          crossAxisAlignment: .stretch,
          children: [
            VerticalNavbar(
              selectedIndex: selectedIndex,
              onDestinationSelected: (i) => onDestinationSelected(context, i),
            ),
            Expanded(child: body),
          ],
        ),
      );
    } // else mobile

    final navbarClearance = HorizontalNavbar.clearanceHeightOf(context);
    final mediaQuery = MediaQuery.of(context);
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: [
          MediaQuery(
            data: mediaQuery.copyWith(
              padding: mediaQuery.padding + .only(bottom: navbarClearance),
              viewPadding:
                  mediaQuery.viewPadding + .only(bottom: navbarClearance),
            ),
            child: body,
          ),
          PositionedDirectional(
            bottom: 0,
            end: 0,
            child: HorizontalNavbar(
              selectedIndex: selectedIndex,
              onDestinationSelected: (i) => onDestinationSelected(context, i),
            ),
          ),
        ],
      ),
    );
  }
}

enum LayoutSize {
  auto,
  phone,
  tablet;

  static const codec = EnumCodec(values);
}
