import 'package:flutter/material.dart';

/// The type of action that occurred in the timeline.
enum ReplayEventType {
  strokeAdded,
  strokeErased,
  imageAdded,
  imageMoved,
  pageCleared,
}

/// A single atomic event in the page's history.
class ReplayEvent {
  final String id;
  final ReplayEventType type;

  /// The relative time elapsed (in milliseconds) since the first event on this page.
  final int offsetMs;

  /// The serialized payload (e.g., standard Saber stroke data, SVG relic path, bounds).
  final Map<String, dynamic> payload;

  const ReplayEvent({
    required this.id,
    required this.type,
    required this.offsetMs,
    required this.payload,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type.index,
    'offsetMs': offsetMs,
    'payload': payload,
  };

  factory ReplayEvent.fromJson(Map<String, dynamic> json) => ReplayEvent(
    id: json['id'] as String,
    type: ReplayEventType.values[json['type'] as int],
    offsetMs: json['offsetMs'] as int,
    payload: json['payload'] as Map<String, dynamic>,
  );
}

/// The chronologically ordered record of a single page's construction.
class ReplayTimeline {
  final String pageId;
  final List<ReplayEvent> events;

  /// Total duration of the page timeline in milliseconds.
  int get durationMs => events.isEmpty ? 0 : events.last.offsetMs;

  const ReplayTimeline({
    required this.pageId,
    required this.events,
  });

  Map<String, dynamic> toJson() => {
    'pageId': pageId,
    'events': events.map((e) => e.toJson()).toList(),
  };

  factory ReplayTimeline.fromJson(Map<String, dynamic> json) => ReplayTimeline(
    pageId: json['pageId'] as String,
    events: (json['events'] as List<dynamic>)
        .map((e) => ReplayEvent.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  /// Returns all events that occurred up to the given relative `timeMs`.
  List<ReplayEvent> eventsUpTo(int timeMs) {
    if (events.isEmpty) return [];
    if (timeMs <= 0) return [];
    if (timeMs >= durationMs) return List.of(events);

    // Simple binary search or linear filter (events are guaranteed chronological)
    return events.where((e) => e.offsetMs <= timeMs).toList();
  }
}
