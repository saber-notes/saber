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
class TranslationsPl extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.pl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <pl>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsPl _root = this; // ignore: unused_field

	@override 
	TranslationsPl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPl(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonPl common = _TranslationsCommonPl._(_root);
	@override late final _TranslationsHomePl home = _TranslationsHomePl._(_root);
	@override late final _TranslationsSentryPl sentry = _TranslationsSentryPl._(_root);
	@override late final _TranslationsSettingsPl settings = _TranslationsSettingsPl._(_root);
	@override late final _TranslationsLogsPl logs = _TranslationsLogsPl._(_root);
	@override late final _TranslationsLoginPl login = _TranslationsLoginPl._(_root);
	@override late final _TranslationsProfilePl profile = _TranslationsProfilePl._(_root);
	@override late final _TranslationsAppInfoPl appInfo = _TranslationsAppInfoPl._(_root);
	@override late final _TranslationsUpdatePl update = _TranslationsUpdatePl._(_root);
	@override late final _TranslationsEditorPl editor = _TranslationsEditorPl._(_root);
}

// Path: common
class _TranslationsCommonPl extends TranslationsCommonEn {
	_TranslationsCommonPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get done => 'Gotowe';
	@override String get continueBtn => 'Kontynuuj';
	@override String get cancel => 'Anuluj';
}

// Path: home
class _TranslationsHomePl extends TranslationsHomeEn {
	_TranslationsHomePl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsPl tabs = _TranslationsHomeTabsPl._(_root);
	@override late final _TranslationsHomeTitlesPl titles = _TranslationsHomeTitlesPl._(_root);
	@override late final _TranslationsHomeTooltipsPl tooltips = _TranslationsHomeTooltipsPl._(_root);
	@override late final _TranslationsHomeCreatePl create = _TranslationsHomeCreatePl._(_root);
	@override String get welcome => 'Witaj w Saber';
	@override String get invalidFormat => 'Plik który wskazano nie jest wspierany. Proszę wybrać plik w formacie sbn, sbn2, sba, lub pdf.';
	@override String get noFiles => 'Nie znaleziono plików';
	@override String get noPreviewAvailable => 'Podgląd niedostępny';
	@override String get createNewNote => 'Użyj przycisku + aby utworzyć nową notatkę';
	@override String get backFolder => 'Cofnij się do poprzedniego folderu';
	@override late final _TranslationsHomeNewFolderPl newFolder = _TranslationsHomeNewFolderPl._(_root);
	@override late final _TranslationsHomeRenameNotePl renameNote = _TranslationsHomeRenameNotePl._(_root);
	@override late final _TranslationsHomeMoveNotePl moveNote = _TranslationsHomeMoveNotePl._(_root);
	@override String get deleteNote => 'Usuń notatkę';
	@override late final _TranslationsHomeRenameFolderPl renameFolder = _TranslationsHomeRenameFolderPl._(_root);
	@override late final _TranslationsHomeDeleteFolderPl deleteFolder = _TranslationsHomeDeleteFolderPl._(_root);
}

// Path: sentry
class _TranslationsSentryPl extends TranslationsSentryEn {
	_TranslationsSentryPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSentryConsentPl consent = _TranslationsSentryConsentPl._(_root);
}

// Path: settings
class _TranslationsSettingsPl extends TranslationsSettingsEn {
	_TranslationsSettingsPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesPl prefCategories = _TranslationsSettingsPrefCategoriesPl._(_root);
	@override late final _TranslationsSettingsPrefLabelsPl prefLabels = _TranslationsSettingsPrefLabelsPl._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsPl prefDescriptions = _TranslationsSettingsPrefDescriptionsPl._(_root);
	@override late final _TranslationsSettingsThemeModesPl themeModes = _TranslationsSettingsThemeModesPl._(_root);
	@override late final _TranslationsSettingsLayoutSizesPl layoutSizes = _TranslationsSettingsLayoutSizesPl._(_root);
	@override late final _TranslationsSettingsAccentColorPickerPl accentColorPicker = _TranslationsSettingsAccentColorPickerPl._(_root);
	@override String get systemLanguage => 'Auto';
	@override List<String> get axisDirections => [
		'Góra',
		'Prawa',
		'Dół',
		'Lewa',
	];
	@override late final _TranslationsSettingsResetPl reset = _TranslationsSettingsResetPl._(_root);
	@override String get resyncEverything => 'Synchronizuj wszystko';
	@override String get openDataDir => 'Otwórz folder Saber';
	@override late final _TranslationsSettingsCustomDataDirPl customDataDir = _TranslationsSettingsCustomDataDirPl._(_root);
	@override String get autosaveDisabled => 'Nigdy';
	@override String get shapeRecognitionDisabled => 'Nigdy';
}

