import 'package:flutter/material.dart';
import 'package:saber/components/canvas/canvas_preview.dart';
import 'package:saber/data/editor/editor_core_info.dart';

class EditorPageManager extends StatelessWidget {
  const EditorPageManager({
    super.key,
    required this.coreInfo,
    required this.currentPageIndex,
    required this.redrawAndSave,
  });

  final EditorCoreInfo coreInfo;
  final int? currentPageIndex;
  final VoidCallback redrawAndSave;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ListView.separated(
        itemCount: coreInfo.pages.length,
        itemBuilder: (context, pageIndex) {
          return CanvasPreview(
            pageIndex: pageIndex,
            height: null,
            coreInfo: coreInfo,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
    );
  }
}
