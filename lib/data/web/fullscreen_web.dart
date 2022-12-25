
import 'dart:html';

Future enterFullScreen() async {
  await document.documentElement?.requestFullscreen();
}

void exitFullscreen() {
  return document.exitFullscreen();
}