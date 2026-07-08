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
class TranslationsHu extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsHu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.hu,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <hu>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsHu _root = this; // ignore: unused_field

	@override 
	TranslationsHu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHu(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$hu common = _Translations$common$hu._(_root);
	@override late final _Translations$home$hu home = _Translations$home$hu._(_root);
	@override late final _Translations$sentry$hu sentry = _Translations$sentry$hu._(_root);
	@override late final _Translations$settings$hu settings = _Translations$settings$hu._(_root);
	@override late final _Translations$logs$hu logs = _Translations$logs$hu._(_root);
	@override late final _Translations$login$hu login = _Translations$login$hu._(_root);
	@override late final _Translations$profile$hu profile = _Translations$profile$hu._(_root);
	@override late final _Translations$appInfo$hu appInfo = _Translations$appInfo$hu._(_root);
	@override late final _Translations$update$hu update = _Translations$update$hu._(_root);
	@override late final _Translations$editor$hu editor = _Translations$editor$hu._(_root);
}

// Path: common
class _Translations$common$hu extends Translations$common$en {
	_Translations$common$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get done => 'Kész';
	@override String get continueBtn => 'Folytatás';
	@override String get cancel => 'Mégse';
}

// Path: home
class _Translations$home$hu extends Translations$home$en {
	_Translations$home$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$hu tabs = _Translations$home$tabs$hu._(_root);
	@override late final _Translations$home$titles$hu titles = _Translations$home$titles$hu._(_root);
	@override late final _Translations$home$tooltips$hu tooltips = _Translations$home$tooltips$hu._(_root);
	@override late final _Translations$home$create$hu create = _Translations$home$create$hu._(_root);
	@override String get welcome => 'Üdvözli a Saber';
	@override String get invalidFormat => 'A kiválasztott fájl nem támogatott. Kérjük, válasszon egy sbn, sbn2, sba vagy pdf fájlt.';
	@override String get noFiles => 'Nem található fájl';
	@override String get noPreviewAvailable => 'Nincs elérhető előnézet';
	@override String get createNewNote => 'Kattintson a + gombra egy új jegyzet létrehozásához';
	@override String get backFolder => 'Vissza az előző mappához';
	@override late final _Translations$home$newFolder$hu newFolder = _Translations$home$newFolder$hu._(_root);
	@override late final _Translations$home$renameNote$hu renameNote = _Translations$home$renameNote$hu._(_root);
	@override late final _Translations$home$moveNote$hu moveNote = _Translations$home$moveNote$hu._(_root);
	@override String get deleteNote => 'Jegyzet törlése';
	@override late final _Translations$home$deleteNoteDialog$hu deleteNoteDialog = _Translations$home$deleteNoteDialog$hu._(_root);
	@override late final _Translations$home$renameFolder$hu renameFolder = _Translations$home$renameFolder$hu._(_root);
	@override late final _Translations$home$deleteFolder$hu deleteFolder = _Translations$home$deleteFolder$hu._(_root);
}

// Path: sentry
class _Translations$sentry$hu extends Translations$sentry$en {
	_Translations$sentry$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$hu consent = _Translations$sentry$consent$hu._(_root);
}

// Path: settings
class _Translations$settings$hu extends Translations$settings$en {
	_Translations$settings$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$hu prefCategories = _Translations$settings$prefCategories$hu._(_root);
	@override late final _Translations$settings$prefLabels$hu prefLabels = _Translations$settings$prefLabels$hu._(_root);
	@override late final _Translations$settings$prefDescriptions$hu prefDescriptions = _Translations$settings$prefDescriptions$hu._(_root);
	@override late final _Translations$settings$themeModes$hu themeModes = _Translations$settings$themeModes$hu._(_root);
	@override late final _Translations$settings$layoutSizes$hu layoutSizes = _Translations$settings$layoutSizes$hu._(_root);
	@override late final _Translations$settings$accentColorPicker$hu accentColorPicker = _Translations$settings$accentColorPicker$hu._(_root);
	@override String get systemLanguage => 'Automatikus';
	@override List<String> get axisDirections => [
		'Fel',
		'Jobbra',
		'Le',
		'Balra',
	];
	@override late final _Translations$settings$reset$hu reset = _Translations$settings$reset$hu._(_root);
	@override String get resyncEverything => 'Minden újraszinkronizálása';
	@override String get openDataDir => 'Saber mappa megnyitása';
	@override late final _Translations$settings$customDataDir$hu customDataDir = _Translations$settings$customDataDir$hu._(_root);
	@override String get autosaveDisabled => 'Soha';
	@override String get shapeRecognitionDisabled => 'Soha';
}

