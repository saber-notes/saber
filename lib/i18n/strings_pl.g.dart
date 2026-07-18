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
	@override late final _Translations$common$pl common = _Translations$common$pl._(_root);
	@override late final _Translations$home$pl home = _Translations$home$pl._(_root);
	@override late final _Translations$sentry$pl sentry = _Translations$sentry$pl._(_root);
	@override late final _Translations$settings$pl settings = _Translations$settings$pl._(_root);
	@override late final _Translations$logs$pl logs = _Translations$logs$pl._(_root);
	@override late final _Translations$login$pl login = _Translations$login$pl._(_root);
	@override late final _Translations$profile$pl profile = _Translations$profile$pl._(_root);
	@override late final _Translations$appInfo$pl appInfo = _Translations$appInfo$pl._(_root);
	@override late final _Translations$update$pl update = _Translations$update$pl._(_root);
	@override late final _Translations$editor$pl editor = _Translations$editor$pl._(_root);
}

// Path: common
class _Translations$common$pl extends Translations$common$en {
	_Translations$common$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get done => 'Gotowe';
	@override String get continueBtn => 'Kontynuuj';
	@override String get cancel => 'Anuluj';
}

// Path: home
class _Translations$home$pl extends Translations$home$en {
	_Translations$home$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$pl tabs = _Translations$home$tabs$pl._(_root);
	@override late final _Translations$home$titles$pl titles = _Translations$home$titles$pl._(_root);
	@override late final _Translations$home$tooltips$pl tooltips = _Translations$home$tooltips$pl._(_root);
	@override late final _Translations$home$create$pl create = _Translations$home$create$pl._(_root);
	@override String get welcome => 'Witaj w Saber';
	@override String get invalidFormat => 'Plik który wskazano nie jest wspierany. Proszę wybrać plik w formacie sbn, sbn2, sba, lub pdf.';
	@override String get noFiles => 'Nie znaleziono plików';
	@override String get noPreviewAvailable => 'Podgląd niedostępny';
	@override String get createNewNote => 'Użyj przycisku + aby utworzyć nową notatkę';
	@override String get backFolder => 'Cofnij się do poprzedniego folderu';
	@override late final _Translations$home$newFolder$pl newFolder = _Translations$home$newFolder$pl._(_root);
	@override late final _Translations$home$renameNote$pl renameNote = _Translations$home$renameNote$pl._(_root);
	@override late final _Translations$home$moveNote$pl moveNote = _Translations$home$moveNote$pl._(_root);
	@override String get deleteNote => 'Usuń notatkę';
	@override late final _Translations$home$deleteNoteDialog$pl deleteNoteDialog = _Translations$home$deleteNoteDialog$pl._(_root);
	@override late final _Translations$home$renameFolder$pl renameFolder = _Translations$home$renameFolder$pl._(_root);
	@override late final _Translations$home$deleteFolder$pl deleteFolder = _Translations$home$deleteFolder$pl._(_root);
}

// Path: sentry
class _Translations$sentry$pl extends Translations$sentry$en {
	_Translations$sentry$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$pl consent = _Translations$sentry$consent$pl._(_root);
}

// Path: settings
class _Translations$settings$pl extends Translations$settings$en {
	_Translations$settings$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$pl prefCategories = _Translations$settings$prefCategories$pl._(_root);
	@override late final _Translations$settings$prefLabels$pl prefLabels = _Translations$settings$prefLabels$pl._(_root);
	@override late final _Translations$settings$prefDescriptions$pl prefDescriptions = _Translations$settings$prefDescriptions$pl._(_root);
	@override late final _Translations$settings$themeModes$pl themeModes = _Translations$settings$themeModes$pl._(_root);
	@override late final _Translations$settings$layoutSizes$pl layoutSizes = _Translations$settings$layoutSizes$pl._(_root);
	@override late final _Translations$settings$accentColorPicker$pl accentColorPicker = _Translations$settings$accentColorPicker$pl._(_root);
	@override String get systemLanguage => 'Auto';
	@override List<String> get axisDirections => [
		'Góra',
		'Prawa',
		'Dół',
		'Lewa',
	];
	@override late final _Translations$settings$reset$pl reset = _Translations$settings$reset$pl._(_root);
	@override String get resyncEverything => 'Synchronizuj wszystko';
	@override String get openDataDir => 'Otwórz folder Saber';
	@override late final _Translations$settings$customDataDir$pl customDataDir = _Translations$settings$customDataDir$pl._(_root);
	@override String get autosaveDisabled => 'Nigdy';
	@override String get shapeRecognitionDisabled => 'Nigdy';
}

