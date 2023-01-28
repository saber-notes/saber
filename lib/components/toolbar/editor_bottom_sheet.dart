import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/canvas_background_preview.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
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
    required this.clearPage,
    required this.clearAllPages,
    required this.redrawAndSave,
  });

  final bool invert;
  final EditorCoreInfo coreInfo;
  final int? currentPageIndex;
  final void Function(String) setBackgroundPattern;
  final void Function(int) setLineHeight;
  final VoidCallback clearPage;
  final VoidCallback clearAllPages;
  final VoidCallback redrawAndSave;

  @override
  State<EditorBottomSheet> createState() => _EditorBottomSheetState();
}

class _EditorBottomSheetState extends State<EditorBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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

    return Material(
      color: colorScheme.surface,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: !widget.coreInfo.isEmpty ? TextButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                    ) : null,
                    onPressed: !widget.coreInfo.isEmpty ? () {
                      widget.clearPage();
                      Navigator.pop(context);
                    } : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AdaptiveIcon(
                          icon: Icons.delete,
                          cupertinoIcon: CupertinoIcons.delete,
                        ),
                        const SizedBox(width: 8),
                        Text(t.editor.menu.clearPage),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    style: !widget.coreInfo.isEmpty ? TextButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                    ) : null,
                    onPressed: !widget.coreInfo.isEmpty ? () {
                      widget.clearAllPages();
                      Navigator.pop(context);
                    } : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AdaptiveIcon(
                          icon: Icons.delete_sweep,
                          cupertinoIcon: CupertinoIcons.delete_solid,
                        ),
                        const SizedBox(width: 8),
                        Text(t.editor.menu.clearAllPages),
                      ],
                    )
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ListTile(
              title: Text(t.editor.menu.lineHeight),
              subtitle: Text(t.editor.menu.lineHeightDescription),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.coreInfo.lineHeight.toString()),
                  SizedBox(
                    width: 200,
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
            ),
            const SizedBox(height: 16),
            if (backgroundImage != null) ...[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      tooltip: t.editor.menu.removeBgImage,
                      icon: const AdaptiveIcon(
                        icon: Icons.hide_image,
                        cupertinoIcon: CupertinoIcons.clear_fill,
                      ),
                    ),
                    const SizedBox(width: 8),

                    for (final BoxFit boxFit in [
                      BoxFit.fill,
                      BoxFit.cover,
                      BoxFit.contain,
                    ]) ...[
                      InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () => setState(() {
                          backgroundImage?.backgroundFit = boxFit;
                          widget.redrawAndSave();
                        }),
                        child: Tooltip(
                          message: boxFit.localizedName,
                          child: CanvasBackgroundPreview(
                            selected: backgroundImage.backgroundFit == boxFit,
                            invert: widget.invert,
                            backgroundColor: widget.coreInfo.backgroundColor ?? InnerCanvas.defaultBackgroundColor,
                            backgroundPattern: widget.coreInfo.backgroundPattern,
                            backgroundImage: backgroundImage,
                            overrideBoxFit: boxFit,
                            pageSize: pageSize,
                            lineHeight: widget.coreInfo.lineHeight,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final String backgroundPattern in CanvasBackgroundPatterns.all) ...[
                    InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () => setState(() {
                        widget.setBackgroundPattern(backgroundPattern);
                      }),
                      child: Tooltip(
                        message: CanvasBackgroundPatterns.localizedName(backgroundPattern),
                        child: CanvasBackgroundPreview(
                          selected: widget.coreInfo.backgroundPattern == backgroundPattern,
                          invert: widget.invert,
                          backgroundColor: widget.coreInfo.backgroundColor ?? InnerCanvas.defaultBackgroundColor,
                          backgroundPattern: backgroundPattern,
                          backgroundImage: null, // focus on background pattern
                          pageSize: pageSize,
                          lineHeight: widget.coreInfo.lineHeight,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
