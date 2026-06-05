import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DesktopWindowShell extends StatelessWidget {
  final Widget child;
  final BuildContext? context;

  const DesktopWindowShell({required this.child, this.context, super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop =
        Platform.isWindows || Platform.isLinux || Platform.isMacOS;

    if (!isDesktop) {
      return child;
    }

    return Column(
      children: [
        _WindowTitleBar(context: context),
        Expanded(child: child),
      ],
    );
  }
}

class _WindowTitleBar extends StatelessWidget {
  final BuildContext context;

  const _WindowTitleBar({required this.context});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(this.context);
    final backgroundColor = switch (theme.platform) {
      .linux => Colors.transparent,
      _ => theme.colorScheme.surfaceContainer,
    };
    final iconColor = Theme.of(context).colorScheme.onSurface;

    return Container(
      height: 32,
      color: backgroundColor,
      child: Row(
        children: [
          Expanded(
            child: MoveWindow(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icon/icon.svg',
                        height: 12,
                        width: 12,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Saber',
                        style: TextStyle(
                          color: iconColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          _WindowButtons(iconColor: iconColor),
        ],
      ),
    );
  }
}

class _WindowButtons extends StatelessWidget {
  final Color iconColor;

  const _WindowButtons({required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(
          colors: _buttonColors(iconColor),
          onPressed: () => appWindow.minimize(),
        ),
        MaximizeWindowButton(
          colors: _buttonColors(iconColor),
          onPressed: () => appWindow.maximize(),
        ),
        CloseWindowButton(
          colors: _buttonColors(iconColor, closeButton: true),
          onPressed: () => appWindow.close(),
        ),
      ],
    );
  }

  WindowButtonColors _buttonColors(
    Color iconColor, {
    bool closeButton = false,
  }) {
    return WindowButtonColors(
      iconNormal: iconColor,
      iconMouseOver: iconColor,
      iconMouseDown: iconColor,
      normal: Colors.transparent,
      mouseOver: Colors.grey.withValues(alpha: 0.2),
      mouseDown: closeButton
          ? Colors.red.withValues(alpha: 0.8)
          : Colors.grey.withValues(alpha: 0.6),
    );
  }
}
