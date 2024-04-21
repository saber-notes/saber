import 'dart:math';

import 'package:audioplayers/audioplayers.dart';

/// Emulates the scratchy sound of pencil on paper.
abstract class PencilSound {
  static const _source = 'audio/white-noise-8117.mp3';
  static final _player = AudioPlayer()
    ..setSourceAsset(_source)
    ..setPlayerMode(PlayerMode.lowLatency)
    ..setVolume(0.1)
    ..setReleaseMode(ReleaseMode.loop);

  static Future<void> preload() {
    return _player.audioCache.loadPath(_source);
  }

  static void resume() {
    _player.resume();
  }

  static void pause() {
    _player.pause();
  }

  static void update(double distanceSquared) {
    final speed = min(1, distanceSquared / 10000);
    _player.setVolume(speed * 0.5);
    _player.setPlaybackRate(1 - (1 - speed) * 0.5);
  }
}
