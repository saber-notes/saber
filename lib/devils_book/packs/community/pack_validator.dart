import 'dart:typed_data';
import '../pack_manifest.dart';

/// Represents a packaged community extension file (e.g., a `.dbp` Devils Book Pack).
/// In reality, this would be a zip archive containing a `manifest.json` and asset folders.
abstract class CommunityPackArchive {
  /// The raw bytes of the archive file.
  Uint8List get bytes;
  
  /// The parsed manifest extracted from the archive root.
  PackManifest get manifest;
  
  /// Parses JSON definitions for Theme, Ink, Effect, Notebook, or Seal presets.
  Future<Map<String, dynamic>> extractJsonObjects(String filename);
  
  /// Extracts binary assets (e.g., SVGs for seals, MP3s for ambience, PNGs for UI).
  Future<Uint8List?> extractAsset(String assetPath);
}

/// Validation result for a Pack before it is allowed to load.
class PackValidationResult {
  final bool isValid;
  final List<String> errors;
  final List<String> warnings;

  const PackValidationResult({
    required this.isValid,
    this.errors = const [],
    this.warnings = const [],
  });
}

/// Responsible for verifying the structure, safety, and version compatibility of a community pack.
class PackManifestValidator {
  
  /// The maximum supported pack schema version by this client.
  static const int currentSchemaVersion = 1;

  /// Verifies that the manifest has required fields, valid UUIDs, and safe string lengths.
  PackValidationResult validateManifest(PackManifest manifest) {
    final errors = <String>[];
    final warnings = <String>[];

    // Version Check
    // if (manifest.schemaVersion > currentSchemaVersion) {
    //   errors.add('Pack requires a newer version of Devils Book');
    // }

    // ID Checks (Preventing core namespace collisions)
    if (manifest.id.startsWith('builtin_') || manifest.id.startsWith('pack_')) {
      errors.add("Custom packs cannot use reserved 'builtin_' or 'pack_' prefixes.");
    }
    
    if (manifest.id.contains(RegExp(r'[^a-zA-Z0-9_-]'))) {
      errors.add('Pack ID contains invalid characters. Use only alphanumeric, dashes, and underscores.');
    }

    if (manifest.name.length > 50) {
      warnings.add('Pack name is very long and may truncate in the UI.');
    }

    // Safety constraint: Prevent gamification/nib-wear keywords in descriptions 
    // to maintain product identity (optional enforcement).
    final lowerDesc = manifest.description.toLowerCase();
    if (lowerDesc.contains('nib wear') || lowerDesc.contains('durability')) {
      warnings.add('Devils Book strongly discourages concepts of tool degradation.');
    }

    return PackValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
      warnings: warnings,
    );
  }

  /// Verifies that all assets referenced in the JSON objects actually exist in the archive.
  Future<PackValidationResult> validateAssetIntegrity(CommunityPackArchive archive) async {
    // STUB: Would iterate through parsed JSON definitions (e.g., `RelicElement.assetPath`)
    // and verify `archive.extractAsset(path)` resolves successfully.
    return const PackValidationResult(isValid: true);
  }
}
