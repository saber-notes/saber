import 'package:stow_codecs/stow_codecs.dart';

enum HomeLayout {
  masonryGrid(fillVertical: false),
  simpleGrid(fillVertical: true);

  const HomeLayout({required this.fillVertical});

  /// Whether the preview card should fill its available vertical space
  final bool fillVertical;

  static const codec = EnumCodec(values);
}
