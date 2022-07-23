
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/data/routes.dart';

import 'horizontal_navbar.dart';
import 'vertical_navbar.dart';

class ResponsiveNavbar extends StatefulWidget {
  const ResponsiveNavbar({
    Key? key,
    required this.body,
    this.selectedIndex = 0,
  }) : super(key: key);

  final Widget body;
  final int selectedIndex;

  @override
  State<ResponsiveNavbar> createState() => _ResponsiveNavbarState();

}
class _ResponsiveNavbarState extends State<ResponsiveNavbar> {

  onDestinationSelected(int index) {
    if (index == widget.selectedIndex) return;
    context.go(HomeRoutes.getRoute(index));
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 600) { // tablet/desktop
        return Row(
          children: <Widget>[
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
          ]
        );
      } // else mobile
      return Column(
        children: <Widget>[
          Expanded(child: widget.body),
          HorizontalNavbar(
            destinations: HomeRoutes.navigationDestinations,
            selectedIndex: widget.selectedIndex,
            onDestinationSelected: onDestinationSelected,
          )
        ]
      );
    });
  }
}