// Path: logs
class _Translations$logs$pl extends Translations$logs$en {
	_Translations$logs$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Logi';
	@override String get viewLogs => 'Wyświetl logi';
	@override String get debuggingInfo => 'Logi zawierają informacje użyteczne do debuggowania i dewelopmentu';
	@override String get noLogs => 'Brak logów!';
	@override String get useTheApp => 'Logi pojawią się tutaj przy używaniu aplikacji';
}

// Path: login
class _Translations$login$pl extends Translations$login$en {
	_Translations$login$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Login';
	@override late final _Translations$login$form$pl form = _Translations$login$form$pl._(_root);
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
	@override late final _Translations$login$status$pl status = _Translations$login$status$pl._(_root);
	@override late final _Translations$login$ncLoginStep$pl ncLoginStep = _Translations$login$ncLoginStep$pl._(_root);
	@override late final _Translations$login$encLoginStep$pl encLoginStep = _Translations$login$encLoginStep$pl._(_root);
}

// Path: profile
class _Translations$profile$pl extends Translations$profile$en {
	_Translations$profile$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mój profil';
	@override String get logout => 'Wyloguj';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Wykorzystujesz ${used} z ${total} (${percent}%)';
	@override String get connectedTo => 'Połączono z';
	@override late final _Translations$profile$quickLinks$pl quickLinks = _Translations$profile$quickLinks$pl._(_root);
	@override String get faqTitle => 'Często zadawane pytania (FAQ)';
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$pl._(_root),
		_Translations$profile$faq$1$pl._(_root),
		_Translations$profile$faq$2$pl._(_root),
		_Translations$profile$faq$3$pl._(_root),
	];
}

// Path: appInfo
class _Translations$appInfo$pl extends Translations$appInfo$en {
	_Translations$appInfo$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nTen program jest dostarczany bez jakiejkolwiek gwarancji. Jest to wolne oprogramowanie i możesz je rozpowszechniać pod pewnymi warunkami.';
	@override String get debug => 'DEBUGUJ';
	@override String get sponsorButton => 'Kliknij tutaj aby mnie wesprzeć lub kupić więcej pamięci';
	@override String get licenseButton => 'Kliknij tutaj aby wyświetlić więcej informacji o licencji';
	@override String get privacyPolicyButton => 'Kliknij tutaj aby wyświetlić politykę prywatności';
}

// Path: update
class _Translations$update$pl extends Translations$update$en {
	_Translations$update$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Dostępna aktualizacja';
	@override String get updateAvailableDescription => 'Nowa wersja aplikacji jest dostępna:';
	@override String get update => 'Aktualizuj';
	@override String get downloadNotAvailableYet => 'Pobieranie nie jest jeszcze dostępne dla Twojej platformy. Sprawdź ponownie wkrótce.';
}

// Path: editor
class _Translations$editor$pl extends Translations$editor$en {
	_Translations$editor$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$pl toolbar = _Translations$editor$toolbar$pl._(_root);
	@override late final _Translations$editor$pens$pl pens = _Translations$editor$pens$pl._(_root);
	@override late final _Translations$editor$penOptions$pl penOptions = _Translations$editor$penOptions$pl._(_root);
	@override late final _Translations$editor$colors$pl colors = _Translations$editor$colors$pl._(_root);
	@override late final _Translations$editor$imageOptions$pl imageOptions = _Translations$editor$imageOptions$pl._(_root);
	@override late final _Translations$editor$selectionBar$pl selectionBar = _Translations$editor$selectionBar$pl._(_root);
	@override late final _Translations$editor$menu$pl menu = _Translations$editor$menu$pl._(_root);
	@override late final _Translations$editor$readOnlyBanner$pl readOnlyBanner = _Translations$editor$readOnlyBanner$pl._(_root);
	@override late final _Translations$editor$versionTooNew$pl versionTooNew = _Translations$editor$versionTooNew$pl._(_root);
	@override late final _Translations$editor$quill$pl quill = _Translations$editor$quill$pl._(_root);
	@override late final _Translations$editor$hud$pl hud = _Translations$editor$hud$pl._(_root);
	@override String get pages => 'Strony';
	@override String get untitled => 'Bez tytułu';
	@override String get needsToSaveBeforeExiting => 'Zapisywanie twoich zmian... Możesz bezpiecznie zamknąć edytor kiedy się skończy';
}

