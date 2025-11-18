import 'dart:async';
import 'dart:typed_data';

import 'package:pdfrx/pdfrx.dart';

class PdfDocumentCache {
  final Map<String, FutureOr<PdfDocument>> _cache = {};

  /// Loads a PDF document from [filePath].
  /// If the bytes are provided, they are used instead of reading from disk.
  FutureOr<PdfDocument> load(String filePath, {Uint8List? pdfBytes}) {
    return _cache[filePath] ??= _loadCacheMiss(filePath, pdfBytes: pdfBytes);
  }

  Future<PdfDocument> _loadCacheMiss(
    String filePath, {
    Uint8List? pdfBytes,
  }) async {
    final document = pdfBytes == null
        ? PdfDocument.openFile(filePath, useProgressiveLoading: true)
        : PdfDocument.openData(
            pdfBytes,
            useProgressiveLoading: true,
            sourceName: filePath,
          );
    _cache[filePath] = document;
    return document;
  }

  void dispose() {
    for (final documentFuture in _cache.values) {
      Future.value(documentFuture).then((document) => document.dispose());
    }
    _cache.clear();
  }
}
