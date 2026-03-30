import 'package:flutter/foundation.dart';

enum WritingModeType {
  clean,
  performanceSaver,
  ritual,
  infernal,
}

class WritingMode {
  final WritingModeType type;
  final String name;
  final String description;
  
  final bool fxEnabled;
  final bool ghostNibEnabled;
  final bool shakeEnabled;
  final bool comboScalingEnabled;
  final int maxParticles;
  final double particleScaleMultiplier;
  final double cooldownMultiplier;
  
  const WritingMode({
    required this.type,
    required this.name,
    required this.description,
    required this.fxEnabled,
    required this.ghostNibEnabled,
    this.shakeEnabled = false,
    this.comboScalingEnabled = false,
    required this.maxParticles,
    this.particleScaleMultiplier = 1.0,
    this.cooldownMultiplier = 1.0,
  });

  static const WritingMode clean = WritingMode(
    type: WritingModeType.clean,
    name: 'Clean',
    description: 'Distraction-free, pure ink. Maximum performance.',
    fxEnabled: false,
    ghostNibEnabled: false,
    maxParticles: 0,
  );

  static const WritingMode performanceSaver = WritingMode(
    type: WritingModeType.performanceSaver,
    name: 'Performance Saver',
    description: 'Battery-conscious operation. Essential hover feedback only.',
    fxEnabled: false,
    ghostNibEnabled: true,
    maxParticles: 0,
  );

  static const WritingMode ritual = WritingMode(
    type: WritingModeType.ritual,
    name: 'Ritual',
    description: 'The standard Devils Book atmosphere. Controlled ignition and subtle embers.',
    fxEnabled: true,
    ghostNibEnabled: true,
    maxParticles: 150,
  );

  static const WritingMode infernal = WritingMode(
    type: WritingModeType.infernal,
    name: 'Infernal',
    description: 'Maximum theatricality. Unbound particle emissions, reactive combos, and heavy canvas recoil.',
    fxEnabled: true,
    ghostNibEnabled: true,
    shakeEnabled: true,
    comboScalingEnabled: true,
    maxParticles: 400,
    particleScaleMultiplier: 1.5,
    cooldownMultiplier: 2.5,
  );

  static const List<WritingMode> values = [
    clean,
    performanceSaver,
    ritual,
    infernal,
  ];
}

class WritingModeState extends ChangeNotifier {
  WritingMode _currentMode = WritingMode.ritual;

  WritingMode get currentMode => _currentMode;

  void cycleMode() {
    final nextIndex = (WritingMode.values.indexOf(_currentMode) + 1) % WritingMode.values.length;
    _currentMode = WritingMode.values[nextIndex];
    notifyListeners();
  }

  void setMode(WritingMode mode) {
    if (_currentMode != mode) {
      _currentMode = mode;
      notifyListeners();
    }
  }
}