// Path: logs
class _TranslationsLogsPl extends TranslationsLogsEn {
	_TranslationsLogsPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Logi';
	@override String get viewLogs => 'Wyświetl logi';
	@override String get debuggingInfo => 'Logi zawierają informacje użyteczne do debuggowania i dewelopmentu';
	@override String get noLogs => 'Brak logów!';
	@override String get useTheApp => 'Logi pojawią się tutaj przy używaniu aplikacji';
}

// Path: login
class _TranslationsLoginPl extends TranslationsLoginEn {
	_TranslationsLoginPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Login';
	@override late final _TranslationsLoginFormPl form = _TranslationsLoginFormPl._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Nie masz jeszcze konta? '),
		linkToSignup('Utwórz je teraz'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'To nie Ty? '),
		undoLogin('Wybierz inne konto'),
		const TextSpan(text: '.'),
	]);
	@override late final _TranslationsLoginStatusPl status = _TranslationsLoginStatusPl._(_root);
	@override late final _TranslationsLoginNcLoginStepPl ncLoginStep = _TranslationsLoginNcLoginStepPl._(_root);
	@override late final _TranslationsLoginEncLoginStepPl encLoginStep = _TranslationsLoginEncLoginStepPl._(_root);
}

// Path: profile
class _TranslationsProfilePl extends TranslationsProfileEn {
	_TranslationsProfilePl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mój profil';
	@override String get logout => 'Wyloguj';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Wykorzystujesz ${used} z ${total} (${percent}%)';
	@override String get connectedTo => 'Połączono z';
	@override late final _TranslationsProfileQuickLinksPl quickLinks = _TranslationsProfileQuickLinksPl._(_root);
	@override String get faqTitle => 'Często zadawane pytania (FAQ)';
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$Pl._(_root),
		_TranslationsProfile$faq$0i1$Pl._(_root),
		_TranslationsProfile$faq$0i2$Pl._(_root),
		_TranslationsProfile$faq$0i3$Pl._(_root),
	];
}

// Path: appInfo
class _TranslationsAppInfoPl extends TranslationsAppInfoEn {
	_TranslationsAppInfoPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nTen program jest dostarczany bez jakiejkolwiek gwarancji. Jest to wolne oprogramowanie i możesz je rozpowszechniać pod pewnymi warunkami.';
	@override String get debug => 'DEBUGUJ';
	@override String get sponsorButton => 'Kliknij tutaj aby mnie wesprzeć lub kupić więcej pamięci';
	@override String get licenseButton => 'Kliknij tutaj aby wyświetlić więcej informacji o licencji';
	@override String get privacyPolicyButton => 'Kliknij tutaj aby wyświetlić politykę prywatności';
}

// Path: update
class _TranslationsUpdatePl extends TranslationsUpdateEn {
	_TranslationsUpdatePl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Dostępna aktualizacja';
	@override String get updateAvailableDescription => 'Nowa wersja aplikacji jest dostępna:';
	@override String get update => 'Aktualizuj';
	@override String get downloadNotAvailableYet => 'Pobieranie nie jest jeszcze dostępne dla Twojej platformy. Sprawdź ponownie wkrótce.';
}

