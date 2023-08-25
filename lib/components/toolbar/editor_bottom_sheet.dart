import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/canvas_background_preview.dart';
import 'package:saber/components/canvas/canvas_image_dialog.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/i18n/extensions/box_fit_localized.dart';
import 'package:saber/i18n/strings.g.dart';

class EditorBottomSheet extends StatefulWidget {
  const EditorBottomSheet({
    super.key,
    required this.invert,
    required this.coreInfo,
    required this.currentPageIndex,
    required this.setBackgroundPattern,
    required this.setLineHeight,
    required this.removeBackgroundImage,
    required this.redrawImage,
    required this.clearPage,
    required this.clearAllPages,
    required this.redrawAndSave,
    required this.pickPhotos,
    required this.importPdf,
    required this.canRasterPdf,
  });

  final bool invert;
  final EditorCoreInfo coreInfo;
  final int? currentPageIndex;
  final void Function(CanvasBackgroundPattern) setBackgroundPattern;
  final void Function(int) setLineHeight;
  final VoidCallback removeBackgroundImage;
  final VoidCallback redrawImage;
  final VoidCallback clearPage;
  final VoidCallback clearAllPages;
  final VoidCallback redrawAndSave;
  final Future<int> Function() pickPhotos;
  final Future<bool> Function() importPdf;
  final bool canRasterPdf;

  @override
  State<EditorBottomSheet> createState() => _EditorBottomSheetState();
}

class _EditorBottomSheetState extends State<EditorBottomSheet> {
  static const imageBoxFits = <BoxFit>[
    BoxFit.fill,
    BoxFit.cover,
    BoxFit.contain,
  ];

  @override
  Widget build(BuildContext context) {
    final Size pageSize;
    final EditorImage? backgroundImage;
    if (widget.currentPageIndex != null) {
      final page = widget.coreInfo.pages[widget.currentPageIndex!];
      pageSize = page.size;
      backgroundImage = page.backgroundImage;
    } else {
      pageSize = EditorPage.defaultSize;
      backgroundImage = null;
    }

    final previewSize = Size(
      CanvasBackgroundPreview.fixedWidth,
      pageSize.height / pageSize.width * CanvasBackgroundPreview.fixedWidth,
    );

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        // Enable drag scrolling on all devices (including mouse)
        dragDevices: PointerDeviceKind.values.toSet(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [
                ElevatedButton(
                  onPressed: widget.coreInfo.isNotEmpty ? () {
                    widget.clearPage();
                    Navigator.pop(context);
                  } : null,
                  child: Wrap(
                    children: [
                      const Icon(Icons.cleaning_services),
                      const SizedBox(width: 8),
                      Text(t.editor.menu.clearPage(
                        page: widget.currentPageIndex == null
                            ? '?'
                            : widget.currentPageIndex! + 1,
                        totalPages: widget.coreInfo.pages.length,
                      )),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: widget.coreInfo.isNotEmpty ? () {
                    widget.clearAllPages();
                    Navigator.pop(context);
                  } : null,
                  child: Wrap(
                    children: [
                      const Icon(Icons.cleaning_services),
                      const SizedBox(width: 8),
                      Text(t.editor.menu.clearAllPages),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (backgroundImage != null) ...[
              Text(
                t.editor.menu.backgroundImageFit,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: previewSize.height,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageBoxFits.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final boxFit = imageBoxFits[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () => setState(() {
                        backgroundImage?.backgroundFit = boxFit;
                        widget.redrawAndSave();
                      }),
                      child: Stack(
                        children: [
                          CanvasBackgroundPreview(
                            selected: backgroundImage?.backgroundFit == boxFit,
                            invert: widget.invert,
                            backgroundColor: widget.coreInfo.backgroundColor ?? InnerCanvas.defaultBackgroundColor,
                            backgroundPattern: widget.coreInfo.backgroundPattern,
                            backgroundImage: backgroundImage,
                            overrideBoxFit: boxFit,
                            pageSize: pageSize,
                            lineHeight: widget.coreInfo.lineHeight,
                          ),
                          Positioned(
                            bottom: previewSize.height * 0.1,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: _PermanentTooltip(
                                text: boxFit.localizedName,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              CanvasImageDialog(
                filePath: widget.coreInfo.filePath,
                image: backgroundImage,
                redrawImage: () => setState(() {
                  widget.redrawImage();
                }),
                isBackground: true,
                toggleAsBackground: widget.removeBackgroundImage,
                singleRow: true,
              ),
              const SizedBox(height: 16),
            ],
            Text(
              t.editor.menu.backgroundPattern,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: previewSize.height,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: CanvasBackgroundPattern.values.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final backgroundPattern = CanvasBackgroundPattern.values[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () => setState(() {
                      widget.setBackgroundPattern(backgroundPattern);
                    }),
                    child: Stack(
                      children: [
                        CanvasBackgroundPreview(
                          selected: widget.coreInfo.backgroundPattern == backgroundPattern,
                          invert: widget.invert,
                          backgroundColor: widget.coreInfo.backgroundColor ?? InnerCanvas.defaultBackgroundColor,
                          backgroundPattern: backgroundPattern,
                          backgroundImage: null, // focus on background pattern
                          pageSize: pageSize,
                          lineHeight: widget.coreInfo.lineHeight,
                        ),
                        Positioned(
                          bottom: previewSize.height * 0.1,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: _PermanentTooltip(
                              text: CanvasBackgroundPattern.localizedName(backgroundPattern),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              t.editor.menu.lineHeight,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              t.editor.menu.lineHeightDescription,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Row(
              children: [
                Text(widget.coreInfo.lineHeight.toString()),
                Expanded(
                  child: Slider(
                    value: widget.coreInfo.lineHeight.toDouble(),
                    min: 20,
                    max: 100,
                    divisions: 8,
                    onChanged: (double value) => setState(() {
                      widget.setLineHeight(value.toInt());
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              t.editor.menu.import,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Wrap(
              spacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    int photosPicked = await widget.pickPhotos();
                    if (photosPicked > 0) {
                      if (!mounted) return;
                      Navigator.pop(context);
                    }
                  },
                  child: Text(t.editor.toolbar.photo),
                ),
                if (widget.canRasterPdf) ElevatedButton(
                  onPressed: () async {
                    bool pdfImported = await widget.importPdf();
                    if (pdfImported) {
                      if (!mounted) return;
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('PDF'),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _PermanentTooltip extends StatelessWidget {
  const _PermanentTooltip({
    // ignore: unused_element
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colorScheme.surface.withOpacity(0.8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          text,
          textAlign: TextAlign.center,
          textWidthBasis: TextWidthBasis.longestLine,
          style: TextStyle(
            color: colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
