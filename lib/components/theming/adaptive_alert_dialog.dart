
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveAlertDialog extends StatelessWidget {
  const AdaptiveAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
  });

  final Widget title;
  final Widget content;
  final List<CupertinoDialogAction> actions;

  List<Widget> get _materialActions => actions
      .map((CupertinoDialogAction action) => TextButton(
        onPressed: action.onPressed,
        child: action.child,
      ))
      .toList();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    bool cupertino = theme.platform == TargetPlatform.iOS || theme.platform == TargetPlatform.macOS;

    if (cupertino) {
      return CupertinoAlertDialog(
        title: title,
        content: Material(
          color: Colors.transparent,
          child: content,
        ),
        actions: actions,
      );
    } else {
      return AlertDialog(
        title: title,
        content: content,
        actions: actions.isNotEmpty ? _materialActions : null,
      );
    }
  }
}