// Path: editor
class _TranslationsEditorPl extends TranslationsEditorEn {
	_TranslationsEditorPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarPl toolbar = _TranslationsEditorToolbarPl._(_root);
	@override late final _TranslationsEditorPensPl pens = _TranslationsEditorPensPl._(_root);
	@override late final _TranslationsEditorPenOptionsPl penOptions = _TranslationsEditorPenOptionsPl._(_root);
	@override late final _TranslationsEditorColorsPl colors = _TranslationsEditorColorsPl._(_root);
	@override late final _TranslationsEditorImageOptionsPl imageOptions = _TranslationsEditorImageOptionsPl._(_root);
	@override late final _TranslationsEditorSelectionBarPl selectionBar = _TranslationsEditorSelectionBarPl._(_root);
	@override late final _TranslationsEditorMenuPl menu = _TranslationsEditorMenuPl._(_root);
	@override late final _TranslationsEditorReadOnlyBannerPl readOnlyBanner = _TranslationsEditorReadOnlyBannerPl._(_root);
	@override late final _TranslationsEditorVersionTooNewPl versionTooNew = _TranslationsEditorVersionTooNewPl._(_root);
	@override late final _TranslationsEditorQuillPl quill = _TranslationsEditorQuillPl._(_root);
	@override late final _TranslationsEditorHudPl hud = _TranslationsEditorHudPl._(_root);
	@override String get pages => 'Strony';
	@override String get untitled => 'Bez tytułu';
	@override String get needsToSaveBeforeExiting => 'Zapisywanie twoich zmian... Możesz bezpiecznie zamknąć edytor kiedy się skończy';
}

// Path: home.tabs
class _TranslationsHomeTabsPl extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get home => 'Główna';
	@override String get browse => 'Przeglądaj';
	@override String get whiteboard => 'Tablica';
	@override String get settings => 'Ustawienia';
}

// Path: home.titles
class _TranslationsHomeTitlesPl extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get home => 'Ostatnie notatki';
	@override String get browse => 'Przeglądaj';
	@override String get whiteboard => 'Tablica';
	@override String get settings => 'Ustawienia';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsPl extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nowa notatka';
	@override String get showUpdateDialog => 'Pokaż okno dialogowe aktualizacji';
	@override String get exportNote => 'Eksportuj notatkę';
}

// Path: home.create
class _TranslationsHomeCreatePl extends TranslationsHomeCreateEn {
	_TranslationsHomeCreatePl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nowa notatka';
	@override String get importNote => 'Importuj notatkę';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderPl extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Nowy folder';
	@override String get folderName => 'Nazwa folderu';
	@override String get create => 'Utwórz';
	@override String get folderNameEmpty => 'Nazwa folderu nie może być pusta';
	@override String get folderNameContainsSlash => 'Nazwa folderu nie może zawierać ukośnika';
	@override String get folderNameExists => 'Folder już istnieje';
}

// Path: home.renameNote
class _TranslationsHomeRenameNotePl extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNotePl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Zmień nazwę notatki';
	@override String get noteName => 'Nazwa notatki';
	@override String get rename => 'Zmień nazwę';
	@override String get noteNameEmpty => 'Nazwa notatki nie może być pusta';
	@override String get noteNameExists => 'Notatka o tej nazwie już istnieje';
	@override String get noteNameForbiddenCharacters => 'Nazwa notatki zawiera zabronione symbole';
	@override String get noteNameReserved => 'Nazwa notatki jest zajęta';
}

// Path: home.moveNote
class _TranslationsHomeMoveNotePl extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNotePl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Przenieś notatkę';
	@override String moveNotes({required Object n}) => 'Przenieś ${n} spośród notatek';
	@override String moveName({required Object f}) => 'Przenieś ${f}';
	@override String get move => 'Przenieś';
	@override String renamedTo({required Object newName}) => 'Notatka zmieni nazwę na ${newName}';
	@override String get multipleRenamedTo => 'Następujące notatki zmienią nazwy:';
	@override String numberRenamedTo({required Object n}) => '${n} spośród notatek zmieni nazwy aby uniknąć konfliktów';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderPl extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Zmień nazwę folderu';
	@override String get folderName => 'Nazwa folderu';
	@override String get rename => 'Zmień nazwę';
	@override String get folderNameEmpty => 'Nazwa folderu nie może być pusta';
	@override String get folderNameContainsSlash => 'Nazwa folderu nie może zawierać ukośnika';
	@override String get folderNameExists => 'Folder o takiej nazwie już istnieje';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderPl extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Usuń folder';
	@override String deleteName({required Object f}) => 'Usuń ${f}';
	@override String get delete => 'Usuń';
	@override String get alsoDeleteContents => 'Usuń także wszystkie notatki z tego folderu';
}

