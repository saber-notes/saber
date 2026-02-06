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
	@override late final _TranslationsLogsSl logs = _TranslationsLogsSl._(_root);
	@override late final _TranslationsLoginSl login = _TranslationsLoginSl._(_root);
	@override late final _TranslationsProfileSl profile = _TranslationsProfileSl._(_root);
	@override late final _TranslationsAppInfoSl appInfo = _TranslationsAppInfoSl._(_root);
	@override late final _TranslationsUpdateSl update = _TranslationsUpdateSl._(_root);
	@override late final _TranslationsEditorSl editor = _TranslationsEditorSl._(_root);
}

// Path: common
class _TranslationsCommonSl extends TranslationsCommonEn {
	_TranslationsCommonSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get done => 'Končano';
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
	@override String get invalidFormat => 'Izbrana datoteka ni podprta. Prosim, izberi datoteko sbn, sbn2, sba ali pdf.';
	@override String get noFiles => 'Ni najdenih datotek';
	@override String get noPreviewAvailable => 'Predogled ni na voljo';
	@override String get createNewNote => 'Dotakni se gumba + za ustvarjanje novega zapiska';
	@override String get backFolder => 'Pojdi nazaj v prejšnjo mapo';
	@override late final _TranslationsHomeNewFolderSl newFolder = _TranslationsHomeNewFolderSl._(_root);
	@override late final _TranslationsHomeRenameNoteSl renameNote = _TranslationsHomeRenameNoteSl._(_root);
	@override late final _TranslationsHomeMoveNoteSl moveNote = _TranslationsHomeMoveNoteSl._(_root);
	@override String get deleteNote => 'Izbriši zapisek';
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
	@override late final _TranslationsSettingsThemeModesSl themeModes = _TranslationsSettingsThemeModesSl._(_root);
	@override late final _TranslationsSettingsLayoutSizesSl layoutSizes = _TranslationsSettingsLayoutSizesSl._(_root);
	@override late final _TranslationsSettingsAccentColorPickerSl accentColorPicker = _TranslationsSettingsAccentColorPickerSl._(_root);
	@override String get systemLanguage => 'Samodejno';
	@override List<String> get axisDirections => [
		'Zgoraj',
		'Desno',
		'Spodaj',
		'Levo',
	];
	@override late final _TranslationsSettingsResetSl reset = _TranslationsSettingsResetSl._(_root);
	@override String get resyncEverything => 'Ponovno sinhroniziraj vse';
	@override String get openDataDir => 'Odpri mapo Saber';
	@override late final _TranslationsSettingsCustomDataDirSl customDataDir = _TranslationsSettingsCustomDataDirSl._(_root);
	@override String get autosaveDisabled => 'Nikoli';
	@override String get shapeRecognitionDisabled => 'Nikoli';
}

// Path: logs
class _TranslationsLogsSl extends TranslationsLogsEn {
	_TranslationsLogsSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Dnevniki';
	@override String get viewLogs => 'Prikaži dnevnike';
	@override String get debuggingInfo => 'Dnevniki vsebujejo informacije, uporabne za odpravljanje težav in razvoj';
	@override String get noLogs => 'Tukaj ni dnevnikov!';
	@override String get useTheApp => 'Dnevniki se bodo pojavili tukaj, ko boš uporabljal aplikacijo';
}

// Path: login
class _TranslationsLoginSl extends TranslationsLoginEn {
	_TranslationsLoginSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Prijava';
	@override late final _TranslationsLoginFormSl form = _TranslationsLoginFormSl._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Še nimaš računa? '),
		linkToSignup('Prijavi se zdaj'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'Nisi ti? '),
		undoLogin('Izberi drug račun'),
		const TextSpan(text: '.'),
	]);
	@override late final _TranslationsLoginStatusSl status = _TranslationsLoginStatusSl._(_root);
	@override late final _TranslationsLoginNcLoginStepSl ncLoginStep = _TranslationsLoginNcLoginStepSl._(_root);
	@override late final _TranslationsLoginEncLoginStepSl encLoginStep = _TranslationsLoginEncLoginStepSl._(_root);
}

