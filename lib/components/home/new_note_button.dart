import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/navbar/horizontal_navbar.dart';
import 'package:saber/components/theming/saber_theme.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

class NewNoteButton extends StatefulWidget {
  const NewNoteButton({super.key, required this.cupertino, this.path});

  final bool cupertino;
  final String? path;

  @override
  State<NewNoteButton> createState() => _NewNoteButtonState();
}

class _NewNoteButtonState extends State<NewNoteButton> {
  final ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final materialBorderRadius = BorderRadius.circular(16);
    return SpeedDial(
      spacing: 3,
      mini: true,
      openCloseDial: isDialOpen,
      childPadding: const .all(5),
      spaceBetweenChildren: 4,
      switchLabelPosition: Directionality.of(context) == .rtl,
      shape: widget.cupertino
          ? const CircleBorder()
          : RoundedRectangleBorder(borderRadius: materialBorderRadius),
      dialRoot: (context, open, toggleChildren) {
        final platform = Theme.of(context).platform;
        return Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            color: const Color(0xFF0A0A0A), // Obsidian
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFD4AF37), width: 2.0), // Gold
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF2200).withOpacity(0.3), // Scarlet Glow
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ],
          ),
          child: IconButton(
            onPressed: toggleChildren,
            tooltip: 'COMMENCE RITUAL',
            icon: const Icon(Icons.auto_awesome_outlined, color: Color(0xFFD4AF37), size: 32),
          ),
        );
      },
      children: [
        SpeedDialChild(
          child: const Icon(Icons.menu_book_sharp, color: Color(0xFFD4AF37)),
          backgroundColor: const Color(0xFF1A1A1A),
          labelWidget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: const Color(0xFF0A0A0A), border: Border.all(color: const Color(0xFFD4AF37))),
            child: const Text('OPEN NEW VOLUME', style: TextStyle(color: Color(0xFFD4AF37), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
          ),
          onTap: () async {
            if (widget.path == null) {
              context.push(RoutePaths.edit);
            } else {
              final newFilePath = await FileManager.newFilePath(
                '${widget.path}/',
              );
              if (!context.mounted) return;
              context.push(RoutePaths.editFilePath(newFilePath));
            }
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.auto_stories_outlined, color: Color(0xFFD4AF37)),
          backgroundColor: const Color(0xFF1A1A1A),
          labelWidget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: const Color(0xFF0A0A0A), border: Border.all(color: const Color(0xFFD4AF37))),
            child: const Text('INCORPORATE KNOWLEDGE', style: TextStyle(color: Color(0xFFD4AF37), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
          ),
          onTap: () async {
            final result = await FilePicker.platform.pickFiles(
              type: FileType.any,
              allowMultiple: false,
              withData: false,
            );
            if (result == null) return;

            final filePath = result.files.single.path;
            final fileName = result.files.single.name;
            if (filePath == null) return;

            if (filePath.toLowerCase().endsWith('.sbn') ||
                filePath.toLowerCase().endsWith('.sbn2') ||
                filePath.toLowerCase().endsWith('.sba')) {
              final path = await FileManager.importFile(
                filePath,
                '${widget.path ?? ''}/',
              );
              if (path == null) return;
              if (!context.mounted) return;

              context.push(RoutePaths.editFilePath(path));
            } else if (filePath.toLowerCase().endsWith('.pdf')) {
              if (!Editor.canRasterPdf) return;
              if (!mounted) return;

              final fileNameWithoutExtension = fileName.substring(
                0,
                fileName.length - '.pdf'.length,
              );
              final sbnFilePath =
                  await FileManager.suffixFilePathToMakeItUnique(
                    '${widget.path ?? ''}/$fileNameWithoutExtension',
                  );
              if (!context.mounted) return;

              context.push(RoutePaths.editImportPdf(sbnFilePath, filePath));
            } else {
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(t.home.invalidFormat)));
              }
              throw 'Invalid file type';
            }
          },
        ),
      ],
    );
  }
}
