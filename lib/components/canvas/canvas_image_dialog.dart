import 'dart:convert';

import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saber/components/canvas/image/editor_image.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

class CanvasImageDialog extends StatefulWidget {
  const CanvasImageDialog({
    super.key,
    required this.filePath,
    required this.image,
    required this.redrawImage,
    required this.isBackground,
    required this.toggleAsBackground,
    this.singleRow = false,
  });

  final String filePath;
  final EditorImage image;
  final VoidCallback redrawImage;

  final bool isBackground;
  final VoidCallback? toggleAsBackground;

  final bool singleRow;

  @override
  State<CanvasImageDialog> createState() => _CanvasImageDialogState();
}

class _CanvasImageDialogState extends State<CanvasImageDialog> {
  void setInvertible([bool? value]) => setState(() {
        widget.image.invertible = value ?? !widget.image.invertible;
        widget.image.onMiscChange?.call();
        widget.redrawImage();
      });

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final cupertino =
        platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;

    final children = <Widget>[
      MergeSemantics(
        child: _CanvasImageDialogItem(
          onTap: Prefs.editorAutoInvert.value ? setInvertible : null,
          title: t.editor.imageOptions.invertible,
          child: Switch.adaptive(
            value: widget.image.invertible,
            onChanged: Prefs.editorAutoInvert.value ? setInvertible : null,
            thumbIcon: WidgetStateProperty.all(widget.image.invertible
                ? const Icon(Icons.invert_colors)
                : const Icon(Icons.invert_colors_off)),
          ),
        ),
      ),
      _CanvasImageDialogItem(
        onTap: () async {
          final String filePathSanitized =
              widget.filePath.replaceAll(RegExp(r'[^a-zA-Z\d]'), '_');
          final String imageFileName =
              'image$filePathSanitized${widget.image.id}${widget.image.extension}';
          final List<int> bytes;
          switch (widget.image) {
            case PdfEditorImage image:
              if (!image.loadedIn) await image.loadIn();
              bytes = image.pdfBytes!;
            case SvgEditorImage image:
              bytes = switch (image.svgLoader) {
                (SvgStringLoader loader) =>
                  utf8.encode(loader.provideSvg(null)),
                (SvgFileLoader loader) => await loader.file.readAsBytes(),
                (_) => throw ArgumentError.value(
                    image.svgLoader, 'svgLoader', 'Unknown SVG loader type'),
              };
            case PngEditorImage image:
              if (image.imageProvider is MemoryImage) {
                bytes = (image.imageProvider as MemoryImage).bytes;
              } else if (image.imageProvider is FileImage) {
                bytes =
                    await (image.imageProvider as FileImage).file.readAsBytes();
              } else {
                throw ArgumentError.value(image.imageProvider, 'imageProvider',
                    'Unknown image provider type');
              }
          }
          if (!context.mounted) return;
          FileManager.exportFile(imageFileName, bytes,
              isImage: true, context: context);
          Navigator.of(context).pop();
        },
        title: t.editor.imageOptions.download,
        child: const AdaptiveIcon(
          icon: Icons.download,
          cupertinoIcon: CupertinoIcons.arrow_down_circle_fill,
        ),
      ),
      _CanvasImageDialogItem(
        onTap: () {
          widget.toggleAsBackground?.call();
          Navigator.of(context).pop();
        },
        title: widget.isBackground
            ? t.editor.imageOptions.removeAsBackground
            : t.editor.imageOptions.setAsBackground,
        child: const AdaptiveIcon(
          icon: Icons.wallpaper,
          cupertinoIcon: CupertinoIcons.photo_fill_on_rectangle_fill,
        ),
      ),
      _CanvasImageDialogItem(
        onTap: () {
          widget.image.onDeleteImage?.call(widget.image);
          widget.redrawImage();
          Navigator.of(context).pop();
        },
        title: t.editor.imageOptions.delete,
        child: const AdaptiveIcon(
          icon: Icons.delete,
          cupertinoIcon: CupertinoIcons.trash_fill,
        ),
      ),
    ];

    final gridView = GridView.count(
      crossAxisCount: widget.singleRow ? children.length : 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      shrinkWrap: true,
      children: children,
    );
    // issues with intrinsic sizes with each type of dialog
    if (cupertino) {
      return AspectRatio(
        aspectRatio: widget.singleRow ? children.length / 1 : 2,
        child: gridView,
      );
    } else {
      return SizedBox(
        width: 250,
        child: gridView,
      );
    }
  }
}

class _CanvasImageDialogItem extends StatelessWidget {
  const _CanvasImageDialogItem({
    // ignore: unused_element
    super.key,
    required this.onTap,
    required this.title,
    required this.child,
  });

  final VoidCallback? onTap;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: colorScheme.primary.withOpacity(0.05),
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            children: [
              Expanded(child: child),
              Text(
                title,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
