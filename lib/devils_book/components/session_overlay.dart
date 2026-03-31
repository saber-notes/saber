import 'package:flutter/material.dart';
import '../sessions/session_controller.dart';
import '../sessions/session_models.dart';

class SessionOverlay extends StatelessWidget {
  const SessionOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = SessionController();
    
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        if (!controller.isActive) return const SizedBox.shrink();
        
        final session = controller.activeSession!;
        final config = session.config;
        final elapsed = session.elapsed;
        final strokes = session.strokeCount;
        final intensity = controller.getSessionIntensity();
        
        return IgnorePointer(
          child: Stack(
            children: [
              // Intense ritualistic vignette
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Colors.transparent,
                      const Color(0xFF050505).withOpacity(0.5 + (intensity * 0.45)), // Increases with intensity
                    ],
                    stops: [0.6 - (intensity * 0.2), 1.0], // Vignette shrinks inwards with intensity
                  ),
                ),
              ),
              
              // Session Status Header
              Positioned(
                top: 80, // Moved up for better visibility
                left: 0,
                right: 0,
                child: Center(
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 1.0, end: 1.0 + (intensity * 0.15)),
                      duration: Duration(milliseconds: (800 - (intensity * 500)).toInt()),
                      curve: Curves.elasticOut,
                      builder: (context, pulse, child) {
                        return Transform.scale(
                          scale: pulse,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF050505).withOpacity(0.9),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: const Color(0xFFD4AF37), width: 1.5),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFFF2200).withOpacity(0.3 + (intensity * 0.4)),
                                  blurRadius: (15 + (intensity * 20)) * pulse,
                                  spreadRadius: (2 + (intensity * 5)) * pulse,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  config.type.label.toUpperCase(),
                                  style: const TextStyle(
                                    color: Color(0xFFD4AF37),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 4.0,
                                    fontSize: 11,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  _formatDuration(elapsed),
                                  style: const TextStyle(
                                    color: Color(0xFFFF2200),
                                    fontSize: 32,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '$strokes RITUAL LINES INSCRIBED',
                                  style: const TextStyle(
                                    color: Color(0xFFD4AF37),
                                    fontSize: 9,
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      onEnd: () {
                        // This stateless looping is sufficient for a "pulsing heartbeat" effect
                      },
                    ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = twoDigits(d.inSeconds.remainder(60));
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final hours = d.inHours > 0 ? '${twoDigits(d.inHours)}:' : '';
    return '$hours$minutes:$seconds';
  }
}
