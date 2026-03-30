import 'package:flutter/foundation.dart';
import 'devils_stylus_event.dart';
import 'stylus_capabilities.dart';

/// Central state holder for the stylus hardware.
/// Allows decoupled components (e.g. EffectEngine, Hover Engine) to probe the current physical pen state
/// without being explicitly piped through the interactive canvas callbacks.
class StylusState extends ChangeNotifier {
  StylusCapabilities capabilities = StylusCapabilities.unknown;
  
  DevilsStylusEvent? currentEvent;
  
  /// Tracks if the user is currently squeezing the pen shell.
  /// This is separate from drawing pressure and invokes UI/Effect changes.
  bool isSqueezing = false;
  
  /// Tracks if the pen is within hover distance of the screen.
  bool isHovering = false;

  void updateCapabilities(StylusCapabilities newCaps) {
    if (capabilities != newCaps) {
      capabilities = newCaps;
      notifyListeners();
    }
  }

  void updateEvent(DevilsStylusEvent event) {
    currentEvent = event;
    
    bool changed = false;

    if (isHovering != event.isHovering) {
      isHovering = event.isHovering;
      changed = true;
    }

    if (event.squeeze != null) {
      final squeezeDetected = event.squeeze! > 0.5; // Threshold for explicit squeeze
      if (isSqueezing != squeezeDetected) {
        isSqueezing = squeezeDetected;
        changed = true;
      }
    }

    // Always notify listeners for continuous updates like hover coordinates moving
    notifyListeners();
  }
}
