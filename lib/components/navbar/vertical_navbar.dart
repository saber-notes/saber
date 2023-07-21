
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/files/file_tree.dart';
import 'package:saber/components/theming/adaptive_icon.dart';

class VerticalNavbar extends StatefulWidget {
  const VerticalNavbar({
    super.key,
    required this.destinations,
    this.selectedIndex = 0,
    this.onDestinationSelected,
  });

  final List<NavigationRailDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  State<VerticalNavbar> createState() => _VerticalNavbarState();
}
class _VerticalNavbarState extends State<VerticalNavbar> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = Color.alphaBlend(
      colorScheme.primary.withOpacity(0.05),
      colorScheme.surface,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kToolbarHeight),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: TextButton(
              onPressed: () {setState(() {
                expanded = !expanded;
              });},
              child: AdaptiveIcon(
                icon: expanded ? Icons.chevron_left : Icons.chevron_right,
                cupertinoIcon: expanded ? CupertinoIcons.chevron_left : CupertinoIcons.chevron_right,
              ),
            ),
          ),

          IntrinsicHeight(
            child: NavigationRail(
              destinations: widget.destinations,
              selectedIndex: widget.selectedIndex,

              backgroundColor: backgroundColor,

              extended: expanded,
              minExtendedWidth: 300,

              onDestinationSelected: widget.onDestinationSelected,
            ),
          ),

          if (expanded) const Expanded(child: FileTree()),
        ],
      ),
    );
  }
}
