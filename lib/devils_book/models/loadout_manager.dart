import 'package:flutter/foundation.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/pen.dart';
import '../registry/devils_catalog.dart';
import 'loadout.dart';

class LoadoutManager extends ChangeNotifier {
  late Loadout _currentLoadout;
  bool _isSessionOverride = false;

  LoadoutManager() {
    _loadFromPrefs();
  }

  Loadout get currentLoadout => _currentLoadout;
  bool get isSessionOverride => _isSessionOverride;

  void _loadFromPrefs() {
    final id = stows.activeLoadoutId.value;
    _currentLoadout = DevilsCatalog.loadouts[id] ?? DevilsCatalog.defaultLoadout;
    _isSessionOverride = false;
  }

  /// Sets the loadout for the current session.
  /// If [persist] is true, it also updates the global default in [stows].
  void setLoadout(Loadout loadout, {bool persist = true}) {
    if (_currentLoadout.id != loadout.id) {
      _currentLoadout = loadout;
      if (persist) {
        stows.activeLoadoutId.value = loadout.id;
        _isSessionOverride = false;
      } else {
        _isSessionOverride = true;
      }
      notifyListeners();
    }
  }

  /// Applies the current loadout's ink and size directly to the provided [pen].
  void applyToPen(Pen pen) {
    pen.color = currentLoadout.ink.baseColor;
    pen.options = pen.options.copyWith(size: currentLoadout.ink.defaultThickness);
  }
}
