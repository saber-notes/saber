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
  static const codec = _ApplePencilGestureActionCodec();
}

class _ApplePencilGestureActionCodec
    extends AbstractCodec<ApplePencilGestureAction, String> {
  const _ApplePencilGestureActionCodec();

  @override
  String encode(ApplePencilGestureAction input) {
    return switch (input) {
      .none => 'none',
      .toggleEraser => 'toggle_eraser',
      .toggleColors => 'toggle_colors',
      .fountainPen => 'fountain_pen',
      .ballpointPen => 'ballpoint_pen',
      .pencil => 'pencil',
      .highlighter => 'highlighter',
      .shapePen => 'shape_pen',
      .select => 'select',
      .laserPointer => 'laser_pointer',
    };
  }

  @override
  ApplePencilGestureAction decode(String encoded) {
    return switch (encoded) {
      'none' => ApplePencilGestureAction.none,
      'toggle_eraser' => ApplePencilGestureAction.toggleEraser,
      'toggle_colors' => ApplePencilGestureAction.toggleColors,
      'fountain_pen' => ApplePencilGestureAction.fountainPen,
      'ballpoint_pen' => ApplePencilGestureAction.ballpointPen,
      'pencil' => ApplePencilGestureAction.pencil,
      'highlighter' => ApplePencilGestureAction.highlighter,
      'shape_pen' => ApplePencilGestureAction.shapePen,
      'select' => ApplePencilGestureAction.select,
      'laser_pointer' => ApplePencilGestureAction.laserPointer,
      _ => ApplePencilGestureAction.toggleEraser,
    };
  }
}