// Path: logs
class _Translations$logs$hu extends Translations$logs$en {
	_Translations$logs$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Naplók';
	@override String get viewLogs => 'Naplók megtekintése';
	@override String get debuggingInfo => 'A naplók hibakereséshez és fejlesztéshez hasznos információkat tartalmaznak';
	@override String get noLogs => 'Itt nincsenek naplók!';
	@override String get useTheApp => 'A naplók itt jelennek meg az alkalmazás használata során';
}

// Path: login
class _Translations$login$hu extends Translations$login$en {
	_Translations$login$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bejelentkezés';
	@override late final _Translations$login$form$hu form = _Translations$login$form$hu._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Még nincsen fiókja? '),
		linkToSignup('Regisztrálás'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'Nem Ön az? '),
		undoLogin('Fiókváltás'),
		const TextSpan(text: '.'),
	]);
	@override late final _Translations$login$status$hu status = _Translations$login$status$hu._(_root);
	@override late final _Translations$login$ncLoginStep$hu ncLoginStep = _Translations$login$ncLoginStep$hu._(_root);
	@override late final _Translations$login$encLoginStep$hu encLoginStep = _Translations$login$encLoginStep$hu._(_root);
}

// Path: profile
class _Translations$profile$hu extends Translations$profile$en {
	_Translations$profile$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profilom';
	@override String get logout => 'Kijelentkezés';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Felhasználva: ${used} / ${total} (${percent}%)';
	@override String get connectedTo => 'Csatlakozva:';
	@override late final _Translations$profile$quickLinks$hu quickLinks = _Translations$profile$quickLinks$hu._(_root);
	@override String get faqTitle => 'Gyakran ismételt kérdések';
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$hu._(_root),
		_Translations$profile$faq$1$hu._(_root),
		_Translations$profile$faq$2$hu._(_root),
		_Translations$profile$faq$3$hu._(_root),
	];
}

// Path: appInfo
class _Translations$appInfo$hu extends Translations$appInfo$en {
	_Translations$appInfo$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber Copyright © 2022-${buildYear} Adil Hanney\nEz a program nem tartalmaz semmilyen garanciát. Ez egy szabad szoftver, és bizonyos feltételek mellett szabadon terjeszthető.';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Ide kattintva támogathat engem vagy vásárolhat több tárhelyet';
	@override String get licenseButton => 'További licencinformációk megtekintéséhez kattintson ide';
	@override String get privacyPolicyButton => 'Kattintson ide az adatvédelmi nyilatkozat megtekintéséhez';
}

// Path: update
class _Translations$update$hu extends Translations$update$en {
	_Translations$update$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Frissítés elérhető';
	@override String get updateAvailableDescription => 'Az alkalmazás új verziója elérhető:';
	@override String get update => 'Frissítés';
	@override String get downloadNotAvailableYet => 'A letöltés még nem érhető el a platformján. Kérjük, próbálja meg később.';
}

// Path: editor
class _Translations$editor$hu extends Translations$editor$en {
	_Translations$editor$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$hu toolbar = _Translations$editor$toolbar$hu._(_root);
	@override late final _Translations$editor$pens$hu pens = _Translations$editor$pens$hu._(_root);
	@override late final _Translations$editor$penOptions$hu penOptions = _Translations$editor$penOptions$hu._(_root);
	@override late final _Translations$editor$colors$hu colors = _Translations$editor$colors$hu._(_root);
	@override late final _Translations$editor$imageOptions$hu imageOptions = _Translations$editor$imageOptions$hu._(_root);
	@override late final _Translations$editor$selectionBar$hu selectionBar = _Translations$editor$selectionBar$hu._(_root);
	@override late final _Translations$editor$menu$hu menu = _Translations$editor$menu$hu._(_root);
	@override late final _Translations$editor$readOnlyBanner$hu readOnlyBanner = _Translations$editor$readOnlyBanner$hu._(_root);
	@override late final _Translations$editor$versionTooNew$hu versionTooNew = _Translations$editor$versionTooNew$hu._(_root);
	@override late final _Translations$editor$quill$hu quill = _Translations$editor$quill$hu._(_root);
	@override late final _Translations$editor$hud$hu hud = _Translations$editor$hud$hu._(_root);
	@override String get pages => 'Oldalak';
	@override String get untitled => 'Névtelen';
	@override String get needsToSaveBeforeExiting => 'A módosítások mentése folyamatban... A szerkesztőt biztonságosan bezárhatja, ha elkészült';
}

