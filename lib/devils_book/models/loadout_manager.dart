import 'package:flutter/foundation.dart';
import 'package:saber/data/prefs.dart';
import '../registry/devils_catalog.dart';
import 'loadout.dart';

class LoadoutManager extends ChangeNotifier {
  late Loadout _currentLoadout;

  LoadoutManager() {
    _loadFromPrefs();
  }

  Loadout get currentLoadout => _currentLoadout;

  void _loadFromPrefs() {
    final id = stows.activeLoadoutId.value;
    _currentLoadout = DevilsCatalog.loadouts[id] ?? DevilsCatalog.defaultLoadout;
  }

  void setLoadout(Loadout loadout) {
    if (_currentLoadout.id != loadout.id) {
      _currentLoadout = loadout;
      stows.activeLoadoutId.value = loadout.id;
      notifyListeners();
    }
  }
}
