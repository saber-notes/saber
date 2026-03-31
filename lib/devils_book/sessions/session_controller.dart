import 'package:flutter/material.dart';
import 'dart:async';

enum SessionType {
  focus(label: 'Focus Ritual'),
  deep(label: 'Deep Communion'),
  quick(label: 'Quick Invocation');

  final String label;
  const SessionType({required this.label});
}

class SessionConfig {
  final SessionType type;
  final Duration duration;

  SessionConfig({required this.type, required this.duration});
}

class SessionController extends ChangeNotifier {
  static final SessionController _instance = SessionController._internal();
  factory SessionController() => _instance;
  SessionController._internal();

  bool _isActive = false;
  bool get isActive => _isActive;

  SessionConfig? _currentConfig;
  SessionConfig? get currentConfig => _currentConfig;

  Duration _elapsed = Duration.zero;
  Duration get elapsed => _elapsed;
  
  int _strokesRecorded = 0;
  int get strokesRecorded => _strokesRecorded;

  Timer? _timer;

  void startSession(SessionConfig config) {
    _isActive = true;
    _currentConfig = config;
    _elapsed = Duration.zero;
    _strokesRecorded = 0;
    
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _elapsed += const Duration(seconds: 1);
      notifyListeners();
    });
    
    notifyListeners();
  }

  void stopSession() {
    _isActive = false;
    _timer?.cancel();
    notifyListeners();
  }

  void recordStroke() {
    if (_isActive) {
      _strokesRecorded++;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
