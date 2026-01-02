import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/components/theming/adaptive_text_field.dart';
import 'package:saber/components/toolbar/color_option.dart';
import 'package:saber/data/calendar/calendar_data_model.dart';
import 'package:saber/i18n/strings.g.dart';

class CalendarItemDialog extends StatefulWidget {
  final CalendarItem? item;
  final DateTime selectedDate;

  const CalendarItemDialog({super.key, this.item, required this.selectedDate});

  @override
  State<CalendarItemDialog> createState() => _CalendarItemDialogState();
}

class _CalendarItemDialogState extends State<CalendarItemDialog> {
  late TextEditingController _summaryController;
  late TextEditingController _descriptionController;
  late DateTime _startDate;
  late DateTime _endDate;
  late bool _isAllDay;
  late Color _selectedColor;
  late CalendarItemType _selectedType;

  @override
  void initState() {
    super.initState();
    _summaryController = TextEditingController(
      text: widget.item?.summary ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.item?.description ?? '',
    );

    // Default start time to now, but on the selected date
    final now = DateTime.now();
    _startDate =
        widget.item?.start ??
        DateTime(
          widget.selectedDate.year,
          widget.selectedDate.month,
          widget.selectedDate.day,
          now.hour,
          now.minute,
        );

    _endDate = widget.item?.end ?? _startDate.add(const Duration(hours: 1));
    _isAllDay = widget.item?.isAllDay ?? false;
    _selectedColor = widget.item?.color ?? Colors.blue;
    _selectedType = widget.item?.type ?? CalendarItemType.event;
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveAlertDialog(
      title: Text(widget.item == null ? 'New Item' : 'Edit Item'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdaptiveTextField(
              controller: _summaryController,
              placeholder: 'Title',
              focusOrder: const NumericFocusOrder(0),
            ),
            const SizedBox(height: 16),

            // Type Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: CalendarItemType.values.map((type) {
                final isSelected = _selectedType == type;
                IconData icon;
                String label;
                switch (type) {
                  case CalendarItemType.event:
                    icon = Icons.event;
                    label = 'Event';
                  case CalendarItemType.task:
                    icon = Icons.check_circle_outline;
                    label = 'Task';
                  case CalendarItemType.deadline:
                    icon = Icons.flag_outlined;
                    label = 'Deadline';
                }

                return InkWell(
                  onTap: () => setState(() => _selectedType = type),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey.withAlpha(50),
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          icon,
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          label,
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Date Pickers
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.access_time),
              title: Text(_isAllDay ? 'All day' : 'Time'),
              trailing: Switch(
                value: _isAllDay,
                onChanged: (v) => setState(() => _isAllDay = v),
              ),
            ),

            _buildDateTimeRow(
              'Start',
              _startDate,
              (val) => setState(() => _startDate = val),
            ),
            if (_selectedType != CalendarItemType.deadline)
              _buildDateTimeRow(
                'End',
                _endDate,
                (val) => setState(() => _endDate = val),
              ),

            const SizedBox(height: 16),
            AdaptiveTextField(
              controller: _descriptionController,
              placeholder: 'Description',
              focusOrder: const NumericFocusOrder(2),
            ),
            const SizedBox(height: 16),

            // Simple Color Picker
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    [
                          Colors.blue,
                          Colors.red,
                          Colors.green,
                          Colors.orange,
                          Colors.purple,
                          Colors.teal,
                        ]
                        .map(
                          (color) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => _selectedColor = color),
                              child: ColorOption(
                                selected:
                                    _selectedColor.toARGB32() ==
                                    color.toARGB32(),
                                isSelected:
                                    _selectedColor.toARGB32() ==
                                    color.toARGB32(),
                                tooltip: '',
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: color,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(t.common.cancel),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            if (_summaryController.text.isEmpty) return;

            final newItem = CalendarItem(
              id: widget.item?.id ?? DateTime.now().toIso8601String(),
              summary: _summaryController.text,
              description: _descriptionController.text,
              start: _startDate,
              end: _selectedType == CalendarItemType.deadline
                  ? _startDate
                  : _endDate,
              isAllDay: _isAllDay,
              color: _selectedColor,
              type: _selectedType,
              isCompleted: widget.item?.isCompleted ?? false,
            );
            Navigator.of(context).pop(newItem);
          },
          child: Text(MaterialLocalizations.of(context).okButtonLabel),
        ),
      ],
    );
  }

  Widget _buildDateTimeRow(
    String label,
    DateTime dt,
    Function(DateTime) onChanged,
  ) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: dt,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (date != null) {
                onChanged(
                  DateTime(date.year, date.month, date.day, dt.hour, dt.minute),
                );
              }
            },
            child: Text('${dt.year}-${dt.month}-${dt.day}'),
          ),
        ),
        if (!_isAllDay)
          Expanded(
            child: TextButton(
              onPressed: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(dt),
                );
                if (time != null) {
                  onChanged(
                    DateTime(dt.year, dt.month, dt.day, time.hour, time.minute),
                  );
                }
              },
              child: Text(
                '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}',
              ),
            ),
          ),
      ],
    );
  }
}
