import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

/// Emulates the scratchy sound of pencil on paper.
abstract class PencilSound {
  static final _soloud = SoLoud.instance;
  static AudioSource? _source;
  static SoundHandle? _handle;

  /// Loads the audio file into the audio cache
  /// and sets the audio context.
  static Future<void> preload() async {
    await Prefs.pencilSound.waitUntilLoaded();
    if (!await _soloud.initialized) await SoLoud.instance.init();

    _source ??= await _soloud.loadAsset('audio/white-noise-8117.ogg');
  }

  static void resume() async {
    _handle ??= await _soloud.play(_source!, volume: 0, looping: true);
    _limitSpeed();
  }

  static void pause() {
    final handle = _handle;

    if (handle == null) return;
    if (_soloud.getPause(handle) == true) return;

    _limitSpeed();
    _soloud.fadeVolume(handle, 0, const Duration(milliseconds: 50));
  }

  /// Called when the pointer moves.
  /// [distance] is the distance travelled by the pointer this frame.
  static void update(double distance) {
    const maxVolume = 0.5;
    final speed = min(1, distance / 100);
    _setVolume(speed * maxVolume);
    _setSpeed(1 - (1 - speed) * 0.5);
  }

  static bool get isPlaying => _handle != null && !_soloud.getPause(_handle!);

  /// Sets the volume to the average of the current volume and the new volume,
  /// to smooth out sudden jumps in volume.
  static void _setVolume(double volume) {
    final handle = _handle!;
    volume = (volume + _soloud.getVolume(handle)) / 2;
    _soloud.setVolume(handle, volume);
  }

  /// Sets the playback speed to the average of the current and new speeds,
  /// to smooth out sudden jumps in playback speed.
  static void _setSpeed(double speed) {
    final handle = _handle!;
    speed = (speed + _soloud.getRelativePlaySpeed(handle)) / 2;
    _soloud.setRelativePlaySpeed(handle, speed);
  }

  /// Limits the playback speed to prevent the sound being too crackly
  /// when starting and stopping a stroke.
  static void _limitSpeed([double limit = 0.7]) {
    final handle = _handle;
    if (handle == null) return;

    if (_soloud.getRelativePlaySpeed(handle) > limit)
      _soloud.setRelativePlaySpeed(handle, limit);
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
}
