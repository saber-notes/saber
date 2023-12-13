import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/canvas/invert_shader.dart';
import 'package:saber/components/canvas/shader_sampler.dart';
import 'package:saber/components/home/uploading_indicator.dart';
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
  final thumbnailState = _ThumbnailState();
  late FileImage thumbnailImage;
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
    thumbnailImage = FileImage(
      FileManager.getFile('${widget.filePath}${Editor.extension}.p'),
    );
  }

  StreamSubscription? fileWriteSubscription;
  void fileWriteListener(FileOperation event) {
    if (event.filePath != widget.filePath) return;
    if (event.type == FileOperationType.delete) {
      thumbnailState.hide = true;
    } else if (event.type == FileOperationType.write) {
      thumbnailImage.evict();
      thumbnailState.markAsChanged();
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
    final disableAnimations = MediaQuery.of(context).disableAnimations;
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
                        animation: thumbnailState,
                        builder: (context, _) => AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: thumbnailState.hide
                              ? const SizedBox.shrink()
                              : ShaderSampler(
                                  shaderEnabled: invert,
                                  prepareForSnapshot: () =>
                                      precacheImage(thumbnailImage, context),
                                  shaderBuilder: (image, size) {
                                    shader.setFloat(0, size.width);
                                    shader.setFloat(1, size.height);
                                    shader.setImageSampler(0, image);
                                    return shader;
                                  },
                                  child: Image(
                                    key: ValueKey(thumbnailState.updateCount),
                                    image: thumbnailImage,
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
              UploadingIndicator(
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
          openColor: colorScheme.background,
          openBuilder: (context, action) => Editor(path: widget.filePath),
          transitionDuration: transitionDuration,
          routeSettings: RouteSettings(
            name: RoutePaths.editFilePath(widget.filePath),
          ),
          onClosed: (_) async {
            thumbnailImage.evict();
            thumbnailState.markAsChanged();

            await Future.delayed(transitionDuration);
            if (!mounted) return;
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

  bool _hide = false;

  /// Whether to hide the thumbnail,
  /// i.e. if the note has been deleted.
  bool get hide => _hide;
  set hide(bool value) {
    if (_hide == value) return;
    _hide = value;
    ++updateCount;
    notifyListeners();
  }

  void markAsChanged() {
    ++updateCount;
    notifyListeners();
  }
}
