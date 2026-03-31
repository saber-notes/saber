import 'package:flutter/material.dart';
import 'package:saber/components/theming/saber_theme.dart';

class AdaptiveIcon extends StatelessWidget {
  const AdaptiveIcon({
    super.key,
    required this.icon,
    required this.cupertinoIcon,
    this.size,
    this.color,
  });

  final IconData icon;
  final IconData? cupertinoIcon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    if (platform.isCupertino) {
      return Icon(cupertinoIcon ?? icon, size: size, color: color);
    } else {
      return Icon(icon, size: size, color: color);
    }
  }
}
