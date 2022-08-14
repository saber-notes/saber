
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:saber/data/routes.dart';

class NextcloudProfile extends StatefulWidget {
  const NextcloudProfile({Key? key}) : super(key: key);

  @override
  State<NextcloudProfile> createState() => _NextcloudProfileState();
}

class _NextcloudProfileState extends State<NextcloudProfile> {

  bool? loggedIn;
  String username = "";

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future getUserInfo() async {
    loggedIn = false;
  }

  @override
  Widget build(BuildContext context) {
    String heading = " " * 10, subheading = " " * 25;
    if (loggedIn == true) {
      heading = username;
      subheading = "Logged in with Nextcloud";
    } else if (loggedIn == false) {
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
              const Icon(Icons.account_circle, size: 50),
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
