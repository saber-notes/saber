import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saber/components/calendar/calendar_item_dialog.dart';
import 'package:saber/data/calendar/calendar_controller.dart';
import 'package:saber/data/calendar/calendar_data_model.dart';

enum CalendarView { month, week, day }

const _weekdayShort = <String>['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  // Simple state for the view. In a real app, move this to the controller.
  var _focusedDay = DateTime.now();
  var _selectedDay = DateTime.now();

  // View mode: month, week or day
  static const _viewIcons = [
    Icons.calendar_month,
    Icons.view_week,
    Icons.today,
  ];

  var _view = CalendarView.month;

  @override
  Widget build(BuildContext context) {
    // Ensuring we have the controller provided.
    // Ideally this provider is placed higher in the tree (main.dart),
    // but for self-containment we create it here if missing or assume parent usage.
    return ChangeNotifierProvider(
      create: (_) => CalendarController(),
      builder: (context, child) {
        final controller = context.watch<CalendarController>();
        return Scaffold(
          appBar: AppBar(title: const Text('Calendar'), centerTitle: false),
          body: Column(
            children: [
              _buildHeader(),
              Expanded(child: _buildCurrentBody(context, controller)),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _showEditor(
              context,
              controller: context.read<CalendarController>(),
            ),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  // Re-writing build to be responsive standard Column layout
  // for better integration with existing Saber structure
  Widget buildResponsive(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalendarController(),
      builder: (context, child) {
        final controller = context.watch<CalendarController>();
        final selectedEvents = controller.getItemsForDay(_selectedDay);

        return Scaffold(
          appBar: AppBar(title: const Text('Calendar'), centerTitle: false),
          body: Column(
            children: [
              _buildHeader(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: _buildMonthGrid(context, controller),
              ),
              const Divider(height: 1),
              Expanded(
                child: ColoredBox(
                  color: Theme.of(context).colorScheme.surface,
                  child: selectedEvents.isEmpty
                      ? Center(
                          child: Text(
                            'No events for ${_selectedDay.day}/${_selectedDay.month}',
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.all(16),
                          itemCount: selectedEvents.length,
                          separatorBuilder: (_, _) => const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            return _buildEventCard(
                              context,
                              controller,
                              selectedEvents[index],
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: 'calendar_fab',
            onPressed: () => _showEditor(context, controller: controller),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${_monthName(_focusedDay.month)} ${_focusedDay.year}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {
                  setState(() {
                    if (_view == CalendarView.month) {
                      _focusedDay = DateTime(
                        _focusedDay.year,
                        _focusedDay.month - 1,
                      );
                    } else if (_view == CalendarView.week) {
                      _focusedDay = _focusedDay.subtract(
                        const Duration(days: 7),
                      );
                    } else {
                      _focusedDay = _focusedDay.subtract(
                        const Duration(days: 1),
                      );
                      _selectedDay = _focusedDay;
                    }
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  setState(() {
                    if (_view == CalendarView.month) {
                      _focusedDay = DateTime(
                        _focusedDay.year,
                        _focusedDay.month + 1,
                      );
                    } else if (_view == CalendarView.week) {
                      _focusedDay = _focusedDay.add(const Duration(days: 7));
                    } else {
                      _focusedDay = _focusedDay.add(const Duration(days: 1));
                      _selectedDay = _focusedDay;
                    }
                  });
                },
              ),
              const SizedBox(width: 8),
              ToggleButtons(
                isSelected: [
                  _view == CalendarView.month,
                  _view == CalendarView.week,
                  _view == CalendarView.day,
                ],
                onPressed: (idx) {
                  setState(() {
                    _view = CalendarView.values[idx];
                    if (_view == CalendarView.day) _selectedDay = _focusedDay;
                  });
                },
                children: _viewIcons.map((i) => Icon(i)).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentBody(
    BuildContext context,
    CalendarController controller,
  ) {
    switch (_view) {
      case CalendarView.week:
        return _buildWeekView(context, controller);
      case CalendarView.day:
        return _buildDayView(context, controller);
      case CalendarView.month:
        return _buildMonthGrid(context, controller);
    }
  }

  Widget _buildMonthGrid(BuildContext context, CalendarController controller) {
    final firstDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month, 1);
    final lastDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);

    // Determine the first day to display (start of the week containing the first day of the month)
    final firstDayToDisplay = firstDayOfMonth.subtract(
      Duration(days: firstDayOfMonth.weekday - 1),
    );

    // Determine the last day to display (end of the week containing the last day of the month)
    final lastDayToDisplay = lastDayOfMonth.add(
      Duration(days: DateTime.daysPerWeek - lastDayOfMonth.weekday),
    );

    final daysInView =
        lastDayToDisplay.difference(firstDayToDisplay).inDays + 1;

    return Column(
      children: [
        // Weekday headers
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: List.generate(7, (index) {
              final weekday = (index + 1) % 7; // Monday=1, Sunday=0
              final dayName = [
                'Sun',
                'Mon',
                'Tue',
                'Wed',
                'Thu',
                'Fri',
                'Sat',
              ][weekday];
              return Expanded(
                child: Center(
                  child: Text(
                    dayName,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              );
            }),
          ),
        ),
        // Render a fixed grid (non-scrollable) that always fits available height
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final numberOfWeeks = (daysInView / 7).ceil();
              final totalHeight = constraints.maxHeight;
              final rowHeight = (numberOfWeeks > 0)
                  ? (totalHeight / numberOfWeeks)
                  : totalHeight;

              return SizedBox(
                height: totalHeight,
                child: Column(
                  children: List.generate(numberOfWeeks, (weekIdx) {
                    return SizedBox(
                      height: rowHeight,
                      child: Row(
                        children: List.generate(7, (dayIdx) {
                          final index = weekIdx * 7 + dayIdx;
                          final day = firstDayToDisplay.add(
                            Duration(days: index),
                          );
                          final isToday = DateUtils.isSameDay(
                            day,
                            DateTime.now(),
                          );
                          final isSelected = DateUtils.isSameDay(
                            day,
                            _selectedDay,
                          );
                          final isCurrentMonth = day.month == _focusedDay.month;
                          final eventsForDay = controller.getItemsForDay(day);

                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedDay = day;
                                  _focusedDay = day;
                                });
                              },
                              onDoubleTap: () {
                                setState(() {
                                  _selectedDay = day;
                                  _focusedDay = day;
                                  _view = CalendarView.day;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.all(1),
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Theme.of(
                                          context,
                                        ).colorScheme.primaryContainer
                                      : null,
                                  border: Border.all(
                                    color: isToday
                                        ? Theme.of(context).colorScheme.primary
                                        : Colors.transparent,
                                    width: isToday ? 2 : 0,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${day.day}',
                                      style: TextStyle(
                                        color: isCurrentMonth
                                            ? null
                                            : Colors.grey,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : null,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    ...eventsForDay
                                        .take(2)
                                        .map(
                                          (e) => Text(
                                            e.summary,
                                            style: const TextStyle(
                                              fontSize: 10,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                    if (eventsForDay.length > 2)
                                      Text(
                                        '+${eventsForDay.length - 2} more',
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<bool> _confirmDelete(BuildContext context, String summary) async {
    final res = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete event'),
        content: Text('Delete "$summary"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    return res ?? false;
  }

  Widget _buildWeekView(BuildContext context, CalendarController controller) {
    // Single week view centered on _focusedDay
    final weekStartDate = _focusedDay.subtract(
      Duration(days: _focusedDay.weekday - 1),
    );
    final weekEndDate = weekStartDate.add(
      const Duration(days: 6, hours: 23, minutes: 59, seconds: 59),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final rowHeight = constraints.maxHeight;
        final cellWidth = constraints.maxWidth / 7;
        const minSlotHeight = 28.0;
        const dateHeaderHeight = 28.0; // very compact header
        // explicit paddings to ensure top/bottom safety and avoid overflow
        const topPadding = 4.0;
        const bottomPadding = 24.0;
        const tileGap = 4.0;

        final availableHeightForSlots =
            (rowHeight - dateHeaderHeight - topPadding - bottomPadding).clamp(
              0.0,
              rowHeight,
            );
        final maxSlots =
            ((availableHeightForSlots) / (minSlotHeight + tileGap * 2))
                .floor()
                .clamp(1, 6);

        // Events overlapping the week
        final eventsInWeek = controller.items.where((item) {
          final itemStart = item.start;
          final itemEnd = item.end;
          return itemEnd.isAfter(
                weekStartDate.subtract(const Duration(seconds: 1)),
              ) &&
              itemStart.isBefore(weekEndDate.add(const Duration(seconds: 1)));
        }).toList();

        // simple overflow counts
        final dayOverflowCounts = List<int>.filled(7, 0);

        eventsInWeek.sort((a, b) {
          final aSingle =
              DateTime(a.start.year, a.start.month, a.start.day) ==
              DateTime(a.end.year, a.end.month, a.end.day);
          final bSingle =
              DateTime(b.start.year, b.start.month, b.start.day) ==
              DateTime(b.end.year, b.end.month, b.end.day);
          if (aSingle && bSingle) return a.start.compareTo(b.start);
          if (aSingle && !bSingle) return 1;
          if (!aSingle && bSingle) return -1;
          final aDur = a.end.difference(a.start).inMinutes;
          final bDur = b.end.difference(b.start).inMinutes;
          return bDur.compareTo(aDur);
        });

        final List<List<_PlacedEvent>> slots = List.generate(
          maxSlots,
          (_) => [],
        );
        for (final ev in eventsInWeek) {
          final startCol = _dateToWeekCol(ev.start, weekStartDate).clamp(0, 6);
          final endCol = _dateToWeekCol(ev.end, weekStartDate).clamp(0, 6);
          var placed = false;
          for (var si = 0; si < slots.length; si++) {
            var conflict = false;
            for (final placedEv in slots[si]) {
              if (!(placedEv.endCol < startCol || placedEv.startCol > endCol)) {
                conflict = true;
                break;
              }
            }
            if (!conflict) {
              slots[si].add(
                _PlacedEvent(
                  item: ev,
                  startCol: startCol,
                  endCol: endCol,
                  slot: si,
                ),
              );
              placed = true;
              break;
            }
          }
          if (!placed) {
            dayOverflowCounts[startCol] = dayOverflowCounts[startCol] + 1;
          }
        }

        final slotHeight = availableHeightForSlots / maxSlots;
        final effectiveSlotHeight = slotHeight.clamp(
          minSlotHeight,
          availableHeightForSlots,
        );
        final effectiveTileHeight = (effectiveSlotHeight - tileGap).clamp(
          6.0,
          effectiveSlotHeight - tileGap,
        );

        return SizedBox(
          child: ClipRect(
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                // Weekday header row
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  height: dateHeaderHeight,
                  child: Row(
                    children: List.generate(7, (col) {
                      final dayDate = weekStartDate.add(Duration(days: col));
                      final weekday = _weekdayShort[dayDate.weekday - 1];
                      final isToday = DateUtils.isSameDay(
                        dayDate,
                        DateTime.now(),
                      );
                      final isSelected = DateUtils.isSameDay(
                        dayDate,
                        _selectedDay,
                      );
                      return Expanded(
                        child: Container(
                          padding: EdgeInsets.zero,
                          margin: isToday
                              ? EdgeInsets.zero
                              : const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Theme.of(context).colorScheme.primaryContainer
                                : null,
                            borderRadius: BorderRadius.circular(4),
                            border: isToday
                                ? Border.all(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    width: 1,
                                  )
                                : null,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  weekday[0],
                                  style: const TextStyle(fontSize: 9),
                                ),
                                Text(
                                  '${dayDate.day}',
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                // tappable day area below header
                Positioned(
                  left: 0,
                  right: 0,
                  top: dateHeaderHeight,
                  bottom: 0,
                  child: Row(
                    children: List.generate(7, (col) {
                      final dayDate = weekStartDate.add(Duration(days: col));
                      final isToday = DateUtils.isSameDay(
                        dayDate,
                        DateTime.now(),
                      );
                      final isSelected = DateUtils.isSameDay(
                        dayDate,
                        _selectedDay,
                      );
                      return Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedDay = dayDate;
                              _focusedDay = dayDate;
                            });
                          },
                          onDoubleTap: () {
                            setState(() {
                              _selectedDay = dayDate;
                              _view = CalendarView.day;
                              _focusedDay = dayDate;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Theme.of(
                                      context,
                                    ).colorScheme.primaryContainer
                                  : null,
                              borderRadius: BorderRadius.circular(8),
                              border: isToday
                                  ? Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    )
                                  : null,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                if (dayOverflowCounts[col] > 0)
                                  Text(
                                    '+${dayOverflowCounts[col]} more',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                // positioned event tiles
                for (final slot in slots)
                  for (final placed in slot)
                    Positioned(
                      left: placed.startCol * cellWidth + 6,
                      top: math.min(
                        dateHeaderHeight +
                            topPadding +
                            placed.slot * effectiveSlotHeight,
                        rowHeight - bottomPadding - effectiveTileHeight,
                      ),
                      width:
                          (placed.endCol - placed.startCol + 1) * cellWidth -
                          12,
                      height: effectiveTileHeight,
                      child: GestureDetector(
                        onTap: () => _showEditor(
                          context,
                          controller: controller,
                          item: placed.item,
                        ),
                        onLongPress: () async {
                          final del = await _confirmDelete(
                            context,
                            placed.item.summary,
                          );
                          if (del) controller.deleteItem(placed.item.id);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: placed.item.color,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            placed.item.summary,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: _contrastTextColor(placed.item.color),
                            ),
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDayView(BuildContext context, CalendarController controller) {
    final events = controller.getItemsForDay(_selectedDay);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${_selectedDay.day}/${_selectedDay.month}/${_selectedDay.year}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => _showEditor(context, controller: controller),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: events.isEmpty
              ? Center(
                  child: Text(
                    'No events',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: events.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, idx) {
                    // reuse _buildEventCard which already supports Dismissible
                    return _buildEventCard(context, controller, events[idx]);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildEventCard(
    BuildContext context,
    CalendarController controller,
    CalendarItem item,
  ) {
    IconData typeIcon;
    switch (item.type) {
      case CalendarItemType.task:
        typeIcon = Icons.check_circle_outline;
      case CalendarItemType.deadline:
        typeIcon = Icons.flag_outlined;
      default:
        typeIcon = Icons.event;
    }

    return Dismissible(
      key: ValueKey(item.id),
      onDismissed: (_) => controller.deleteItem(item.id),
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: item.color.withAlpha(50), width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: item.type == CalendarItemType.task
              ? IconButton(
                  icon: Icon(
                    item.isCompleted
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: item.color,
                  ),
                  onPressed: () => controller.toggleTaskCompletion(item.id),
                )
              : Icon(typeIcon, color: item.color),
          title: Text(
            item.summary,
            style: TextStyle(
              decoration: item.isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: item.description != null ? Text(item.description!) : null,
          trailing: Text(
            item.isAllDay
                ? 'All Day'
                : "${item.start.hour}:${item.start.minute.toString().padLeft(2, '0')}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          onTap: () => _showEditor(context, controller: controller, item: item),
        ),
      ),
    );
  }

  void _showEditor(
    BuildContext context, {
    required CalendarController controller,
    CalendarItem? item,
  }) async {
    final result = await showDialog<CalendarItem>(
      context: context,
      builder: (context) =>
          CalendarItemDialog(item: item, selectedDate: _selectedDay),
    );

    if (result != null) {
      if (item == null) {
        controller.addItem(result);
      } else {
        controller.updateItem(result);
      }
    }
  }

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }
}

// Helper structure used for placing events in week rows
class _PlacedEvent {
  final CalendarItem item;
  final int startCol;
  final int endCol;
  final int slot;

  _PlacedEvent({
    required this.item,
    required this.startCol,
    required this.endCol,
    required this.slot,
  });
}

// Convert a date -> column index within a week, relative to weekStartDate
int _dateToWeekCol(DateTime date, DateTime weekStartDate) {
  final start = DateTime(
    weekStartDate.year,
    weekStartDate.month,
    weekStartDate.day,
  );
  final d = DateTime(date.year, date.month, date.day);
  return d.difference(start).inDays;
}

Color _contrastTextColor(Color bg) {
  return bg.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}