// Path: profile
class _TranslationsProfileSl extends TranslationsProfileEn {
	_TranslationsProfileSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Moj profil';
	@override String get logout => 'Odjavi se';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Uporabljaš ${used} od ${total} (${percent}%)';
	@override String get connectedTo => 'Povezan z';
	@override late final _TranslationsProfileQuickLinksSl quickLinks = _TranslationsProfileQuickLinksSl._(_root);
	@override String get faqTitle => 'Pogosta vprašanja';
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$Sl._(_root),
		_TranslationsProfile$faq$0i1$Sl._(_root),
		_TranslationsProfile$faq$0i2$Sl._(_root),
		_TranslationsProfile$faq$0i3$Sl._(_root),
	];
}

// Path: appInfo
class _TranslationsAppInfoSl extends TranslationsAppInfoEn {
	_TranslationsAppInfoSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Avtorske pravice © 2022-${buildYear}  Adil Hanney\nTa program je brez kakršnegakoli jamstva. To je prosta programska oprema in vabljeni ste, da jo razširjate pod določenimi pogoji.';
	@override String get debug => 'RAZROŠČEVANJE';
	@override String get sponsorButton => 'Dotakni se tukaj, da me sponzoriraš ali kupiš več prostora za shranjevanje';
	@override String get licenseButton => 'Dotakni se tukaj za več informacij o licenci';
	@override String get privacyPolicyButton => 'Dotakni se tukaj za ogled politike zasebnosti';
}

// Path: update
class _TranslationsUpdateSl extends TranslationsUpdateEn {
	_TranslationsUpdateSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Posodobitev na voljo';
	@override String get updateAvailableDescription => 'Na voljo je nova različica aplikacije:';
	@override String get update => 'Posodobi';
	@override String get downloadNotAvailableYet => 'Prenos za tvojo platformo še ni na voljo. Prosim, preveri kmalu.';
}

// Path: editor
class _TranslationsEditorSl extends TranslationsEditorEn {
	_TranslationsEditorSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarSl toolbar = _TranslationsEditorToolbarSl._(_root);
	@override late final _TranslationsEditorPensSl pens = _TranslationsEditorPensSl._(_root);
	@override late final _TranslationsEditorPenOptionsSl penOptions = _TranslationsEditorPenOptionsSl._(_root);
	@override late final _TranslationsEditorColorsSl colors = _TranslationsEditorColorsSl._(_root);
	@override late final _TranslationsEditorImageOptionsSl imageOptions = _TranslationsEditorImageOptionsSl._(_root);
	@override late final _TranslationsEditorSelectionBarSl selectionBar = _TranslationsEditorSelectionBarSl._(_root);
	@override late final _TranslationsEditorMenuSl menu = _TranslationsEditorMenuSl._(_root);
	@override late final _TranslationsEditorReadOnlyBannerSl readOnlyBanner = _TranslationsEditorReadOnlyBannerSl._(_root);
	@override late final _TranslationsEditorVersionTooNewSl versionTooNew = _TranslationsEditorVersionTooNewSl._(_root);
	@override late final _TranslationsEditorQuillSl quill = _TranslationsEditorQuillSl._(_root);
	@override late final _TranslationsEditorHudSl hud = _TranslationsEditorHudSl._(_root);
	@override String get pages => 'Strani';
	@override String get untitled => 'Neimenovano';
	@override String get needsToSaveBeforeExiting => 'Shranjevanje sprememb... Urejevalnik lahko varno zapustiš, ko bo končano';
}

// Path: home.tabs
class _TranslationsHomeTabsSl extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get home => 'Domov';
	@override String get browse => 'Brskaj';
	@override String get whiteboard => 'Tabla';
	@override String get settings => 'Nastavitve';
}

// Path: home.titles
class _TranslationsHomeTitlesSl extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get home => 'Nedavni zapiski';
	@override String get browse => 'Brskaj';
	@override String get whiteboard => 'Tabla';
	@override String get settings => 'Nastavitve';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsSl extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nov zapisek';
	@override String get showUpdateDialog => 'Prikaži pogovorno okno za posodobitev';
	@override String get exportNote => 'Izvozi zapisek';
}

