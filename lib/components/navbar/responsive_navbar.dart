
import 'package:flutter/material.dart';
import 'package:saber/data/routes.dart';

import 'horizontal_navbar.dart';
import 'vertical_navbar.dart';

class ResponsiveNavbar extends StatelessWidget {
  const ResponsiveNavbar({ Key? key, required this.body }) : super(key: key);

  final Widget body;

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
                ),
              ),
            ),
            Expanded(child: body),
          ]
        );
      } // else mobile
      return Column(
        children: <Widget>[
          Expanded(child: body),
          HorizontalNavbar(
            destinations: HomeRoutes.navigationDestinations,
          )
        ]
      );
    });
  }
}
