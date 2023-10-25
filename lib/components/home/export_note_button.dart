import 'dart:typed_data';

import 'package:archive/archive_io.dart';
import 'package:bson/bson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:saber/data/editor/editor_core_info.dart';
import 'package:saber/data/editor/editor_exporter.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/i18n/strings.g.dart';

class ExportNoteButton extends StatefulWidget {
  const ExportNoteButton({
    super.key,
    required this.cupertino,
    required this.selectedFiles,
  });

  final bool cupertino;
  final List<String> selectedFiles;

  @override
  State<ExportNoteButton> createState() => _ExportNoteButtonState();
}

class _ExportNoteButtonState extends State<ExportNoteButton>{
  final ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  Future exportFile(List<String> selectedFiles, bool sbn2) async {
    List<ArchiveFile> files = [];
    for (String filePath in selectedFiles) {
      EditorCoreInfo coreInfo = await EditorCoreInfo.loadFromFilePath(filePath);
      if (context.mounted){
        Uint8List content = sbn2
        ? await (await EditorExporter.generatePdf(coreInfo, context)).save()
        : BSON().serialize(coreInfo).byteList;
        String fileName = sbn2
        ? '${coreInfo.filePath.substring(coreInfo.filePath.lastIndexOf('/') + 1)}.pdf'
        : '${coreInfo.filePath.substring(coreInfo.filePath.lastIndexOf('/') + 1)}.sbn2';
        files.add(ArchiveFile(fileName, content.length, content));
      }
    }
    if(selectedFiles.length == 1) {
      await FileManager.exportFile(files[0].name, await files[0].content);
    }
    else {
      Archive archive = Archive();
      for (ArchiveFile pdf in files) {
        archive.addFile(pdf);
      }
      await FileManager.exportFile('${files[0].name}.zip', Uint8List.fromList(ZipEncoder().encode(archive)!));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      spacing: 3,
      mini: true,
      openCloseDial: isDialOpen,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 4,
      dialRoot: (ctx, open, toggleChildren) {
        return IconButton(
          padding: EdgeInsets.zero,
          tooltip: t.home.tooltips.exportNote,
          onPressed: toggleChildren,
          icon: const Icon(Icons.share)
        );
      },
      children: [
        SpeedDialChild(
          child: const Icon(CupertinoIcons.doc_text),
          label: 'PDF',
          onTap: () => exportFile(widget.selectedFiles, true)
        ),
        SpeedDialChild(
          child: const Icon(Icons.note),
          label: 'SBN2',
          onTap: () => exportFile(widget.selectedFiles, false)
        ),
      ],
    );
  }
}