// Path: home.create
class _TranslationsHomeCreateSl extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nov zapisek';
	@override String get importNote => 'Uvozi zapisek';
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
	@override String get folderNameContainsSlash => 'Ime mape ne sme vsebovati poševnice';
	@override String get folderNameExists => 'Mapa že obstaja';
}

// Path: home.renameNote
class _TranslationsHomeRenameNoteSl extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Preimenuj zapisek';
	@override String get noteName => 'Ime zapiska';
	@override String get rename => 'Preimenuj';
	@override String get noteNameEmpty => 'Ime zapiska ne sme biti prazno';
	@override String get noteNameExists => 'Zapisek s tem imenom že obstaja';
	@override String get noteNameForbiddenCharacters => 'Ime zapiska vsebuje prepovedane znake';
	@override String get noteNameReserved => 'Ime zapiska je rezervirano';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteSl extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Premakni zapisek';
	@override String moveNotes({required Object n}) => 'Premakni ${n} zapiskov';
	@override String moveName({required Object f}) => 'Premakni ${f}';
	@override String get move => 'Premakni';
	@override String renamedTo({required Object newName}) => 'Zapisek bo preimenovan v ${newName}';
	@override String get multipleRenamedTo => 'Naslednji zapiski bodo preimenovani:';
	@override String numberRenamedTo({required Object n}) => '${n} zapiskov bo preimenovanih, da bi se izognili sporom';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderSl extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Preimenuj mapo';
	@override String get folderName => 'Ime mape';
	@override String get rename => 'Preimenuj';
	@override String get folderNameEmpty => 'Ime mape ne sme biti prazno';
	@override String get folderNameContainsSlash => 'Ime mape ne sme vsebovati poševnice';
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
	@override String get alsoDeleteContents => 'Izbriši tudi vse zapiske v tej mapi';
}

// Path: sentry.consent
class _TranslationsSentryConsentSl extends TranslationsSentryConsentEn {
	_TranslationsSentryConsentSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ali želiš pomagati izboljšati Saber?';
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
	@override String get customAccentColor => 'Barva poudarka po meri';
	@override String get hyperlegibleFont => 'Pisava Atkinson Hyperlegible';
	@override String get shouldCheckForUpdates => 'Preveri posodobitve za Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Hitrejše posodobitve';
	@override String get allowInsecureConnections => 'Dovoli nezavarovane povezave';
	@override String get editorToolbarAlignment => 'Položaj orodne vrstice';
	@override String get editorToolbarShowInFullscreen => 'Pokaži orodno vrstico v celozaslonskem načinu';
	@override String get editorAutoInvert => 'Obrni zapiske v temnem načinu';
	@override String get preferGreyscale => 'Raje uporabi sivinske barve';
	@override String get maxImageSize => 'Največja velikost slike';
	@override String get autoClearWhiteboardOnExit => 'Samodejno počisti tablo';
	@override String get disableEraserAfterUse => 'Samodejno onemogoči radirko';
	@override String get hideFingerDrawingToggle => 'Skrij preklop risanja s prstom';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Samodejno onemogoči risanje s prstom';
	@override String get editorPromptRename => 'Pozovi za preimenovanje novih zapiskov';
	@override String get recentColorsDontSavePresets => 'Ne shranjuj prednastavljenih barv v nedavne barve';
	@override String get recentColorsLength => 'Koliko nedavnih barv shraniti';
	@override String get printPageIndicators => 'Tiskaj kazalnike strani';
	@override String get autosave => 'Samodejno shranjevanje';
	@override String get shapeRecognitionDelay => 'Zakasnitev prepoznave oblik';
	@override String get autoStraightenLines => 'Samodejno poravnaj črte';
	@override String get simplifiedHomeLayout => 'Poenostavljena postavitev domače strani';
	@override String get customDataDir => 'Mapa Saber po meri';
	@override String get sentry => 'Poročanje o napakah';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsSl extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Poveča čitljivost za uporabnike s slabšim vidom';
	@override String get allowInsecureConnections => '(Ni priporočljivo) Dovoli Saberju povezovanje s strežniki s samopodpisanimi/nezaupanja vrednimi potrdili';
	@override String get preferGreyscale => 'Za zaslone e-ink';
	@override String get autoClearWhiteboardOnExit => 'Počisti tablo, ko zapustiš aplikacijo';
	@override String get disableEraserAfterUse => 'Po uporabi radirke samodejno preklopi nazaj na pero';
	@override String get maxImageSize => 'Večje slike bodo stisnjene';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingSl hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingSl._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Izklopi risanje s prstom, ko je zaznano pisalo';
	@override String get editorPromptRename => 'Zapiske lahko vedno preimenuješ pozneje';
	@override String get printPageIndicators => 'Prikaži kazalnike strani pri izvozu';
	@override String get autosave => 'Samodejno shrani po kratkem zamiku ali nikoli';
	@override String get shapeRecognitionDelay => 'Kako pogosto posodobiti predogled oblike';
	@override String get autoStraightenLines => 'Poravna dolge črte brez uporabe pisala za oblike';
	@override String get simplifiedHomeLayout => 'Nastavi fiksno višino za vsak predogled zapiska';
	@override String get shouldAlwaysAlertForUpdates => 'Obvesti me o posodobitvah takoj, ko so na voljo';
	@override late final _TranslationsSettingsPrefDescriptionsSentrySl sentry = _TranslationsSettingsPrefDescriptionsSentrySl._(_root);
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesSl extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
	@override String get light => 'Svetla';
	@override String get dark => 'Temna';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesSl extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Samodejno';
	@override String get phone => 'Telefon';
	@override String get tablet => 'Tablica';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerSl extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Izberi barvo';
}

