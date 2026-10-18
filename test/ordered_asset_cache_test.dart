import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/_asset_cache.dart';

void main() {
  group('OrderedAssetCache.add', () {
    test('Files with the same path share one asset', () {
      // PdfEditorImage creates one File per page, all pointing to the same
      // PDF. They must not each become a separate asset.
      final assets = OrderedAssetCache();

      final indices = [
        for (var i = 0; i < 700; i++) assets.add(File('/tmp/book.pdf')),
      ];

      expect(assets.length, 1);
      expect(indices.toSet(), {0});
    });

    test('Files with different paths get different assets', () {
      final assets = OrderedAssetCache();

      expect(assets.add(File('/tmp/a.pdf')), 0);
      expect(assets.add(File('/tmp/b.pdf')), 1);
      expect(assets.add(File('/tmp/a.pdf')), 0);
      expect(assets.length, 2);
    });

    test('Identical byte lists still share one asset', () {
      final assets = OrderedAssetCache();

      expect(assets.add(Uint8List.fromList([1, 2, 3])), 0);
      expect(assets.add(Uint8List.fromList([1, 2, 3])), 0);
      expect(assets.add(Uint8List.fromList([4, 5, 6])), 1);
      expect(assets.length, 2);
    });

    test('A File and a byte list are never merged', () {
      final assets = OrderedAssetCache();

      expect(assets.add(File('/tmp/a.pdf')), 0);
      expect(assets.add(Uint8List.fromList([1, 2, 3])), 1);
      expect(assets.length, 2);
    });
  });
}
