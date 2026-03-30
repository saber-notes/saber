import 'pack_category.dart';

/// Metadata describing a single content pack.
/// A pack is a self-contained bundle of optional content
/// that registers into the Devils Book catalog at runtime.
class PackManifest {
  /// Unique identifier for this pack (e.g., 'pack_infernal_collection').
  final String id;

  /// Human-readable display name.
  final String name;

  /// Short description shown in pack browsers.
  final String description;

  /// Semantic version string (e.g., '1.0.0').
  final String version;

  /// The author or studio name.
  final String author;

  /// Which content categories this pack contributes to.
  final Set<PackCategory> categories;

  /// Whether this pack ships with the app (built-in) or was installed later.
  final bool isBuiltIn;

  /// Whether the user has enabled this pack.
  bool isEnabled;

  PackManifest({
    required this.id,
    required this.name,
    required this.description,
    this.version = '1.0.0',
    this.author = 'Devils Book',
    required this.categories,
    this.isBuiltIn = false,
    this.isEnabled = true,
  });
}