// Path: settings.reset
class _TranslationsSettingsResetSl extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ponastavi to nastavitev?';
	@override String get button => 'Ponastavi';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirSl extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Prekliči';
	@override String get select => 'Izberi';
	@override String get mustBeEmpty => 'Izbrana mapa mora biti prazna';
	@override String get mustBeDoneSyncing => 'Prepričaj se, da je sinhronizacija končana, preden zamenjaš mapo';
	@override String get unsupported => 'Ta funkcija je trenutno samo za razvijalce. Uporaba lahko povzroči izgubo podatkov.';
}

// Path: login.form
class _TranslationsLoginFormSl extends TranslationsLoginFormEn {
	_TranslationsLoginFormSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'S prijavo se strinjaš s '),
		linkToPrivacyPolicy('politiko zasebnosti'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusSl extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Odjavljen';
	@override String get tapToLogin => 'Dotakni se za prijavo z Nextcloudom';
	@override String hi({required Object u}) => 'Živjo, ${u}!';
	@override String get almostDone => 'Skoraj pripravljeno za sinhronizacijo, dotakni se za dokončanje prijave';
	@override String get loggedIn => 'Prijavljen z Nextcloudom';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepSl extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'Izberi, kje želiš shraniti svoje podatke:';
	@override String get saberNcServer => 'Saberjev Nextcloud strežnik';
	@override String get otherNcServer => 'Drug Nextcloud strežnik';
	@override String get serverUrl => 'URL strežnika';
	@override String get loginWithSaber => 'Prijava v Saber';
	@override String get loginWithNextcloud => 'Prijava v Nextcloud';
	@override late final _TranslationsLoginNcLoginStepLoginFlowSl loginFlow = _TranslationsLoginNcLoginStepLoginFlowSl._(_root);
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepSl extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Za zaščito tvojih podatkov vnesi geslo za šifriranje:';
	@override String get newToSaber => 'Si nov v Saberju? Samo vnesi novo geslo za šifriranje.';
	@override String get encPassword => 'Geslo za šifriranje';
	@override String get encFaqTitle => 'Pogosta vprašanja';
	@override String get wrongEncPassword => 'Dešifriranje s podanim geslom ni uspelo. Prosim, poskusi znova vnesti geslo.';
	@override String get connectionFailed => 'Pri povezovanju s strežnikom je prišlo do napake. Prosim, poskusi znova pozneje.';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$Sl._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$Sl._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$Sl._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksSl extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Domača stran strežnika';
	@override String get deleteAccount => 'Izbriši račun';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$Sl extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$Sl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Ali bom izgubil zapiske, če se odjavim?';
	@override String get a => 'Ne. Tvoji zapiski bodo ostali tako na tvoji napravi kot na strežniku. S strežnikom se ne bodo sinhronizirali, dokler se znova ne prijaviš. Prepričaj se, da je sinhronizacija končana, preden se odjaviš, da ne izgubiš podatkov (glej napredek sinhronizacije na domačem zaslonu).';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$Sl extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$Sl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Kako spremenim geslo za Nextcloud?';
	@override String get a => 'Pojdi na spletno stran tvojega strežnika in se prijavi. Nato pojdi na Nastavitve > Varnost > Spremeni geslo. Po spremembi gesla se boš moral odjaviti in znova prijaviti v Saber.';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$Sl extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$Sl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Kako spremenim geslo za šifriranje?';
	@override String get a => '0. Prepričaj se, da je sinhronizacija končana (glej napredek sinhronizacije na domačem zaslonu).\n1. Odjavi se iz Saberja.\n2. Pojdi na spletno stran tvojega strežnika in izbriši mapo \'Saber\'. S tem boš izbrisal vse svoje zapiske s strežnika.\n3. Znova se prijavi v Saber. Pri prijavi lahko izbereš novo geslo za šifriranje.\n4. Ne pozabi se odjaviti in znova prijaviti v Saber tudi na drugih napravah.';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$Sl extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$Sl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Kako lahko izbrišem svoj račun?';
	@override String get a => 'Dotakni se gumba "${_root.profile.quickLinks.deleteAccount}" zgoraj in se po potrebi prijavi.\nČe uporabljaš uradni strežnik Saber, bo tvoj račun izbrisan po 1 tednu odloga. V tem času me lahko kontaktiraš na adilhanney@disroot.org, da prekličeš izbris.\nČe uporabljaš strežnik drugega ponudnika, morda ni možnosti za izbris tvojega računa: za več informacij preberi politiko zasebnosti strežnika.';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarSl extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Preklopi barve (Ctrl C)';
	@override String get select => 'Izberi';
	@override String get toggleEraser => 'Preklopi radirko (Ctrl E)';
	@override String get photo => 'Slike';
	@override String get text => 'Besedilo';
	@override String get toggleFingerDrawing => 'Preklopi risanje s prstom (Ctrl F)';
	@override String get undo => 'Razveljavi';
	@override String get redo => 'Uveljavi';
	@override String get export => 'Izvozi (Ctrl Shift S)';
	@override String get exportAs => 'Izvozi kot:';
	@override String get fullscreen => 'Preklopi celozaslonski način (F11)';
}

