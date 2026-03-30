import 'package:flutter/foundation.dart';
import 'study_plugin.dart';

/// Central registry managing all registered AI/Study plugins.
class StudyPluginManager extends ChangeNotifier {
  static final StudyPluginManager _instance = StudyPluginManager._internal();
  factory StudyPluginManager() => _instance;
  StudyPluginManager._internal();

  final Map<String, StudyPlugin> _plugins = {};

  /// All registered and initialized plugins.
  List<StudyPlugin> get activePlugins => List.unmodifiable(_plugins.values);

  /// Registers a plugin. It remains inactive until explicitly enabled by the user.
  void registerPlugin(StudyPlugin plugin) {
    if (_plugins.containsKey(plugin.id)) return;
    _plugins[plugin.id] = plugin;
    notifyListeners();
  }

  void unregisterPlugin(String id) {
    _plugins.remove(id);
    notifyListeners();
  }

  /// Checks if the user has explicitly granted the required privacy access level.
  bool hasUserGrantedAccess(StudyDataAccessLevel level) {
    // STUB: In production, this checks user preferences based on the enum.
    // E.g., "Allow off-device full notebook scanning?"
    return true; 
  }

  /// Triggers a plugin execution safely.
  Future<void> triggerPlugin(
    String id, 
    StudyContext context, 
    dynamic uiContext, // BuildContext
  ) async {
    final plugin = _plugins[id];
    if (plugin == null) throw Exception('Plugin $id not found.');

    if (!hasUserGrantedAccess(plugin.requiredAccess)) {
      throw Exception('User has not granted required data access: ${plugin.requiredAccess.name}');
    }

    // A real implementation might wrap this in a loading overlay or progress tracker.
    await plugin.execute(context, uiContext);
  }
}
