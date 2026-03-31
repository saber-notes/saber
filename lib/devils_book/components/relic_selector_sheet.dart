import 'package:flutter/material.dart';
import '../models/relic_element.dart';
import '../registry/devils_catalog.dart';

/// A bottom sheet presenting seals/elements grouped by category with a Hades-inspired aesthetic.
class RelicSelectorSheet extends StatefulWidget {
  const RelicSelectorSheet({Key? key}) : super(key: key);

  @override
  State<RelicSelectorSheet> createState() => _RelicSelectorSheetState();
}

class _RelicSelectorSheetState extends State<RelicSelectorSheet> {
  SealCategory? _activeFilter;

  @override
  Widget build(BuildContext context) {
    final allRelics = DevilsCatalog.relics.values.toList();
    final favorites = allRelics.where((s) => s.isFavorite).toList();

    // Apply category filter
    final filtered = _activeFilter == null
        ? allRelics
        : allRelics.where((s) => s.category == _activeFilter).toList();

    // Group by category for variety
    final Map<SealCategory, List<RelicElement>> grouped = {};
    for (final s in filtered) {
      grouped.putIfAbsent(s.category, () => []).add(s);
    }

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A0A), // Obsidian
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        border: Border.all(color: const Color(0xFFD4AF37), width: 1.5), // Ornate Gold Border
      ),
      padding: const EdgeInsets.all(24),
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'RITUAL RELICS',
                style: TextStyle(
                  color: Color(0xFFD4AF37), // Gold
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Color(0xFFD4AF37)),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Category filter chips
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _filterChip(null, 'ALL'),
                _filterChip(SealCategory.ritual, 'RITUAL'),
                _filterChip(SealCategory.ancient, 'ANCIENT'),
                _filterChip(SealCategory.voidWalker, 'VOID'),
                _filterChip(SealCategory.signature, 'MARKS'),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Favorites strip
          if (favorites.isNotEmpty) ...[
            const Text(
              'BOUND RELICS',
              style: TextStyle(fontSize: 12, color: Color(0x88D4AF37), letterSpacing: 1.5),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 64,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: favorites.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, i) => _relicTile(favorites[i], compact: true),
              ),
            ),
            const SizedBox(height: 20),
          ],

          // Grouped grid
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: grouped.entries.map((entry) {
                return _buildCategoryGroup(entry.key.name.toUpperCase(), entry.value);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filterChip(SealCategory? category, String label) {
    final isActive = _activeFilter == category;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ChoiceChip(
        label: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: isActive ? Colors.black : const Color(0xFFD4AF37),
            fontWeight: FontWeight.bold,
          ),
        ),
        selected: isActive,
        onSelected: (_) => setState(() => _activeFilter = category),
        selectedColor: const Color(0xFFD4AF37), // Gold background for active
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xFFD4AF37), width: 1),
        ),
        visualDensity: VisualDensity.compact,
      ),
    );
  }

  Widget _buildCategoryGroup(String categoryName, List<RelicElement> relics) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Container(height: 1, width: 24, color: const Color(0x44D4AF37)),
              const SizedBox(width: 8),
              Text(
                categoryName,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xBBFF2200), letterSpacing: 1.5), // Scarlet
              ),
              const SizedBox(width: 8),
              Expanded(child: Container(height: 1, color: const Color(0x22D4AF37))),
            ],
          ),
        ),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: relics.map((s) => _relicTile(s)).toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _relicTile(RelicElement relic, {bool compact = false}) {
    final size = compact ? 56.0 : 84.0;
    
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(relic),
      onLongPress: () {
        setState(() => relic.isFavorite = !relic.isFavorite);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: relic.isFavorite ? const Color(0xFFFF2200) : const Color(0x33D4AF37), // Scarlet focus or dim gold
                width: relic.isFavorite ? 2 : 1,
              ),
              boxShadow: relic.isFavorite
                  ? [BoxShadow(color: const Color(0x44FF2200), blurRadius: 8, spreadRadius: 1)]
                  : null,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Icon placeholder (relic.assetPath would be SVGPicture in a real impl)
                Icon(
                  relic.fallbackIcon ?? Icons.auto_awesome_sharp,
                  color: relic.isFavorite ? const Color(0xFFFF2200) : const Color(0xFFD4AF37),
                  size: compact ? 24 : 32,
                ),
                if (relic.isFavorite)
                  Positioned(
                    top: 4,
                    right: 4,
                    child: Icon(Icons.flash_on, size: 12, color: const Color(0xFFFF2200)),
                  ),
              ],
            ),
          ),
          if (!compact) ...[
            const SizedBox(height: 6),
            SizedBox(
              width: size,
              child: Text(
                relic.name.toUpperCase(),
                style: const TextStyle(fontSize: 9, color: Color(0xAAFFFFFF), fontWeight: FontWeight.bold, letterSpacing: 1.0),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
