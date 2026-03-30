import 'package:flutter/foundation.dart';
import 'session_models.dart';

/// Manages the session lifecycle: start, track, end, summarize.
class SessionController extends ChangeNotifier {
  static final SessionController _instance = SessionController._internal();
  factory SessionController() => _instance;
  SessionController._internal();

  ActiveSession? _current;
  final List<SessionSummary> _history = [];

  ActiveSession? get current => _current;
  bool get isActive => _current != null;
  List<SessionSummary> get history => List.unmodifiable(_history);

  /// Start a new session. Ends any existing one first.
  SessionSummary? startSession(SessionConfig config) {
    SessionSummary? previousSummary;
    if (_current != null) {
      previousSummary = endSession();
    }
    _current = ActiveSession(config: config);
    notifyListeners();
    return previousSummary;
  }

  /// Record a stroke event in the active session.
  void recordStroke() {
    _current?.recordStroke();
  }

  /// Record a page visit in the active session.
  void recordPageVisit() {
    _current?.recordPageVisit();
  }

  /// End the current session and produce a summary.
  SessionSummary? endSession() {
    if (_current == null) return null;

    final summary = SessionSummary(
      type: _current!.config.type,
      startTime: _current!.startTime,
      endTime: DateTime.now(),
      strokeCount: _current!.strokeCount,
      pagesSeen: _current!.pagesSeen,
    );

    _history.add(summary);
    _current = null;
    notifyListeners();
    return summary;
  }
}
