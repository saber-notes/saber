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
class TranslationsSl extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsSl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.sl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <sl>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsSl _root = this; // ignore: unused_field

	@override 
	TranslationsSl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsSl(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonSl common = _TranslationsCommonSl._(_root);
	@override late final _TranslationsHomeSl home = _TranslationsHomeSl._(_root);
	@override late final _TranslationsSentrySl sentry = _TranslationsSentrySl._(_root);
	@override late final _TranslationsSettingsSl settings = _TranslationsSettingsSl._(_root);
}

// Path: common
class _TranslationsCommonSl extends TranslationsCommonEn {
	_TranslationsCommonSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get done => 'Končaj';
	@override String get continueBtn => 'Nadaljuj';
	@override String get cancel => 'Prekliči';
}

// Path: home
class _TranslationsHomeSl extends TranslationsHomeEn {
	_TranslationsHomeSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsSl tabs = _TranslationsHomeTabsSl._(_root);
	@override late final _TranslationsHomeTitlesSl titles = _TranslationsHomeTitlesSl._(_root);
	@override late final _TranslationsHomeTooltipsSl tooltips = _TranslationsHomeTooltipsSl._(_root);
	@override late final _TranslationsHomeCreateSl create = _TranslationsHomeCreateSl._(_root);
	@override String get welcome => 'Dobrodošli v Saber';
	@override String get invalidFormat => 'Datoteka, ki ste jo izbrali, ni podprta. Prosimo, izberite datoteko sbn, sbn2, sba ali pdf.';
	@override String get noFiles => 'Ni najdenih datotek';
	@override String get noPreviewAvailable => 'Na voljo ni predogleda';
	@override String get createNewNote => 'Pritisnite + gumb za novo beležko';
	@override String get backFolder => 'Pojdi nazaj na prejšnjo mapo';
	@override late final _TranslationsHomeNewFolderSl newFolder = _TranslationsHomeNewFolderSl._(_root);
	@override late final _TranslationsHomeRenameNoteSl renameNote = _TranslationsHomeRenameNoteSl._(_root);
	@override late final _TranslationsHomeMoveNoteSl moveNote = _TranslationsHomeMoveNoteSl._(_root);
	@override String get deleteNote => 'Izbriši beležko';
	@override late final _TranslationsHomeRenameFolderSl renameFolder = _TranslationsHomeRenameFolderSl._(_root);
	@override late final _TranslationsHomeDeleteFolderSl deleteFolder = _TranslationsHomeDeleteFolderSl._(_root);
}

// Path: sentry
class _TranslationsSentrySl extends TranslationsSentryEn {
	_TranslationsSentrySl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSentryConsentSl consent = _TranslationsSentryConsentSl._(_root);
}

// Path: settings
class _TranslationsSettingsSl extends TranslationsSettingsEn {
	_TranslationsSettingsSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesSl prefCategories = _TranslationsSettingsPrefCategoriesSl._(_root);
	@override late final _TranslationsSettingsPrefLabelsSl prefLabels = _TranslationsSettingsPrefLabelsSl._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsSl prefDescriptions = _TranslationsSettingsPrefDescriptionsSl._(_root);
}

// Path: home.tabs
class _TranslationsHomeTabsSl extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get home => 'Domov';
	@override String get browse => 'Brskaj';
	@override String get whiteboard => 'Tabla';
	@override String get settings => 'Nastavaitve';
}

// Path: home.titles
class _TranslationsHomeTitlesSl extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get home => 'Nedavne beležke';
	@override String get browse => 'Brskaj';
	@override String get whiteboard => 'Tabla';
	@override String get settings => 'Nastavitve';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsSl extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nova beležka';
	@override String get showUpdateDialog => 'Pokaži posodobitve';
	@override String get exportNote => 'Izvozi beležko';
}

// Path: home.create
class _TranslationsHomeCreateSl extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nova beležka';
	@override String get importNote => 'Uvozi beležko';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderSl extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Nova mapa';
	@override String get folderName => 'Ime mape';
	@override String get create => 'Ustvari';
	@override String get folderNameEmpty => 'Ime mape ne sme biti prazno';
	@override String get folderNameContainsSlash => 'Ime mape ne sme uporabljati poševnice';
	@override String get folderNameExists => 'Mapa že obstaja';
}

// Path: home.renameNote
class _TranslationsHomeRenameNoteSl extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Preimenuj beležko';
	@override String get noteName => 'Ime beležke';
	@override String get rename => 'Preimenuj';
	@override String get noteNameEmpty => 'Ime beležke ne more biti prazno';
	@override String get noteNameExists => 'Beležka s tem imenom že obstaja';
	@override String get noteNameForbiddenCharacters => 'Ime beležke vsebuje nedovoljene znake';
	@override String get noteNameReserved => 'Ime beležke rezervirano';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteSl extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Premakni beležko';
	@override String moveNotes({required Object n}) => 'Premakni ${n} beležk';
	@override String moveName({required Object f}) => 'Premakni ${f}';
	@override String get move => 'Premakni';
	@override String renamedTo({required Object newName}) => 'Beležka bo preimenovana v ${newName}';
	@override String get multipleRenamedTo => 'Naslednje beležke bodo preimenovane';
	@override String numberRenamedTo({required Object n}) => '${n} beležk bo preimenovanih v izogib konfliktom';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderSl extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Preimenuj mapo';
	@override String get folderName => 'Ime mape';
	@override String get rename => 'Preimenuj';
	@override String get folderNameEmpty => 'Ime mape ne more biti prazno';
	@override String get folderNameContainsSlash => 'Ime mape ne more vsebovati poševnice';
	@override String get folderNameExists => 'Mapa s tem imenom že obstaja';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderSl extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Izbriši mapo';
	@override String deleteName({required Object f}) => 'Izbriši ${f}';
	@override String get delete => 'Izbriši';
	@override String get alsoDeleteContents => 'Prav tako pobriši vse beležke znotraj te mape';
}