// Path: home.tabs
class _Translations$home$tabs$hu extends Translations$home$tabs$en {
	_Translations$home$tabs$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get home => 'Kezdőlap';
	@override String get browse => 'Böngészés';
	@override String get whiteboard => 'Tábla';
	@override String get settings => 'Beállítások';
}

// Path: home.titles
class _Translations$home$titles$hu extends Translations$home$titles$en {
	_Translations$home$titles$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get home => 'Legutóbbi jegyzetek';
	@override String get browse => 'Böngészés';
	@override String get whiteboard => 'Tábla';
	@override String get settings => 'Beállítások';
}

// Path: home.tooltips
class _Translations$home$tooltips$hu extends Translations$home$tooltips$en {
	_Translations$home$tooltips$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Új jegyzet';
	@override String get showUpdateDialog => 'Frissítési párbeszédablak megjelenítése';
	@override String get exportNote => 'Jegyzet exportálása';
}

// Path: home.create
class _Translations$home$create$hu extends Translations$home$create$en {
	_Translations$home$create$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Új jegyzet';
	@override String get importNote => 'Jegyzet importálása';
}

// Path: home.newFolder
class _Translations$home$newFolder$hu extends Translations$home$newFolder$en {
	_Translations$home$newFolder$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Új mappa';
	@override String get folderName => 'Mappa neve';
	@override String get create => 'Létrehozás';
	@override String get folderNameEmpty => 'Mappa neve nem lehet üres';
	@override String get folderNameContainsSlash => 'Mappa neve nem tartalmazhat perjelet';
	@override String get folderNameExists => 'Mappa már létezik';
}

// Path: home.renameNote
class _Translations$home$renameNote$hu extends Translations$home$renameNote$en {
	_Translations$home$renameNote$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Jegyzet átnevezése';
	@override String get noteName => 'Jegyzet neve';
	@override String get rename => 'Átnevezés';
	@override String get noteNameEmpty => 'Jegyzet neve nem lehet üres';
	@override String get noteNameExists => 'Már létezik egy jegyzet ezen a néven';
	@override String get noteNameForbiddenCharacters => 'Jegyzet neve tiltott karaktereket tartalmaz';
	@override String get noteNameReserved => 'A jegyzet neve foglalt';
}

// Path: home.moveNote
class _Translations$home$moveNote$hu extends Translations$home$moveNote$en {
	_Translations$home$moveNote$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Jegyzet áthelyezése';
	@override String moveNotes({required Object n}) => '${n} jegyzet áthelyezése';
	@override String moveName({required Object f}) => '${f} áthelyezése';
	@override String get move => 'Áthelyezés';
	@override String renamedTo({required Object newName}) => 'A jegyzet át lesz nevezve erre: ${newName}';
	@override String get multipleRenamedTo => 'A következő jegyzetek át lesznek nevezve:';
	@override String numberRenamedTo({required Object n}) => '${n} jegyzet át lesz nevezve az ütközések elkerülése érdekében';
}

// Path: home.deleteNoteDialog
class _Translations$home$deleteNoteDialog$hu extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String deleteNotes({required Object n}) => '${n} jegyzet törlése';
	@override String deleteName({required Object f}) => '${f} törlése';
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('hu'))(n,
		one: 'Véglegesen törli a kiválasztott jegyzetet?',
		other: 'Véglegesen törli a kiválasztott jegyzeteket?',
	);
	@override String get delete => 'Törlés';
}

