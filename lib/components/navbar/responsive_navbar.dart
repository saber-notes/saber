
import 'package:flutter/material.dart';
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
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 600) { // tablet/desktop
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
    });
  }

  @override
  void dispose() {
    Prefs.locale.removeListener(onChange);
    super.dispose();
  }
}