// Path: editor.pens
class _TranslationsEditorPensSl extends TranslationsEditorPensEn {
	_TranslationsEditorPensSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Nalivno pero';
	@override String get ballpointPen => 'Kemični svinčnik';
	@override String get highlighter => 'Označevalec';
	@override String get pencil => 'Svinčnik';
	@override String get shapePen => 'Pero za oblike';
	@override String get laserPointer => 'Laserski kazalnik';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsSl extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get size => 'Velikost';
}

// Path: editor.colors
class _TranslationsEditorColorsSl extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Izbirnik barv';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Po meri ${b} ${h}';
	@override String customHue({required Object h}) => 'Po meri ${h}';
	@override String get dark => 'temna';
	@override String get light => 'svetla';
	@override String get black => 'Črna';
	@override String get darkGrey => 'Temno siva';
	@override String get grey => 'Siva';
	@override String get lightGrey => 'Svetlo siva';
	@override String get white => 'Bela';
	@override String get red => 'Rdeča';
	@override String get green => 'Zelena';
	@override String get cyan => 'Cijan';
	@override String get blue => 'Modra';
	@override String get yellow => 'Rumena';
	@override String get purple => 'Vijolična';
	@override String get pink => 'Roza';
	@override String get orange => 'Oranžna';
	@override String get pastelRed => 'Pastelno rdeča';
	@override String get pastelOrange => 'Pastelno oranžna';
	@override String get pastelYellow => 'Pastelno rumena';
	@override String get pastelGreen => 'Pastelno zelena';
	@override String get pastelCyan => 'Pastelno cijan';
	@override String get pastelBlue => 'Pastelno modra';
	@override String get pastelPurple => 'Pastelno vijolična';
	@override String get pastelPink => 'Pastelno roza';
}

