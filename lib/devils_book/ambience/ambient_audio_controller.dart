import 'package:flutter/foundation.dart';
import 'ambience_models.dart';

/// Scaffolding for the audio engine module.
/// Manages the cross-fading and playback of [AmbiencePreset] soundscapes.
class AmbientAudioController extends ChangeNotifier {
  static final AmbientAudioController _instance = AmbientAudioController._internal();
  factory AmbientAudioController() => _instance;
  AmbientAudioController._internal();

  AmbiencePreset? _activeAmbience;
  double _masterVolume = 1.0;
  bool _isMuted = false;

  AmbiencePreset? get activeAmbience => _activeAmbience;
  double get masterVolume => _masterVolume;
  bool get isMuted => _isMuted;

  /// The effective volume currently being output.
  double get effectiveVolume => _isMuted ? 0.0 : _masterVolume * (_activeAmbience?.defaultVolume ?? 0.0);

  /// Transitions to a new ambience preset.
  /// In a full implementation, this should trigger a 1-2 second audio cross-fade.
  void setAmbience(AmbiencePreset? preset) {
    if (_activeAmbience?.id == preset?.id) return;
    
    // STUB: Fade out current audio player, load new asset, fade in.
    _activeAmbience = preset;
    notifyListeners();
  }

  /// Sets the global master volume for ambience.
  void setMasterVolume(double volume) {
    _masterVolume = volume.clamp(0.0, 1.0);
    // STUB: Apply immediately to the active audio player.
    notifyListeners();
  }

  /// Toggles global mute state.
  void toggleMute() {
    _isMuted = !_isMuted;
    // STUB: Apply immediately to the active audio player.
    notifyListeners();
  }

  /// Plays a transient interaction sound (e.g., page turn, heavy bookmark placement).
  /// This bypasses the looping audio player and uses a pool of one-shot players.
  void playFoley(String eventType) {
    if (_isMuted || _activeAmbience?.hasInteractiveSounds != true) return;
    // STUB: Map eventType (e.g., 'page_turn') to a specific asset in the active pack and play once.
  }
}
