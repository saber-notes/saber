import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/data/nextcloud/saber_syncer.dart';
import 'package:saber/data/prefs.dart';

class SyncingButton extends StatefulWidget {
  const SyncingButton({super.key});

  @override
  State<SyncingButton> createState() => _SyncingButtonState();

  /// Whether to force the button to look tappable (for screenshots).
  @visibleForTesting
  static bool forceButtonActive = false;
}

class _SyncingButtonState extends State<SyncingButton> {
  /// The number of files transferred since we started listening.
  static int filesTransferred = 0;

  late final StreamSubscription queueListener, transferListener;

  @override
  void initState() {
    queueListener = syncer.downloader.queueStream.listen(_onQueueChanged);
    transferListener =
        syncer.downloader.transferStream.listen(_onFileTransferred);
    Prefs.username.addListener(_onUsernameChanged);

    super.initState();
  }

  void _onQueueChanged([void _]) {
    if (mounted) setState(() {});
  }

  void _onFileTransferred(SaberSyncFile event) {
    filesTransferred++;
    if (mounted) setState(() {});
  }

  void _onUsernameChanged() {
    filesTransferred = 0;
    if (mounted) setState(() {});
  }

  /// Returns a value between 0-1 representing the progress of the sync,
  /// or null if we're still refreshing.
  double? getPercentage() {
    if (syncer.downloader.isRefreshing) {
      // If still refreshing, show an indeterminate progress indicator.
      filesTransferred = 0;
      return null;
    }

    final numPending = syncer.downloader.numPending;
    if (numPending == 0) {
      filesTransferred = 0;
      return 1;
    }

    return (0.2 + filesTransferred) / (0.2 + filesTransferred + numPending);
  }

  void onPressed() {
    assert(Prefs.loggedIn);

    // Don't refresh if we're already refreshing.
    if (syncer.downloader.isRefreshing) return;

    // Reset progress indicator
    filesTransferred = 0;
    if (mounted) setState(() {});

    syncer.downloader.refresh().then((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double? percentage = getPercentage();

    return IconButton(
      onPressed: Prefs.loggedIn
          ? onPressed
          : SyncingButton.forceButtonActive
              ? () {}
              : null,
      icon: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedOpacity(
            opacity: (Prefs.loggedIn && (percentage ?? 0) < 1) ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: _AnimatedCircularProgressIndicator(
              duration: const Duration(milliseconds: 200),
              percentage: percentage,
            ),
          ),
          const AdaptiveIcon(
            icon: Icons.sync,
            cupertinoIcon: CupertinoIcons.arrow_2_circlepath,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    queueListener.cancel();
    transferListener.cancel();
    Prefs.username.removeListener(_onUsernameChanged);
    super.dispose();
  }
}

class _AnimatedCircularProgressIndicator extends ImplicitlyAnimatedWidget {
  const _AnimatedCircularProgressIndicator({
    required super.duration,
    required this.percentage,
  });

  final double? percentage;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _AnimatedCircularProgressIndicatorState();
}

class _AnimatedCircularProgressIndicatorState
    extends AnimatedWidgetBaseState<_AnimatedCircularProgressIndicator> {
  Tween<double>? _valueTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _valueTween = visitor(_valueTween, widget.percentage ?? 0.0,
            (dynamic value) => Tween<double>(begin: (value ?? 0.0) as double))
        as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) {
    double? percentage = _valueTween?.evaluate(animation);
    if (percentage == 0 && widget.percentage == null) {
      percentage = null;
    }
    return CircularProgressIndicator(
      semanticsLabel: 'Syncing progress',
      semanticsValue: '${(percentage ?? 0) * 100}%',
      value: percentage,
    );
  }
}
