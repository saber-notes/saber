import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/data/extensions/list_extensions.dart';
import 'package:saber/data/prefs.dart';

typedef _CacheItem = (EditorCoreInfo coreInfo, double pageHeight);

class CanvasPreview extends StatelessWidget implements PreferredSizeWidget {
  CanvasPreview({
    super.key,
    this.pageIndex = 0,
    required this.height,
    required this.coreInfo,
  });

  final int pageIndex;
  final double? height;
  final EditorCoreInfo coreInfo;

  late final pageSize =
      coreInfo.pages.getOrNull(pageIndex)?.size ?? EditorPage.defaultSize;
  @override
  late final preferredSize = Size(pageSize.width, height ?? pageSize.height);

  static final _previewCache = <String, FutureOr<_CacheItem>>{};
  static Widget fromFile({
    Key? key,
    required String filePath,
  }) {
    final future = _previewCache.putIfAbsent(
      filePath,
      () async {
        final coreInfo = await EditorCoreInfo.loadFromFilePath(filePath);
        final pageHeight = coreInfo.pages.isNotEmpty
            ? coreInfo.pages[0].previewHeight(lineHeight: coreInfo.lineHeight)
            : EditorPage.defaultHeight * 0.1;
        return (coreInfo, pageHeight);
      },
    );

    if (future is _CacheItem) {
      // Don't use FutureBuilder which first builds with null
      return CanvasPreview(
        key: key,
        coreInfo: future.$1,
        height: future.$2,
      );
    }

    return FutureBuilder(
      key: key,
      future: future,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) return const Icon(Icons.note, size: 48);

        if (_previewCache[filePath] is Future<_CacheItem>) {
          // Store result of future to make rebuilds faster
          _previewCache[filePath] = data;
        }

        return CanvasPreview(
          key: key,
          coreInfo: data.$1,
          height: data.$2,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InnerCanvas(
      pageIndex: pageIndex,
      width: preferredSize.width,
      height: preferredSize.height,
      isPreview: true,
      coreInfo: coreInfo,
      currentStroke: null,
      currentStrokeDetectedShape: null,
      currentSelection: null,
      hideBackground: Prefs.hideHomeBackgrounds.value,
      currentToolIsSelect: false,
      currentScale: double.minPositive,
    );
  }
}
