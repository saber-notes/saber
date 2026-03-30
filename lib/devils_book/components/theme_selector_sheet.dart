import 'package:flutter/material.dart';
import '../models/theme_preset.dart';
import '../packs/pack_registry.dart';

/// A bottom sheet that presents themes grouped by their pack family.
class ThemeSelectorSheet extends StatelessWidget {
  final ThemePreset currentTheme;
  final ValueChanged<ThemePreset> onSelect;

  const ThemeSelectorSheet({
    Key? key,
    required this.currentTheme,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registry = PackRegistry();
    final allThemes = registry.themes.values.toList();

    // Group themes by packId
    final Map<String, List<ThemePreset>> grouped = {};
    for (final t in allThemes) {
      final key = t.packId ?? 'Ungrouped';
      grouped.putIfAbsent(key, () => []).add(t);
    }

    // Resolve pack names from registered packs
    final packNames = <String, String>{};
    for (final pack in registry.registeredPacks) {
      packNames[pack.manifest.id] = pack.manifest.name;
    }

    return Container(
      decoration: BoxDecoration(
        color: currentTheme.surfaceColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(20),
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Paper & Atmosphere',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: currentTheme.accentGlow,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: grouped.entries.map((entry) {
                final packLabel = packNames[entry.key] ?? entry.key;
                return _buildPackGroup(context, packLabel, entry.value);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPackGroup(BuildContext context, String packName, List<ThemePreset> themes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            packName,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[500],
              letterSpacing: 1.2,
            ),
          ),
        ),
        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: themes.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final theme = themes[index];
              final isSelected = theme.id == currentTheme.id;

              return GestureDetector(
                onTap: () {
                  onSelect(theme);
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: theme.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? theme.accentGlow : Colors.transparent,
                      width: isSelected ? 2.5 : 1,
                    ),
                    boxShadow: isSelected
                        ? [BoxShadow(color: theme.accentGlow.withOpacity(0.4), blurRadius: 8)]
                        : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Miniature grid preview
                      if (theme.pattern != CanvasBackgroundPattern.none)
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: theme.lineColor, width: 1),
                                top: BorderSide(color: theme.lineColor, width: 1),
                              ),
                            ),
                          ),
                        ),
                      const Spacer(),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                        decoration: BoxDecoration(
                          color: theme.surfaceColor.withOpacity(0.9),
                          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(11)),
                        ),
                        child: Text(
                          theme.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: theme.accentGlow,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
