import 'package:flutter/material.dart';
import 'dart:math';
import '../stylus/stylus_state.dart';
import '../models/writing_mode.dart';

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
    return AnimatedBuilder(
      animation: Listenable.merge([stylusState, writingModeState]),
      builder: (context, child) {
        if (!writingModeState.currentMode.ghostNibEnabled || 
            !stylusState.isHovering || 
            stylusState.currentEvent == null) {
          return const SizedBox.shrink();
        }

        final event = stylusState.currentEvent!;
        final position = event.position;
        
        final altitude = event.altitude == 0.0 ? (pi / 3) : event.altitude;
        final stretch = 1.0 / sin(altitude.clamp(0.2, pi / 2));
        
        final width = baseThickness;
        final height = baseThickness * stretch;

        final rotation = event.azimuth + (event.barrelRoll ?? 0.0);

        return Positioned(
          left: position.dx - (width / 2),
          top: position.dy - (height / 2),
          child: IgnorePointer(
            child: Transform.rotate(
              angle: rotation,
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width / 2),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.4),
                    width: 1.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
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
