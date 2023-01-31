
import 'package:flutter/material.dart';
import 'package:saber/components/nextcloud/spinning_loading_icon.dart';
import 'package:saber/i18n/strings.g.dart';

class ExportBar extends StatefulWidget {
  const ExportBar({
    super.key,
    required this.toggleExportBar,
    required this.exportAsSbn,
    required this.exportAsPdf,
    required this.exportAsPng,
  });

  final VoidCallback toggleExportBar;

  final Future Function()? exportAsSbn;
  final Future Function()? exportAsPdf;
  final Future Function()? exportAsPng;

  @override
  State<ExportBar> createState() => _ExportBarState();
}

class _ExportBarState extends State<ExportBar> {
  /// The current export function being executed.
  /// If this is null, no export is being executed.
  Future Function()? _currentlyExporting;

  void Function()? _onPressed(Future Function()? exportFunction) {
    if (_currentlyExporting != null) return null;
    if (exportFunction == null) return null;
    return () {
      setState(() => _currentlyExporting = exportFunction);
      exportFunction().then((_) {
        widget.toggleExportBar();
        setState(() => _currentlyExporting = null);
      });
    };
  }
  Widget _buttonChild(Future Function()? exportFunction, String text) {
    if (exportFunction == null || _currentlyExporting != exportFunction) {
      return Text(text);
    } else { // if this is currently exporting, show a loading icon
      return const SpinningLoadingIcon();
    }
  }

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
                onPressed: _onPressed(widget.exportAsSbn),
                child: _buttonChild(widget.exportAsSbn, "SBN"),
              ),
              TextButton(
                onPressed: _onPressed(widget.exportAsPdf),
                child: _buttonChild(widget.exportAsPdf, "PDF"),
              ),
              TextButton(
                onPressed: _onPressed(widget.exportAsPng),
                child: _buttonChild(widget.exportAsPng, "PNG"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
