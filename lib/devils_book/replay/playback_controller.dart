import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'replay_models.dart';

/// Controls the real-time or accelerated playback of a ReplayTimeline.
class PlaybackController extends ChangeNotifier {
  final ReplayTimeline timeline;

  Ticker? _ticker;
  Duration _elapsed = Duration.zero;

  bool _isPlaying = false;
  double _playbackSpeed = 1.0;

  bool get isPlaying => _isPlaying;
  int get currentMs => _elapsed.inMilliseconds;
  int get totalMs => timeline.durationMs;
  double get progressFraction => totalMs == 0 ? 0 : (currentMs / totalMs).clamp(0.0, 1.0);
  double get speed => _playbackSpeed;

  PlaybackController(this.timeline);

  void _initTicker(TickerProvider vsync) {
    _ticker ??= vsync.createTicker(_onTick);
  }

  void _onTick(Duration dt) {
    if (!_isPlaying) return;
    
    // Scale dt by speed
    final scaledDt = Duration(microseconds: (dt.inMicroseconds * _playbackSpeed).round());
    _elapsed += scaledDt;

    if (_elapsed.inMilliseconds >= totalMs) {
      _elapsed = Duration(milliseconds: totalMs);
      _isPlaying = false;
      _ticker?.stop();
    }
    
    notifyListeners();
  }

  void play(TickerProvider vsync) {
    if (_isPlaying) return;
    if (_elapsed.inMilliseconds >= totalMs) {
      _elapsed = Duration.zero; // loop to start
    }
    _initTicker(vsync);
    _isPlaying = true;
    _ticker?.start();
    notifyListeners();
  }

  void pause() {
    if (!_isPlaying) return;
    _isPlaying = false;
    _ticker?.stop();
    notifyListeners();
  }

  void seek(double fraction) {
    final targetMs = (totalMs * fraction.clamp(0.0, 1.0)).round();
    _elapsed = Duration(milliseconds: targetMs);
    notifyListeners();
  }

  void setSpeed(double speed) {
    _playbackSpeed = speed;
    notifyListeners();
  }

  /// Extracts the visible subset of the timeline for rendering at the current playhead.
  List<ReplayEvent> get visibleState => timeline.eventsUpTo(currentMs);

  @override
  void dispose() {
    _ticker?.dispose();
    super.dispose();
  }
}
