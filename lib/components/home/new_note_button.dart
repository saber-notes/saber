import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

class NewNoteButton extends StatefulWidget {
  const NewNoteButton({
    super.key,
    required this.cupertino,
    this.path,
  });

  final bool cupertino;
  final String? path;

  @override
  State<NewNoteButton> createState() => _NewNoteButtonState();
}

class _NewNoteButtonState extends State<NewNoteButton>{
  final ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      spacing: 3,
      mini: true,
      openCloseDial: isDialOpen,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 4,
      dialRoot: (ctx, open, toggleChildren) {
        return FloatingActionButton(
          shape: widget.cupertino ? const CircleBorder() : null,
          onPressed: toggleChildren,
          tooltip: t.home.tooltips.newNote,
          child: const Icon(Icons.add)
        );
      },
      children: [
        SpeedDialChild(
          child: const Icon(Icons.create),
          label: t.home.create.newNote,
          onTap: () async {
            if (widget.path == null) {
              context.push(RoutePaths.edit);
            } else{
              final newFilePath = await FileManager.newFilePath('${widget.path}/');
              if (!mounted) return;
              context.push(RoutePaths.editFilePath(newFilePath));
            }
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.note_add),
          label: t.home.create.importNote,
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

            if (filePath.endsWith('.sbn') || filePath.endsWith('.sbn2')) {
              final path = await FileManager.importFile(
                filePath,
                '${widget.path}/',
                filePath.endsWith('.sbn'),
              );
              if (path == null) return;
              if (!mounted) return;
              context.push(RoutePaths.editFilePath(path));
            } else if (filePath.endsWith('.pdf')) {
              if (!Editor.canRasterPdf) return;
              if (!mounted) return;
              
              final fileNameWithoutExtension = fileName.substring(0, fileName.length - '.pdf'.length);
              final sbnFilePath = await FileManager.suffixFilePathToMakeItUnique(
                '${widget.path}/$fileNameWithoutExtension',
                false,
              );
              if (!mounted) return;

              context.push(RoutePaths.editImportPdf(sbnFilePath, filePath));
            } else {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(t.home.invalidFormat),
                ));
              }
              throw 'Invalid file type';
            }
          },
        ),
      ],
    );
  }
}
