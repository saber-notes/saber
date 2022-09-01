
import 'package:flutter/material.dart';
import 'package:saber/data/nextcloud/file_syncer.dart';

class SyncingButton extends StatefulWidget {
  const SyncingButton({super.key});

  @override
  State<SyncingButton> createState() => _SyncingButtonState();
}

class _SyncingButtonState extends State<SyncingButton> {

  @override
  void initState() {
    FileSyncer.filesDone.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  double? getPercentage() {
    if (FileSyncer.filesDone.value == null) return null;

    int done = FileSyncer.filesDone.value!;
    int total = done + FileSyncer.filesToSync;
    if (total == 0) {
      return 1;
    } else {
      return done / total;
    }
  }

  @override
  Widget build(BuildContext context) {
    double? percentage = getPercentage();

    return IconButton(
      onPressed: () {
        FileSyncer.filesDone.value = null; // reset progress indicator
        FileSyncer.startDownloads();
      },
      icon: Stack(
        alignment: Alignment.center,
        children: [
          if ((percentage ?? 0) < 1) CircularProgressIndicator(
            semanticsLabel: 'Syncing progress',
            semanticsValue: '${(percentage ?? 0) * 100}%',
            value: percentage,
          ),
          const Icon(Icons.sync)
        ],
      ),
    );
  }
}
