import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/canvas/canvas_preview.dart';
import 'package:saber/components/canvas/invert_shader.dart';
import 'package:saber/components/canvas/shader_image.dart';
import 'package:saber/components/home/sync_indicator.dart';
import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/pages/editor/editor.dart';

class PreviewCard extends StatefulWidget {
  PreviewCard({
    required this.filePath,
    required this.toggleSelection,
    required this.selected,
    required this.isAnythingSelected,
  }) : super(key: ValueKey('PreviewCard$filePath'));

  final String filePath;
  final bool selected;
  final bool isAnythingSelected;
  final void Function(String, bool) toggleSelection;

  @override
  State<PreviewCard> createState() => _PreviewCardState();
}

class _PreviewCardState extends State<PreviewCard> {
  final expanded = ValueNotifier(false);
  final thumbnail = _ThumbnailState();
  late final shader = InvertShader.create();

  @override
  void initState() {
    fileWriteSubscription =
        FileManager.fileWriteStream.stream.listen(fileWriteListener);

    expanded.value = widget.selected;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    thumbnail.image = FileImage(
      FileManager.getFile('${widget.filePath}${Editor.extension}.p'),
    );
  }

  StreamSubscription? fileWriteSubscription;
  void fileWriteListener(FileOperation event) {
    if (event.filePath != widget.filePath) return;
    if (event.type == FileOperationType.delete) {
      thumbnail.image = null;
    } else if (event.type == FileOperationType.write) {
      thumbnail.image?.evict();
      thumbnail.markAsChanged();
    } else {
      throw Exception('Unknown file operation type: ${event.type}');
    }
  }

  void _toggleCardSelection() {
    expanded.value = !expanded.value;
    widget.toggleSelection(widget.filePath, expanded.value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final disableAnimations = MediaQuery.disableAnimationsOf(context);
    final transitionDuration =
        Duration(milliseconds: disableAnimations ? 0 : 300);
    final invert =
        theme.brightness == Brightness.dark && Prefs.editorAutoInvert.value;

    Widget card = MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.isAnythingSelected ? _toggleCardSelection : null,
        onSecondaryTap: _toggleCardSelection,
        onLongPress: _toggleCardSelection,
        child: ColoredBox(
          color: colorScheme.primary.withOpacity(0.05),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      AnimatedBuilder(
                        animation: thumbnail,
                        builder: (context, _) => AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: thumbnail.image?.file.existsSync() ?? false
                              ? ShaderImage(
                                  key: ValueKey(thumbnail.updateCount),
                                  shaderEnabled: invert,
                                  shaderBuilder: (image, size) {
                                    shader.setFloat(0, size.width);
                                    shader.setFloat(1, size.height);
                                    shader.setImageSampler(0, image);
                                    return shader;
                                  },
                                  image: thumbnail.image!,
                                )
                              : FittedBox(
                                  child: ClipRect(
                                    child: CanvasPreview.fromFile(
                                      key: ValueKey(
                                          'CanvasPreview${thumbnail.updateCount}'),
                                      filePath: widget.filePath,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      Positioned.fill(
                        left: -1,
                        top: -1,
                        right: -1,
                        bottom: -1,
                        child: ValueListenableBuilder(
                          valueListenable: expanded,
                          builder: (context, expanded, child) =>
                              AnimatedOpacity(
                            opacity: expanded ? 1 : 0,
                            duration: const Duration(milliseconds: 200),
                            child: IgnorePointer(
                              ignoring: !expanded,
                              child: child!,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: _toggleCardSelection,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    colorScheme.surface.withOpacity(0.2),
                                    colorScheme.surface.withOpacity(0.8),
                                    colorScheme.surface.withOpacity(1),
                                  ],
                                ),
                              ),
                              child: ColoredBox(
                                color: colorScheme.primary.withOpacity(0.05),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(widget.filePath
                        .substring(widget.filePath.lastIndexOf('/') + 1)),
                  ),
                ],
              ),
              SyncIndicator(
                filePath: widget.filePath,
              ),
            ],
          ),
        ),
      ),
    );

    return ValueListenableBuilder(
      valueListenable: expanded,
      builder: (context, expanded, _) {
        return OpenContainer(
          closedColor: colorScheme.surface,
          closedShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          closedElevation: expanded ? 4 : 1,
          closedBuilder: (context, action) => card,
          openColor: colorScheme.surface,
          openBuilder: (context, action) => Editor(path: widget.filePath),
          transitionDuration: transitionDuration,
          routeSettings: RouteSettings(
            name: RoutePaths.editFilePath(widget.filePath),
          ),
          onClosed: (_) async {
            thumbnail.image?.evict();
            thumbnail.markAsChanged();

            await Future.delayed(transitionDuration);
            if (!context.mounted) return;
            if (!GoRouterState.of(context)
                .uri
                .toString()
                .startsWith(RoutePaths.prefixOfHome)) return;
            ResponsiveNavbar.setAndroidNavBarColor(theme);
          },
        );
      },
    );
  }

  @override
  void dispose() {
    fileWriteSubscription?.cancel();
    super.dispose();
  }
}

class _ThumbnailState extends ChangeNotifier {
  int updateCount = 0;
  FileImage? _image;

  void markAsChanged() {
    ++updateCount;
    notifyListeners();
  }

  FileImage? get image => _image;
  set image(FileImage? image) {
    _image = image;
    markAsChanged();
  }
}
