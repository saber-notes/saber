import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class AmbientController extends ChangeNotifier {
  static final AmbientController _instance = AmbientController._internal();
  factory AmbientController() => _instance;
  AmbientController._internal();

  final AudioPlayer _player = AudioPlayer();
  String? _currentAmbientId;
  bool _isEnabled = true;
  double _volume = 0.5;

  bool get isEnabled => _isEnabled;
  double get volume => _volume;

  Future<void> init() async {
    await _player.setReleaseMode(ReleaseMode.loop);
  }

  void setEnabled(bool enabled) {
    _isEnabled = enabled;
    if (!enabled) {
      _player.stop();
    }
    notifyListeners();
  }

  void setVolume(double volume) {
    _volume = volume;
    _player.setVolume(volume);
    notifyListeners();
  }

  Future<void> playAmbient(String? ambientId) async {
    if (!_isEnabled || ambientId == null || ambientId == _currentAmbientId) return;

    try {
      // Fade out current if playing
      if (_currentAmbientId != null) {
        // Simple step fade (audioplayers doesn't have native fade yet)
        for (double v = _volume; v > 0; v -= 0.1) {
          await _player.setVolume(v);
          await Future.delayed(const Duration(milliseconds: 50));
        }
      }

      _currentAmbientId = ambientId;
      final assetPath = 'audio/$ambientId.mp3';
      
      await _player.play(AssetSource(assetPath));
      await _player.setVolume(0);
      
      // Fade in
      for (double v = 0; v < _volume; v += 0.1) {
        await _player.setVolume(v);
        await Future.delayed(const Duration(milliseconds: 50));
      }
    } catch (e) {
      debugPrint('AmbientController: Failed to play $ambientId - $e');
    }
  }

  void stop() {
    _player.stop();
    _currentAmbientId = null;
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