// Path: sentry.consent
class _TranslationsSentryConsentPl extends TranslationsSentryConsentEn {
	_TranslationsSentryConsentPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chcesz wesprzeć Saber?';
	@override late final _TranslationsSentryConsentDescriptionPl description = _TranslationsSentryConsentDescriptionPl._(_root);
	@override late final _TranslationsSentryConsentAnswersPl answers = _TranslationsSentryConsentAnswersPl._(_root);
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesPl extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get general => 'Główne';
	@override String get writing => 'Pisanie';
	@override String get editor => 'Edytor';
	@override String get performance => 'Wydajność';
	@override String get advanced => 'Zaawansowane';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsPl extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Język';
	@override String get appTheme => 'Motyw aplikacji';
	@override String get platform => 'Rodzaj motywu';
	@override String get layoutSize => 'Rodzaj układu';
	@override String get customAccentColor => 'Niestandardowy kolor akcentu';
	@override String get hyperlegibleFont => 'Czcionka Atkinson Hyperlegible';
	@override String get shouldCheckForUpdates => 'Sprawdź dostępność aktualizacji Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Szybsze aktualizacje';
	@override String get allowInsecureConnections => 'Zezwól na niezabezpieczone połączenia';
	@override String get editorToolbarAlignment => 'Pozycja przybornika';
	@override String get editorToolbarShowInFullscreen => 'Pokaż przybornik w trybie pełnego ekranu';
	@override String get editorAutoInvert => 'Odwróć kolory notatek w trybie ciemnym';
	@override String get preferGreyscale => 'Preferuj skalę szarości';
	@override String get maxImageSize => 'Maksymalny rozmiar obrazu';
	@override String get autoClearWhiteboardOnExit => 'Automatyczne czyszczenie tablicy';
	@override String get disableEraserAfterUse => 'Automatycznie wyłączaj gumkę';
	@override String get hideFingerDrawingToggle => 'Ukryj przełącznik rysowania palcami';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Automatycznie wyłączaj rysowanie palcami';
	@override String get editorPromptRename => 'Wywołuj zmianę nazwy dla nowych notatek';
	@override String get recentColorsDontSavePresets => 'Nie zapisuj kolorów domyślnych w ostatnich kolorach';
	@override String get recentColorsLength => 'Ilość ostatnich kolorów do przechowywania';
	@override String get printPageIndicators => 'Pokazuj numery stron';
	@override String get autosave => 'Auto-zapis';
	@override String get shapeRecognitionDelay => 'Opóźnienie rozpoznania symbolu';
	@override String get autoStraightenLines => 'Automatycznie prostuj linie';
	@override String get simplifiedHomeLayout => 'Uproszczony widok strony głównej';
	@override String get customDataDir => 'Niestandardowa lokalizacja Saber';
	@override String get sentry => 'Zgłaszanie błędów';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsPl extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Zwiększenie czytelności dla użytkowników słabowidzących';
	@override String get allowInsecureConnections => '(Nie zalecane) Zezwól Saber na połączenie z serwerami używając certyfikatów niezaufanych/z własnym podpisem';
	@override String get preferGreyscale => 'Dla ekranów e-ink';
	@override String get autoClearWhiteboardOnExit => 'Czyści tablice po wyjściu z aplikacji';
	@override String get disableEraserAfterUse => 'Automatycznie przełącza na poprzednie narzędzie po skorzystaniu z gumki';
	@override String get maxImageSize => 'Większe obrazy będą kompresowane';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingPl hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingPl._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Wyłącz rysowanie palcami kiedy rysik jest wykryty';
	@override String get editorPromptRename => 'Zawsze możesz zmienić nazwę notatek później';
	@override String get printPageIndicators => 'Pokazuj numery stron przy eksportowaniu';
	@override String get autosave => 'Auto-zapis co określony czas, lub nigdy';
	@override String get shapeRecognitionDelay => 'Częstotliwość aktualizacji podglądu kształtu';
	@override String get autoStraightenLines => 'Prostuj linie bez potrzeby przełączania na narzędzie tworzenia kształtów';
	@override String get simplifiedHomeLayout => 'Stała wysokość każdego podglądu notatki';
	@override String get shouldAlwaysAlertForUpdates => 'Powiadom mnie o aktualizacjach jak tylko będą dostępne';
	@override late final _TranslationsSettingsPrefDescriptionsSentryPl sentry = _TranslationsSettingsPrefDescriptionsSentryPl._(_root);
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesPl extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get light => 'Jasny';
	@override String get dark => 'Ciemny';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesPl extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Auto';
	@override String get phone => 'Telefon';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerPl extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Wybierz kolor';
}

