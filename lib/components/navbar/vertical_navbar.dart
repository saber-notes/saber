
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:saber/components/files/file_tree.dart';

class VerticalNavbar extends StatefulWidget {
  const VerticalNavbar({
    Key? key,
    required this.destinations,
    this.selectedIndex = 0,
  }) : super(key: key);

  final List<NavigationDestination> destinations;
  final int selectedIndex;

  @override
  _VerticalNavbarState createState() => _VerticalNavbarState();
}
class _VerticalNavbarState extends State<VerticalNavbar> {
  bool expanded = false;

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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: TextButton(
              onPressed: () {setState(() {
                expanded = !expanded;
              });},
              child: Icon(expanded ? Icons.chevron_left : Icons.chevron_right)
            ),
          ),

          IntrinsicHeight(
            child: NavigationRail(
              destinations: widget.destinations
                  .map((e) => NavigationRailDestination(icon: e.icon, label: Text(e.label)))
                  .toList(), // convert NavigationDestination to NavigationRailDestination
              selectedIndex: widget.selectedIndex,

              backgroundColor: colorScheme.surface,

              extended: expanded,
              minExtendedWidth: 300,
            ),
          ),

          if (expanded) Expanded(child: FileTree(),),
        ],
      ),
    );
  }
}
