import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:stow_codecs/stow_codecs.dart';

/// Emulates the scratchy sound of pencil on paper.
abstract class PencilSound {
  static const _source = 'audio/white-noise-8117.ogg';
  static final _player = AudioPlayer(playerId: 'pencilSoundEffect')
    ..setSourceAsset(_source)
    ..setPlayerMode(PlayerMode.lowLatency)
    ..setVolume(0.1)
    ..setReleaseMode(ReleaseMode.loop);

  /// A timer that fades out the sound when the user stops drawing,
  /// instead of abruptly stopping it.
  static Timer? _pauseTimer;

  /// Loads the audio file into the audio cache
  /// and sets the audio context.
  static Future<void> preload() => Future.wait([
        stows.pencilSound.waitUntilRead().then((_) => setAudioContext()),
        _player.audioCache.loadPath(_source),
      ]);

  /// Updates the `respectSilence` setting in the audio context.
  static Future<void> setAudioContext() =>
      AudioPlayer.global.setAudioContext(AudioContextConfig(
        // Prevents the pencil sound interrupting other audio, like music.
        focus: Platform.isIOS
            ? AudioContextConfigFocus.gain
            : AudioContextConfigFocus.mixWithOthers,
        // Doesn't play the sound when the device is in silent mode.
        respectSilence: stows.pencilSound.value.respectSilence,
      ).build());

  static void resume() {
    _pauseTimer?.cancel();
    _limitPlaybackRate();
    _player.setVolume(0);
    _player.resume();
  }

  static void pause() {
    if (_player.state == PlayerState.paused) return;

    const numTicks = 4;
    var tick = 0;
    _limitPlaybackRate();
    _pauseTimer?.cancel();
    _pauseTimer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      tick++;
      _setVolume(0);
      if (tick >= numTicks) {
        _player.pause();
        _pauseTimer?.cancel();
      }
    });
  }

  /// Called when the pointer moves.
  /// [distance] is the distance travelled by the pointer this frame.
  static void update(double distance) {
    const maxVolume = 0.5;
    final speed = min(1, distance / 100);
    _setVolume(speed * maxVolume);
    _player.setPlaybackRate(1 - (1 - speed) * 0.5);
  }

  static bool get isPlaying => _player.state == PlayerState.playing;

  /// Sets the volume to the average of the current volume and the new volume,
  /// to smooth out sudden jumps in volume.
  static void _setVolume(double volume) {
    volume = (volume + _player.volume) / 2;
    _player.setVolume(volume);
  }

  /// Limits the playback rate to prevent the sound being too crackly
  /// when starting and stopping a stroke.
  static void _limitPlaybackRate([double limit = 0.7]) {
    if (_player.playbackRate > limit) _player.setPlaybackRate(limit);
  }
}

enum PencilSoundSetting {
  /// Pencil sound is disabled
  off(icon: FontAwesomeIcons.bellSlash),

  /// Pencil sound is enabled, but only when the device is not in silent mode
  onButNotInSilentMode(icon: FontAwesomeIcons.bell),

  /// Pencil sound is always enabled, even when the device is in silent mode
  onAlways(icon: FontAwesomeIcons.solidBell);

  const PencilSoundSetting({required this.icon});

  final IconData icon;

  String get description => switch (this) {
        PencilSoundSetting.off =>
          t.settings.prefDescriptions.pencilSoundSetting.off,
        PencilSoundSetting.onButNotInSilentMode =>
          t.settings.prefDescriptions.pencilSoundSetting.onButNotInSilentMode,
        PencilSoundSetting.onAlways =>
          t.settings.prefDescriptions.pencilSoundSetting.onAlways,
      };

  bool get respectSilence => switch (this) {
        PencilSoundSetting.off => true,
        PencilSoundSetting.onButNotInSilentMode => true,
        PencilSoundSetting.onAlways => false,
      };

  static const codec = EnumCodec(values);
}