// Path: settings.reset
class _TranslationsSettingsResetPl extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Zresetować to ustawienie?';
	@override String get button => 'Resetuj';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirPl extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Anuluj';
	@override String get select => 'Wybierz';
	@override String get mustBeEmpty => 'Wybrany folder musi być pusty';
	@override String get mustBeDoneSyncing => 'Upewnij się że synchronizacja została ukończona przed zmianą tego folderu';
	@override String get unsupported => 'Ta opcja jest aktualnie dostępna tylko dla deweloperów. Używanie jej prawdopodobnie doprowadzi do utraty danych.';
}

// Path: login.form
class _TranslationsLoginFormPl extends TranslationsLoginFormEn {
	_TranslationsLoginFormPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Logując się, zgaszasz się na '),
		linkToPrivacyPolicy('Politykę Prywatności'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusPl extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Wylogowano';
	@override String get tapToLogin => 'Wybierz aby zalogować się przez Nextcloud';
	@override String hi({required Object u}) => 'Cześć ${u}!';
	@override String get almostDone => 'Prawie gotowy na synchronizacje, kliknij aby skończyć logowanie';
	@override String get loggedIn => 'Zalogowano przez Nextcloud';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepPl extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'Wybierz gdzie przechowywać twoje dane:';
	@override String get saberNcServer => 'Serwer Nextcloud Saber';
	@override String get otherNcServer => 'Inny serwer Nextcloud';
	@override String get serverUrl => 'Serwer URL';
	@override String get loginWithSaber => 'Zaloguj przez Saber';
	@override String get loginWithNextcloud => 'Zaloguj przez Nextcloud';
	@override late final _TranslationsLoginNcLoginStepLoginFlowPl loginFlow = _TranslationsLoginNcLoginStepLoginFlowPl._(_root);
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepPl extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Aby chronić twoje dane, podaj proszę hasło szyfrowania:';
	@override String get newToSaber => 'Nowy w Saber? Utwórz nowe hasło szyfrowania.';
	@override String get encPassword => 'Hasło szyfrowania';
	@override String get encFaqTitle => 'Często zadawane pytania (FAQ)';
	@override String get wrongEncPassword => 'Odszyfrowywanie przy użyciu podanego hasła nie powiodło się. Spróbuj wpisać je ponownie.';
	@override String get connectionFailed => 'Coś poszło nie tak w trakcie łączenia się z serwerem. Spróbuj ponownie później.';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$Pl._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$Pl._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$Pl._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksPl extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Strona główna serwera';
	@override String get deleteAccount => 'Usuń konto';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$Pl extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$Pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Czy utracę moje notatki jeżeli się wyloguje?';
	@override String get a => 'Nie. Twoje notatki pozostaną zarówno na twoim urządzeniu jak i na serwerze. Nie będą synchronizowane dopóki nie zalogujesz się ponownie. Upewnij się, że synchronizacja została ukończona przed wylogowaniem aby nie utracić żadnych danych (zobacz status synchronizacji na stronie głównej).';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$Pl extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$Pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Jak mogę zmienić hasło do Nextcloud?';
	@override String get a => 'Wejdź na stronę swojego serwera i się zaloguj. Następnie przejdź do Settings > Security > Change password (Ustawienia > Bezpieczeństwo>Zmiana hasła). Po zmianie hasła należy wylogować się z serwera w Saber, a następnie zalogować ponownie za pomocą nowego hasła.';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$Pl extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$Pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Jak mogę zmienić moje hasło szyfrowania?';
	@override String get a => '0. Upewnij się, że synchronizacja została zakończona (zobacz postęp synchronizacji na ekranie głównym).\n1. Wyloguj się z Saber.\n2. Przejdź na stronę swojego serwera i usuń folder \'Saber\'. Spowoduje to usunięcie wszystkich Twoich notatek z serwera.\n3. Zaloguj się ponownie do Saber. Podczas logowania możesz wybrać nowe hasło szyfrowania.\n4. Nie zapomnij wylogować się i zalogować ponownie do Saber również na swoich innych urządzeniach.';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$Pl extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$Pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Jak mogę usunąć moje konto?';
	@override String get a => 'Kliknij "${_root.profile.quickLinks.deleteAccount}" przycisk powyżej i zaloguj się jeżeli to wymagane.\nJeśli korzystasz z oficjalnego serwera Saber, Twoje konto zostanie usunięte po tygodniu. W tym czasie możesz skontaktować się ze mną pod adresem adilhanney@disroot.org, aby anulować usunięcie.\nJeśli korzystasz z serwera zewnętrznego, opcja usunięcia konta może nie być dostępna: aby uzyskać więcej informacji, musisz zapoznać się z polityką prywatności serwera.';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarPl extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Przełącz kolory (Ctrl C)';
	@override String get select => 'Wybierz';
	@override String get toggleEraser => 'Przełącz gumkę (Ctrl E)';
	@override String get photo => 'Obrazy';
	@override String get text => 'Tekst';
	@override String get toggleFingerDrawing => 'Przełącz rysowanie palcem (Ctrl F)';
	@override String get undo => 'Cofnij';
	@override String get redo => 'Ponów';
	@override String get export => 'Eksportuj (Ctrl Shift S)';
	@override String get exportAs => 'Eksportuj jako:';
	@override String get fullscreen => 'Przełącz pełny ekran (F11)';
}

// Path: editor.pens
class _TranslationsEditorPensPl extends TranslationsEditorPensEn {
	_TranslationsEditorPensPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Pióro wieczne';
	@override String get ballpointPen => 'Pióro kulkowe';
	@override String get highlighter => 'Podświetlenie';
	@override String get pencil => 'Ołówek';
	@override String get shapePen => 'Narzędzie kształtu';
	@override String get laserPointer => 'Wskaźnik laserowy';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsPl extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get size => 'Rozmiar';
}

// Path: editor.colors
class _TranslationsEditorColorsPl extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Wybór koloru';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Niestandardowy ${b} ${h}';
	@override String customHue({required Object h}) => 'Niestandardowy ${h}';
	@override String get dark => 'ciemny';
	@override String get light => 'jasny';
	@override String get black => 'Czarny';
	@override String get darkGrey => 'Ciemnoszary';
	@override String get grey => 'Szary';
	@override String get lightGrey => 'Jasnoszary';
	@override String get white => 'Biały';
	@override String get red => 'Czerwony';
	@override String get green => 'Zielony';
	@override String get cyan => 'Cyjan';
	@override String get blue => 'Niebieski';
	@override String get yellow => 'Żółty';
	@override String get purple => 'Fioletowy';
	@override String get pink => 'Różowy';
	@override String get orange => 'Pomarańczowy';
	@override String get pastelRed => 'Pastelowy czerwony';
	@override String get pastelOrange => 'Pastelowy pomarańczowy';
	@override String get pastelYellow => 'Pastelowy żółty';
	@override String get pastelGreen => 'Pastelowy zielony';
	@override String get pastelCyan => 'Pastelowy cyjan';
	@override String get pastelBlue => 'Pastelowy niebieski';
	@override String get pastelPurple => 'Pastelowy fioletowy';
	@override String get pastelPink => 'Pastelowy różowy';
}

