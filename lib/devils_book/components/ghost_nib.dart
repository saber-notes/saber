import 'package:flutter/material.dart';
import 'dart:math';
import 'package:saber/devils_book/sessions/session_controller.dart';
import 'package:saber/devils_book/stylus/stylus_state.dart';
import 'package:saber/devils_book/models/writing_mode.dart';
import 'package:saber/devils_book/models/loadout_manager.dart';

class GhostNib extends StatelessWidget {
  final StylusState stylusState;
  final WritingModeState writingModeState;
  final double baseThickness;

  const GhostNib({
    Key? key,
    required this.stylusState,
    required this.writingModeState,
    this.baseThickness = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([stylusState, writingModeState, LoadoutManager(), SessionController()]),
      builder: (context, child) {
        if (!writingModeState.currentMode.ghostNibEnabled || 
            !stylusState.isHovering || 
            stylusState.currentEvent == null) {
          return const SizedBox.shrink();
        }

        final event = stylusState.currentEvent!;
        final position = event.position;
        final effect = LoadoutManager().customEffect ?? LoadoutManager().currentLoadout.effect;
        
        final altitude = event.altitude == 0.0 ? (pi / 3) : event.altitude;
        final stretch = 1.0 / sin(altitude.clamp(0.2, pi / 2));
        
        final width = baseThickness;
        final height = baseThickness * stretch;
        final rotation = event.azimuth + (event.barrelRoll ?? 0.0);
        
        final sessionController = SessionController();
        final intensity = sessionController.getSessionIntensity();
        
        // Dynamic color based on effect
        final baseColor = effect.ignitionColor.withOpacity(0.4 + (0.4 * intensity));
        final glowColor = effect.ignitionColor.withOpacity(0.3 * intensity);

        return Positioned(
          left: position.dx - (width / 2) - (10 * intensity),
          top: position.dy - (height / 2) - (10 * intensity),
          child: IgnorePointer(
            child: Transform.rotate(
              angle: rotation,
              child: Container(
                width: width + (20 * intensity),
                height: height + (20 * intensity),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((width + (20 * intensity)) / 2),
                  border: Border.all(
                    color: baseColor,
                    width: 1.0 + (2.0 * intensity),
                  ),
                  boxShadow: [
                    if (intensity > 0.05)
                      BoxShadow(
                        color: glowColor,
                        blurRadius: 15 * intensity,
                        spreadRadius: 5 * intensity,
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
