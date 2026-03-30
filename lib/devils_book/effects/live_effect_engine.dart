import 'dart:math';
import 'package:flutter/material.dart';
import 'package:saber/devils_book/models/effect_preset.dart';
import 'package:saber/devils_book/models/writing_mode.dart';

class ComboState {
  int hitCount = 0;
  DateTime lastHit = DateTime.now();

  double get comboMultiplier {
    return 1.0 + (hitCount.clamp(0, 50) / 100.0);
  }

  void registerHit() {
    final now = DateTime.now();
    if (now.difference(lastHit).inMilliseconds > 2000) {
      hitCount = 1; 
    } else {
      hitCount++;
    }
    lastHit = now;
  }

  void tick() {
    if (hitCount > 0 && DateTime.now().difference(lastHit).inMilliseconds > 2000) {
      hitCount = 0;
    }
  }
}

class EmberParticle {
  final Offset position;
  final DateTime spawnTime;
  final double initialSize;
  final Color color;
  
  EmberParticle({
    required this.position,
    required this.spawnTime,
    required this.initialSize,
    required this.color,
  });
}

class LiveEffectEngine extends ChangeNotifier {
  final List<EmberParticle> particles = [];
  final ComboState combo = ComboState();
  Offset screenShakeOffset = Offset.zero;
  EffectPreset? activePreset;
  bool isEnabled = true;

  void setPreset(EffectPreset preset) {
    activePreset = preset;
    notifyListeners();
  }

  void applyShake({required double intensity, required WritingMode mode}) {
    if (!mode.shakeEnabled) return;
    
    final random = Random();
    final offsetX = (random.nextDouble() - 0.5) * intensity * 2.0;
    final offsetY = (random.nextDouble() - 0.5) * intensity * 2.0;
    screenShakeOffset = Offset(offsetX, offsetY);
  }

  void spawnIgnition(Offset position, {double pressure = 1.0, required WritingMode mode}) {
    if (!isEnabled || !mode.fxEnabled || activePreset == null) return;
    
    if (mode.comboScalingEnabled) {
      combo.registerHit();
    }
    final mult = mode.comboScalingEnabled ? combo.comboMultiplier : 1.0;
    
    // Scale screen shake aggressively when users press hard or accrue high combo momentum
    if (mode.shakeEnabled) {
      final intensity = pressure * mult * 2.0; 
      if (intensity > 1.5) applyShake(intensity: intensity, mode: mode);
    }
    
    _addParticle(EmberParticle(
      position: position,
      spawnTime: DateTime.now(),
      initialSize: 12.0 * pressure.clamp(0.1, 1.5) * mode.particleScaleMultiplier * mult * (activePreset!.ignitionIntensity + 0.5) * activePreset!.particleScale,
      color: activePreset!.ignitionColor,
    ), maxParticles: (mode.maxParticles * mult).toInt());
    notifyListeners();
  }
  
  void spawnTrail(Offset position, {double pressure = 1.0, required WritingMode mode}) {
    if (!isEnabled || !mode.fxEnabled || activePreset == null) return;
    
    final mult = mode.comboScalingEnabled ? combo.comboMultiplier : 1.0;
    
    _addParticle(EmberParticle(
      position: position,
      spawnTime: DateTime.now(),
      initialSize: 6.0 * pressure.clamp(0.1, 1.5) * mode.particleScaleMultiplier * mult * (activePreset!.trailDensity + 0.5) * activePreset!.particleScale,
      color: activePreset!.trailColor,
    ), maxParticles: (mode.maxParticles * mult).toInt());
  }
  
  void _addParticle(EmberParticle particle, {required int maxParticles}) {
    particles.add(particle);
    if (particles.length > maxParticles) {
      if (particles.isNotEmpty) {
        particles.removeAt(0); 
      }
    }
  }
  
  void tick(WritingMode mode) {
    if (particles.isEmpty && screenShakeOffset == Offset.zero && combo.hitCount == 0) return;
    
    final now = DateTime.now();
    bool needsRemoval = false;
    
    // Evaluate Combo Drop
    if (mode.comboScalingEnabled) {
       final oldHits = combo.hitCount;
       combo.tick();
       if (combo.hitCount != oldHits) needsRemoval = true;
    }

    // Process screen shake decay (spring physics back to identity matrix)
    if (screenShakeOffset != Offset.zero) {
      screenShakeOffset = Offset(
        screenShakeOffset.dx * -0.5, 
        screenShakeOffset.dy * -0.5,
      );
      if (screenShakeOffset.distance < 0.1) {
        screenShakeOffset = Offset.zero;
      }
      needsRemoval = true;
    }
    
    final cooldownMs = (activePreset?.cooldownMs ?? 800) * mode.cooldownMultiplier;
    
    for (int i = particles.length - 1; i >= 0; i--) {
      final p = particles[i];
      if (now.difference(p.spawnTime).inMilliseconds > cooldownMs) {
        particles.removeAt(i);
        needsRemoval = true;
      }
    }
    
    if (needsRemoval || particles.isNotEmpty) {
      notifyListeners();
    }
  }
  
  void clear() {
    particles.clear();
    screenShakeOffset = Offset.zero;
    combo.hitCount = 0;
    notifyListeners();
  }
}