// Path: home.renameFolder
class _Translations$home$renameFolder$hu extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Mappa átnevezése';
	@override String get folderName => 'Mappa neve';
	@override String get rename => 'Átnevezés';
	@override String get folderNameEmpty => 'Mappa neve nem lehet üres';
	@override String get folderNameContainsSlash => 'Mappa neve nem tartalmazhat perjelet';
	@override String get folderNameExists => 'Már létezik egy mappa ezzel a névvel';
}

// Path: home.deleteFolder
class _Translations$home$deleteFolder$hu extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Mappa törlése';
	@override String deleteName({required Object f}) => '${f} törlése';
	@override String get delete => 'Törlés';
	@override String get alsoDeleteContents => 'A mappában lévő összes jegyzet is törlődjön';
}

// Path: sentry.consent
class _Translations$sentry$consent$hu extends Translations$sentry$consent$en {
	_Translations$sentry$consent$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Segít a Saber fejlesztésében?';
	@override late final _Translations$sentry$consent$description$hu description = _Translations$sentry$consent$description$hu._(_root);
	@override late final _Translations$sentry$consent$answers$hu answers = _Translations$sentry$consent$answers$hu._(_root);
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$hu extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get general => 'Általános';
	@override String get writing => 'Írás';
	@override String get editor => 'Szerkesztés';
	@override String get performance => 'Teljesítmény';
	@override String get advanced => 'Speciális';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$hu extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Alkalmazás nyelve';
	@override String get appTheme => 'Alkalmazás témája';
	@override String get platform => 'Téma típusa';
	@override String get layoutSize => 'Elrendezési mód';
	@override String get customAccentColor => 'Egyéni hangsúlyszín';
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible betűtípus';
	@override String get shouldCheckForUpdates => 'Automatikusan ellenőrzi a Saber frissítéseket';
	@override String get shouldAlwaysAlertForUpdates => 'Gyorsabb értesítések a frissítésekről';
	@override String get allowInsecureConnections => 'Nem biztonságos kapcsolatok engedélyezése';
	@override String get editorToolbarAlignment => 'A szerkesztő eszköztár igazítása';
	@override String get editorToolbarShowInFullscreen => 'A szerkesztő eszköztár megjelenítése teljes képernyős módban';
	@override String get editorAutoInvert => 'Jegyzetek színének felcserélése sötét módban';
	@override String get preferGreyscale => 'Szürkeárnyalatos színek előnyben részesítése';
	@override String get maxImageSize => 'Maximális képméret';
	@override String get autoClearWhiteboardOnExit => 'A tábla törlése az alkalmazásból való kilépés után';
	@override String get disableEraserAfterUse => 'Radír automatikus kikapcsolása';
	@override String get hideFingerDrawingToggle => 'Az ujjal rajzolás kapcsoló elrejtése';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Az ujjal történő rajzolás automatikus kikapcsolása';
	@override String get editorPromptRename => 'Új jegyzetek átnevezésére való felszólítás';
	@override String get recentColorsDontSavePresets => 'Ne mentse az előre beállított színeket a legutóbbi színek között';
	@override String get recentColorsLength => 'Hány legutóbbi színt tároljon';
	@override String get printPageIndicators => 'Oldalszámok nyomtatása';
	@override String get autosave => 'Automatikus mentés';
	@override String get shapeRecognitionDelay => 'Alakfelismerés késleltetése';
	@override String get autoStraightenLines => 'Vonalak automatikus kiegyenesítése';
	@override String get customDataDir => 'Egyéni Saber mappa';
	@override String get sentry => 'Hibajelentés';
}

