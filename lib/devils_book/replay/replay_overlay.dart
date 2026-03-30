import 'package:flutter/material.dart';
import 'playback_controller.dart';
import 'replay_models.dart';

/// A modal overlay providing playback controls for a ReplayTimeline.
/// This would typically wrap a read-only Canvas instance driven by the controller's `visibleState`.
class ReplayOverlay extends StatefulWidget {
  final PlaybackController controller;
  final VoidCallback onClose;

  const ReplayOverlay({
    Key? key,
    required this.controller,
    required this.onClose,
  }) : super(key: key);

  @override
  State<ReplayOverlay> createState() => _ReplayOverlayState();
}

class _ReplayOverlayState extends State<ReplayOverlay> with SingleTickerProviderStateMixin {
  late PlaybackController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller.addListener(_onPlaybackChanged);
    
    // Auto-start playback on launch
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.play(this);
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_onPlaybackChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onPlaybackChanged() {
    setState(() {}); // Rebuild slider and timers
  }

  String _formatTime(int ms) {
    final seconds = (ms / 1000).floor();
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 40,
      right: 40,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20, offset: const Offset(0, 10))
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.history, color: Colors.amber, size: 20),
                    SizedBox(width: 8),
                    Text('Memory Replay', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: widget.onClose,
                  tooltip: 'Exit Replay',
                  visualDensity: VisualDensity.compact,
                )
              ],
            ),
            
            const SizedBox(height: 8),

            // Timeline Scrubber
            Row(
              children: [
                Text(_formatTime(_controller.currentMs), style: const TextStyle(fontFeatures: [FontFeature.tabularFigures()])),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 4,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
                      activeTrackColor: Colors.amber,
                      thumbColor: Colors.amber,
                      inactiveTrackColor: Colors.grey.withOpacity(0.3),
                    ),
                    child: Slider(
                      value: _controller.progressFraction,
                      onChanged: (val) {
                        _controller.pause();
                        _controller.seek(val);
                      },
                    ),
                  ),
                ),
                Text(_formatTime(_controller.totalMs), style: const TextStyle(fontFeatures: [FontFeature.tabularFigures()])),
              ],
            ),

            // Controls Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Speed Toggle
                TextButton(
                  onPressed: () {
                    final nextSpeed = _controller.speed == 1.0 ? 2.0 : (_controller.speed == 2.0 ? 4.0 : 1.0);
                    _controller.setSpeed(nextSpeed);
                  },
                  child: Text('${_controller.speed.toInt()}x', style: TextStyle(color: Colors.grey[400])),
                ),
                const SizedBox(width: 16),
                
                // Play / Pause
                IconButton(
                  iconSize: 42,
                  icon: Icon(_controller.isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill),
                  color: Colors.amber,
                  onPressed: () {
                    if (_controller.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play(this);
                    }
                  },
                ),
                const SizedBox(width: 16),

                // Step Forward (mock logic for now, jumps 5%)
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  color: Colors.grey[400],
                  onPressed: () {
                    _controller.pause();
                    _controller.seek((_controller.progressFraction + 0.05).clamp(0.0, 1.0));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