// Path: home.tabs
class _Translations$home$tabs$pl extends Translations$home$tabs$en {
	_Translations$home$tabs$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get home => 'Główna';
	@override String get browse => 'Przeglądaj';
	@override String get whiteboard => 'Tablica';
	@override String get settings => 'Ustawienia';
}

// Path: home.titles
class _Translations$home$titles$pl extends Translations$home$titles$en {
	_Translations$home$titles$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get home => 'Ostatnie notatki';
	@override String get browse => 'Przeglądaj';
	@override String get whiteboard => 'Tablica';
	@override String get settings => 'Ustawienia';
}

// Path: home.tooltips
class _Translations$home$tooltips$pl extends Translations$home$tooltips$en {
	_Translations$home$tooltips$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nowa notatka';
	@override String get showUpdateDialog => 'Pokaż okno dialogowe aktualizacji';
	@override String get exportNote => 'Eksportuj notatkę';
}

// Path: home.create
class _Translations$home$create$pl extends Translations$home$create$en {
	_Translations$home$create$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nowa notatka';
	@override String get importNote => 'Importuj notatkę';
}

// Path: home.newFolder
class _Translations$home$newFolder$pl extends Translations$home$newFolder$en {
	_Translations$home$newFolder$pl._(TranslationsPl root) : this._root = root, super.internal(root);

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
class _Translations$home$renameNote$pl extends Translations$home$renameNote$en {
	_Translations$home$renameNote$pl._(TranslationsPl root) : this._root = root, super.internal(root);

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
class _Translations$home$moveNote$pl extends Translations$home$moveNote$en {
	_Translations$home$moveNote$pl._(TranslationsPl root) : this._root = root, super.internal(root);

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

// Path: home.deleteNoteDialog
class _Translations$home$deleteNoteDialog$pl extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String deleteNotes({required Object n}) => 'Usuń ${n} spośród notatek';
	@override String deleteName({required Object f}) => 'Usuń ${f}';
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(n,
		one: 'Trwałe usunąć wybraną notatkę?',
		other: 'Trwałe usunąć wybrane notatki?',
	);
	@override String get delete => 'Usuń';
}

// Path: home.renameFolder
class _Translations$home$renameFolder$pl extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$pl._(TranslationsPl root) : this._root = root, super.internal(root);

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
class _Translations$home$deleteFolder$pl extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Usuń folder';
	@override String deleteName({required Object f}) => 'Usuń ${f}';
	@override String get delete => 'Usuń';
	@override String get alsoDeleteContents => 'Usuń także wszystkie notatki z tego folderu';
}

// Path: sentry.consent
class _Translations$sentry$consent$pl extends Translations$sentry$consent$en {
	_Translations$sentry$consent$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chcesz wesprzeć Saber?';
	@override late final _Translations$sentry$consent$description$pl description = _Translations$sentry$consent$description$pl._(_root);
	@override late final _Translations$sentry$consent$answers$pl answers = _Translations$sentry$consent$answers$pl._(_root);
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$pl extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get general => 'Główne';
	@override String get writing => 'Pisanie';
	@override String get editor => 'Edytor';
	@override String get performance => 'Wydajność';
	@override String get advanced => 'Zaawansowane';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$pl extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$pl._(TranslationsPl root) : this._root = root, super.internal(root);

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
class _Translations$settings$prefDescriptions$pl extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Zwiększenie czytelności dla użytkowników słabowidzących';
	@override String get allowInsecureConnections => '(Nie zalecane) Zezwól Saber na połączenie z serwerami używając certyfikatów niezaufanych/z własnym podpisem';
	@override String get preferGreyscale => 'Dla ekranów e-ink';
	@override String get autoClearWhiteboardOnExit => 'Czyści tablice po wyjściu z aplikacji';
	@override String get disableEraserAfterUse => 'Automatycznie przełącza na poprzednie narzędzie po skorzystaniu z gumki';
	@override String get maxImageSize => 'Większe obrazy będą kompresowane';
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$pl hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$pl._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Wyłącz rysowanie palcami kiedy rysik jest wykryty';
	@override String get editorPromptRename => 'Zawsze możesz zmienić nazwę notatek później';
	@override String get printPageIndicators => 'Pokazuj numery stron przy eksportowaniu';
	@override String get autosave => 'Auto-zapis co określony czas, lub nigdy';
	@override String get shapeRecognitionDelay => 'Częstotliwość aktualizacji podglądu kształtu';
	@override String get autoStraightenLines => 'Prostuj linie bez potrzeby przełączania na narzędzie tworzenia kształtów';
	@override String get simplifiedHomeLayout => 'Stała wysokość każdego podglądu notatki';
	@override String get shouldAlwaysAlertForUpdates => 'Powiadom mnie o aktualizacjach jak tylko będą dostępne';
	@override late final _Translations$settings$prefDescriptions$sentry$pl sentry = _Translations$settings$prefDescriptions$sentry$pl._(_root);
}

// Path: settings.themeModes
class _Translations$settings$themeModes$pl extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get light => 'Jasny';
	@override String get dark => 'Ciemny';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$pl extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Auto';
	@override String get phone => 'Telefon';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$pl extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Wybierz kolor';
}

