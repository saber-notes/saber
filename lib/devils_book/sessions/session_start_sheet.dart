import 'package:flutter/material.dart';
import 'session_models.dart';

/// A bottom sheet for choosing and launching a writing session.
class SessionStartSheet extends StatefulWidget {
  final ValueChanged<SessionConfig> onStart;

  const SessionStartSheet({Key? key, required this.onStart}) : super(key: key);

  @override
  State<SessionStartSheet> createState() => _SessionStartSheetState();
}

class _SessionStartSheetState extends State<SessionStartSheet> {
  SessionType _selected = SessionType.focus;
  int? _goalMinutes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(24),
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Begin Session',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'Choose your intention.',
            style: TextStyle(fontSize: 13, color: Colors.grey[500]),
          ),
          const SizedBox(height: 20),

          // Session type cards
          Expanded(
            child: ListView(
              children: SessionType.values.map((type) {
                final isSelected = type == _selected;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () => setState(() => _selected = type),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: isSelected
                            ? type.accentColor.withOpacity(0.15)
                            : Colors.transparent,
                        border: Border.all(
                          color: isSelected ? type.accentColor : Colors.grey.withOpacity(0.2),
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(type.icon, color: type.accentColor, size: 28),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  type.label,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  type.description,
                                  style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                                ),
                              ],
                            ),
                          ),
                          if (isSelected)
                            Icon(Icons.check_circle, color: type.accentColor, size: 22),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 12),

          // Duration chips
          Row(
            children: [
              Text('Goal:', style: TextStyle(fontSize: 13, color: Colors.grey[500])),
              const SizedBox(width: 8),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _durationChip(null, 'Open'),
                      _durationChip(15, '15m'),
                      _durationChip(30, '30m'),
                      _durationChip(60, '1h'),
                      _durationChip(120, '2h'),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Start button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _selected.accentColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                widget.onStart(SessionConfig(
                  type: _selected,
                  goalMinutes: _goalMinutes,
                ));
                Navigator.of(context).pop();
              },
              child: Text(
                'Begin ${_selected.label}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _durationChip(int? minutes, String label) {
    final isActive = _goalMinutes == minutes;
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: ChoiceChip(
        label: Text(label, style: const TextStyle(fontSize: 11)),
        selected: isActive,
        onSelected: (_) => setState(() => _goalMinutes = minutes),
        visualDensity: VisualDensity.compact,
        selectedColor: _selected.accentColor.withOpacity(0.3),
      ),
    );
  }
}
