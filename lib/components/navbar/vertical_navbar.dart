
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:saber/components/files/file_tree.dart';

class VerticalNavbar extends StatelessWidget {
  const VerticalNavbar({
    Key? key,
    required this.destinations,
    this.selectedIndex = 0,
  }) : super(key: key);

  final List<NavigationDestination> destinations;
  final int selectedIndex;

  final bool expanded = false;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: NavigationRail(
              destinations: destinations
                  .map((e) => NavigationRailDestination(icon: e.icon, label: Text(e.label)))
                  .toList(), // convert NavigationDestination to NavigationRailDestination
              selectedIndex: selectedIndex,

              backgroundColor: colorScheme.surface,

              extended: expanded,
            ),
          ),
          if (expanded) Expanded(child: FileTree(),),
        ],
      ),
    );
  }
}