// Path: settings.reset
class _Translations$settings$reset$pl extends Translations$settings$reset$en {
	_Translations$settings$reset$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Zresetować to ustawienie?';
	@override String get button => 'Resetuj';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$pl extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Anuluj';
	@override String get select => 'Wybierz';
	@override String get mustBeEmpty => 'Wybrany folder musi być pusty';
	@override String get mustBeDoneSyncing => 'Upewnij się że synchronizacja została ukończona przed zmianą tego folderu';
	@override String get unsupported => 'Ta opcja jest aktualnie dostępna tylko dla deweloperów. Używanie jej prawdopodobnie doprowadzi do utraty danych.';
}

// Path: login.form
class _Translations$login$form$pl extends Translations$login$form$en {
	_Translations$login$form$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Logując się, zgaszasz się na '),
		linkToPrivacyPolicy('Politykę Prywatności'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _Translations$login$status$pl extends Translations$login$status$en {
	_Translations$login$status$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Wylogowano';
	@override String get tapToLogin => 'Wybierz aby zalogować się przez Nextcloud';
	@override String hi({required Object u}) => 'Cześć ${u}!';
	@override String get almostDone => 'Prawie gotowy na synchronizacje, kliknij aby skończyć logowanie';
	@override String get loggedIn => 'Zalogowano przez Nextcloud';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$pl extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'Wybierz gdzie przechowywać twoje dane:';
	@override String get saberNcServer => 'Serwer Nextcloud Saber';
	@override String get otherNcServer => 'Inny serwer Nextcloud';
	@override String get serverUrl => 'Serwer URL';
	@override String get loginWithSaber => 'Zaloguj przez Saber';
	@override String get loginWithNextcloud => 'Zaloguj przez Nextcloud';
	@override late final _Translations$login$ncLoginStep$loginFlow$pl loginFlow = _Translations$login$ncLoginStep$loginFlow$pl._(_root);
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$pl extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Aby chronić twoje dane, podaj proszę hasło szyfrowania:';
	@override String get newToSaber => 'Nowy w Saber? Utwórz nowe hasło szyfrowania.';
	@override String get encPassword => 'Hasło szyfrowania';
	@override String get encFaqTitle => 'Często zadawane pytania (FAQ)';
	@override String get wrongEncPassword => 'Odszyfrowywanie przy użyciu podanego hasła nie powiodło się. Spróbuj wpisać je ponownie.';
	@override String get connectionFailed => 'Coś poszło nie tak w trakcie łączenia się z serwerem. Spróbuj ponownie później.';
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$pl._(_root),
		_Translations$login$encLoginStep$encFaq$1$pl._(_root),
		_Translations$login$encLoginStep$encFaq$2$pl._(_root),
	];
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$pl extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Strona główna serwera';
	@override String get deleteAccount => 'Usuń konto';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$pl extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Czy utracę moje notatki jeżeli się wyloguje?';
	@override String get a => 'Nie. Twoje notatki pozostaną zarówno na twoim urządzeniu jak i na serwerze. Nie będą synchronizowane dopóki nie zalogujesz się ponownie. Upewnij się, że synchronizacja została ukończona przed wylogowaniem aby nie utracić żadnych danych (zobacz status synchronizacji na stronie głównej).';
}

// Path: profile.faq.1
class _Translations$profile$faq$1$pl extends Translations$profile$faq$1$en {
	_Translations$profile$faq$1$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Jak mogę zmienić hasło do Nextcloud?';
	@override String get a => 'Wejdź na stronę swojego serwera i się zaloguj. Następnie przejdź do Settings > Security > Change password (Ustawienia > Bezpieczeństwo>Zmiana hasła). Po zmianie hasła należy wylogować się z serwera w Saber, a następnie zalogować ponownie za pomocą nowego hasła.';
}

// Path: profile.faq.2
class _Translations$profile$faq$2$pl extends Translations$profile$faq$2$en {
	_Translations$profile$faq$2$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Jak mogę zmienić moje hasło szyfrowania?';
	@override String get a => '0. Upewnij się, że synchronizacja została zakończona (zobacz postęp synchronizacji na ekranie głównym).\n1. Wyloguj się z Saber.\n2. Przejdź na stronę swojego serwera i usuń folder \'Saber\'. Spowoduje to usunięcie wszystkich Twoich notatek z serwera.\n3. Zaloguj się ponownie do Saber. Podczas logowania możesz wybrać nowe hasło szyfrowania.\n4. Nie zapomnij wylogować się i zalogować ponownie do Saber również na swoich innych urządzeniach.';
}

// Path: profile.faq.3
class _Translations$profile$faq$3$pl extends Translations$profile$faq$3$en {
	_Translations$profile$faq$3$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Jak mogę usunąć moje konto?';
	@override String get a => 'Kliknij "${_root.profile.quickLinks.deleteAccount}" przycisk powyżej i zaloguj się jeżeli to wymagane.\nJeśli korzystasz z oficjalnego serwera Saber, Twoje konto zostanie usunięte po tygodniu. W tym czasie możesz skontaktować się ze mną pod adresem adilhanney@disroot.org, aby anulować usunięcie.\nJeśli korzystasz z serwera zewnętrznego, opcja usunięcia konta może nie być dostępna: aby uzyskać więcej informacji, musisz zapoznać się z polityką prywatności serwera.';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$pl extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$pl._(TranslationsPl root) : this._root = root, super.internal(root);

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
class _Translations$editor$pens$pl extends Translations$editor$pens$en {
	_Translations$editor$pens$pl._(TranslationsPl root) : this._root = root, super.internal(root);

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
class _Translations$editor$penOptions$pl extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get size => 'Rozmiar';
}

// Path: editor.colors
class _Translations$editor$colors$pl extends Translations$editor$colors$en {
	_Translations$editor$colors$pl._(TranslationsPl root) : this._root = root, super.internal(root);

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
class _Translations$editor$imageOptions$pl extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$pl._(TranslationsPl root) : this._root = root, super.internal(root);

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
class _Translations$editor$selectionBar$pl extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Usuń';
	@override String get duplicate => 'Zduplikuj';
}

// Path: editor.menu
class _Translations$editor$menu$pl extends Translations$editor$menu$en {
	_Translations$editor$menu$pl._(TranslationsPl root) : this._root = root, super.internal(root);

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
	@override late final _Translations$editor$menu$boxFits$pl boxFits = _Translations$editor$menu$boxFits$pl._(_root);
	@override late final _Translations$editor$menu$bgPatterns$pl bgPatterns = _Translations$editor$menu$bgPatterns$pl._(_root);
}

// Path: editor.readOnlyBanner
class _Translations$editor$readOnlyBanner$pl extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tryb tylko do odczytu';
	@override String get watchingServer => 'Obecnie oczekujesz na zmiany na serwerze. Edycja jest w tym trybie wyłączona.';
	@override String get corrupted => 'Nie udało się załadować notatki. Może być uszkodzona lub wciąż jest pobierana.';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$pl extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ta notatka została edytowana w nowszej wersji aplikacji Saber';
	@override String get subtitle => 'Edycja tej notatki może spowodować utratę niektórych informacji. Czy chcesz to zignorować i mimo wszystko ją edytować?';
	@override String get allowEditing => 'Zezwól na edycje';
}

// Path: editor.quill
class _Translations$editor$quill$pl extends Translations$editor$quill$en {
	_Translations$editor$quill$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Wpisz coś tutaj...';
}

// Path: editor.hud
class _Translations$editor$hud$pl extends Translations$editor$hud$en {
	_Translations$editor$hud$pl._(TranslationsPl root) : this._root = root, super.internal(root);

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
class _Translations$sentry$consent$description$pl extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$pl._(TranslationsPl root) : this._root = root, super.internal(root);

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
class _Translations$sentry$consent$answers$pl extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Tak';
	@override String get no => 'Nie';
	@override String get later => 'Zapytaj mnie później';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$pl extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Zapobiega przypadkowemu przełączeniu';
	@override String get fixedOn => 'Rysowanie palcami jest zablokowane jako włączone';
	@override String get fixedOff => 'Rysowanie palcami jest zablokowane jako wyłączone';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$pl extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get active => 'Aktywne';
	@override String get inactive => 'Nieaktywne';
	@override String get activeUntilRestart => 'Aktywne zanim zrestartujesz aplikacje';
	@override String get inactiveUntilRestart => 'Nieaktywne zanim zrestartujesz aplikacje';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$pl extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Proszę autoryzuj Saber do używania twojego konta Nextcloud';
	@override String get followPrompts => 'Proszę postępuj zgodnie z poleceniami interfejsu Nextcloud';
	@override String get browserDidntOpen => 'Strona logowania nie otworzyła się? Kliknij tutaj';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$pl extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Czym jest hasło użyte do szyfrowania? Dlaczego korzystać z dwóch haseł?';
	@override String get a => 'Hasło do Nextcloud służy do uzyskania dostępu do chmury. Hasło szyfrujące „miesza” Twoje dane, zanim w ogóle dotrą one do chmury.\nNawet jeśli ktoś uzyska dostęp do Twojego konta Nextcloud, Twoje notatki pozostaną bezpieczne i zaszyfrowane za pomocą osobnego hasła. Zapewnia to drugą warstwę zabezpieczeń chroniącą Twoje dane.\nNikt nie może uzyskać dostępu do Twoich notatek na serwerze bez hasła szyfrującego, ale oznacza to również, że jeśli zapomnisz swojego hasła szyfrującego, stracisz dostęp do swoich danych.';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$pl extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nie ustawiłem jeszcze hasła szyfrującego. Jak mogę je uzyskać?';
	@override String get a => 'Utwórz nowe hasło i wpisz je poniżej. \nSaber wygeneruje klucze szyfrowania z tego hasła automatycznie.';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$pl extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Czy mogę użyć tego samego hasła co do konta Nextcloud?';
	@override String get a => 'Tak, ale pamiętaj że łatwiej będzie uzyskać dostęp do twoich notatek osobie która ma/może uzyskać dostęp do twojego konta Nextcloud (np. administratorowi serwera).';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$pl extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$pl._(TranslationsPl root) : this._root = root, super.internal(root);

	final TranslationsPl _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Rozciągnij';
	@override String get cover => 'Pokryj';
	@override String get contain => 'Zawrzyj';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$pl extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$pl._(TranslationsPl root) : this._root = root, super.internal(root);

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
