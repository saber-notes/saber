import 'package:stow_codecs/stow_codecs.dart';

/// Actions that can be triggered by Apple Pencil gestures.
enum ApplePencilGestureAction {
  none,
  toggleEraser,
  toggleColors,
  fountainPen,
  ballpointPen,
  pencil,
  highlighter,
  shapePen,
  select,
  laserPointer;

  /// Codec used to store Apple Pencil gesture actions in preferences.
  static const codec = EnumCodec(values);
}
