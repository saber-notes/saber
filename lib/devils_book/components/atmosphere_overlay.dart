import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:saber/devils_book/models/theme_preset.dart';
import 'package:saber/devils_book/sessions/session_controller.dart';
import 'package:saber/devils_book/sessions/session_models.dart';
import 'package:saber/devils_book/models/loadout_manager.dart';
import 'package:saber/devils_book/models/effect_preset.dart';

class AtmosphereOverlay extends StatefulWidget {
  final ThemePreset theme;
  
  const AtmosphereOverlay({
    super.key,
    required this.theme,
  });

  @override
  State<AtmosphereOverlay> createState() => _AtmosphereOverlayState();
}

class _AtmosphereOverlayState extends State<AtmosphereOverlay> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sessionController = SessionController();
    final loadoutManager = LoadoutManager();
    
    return ListenableBuilder(
      listenable: Listenable.merge([sessionController, loadoutManager, _pulseController]),
      builder: (context, child) {
        final sessionIntensity = sessionController.getSessionIntensity();
        final effect = loadoutManager.customEffect ?? loadoutManager.currentLoadout.effect;
        
        // Ritual Heartbeat: Pulse speeds up and deepens with intensity
        final pulseValue = _pulseController.value;
        final heartbeatAmplitude = 0.02 + (sessionIntensity * 0.08);
        final pulseShift = pulseValue * heartbeatAmplitude;

        // Combine theme defaults with session overrides
        double effectiveVignette = widget.theme.vignetteIntensity;
        double effectiveGrain = widget.theme.grainIntensity;
        
        // Calculate dynamic tint based on effect
        Color tintColor = widget.theme.backgroundColor;
        if (effect.particleType == ParticleType.flame) {
          tintColor = const Color(0xFF1A0500); // Infernal Glow
        } else if (effect.particleType == ParticleType.pixel) {
          tintColor = const Color(0xFF00051A); // Cyber Void
        } else if (effect.particleType == ParticleType.plasma) {
          tintColor = const Color(0xFF0D001A); // Abyssal Purple
        }

        if (sessionController.isActive) {
          final config = sessionController.activeSession!.config;
          effectiveVignette *= config.environmentMultiplier;
          
          if (config.type == SessionType.midnightMantra) {
            effectiveVignette = max(effectiveVignette, 0.4 + (sessionIntensity * 0.5));
          }
        }

        return IgnorePointer(
          child: Stack(
            children: [
              // 1. Dynamic Vignette with Effect Tint & Heartbeat
              if (effectiveVignette > 0)
                Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Colors.transparent,
                        tintColor.withValues(alpha: (0.7 * effectiveVignette).clamp(0.0, 1.0)),
                        tintColor.withValues(alpha: ((0.9 + pulseShift) * effectiveVignette).clamp(0.0, 1.0)),
                      ],
                      stops: [
                        (0.5 - (sessionIntensity * 0.1) - pulseShift).clamp(0.1, 0.5), 
                        0.85, 
                        1.0
                      ],
                    ),
                  ),
                ),
              
              // 2. Paper Grain / Noise
              if (effectiveGrain > 0)
                Opacity(
                  opacity: (effectiveGrain * (0.2 + pulseShift * 2)).clamp(0.0, 1.0),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.matrix(Matrix4.identity().storage),
                    child: const GrainAlphaPainter(),
                  ),
                ),
                
              // 3. Ritual Aura (Intensity Driven)
              if (sessionController.isActive && (sessionIntensity > 0.1 || widget.theme.customAuraColor != null))
                _buildRitualAura(widget.theme, sessionIntensity, effect.ignitionColor, pulseShift),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRitualAura(ThemePreset theme, double intensity, Color effectColor, double pulse) {
    final auraColor = theme.customAuraColor ?? effectColor.withValues(alpha: 0.5);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: auraColor.withValues(alpha: ((0.15 + pulse) * intensity).clamp(0.0, 1.0)),
          width: (25 + (pulse * 50)) * intensity,
        ),
      ),
    );
  }
}

class GrainAlphaPainter extends StatelessWidget {
  const GrainAlphaPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _NoisePainter(),
      child: const SizedBox.expand(),
    );
  }
}

class _NoisePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withValues(alpha: 0.05);
    final random = Random(42);
    for (int i = 0; i < 5000; i++) {
      canvas.drawCircle(
        Offset(random.nextDouble() * size.width, random.nextDouble() * size.height),
        random.nextDouble() * 1.5,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
