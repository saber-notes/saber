import 'package:flutter/material.dart';

/// A shelf is a named visual grouping of notebooks in the library.
class Shelf {
  final String id;
  final String name;
  final Color accentColor;
  final IconData icon;
  final int sortOrder;

  const Shelf({
    required this.id,
    required this.name,
    this.accentColor = const Color(0xFF888888),
    this.icon = Icons.folder_outlined,
    this.sortOrder = 0,
  });
}

/// Extended metadata layered onto an existing Saber notebook file.
/// This does NOT replace Saber's EditorCoreInfo — it wraps around it.
class TomeMetadata {
  final String notebookPath;

  /// Which shelf this tome lives on (null = unshelved / inbox).
  String? shelfId;

  /// Whether this tome is pinned to the top of its shelf.
  bool isPinned;

  /// Whether this tome is favorited globally.
  bool isFavorite;

  /// Optional series/collection name for grouping related tomes.
  String? series;

  /// Ordering index within a series.
  int seriesOrder;

  /// User-assigned tags for filtering.
  List<String> tags;

  /// Cover template ID linking back to NotebookTemplate system.
  String? coverTemplateId;

  /// Last meaningful writing session timestamp.
  DateTime? lastWritingSession;

  /// Total estimated page count (cached for display).
  int pageCount;

  TomeMetadata({
    required this.notebookPath,
    this.shelfId,
    this.isPinned = false,
    this.isFavorite = false,
    this.series,
    this.seriesOrder = 0,
    this.tags = const [],
    this.coverTemplateId,
    this.lastWritingSession,
    this.pageCount = 0,
  });

  Map<String, dynamic> toJson() => {
    'notebookPath': notebookPath,
    'shelfId': shelfId,
    'isPinned': isPinned,
    'isFavorite': isFavorite,
    'series': series,
    'seriesOrder': seriesOrder,
    'tags': tags,
    'coverTemplateId': coverTemplateId,
    'lastWritingSession': lastWritingSession?.toIso8601String(),
    'pageCount': pageCount,
  };

  factory TomeMetadata.fromJson(Map<String, dynamic> json) => TomeMetadata(
    notebookPath: json['notebookPath'] as String,
    shelfId: json['shelfId'] as String?,
    isPinned: json['isPinned'] as bool? ?? false,
    isFavorite: json['isFavorite'] as bool? ?? false,
    series: json['series'] as String?,
    seriesOrder: json['seriesOrder'] as int? ?? 0,
    tags: (json['tags'] as List<dynamic>?)?.cast<String>() ?? [],
    coverTemplateId: json['coverTemplateId'] as String?,
    lastWritingSession: json['lastWritingSession'] != null
        ? DateTime.tryParse(json['lastWritingSession'] as String)
        : null,
    pageCount: json['pageCount'] as int? ?? 0,
  );
}

/// A bookmark pointing to a specific important page within a tome.
class PageBookmark {
  final String notebookPath;
  final int pageIndex;
  final String? label;
  final Color color;
  final DateTime created;

  const PageBookmark({
    required this.notebookPath,
    required this.pageIndex,
    this.label,
    this.color = const Color(0xFFFFAA00),
    required this.created,
  });
}