// Path: editor.imageOptions
class _TranslationsEditorImageOptionsPl extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opcje obrazu';
	@override String get invertible => 'Nieodwracalny';
	@override String get download => 'Pobierz';
	@override String get setAsBackground => 'Ustaw jako tło';
	@override String get removeAsBackground => 'Usuń z tła';
	@override String get delete => 'Usuń';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarPl extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Usuń';
	@override String get duplicate => 'Zduplikuj';
}

// Path: editor.menu
class _TranslationsEditorMenuPl extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Wyczyść strony ${page}/${totalPages}';
	@override String get clearAllPages => 'Wyczyść wszystkie strony';
	@override String get insertPage => 'Wstaw stronę poniżej';
	@override String get duplicatePage => 'Duplikuj stronę';
	@override String get deletePage => 'Usuń stronę';
	@override String get lineHeight => 'Wysokość linii';
	@override String get lineHeightDescription => 'Również zmienia rozmiar tekstu dla wpisywanych notatek';
	@override String get lineThickness => 'Grubość linii';
	@override String get lineThicknessDescription => 'Grubość linii tła';
	@override String get backgroundImageFit => 'Dopasowanie obrazu tła';
	@override String get backgroundPattern => 'Wzór tła';
	@override String get import => 'Import';
	@override String get watchServer => 'Śledź zmiany na serwerze';
	@override String get watchServerReadOnly => 'Edycja jest wyłączona podczas śledzenia serwera';
	@override late final _TranslationsEditorMenuBoxFitsPl boxFits = _TranslationsEditorMenuBoxFitsPl._(_root);
	@override late final _TranslationsEditorMenuBgPatternsPl bgPatterns = _TranslationsEditorMenuBgPatternsPl._(_root);
}

