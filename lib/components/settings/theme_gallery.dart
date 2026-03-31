import 'package:flutter/material.dart';
import 'package:saber/devils_book/models/theme_preset.dart';
import 'package:saber/devils_book/packs/pack_registry.dart';
import 'package:saber/data/prefs.dart';
import 'package:sbn/canvas_background_pattern.dart';

class ThemeGallery extends StatelessWidget {
  final String activeThemeId;
  final ValueChanged<String> onThemeSelected;

  const ThemeGallery({
    super.key,
    required this.activeThemeId,
    required this.onThemeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final registry = PackRegistry();
    final allThemes = registry.themes.values.toList();
    final colorScheme = ColorScheme.of(context);

    // Group themes by pack
    final Map<String, List<ThemePreset>> grouped = {};
    for (final theme in allThemes) {
      final key = theme.packId ?? 'Ungrouped';
      grouped.putIfAbsent(key, () => []).add(theme);
    }

    final packNames = <String, String>{};
    for (final pack in registry.registeredPacks) {
      packNames[pack.manifest.id] = pack.manifest.name;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 24, 16, 12),
          child: Text(
            'THEME REVELATIONS'.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: colorScheme.primary.withValues(alpha: 0.8),
              letterSpacing: 2.0,
            ),
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            itemCount: allThemes.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final theme = allThemes[index];
              final isSelected = theme.id == activeThemeId;

              return GestureDetector(
                onTap: () => onThemeSelected(theme.id),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: 140,
                  decoration: BoxDecoration(
                    color: theme.backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? theme.accentGlow : colorScheme.onSurface.withValues(alpha: 0.1),
                      width: isSelected ? 3 : 1,
                    ),
                    boxShadow: isSelected ? [
                      BoxShadow(
                        color: theme.accentGlow.withValues(alpha: 0.4),
                        blurRadius: 15,
                        spreadRadius: 2,
                      )
                    ] : [],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: Stack(
                      children: [
                        // Pattern Preview
                        if (theme.pattern != CanvasBackgroundPattern.none)
                          Positioned.fill(
                            child: Opacity(
                              opacity: 0.5,
                              child: _PatternPreview(pattern: theme.pattern, color: theme.lineColor),
                            ),
                          ),
                        
                        // Vignette Effect
                        if (theme.vignetteIntensity > 0)
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: RadialGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withValues(alpha: theme.vignetteIntensity * 0.8),
                                  ],
                                  stops: const [0.4, 1.0],
                                ),
                              ),
                            ),
                          ),

                        // Info Overlay
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: 0.6),
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  theme.name,
                                  style: TextStyle(
                                    color: theme.accentGlow,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (isSelected)
                                  Icon(Icons.check_circle, color: theme.accentGlow, size: 14),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PatternPreview extends StatelessWidget {
  final CanvasBackgroundPattern pattern;
  final Color color;

  const _PatternPreview({required this.pattern, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _PatternPainter(pattern: pattern, color: color),
    );
  }
}

class _PatternPainter extends CustomPainter {
  final CanvasBackgroundPattern pattern;
  final Color color;

  _PatternPainter({required this.pattern, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 0.5;

    switch (pattern) {
      case CanvasBackgroundPattern.grid:
        for (double i = 0; i < size.width; i += 10) {
          canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
        }
        for (double i = 0; i < size.height; i += 10) {
          canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
        }
        break;
      case CanvasBackgroundPattern.lined:
      case CanvasBackgroundPattern.collegeLtr:
        for (double i = 10; i < size.height; i += 15) {
          canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
        }
        break;
      case CanvasBackgroundPattern.dots:
        for (double i = 5; i < size.width; i += 15) {
          for (double j = 5; j < size.height; j += 15) {
            canvas.drawCircle(Offset(i, j), 0.5, paint);
          }
        }
        break;
      default:
        break;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
