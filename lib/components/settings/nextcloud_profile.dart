
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';

class NextcloudProfile extends StatefulWidget {
  const NextcloudProfile({super.key});

  @override
  State<NextcloudProfile> createState() => _NextcloudProfileState();
}

class _NextcloudProfileState extends State<NextcloudProfile> {
  Uint8List? pfpBytes;

  @override
  void initState() {
    var pfpBase64 = Prefs.pfp.value;
    pfpBytes = pfpBase64.isNotEmpty ? base64Decode(pfpBase64) : null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String heading, subheading;
    if (Prefs.username.value.isNotEmpty) {
      heading = Prefs.username.value;
      subheading = "Logged in with Nextcloud";
    } else {
      heading = "Logged out";
      subheading = "Tap to log in with Nextcloud";
    }

    var colorScheme = Theme.of(context).colorScheme;
    return Material(
      child: InkWell(
        onTap: () {
          context.push(RoutePaths.login);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: Prefs.pfp.key,
                child: pfpBytes == null ? const Icon(Icons.account_circle, size: 50) : Image.memory(pfpBytes!, width: 50, height: 50),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(heading),
                  Text(subheading, style: TextStyle(color: colorScheme.secondary)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
