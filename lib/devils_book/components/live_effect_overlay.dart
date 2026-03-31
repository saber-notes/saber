import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../models/writing_mode.dart';
import '../models/effect_preset.dart';
import '../effects/live_effect_engine.dart';

import 'package:saber/devils_book/sessions/session_controller.dart';
import 'package:saber/devils_book/models/loadout_manager.dart';
import 'package:saber/devils_book/models/relic_element.dart';
import 'dart:ui';

class LiveEffectOverlay extends StatefulWidget {
  final LiveEffectEngine engine;
  final WritingModeState writingModeState;

  const LiveEffectOverlay({Key? key, required this.engine, required this.writingModeState}) : super(key: key);

  @override
  State<LiveEffectOverlay> createState() => _LiveEffectOverlayState();
}

class _LiveEffectOverlayState extends State<LiveEffectOverlay> with SingleTickerProviderStateMixin {
  late Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      widget.engine.tick(widget.writingModeState.currentMode);
    });
    
    widget.engine.addListener(_onEngineChanged);
  }

  void _onEngineChanged() {
    final hasActiveElements = widget.engine.particles.isNotEmpty || 
                           widget.engine.impactFlashes.isNotEmpty || 
                           widget.engine.auraIntensity > 0.01;

    if (hasActiveElements && !_ticker.isActive) {
      _ticker.start();
    } else if (!hasActiveElements && _ticker.isActive) {
      _ticker.stop();
    }
  }

  @override
  void dispose() {
    widget.engine.removeListener(_onEngineChanged);
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ListenableBuilder(
        listenable: Listenable.merge([widget.engine, widget.writingModeState, SessionController(), LoadoutManager()]),
        builder: (context, child) {
          final intensity = SessionController().getSessionIntensity();
          final relicModifier = LoadoutManager().customRelic?.modifier ?? RitualModifier.none;
          final overdrive = (intensity * relicModifier.distortionStrength).clamp(0.0, 1.5);
          
          final hasFX = widget.engine.particles.isNotEmpty || 
                      widget.engine.impactFlashes.isNotEmpty || 
                      widget.engine.auraIntensity > 0.01;

          if (!hasFX && !widget.writingModeState.currentMode.fxEnabled) {
            return const SizedBox.shrink();
          }
          
          Widget paint = CustomPaint(
            size: Size.infinite,
            painter: _EffectPainter(widget.engine, widget.writingModeState.currentMode),
          );

          // RITUAL OVERDRIVE: Screen Distortion
          if (overdrive > 0.4) {
            paint = ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: (overdrive - 0.4) * 2.0,
                sigmaY: (overdrive - 0.4) * 2.0,
                tileMode: TileMode.decal,
              ),
              child: paint,
            );
          }

          return paint;
        },
      ),
    );
  }
}

class _EffectPainter extends CustomPainter {
  final LiveEffectEngine engine;
  final WritingMode mode;

  _EffectPainter(this.engine, this.mode);

  @override
  void paint(Canvas canvas, Size size) {
    final now = DateTime.now();

    // DEVILS BOOK: Impact Flashes
    for (final f in engine.impactFlashes) {
       final ageMs = now.difference(f.spawnTime).inMilliseconds;
       final ratio = (1.0 - (ageMs / 200.0)).clamp(0.0, 1.0);
       
       final paint = Paint()
         ..color = f.color.withValues(alpha: ratio * 0.6)
         ..maskFilter = MaskFilter.blur(BlurStyle.normal, 15.0 * ratio)
         ..style = PaintingStyle.fill;
         
       canvas.drawCircle(f.position, f.initialSize * (1.0 + (1.0 - ratio)), paint);
    }

    final cooldownMs = (engine.activePreset?.cooldownMs ?? 800) * mode.cooldownMultiplier;

    for (final p in engine.particles) {
      final ageMs = now.difference(p.spawnTime).inMilliseconds;
      if (ageMs > cooldownMs) continue;

      final lifeRatio = 1.0 - (ageMs / cooldownMs).clamp(0.0, 1.0);
      final currentSize = p.initialSize * (0.5 + (0.5 * lifeRatio));
      
      final Paint paint = Paint()
        ..color = p.color.withValues(alpha: lifeRatio)
        ..style = PaintingStyle.fill;

      switch (p.type) {
        case ParticleType.pixel:
          // Sharp pixel look
          canvas.drawRect(
            Rect.fromCenter(center: p.position, width: currentSize, height: currentSize),
            paint,
          );
          break;
          
        case ParticleType.flame:
          // Premium fire: Additive blending + heavy blur for heat glow
          paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 8.0 * lifeRatio);
          paint.blendMode = BlendMode.screen;
          canvas.drawCircle(p.position, currentSize * 1.5, paint);
          
          // Hot core
          final corePaint = Paint()
            ..color = Colors.white.withValues(alpha: lifeRatio * 0.8)
            ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2.0 * lifeRatio)
            ..blendMode = BlendMode.screen;
          canvas.drawCircle(p.position, currentSize * 0.4, corePaint);
          break;

        case ParticleType.plasma:
          paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 4.0 * lifeRatio);
          paint.blendMode = BlendMode.plus;
          canvas.drawCircle(p.position, currentSize, paint);
          break;

        case ParticleType.spark:
          final sparkPaint = Paint()
            ..color = p.color.withValues(alpha: lifeRatio)
            ..strokeWidth = 1.5 * lifeRatio
            ..style = PaintingStyle.stroke;
          canvas.drawLine(p.position, p.position - (p.velocity * 2.0), sparkPaint);
          break;

        case ParticleType.ember:
          paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 5.0 * lifeRatio);
          canvas.drawCircle(p.position, currentSize, paint);
          break;

        case ParticleType.ash:
          // ASH: Smaller, grey/matte particles with subtle drift
          paint.color = p.color
              .withValues(alpha: lifeRatio * 0.7)
              .withValues(red: 0.5, green: 0.5, blue: 0.5); // Desaturate
          paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 2.0 * lifeRatio);
          canvas.drawCircle(p.position, currentSize * 0.7, paint);
          break;

        case ParticleType.voidMatter:
          // VOID: Darkening particles that 'consume' the canvas area
          paint.blendMode = BlendMode.multiply;
          paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 10.0 * lifeRatio);
          canvas.drawCircle(p.position, currentSize * 2.0, paint);
          
          // Outer ripple
          final ripplePaint = Paint()
            ..color = p.color.withValues(alpha: lifeRatio * 0.3)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2.0 * lifeRatio
            ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3.0);
          canvas.drawCircle(p.position, currentSize * 2.5, ripplePaint);
          break;
      }
    }

    // DEVILS BOOK: Atmospheric Aura (Vignette)
    if (engine.auraIntensity > 0.05) {
      final color = engine.activePreset?.ignitionColor ?? Colors.orange;
      final opacity = (engine.auraIntensity * 0.3).clamp(0.0, 0.4);
      
      final rect = Offset.zero & size;
      final Paint auraPaint = Paint()
        ..shader = RadialGradient(
          colors: [
            color.withValues(alpha: 0.0),
            color.withValues(alpha: opacity * 0.5),
            color.withValues(alpha: opacity),
          ],
          stops: const [0.6, 0.85, 1.0],
        ).createShader(rect)
        ..blendMode = BlendMode.screen;
      
      canvas.drawRect(rect, auraPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _EffectPainter oldDelegate) => true;
}
