import 'package:flutter/material.dart';
import '../models/effect_preset.dart';
import '../packs/pack_registry.dart';

/// A bottom sheet presenting effects grouped by their pack family.
class EffectSelectorSheet extends StatelessWidget {
  final EffectPreset currentEffect;
  final ValueChanged<EffectPreset> onSelect;

  const EffectSelectorSheet({
    Key? key,
    required this.currentEffect,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registry = PackRegistry();
    final allEffects = registry.effects.values.toList();

    final Map<String, List<EffectPreset>> grouped = {};
    for (final e in allEffects) {
      final key = e.packId ?? 'Ungrouped';
      grouped.putIfAbsent(key, () => []).add(e);
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
      height: MediaQuery.sizeOf(context).height * 0.55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Live Effects',
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

  Widget _buildPackGroup(BuildContext context, String packName, List<EffectPreset> effects) {
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
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: effects.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final effect = effects[index];
              final isSelected = effect.id == currentEffect.id;

              return GestureDetector(
                onTap: () {
                  onSelect(effect);
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isSelected ? effect.ignitionColor : Colors.grey.withOpacity(0.2),
                      width: isSelected ? 2.5 : 1,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        effect.ignitionColor.withOpacity(0.3),
                        effect.trailColor.withOpacity(0.2),
                        effect.fadeColor.withOpacity(0.15),
                      ],
                    ),
                    boxShadow: isSelected
                        ? [BoxShadow(color: effect.ignitionColor.withOpacity(0.4), blurRadius: 8)]
                        : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Phase color dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _dot(effect.ignitionColor, 10),
                          const SizedBox(width: 4),
                          _dot(effect.trailColor, 8),
                          const SizedBox(width: 4),
                          _dot(effect.fadeColor, 6),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        effect.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          color: isSelected ? effect.ignitionColor : null,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (effect.character != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 2, left: 6, right: 6),
                          child: Text(
                            effect.character!,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 8, color: Colors.grey[500]),
                            maxLines: 2,
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

  Widget _dot(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
