import 'package:flutter/material.dart' hide TransformationController;
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_stroke.dart';
import 'package:saber/components/canvas/canvas_gesture_detector.dart';
import 'package:saber/components/canvas/canvas_preview.dart';
import 'package:saber/components/canvas/interactive_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';

class EditorPageManager extends StatefulWidget {
  const EditorPageManager({
    super.key,
    required this.coreInfo,
    required this.currentPageIndex,
    required this.redrawAndSave,
    required this.deletePage,
    required this.transformationController,
  });

  final EditorCoreInfo coreInfo;
  final int? currentPageIndex;
  final VoidCallback redrawAndSave;
  final void Function(int) deletePage;
  final TransformationController transformationController;

  @override
  State<EditorPageManager> createState() => _EditorPageManagerState();
}

class _EditorPageManagerState extends State<EditorPageManager> {
  void scrollToPage(int pageIndex) {
    widget.transformationController.value = Matrix4.translationValues(
      0,
      -CanvasGestureDetector.getTopOfPage(
        pageIndex: pageIndex,
        pages: widget.coreInfo.pages,
        screenWidth: MediaQuery.of(context).size.width,
      ),
      0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final cupertino = platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;
    return SizedBox(
      width: cupertino ? null : 300,
      height: cupertino ? 600 : null,
      child: ReorderableListView.builder(
        buildDefaultDragHandles: false,
        itemCount: widget.coreInfo.pages.length,
        itemBuilder: (context, pageIndex) {
          return InkWell(
            key: ValueKey(pageIndex),
            onTap: () => scrollToPage(pageIndex),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${pageIndex + 1} / ${widget.coreInfo.pages.length}',
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: cupertino ? 100 : 150,
                          maxHeight: 250,
                        ),
                        child: FittedBox(
                          child: CanvasPreview(
                            pageIndex: pageIndex,
                            height: null,
                            coreInfo: widget.coreInfo,
                          ),
                        ),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.resizeUpDown,
                        child: ReorderableDragStartListener(
                          index: pageIndex,
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.drag_handle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => setState(() {
                          widget.deletePage(pageIndex);
                          scrollToPage(pageIndex);
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        onReorder: (oldIndex, newIndex) {
          if (oldIndex == newIndex) return;
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          widget.coreInfo.pages.insert(newIndex, widget.coreInfo.pages.removeAt(oldIndex));

          // reassign pageIndex of pages' strokes and images
          for (int i = 0; i < widget.coreInfo.pages.length; i++) {
            for (Stroke stroke in widget.coreInfo.pages[i].strokes) {
              stroke.pageIndex = i;
            }
            for (EditorImage image in widget.coreInfo.pages[i].images) {
              image.pageIndex = i;
            }
          }

          widget.redrawAndSave();
        },
      ),
    );
  }
}
