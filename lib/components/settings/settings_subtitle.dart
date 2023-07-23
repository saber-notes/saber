import 'package:flutter/material.dart';

class SettingsSubtitle extends StatelessWidget {
  const SettingsSubtitle({
    super.key,
    required this.subtitle,
  });

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(
        top: 32,
        left: 16,
        right: 16,
        bottom: 0,
      ),
      child: Text(
        subtitle,
        style: TextStyle(
          color: colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
