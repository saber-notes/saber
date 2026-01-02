import 'dart:ui';

import 'package:flutter/material.dart';

enum CalendarItemType { event, task, deadline }

class CalendarItem {
  final String id;
  String summary;
  String? description;
  DateTime start;
  DateTime end;
  bool isAllDay;
  Color color;
  CalendarItemType type;
  bool isCompleted; // Specifically for Tasks

  CalendarItem({
    required this.id,
    required this.summary,
    this.description,
    required this.start,
    required this.end,
    this.isAllDay = false,
    this.color = const Color(0xFF2196F3), // Default Blue
    this.type = CalendarItemType.event,
    this.isCompleted = false,
  });

  // Helper to check if an item spans across a specific day
  bool occursOn(DateTime day) {
    final startDay = DateTime(start.year, start.month, start.day);
    final endDay = DateTime(end.year, end.month, end.day);
    final checkDay = DateTime(day.year, day.month, day.day);

    if (isAllDay) {
      return (checkDay.isAtSameMomentAs(startDay) ||
              checkDay.isAfter(startDay)) &&
          (checkDay.isAtSameMomentAs(endDay) || checkDay.isBefore(endDay));
    }

    // For specific times, we might check overlaps, but for simple calendar
    // dot rendering, day equality is usually sufficient.
    return startDay.isAtSameMomentAs(checkDay) ||
        (checkDay.isAfter(startDay) &&
            checkDay.isBefore(endDay.add(const Duration(days: 1))));
  }

  // Google Calendar Sync Placeholder Methods
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'summary': summary,
      'description': description,
      'start': isAllDay
          ? {'date': start.toIso8601String().split('T')[0]}
          : {'dateTime': start.toIso8601String()},
      'end': isAllDay
          ? {'date': end.toIso8601String().split('T')[0]}
          : {'dateTime': end.toIso8601String()},
      'colorId': color
          .toARGB32()
          .toString(), // Needs mapping to GCal color IDs later
      'extendedProperties': {
        'private': {
          'saberType': type.name,
          'isCompleted': isCompleted.toString(),
        },
      },
    };
  }

  CalendarItem copyWith({
    String? summary,
    String? description,
    DateTime? start,
    DateTime? end,
    bool? isAllDay,
    Color? color,
    CalendarItemType? type,
    bool? isCompleted,
  }) {
    return CalendarItem(
      id: id,
      summary: summary ?? this.summary,
      description: description ?? this.description,
      start: start ?? this.start,
      end: end ?? this.end,
      isAllDay: isAllDay ?? this.isAllDay,
      color: color ?? this.color,
      type: type ?? this.type,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
