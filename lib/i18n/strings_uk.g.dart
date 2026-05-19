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
class TranslationsUk extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsUk({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.uk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <uk>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsUk _root = this; // ignore: unused_field

	@override 
	TranslationsUk $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsUk(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonUk common = _TranslationsCommonUk._(_root);
	@override late final _TranslationsHomeUk home = _TranslationsHomeUk._(_root);
}

// Path: common
class _TranslationsCommonUk extends TranslationsCommonEn {
	_TranslationsCommonUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get done => 'Готово';
	@override String get continueBtn => 'Продовжити';
	@override String get cancel => 'Скасувати';
}

// Path: home
class _TranslationsHomeUk extends TranslationsHomeEn {
	_TranslationsHomeUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsUk tabs = _TranslationsHomeTabsUk._(_root);
	@override late final _TranslationsHomeTooltipsUk tooltips = _TranslationsHomeTooltipsUk._(_root);
}

// Path: home.tabs
class _TranslationsHomeTabsUk extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get home => 'Головна';
	@override String get browse => 'Переглянути';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsUk extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get exportNote => 'Експортувати нотатку';
}
