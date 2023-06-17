import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:path_to_regexp/path_to_regexp.dart';
import 'package:saber/components/canvas/save_indicator.dart';
import 'package:saber/components/navbar/horizontal_navbar.dart';
import 'package:saber/components/navbar/vertical_navbar.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/pages/home/home.dart';
import 'package:saber/pages/home/whiteboard.dart';

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

  static bool isLargeScreen = true;
  static void setAndroidNavBarColor(ThemeData theme) async {
    await null;

    final brightness = theme.brightness;
    final otherBrightness = brightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;
    final overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;

    SystemChrome.setSystemUIOverlayStyle(overlayStyle.copyWith(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: otherBrightness,
    ));
  }
}
class _ResponsiveNavbarState extends State<ResponsiveNavbar> {
  @override
  void initState() {
    Prefs.locale.addListener(onChange);
    Prefs.layoutSize.addListener(onChange);
    super.initState();
  }

  void onChange() {
    setState(() {});
  }

  void onDestinationSelected(int index) {
    if (index == widget.selectedIndex) return;

    // if on whiteboard, check if saved
    final whiteboardPath = pathToFunction(RoutePaths.home)({'subpage': HomePage.whiteboardSubpage});
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
    ResponsiveNavbar.isLargeScreen = switch (Prefs.layoutSize.value) {
      LayoutSize.auto => MediaQuery.of(context).size.width >= 600,
      LayoutSize.phone => false,
      LayoutSize.tablet => true,
    };

    ResponsiveNavbar.setAndroidNavBarColor(Theme.of(context));

    if (ResponsiveNavbar.isLargeScreen) {
      return Scaffold(
        body: Row(children: [
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
        ]),
      );
    } // else mobile

    return Scaffold(
      body: widget.body,
      bottomNavigationBar: HorizontalNavbar(
        destinations: HomeRoutes.navigationDestinations,
        selectedIndex: widget.selectedIndex,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }

  @override
  void dispose() {
    Prefs.locale.removeListener(onChange);
    Prefs.layoutSize.removeListener(onChange);
    super.dispose();
  }
}

enum LayoutSize {
  auto,
  phone,
  tablet,
}
