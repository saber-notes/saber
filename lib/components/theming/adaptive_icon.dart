import 'package:flutter/material.dart';
import 'package:saber/components/theming/saber_theme.dart';

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
    if (platform.isCupertino) {
      return Icon(cupertinoIcon ?? icon, size: size);
    } else {
      return Icon(icon, size: size);
    }
  }
}
