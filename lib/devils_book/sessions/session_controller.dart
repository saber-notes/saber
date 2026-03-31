import 'package:flutter/material.dart';
import 'dart:async';
import 'session_models.dart';

class SessionController extends ChangeNotifier {
  static final SessionController _instance = SessionController._internal();
  factory SessionController() => _instance;
  SessionController._internal();

  ActiveSession? _activeSession;
  ActiveSession? get activeSession => _activeSession;

  bool get isActive => _activeSession != null;
  double _kineticEnergy = 0.0;
  Timer? _timer;
  Timer? _decayTimer;

  void startSession(SessionConfig config) {
    _activeSession = ActiveSession(config: config);
    
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_activeSession != null) {
        notifyListeners();
      }
    });

    _decayTimer?.cancel();
    _decayTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_activeSession != null) {
        _decayKineticIntensity();
      }
    });
    
    notifyListeners();
  }

  void stopSession() {
    _activeSession = null;
    _timer?.cancel();
    _decayTimer?.cancel();
    _kineticEnergy = 0.0;
    notifyListeners();
  }

  void recordStroke() {
    if (_activeSession != null) {
      _activeSession!.recordStroke();
      
      // Kinetic Energy Burst
      _kineticEnergy = (_kineticEnergy + 0.15).clamp(0.0, 1.0);
      notifyListeners();
    }
  }

  void _decayKineticIntensity() {
    if (_activeSession != null) {
      // Exponential Cooling (Physics-based)
      if (_kineticEnergy > 0.01) {
        _kineticEnergy *= 0.92; // Cools by 8% every 100ms
        notifyListeners();
      } else if (_kineticEnergy > 0) {
        _kineticEnergy = 0.0;
        notifyListeners();
      }
    }
  }

  void recordPageVisit() {
    if (_activeSession != null) {
      _activeSession!.recordPageVisit();
      notifyListeners();
    }
  }

  /// Calculates the current visual "intensity" of the session.
  /// Used for things like the Blood Pact glow or Midnight Mantra vignette.
  double getSessionIntensity() {
    if (_activeSession == null) return 0.0;
    
    double baseIntensity = 0.0;
    switch (_activeSession!.config.type) {
      case SessionType.bloodPact:
        baseIntensity = (_activeSession!.strokeCount / 1000.0).clamp(0.0, 1.0);
      case SessionType.midnightMantra:
        baseIntensity = (_activeSession!.elapsed.inSeconds / 600.0).clamp(0.0, 1.0);
      default:
        baseIntensity = 0.0;
    }

    // Blend base intensity (progress) with kinetic fire (current energy)
    return (baseIntensity * 0.4) + (_kineticEnergy * 0.6);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _decayTimer?.cancel();
    super.dispose();
  }
}
