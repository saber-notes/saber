import 'package:flutter/material.dart';
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

enum ToolId {
  fountainPen('fountainPen'),
  ballpointPen('ballpointPen'),
  insertPen('insertPen'),
  highlighter('Highlighter'),
  pencil('Pencil'),
  shapePen('ShapePen'),
  eraser('Eraser'),
  select('Select'),
  textEditing('TextEditingTool'),
  laserPointer('LaserPointer');

  final String id;
  const ToolId(this.id);

  static final codec = EnumCodec(values);
}
