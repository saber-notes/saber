
import 'package:flutter/material.dart';
import 'package:saber/i18n/strings.g.dart';

class ExportBar extends StatelessWidget {
  const ExportBar({
    Key? key,
    required this.toggleExportBar,
    required this.exportAsSbn,
    required this.exportAsPdf,
    required this.exportAsPng,
  }) : super(key: key);

  final VoidCallback toggleExportBar;

  final Future Function()? exportAsSbn;
  final Future Function()? exportAsPdf;
  final Future Function()? exportAsPng;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text(t.editor.toolbar.exportAs),
              const SizedBox(width: 8),

              TextButton(
                onPressed: exportAsSbn == null ? null : () {
                  exportAsSbn?.call().then((_) {
                    toggleExportBar();
                  });
                },
                child: const Text("SBN"),
              ),
              TextButton(
                onPressed: exportAsPdf == null ? null : () {
                  exportAsPdf?.call().then((_) {
                    toggleExportBar();
                  });
                },
                child: const Text("PDF"),
              ),
              TextButton(
                onPressed: exportAsPng == null ? null : () {
                  exportAsPng?.call().then((_) {
                    toggleExportBar();
                  });
                },
                child: const Text("PNG"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
