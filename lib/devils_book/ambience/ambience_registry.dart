import 'ambience_models.dart';

class AmbienceRegistry {
  static const AmbiencePreset libraryQuiet = AmbiencePreset(
    id: 'ambience_library_quiet',
    name: 'Quiet Library',
    category: AmbienceCategory.interior,
    description: 'The sound of dust settling and ancient paper rustling.',
    audioAsset: 'assets/audio/ambience_library.mp3',
    defaultVolume: 0.4,
    hasInteractiveSounds: true,
  );

  static const AmbiencePreset bloodRitual = AmbiencePreset(
    id: 'ambience_blood_ritual',
    name: 'Infernal Altar',
    category: AmbienceCategory.abstract,
    description: 'Low-frequency chanting and the crackle of ritual fires.',
    audioAsset: 'assets/audio/ambience_fire.mp3',
    defaultVolume: 0.6,
    hasInteractiveSounds: false,
  );

  static const AmbiencePreset digitalHum = AmbiencePreset(
    id: 'ambience_digital_hum',
    name: 'Cyber Void',
    category: AmbienceCategory.industrial,
    description: 'A constant, data-driven hum from the digital abyss.',
    audioAsset: 'assets/audio/ambience_digital.mp3',
    defaultVolume: 0.3,
    hasInteractiveSounds: true,
  );

  static const Map<String, AmbiencePreset> all = {
    libraryQuiet.id: libraryQuiet,
    bloodRitual.id: bloodRitual,
    digitalHum.id: digitalHum,
  };
}
