import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/invert_shader.dart';
import 'package:saber/components/canvas/shader_image.dart';

void main() {
  group('ShaderImage', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    late final FragmentShader shader;
    setUpAll(() async {
      await InvertShader.init();
      shader = InvertShader.create();
    });

    final testImages = Directory('test/image_examples/')
        .listSync()
        .where((e) => e.path.endsWith('.png'))
        .whereType<File>()
        .toList();

    for (final testImage in testImages) {
      var imageName = testImage.path.split('/').last;
      imageName = imageName.substring(0, imageName.lastIndexOf('.'));

      group(imageName, () {
        final imageBytes = testImage.readAsBytesSync();
        final image = MemoryImage(imageBytes);

        for (final boxFit in [BoxFit.fill, BoxFit.cover, BoxFit.contain]) {
          group(boxFit, () {
            for (final invert in <bool?>[null, false, true]) {
              testWidgets(
                  switch (invert) {
                    // images weren't loading without this setup step
                    null => '(setUpAll)',
                    false => '(normal)',
                    true => '(inverted)',
                  }, (tester) async {
                await tester.pumpWidget(FittedBox(
                  child: RepaintBoundary(
                    child: Container(
                      color:
                          (invert ?? true) ? Colors.deepOrange : Colors.orange,
                      width: 500,
                      height: 500,
                      child: ShaderImage(
                        shaderEnabled: invert ?? true,
                        shaderBuilder: (image, size) {
                          shader.setFloat(0, size.width);
                          shader.setFloat(1, size.height);
                          shader.setImageSampler(0, image);
                          return shader;
                        },
                        image: image,
                        fit: boxFit,
                      ),
                    ),
                  ),
                ));

                final context = tester.element(find.byType(ShaderImage));
                await tester.runAsync(() => precacheImage(image, context));
                await tester.pumpAndSettle();

                if (invert == null) return;
                await expectLater(
                  find.byType(ShaderImage),
                  matchesGoldenFile(
                    'image_examples/goldens/'
                    '$imageName'
                    '_${boxFit.name}'
                    '${invert ? '_dark' : '_light'}'
                    '.png',
                  ),
                );
              });
            }
          });
        }
      });
    }
  });
}
