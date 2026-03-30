import 'package:flutter/material.dart';
import '../models/notebook_template.dart';
import '../packs/builtin/notebook_packs.dart';

/// A bottom sheet presenting notebook templates grouped by pack family.
class NotebookTemplateSelectorSheet extends StatelessWidget {
  final ValueChanged<NotebookTemplate> onSelect;

  const NotebookTemplateSelectorSheet({Key? key, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Gather all built-in packs
    final groups = <String, List<NotebookTemplate>>{
      'Professional': ProfessionalNotebookPack.templates,
      'Heritage': HeritageNotebookPack.templates,
      'Infernal': InfernalNotebookPack.templates,
      'Cyber': CyberNotebookPack.templates,
    };

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
            'Notebook Templates',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: groups.entries.map((entry) {
                return _buildPackGroup(context, entry.key, entry.value);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPackGroup(BuildContext context, String packName, List<NotebookTemplate> templates) {
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
        SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: templates.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final tmpl = templates[index];
              return GestureDetector(
                onTap: () {
                  onSelect(tmpl);
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: tmpl.cover.accentColor.withOpacity(0.4)),
                  ),
                  child: Column(
                    children: [
                      // Cover preview
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: tmpl.cover.primaryColor,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(11)),
                        ),
                        child: Center(
                          child: Text(
                            tmpl.name.substring(0, 1),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: tmpl.cover.accentColor,
                            ),
                          ),
                        ),
                      ),
                      // Page preview
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: tmpl.defaultPage.backgroundColor,
                          ),
                          padding: const EdgeInsets.all(6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Miniature line preview
                              ...List.generate(3, (_) => Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: Container(
                                  height: 1,
                                  color: tmpl.defaultPage.lineColor,
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                      // Label
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                        decoration: BoxDecoration(
                          color: tmpl.cover.primaryColor.withOpacity(0.8),
                          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(11)),
                        ),
                        child: Text(
                          tmpl.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: tmpl.cover.accentColor),
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
