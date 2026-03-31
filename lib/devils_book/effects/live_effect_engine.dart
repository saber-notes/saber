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
  Offset velocity;
  final double spin; // Used for Void mode
  
  EmberParticle({
    required this.position,
    required this.spawnTime,
    required this.initialSize,
    required this.color,
    this.velocity = Offset.zero,
    this.spin = 0.0,
  });
}

class LiveEffectEngine extends ChangeNotifier {
  final List<EmberParticle> particles = [];
  final List<EmberParticle> impactFlashes = [];
  final ComboState combo = ComboState();
  Offset screenShakeOffset = Offset.zero;
  double auraIntensity = 0.0;
  EffectPreset? activePreset;
  bool isEnabled = true;
  DateTime? _lastTrailSpawn;

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
    
    // Impact Flash
    if (mode.fxEnabled) {
      impactFlashes.add(EmberParticle(
        position: position,
        spawnTime: DateTime.now(),
        initialSize: 40.0 * mult * (activePreset!.ignitionIntensity + 0.5),
        color: activePreset!.ignitionColor,
      ));
    }
    
    _addParticle(EmberParticle(
      position: position,
      spawnTime: DateTime.now(),
      initialSize: 12.0 * pressure.clamp(0.1, 1.5) * mode.particleScaleMultiplier * mult * (activePreset!.ignitionIntensity + 0.5) * activePreset!.particleScale,
      color: activePreset!.ignitionColor,
      velocity: Offset((Random().nextDouble() - 0.5) * 4.0, (Random().nextDouble() - 0.5) * 4.0),
    ), maxParticles: (mode.maxParticles * mult).toInt());
    notifyListeners();
  }
  
  void spawnTrail(Offset position, {double pressure = 1.0, required WritingMode mode}) {
    if (!isEnabled || !mode.fxEnabled || activePreset == null) return;
    
    final now = DateTime.now();
    if (_lastTrailSpawn != null && now.difference(_lastTrailSpawn!).inMilliseconds < 16) {
      return; 
    }
    _lastTrailSpawn = now;

    final mult = mode.comboScalingEnabled ? combo.comboMultiplier : 1.0;
    
    _addParticle(EmberParticle(
      position: position,
      spawnTime: now,
      initialSize: 6.0 * pressure.clamp(0.1, 1.5) * mode.particleScaleMultiplier * mult * (activePreset!.trailDensity + 0.5) * activePreset!.particleScale,
      color: activePreset!.trailColor,
      velocity: Offset((Random().nextDouble() - 0.5) * 1.5, (Random().nextDouble() - 0.5) * 1.5),
      spin: (Random().nextDouble() - 0.5) * 0.2,
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

    // Process aura intensity (follows particles / combo)
    if (mode.fxEnabled && particles.isNotEmpty) {
      double targetAura = (combo.comboMultiplier - 1.0) * 1.5; // Scale from 0.0 to ~0.75
      if (mode.particleScaleMultiplier > 1.2) targetAura += 0.3; // Infernal base aura
      
      auraIntensity = (auraIntensity * 0.9) + (targetAura.clamp(0.0, 1.0) * 0.1); // Smooth transition
      needsRemoval = true;
    } else if (auraIntensity > 0.0) {
      auraIntensity *= 0.85; // Faster decay when not writing
      if (auraIntensity < 0.01) auraIntensity = 0.0;
      needsRemoval = true;
    }
    
    final cooldownMs = (activePreset?.cooldownMs ?? 800) * mode.cooldownMultiplier;
    
    for (int i = particles.length - 1; i >= 0; i--) {
      final p = particles[i];
      final ageRatio = now.difference(p.spawnTime).inMilliseconds / cooldownMs;
      
      if (ageRatio > 1.0) {
        particles.removeAt(i);
        needsRemoval = true;
        continue;
      }

      // DEVILS BOOK: Physics Behaviors
      // Ghost: Float Upwards
      if (mode.name == 'Ritual' || mode.name == 'Infernal') {
         // Apply mild upward drift
         p.velocity = Offset(p.velocity.dx, p.velocity.dy - 0.05);
      }
      
      // Lava: Heavy dragging
      if (mode.name == 'Infernal') {
         p.velocity = Offset(p.velocity.dx * 0.98, p.velocity.dy * 0.98);
      }

      // Update position
      particles[i] = EmberParticle(
        position: p.position + p.velocity,
        spawnTime: p.spawnTime,
        initialSize: p.initialSize,
        color: p.color,
        velocity: p.velocity,
        spin: p.spin,
      );
      needsRemoval = true;
    }
    
    for (int i = impactFlashes.length - 1; i >= 0; i--) {
       if (now.difference(impactFlashes[i].spawnTime).inMilliseconds > 200) {
         impactFlashes.removeAt(i);
         needsRemoval = true;
       }
    }
    
    if (needsRemoval || particles.isNotEmpty || impactFlashes.isNotEmpty) {
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
