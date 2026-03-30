import 'package:flutter/material.dart';
import 'package:saber/data/extensions/color_extensions.dart';
import 'package:sbn/canvas_background_pattern.dart';

class PageStyle {
  final CanvasBackgroundPattern pattern;
  final Color? backgroundColor;
  final int lineHeight;
  final int lineThickness;
  final String? templateRef;

  const PageStyle({
    required this.pattern,
    this.backgroundColor,
    required this.lineHeight,
    required this.lineThickness,
    this.templateRef,
  });

  factory PageStyle.fromJson(Map<String, dynamic> json, {required PageStyle fallback}) {
    Color? color;
    if (json['b'] != null) {
      final b = json['b'];
      color = b is int ? Color(b) : Color((b as num).toInt());
    }
    return PageStyle(
      pattern: CanvasBackgroundPattern.fromName(json['p'] as String?) ?? fallback.pattern,
      backgroundColor: color ?? fallback.backgroundColor,
      lineHeight: json['l'] as int? ?? fallback.lineHeight,
      lineThickness: json['lt'] as int? ?? fallback.lineThickness,
      templateRef: json['tr'] as String?,
    );
  }

  Map<String, dynamic> toJsonDiff(PageStyle notebookDefault) {
    return {
      if (backgroundColor != notebookDefault.backgroundColor) 'b': backgroundColor?.toARGB32(),
      if (pattern != notebookDefault.pattern) 'p': pattern.name,
      if (lineHeight != notebookDefault.lineHeight) 'l': lineHeight,
      if (lineThickness != notebookDefault.lineThickness) 'lt': lineThickness,
      if (templateRef != null) 'tr': templateRef,
    };
  }

  PageStyle copyWith({
    CanvasBackgroundPattern? pattern,
    Color? backgroundColor,
    int? lineHeight,
    int? lineThickness,
    String? templateRef,
  }) {
    return PageStyle(
      pattern: pattern ?? this.pattern,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      lineHeight: lineHeight ?? this.lineHeight,
      lineThickness: lineThickness ?? this.lineThickness,
      templateRef: templateRef ?? this.templateRef,
    );
  }
}
