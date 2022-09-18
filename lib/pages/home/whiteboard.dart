
import 'package:flutter/material.dart';
import 'package:saber/components/home/settings_switch.dart';

import 'package:saber/components/settings/nextcloud_profile.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/components/settings/update_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/editor/editor.dart';

class Whiteboard extends StatefulWidget {
  const Whiteboard({super.key});

  @override
  State<Whiteboard> createState() => _WhiteboardPageState();
}

class _WhiteboardPageState extends State<Whiteboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Whiteboard"),
      ),
      body: Editor(
        path: "/_whiteboard",
        embedded: true,
      ),
    );
  }
}
