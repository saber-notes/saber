
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  const AdaptiveButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    bool cupertino = theme.platform == TargetPlatform.iOS || theme.platform == TargetPlatform.macOS;
    if (cupertino) {
      return CupertinoButton(
        onPressed: onPressed,
        child: child,
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        child: child,
      );
    }
  }
}
