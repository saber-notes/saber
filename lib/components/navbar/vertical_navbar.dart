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
  var expanded = false;

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF0A0A0A); // Forced Obsidian for Ritual

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          right: BorderSide(color: const Color(0xFFD4AF37).withOpacity(0.3), width: 1.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          const SizedBox(height: kToolbarHeight),
          Padding(
            padding: const .symmetric(vertical: 10, horizontal: 12),
            child: TextButton(
              onPressed: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              child: AdaptiveIcon(
                icon: expanded ? Icons.chevron_left : Icons.chevron_right,
                cupertinoIcon: expanded
                    ? CupertinoIcons.chevron_left
                    : CupertinoIcons.chevron_right,
              ),
            ),
          ),
          IntrinsicHeight(
            child: NavigationRail(
              destinations: widget.destinations,
              selectedIndex: widget.selectedIndex,
              backgroundColor: Colors.transparent,
              extended: expanded,
              minExtendedWidth: 300,
              onDestinationSelected: widget.onDestinationSelected,
              unselectedIconTheme: const IconThemeData(color: Color(0x66D4AF37)),
              selectedIconTheme: const IconThemeData(color: Color(0xFFD4AF37)),
              unselectedLabelTextStyle: const TextStyle(color: Color(0x66D4AF37), fontSize: 12, letterSpacing: 1.0),
              selectedLabelTextStyle: const TextStyle(color: Color(0xFFD4AF37), fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1.5),
              indicatorColor: const Color(0x22D4AF37),
            ),
          ),
          if (expanded) const Expanded(child: FileTree()),
        ],
      ),
    );
  }
}
