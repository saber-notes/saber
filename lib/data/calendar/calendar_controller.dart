import 'package:flutter/material.dart';
import 'package:saber/data/calendar/calendar_data_model.dart';

class CalendarController extends ChangeNotifier {
  final List<CalendarItem> _items = [];

  List<CalendarItem> get items => List.unmodifiable(_items);

  // Get items sorted by time for a specific day
  List<CalendarItem> getItemsForDay(DateTime day) {
    final dayItems = _items.where((item) => item.occursOn(day)).toList();
    dayItems.sort((a, b) => a.start.compareTo(b.start));
    return dayItems;
  }

  void addItem(CalendarItem item) {
    _items.add(item);
    notifyListeners();
    // TODO: Save to disk/Nextcloud here
  }

  void updateItem(CalendarItem item) {
    final index = _items.indexWhere((e) => e.id == item.id);
    if (index != -1) {
      _items[index] = item;
      notifyListeners();
      // TODO: Save to disk/Nextcloud here
    }
  }

  void deleteItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
    // TODO: Save to disk/Nextcloud here
  }

  void toggleTaskCompletion(String id) {
    final index = _items.indexWhere((e) => e.id == id);
    if (index != -1 && _items[index].type == CalendarItemType.task) {
      _items[index] = _items[index].copyWith(
        isCompleted: !_items[index].isCompleted,
      );
      notifyListeners();
    }
  }
}
