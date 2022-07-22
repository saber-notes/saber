
import 'package:flutter/material.dart';

import 'horizontal_navbar.dart';
import 'vertical_navbar.dart';

class ResponsiveNavbar extends StatelessWidget {
  ResponsiveNavbar({ Key? key, required this.child }) : super(key: key);

  final Widget child;

  final destinations = <NavigationDestination>[
    const NavigationDestination(
      label: 'Home',
      icon: Icon(Icons.home),
    ),
    const NavigationDestination(
      label: 'Notes',
      icon: Icon(Icons.notes),
    ),
    const NavigationDestination(
      label: 'Settings',
      icon: Icon(Icons.settings),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 600) { // tablet/desktop
        return Row(
          children: <Widget>[
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: VerticalNavbar(
                destinations: destinations,
              ),
            ),
            Expanded(child: child),
          ]
        );
      } // else mobile
      return Column(
        children: <Widget>[
          Expanded(child: child),
          HorizontalNavbar(
            destinations: destinations,
          )
        ]
      );
    });
  }
}