// Path: sentry.consent
class _TranslationsSentryConsentSl extends TranslationsSentryConsentEn {
	_TranslationsSentryConsentSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pomagaj izboljšati Saber';
	@override late final _TranslationsSentryConsentDescriptionSl description = _TranslationsSentryConsentDescriptionSl._(_root);
	@override late final _TranslationsSentryConsentAnswersSl answers = _TranslationsSentryConsentAnswersSl._(_root);
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesSl extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get general => 'Splošno';
	@override String get writing => 'Pisanje';
	@override String get editor => 'Urejevalnik';
	@override String get performance => 'Zmogljivost';
	@override String get advanced => 'Napredno';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsSl extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Jezik';
	@override String get appTheme => 'Tema aplikacije';
	@override String get platform => 'Vrsta teme';
	@override String get layoutSize => 'Vrsta postavitve';
	@override String get customAccentColor => 'Lastna barva povdarka';
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible pisava';
	@override String get shouldCheckForUpdates => 'Poišči posodobitve za Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Hitrejše posodobitve';
	@override String get allowInsecureConnections => 'Dovoli nezavarovano povezavo';
	@override String get editorToolbarAlignment => 'Položaj orodne vrstice';
	@override String get editorToolbarShowInFullscreen => 'Pokaži orodno vrstico v celozaslonskem načinu';
	@override String get editorAutoInvert => 'Preobrni beležke v temnem načinu';
	@override String get preferGreyscale => 'Bi raje uporabili sivinske barve';
	@override String get maxImageSize => 'Največja velikost slike';
	@override String get autoClearWhiteboardOnExit => 'Samodejno počisti tablo';
	@override String get disableEraserAfterUse => 'Samodejno onemogoči radirko';
	@override String get hideFingerDrawingToggle => 'Skrij stikalo za risanje s prstom';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Samodejno onemogoči risanje s prstom';
	@override String get editorPromptRename => 'Vprašaj me, ali želim preimenovati nove beležke';
	@override String get recentColorsDontSavePresets => 'Ne shrani vnaprej nastavljenih barv med nedavnimi barvami';
	@override String get recentColorsLength => 'Koliko nedavnih barv naj se shrani';
	@override String get printPageIndicators => 'Indikatorji tiskane strani';
	@override String get autosave => 'Samodejno shrani';
	@override String get shapeRecognitionDelay => 'Zakasnitev prepoznavanja oblik';
	@override String get autoStraightenLines => 'Samodejno ravnanje črt';
	@override String get simplifiedHomeLayout => 'Poenostavljena postavitev domačega zaslona';
	@override String get customDataDir => 'Mapa Saber po meri';
	@override String get sentry => 'Poročanje napak';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsSl extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Povečaj berljivost za uporabnike z zmanjšanim vidom';
	@override String get allowInsecureConnections => '(Ni priporočeno) Dovoli, da se Saber poveže s strežniki z lastnoročno podpisanimi/nepreverjenimi certifikati';
	@override String get preferGreyscale => 'Za e-ink zaslone';
	@override String get disableEraserAfterUse => 'Po izhodu iz aplikacije počisti tablo';
	@override String get maxImageSize => 'Večje slike bodo stisnjene';
}

// Path: sentry.consent.description
class _TranslationsSentryConsentDescriptionSl extends TranslationsSentryConsentDescriptionEn {
	_TranslationsSentryConsentDescriptionSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get question => 'Ali želite samodejno poročati o nepričakovanih napakah? To pomaga hitreje prepoznati in odpraviti.';
	@override String get scope => 'Poročila lahko vsebujejo informacije o napaki in vaši napravi. Po najboljših močeh sem poskrbel, da so osebni podatki odstranjeni, vendar lahko nekateri vseeno ostanejo.';
	@override String get currentlyOff => 'Če podate soglasje, bo poročanje o napakah omogočeno po ponovnem zagonu aplikacije.';
	@override String get currentlyOn => 'Če prekličete soglasje, znova zaženite aplikacijo, da onemogočite poročanje o napakah.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Izvedite več na povezavi '),
		link('politika zasebnosti'),
		const TextSpan(text: '.'),
	]);
}

// Path: sentry.consent.answers
class _TranslationsSentryConsentAnswersSl extends TranslationsSentryConsentAnswersEn {
	_TranslationsSentryConsentAnswersSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Da';
	@override String get no => 'Ne';
	@override String get later => 'Vprašaj me kasneje';
}
