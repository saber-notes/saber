import 'package:flutter/material.dart';
import '../models/loadout.dart';
import '../registry/devils_catalog.dart';

class LoadoutSelectorSheet extends StatelessWidget {
  final Loadout currentLoadout;
  final ValueChanged<Loadout> onSelect;

  const LoadoutSelectorSheet({
    Key? key, 
    required this.currentLoadout, 
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadouts = DevilsCatalog.loadouts.values.toList();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(24),
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Writing Instruments',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: loadouts.length,
              itemBuilder: (context, index) {
                final loadout = loadouts[index];
                final isSelected = loadout.id == currentLoadout.id;
                
                return ListTile(
                  leading: Icon(
                    Icons.brush,
                    color: isSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).iconTheme.color,
                  ),
                  title: Text(loadout.name, style: const TextStyle(fontSize: 18)),
                  subtitle: Text('${loadout.theme.name} • ${loadout.ink.name}'),
                  trailing: isSelected ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary) : null,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  selected: isSelected,
                  onTap: () {
                    onSelect(loadout);
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
