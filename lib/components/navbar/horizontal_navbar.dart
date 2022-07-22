
import 'package:flutter/material.dart';

class HorizontalNavbar extends StatelessWidget {
  const HorizontalNavbar({
    Key? key,
    required this.destinations,
    this.selectedIndex = 0,
  }) : super(key: key);

  final List<NavigationDestination> destinations;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: destinations,
      selectedIndex: selectedIndex,
    );
  }
}