// Path: settings.prefDescriptions
class _Translations$settings$prefDescriptions$hu extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Az Atkinson Hyperlegible növeli az olvashatóságot a gyengén látók számára';
	@override String get allowInsecureConnections => '(Nem ajánlott) Engedélyezi, hogy a Saber ön-aláírt vagy nem megbízható tanúsítványokat használó szerverekhez csatlakozzon';
	@override String get preferGreyscale => 'E-tinta kijelzőkhöz';
	@override String get autoClearWhiteboardOnExit => 'A tábla törlésre kerül, amikor kilép az alkalmazásból';
	@override String get disableEraserAfterUse => 'Automatikusan visszavált a tollra, miután a radírt használta';
	@override String get maxImageSize => 'Az ennél nagyobb képek tömörítve lesznek';
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$hu hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$hu._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Kapcsolja ki az ujjal történő rajzolást, ha ceruza van érzékelve';
	@override String get editorPromptRename => 'A jegyzeteket később bármikor átnevezheti';
	@override String get printPageIndicators => 'Oldalszámok megjelenítése az exportokban';
	@override String get autosave => 'Automatikus mentés rövid idő után, vagy soha';
	@override String get shapeRecognitionDelay => 'Milyen gyakran frissüljön az alakzat előnézete';
	@override String get autoStraightenLines => 'Automatikusan kiegyenesíti a hosszú vonalakat anélkül, hogy az alakzat tollat kellene használni';
	@override String get shouldAlwaysAlertForUpdates => 'Értesítsen a frissítésekről, amint elérhetővé válnak';
	@override late final _Translations$settings$prefDescriptions$sentry$hu sentry = _Translations$settings$prefDescriptions$sentry$hu._(_root);
}

// Path: settings.themeModes
class _Translations$settings$themeModes$hu extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get system => 'Rendszer';
	@override String get light => 'Világos';
	@override String get dark => 'Sötét';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$hu extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Automatikus';
	@override String get phone => 'Telefon';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$hu extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Szín kiválasztása';
}

// Path: settings.reset
class _Translations$settings$reset$hu extends Translations$settings$reset$en {
	_Translations$settings$reset$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Visszaállítsa ezt a beállítást?';
	@override String get button => 'Visszaállítás';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$hu extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Mégse';
	@override String get select => 'Kiválasztás';
	@override String get mustBeEmpty => 'A kiválasztott mappának üresnek kell lennie';
	@override String get mustBeDoneSyncing => 'Győződjön meg arról, hogy a szinkronizálás befejeződött, mielőtt módosítja a mappát';
	@override String get unsupported => 'Ez a funkció jelenleg csak fejlesztőknek való. Használata adatvesztést okozhat.';
}

// Path: login.form
class _Translations$login$form$hu extends Translations$login$form$en {
	_Translations$login$form$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'A bejelentkezéssel elfogadja a '),
		linkToPrivacyPolicy('Adatvédelmi irányelvek'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _Translations$login$status$hu extends Translations$login$status$en {
	_Translations$login$status$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Kijelentkezve';
	@override String get tapToLogin => 'Kattintson a Nextclouddal való bejelentkezéshez';
	@override String hi({required Object u}) => 'Üdv, ${u}!';
	@override String get almostDone => 'Majdnem készen áll a szinkronizálásra, koppintson a bejelentkezés befejezéséhez';
	@override String get loggedIn => 'Bejelentkezve a Nextclouddal';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$hu extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'Válassza ki, hol szeretné tárolni az adatait:';
	@override String get saberNcServer => 'A Saber Nextcloud szervere';
	@override String get otherNcServer => 'Másik Nextcloud szerver';
	@override String get serverUrl => 'Szerver URL';
	@override String get loginWithSaber => 'Bejelentkezés Saber-rel';
	@override String get loginWithNextcloud => 'Bejelentkezés Nextcloud-dal';
	@override late final _Translations$login$ncLoginStep$loginFlow$hu loginFlow = _Translations$login$ncLoginStep$loginFlow$hu._(_root);
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$hu extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Az adatai védelme érdekében kérjük, adja meg a titkosítási jelszavát:';
	@override String get newToSaber => 'Először használja a Saber-t? Adjon meg egy új titkosítási jelszót.';
	@override String get encPassword => 'Titkosítási jelszó';
	@override String get encFaqTitle => 'Gyakran ismételt kérdések';
	@override String get wrongEncPassword => 'A megadott jelszóval a visszafejtés nem sikerült. Kérjük, próbálja meg újra megadni.';
	@override String get connectionFailed => 'Hiba történt a szerverhez való csatlakozás során. Kérjük, próbálja újra később.';
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$hu._(_root),
		_Translations$login$encLoginStep$encFaq$1$hu._(_root),
		_Translations$login$encLoginStep$encFaq$2$hu._(_root),
	];
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$hu extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Szerver kezdőlapja';
	@override String get deleteAccount => 'Fiók törlése';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$hu extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Elveszítem a jegyzeteimet, ha kijelentkezem?';
	@override String get a => 'Nem. A jegyzetei mind az eszközén, mind a szerveren megmaradnak. A szerverrel csak akkor lesznek szinkronizálva, ha újra bejelentkezik. Mielőtt kijelentkezik, győződjön meg arról, hogy a szinkronizálás befejeződött, különben adatvesztés történhet (a kezdőképernyőn látható a szinkronizálás állapota).';
}

