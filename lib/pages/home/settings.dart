
import 'package:flutter/material.dart';

import 'package:saber/components/settings/nextcloud_profile.dart';
import 'package:saber/components/settings/app_info.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          Expanded(child: SingleChildScrollView(child: Column(
            children: const [
              NextcloudProfile(),
            ],
          ))),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: AppInfo(),
          ),

        ],
      ),
    );
  }
}
