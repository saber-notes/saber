import 'package:flutter/material.dart';

class SnackBarNotification extends StatelessWidget {
  final String message;

  const SnackBarNotification({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(message),
    );
  }

  static void show(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
