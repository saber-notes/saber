import 'package:flutter/material.dart';

class AdaptiveIcon extends StatelessWidget {
  const AdaptiveIcon({
    super.key,
    required this.icon,
    required this.cupertinoIcon,
    this.size,
  });

  final IconData icon;
  final IconData? cupertinoIcon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final cupertino = platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;

    if (cupertino) {
      return Icon(cupertinoIcon ?? icon, size: size);
    } else {
      return Icon(icon, size: size);
    }
  }
}
