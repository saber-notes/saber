import 'package:flutter/material.dart';

/// Categories of environmental audio.
enum AmbienceCategory {
  weather,
  interior,
  nature,
  industrial,
  abstract,
}

/// A specific ambient soundscape preset.
class AmbiencePreset {
  final String id;
  final String name;
  final AmbienceCategory category;
  final String description;

  /// The audio loop asset path (e.g., 'assets/audio/ambience_rain_heavy.mp3').
  final String? audioAsset;

  /// Default playback volume (0.0 to 1.0).
  final double defaultVolume;

  /// Whether this ambience includes subtle interactive page sounds 
  /// (e.g., paper rustling on turn, scratching variations).
  final bool hasInteractiveSounds;

  /// Optional pack ID grouping this ambience into a collection.
  final String? packId;

  const AmbiencePreset({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    this.audioAsset,
    this.defaultVolume = 0.5,
    this.hasInteractiveSounds = false,
    this.packId,
  });
}
