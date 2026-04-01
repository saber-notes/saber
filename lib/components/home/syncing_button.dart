import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/data/nextcloud/saber_syncer.dart';
import 'package:saber/data/prefs.dart';

class SyncingButton extends HookWidget {
  const SyncingButton({super.key});

  /// The number of files transferred this session.
  static final filesTransferred = ValueNotifier(0);

  /// Whether to force the button to look tappable (for screenshots).
  @visibleForTesting
  static var debugForceButtonActive = false;

  /// Returns a value between 0-1 representing the progress of the sync,
  /// or null if we're still refreshing.
  double? getPercentage() {
    if (syncer.downloader.isRefreshing) return null;
    return (0.2 + filesTransferred.value) /
        (0.2 + filesTransferred.value + syncer.downloader.numPending);
  }

  void onPressed() {
    assert(stows.loggedIn);

    // Don't refresh if we're already refreshing.
    if (syncer.downloader.isRefreshing) return;

    // Reset progress indicator
    filesTransferred.value = 0;

    syncer.downloader.refresh();
  }

  @override
  Widget build(BuildContext context) {
    useListenable(filesTransferred);

    useStream(syncer.downloader.queueStream);

    final transferredFile = useStream(syncer.downloader.transferStream);
    useMemoized(() {
      // Increment count when a file is transferred
      if (transferredFile.data != null) filesTransferred.value++;
    }, [transferredFile.data]);

    useOnListenableChange(stows.username, () {
      // Reset count when the username changes
      filesTransferred.value = 0;
    });

    final percentage = getPercentage();

    return IconButton(
      onPressed: stows.loggedIn
          ? onPressed
          : (debugForceButtonActive ? () {} : null),
      padding: const .all(4),
      constraints: const BoxConstraints(
        minWidth: kMinInteractiveDimension,
        minHeight: kMinInteractiveDimension,
      ),
      icon: Stack(
        alignment: .center,
        children: [
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: (stows.loggedIn && (percentage ?? 0) < 1) ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: _AnimatedCircularProgressIndicator(
                duration: const Duration(milliseconds: 200),
                percentage: percentage,
              ),
            ),
          ),
          const Padding(
            padding: .all(4),
            child: AspectRatio(
              aspectRatio: 1,
              child: AdaptiveIcon(
                icon: Icons.sync,
                cupertinoIcon: CupertinoIcons.arrow_2_circlepath,
              ),
            ),
          ),
        ],
      ),
    );
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
    _valueTween =
        visitor(
              _valueTween,
              widget.percentage ?? 0.0,
              (dynamic value) => Tween<double>(begin: (value ?? 0.0) as double),
            )
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
      value: percentage,
    );
  }
}
