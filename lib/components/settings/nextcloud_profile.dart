
import 'package:flutter/material.dart';

class NextcloudProfile extends StatelessWidget {
  const NextcloudProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Material(
      child: InkWell(
        onTap: () {
          // todo: login with nextcloud
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
                  const Text('Logged out'),
                  Text('Tap to log in with Nextcloud', style: TextStyle(color: colorScheme.secondary)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
