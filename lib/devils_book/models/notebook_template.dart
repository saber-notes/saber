import 'package:flutter/material.dart';
import 'package:sbn/canvas_background_pattern.dart';

/// Visual identity of a notebook's cover.
class CoverStyle {
  final String id;
  final String name;
  final Color primaryColor;
  final Color accentColor;
  final String? coverAssetPath;
  final String? description;

  CoverStyle({
    required this.id,
    required this.name,
    required this.primaryColor,
    this.accentColor = Colors.white,
    this.coverAssetPath,
    this.description,
  });
}

/// A page template defining the default look of new pages.
class PageTemplate {
  final String id;
  final String name;
  final Color backgroundColor;
  final CanvasBackgroundPattern pattern;
  final Color lineColor;
  final String? description;

  PageTemplate({
    required this.id,
    required this.name,
    required this.backgroundColor,
    this.pattern = CanvasBackgroundPattern.none,
    this.lineColor = const Color(0x33888888),
    this.description,
  });
}

/// A notebook template bundling a cover with default page templates.
class NotebookTemplate {
  final String id;
  final String name;
  final CoverStyle cover;
  final PageTemplate defaultPage;
  final List<PageTemplate> availablePages;
  final String? packId;
  final String? description;

  NotebookTemplate({
    required this.id,
    required this.name,
    required this.cover,
    required this.defaultPage,
    this.availablePages = const [],
    this.packId,
    this.description,
  });
}
