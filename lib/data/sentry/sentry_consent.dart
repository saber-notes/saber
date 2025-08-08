import 'package:stow_codecs/stow_codecs.dart';

enum SentryConsent {
  unknown,
  granted,
  denied;

  static final codec = EnumCodec(values);
}
