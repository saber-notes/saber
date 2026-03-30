import 'dart:ui';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:sbn/tool_id.dart';
import 'package:sbn/has_size.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
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
  Stroke compileToLegacy(HasSize page) {
    final stroke = Stroke(
      toolId: toolId,
      color: baseColor,
      pressureEnabled: true,
      options: StrokeOptions(
        size: baseThickness,
        thinning: 0.7,
        smoothing: 0.5,
        streamline: 0.5,
        simulatePressure: false,
      ),
      pageIndex: pageIndex,
      page: page,
    );
    
    for (final s in samples) {
      // Map high-res 6-DOF metadata down into standard pressure stream for legacy compat.
      final pressure = profile.computeThickness(s, baseThickness: 1.0);
      stroke.addPoint(Offset(s.x, s.y), pressure);
    }
    
    return stroke;
  }
}
