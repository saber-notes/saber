import 'package:flutter/material.dart';
import 'package:saber/i18n/strings.g.dart';

class SelectAllNotesButton extends StatelessWidget {
  const SelectAllNotesButton({
    super.key,
    required this.selectedFiles,
    required this.allFiles,
    required this.selectAll,
    required this.deselectAll,
  });

  final List<String> selectedFiles;
  final List<String> allFiles;
  final void Function() selectAll;
  final void Function() deselectAll;

  bool get areAllFilesSelected {
    for (String file in allFiles) {
      if (!selectedFiles.contains(file)) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      tooltip:
          areAllFilesSelected ? t.home.deselectAllNotes : t.home.selectAllNotes,
      onPressed: () {
        if (areAllFilesSelected)
          deselectAll();
        else
          selectAll();
      },
      icon: Icon(areAllFilesSelected ? Icons.deselect : Icons.select_all),
    );
  }
}
