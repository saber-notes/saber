// This must stay in sync with the OnyxsdkPenArea.StrokeStyle enum in Kotlin
enum OnyxStrokeStyle {
  fountainPen(0),
  pen(1),
  brush(2),
  pencil(3),
  marker(4),
  disabled(5);

  const OnyxStrokeStyle(this.value);
  final int value;
}
