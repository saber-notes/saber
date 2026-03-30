import 'package:flutter/material.dart';
import 'export_models.dart';

/// A bottom sheet for choosing export formats and stylistic variants.
class ExportOptionsSheet extends StatefulWidget {
  final ValueChanged<ExportConfig> onExport;

  const ExportOptionsSheet({Key? key, required this.onExport}) : super(key: key);

  @override
  State<ExportOptionsSheet> createState() => _ExportOptionsSheetState();
}

class _ExportOptionsSheetState extends State<ExportOptionsSheet> {
  ExportVariant _selectedVariant = ExportVariant.clean;
  ExportFormat _selectedFormat = ExportFormat.pdf;
  bool _includeBackground = true;
  bool _includeGrid = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(24),
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Export Tome',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Variants List
          Expanded(
            child: ListView(
              children: ExportVariant.values.map((variant) {
                final isSelected = variant == _selectedVariant;
                final isAvailable = variant.isAvailable;
                
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () {
                      if (isAvailable) setState(() => _selectedVariant = variant);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.amber.withOpacity(0.1) : Colors.transparent,
                        border: Border.all(
                          color: isSelected ? Colors.amber : Colors.grey.withOpacity(0.2),
                          width: isSelected ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Icon(variant.icon, color: isAvailable ? (isSelected ? Colors.amber : Colors.grey) : Colors.grey.withOpacity(0.3), size: 28),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      variant.label,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                        color: isAvailable ? null : Colors.grey.withOpacity(0.4),
                                      ),
                                    ),
                                    if (!isAvailable) ...[
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                                        child: const Text('COMING SOON', style: TextStyle(fontSize: 9, color: Colors.grey)),
                                      ),
                                    ],
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  variant.description,
                                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                                ),
                              ],
                            ),
                          ),
                          if (isSelected) const Icon(Icons.check_circle, color: Colors.amber),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),

          // Format Toggles
          Row(
            children: [
              Text('Format:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[400])),
              const SizedBox(width: 12),
              ChoiceChip(
                label: const Text('PDF'),
                selected: _selectedFormat == ExportFormat.pdf,
                onSelected: (_) => setState(() => _selectedFormat = ExportFormat.pdf),
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: const Text('PNG'),
                selected: _selectedFormat == ExportFormat.png,
                onSelected: (_) => setState(() => _selectedFormat = ExportFormat.png),
              ),
              const Spacer(),
              // Toggles
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Text('Page Background', style: TextStyle(fontSize: 12)),
                      Switch(
                        value: _includeBackground,
                        onChanged: (val) => setState(() => _includeBackground = val),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Export Button
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black87,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: () {
                widget.onExport(ExportConfig(
                  format: _selectedFormat,
                  variant: _selectedVariant,
                  includeBackground: _includeBackground,
                  includeGrid: _includeGrid,
                ));
                Navigator.of(context).pop();
              },
              child: const Text(
                'Generate Export',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
