import 'package:flutter/material.dart';

/// The core output format for rendering.
enum ExportFormat {
  pdf,
  png,
  sba, // Saber Archive (native data)
  video, // Future timeline rebuild
}

/// The stylistic variant applied to the export.
enum ExportVariant {
  /// Clean, distraction-free document.
  /// Guarantees: No live FX (embers/sparks), neutral or selected background, standard ink rendering.
  clean,

  /// High-fidelity rendering matching the active screen environment.
  /// Guarantees: Includes theme background colors, rich ink shears, and ambient UI context if enabled.
  stylized,

  /// Formal presentation export.
  /// Guarantees: Prepends a title page, adds a ceremonial seal watermark, uses high-contrast ink modes.
  ceremonial,

  /// Replay/Lapse capture.
  /// Guarantees: Outputs an animated format (video/gif) reconstructing the page timeline.
  lapse,
}

extension ExportVariantDisplay on ExportVariant {
  String get label {
    switch (this) {
      case ExportVariant.clean: return 'Clean Document';
      case ExportVariant.stylized: return 'Stylized Capture';
      case ExportVariant.ceremonial: return 'Ceremonial Folio';
      case ExportVariant.lapse: return 'Time-Lapse Memory';
    }
  }

  String get description {
    switch (this) {
      case ExportVariant.clean: return 'Standard export. No atmospheric effects. Ideal for print and sharing.';
      case ExportVariant.stylized: return 'Bakes active theme colors and rich ink textures into the page.';
      case ExportVariant.ceremonial: return 'Adds a formal title page and seal watermarks. (Future)';
      case ExportVariant.lapse: return 'Exports an animated reconstruction of your writing session. (Future)';
    }
  }

  IconData get icon {
    switch (this) {
      case ExportVariant.clean: return Icons.description_outlined;
      case ExportVariant.stylized: return Icons.palette_outlined;
      case ExportVariant.ceremonial: return Icons.account_balance_outlined;
      case ExportVariant.lapse: return Icons.movie_outlined;
    }
  }

  bool get isAvailable {
    switch (this) {
      case ExportVariant.clean: return true;
      case ExportVariant.stylized: return true; // Just flags standard rasterization
      case ExportVariant.ceremonial: return false; // Future
      case ExportVariant.lapse: return false; // Future
    }
  }
}

/// A configuration object declaring how a page/notebook should be exported.
class ExportConfig {
  final ExportFormat format;
  final ExportVariant variant;
  final bool includeBackground;
  final bool includeGrid;

  const ExportConfig({
    required this.format,
    required this.variant,
    this.includeBackground = true,
    this.includeGrid = true,
  });
}
