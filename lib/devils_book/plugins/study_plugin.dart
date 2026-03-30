import 'dart:typed_data';
import 'package:flutter/material.dart';

/// The scope of data access a plugin is requesting.
enum StudyDataAccessLevel {
  /// The plugin only needs the current page's bounding box and rendered image.
  visiblePageRaster,
  
  /// The plugin needs the raw stroke geometry for handwriting analysis.
  pageVectorData,
  
  /// The plugin needs to read the entire notebook structure (for summaries/Q&A).
  fullTomeAccess,
}

/// A read-only snapshot provided to a StudyPlugin when it executes.
abstract class StudyContext {
  /// The unique ID of the active notebook.
  String get notebookId;
  
  /// The currently focused page index.
  int get currentPageIndex;

  /// Requests a high-quality rasterized image of the current page.
  /// Throws if the plugin didn't declare [StudyDataAccessLevel.visiblePageRaster].
  Future<Uint8List> getPageRaster();

  /// Requests the raw vector JSON payload of the current page's strokes.
  /// Throws if the plugin didn't declare [StudyDataAccessLevel.pageVectorData].
  Future<Map<String, dynamic>> getPageVectors();

  /// Prompts the user to insert a new text block or image at a specific location.
  /// Used for returning OCR results, flashcards, or generated formulas.
  Future<void> proposeInsertion({
    required Widget previewPlaceholder,
    required Future<void> Function(Offset canvasPosition) onConfirm,
  });
}

/// The base interface for an optional AI/Study extension in Devils Book.
abstract class StudyPlugin {
  /// Unique identifier (e.g., 'devilsbook.study.local_ocr').
  String get id;

  /// Human-readable name (e.g., 'On-Device Text Extraction').
  String get name;

  /// Short explanation of what this helper does.
  String get description;

  /// Display icon for the plugin menu.
  IconData get icon;

  /// Whether this plugin requires an active internet connection.
  bool get requiresNetwork;

  /// The level of data access this plugin needs to function.
  StudyDataAccessLevel get requiredAccess;

  /// Initialization hook (e.g., loading an on-device TFLite model or checking API keys).
  Future<void> initialize();

  /// Executes the plugin's core action against the provided [context].
  /// E.g., OCR plugin calls `context.getPageRaster()`, runs ML, and calls `context.proposeInsertion()`.
  Future<void> execute(StudyContext context, BuildContext uiContext);
}
