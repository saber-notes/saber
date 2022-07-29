
import 'dart:ui';

abstract class Tool {
  void onDragStart(Offset position);
  void onDragUpdate(Offset position);
  dynamic onDragEnd();
}
