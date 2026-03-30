import 'package:flutter/material.dart';
import '../models/ink_preset.dart';
import '../packs/pack_registry.dart';

/// A bottom sheet presenting inks grouped by their pack family.
class InkSelectorSheet extends StatelessWidget {
  final InkPreset currentInk;
  final ValueChanged<InkPreset> onSelect;

  const InkSelectorSheet({
    Key? key,
    required this.currentInk,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registry = PackRegistry();
    final allInks = registry.inks.values.toList();

    final Map<String, List<InkPreset>> grouped = {};
    for (final ink in allInks) {
      final key = ink.packId ?? 'Ungrouped';
      grouped.putIfAbsent(key, () => []).add(ink);
    }

    final packNames = <String, String>{};
    for (final pack in registry.registeredPacks) {
      packNames[pack.manifest.id] = pack.manifest.name;
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(20),
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Inks & Materials',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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

  Widget _buildPackGroup(BuildContext context, String packName, List<InkPreset> inks) {
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
        ...inks.map((ink) {
          final isSelected = ink.id == currentInk.id;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: GestureDetector(
              onTap: () {
                onSelect(ink);
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? ink.baseColor.withOpacity(0.15)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? ink.baseColor : Colors.grey.withOpacity(0.2),
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    // Ink swatch with edge darkening preview
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [ink.sheenHighlight, ink.baseColor, ink.effectiveEdgeColor],
                          stops: const [0.0, 0.5, 1.0],
                        ),
                        boxShadow: isSelected
                            ? [BoxShadow(color: ink.baseColor.withOpacity(0.4), blurRadius: 6)]
                            : null,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ink.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            ),
                          ),
                          if (ink.character != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(
                                ink.character!,
                                style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                        ],
                      ),
                    ),
                    // Trait indicators
                    if (ink.sheenIntensity > 0.3)
                      const Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Icon(Icons.auto_awesome, size: 14, color: Colors.amber),
                      ),
                    if (ink.dryness > 0.3)
                      const Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Icon(Icons.grain, size: 14, color: Colors.grey),
                      ),
                    if (ink.warmth > 0.5)
                      const Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Icon(Icons.local_fire_department, size: 14, color: Colors.deepOrange),
                      ),
                  ],
                ),
              ),
            ),
          );
        }),
        const SizedBox(height: 8),
      ],
    );
  }
}
