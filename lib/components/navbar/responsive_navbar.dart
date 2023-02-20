import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/navbar/horizontal_navbar.dart';
import 'package:saber/components/navbar/vertical_navbar.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';

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

  static bool _isLargeScreen = true;
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
      systemNavigationBarColor: ElevationOverlay.applySurfaceTint(
        theme.scaffoldBackgroundColor,
        theme.colorScheme.surfaceTint,
        _isLargeScreen ? 0 : 3,
      ),
      systemNavigationBarIconBrightness: otherBrightness,
    ));
  }
}
class _ResponsiveNavbarState extends State<ResponsiveNavbar> {
  @override
  void initState() {
    Prefs.locale.addListener(onChange);
    super.initState();
  }

  void onChange() {
    setState(() {});
  }

  void onDestinationSelected(int index) {
    if (index == widget.selectedIndex) return;
    context.go(HomeRoutes.getRoute(index));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    ResponsiveNavbar._isLargeScreen = screenWidth >= 600;

    ResponsiveNavbar.setAndroidNavBarColor(Theme.of(context));

    if (ResponsiveNavbar._isLargeScreen) {
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
    super.dispose();
  }
}