// Path: editor.imageOptions
class _TranslationsEditorImageOptionsSl extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Možnosti slike';
	@override String get invertible => 'Obrnljivo';
	@override String get download => 'Prenesi';
	@override String get setAsBackground => 'Nastavi za ozadje';
	@override String get removeAsBackground => 'Odstrani kot ozadje';
	@override String get delete => 'Izbriši';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarSl extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Izbriši';
	@override String get duplicate => 'Podvoji';
}

// Path: editor.menu
class _TranslationsEditorMenuSl extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Počisti stran ${page}/${totalPages}';
	@override String get clearAllPages => 'Počisti vse strani';
	@override String get insertPage => 'Vstavi stran spodaj';
	@override String get duplicatePage => 'Podvoji stran';
	@override String get deletePage => 'Izbriši stran';
	@override String get lineHeight => 'Višina vrstice';
	@override String get lineHeightDescription => 'Prav tako nadzira velikost besedila za tipkane zapiske';
	@override String get lineThickness => 'Debelina črte';
	@override String get lineThicknessDescription => 'Debelina črte ozadja';
	@override String get backgroundImageFit => 'Prilagoditev slike ozadja';
	@override String get backgroundPattern => 'Vzorec ozadja';
	@override String get import => 'Uvozi';
	@override String get watchServer => 'Spremljaj posodobitve na strežniku';
	@override String get watchServerReadOnly => 'Urejanje je onemogočeno med spremljanjem strežnika';
	@override late final _TranslationsEditorMenuBoxFitsSl boxFits = _TranslationsEditorMenuBoxFitsSl._(_root);
	@override late final _TranslationsEditorMenuBgPatternsSl bgPatterns = _TranslationsEditorMenuBgPatternsSl._(_root);
}

// Path: editor.readOnlyBanner
class _TranslationsEditorReadOnlyBannerSl extends TranslationsEditorReadOnlyBannerEn {
	_TranslationsEditorReadOnlyBannerSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Način samo za branje';
	@override String get watchingServer => 'Trenutno spremljaš posodobitve na strežniku. Urejanje v tem načinu je onemogočeno.';
	@override String get corrupted => 'Nalaganje zapiska ni uspelo. Morda je poškodovan ali pa se še vedno prenaša.';
}

// Path: editor.versionTooNew
class _TranslationsEditorVersionTooNewSl extends TranslationsEditorVersionTooNewEn {
	_TranslationsEditorVersionTooNewSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ta zapisek je bil urejen z novejšo različico Saberja';
	@override String get subtitle => 'Urejanje tega zapiska lahko povzroči izgubo nekaterih informacij. Ali želiš to prezreti in vseeno urejati?';
	@override String get allowEditing => 'Dovoli urejanje';
}

// Path: editor.quill
class _TranslationsEditorQuillSl extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Tukaj nekaj vtipkaj...';
}

// Path: editor.hud
class _TranslationsEditorHudSl extends TranslationsEditorHudEn {
	_TranslationsEditorHudSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Odkleni povečavo';
	@override String get lockZoom => 'Zakleni povečavo';
	@override String get unlockSingleFingerPan => 'Omogoči premikanje z enim prstom';
	@override String get lockSingleFingerPan => 'Onemogoči premikanje z enim prstom';
	@override String get unlockAxisAlignedPan => 'Odkleni premikanje na vodoravno ali navpično';
	@override String get lockAxisAlignedPan => 'Zakleni premikanje na vodoravno ali navpično';
}

