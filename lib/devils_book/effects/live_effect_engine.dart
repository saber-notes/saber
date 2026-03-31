import 'dart:math';
import 'package:flutter/material.dart';
import 'package:saber/devils_book/models/effect_preset.dart';
import 'package:saber/devils_book/models/writing_mode.dart';
import 'package:saber/devils_book/models/loadout_manager.dart';
import 'package:saber/devils_book/sessions/session_controller.dart';
import 'package:saber/devils_book/models/relic_element.dart';

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
  final double spin;
  final ParticleType type;
  
  // Physics metadata
  double heading;
  double noiseOffset;

  EmberParticle({
    required this.position,
    required this.spawnTime,
    required this.initialSize,
    required this.color,
    this.velocity = Offset.zero,
    this.spin = 0.0,
    this.type = ParticleType.ember,
    this.heading = 0.0,
    this.noiseOffset = 0.0,
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

  RitualModifier get _activeModifier => LoadoutManager().customRelic?.modifier ?? RitualModifier.none;

  void applyShake({required double intensity, required WritingMode mode}) {
    if (!mode.shakeEnabled) return;
    
    final random = Random();
    final offsetX = (random.nextDouble() - 0.5) * intensity * 2.0;
    final offsetY = (random.nextDouble() - 0.5) * intensity * 2.0;
    screenShakeOffset = Offset(offsetX, offsetY);
  }

  void spawnIgnition(Offset position, {double pressure = 1.0, required WritingMode mode}) {
    if (!isEnabled || !mode.fxEnabled || activePreset == null) return;
    
    final sessionIntensity = SessionController().getSessionIntensity();
    final relicModifier = LoadoutManager().customRelic?.modifier ?? RitualModifier.none;
    
    if (mode.comboScalingEnabled) {
      combo.registerHit();
    }
    
    final comboMult = mode.comboScalingEnabled ? combo.comboMultiplier : 1.0;
    // Ritual intensity multiplier combines speed (session) and relic power
    final ritualMult = comboMult * (1.0 + (sessionIntensity * 0.5)) * relicModifier.particleMultiplier;
    
    // Scale screen shake aggressively when users press hard or at high ritual energy
    if (mode.shakeEnabled) {
      final shakeIntensity = pressure * ritualMult * 2.5; 
      if (shakeIntensity > 1.2) applyShake(intensity: shakeIntensity, mode: mode);
    }
    
    // Impact Flash
    if (mode.fxEnabled) {
      impactFlashes.add(EmberParticle(
        position: position,
        spawnTime: DateTime.now(),
        initialSize: 40.0 * ritualMult * (activePreset!.ignitionIntensity + 0.5),
        color: activePreset!.ignitionColor,
      ));
    }
    
    final random = Random();
    _addParticle(EmberParticle(
      position: position,
      spawnTime: DateTime.now(),
      initialSize: 12.0 * pressure.clamp(0.1, 1.5) * mode.particleScaleMultiplier * ritualMult * (activePreset!.ignitionIntensity + 0.5) * activePreset!.particleScale,
      color: activePreset!.ignitionColor,
      velocity: Offset((random.nextDouble() - 0.5) * 6.0 * (1.0 + sessionIntensity), (random.nextDouble() - 0.5) * 6.0 * (1.0 + sessionIntensity)),
      type: activePreset!.particleType,
      heading: random.nextDouble() * pi * 2,
      noiseOffset: random.nextDouble() * 1000,
    ), maxParticles: (mode.maxParticles * ritualMult).toInt());
    notifyListeners();
  }
  
  void spawnTrail(Offset position, {double pressure = 1.0, required WritingMode mode}) {
    if (!isEnabled || !mode.fxEnabled || activePreset == null) return;
    
    final now = DateTime.now();
    if (_lastTrailSpawn != null && now.difference(_lastTrailSpawn!).inMilliseconds < 16) {
      return; 
    }
    _lastTrailSpawn = now;

    final sessionIntensity = SessionController().getSessionIntensity();
    final relicModifier = LoadoutManager().customRelic?.modifier ?? RitualModifier.none;
    final comboMult = mode.comboScalingEnabled ? combo.comboMultiplier : 1.0;
    final ritualMult = comboMult * (1.0 + (sessionIntensity * 0.5)) * relicModifier.particleMultiplier;
    
    final random = Random();
    _addParticle(EmberParticle(
      position: position,
      spawnTime: now,
      initialSize: 6.0 * pressure.clamp(0.1, 1.5) * mode.particleScaleMultiplier * ritualMult * (activePreset!.trailDensity + 0.5) * activePreset!.particleScale,
      color: activePreset!.trailColor,
      velocity: Offset((random.nextDouble() - 0.5) * 2.0 * (1.0 + sessionIntensity), (random.nextDouble() - 0.5) * 2.0 * (1.0 + sessionIntensity)),
      spin: (random.nextDouble() - 0.5) * 0.2 * (1.0 + sessionIntensity),
      type: activePreset!.particleType,
      heading: random.nextDouble() * pi * 2,
      noiseOffset: random.nextDouble() * 1000,
    ), maxParticles: (mode.maxParticles * ritualMult).toInt());
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
      final ageRatio = (now.difference(p.spawnTime).inMilliseconds / cooldownMs).clamp(0.0, 1.0);
      
      if (ageRatio >= 1.0) {
        particles.removeAt(i);
        needsRemoval = true;
        continue;
      }

      // Physics Behaviors
      Offset nextVelocity = p.velocity;
      Offset nextPosition = p.position;
      Color nextColor = p.color;

      switch (p.type) {
        case ParticleType.flame:
          // REAL FIRE: Upward drift + horizontal flicker (sine wave)
          final flicker = sin((now.millisecond / 100.0) + p.noiseOffset) * 0.8;
          nextVelocity = Offset(p.velocity.dx + flicker, p.velocity.dy - 0.25);
          nextVelocity = Offset(nextVelocity.dx * 0.9, nextVelocity.dy * 0.95); // Drag
          
          // Flame Color Interpolation: White/Yellow -> Orange -> Red -> Fade
          if (activePreset != null) {
            if (ageRatio < 0.2) {
              nextColor = Color.lerp(activePreset!.ignitionColor, activePreset!.trailColor, ageRatio / 0.2)!;
            } else if (ageRatio < 0.6) {
              nextColor = Color.lerp(activePreset!.trailColor, activePreset!.secondaryColor ?? activePreset!.fadeColor, (ageRatio - 0.2) / 0.4)!;
            } else {
              nextColor = Color.lerp(activePreset!.secondaryColor ?? activePreset!.fadeColor, activePreset!.fadeColor, (ageRatio - 0.6) / 0.4)!;
            }
          }
          break;

        case ParticleType.pixel:
          // PIXEL GLITCH: Quantized movement, occasional "teleport"
          if (Random().nextDouble() < 0.05) {
             nextPosition += Offset((Random().nextDouble() - 0.5) * 10.0, (Random().nextDouble() - 0.5) * 10.0);
          }
          nextVelocity = p.velocity * 0.9;
          break;

        case ParticleType.spark:
          // SPARKS: High speed, gravity-affected
          nextVelocity = Offset(p.velocity.dx, p.velocity.dy + 0.15);
          break;

        case ParticleType.plasma:
          // PLASMA: Swirling / Vortex movement
          p.heading += 0.1;
          final orbitX = cos(p.heading) * 2.0;
          final orbitY = sin(p.heading) * 2.0;
          nextVelocity = Offset(orbitX, orbitY);
          break;

        case ParticleType.ember:
          // Standard Ember Physics
          if (mode.name == 'Ritual' || mode.name == 'Infernal') {
            nextVelocity = Offset(p.velocity.dx, p.velocity.dy - 0.05);
          }
          if (mode.name == 'Infernal') {
            nextVelocity =
                Offset(nextVelocity.dx * 0.98, nextVelocity.dy * 0.98);
          }
          break;

        case ParticleType.ash:
          // ASH: Slow downward drift with horizontal noise
          final horizontalNoise =
              sin((now.millisecond / 200.0) + p.noiseOffset) * 0.2;
          nextVelocity = Offset(p.velocity.dx + horizontalNoise, 0.5);
          nextVelocity = Offset(nextVelocity.dx * 0.9, nextVelocity.dy);
          break;

        case ParticleType.voidMatter:
          // VOID: Unstable flickering position, slow movement
          if (Random().nextDouble() < 0.1) {
            nextPosition += Offset((Random().nextDouble() - 0.5) * 4.0,
                (Random().nextDouble() - 0.5) * 4.0);
          }
          nextVelocity = p.velocity * 0.85;
          break;
        default:
          break;
      }

      // DEVILS BOOK: Ritual Modifier Pass
      if (_activeModifier.distortionStrength > 0) {
        final distortion = sin((now.millisecond / 50.0) + p.noiseOffset) * _activeModifier.distortionStrength;
        nextPosition += Offset(distortion, distortion);
      }

      // Update position
      particles[i] = EmberParticle(
        position: nextPosition + nextVelocity,
        spawnTime: p.spawnTime,
        initialSize: p.initialSize,
        color: nextColor,
        velocity: nextVelocity,
        spin: p.spin,
        type: p.type,
        heading: p.heading,
        noiseOffset: p.noiseOffset,
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
