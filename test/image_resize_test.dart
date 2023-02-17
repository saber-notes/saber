

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as image;
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:worker_manager/worker_manager.dart';

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

    resized = EditorImage.resize(const Size(100, 100), const Size(0, 0));
    expect(resized.width, 0);
    expect(resized.height, 0);

    resized = EditorImage.resize(const Size(10, 1000), const Size(100, 100));
    expect(resized.width, 1);
    expect(resized.height, 100);
  });

  test('Test resized image bytes', () async {
    WidgetsFlutterBinding.ensureInitialized();

    /// 2700x2700 icon png
    final Uint8List original = (await rootBundle.load('assets/icon/icon.png')).buffer.asUint8List();

    // expect size to be 2700x2700
    image.Image? parsedImage = image.decodeImage(original);
    expect(parsedImage, isNotNull);
    expect(parsedImage!.width, 2700);
    expect(parsedImage.height, 2700);

    await _testImageResizeIsolate(original, const Size(100, 100));
    await _testImageResizeIsolate(original, const Size(3000, 3000));
  });
}

Future _testImageResizeIsolate(Uint8List original, Size resized) async {
  Uint8List? bytes = await Executor().execute(fun2: EditorImage.resizeImageIsolate, arg1: original, arg2: resized);
  image.Image? parsedImage = image.decodeImage(bytes!);
  expect(parsedImage, isNotNull);
  expect(parsedImage!.width, resized.width);
  expect(parsedImage.height, resized.height);
}
