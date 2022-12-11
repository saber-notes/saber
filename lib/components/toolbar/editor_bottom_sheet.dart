
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/canvas/color_extensions.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/page.dart';
import 'package:saber/i18n/strings.g.dart';

class EditorBottomSheet extends StatefulWidget {
  const EditorBottomSheet({
    super.key,
    required this.invert,
    required this.coreInfo,
    required this.setBackgroundPattern,
    required this.setLineHeight,
    required this.clearPage,
    required this.clearAllPages,
  });

  final bool invert;
  final EditorCoreInfo coreInfo;
  final void Function(String) setBackgroundPattern;
  final void Function(int) setLineHeight;
  final VoidCallback clearPage;
  final VoidCallback clearAllPages;

  @override
  State<EditorBottomSheet> createState() => _EditorBottomSheetState();
}

class _EditorBottomSheetState extends State<EditorBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: IntrinsicHeight(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                            const Icon(Icons.delete),
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
                            const Icon(Icons.delete_sweep),
                            const SizedBox(width: 8),
                            Text(t.editor.menu.clearAllPages),
                          ],
                        )
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
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
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: colorScheme.primary.withOpacity(0.5).withSaturation(widget.coreInfo.backgroundPattern == backgroundPattern ? 1 : 0),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: FittedBox(
                                child: SizedBox(
                                  width: EditorPage.defaultWidth / 4,
                                  height: EditorPage.defaultHeight / 4,
                                  child: CustomPaint(
                                    painter: CanvasBackgroundPainter(
                                      invert: widget.invert,
                                      backgroundColor: widget.coreInfo.backgroundColor ?? InnerCanvas.defaultBackgroundColor,
                                      backgroundPattern: backgroundPattern,
                                      lineHeight: widget.coreInfo.lineHeight,
                                      primaryColor: colorScheme.primary.withSaturation(widget.coreInfo.backgroundPattern == backgroundPattern ? 1 : 0),
                                      secondaryColor: colorScheme.secondary.withSaturation(widget.coreInfo.backgroundPattern == backgroundPattern ? 1 : 0),
                                      preview: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ],
                  ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
