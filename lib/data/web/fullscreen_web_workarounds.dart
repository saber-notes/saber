@JS()
library workarounds;

import 'package:js/js.dart' show JS, staticInterop;

@JS()
@staticInterop
class JSDocument {
}

extension JSDocumentExtension on JSDocument {
  /// Exits fullscreen mode.
  ///
  /// This workaround is needed as dart:html's [document.exitFullscreen]
  /// is webkit-only so doesn't work on Firefox.
  /// See https://github.com/dart-lang/sdk/issues/50857
  @JS('exitFullscreen')
  external void exitFullscreen();
}
