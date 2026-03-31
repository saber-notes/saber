import 'dart:async';
import 'dart:math';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/inner_canvas.dart';
import 'package:saber/components/canvas/invert_widget.dart';
import 'package:saber/components/home/sync_indicator.dart';
import 'package:saber/data/extensions/color_extensions.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/is_this_a_test.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/pages/editor/editor.dart';
import 'package:yaru/yaru.dart';

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

  @override
  void initState() {
    fileWriteSubscription = FileManager.fileWriteStream.stream.listen(
      fileWriteListener,
    );

    expanded.value = widget.selected;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final imageFile = FileManager.getFile(
      '${widget.filePath}${Editor.extension}.p',
    );
    if (isThisATest) {
      // Avoid FileImages in tests
      thumbnail.image = imageFile.existsSync()
          ? MemoryImage(imageFile.readAsBytesSync())
          : null;
    } else {
      thumbnail.image = FileImage(imageFile);
    }
  }

  StreamSubscription? fileWriteSubscription;
  void fileWriteListener(FileOperation event) {
    if (event.filePath != widget.filePath) return;
    if (event.type == .delete) {
      thumbnail.image = null;
    } else if (event.type == .write) {
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

  Timer? _refreshThumbnailTimer;
  void _refreshThumbnailAfterDelay() {
    _refreshThumbnailTimer?.cancel();
    _refreshThumbnailTimer = Timer(const Duration(milliseconds: 500), () {
      thumbnail.image?.evict();
      thumbnail.markAsChanged();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final disableAnimations = MediaQuery.disableAnimationsOf(context);
    final transitionDuration = Duration(
      milliseconds: disableAnimations ? 0 : 300,
    );
    final invert = theme.brightness == .dark && stows.editorAutoInvert.value;

    final Widget card = MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.isAnythingSelected ? _toggleCardSelection : null,
        onSecondaryTap: _toggleCardSelection,
        onLongPress: _toggleCardSelection,
        child: Column(
          mainAxisSize: stows.simplifiedHomeLayout.value ? .max : .min,
          children: [
            Flexible(
              fit: stows.simplifiedHomeLayout.value ? .tight : .loose,
              child: Stack(
                children: [
                  Positioned.fill(
                    top: kYaruContainerRadius,
                    left: kYaruFocusBorderWidth,
                    right: kYaruFocusBorderWidth,
                    child: ColoredBox(
                      color: InnerCanvas.defaultBackgroundColor.withInversion(
                        invert,
                      ),
                    ),
                  ),
                  ListenableBuilder(
                    listenable: thumbnail,
                    builder: (context, _) => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: ConstrainedBox(
                        key: ValueKey(thumbnail.updateCount),
                        constraints: const BoxConstraints(
                          minWidth: double.infinity,
                          minHeight: 100,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: kYaruFocusBorderWidth,
                            left: kYaruFocusBorderWidth,
                            right: kYaruFocusBorderWidth,
                          ),
                          child: ClipRRect(
                            borderRadius: const .only(
                              topLeft: .circular(
                                kYaruContainerRadius - kYaruFocusBorderWidth,
                              ),
                              topRight: .circular(
                                kYaruContainerRadius - kYaruFocusBorderWidth,
                              ),
                            ),
                            child: InvertWidget(
                              invert: invert,
                              child: thumbnail.doesImageExist
                                  ? Image(
                                      image: thumbnail.image!,
                                      alignment: .topCenter,
                                      fit: .cover,
                                    )
                                  : const _FallbackThumbnail(),
                            ),
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
                      builder: (context, expanded, child) => AnimatedOpacity(
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
                              begin: .topCenter,
                              end: .bottomCenter,
                              colors: [
                                colorScheme.surface.withValues(alpha: 0.2),
                                colorScheme.surface.withValues(alpha: 0.8),
                                colorScheme.surface.withValues(alpha: 1),
                              ],
                            ),
                          ),
                          child: ColoredBox(
                            color: colorScheme.primary.withValues(alpha: 0.05),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SyncIndicator(filePath: widget.filePath),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                widget.filePath.substring(widget.filePath.lastIndexOf('/') + 1).toUpperCase(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFFD4AF37), // Gold
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );

    final lastModified = FileManager.lastModified(widget.filePath + Editor.extension);
    final ageMinutes = DateTime.now().difference(lastModified).inMinutes;
    final isHot = ageMinutes < 5;
    final isWarm = ageMinutes < 60;
    
    final auraColor = isHot ? const Color(0xFFFF2200) : (isWarm ? const Color(0xFFD4AF37) : Colors.transparent);
    final auraOpacity = isHot ? 0.6 : (isWarm ? 0.2 : 0.0);

    return ValueListenableBuilder(
      valueListenable: expanded,
      builder: (context, expanded, _) {
        return _RitualAura(
          color: auraColor,
          opacity: auraOpacity,
          child: OpenContainer(
            clipBehavior: Clip.none,
            closedColor: const Color(0xFF030303), // Absolute Void
            closedShape: RoundedRectangleBorder(
              side: BorderSide(
                color: expanded
                    ? const Color(0xFFFF2200) // Infernal Focus
                    : (isHot ? const Color(0xFFFF2200) : const Color(0xFFD4AF37).withOpacity(0.35)), // Etched Gold
                width: expanded || isHot ? 2.5 : 1.0,
              ),
              borderRadius: BorderRadius.circular(16), // Ritual radii
            ),
            closedElevation: expanded ? 40 : 2,
            closedBuilder: (context, action) => card,
            openColor: colorScheme.surface,
            openBuilder: (context, action) => Editor(path: widget.filePath),
            transitionDuration: transitionDuration,
            routeSettings: RouteSettings(
              name: RoutePaths.editFilePath(widget.filePath),
            ),
            onClosed: (_) => _refreshThumbnailAfterDelay(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _refreshThumbnailTimer?.cancel();
    fileWriteSubscription?.cancel();
    super.dispose();
  }
}

class _RitualAura extends StatefulWidget {
  final Color color;
  final double opacity;
  final Widget child;

  const _RitualAura({
    required this.color,
    required this.opacity,
    required this.child,
  });

  @override
  State<_RitualAura> createState() => _RitualAuraState();
}

class _RitualAuraState extends State<_RitualAura> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.opacity == 0) return widget.child;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final pulseOffset = _animation.value;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: widget.color.withOpacity(widget.opacity * (0.3 + 0.7 * pulseOffset)),
                blurRadius: 10 + (10 * pulseOffset),
                spreadRadius: 2 + (2 * pulseOffset),
              ),
            ],
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class _FallbackThumbnail extends StatelessWidget {
  const _FallbackThumbnail();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0D0D0D),
        gradient: RadialGradient(
          colors: [const Color(0xFF1A1A1A), const Color(0xFF050505)],
          center: Alignment.center,
          radius: 0.8,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_stories_sharp, color: Color(0xFFD4AF37), size: 54),
            const SizedBox(height: 16),
            const Text(
              'UNWRITTEN TOME',
              style: TextStyle(
                color: Color(0xFFD4AF37),
                fontSize: 10,
                fontWeight: FontWeight.w900,
                letterSpacing: 2.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              'MANIFEST THE UNKNOWN',
              style: TextStyle(
                color: const Color(0xFFD4AF37).withOpacity(0.3),
                fontSize: 7,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ThumbnailState extends ChangeNotifier {
  var updateCount = 0;
  ImageProvider? _image;

  void markAsChanged() {
    ++updateCount;
    notifyListeners();
  }

  ImageProvider? get image => _image;
  set image(ImageProvider? image) {
    _image = image;
    markAsChanged();
  }

  bool get doesImageExist => switch (image) {
    (final FileImage fileImage) => fileImage.file.existsSync(),
    null => false,
    _ => true,
  };
}
