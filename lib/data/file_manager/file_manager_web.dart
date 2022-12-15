// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;
import 'dart:typed_data';

/// https://stackoverflow.com/a/60237118/
Future fmExportFile(String fileName, Uint8List bytes, {bool isImage = false}) async {
  final blob = html.Blob([bytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);

  final anchor = html.document.createElement('a') as html.AnchorElement
    ..style.display = 'none'
    ..href = url
    ..download = fileName;
  html.document.body?.children.add(anchor);

  anchor.click();

  html.document.body?.children.remove(anchor);
  html.Url.revokeObjectUrl(url);
}
