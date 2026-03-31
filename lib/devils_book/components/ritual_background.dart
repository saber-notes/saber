import 'package:flutter/material.dart';
import '../models/theme_preset.dart';

class RitualBackground extends StatelessWidget {
  final ThemePreset theme;
  final double intensity;

  const RitualBackground({
    super.key,
    required this.theme,
    this.intensity = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    // If we have a gradient, we use it. Otherwise, we use the solid backgroundColor.
    final List<Color>? gradientColors = theme.backgroundGradient;
    
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.backgroundColor,
              gradient: gradientColors != null && gradientColors.length >= 2
                  ? RadialGradient(
                      colors: gradientColors,
                      center: Alignment.center,
                      radius: 1.2 + (intensity * 0.2), 
                      stops: const [0.0, 1.0],
                    )
                  : null,
            ),
            child: theme.texturePath != null
                ? Opacity(
                    opacity: theme.textureOpacity,
                    child: Image.asset(
                      theme.texturePath!,
                      repeat: ImageRepeat.repeat,
                      color: Colors.white.withOpacity(0.5 + (intensity * 0.5)),
                      colorBlendMode: theme.textureBlendMode,
                    ),
                  )
                : const SizedBox.expand(),
          ),
        ),
        // THE DEVILS VIGNETTE: Atmospheric depth
        Positioned.fill(
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(theme.vignetteIntensity * 0.5),
                    Colors.black.withOpacity(theme.vignetteIntensity),
                  ],
                  stops: const [0.4, 0.7, 1.0],
                  center: Alignment.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
