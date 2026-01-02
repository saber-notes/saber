import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saber/components/calendar/calendar_item_dialog.dart';
import 'package:saber/data/calendar/calendar_controller.dart';
import 'package:saber/data/calendar/calendar_data_model.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  // Simple state for the view. In a real app, move this to the controller.
  var _focusedDay = DateTime.now();
  var _selectedDay = DateTime.now();

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
          body: Row(
            children: [
              // Main Calendar Area
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _buildHeader(),
                    Expanded(child: _buildMonthGrid(context, controller)),
                  ],
                ),
              ),

              // Side Panel for Selected Day (Responsive: only on wider screens?)
              // For simplicity, we stick to a column layout on mobile, but here
              // we will use a split view logic or bottom sheet on mobile.
              // Let's keep it simple: A bottom area for events on mobile/portrait
              // and side on landscape? Let's stick to a Column layout for generic use.
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
              _buildMonthGrid(context, controller),
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                    _focusedDay = DateTime(
                      _focusedDay.year,
                      _focusedDay.month - 1,
                    );
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  setState(() {
                    _focusedDay = DateTime(
                      _focusedDay.year,
                      _focusedDay.month + 1,
                    );
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMonthGrid(BuildContext context, CalendarController controller) {
    final daysInMonth = DateUtils.getDaysInMonth(
      _focusedDay.year,
      _focusedDay.month,
    );
    final firstDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month, 1);
    final weekdayOffset =
        firstDayOfMonth.weekday - 1; // Mon=1, Sun=7 -> 0-6 index

    final totalCells = daysInMonth + weekdayOffset;
    final numberOfWeeks = (totalCells / 7).ceil();

    return LayoutBuilder(
      builder: (context, constraints) {
        final rowHeight = constraints.maxHeight / numberOfWeeks;
        final cellWidth = constraints.maxWidth / 7;
        // Minimum slot height (reduced per request)
        const minSlotHeight = 24.0; // comfortable minimum height per event
        const dateHeaderHeight =
            28.0; // reserved space at top of each week row for date indicator
        final availableHeightForSlots = (rowHeight - dateHeaderHeight - 8)
            .clamp(0.0, rowHeight);
        final maxSlots = (availableHeightForSlots / minSlotHeight)
            .floor()
            .clamp(1, 6);

        return Column(
          children: List.generate(numberOfWeeks, (weekIndex) {
            final weekStartCellIndex = weekIndex * 7;
            final weekStartDayNumber = weekStartCellIndex - weekdayOffset + 1;

            final weekStartDate = DateTime(
              _focusedDay.year,
              _focusedDay.month,
              weekStartDayNumber,
            );
            final weekEndDate = DateTime(
              _focusedDay.year,
              _focusedDay.month,
              weekStartDayNumber + 6,
              23,
              59,
              59,
            );

            // Events that overlap with this week (even if they start before or end after)
            final eventsInWeek = controller.items.where((item) {
              final itemStart = item.start;
              final itemEnd = item.end;
              return itemEnd.isAfter(
                    weekStartDate.subtract(const Duration(seconds: 1)),
                  ) &&
                  itemStart.isBefore(
                    weekEndDate.add(const Duration(seconds: 1)),
                  );
            }).toList();

            // Per-day overflow counters for this week (we will show +N inside the day's tile)
            final dayOverflowCounts = List<int>.filled(7, 0);

            // Sort: single-day events by start time (earlier first); multi-day events by duration descending (longer first)
            eventsInWeek.sort((a, b) {
              final aSingle =
                  DateTime(a.start.year, a.start.month, a.start.day) ==
                  DateTime(a.end.year, a.end.month, a.end.day);
              final bSingle =
                  DateTime(b.start.year, b.start.month, b.start.day) ==
                  DateTime(b.end.year, b.end.month, b.end.day);

              if (aSingle && bSingle) {
                return a.start.compareTo(b.start);
              }
              if (aSingle && !bSingle)
                return 1; // place multi-day before single-day
              if (!aSingle && bSingle) return -1;

              final aDur = a.end.difference(a.start).inMinutes;
              final bDur = b.end.difference(b.start).inMinutes;
              return bDur.compareTo(aDur);
            });

            // Place events into non-overlapping vertical slots
            final List<List<_PlacedEvent>> slots = List.generate(
              maxSlots,
              (_) => [],
            );

            for (final ev in eventsInWeek) {
              final startCol = _dateToWeekCol(ev.start, weekStartDate);
              final endCol = _dateToWeekCol(ev.end, weekStartDate);
              final resolvedStart = startCol.clamp(0, 6);
              final resolvedEnd = endCol.clamp(0, 6);

              var placed = false;
              for (var si = 0; si < slots.length; si++) {
                final slot = slots[si];
                // check for overlaps with existing events in slot
                var conflict = false;
                for (final placedEv in slot) {
                  if (!(placedEv.endCol < resolvedStart ||
                      placedEv.startCol > resolvedEnd)) {
                    conflict = true;
                    break;
                  }
                }
                if (!conflict) {
                  slot.add(
                    _PlacedEvent(
                      item: ev,
                      startCol: resolvedStart,
                      endCol: resolvedEnd,
                      slot: si,
                    ),
                  );
                  placed = true;
                  break;
                }
              }
              if (!placed) {
                final idx = resolvedStart.clamp(0, 6);
                dayOverflowCounts[idx] = dayOverflowCounts[idx] + 1;
              }
            }

            final slotHeight =
                availableHeightForSlots /
                maxSlots; // distribute remaining height to slots
            final effectiveSlotHeight = slotHeight.clamp(
              minSlotHeight,
              availableHeightForSlots,
            );
            // Compute tile height so it fits within its slot (leave small gap between stacked slots)
            final effectiveTileHeight = (effectiveSlotHeight - 6) < 8.0
                ? 8.0
                : (effectiveSlotHeight - 6);

            return SizedBox(
              height: rowHeight,
              child: GestureDetector(
                onTapDown: (_) {},
                child: Stack(
                  children: [
                    // day cells as row of 7
                    Row(
                      children: List.generate(7, (col) {
                        final dayNumber = weekStartDayNumber + col;
                        final validDay =
                            dayNumber >= 1 && dayNumber <= daysInMonth;
                        final currentDay = DateTime(
                          _focusedDay.year,
                          _focusedDay.month,
                          dayNumber,
                        );
                        final isSelected =
                            validDay &&
                            DateUtils.isSameDay(currentDay, _selectedDay);
                        final isToday =
                            validDay &&
                            DateUtils.isSameDay(currentDay, DateTime.now());

                        // dots inside each day (up to 3) for quick glance
                        /*final dayEvents = validDay
                            ? controller.getItemsForDay(currentDay)
                            : <CalendarItem>[];*/

                        return Expanded(
                          child: InkWell(
                            onTap: validDay
                                ? () {
                                    setState(() {
                                      _selectedDay = currentDay;
                                    });
                                  }
                                : null,
                            child: Container(
                              margin: const EdgeInsets.all(2),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 4,
                              ),
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
                                  Text(
                                    validDay ? '$dayNumber' : '',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: isSelected || isToday
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: isSelected
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.onPrimaryContainer
                                          : Theme.of(
                                              context,
                                            ).colorScheme.onSurface,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  if (validDay && dayOverflowCounts[col] > 0)
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.surface.withAlpha(90),
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        child: Text(
                                          '+${dayOverflowCounts[col]} more',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSurfaceVariant,
                                          ),
                                        ),
                                      ),
                                    ),
                                  const SizedBox(height: 2),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),

                    // event tiles positioned over the week
                    for (final slot in slots)
                      for (final placed in slot)
                        Positioned(
                          left: placed.startCol * cellWidth + 6,
                          top:
                              dateHeaderHeight +
                              6 +
                              placed.slot * effectiveSlotHeight,
                          width:
                              (placed.endCol - placed.startCol + 1) *
                                  cellWidth -
                              12,
                          height: effectiveTileHeight,
                          child: GestureDetector(
                            onTap: () => _showEditor(
                              context,
                              controller: controller,
                              item: placed.item,
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: placed.item.color,
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(
                                    placed.startCol == 0 ||
                                            placed.item.start.isBefore(
                                              weekStartDate,
                                            )
                                        ? 4
                                        : 8,
                                  ),
                                  right: Radius.circular(
                                    placed.endCol == 6 ||
                                            placed.item.end.isAfter(weekEndDate)
                                        ? 4
                                        : 8,
                                  ),
                                ),
                              ),
                              child: Text(
                                placed.item.summary,
                                maxLines: 3,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
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
          }),
        );
      },
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