// Path: profile.faq.1
class _Translations$profile$faq$1$hu extends Translations$profile$faq$1$en {
	_Translations$profile$faq$1$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Hogyan változtatom meg a Nextcloud jelszavamat?';
	@override String get a => 'Nyissa meg a szerver weboldalát, és jelentkezzen be. Ezután menjen a Beállítások > Biztonság > Jelszó módosítása menüpontra. A jelszó módosítása után ki kell jelentkeznie a Saberből, majd újra be kell jelentkeznie.';
}

// Path: profile.faq.2
class _Translations$profile$faq$2$hu extends Translations$profile$faq$2$en {
	_Translations$profile$faq$2$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Hogyan változtatom meg a titkosítási jelszavamat?';
	@override String get a => '0. Győződjön meg arról, hogy a szinkronizálás befejeződött (a szinkronizálás állapotát a kezdőképernyőn láthatja).\n1. Jelentkezzen ki a Saberből.\n2. Nyissa meg a szerver weboldalát, és törölje a „Saber” mappát. Ez minden jegyzetét törli a szerverről.\n3. Jelentkezzen be újra a Saberbe. Bejelentkezéskor új titkosítási jelszót választhat.\n4. Ne felejtkezzen el kijelentkezni, majd újra bejelentkezni a Saberbe a többi eszközén is.';
}

// Path: profile.faq.3
class _Translations$profile$faq$3$hu extends Translations$profile$faq$3$en {
	_Translations$profile$faq$3$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Hogyan törölhetem a fiókomat?';
	@override String get a => 'Koppintson a fenti „${_root.profile.quickLinks.deleteAccount}” gombra, és szükség esetén jelentkezzen be.\nHa a hivatalos Saber szervert használja, a fiókja 1 hetes türelmi idő után törlésre kerül. Ebben az időszakban a törlés visszavonásához vegye fel a kapcsolatot a következő e-mail címen: adilhanney@disroot.org.\nHa harmadik féltől származó szervert használ, előfordulhat, hogy nincs lehetőség a fiók törlésére: további információért tekintse meg a szerver adatvédelmi szabályzatát.';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$hu extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Színek váltása (Ctrl+C)';
	@override String get select => 'Kiválasztás';
	@override String get toggleEraser => 'Radír ki-be kapcsolása (Ctrl+E)';
	@override String get photo => 'Képek';
	@override String get text => 'Szöveg';
	@override String get toggleFingerDrawing => 'Ujjal való rajzolásra váltása (Ctrl+F)';
	@override String get undo => 'Visszavonás';
	@override String get redo => 'Mégis';
	@override String get export => 'Exportálás (Ctrl+Shift+S)';
	@override String get exportAs => 'Exportálás mint:';
	@override String get fullscreen => 'Teljes képernyő bekapcsolása (F11)';
}

// Path: editor.pens
class _Translations$editor$pens$hu extends Translations$editor$pens$en {
	_Translations$editor$pens$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Töltőtoll';
	@override String get ballpointPen => 'Golyóstoll';
	@override String get highlighter => 'Kiemelő';
	@override String get pencil => 'Ceruza';
	@override String get shapePen => 'Alakzat toll';
	@override String get laserPointer => 'Lézermutató';
}

// Path: editor.penOptions
class _Translations$editor$penOptions$hu extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get size => 'Méret';
}