// Path: editor.readOnlyBanner
class _TranslationsEditorReadOnlyBannerPl extends TranslationsEditorReadOnlyBannerEn {
	_TranslationsEditorReadOnlyBannerPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tryb tylko do odczytu';
	@override String get watchingServer => 'Obecnie oczekujesz na zmiany na serwerze. Edycja jest w tym trybie wyłączona.';
	@override String get corrupted => 'Nie udało się załadować notatki. Może być uszkodzona lub wciąż jest pobierana.';
}

// Path: editor.versionTooNew
class _TranslationsEditorVersionTooNewPl extends TranslationsEditorVersionTooNewEn {
	_TranslationsEditorVersionTooNewPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ta notatka została edytowana w nowszej wersji aplikacji Saber';
	@override String get subtitle => 'Edycja tej notatki może spowodować utratę niektórych informacji. Czy chcesz to zignorować i mimo wszystko ją edytować?';
	@override String get allowEditing => 'Zezwól na edycje';
}

// Path: editor.quill
class _TranslationsEditorQuillPl extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Wpisz coś tutaj...';
}

// Path: editor.hud
class _TranslationsEditorHudPl extends TranslationsEditorHudEn {
	_TranslationsEditorHudPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Odblokuj powiększenie';
	@override String get lockZoom => 'Zablokuj powiększenie';
	@override String get unlockSingleFingerPan => 'Włącz przesuwanie jednym palcem';
	@override String get lockSingleFingerPan => 'Wyłącz przesuwanie jednym palcem';
	@override String get unlockAxisAlignedPan => 'Odblokuj przesuwanie w pionie lub w poziomie';
	@override String get lockAxisAlignedPan => 'Zablokuj przesuwanie w pionie lub w poziomie';
}

