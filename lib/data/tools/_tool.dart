import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:saber/data/prefs.dart';
import 'package:stow_codecs/stow_codecs.dart';

abstract class Tool {
  @protected
  @visibleForTesting
  const Tool();

  /// An identifier for the tool,
  /// used to save the last-used tool in [stows.lastTool].
  ToolId get toolId;

  static const Tool textEditing = _TextEditingTool();
}

class _TextEditingTool extends Tool {
  const _TextEditingTool();

  @override
  ToolId get toolId => ToolId.textEditing;
}

/// An enum of all available tools.
/// Note that the pens must be ordered in z-axis order,
/// e.g. so that the highlighter is always below the rest.
enum ToolId {
  highlighter('Highlighter'),
  fountainPen('fountainPen'),
  ballpointPen('ballpointPen'),
  pencil('Pencil'),
  shapePen('ShapePen'),
  eraser('Eraser'),
  select('Select'),
  textEditing('TextEditingTool'),
  laserPointer('LaserPointer');

  final String id;
  const ToolId(this.id);

  static const codec = EnumCodec(values);

  static final _log = Logger('ToolId');

  /// Before using this enum, we used the (runtimeType).toString()
  /// as the identifier for pens.
  /// This function converts those old identifiers to the new [ToolId]s.
  static ToolId parsePenType(String? penType, {required ToolId fallback}) {
    if (penType == null) {
      return fallback;
    }
    if (penType == 'Pen') {
      return ToolId.fountainPen;
    }
    for (final toolId in ToolId.values) {
      if (penType == toolId.id) {
        return toolId;
      }
    }
    if (kDebugMode) {
      throw ArgumentError.value(
        penType,
        'penType',
        'Unknown pen type: `$penType`.',
      );
    }
    _log.warning(
      'Unknown pen type: `$penType`, using fallback `${fallback.id}`.',
    );
    return fallback;
  }
}
