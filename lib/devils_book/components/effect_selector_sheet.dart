import 'package:flutter/material.dart';
import 'package:saber/devils_book/models/effect_preset.dart';
import 'package:saber/devils_book/registry/devils_catalog.dart';

class EffectSelectorSheet extends StatelessWidget {
  final EffectPreset currentEffect;
  final ValueChanged<EffectPreset> onSelect;

  const EffectSelectorSheet({
    super.key,
    required this.currentEffect,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final allEffects = DevilsCatalog.effects.values.toList();
    
    return Container(
      height: 450,
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'CHOOSE YOUR RITUAL EFFECT',
              style: TextStyle(
                color: Color(0xFFD4AF37),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: allEffects.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final effect = allEffects[index];
                final isSelected = effect.id == currentEffect.id;
                
                return GestureDetector(
                  onTap: () {
                    onSelect(effect);
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFFF2200) : Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected ? const Color(0xFFFF2200) : Colors.white.withValues(alpha: 0.1),
                        width: isSelected ? 2 : 1,
                      ),
                      boxShadow: isSelected ? [
                        BoxShadow(
                          color: const Color(0xFFFF2200).withValues(alpha: 0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                        )
                      ] : [],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: effect.ignitionColor.withValues(alpha: 0.1),
                            border: Border.all(color: effect.ignitionColor.withValues(alpha: 0.3)),
                          ),
                          child: Icon(
                            _getIconForType(effect.particleType),
                            color: effect.ignitionColor,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                effect.name.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _getDescriptionForType(effect.particleType),
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.4),
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isSelected)
                          const Icon(Icons.auto_awesome, color: Color(0xFFFF2200), size: 16),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  IconData _getIconForType(ParticleType type) {
    switch (type) {
      case ParticleType.flame: return Icons.local_fire_department_outlined;
      case ParticleType.pixel: return Icons.grid_view_outlined;
      case ParticleType.plasma: return Icons.waves_outlined;
      case ParticleType.ash: return Icons.grain_outlined;
      case ParticleType.ember: return Icons.auto_awesome_sharp;
      case ParticleType.spark: return Icons.bolt_outlined;
      case ParticleType.voidMatter: return Icons.blur_on;
    }
  }

  String _getDescriptionForType(ParticleType type) {
    switch (type) {
      case ParticleType.flame: return 'Infernal heat that consumes and purifies.';
      case ParticleType.pixel: return 'Synthetic void leakage from the cyber-plane.';
      case ParticleType.plasma: return 'High-frequency Abyssal energy emission.';
      case ParticleType.ash: return 'Ephemeral decay of thought into static.';
      case ParticleType.ember: return 'The glowing remains of a fading memory.';
      case ParticleType.spark: return 'Electric manifestation of sudden insight.';
      case ParticleType.voidMatter: return 'Non-existence condensed into absolute ink.';
    }
  }
}
