import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:saber/data/calendar/calendar_data_model.dart';
import 'package:saber/data/file_manager/file_manager.dart';

class CalendarController extends ChangeNotifier {
  final List<CalendarItem> _items = [];
  static const _calendarFileName = 'calendar.json';

  List<CalendarItem> get items => List.unmodifiable(_items);

  Future<void> loadItems() async {
    try {
      final file = FileManager.getFile('/$_calendarFileName');
      if (!file.existsSync()) {
        _items.clear();
        notifyListeners();
        return;
      }
      final contents = await file.readAsString();
      final jsonData = jsonDecode(contents) as List<dynamic>;
      _items.clear();
      for (final itemJson in jsonData) {
        _items.add(_calendarItemFromJson(itemJson as Map<String, dynamic>));
      }
      notifyListeners();
    } catch (e) {
      print('Error loading calendar items: $e');
    }
  }

  Future<void> _saveItems() async {
    try {
      final jsonData = _items.map((item) => _calendarItemToJson(item)).toList();
      await FileManager.writeFile(
        '/$_calendarFileName',
        utf8.encode(jsonEncode(jsonData)),
        alsoUpload: true,
      );
    } catch (e) {
      print('Error saving calendar items: $e');
    }
  }

  static Map<String, dynamic> _calendarItemToJson(CalendarItem item) {
    return {
      'id': item.id,
      'summary': item.summary,
      'description': item.description,
      'start': item.start.toIso8601String(),
      'end': item.end.toIso8601String(),
      'isAllDay': item.isAllDay,
      'color': item.color.toARGB32(),
      'type': item.type.name,
      'isCompleted': item.isCompleted,
    };
  }

  static CalendarItem _calendarItemFromJson(Map<String, dynamic> json) {
    return CalendarItem(
      id: json['id'] as String,
      summary: json['summary'] as String,
      description: json['description'] as String?,
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      isAllDay: json['isAllDay'] as bool? ?? false,
      color: Color(json['color'] as int? ?? 0xFF2196F3),
      type: CalendarItemType.values.byName(json['type'] as String? ?? 'event'),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  // Get items sorted by time for a specific day
  List<CalendarItem> getItemsForDay(DateTime day) {
    final dayItems = _items.where((item) => item.occursOn(day)).toList();
    dayItems.sort((a, b) => a.start.compareTo(b.start));
    return dayItems;
  }

  void addItem(CalendarItem item) {
    _items.add(item);
    notifyListeners();
    _saveItems();
  }

  void updateItem(CalendarItem item) {
    final index = _items.indexWhere((e) => e.id == item.id);
    if (index != -1) {
      _items[index] = item;
      notifyListeners();
      _saveItems();
    }
  }

  void deleteItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
    _saveItems();
  }

  void toggleTaskCompletion(String id) {
    final index = _items.indexWhere((e) => e.id == id);
    if (index != -1 && _items[index].type == CalendarItemType.task) {
      _items[index] = _items[index].copyWith(
        isCompleted: !_items[index].isCompleted,
      );
      notifyListeners();
      _saveItems();
    }
  }
}
