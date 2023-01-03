
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'fullscreen_web_workarounds.dart';

Future enterFullScreen() async {
  await document.documentElement?.requestFullscreen();
}

void exitFullscreen() {
  try {
    (document as JSDocument).exitFullscreen();
  } catch (e) {
    document.exitFullscreen();
  }
}
