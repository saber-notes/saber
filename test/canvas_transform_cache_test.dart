import 'package:flutter/material.dart' show Matrix4;
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/canvas_gesture_detector.dart';

final List<CanvasTransformCacheItem> samples = [
  CanvasTransformCacheItem('file0', Matrix4.rotationZ(0)),
  CanvasTransformCacheItem('file1', Matrix4.rotationZ(0.1)),
  CanvasTransformCacheItem('file2', Matrix4.rotationZ(0.2)),
  CanvasTransformCacheItem('file3', Matrix4.rotationZ(0.3)),
  CanvasTransformCacheItem('file4', Matrix4.rotationZ(0.4)),
  CanvasTransformCacheItem('file5', Matrix4.rotationZ(0.5)),
];

void main() {
  test('Test CanvasTransformCache data structure', () {
    // no items should be in the cache
    for (final sample in samples) {
      expect(CanvasTransformCache.get(sample.filePath), isNull);
    }

    // add first item
    CanvasTransformCache.add(samples[0].filePath, samples[0].transform);
    expect(CanvasTransformCache.get(samples[0].filePath), isNotNull);
    expect(CanvasTransformCache.get(samples[0].filePath)!.transform, samples[0].transform);

    // update first item
    CanvasTransformCache.add(samples[0].filePath, samples[1].transform);
    expect(CanvasTransformCache.get(samples[0].filePath), isNotNull);
    expect(CanvasTransformCache.get(samples[0].filePath)!.transform, samples[1].transform);

    // add the rest of the items
    for (final sample in samples.skip(1)) {
      expect(CanvasTransformCache.get(sample.filePath), isNull);
      CanvasTransformCache.add(sample.filePath, sample.transform);
    }

    // exceeded max cache size, so the first item should be removed
    expect(CanvasTransformCache.get(samples[0].filePath), isNull);
    // the rest of the items should be in the cache
    for (final sample in samples.skip(1)) {
      expect(CanvasTransformCache.get(sample.filePath), isNotNull);
      expect(CanvasTransformCache.get(sample.filePath)!.transform, sample.transform);
    }

    // clear items
    CanvasTransformCache.clear();
    for (final sample in samples) {
      expect(CanvasTransformCache.get(sample.filePath), isNull);
    }
  });
}
