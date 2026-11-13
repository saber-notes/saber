///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEu extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.eu,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <eu>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	late final TranslationsEu _root = this; // ignore: unused_field

	@override 
	TranslationsEu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEu(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$eu common = _Translations$common$eu._(_root);
}

// Path: common
class _Translations$common$eu extends Translations$common$en {
	_Translations$common$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get done => 'Egina';
	@override String get continueBtn => 'Jarraitu';
	@override String get cancel => 'Ezeztatu';
}
