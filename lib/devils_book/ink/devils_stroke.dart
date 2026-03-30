import 'dart:ui';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:sbn/tool_id.dart';
import 'ink_sample.dart';
import 'nib_profile.dart';

/// A memory-resident wrapper that holds full 6-DOF high-frequency stylus data.
/// It seamlessly compiles down to a universally compatible standard Saber [Stroke]
/// for disk serialization, ensuring `.sbn2` backward compatibility constraints remain solid.
class DevilsStroke {
  final List<InkSample> samples = [];
  final NibProfile profile;
  final ToolId toolId;
  final Color baseColor;
  final double baseThickness;
  
  final int pageIndex;
  
  DevilsStroke({
    required this.profile,
    required this.toolId,
    required this.baseColor,
    required this.baseThickness,
    required this.pageIndex,
  });

  void addSample(InkSample sample) {
    samples.add(sample);
  }

  /// Compiles the high-res 6-DOF data into the standard bezier-optimized [Stroke]
  /// for legacy rendering loops or disk persistence.
  Stroke compileToLegacy() {
    final stroke = Stroke(
      toolId: toolId,
      color: baseColor,
      baseSize: baseThickness,
      pageIndex: pageIndex,
      // We map the computed calligraphic thickness down into the standard pressure stream!
      // This tricks the legacy rendering engine into drawing Calligraphy outlines 
      // without rewriting the complex spline calculation shaders yet.
      points: samples.map((s) => [
        s.x,
        s.y,
        // We mathematically override the raw hardware stylus pressure with the intelligently 
        // computed nib profile thickness ratio.
        profile.computeThickness(s, baseThickness: 1.0),
      ]).toList(),
    );
    return stroke;
  }
}
