import 'package:flutter/material.dart';

class SqueezePaletteController extends ChangeNotifier {
  bool isVisible = false;
  Offset position = Offset.zero;

  void showAt(Offset newPosition) {
    position = newPosition;
    isVisible = true;
    notifyListeners();
  }

  void hide() {
    if (isVisible) {
      isVisible = false;
      notifyListeners();
    }
  }

  void toggleDevTrigger(Size screenSize) {
    if (isVisible) {
      hide();
    } else {
      showAt(Offset(screenSize.width / 2, screenSize.height / 2));
    }
  }
}
