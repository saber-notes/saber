import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/i18n/strings.g.dart';

class NewNoteButton extends StatefulWidget {
  @override
  State<NewNoteButton> createState() => _NewNoteButtonState();
  
  const NewNoteButton({
    super.key,

    required this.isDialOpen,
    required this.cupertino,
    this.path
  });

  final ValueNotifier<bool> isDialOpen;
  final bool cupertino;
  final String? path;
}

class _NewNoteButtonState extends State<NewNoteButton>{
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
        spacing: 3,
        mini: true,
        openCloseDial: widget.isDialOpen,
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
              if(widget.path == null){
                context.push(RoutePaths.edit);
              }
              else{
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
              if (filePath == null) return;

              if (filePath.endsWith('.sbn')){
                FileManager.importFile(filePath, true);
              } else if (filePath.endsWith('.sbn2')){
                FileManager.importFile(filePath, false);
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(t.home.invalidFormat),
                  ));
                }
              }
            },
          ),
        ],
      );
  }
}
