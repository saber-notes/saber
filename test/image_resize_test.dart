import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/_editor_image.dart';

void main() {
  test('Test resized image dimensions', () {
    Size resized;

    resized = EditorImage.resize(const Size(100, 100), const Size(100, 100));
    expect(resized.width, 100);
    expect(resized.height, 100);

    resized = EditorImage.resize(const Size(100, 100), const Size(200, 200));
    expect(resized.width, 100);
    expect(resized.height, 100);

    resized = EditorImage.resize(const Size(100, 100), const Size(50, 50));
    expect(resized.width, 50);
    expect(resized.height, 50);

    resized = EditorImage.resize(const Size(100, 100), const Size(50, 100));
    expect(resized.width, 50);
    expect(resized.height, 50);

    resized = EditorImage.resize(const Size(100, 100), const Size(100, 50));
    expect(resized.width, 50);
    expect(resized.height, 50);

    resized = EditorImage.resize(const Size(100, 100), const Size(200, 50));
    expect(resized.width, 50);
    expect(resized.height, 50);

    resized = EditorImage.resize(const Size(100, 100), Size.zero);
    expect(resized.width, 0);
    expect(resized.height, 0);

    resized = EditorImage.resize(const Size(10, 1000), const Size(100, 100));
    expect(resized.width, 1);
    expect(resized.height, 100);
  });
}