// Path: sentry.consent.description
class _TranslationsSentryConsentDescriptionPl extends TranslationsSentryConsentDescriptionEn {
	_TranslationsSentryConsentDescriptionPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get question => 'Czy chciałbyś automatycznie wysyłać raporty o niespodziewanych błędach? To pomaga identyfikować i rozwiązywać problemy szybciej.';
	@override String get scope => 'Te raporty mogą zawierać informacje o błędach i twoim urządzeniu. Przykładamy wszelki wysiłek aby odfiltrować dane personalne, ale część z nich może pozostać.';
	@override String get currentlyOff => 'Jeżeli wyrazisz zgodę, raportowanie błędów będzie aktywne po restarcie aplikacji.';
	@override String get currentlyOn => 'Jeżeli cofniesz zgodę, proszę zrestartować aplikację aby wdrożyć zmiany.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Więcej informacji na '),
		link('privacy policy'),
		const TextSpan(text: '.'),
	]);
}

// Path: sentry.consent.answers
class _TranslationsSentryConsentAnswersPl extends TranslationsSentryConsentAnswersEn {
	_TranslationsSentryConsentAnswersPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Tak';
	@override String get no => 'Nie';
	@override String get later => 'Zapytaj mnie później';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingPl extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Zapobiega przypadkowemu przełączeniu';
	@override String get fixedOn => 'Rysowanie palcami jest zablokowane jako włączone';
	@override String get fixedOff => 'Rysowanie palcami jest zablokowane jako wyłączone';
}

// Path: settings.prefDescriptions.sentry
class _TranslationsSettingsPrefDescriptionsSentryPl extends TranslationsSettingsPrefDescriptionsSentryEn {
	_TranslationsSettingsPrefDescriptionsSentryPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get active => 'Aktywne';
	@override String get inactive => 'Nieaktywne';
	@override String get activeUntilRestart => 'Aktywne zanim zrestartujesz aplikacje';
	@override String get inactiveUntilRestart => 'Nieaktywne zanim zrestartujesz aplikacje';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowPl extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Proszę autoryzuj Saber do używania twojego konta Nextcloud';
	@override String get followPrompts => 'Proszę postępuj zgodnie z poleceniami interfejsu Nextcloud';
	@override String get browserDidntOpen => 'Strona logowania nie otworzyła się? Kliknij tutaj';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$Pl extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$Pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Czym jest hasło użyte do szyfrowania? Dlaczego korzystać z dwóch haseł?';
	@override String get a => 'Hasło do Nextcloud służy do uzyskania dostępu do chmury. Hasło szyfrujące „miesza” Twoje dane, zanim w ogóle dotrą one do chmury.\nNawet jeśli ktoś uzyska dostęp do Twojego konta Nextcloud, Twoje notatki pozostaną bezpieczne i zaszyfrowane za pomocą osobnego hasła. Zapewnia to drugą warstwę zabezpieczeń chroniącą Twoje dane.\nNikt nie może uzyskać dostępu do Twoich notatek na serwerze bez hasła szyfrującego, ale oznacza to również, że jeśli zapomnisz swojego hasła szyfrującego, stracisz dostęp do swoich danych.';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$Pl extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$Pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nie ustawiłem jeszcze hasła szyfrującego. Jak mogę je uzyskać?';
	@override String get a => 'Utwórz nowe hasło i wpisz je poniżej. \nSaber wygeneruje klucze szyfrowania z tego hasła automatycznie.';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$Pl extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$Pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Czy mogę użyć tego samego hasła co do konta Nextcloud?';
	@override String get a => 'Tak, ale pamiętaj że łatwiej będzie uzyskać dostęp do twoich notatek osobie która ma/może uzyskać dostęp do twojego konta Nextcloud (np. administratorowi serwera).';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsPl extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Rozciągnij';
	@override String get cover => 'Pokryj';
	@override String get contain => 'Zawrzyj';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsPl extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsPl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get none => 'Pusty';
	@override String get college => 'W wąska linię';
	@override String get collegeRtl => 'W wąską linię (Odwrócone)';
	@override String get lined => 'Linie';
	@override String get grid => 'Siatka';
	@override String get dots => 'Kropki';
	@override String get staffs => 'Pięciolinia';
	@override String get tablature => 'Tabulatura';
	@override String get cornell => 'System Cornella';
}
