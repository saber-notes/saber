import 'package:flutter/material.dart';

class ZoomWindowController extends ChangeNotifier {
  bool isVisible = false;
  
  // The normalized logical rectangle on the active page
  Rect targetRect = const Rect.fromLTWH(50, 50, 350, 100);
  
  // The magnification scale factor
  double zoomScale = 2.5;

  void toggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  void updateTargetPosition(Offset delta) {
    targetRect = targetRect.shift(delta);
    notifyListeners();
  }
  
  void advanceTarget() {
    // Future-ready for auto-advance (moving right, then returning and moving down)
    targetRect = targetRect.shift(Offset(targetRect.width * 0.8, 0));
    notifyListeners();
  }
  
  Offset transformPoint(Offset stripLocalPosition, Size stripBounds) {
    // Maps a touch from the highly scaled bottom strip backward into the global page coordinate space
    final normalizedX = stripLocalPosition.dx / stripBounds.width;
    final normalizedY = stripLocalPosition.dy / stripBounds.height;
    
    return Offset(
      targetRect.left + (normalizedX * targetRect.width),
      targetRect.top + (normalizedY * targetRect.height),
    );
  }
}
