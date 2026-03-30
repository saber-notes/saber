import 'package:flutter/material.dart';
import '../models/relic_element.dart';
import '../packs/pack_registry.dart';

/// A bottom sheet presenting seals/elements grouped by pack with a favorites strip.
class RelicSelectorSheet extends StatefulWidget {
  const RelicSelectorSheet({Key? key}) : super(key: key);

  @override
  State<RelicSelectorSheet> createState() => _RelicSelectorSheetState();
}

class _RelicSelectorSheetState extends State<RelicSelectorSheet> {
  SealCategory? _activeFilter;

  @override
  Widget build(BuildContext context) {
    final registry = PackRegistry();
    final allSeals = registry.seals.values.toList();

    final favorites = allSeals.where((s) => s.isFavorite).toList();

    // Apply category filter
    final filtered = _activeFilter == null
        ? allSeals
        : allSeals.where((s) => s.category == _activeFilter).toList();

    // Group by pack
    final Map<String, List<RelicElement>> grouped = {};
    for (final s in filtered) {
      final key = s.packId ?? 'Ungrouped';
      grouped.putIfAbsent(key, () => []).add(s);
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
      height: MediaQuery.sizeOf(context).height * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Seals & Elements',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // Category filter chips
          SizedBox(
            height: 34,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _filterChip(null, 'All'),
                _filterChip(SealCategory.seal, 'Seals'),
                _filterChip(SealCategory.signature, 'Signatures'),
                _filterChip(SealCategory.stamp, 'Stamps'),
                _filterChip(SealCategory.marker, 'Markers'),
                _filterChip(SealCategory.sigil, 'Sigils'),
                _filterChip(SealCategory.symbol, 'Symbols'),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Favorites strip
          if (favorites.isNotEmpty) ...[
            Text('Favorites', style: TextStyle(fontSize: 12, color: Colors.grey[500], letterSpacing: 1.2)),
            const SizedBox(height: 6),
            SizedBox(
              height: 60,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: favorites.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (_, i) => _sealTile(favorites[i], compact: true),
              ),
            ),
            const SizedBox(height: 12),
          ],

          // Pack-grouped grid
          Expanded(
            child: ListView(
              children: grouped.entries.map((entry) {
                final packLabel = packNames[entry.key] ?? entry.key;
                return _buildPackGroup(packLabel, entry.value);
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
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label, style: const TextStyle(fontSize: 12)),
        selected: isActive,
        onSelected: (_) => setState(() => _activeFilter = category),
        visualDensity: VisualDensity.compact,
      ),
    );
  }

  Widget _buildPackGroup(String packName, List<RelicElement> seals) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            packName,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[500], letterSpacing: 1.2),
          ),
        ),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: seals.map((s) => _sealTile(s)).toList(),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _sealTile(RelicElement seal, {bool compact = false}) {
    final size = compact ? 52.0 : 76.0;
    final iconSize = compact ? 22.0 : 30.0;

    return GestureDetector(
      onTap: () => Navigator.of(context).pop(seal),
      onLongPress: () {
        setState(() => seal.isFavorite = !seal.isFavorite);
      },
      child: Tooltip(
        message: '${seal.name}${seal.description != null ? '\n${seal.description}' : ''}',
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: seal.isFavorite ? Colors.amber.withOpacity(0.6) : Colors.white12,
              width: seal.isFavorite ? 2 : 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(seal.fallbackIcon, size: iconSize),
              if (!compact) ...[
                const SizedBox(height: 4),
                Text(
                  seal.name,
                  style: const TextStyle(fontSize: 8),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
