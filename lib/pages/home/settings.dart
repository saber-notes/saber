
import 'package:flutter/material.dart';

import 'package:saber/components/navbar/responsive_navbar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return ResponsiveNavbar(
      selectedIndex: 2,
      body: Scaffold(
        appBar: AppBar(
          toolbarHeight: kToolbarHeight,
          title: const Text("Settings"),
        ),
        body: const Center(
          child: Text("Settings"),
        ),
      )
    );
  }
}
