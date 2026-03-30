import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../models/writing_mode.dart';
import 'live_effect_engine.dart';

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
    if (widget.engine.particles.isNotEmpty && !_ticker.isActive) {
      _ticker.start();
    } else if (widget.engine.particles.isEmpty && _ticker.isActive) {
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
      child: AnimatedBuilder(
        animation: Listenable.merge([widget.engine, widget.writingModeState]),
        builder: (context, child) {
          if (widget.engine.particles.isEmpty || !widget.writingModeState.currentMode.fxEnabled) {
            return const SizedBox.shrink();
          }
          
          return CustomPaint(
            size: Size.infinite,
            painter: _EffectPainter(widget.engine, widget.writingModeState.currentMode),
          );
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
    final cooldownMs = (engine.activePreset?.cooldownMs ?? 800) * mode.cooldownMultiplier;

    for (final p in engine.particles) {
      final ageMs = now.difference(p.spawnTime).inMilliseconds;
      if (ageMs > cooldownMs) continue;

      final lifeRatio = 1.0 - (ageMs / cooldownMs).clamp(0.0, 1.0);
      final currentSize = p.initialSize * (0.5 + (0.5 * lifeRatio));
      
      final paint = Paint()
        ..color = p.color.withOpacity(lifeRatio)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5.0 * lifeRatio)
        ..style = PaintingStyle.fill;
        
      canvas.drawCircle(p.position, currentSize, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _EffectPainter oldDelegate) => true;
}
