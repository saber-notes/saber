
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/data/nextcloud/file_syncer.dart';
import 'package:saber/data/prefs.dart';

class SyncingButton extends StatefulWidget {
  const SyncingButton({super.key});

  @override
  State<SyncingButton> createState() => _SyncingButtonState();
}

class _SyncingButtonState extends State<SyncingButton> {

  @override
  void initState() {
    FileSyncer.filesDone.addListener(listener);
    Prefs.username.addListener(listener);

    super.initState();
  }

  void listener() {
    setState(() {});
  }

  double? getPercentage() {
    if (FileSyncer.filesDone.value == null) return null;

    int done = FileSyncer.filesDone.value!;
    int toSync = FileSyncer.filesToSync;

    if (toSync == 0 || done >= FileSyncer.filesDoneLimit) {
      return 1;
    } else {
      return done / (done + toSync);
    }
  }

  @override
  Widget build(BuildContext context) {
    double? percentage = getPercentage();
    bool loggedIn = Prefs.username.loaded && Prefs.username.value.isNotEmpty;

    return IconButton(
      onPressed: loggedIn ? () {
        FileSyncer.filesDone.value = null; // reset progress indicator
        FileSyncer.startSync();
      } : null,
      icon: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedOpacity(
            opacity:  (loggedIn && (percentage ?? 0) < 1) ? 1 : 0,
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
    FileSyncer.filesDone.removeListener(listener);
    Prefs.username.removeListener(listener);
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
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() => _AnimatedCircularProgressIndicatorState();
}
class _AnimatedCircularProgressIndicatorState extends AnimatedWidgetBaseState<_AnimatedCircularProgressIndicator> {
  Tween<double>? _valueTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _valueTween = visitor(
      _valueTween,
      widget.percentage ?? 0.0,
      (dynamic value) => Tween<double>(begin: (value ?? 0.0) as double)
    ) as Tween<double>?;
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