// Path: editor.colors
class _Translations$editor$colors$hu extends Translations$editor$colors$en {
	_Translations$editor$colors$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Színválasztó';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Egyéni ${b} ${h}';
	@override String customHue({required Object h}) => 'Egyéni ${h}';
	@override String get dark => 'sötét';
	@override String get light => 'világos';
	@override String get black => 'Fekete';
	@override String get darkGrey => 'Sötétszürke';
	@override String get grey => 'Szürke';
	@override String get lightGrey => 'Világosszürke';
	@override String get white => 'Fehér';
	@override String get red => 'Piros';
	@override String get green => 'Zöld';
	@override String get cyan => 'Cián';
	@override String get blue => 'Kék';
	@override String get yellow => 'Sárga';
	@override String get purple => 'Lila';
	@override String get pink => 'Rózsaszín';
	@override String get orange => 'Narancs';
	@override String get pastelRed => 'Pasztell piros';
	@override String get pastelOrange => 'Pasztell narancs';
	@override String get pastelYellow => 'Pasztell sárga';
	@override String get pastelGreen => 'Pasztell zöld';
	@override String get pastelCyan => 'Pasztell cián';
	@override String get pastelBlue => 'Pasztell kék';
	@override String get pastelPurple => 'Pasztell lila';
	@override String get pastelPink => 'Pasztell rózsaszín';
}

// Path: editor.imageOptions
class _Translations$editor$imageOptions$hu extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kép opciók';
	@override String get invertible => 'Megfordítható';
	@override String get download => 'Letöltés';
	@override String get setAsBackground => 'Beállítás háttérképként';
	@override String get removeAsBackground => 'Eltávolítás háttérként';
	@override String get delete => 'Törlés';
}

// Path: editor.selectionBar
class _Translations$editor$selectionBar$hu extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Törlés';
	@override String get duplicate => 'Duplikálás';
}

// Path: editor.menu
class _Translations$editor$menu$hu extends Translations$editor$menu$en {
	_Translations$editor$menu$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Oldal törlése: ${page}/${totalPages}';
	@override String get clearAllPages => 'Összes oldal törlése';
	@override String get insertPage => 'Oldal beszúrása alá';
	@override String get duplicatePage => 'Oldal duplikálása';
	@override String get deletePage => 'Oldal törlése';
	@override String get lineHeight => 'Vonalmagasság';
	@override String get lineHeightDescription => 'A begépelt jegyzetek szövegméretét is szabályozza';
	@override String get lineThickness => 'Vonalvastagság';
	@override String get lineThicknessDescription => 'Háttérvonalak vastagsága';
	@override String get backgroundImageFit => 'Háttérkép illesztése';
	@override String get backgroundPattern => 'Háttérminta';
	@override String get import => 'Importálás';
	@override String get watchServer => 'Frissítések figyelése a szerveren';
	@override String get watchServerReadOnly => 'A szerver figyelése közben a szerkesztés le van tiltva';
	@override late final _Translations$editor$menu$boxFits$hu boxFits = _Translations$editor$menu$boxFits$hu._(_root);
	@override late final _Translations$editor$menu$bgPatterns$hu bgPatterns = _Translations$editor$menu$bgPatterns$hu._(_root);
}

// Path: editor.readOnlyBanner
class _Translations$editor$readOnlyBanner$hu extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Csak olvasható mód';
	@override String get watchingServer => 'Jelenleg a szerver frissítéseit figyeli. Ebben a módban a szerkesztés le van tiltva.';
	@override String get corrupted => 'Nem sikerült betölteni a jegyzetet. Lehet, hogy sérült, vagy még letöltés alatt áll.';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$hu extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ez a jegyzet a Saber egy újabb verziójával lett szerkesztve';
	@override String get subtitle => 'A jegyzet szerkesztése bizonyos információk elvesztését eredményezheti. Szeretné ezt figyelmen kívül hagyni, és mégis szerkeszteni?';
	@override String get allowEditing => 'Szerkesztés engedélyezése';
}

// Path: editor.quill
class _Translations$editor$quill$hu extends Translations$editor$quill$en {
	_Translations$editor$quill$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Gépeljen ide valamit...';
}

// Path: editor.hud
class _Translations$editor$hud$hu extends Translations$editor$hud$en {
	_Translations$editor$hud$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Nagyítás feloldása';
	@override String get lockZoom => 'Nagyítás rögzítése';
	@override String get unlockSingleFingerPan => 'Egyujjas lapozás engedélyezése';
	@override String get lockSingleFingerPan => 'Egyujjas lapozás letiltása';
	@override String get unlockAxisAlignedPan => 'Pásztázás feloldása vízszintes vagy függőleges irányban';
	@override String get lockAxisAlignedPan => 'Pásztázás rögzítése vízszintes vagy függőleges irányban';
}

