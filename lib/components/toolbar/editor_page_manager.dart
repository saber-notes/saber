import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/canvas_gesture_detector.dart';
import 'package:saber/components/canvas/canvas_preview.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/components/theming/saber_theme.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page_insertion_mode.dart';
import 'package:saber/data/editor/page_style.dart';
import 'package:saber/i18n/strings.g.dart';

class EditorPageManager extends StatefulWidget {
  const EditorPageManager({
    super.key,
    required this.coreInfo,
    required this.currentPageIndex,
    required this.redrawAndSave,
    required this.insertPageAfter,
    required this.duplicatePage,
    required this.clearPage,
    required this.deletePage,
    required this.transformationController,
  });

  final EditorCoreInfo coreInfo;
  final int? currentPageIndex;
  final VoidCallback redrawAndSave;

  final void Function(int, {PageInsertionMode mode, PageStyle? customStyle}) insertPageAfter;
  final void Function(int) duplicatePage;
  final void Function(int) clearPage;
  final void Function(int) deletePage;

  final TransformationController transformationController;

  @override
  State<EditorPageManager> createState() => _EditorPageManagerState();
}

class _EditorPageManagerState extends State<EditorPageManager> {
  void scrollToPage(int pageIndex) => CanvasGestureDetector.scrollToPage(
    pageIndex: pageIndex,
    pages: widget.coreInfo.pages,
    screenWidth: MediaQuery.sizeOf(context).width,
    transformationController: widget.transformationController,
  );

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final cupertino = platform.isCupertino;
    return SizedBox(
      width: cupertino ? null : 300,
      height: cupertino ? 600 : null,
      child: ReorderableListView.builder(
        buildDefaultDragHandles: false,
        itemCount: widget.coreInfo.pages.length,
        itemBuilder: (context, pageIndex) {
          final isEmptyLastPage =
              pageIndex == widget.coreInfo.pages.length - 1 &&
              widget.coreInfo.pages[pageIndex].isEmpty;
          return InkWell(
            key: ValueKey(pageIndex),
            onTap: () => scrollToPage(pageIndex),
            child: Padding(
              padding: const .all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: .spaceAround,
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
                            padding: .all(8),
                            child: Icon(Icons.drag_handle),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      PopupMenuButton<PageInsertionMode>(
                        tooltip: 'Insert Page Options',
                        icon: const AdaptiveIcon(
                          icon: Icons.insert_page_break,
                          cupertinoIcon: CupertinoIcons.add,
                        ),
                        onSelected: (mode) => setState(() {
                          if (mode == PageInsertionMode.duplicate) {
                            widget.duplicatePage(pageIndex);
                          } else {
                            widget.insertPageAfter(pageIndex, mode: mode);
                          }
                          scrollToPage(pageIndex + 1);
                        }),
                        itemBuilder: (context) => const [
                          PopupMenuItem(
                            value: PageInsertionMode.inherit,
                            child: Text('Add Page (Same Style)'),
                          ),
                          PopupMenuItem(
                            value: PageInsertionMode.notebookDefault,
                            child: Text('Add Page (Notebook Default)'),
                          ),
                          PopupMenuItem(
                            value: PageInsertionMode.customStyle,
                            child: Text('Add Page (Choose Template...)'),
                          ),
                          PopupMenuItem(
                            value: PageInsertionMode.duplicate,
                            child: Text('Duplicate Content & Style'),
                          ),
                        ],
                      ),
                      IconButton(
                        tooltip: t.editor.menu.clearPage(
                          page: pageIndex + 1,
                          totalPages: widget.coreInfo.pages.length,
                        ),
                        icon: const Icon(Icons.cleaning_services),
                        onPressed: isEmptyLastPage
                            ? null
                            : () => setState(() {
                                widget.clearPage(pageIndex);
                                scrollToPage(pageIndex);
                              }),
                      ),
                      IconButton(
                        tooltip: t.editor.menu.deletePage,
                        icon: const AdaptiveIcon(
                          icon: Icons.delete,
                          cupertinoIcon: CupertinoIcons.delete,
                        ),
                        onPressed: isEmptyLastPage
                            ? null
                            : () => setState(() {
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
          widget.coreInfo.pages.insert(
            newIndex,
            widget.coreInfo.pages.removeAt(oldIndex),
          );

          // reassign pageIndex of pages' strokes and images
          for (int i = 0; i < widget.coreInfo.pages.length; i++) {
            for (final stroke in widget.coreInfo.pages[i].strokes) {
              stroke.pageIndex = i;
            }
            for (final image in widget.coreInfo.pages[i].images) {
              image.pageIndex = i;
            }
          }

          widget.redrawAndSave();
        },
      ),
    );
  }
}
