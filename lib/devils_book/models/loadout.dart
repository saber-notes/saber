import 'theme_preset.dart';
import 'ink_preset.dart';
import 'effect_preset.dart';
import 'writing_mode.dart';

/// A combined configuration bridging Theme, Ink, Effect, and WritingMode.
/// Used to represent a specialized "Writing Instrument" or mood setting.
class Loadout {
  final String id;
  final String name;
  final ThemePreset theme;
  final InkPreset ink;
  final EffectPreset effect;
  final WritingMode? preferredMode;

  const Loadout({
    required this.id,
    required this.name,
    required this.theme,
    required this.ink,
    required this.effect,
    this.preferredMode,
  });
}