// Path: sentry.consent.description
class _Translations$sentry$consent$description$hu extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get question => 'Szeretné automatikusan jelenteni a váratlan hibákat? Ez segít a problémák gyorsabb azonosításában és javításában.';
	@override String get scope => 'A jelentések tartalmazhatnak információkat a hibáról és az eszközéről. Minden tőlem telhetőt megtettem a személyes adatok kiszűrésére, de előfordulhat, hogy néhány mégis megmarad.';
	@override String get currentlyOff => 'Ha hozzájárul, a hibajelentés az alkalmazás újraindítása után engedélyezve lesz.';
	@override String get currentlyOn => 'Ha visszavonja a hozzájárulást, kérjük, indítsa újra az alkalmazást a hibajelentés kikapcsolásához.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'További részletek az '),
		link('adatvédelmi szabályzatban'),
		const TextSpan(text: ' (angolul).'),
	]);
}

// Path: sentry.consent.answers
class _Translations$sentry$consent$answers$hu extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Igen';
	@override String get no => 'Nem';
	@override String get later => 'Kérdezz meg később';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$hu extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Elkerüli a véletlen átkapcsolást';
	@override String get fixedOn => 'Az ujjal rajzolás mindig engedélyezett';
	@override String get fixedOff => 'Az ujjal rajzolás soha nem engedélyezett';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$hu extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get active => 'Aktív';
	@override String get inactive => 'Inaktív';
	@override String get activeUntilRestart => 'Aktív az alkalmazás újraindításáig';
	@override String get inactiveUntilRestart => 'Inaktív az alkalmazás újraindításáig';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$hu extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Kérjük, engedélyezze a Saber számára a Nextcloud-fiókjához való hozzáférést';
	@override String get followPrompts => 'Kérjük, kövesse a Nextcloud felületén megjelenő utasításokat';
	@override String get browserDidntOpen => 'Nem nyílt meg a bejelentkezési oldal? Kattintson ide';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$hu extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Mi az a titkosítási jelszó? Miért van szükség két jelszóra?';
	@override String get a => 'A Nextcloud jelszó a felhőhöz való hozzáféréshez szükséges. A titkosítási jelszó már azelőtt „összekeveri” az adatait, hogy azok a felhőbe kerülnének.\nMég ha valaki hozzá is fér a Nextcloud-fiókjához, a jegyzetei továbbra is biztonságban maradnak, mivel külön titkosítási jelszó védi őket. Ez egy második védelmi réteget biztosít az adatai számára.\nA szerveren senki sem férhet hozzá a jegyzeteihez a titkosítási jelszó nélkül, de ez azt is jelenti, hogy ha elfelejti a titkosítási jelszavát, elveszíti a hozzáférést az adataihoz.';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$hu extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Még nem állítottam be titkosítási jelszót. Hol szerezhetem meg?';
	@override String get a => 'Válasszon egy új titkosítási jelszót, és adja meg fent.\nA Saber automatikusan létrehozza a titkosítási kulcsokat ebből a jelszóból.';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$hu extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Használhatom ugyanazt a jelszót, mint a Nextcloud-fiókomhoz?';
	@override String get a => 'Igen, de fontos figyelembe venni, hogy így a szerver adminisztrátora vagy más személy könnyebben hozzáférhet a jegyzeteihez, ha hozzájut a Nextcloud-fiókjához.';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$hu extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Nyújtás';
	@override String get cover => 'Kitöltés';
	@override String get contain => 'Igazítás';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$hu extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get none => 'Üres';
	@override String get college => 'Margós vonalazás';
	@override String get collegeRtl => 'Margós vonalazás (fordított)';
	@override String get lined => 'Vonalas';
	@override String get grid => 'Kockás';
	@override String get dots => 'Pontozott';
	@override String get staffs => 'Ötvonalas kottavonal';
	@override String get tablature => 'Tabulatúra';
	@override String get cornell => 'Cornell';
}