// Path: sentry.consent.description
class _TranslationsSentryConsentDescriptionSl extends TranslationsSentryConsentDescriptionEn {
	_TranslationsSentryConsentDescriptionSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get question => 'Ali želiš samodejno poročati o nepričakovanih napakah? To mi pomaga hitreje prepoznati in odpraviti težave.';
	@override String get scope => 'Poročila lahko vsebujejo informacije o napaki in tvoji napravi. Potrudil sem se, da bi filtriral osebne podatke, vendar lahko nekateri ostanejo.';
	@override String get currentlyOff => 'Če podaš soglasje, bo poročanje o napakah omogočeno po ponovnem zagonu aplikacije.';
	@override String get currentlyOn => 'Če prekličeš soglasje, prosim, ponovno zaženi aplikacijo, da onemogočiš poročanje o napakah.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Preberi več v '),
		link('politiki zasebnosti'),
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

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingSl extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Preprečuje nenameren preklop';
	@override String get fixedOn => 'Risanje s prstom je fiksno omogočeno';
	@override String get fixedOff => 'Risanje s prstom je fiksno onemogočeno';
}

// Path: settings.prefDescriptions.sentry
class _TranslationsSettingsPrefDescriptionsSentrySl extends TranslationsSettingsPrefDescriptionsSentryEn {
	_TranslationsSettingsPrefDescriptionsSentrySl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get active => 'Aktivno';
	@override String get inactive => 'Neaktivno';
	@override String get activeUntilRestart => 'Aktivno do ponovnega zagona aplikacije';
	@override String get inactiveUntilRestart => 'Neaktivno do ponovnega zagona aplikacije';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowSl extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Prosim, pooblasti Saber za dostop do tvojega Nextcloud računa';
	@override String get followPrompts => 'Prosim, sledi navodilom v vmesniku Nextcloud';
	@override String get browserDidntOpen => 'Prijavna stran se ni odprla? Klikni tukaj';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$Sl extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$Sl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Kaj je geslo za šifriranje? Zakaj uporabljati dve gesli?';
	@override String get a => 'Nextcloud geslo se uporablja za dostop do oblaka. Geslo za šifriranje "premeša" tvoje podatke, preden sploh dosežejo oblak.\nTudi če nekdo pridobi dostop do tvojega Nextcloud računa, tvoji zapiski ostanejo varni in šifrirani z ločenim geslom. To ti zagotavlja drugo raven varnosti za zaščito tvojih podatkov.\nNihče ne more dostopati do tvojih zapiskov na strežniku brez tvojega gesla za šifriranje, vendar to tudi pomeni, da če pozabiš geslo za šifriranje, boš izgubil dostop do svojih podatkov.';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$Sl extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$Sl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Še nisem nastavil gesla za šifriranje. Kje ga dobim?';
	@override String get a => 'Izberi novo geslo za šifriranje in ga vnesi zgoraj.\nSaber bo iz tega gesla samodejno ustvaril tvoje šifrirne ključe.';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$Sl extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$Sl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Ali lahko uporabim isto geslo kot za moj Nextcloud račun?';
	@override String get a => 'Da, vendar imej v mislih, da bi bilo skrbniku strežnika ali komu drugemu lažje dostopati do tvojih zapiskov, če pridobijo dostop do tvojega Nextcloud računa.';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsSl extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Raztegni';
	@override String get cover => 'Prekrij';
	@override String get contain => 'Vsebuj';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsSl extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsSl._(TranslationsSl root) : this._root = root, super.internal(root);

	final TranslationsSl _root; // ignore: unused_field

	// Translations
	@override String get none => 'Prazno';
	@override String get college => 'Visokošolski';
	@override String get collegeRtl => 'Visokošolski (Obratno)';
	@override String get lined => 'Črtasto';
	@override String get grid => 'Mreža';
	@override String get dots => 'Pike';
	@override String get staffs => 'Črtovje';
	@override String get tablature => 'Tablatura';
	@override String get cornell => 'Cornell';
}
