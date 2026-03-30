import 'package:flutter/material.dart';

/// Named session archetypes.
enum SessionType {
  focus,
  study,
  lecture,
  nightWriting,
  ritual,
  archiveReview,
}

/// Human-readable labels and icons for session types.
extension SessionTypeDisplay on SessionType {
  String get label {
    switch (this) {
      case SessionType.focus: return 'Focus Session';
      case SessionType.study: return 'Study Rite';
      case SessionType.lecture: return 'Lecture Capture';
      case SessionType.nightWriting: return 'Night Writing';
      case SessionType.ritual: return 'Ritual Session';
      case SessionType.archiveReview: return 'Archive Review';
    }
  }

  String get description {
    switch (this) {
      case SessionType.focus: return 'Quiet, distraction-free deep writing.';
      case SessionType.study: return 'Active note-taking with annotation tools.';
      case SessionType.lecture: return 'Fast capture with minimal effects.';
      case SessionType.nightWriting: return 'Dark, warm atmosphere for late sessions.';
      case SessionType.ritual: return 'Full atmospheric experience with effects.';
      case SessionType.archiveReview: return 'Browse, annotate, and organize existing tomes.';
    }
  }

  IconData get icon {
    switch (this) {
      case SessionType.focus: return Icons.center_focus_strong;
      case SessionType.study: return Icons.menu_book;
      case SessionType.lecture: return Icons.mic;
      case SessionType.nightWriting: return Icons.dark_mode;
      case SessionType.ritual: return Icons.local_fire_department;
      case SessionType.archiveReview: return Icons.library_books;
    }
  }

  Color get accentColor {
    switch (this) {
      case SessionType.focus: return const Color(0xFF4488CC);
      case SessionType.study: return const Color(0xFF44AA66);
      case SessionType.lecture: return const Color(0xFFCC8844);
      case SessionType.nightWriting: return const Color(0xFF6644AA);
      case SessionType.ritual: return const Color(0xFFCC3333);
      case SessionType.archiveReview: return const Color(0xFF888888);
    }
  }
}

/// Configuration for a session — what atmosphere it applies.
class SessionConfig {
  final SessionType type;

  /// Optional loadout to apply when starting.
  final String? loadoutId;

  /// Optional writing mode override.
  final String? writingModeId;

  /// Optional target notebook to open.
  final String? targetNotebookPath;

  /// Optional ambience ID to trigger automatically when this session begins.
  final String? ambienceId;

  /// Optional duration goal in minutes (null = open-ended).
  final int? goalMinutes;

  const SessionConfig({
    required this.type,
    this.loadoutId,
    this.writingModeId,
    this.targetNotebookPath,
    this.ambienceId,
    this.goalMinutes,
  });
}

/// Tracks the live state of an active session.
class ActiveSession {
  final SessionConfig config;
  final DateTime startTime;

  int strokeCount = 0;
  int pagesSeen = 0;

  ActiveSession({required this.config, DateTime? startTime})
      : startTime = startTime ?? DateTime.now();

  Duration get elapsed => DateTime.now().difference(startTime);

  double? get progressFraction {
    if (config.goalMinutes == null) return null;
    return (elapsed.inSeconds / (config.goalMinutes! * 60)).clamp(0.0, 1.0);
  }

  void recordStroke() => strokeCount++;
  void recordPageVisit() => pagesSeen++;
}

/// Lightweight summary produced when a session ends.
class SessionSummary {
  final SessionType type;
  final DateTime startTime;
  final DateTime endTime;
  final int strokeCount;
  final int pagesSeen;

  const SessionSummary({
    required this.type,
    required this.startTime,
    required this.endTime,
    required this.strokeCount,
    required this.pagesSeen,
  });

  Duration get duration => endTime.difference(startTime);
}
