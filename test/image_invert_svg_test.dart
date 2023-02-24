import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:saber/components/canvas/_editor_image.dart';
import 'package:saber/components/canvas/_svg_editor_image.dart';
import 'package:saber/components/canvas/color_extensions.dart';
import 'package:worker_manager/worker_manager.dart';

void main() {
  group('Test inverting an svg:', () {
    test('fill="___"', () async {
      const svg = '<elem fill="white">...</elem>';
      final inverted = await SvgEditorImage.invertSvgString(svg);
      expect(inverted, '<elem fill="#000">...</elem>');
    });
    test('style="fill: ___"', () async {
      const color = Color(0xFF123456);
      final colorHex = color.toCssString();
      final invertedHex = color.withInversion().toCssString();

      expect(colorHex, '#123456');
      expect(invertedHex, '#a9cbed');

      final svg = '<elem style="fill: $colorHex">...</elem>';
      final inverted = await SvgEditorImage.invertSvgString(svg);
      expect(inverted, '<elem style="fill: $invertedHex">...</elem>');
    });
    test('fill="(translucent hex)"', () async {
      const color = Color(0x80123456);
      final colorHex = color.toCssString();
      final invertedHex = color.withInversion().toCssString();

      expect(colorHex, '#12345680');
      expect(invertedHex, '#a9cbed80');

      final svg = '<elem fill="$colorHex">...</elem>';
      final inverted = await SvgEditorImage.invertSvgString(svg);
      expect(inverted, '<elem fill="$invertedHex">...</elem>');
    });
    test('fill="(translucent rgba)"', () async {
      final colorRgba = const Color(0x80123456)
          .toCssString(format: CssColorString.rgb);
      expect(colorRgba, 'rgba(18,52,86,0.5)');

      /// Using [fromCssColor] to account for rounding errors
      final color = fromCssColor(colorRgba);
      final invertedHex = color.withInversion().toCssString();
      expect(invertedHex, '#a9cbed7f'); // observe that this is 7f, not 80

      final svg = '<elem fill="$colorRgba">...</elem>';
      final inverted = await SvgEditorImage.invertSvgString(svg);
      expect(inverted, '<elem fill="$invertedHex">...</elem>');
    });
    test('fill="none"', () async {
      const svg = '<elem fill="none">...</elem>';
      final inverted = await SvgEditorImage.invertSvgString(svg);
      expect(inverted, svg); // unchanged
    });
    test('fill="transparent"', () async {
      const svg = '<elem fill="transparent">...</elem>';
      final inverted = await SvgEditorImage.invertSvgString(svg);
      expect(inverted, svg); // unchanged
    });
    test('fill="currentColor"', () async {
      const svg = '<elem fill="currentColor">...</elem>';
      final inverted = await SvgEditorImage.invertSvgString(svg);
      expect(inverted, svg); // unchanged
    });
    test('stroke="___"', () async {
      const svg = '<elem stroke="#000">...</elem>';
      final inverted = await SvgEditorImage.invertSvgString(svg);
      expect(inverted, '<elem stroke="#fff">...</elem>');
    });
    test('style="stroke: ___"', () async {
      const svg = '<elem style="stroke: #000;">...</elem>';
      final inverted = await SvgEditorImage.invertSvgString(svg);
      expect(inverted, '<elem style="stroke: #fff;">...</elem>');
    });
    test('color="___"', () async {
      const svg = '<elem color="#000">...</elem>';
      final inverted = await SvgEditorImage.invertSvgString(svg);
      expect(inverted, '<elem color="#fff">...</elem>');
    });
    test('style="color: ___"', () async {
      const svg = '<elem style="color: #000;">...</elem>';
      final inverted = await SvgEditorImage.invertSvgString(svg);
      expect(inverted, '<elem style="color: #fff;">...</elem>');
    });
    test('fill="url(#gradient)"', () async {
      const svg = '<linearGradient id="gradient"><stop stop-color="#ffffff" stop-opacity="0.4"/></linearGradient><elem fill="url(#gradient)">...</elem>';
      final inverted = await SvgEditorImage.invertSvgString(svg);
      expect(inverted, '<linearGradient id="gradient"><stop stop-color="#000" stop-opacity="0.4"/></linearGradient><elem fill="url(#gradient)">...</elem>');
    });

    test('<image xlink:href="data:image/png;base64,...">', () async {
      TestWidgetsFlutterBinding.ensureInitialized();

      final iconAsset = await rootBundle.load('assets/icon/resized/icon-16x16.png');
      final iconBytes = iconAsset.buffer.asUint8List();
      final iconBase64 = base64Encode(iconBytes);

      final iconInvertedBytes = await Executor().execute(
        fun2: EditorImage.invertImageIsolate,
        arg1: iconBytes,
        arg2: '.png',
      );
      expect(iconInvertedBytes, isNotNull, reason: 'Failed to invert image');
      final iconInvertedBase64 = base64Encode(iconInvertedBytes!);

      final svg = '<image xlink:href="data:image/png;base64,$iconBase64" />';
      final inverted = await SvgEditorImage.invertSvgString(svg);
      expect(inverted, '<image xlink:href="data:image/png;base64,$iconInvertedBase64" />');
    });
  });
}
