import 'package:flutter/material.dart';

/// {@template RedirectingLocalizationDelegate}
/// A localization delegate that adds support for Esperanto.
///
/// Flutter's built-in translations do not include Esperanto,
/// so we have to redirect it to use English as a fallback to avoid
/// breaking the whole app.
/// {@endtemplate}
class RedirectingLocalizationDelegate<T> extends LocalizationsDelegate<T> {
  /// {@macro RedirectingLocalizationDelegate}
  const RedirectingLocalizationDelegate(this._parent);

  final LocalizationsDelegate<T> _parent;

  static const _englishLocale = Locale('en');

  @override
  bool isSupported(Locale locale) {
    return locale.isEsperanto || _parent.isSupported(locale);
  }

  @override
  Future<T> load(Locale locale) {
    assert(
      T != dynamic,
      'You must specify a type for RedirectingLocalizationDelegate.',
    );
    if (locale.isEsperanto) {
      return _parent.load(_englishLocale);
    }
    return _parent.load(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<T> old) =>
      old is! RedirectingLocalizationDelegate<T> ||
      _parent.shouldReload(old._parent);
}

extension on Locale {
  bool get isEsperanto => languageCode == 'eo';
}
