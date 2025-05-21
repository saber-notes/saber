///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsHu extends Translations {
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
	@override late final _TranslationsCommonHu common = _TranslationsCommonHu._(_root);
	@override late final _TranslationsHomeHu home = _TranslationsHomeHu._(_root);
	@override late final _TranslationsSettingsHu settings = _TranslationsSettingsHu._(_root);
	@override late final _TranslationsLogsHu logs = _TranslationsLogsHu._(_root);
	@override late final _TranslationsLoginHu login = _TranslationsLoginHu._(_root);
	@override late final _TranslationsProfileHu profile = _TranslationsProfileHu._(_root);
	@override late final _TranslationsAppInfoHu appInfo = _TranslationsAppInfoHu._(_root);
	@override late final _TranslationsUpdateHu update = _TranslationsUpdateHu._(_root);
	@override late final _TranslationsEditorHu editor = _TranslationsEditorHu._(_root);
}

// Path: common
class _TranslationsCommonHu extends TranslationsCommonEn {
	_TranslationsCommonHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Mégse';
	@override String get done => 'Kész';
	@override String get continueBtn => 'Folytatni';
}

// Path: home
class _TranslationsHomeHu extends TranslationsHomeEn {
	_TranslationsHomeHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsHu tabs = _TranslationsHomeTabsHu._(_root);
	@override late final _TranslationsHomeTitlesHu titles = _TranslationsHomeTitlesHu._(_root);
	@override late final _TranslationsHomeTooltipsHu tooltips = _TranslationsHomeTooltipsHu._(_root);
	@override late final _TranslationsHomeCreateHu create = _TranslationsHomeCreateHu._(_root);
	@override String get welcome => 'Üdvözli a Saber';
	@override String get noFiles => 'Nem található ilyen fájl';
	@override String get noPreviewAvailable => 'Nincs elérhető előnézet';
	@override String get createNewNote => 'Kattintson a + gombora egy új jegyzet létrehozásához';
	@override late final _TranslationsHomeNewFolderHu newFolder = _TranslationsHomeNewFolderHu._(_root);
	@override late final _TranslationsHomeRenameNoteHu renameNote = _TranslationsHomeRenameNoteHu._(_root);
	@override late final _TranslationsHomeMoveNoteHu moveNote = _TranslationsHomeMoveNoteHu._(_root);
	@override late final _TranslationsHomeRenameFolderHu renameFolder = _TranslationsHomeRenameFolderHu._(_root);
	@override late final _TranslationsHomeDeleteFolderHu deleteFolder = _TranslationsHomeDeleteFolderHu._(_root);
	@override String get backFolder => 'Menjen vissza az előző mappába';
	@override String get deleteNote => 'Jegyzet törlése';
	@override String get invalidFormat => 'A kiválasztott fájl nem támogatott. Kérjük, válasszon .sbn, .sbn2, .sba vagy .pdf fájlt.';
}

// Path: settings
class _TranslationsSettingsHu extends TranslationsSettingsEn {
	_TranslationsSettingsHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesHu prefCategories = _TranslationsSettingsPrefCategoriesHu._(_root);
	@override late final _TranslationsSettingsPrefLabelsHu prefLabels = _TranslationsSettingsPrefLabelsHu._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsHu prefDescriptions = _TranslationsSettingsPrefDescriptionsHu._(_root);
	@override late final _TranslationsSettingsThemeModesHu themeModes = _TranslationsSettingsThemeModesHu._(_root);
	@override late final _TranslationsSettingsLayoutSizesHu layoutSizes = _TranslationsSettingsLayoutSizesHu._(_root);
	@override late final _TranslationsSettingsAccentColorPickerHu accentColorPicker = _TranslationsSettingsAccentColorPickerHu._(_root);
	@override String get systemLanguage => 'Rendszerspecifikus nyelve';
	@override List<String> get axisDirections => [
		'Fel',
		'Jobbra',
		'Le',
		'Balra',
	];
	@override late final _TranslationsSettingsResetHu reset = _TranslationsSettingsResetHu._(_root);
	@override late final _TranslationsSettingsCustomDataDirHu customDataDir = _TranslationsSettingsCustomDataDirHu._(_root);
	@override String get openDataDir => 'Nyissa meg a Saber mappát';
	@override String get resyncEverything => 'Resync mindent';
}

// Path: logs
class _TranslationsLogsHu extends TranslationsLogsEn {
	_TranslationsLogsHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Naplók';
	@override String get viewLogs => 'Naplók megtekintése';
	@override String get debuggingInfo => 'A naplók a hibakereséshez és a fejlesztéshez hasznos információkat tartalmaznak';
	@override String get noLogs => 'Itt nincsenek naplók!';
	@override String get logsAreTemporary => 'A naplókat csak az alkalmazás bezárásáig őrizzük meg';
}

// Path: login
class _TranslationsLoginHu extends TranslationsLoginEn {
	_TranslationsLoginHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bejelentkezés';
	@override late final _TranslationsLoginFormHu form = _TranslationsLoginFormHu._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Még nincsen fiókja? '),
		linkToSignup('Regisztrálás'),
		const TextSpan(text: '!'),
	]);
	@override late final _TranslationsLoginStatusHu status = _TranslationsLoginStatusHu._(_root);
	@override late final _TranslationsLoginNcLoginStepHu ncLoginStep = _TranslationsLoginNcLoginStepHu._(_root);
	@override late final _TranslationsLoginEncLoginStepHu encLoginStep = _TranslationsLoginEncLoginStepHu._(_root);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		undoLogin('Nem te'),
	]);
}

// Path: profile
class _TranslationsProfileHu extends TranslationsProfileEn {
	_TranslationsProfileHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsProfileQuickLinksHu quickLinks = _TranslationsProfileQuickLinksHu._(_root);
	@override String quotaUsage({required Object total, required Object percent, required Object used}) => 'Ön a(z) ${total}-ból (${percent}%) ${used}';
	@override String get connectedTo => 'Csatlakozva valamihez';
	@override String get faqTitle => 'Gyakran Ismételt Kérdések';
	@override String get title => 'A profilom';
	@override String get logout => 'Kijelentkezés';
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$Hu._(_root),
		_TranslationsProfile$faq$0i1$Hu._(_root),
		_TranslationsProfile$faq$0i2$Hu._(_root),
		_TranslationsProfile$faq$0i3$Hu._(_root),
	];
}

// Path: appInfo
class _TranslationsAppInfoHu extends TranslationsAppInfoEn {
	_TranslationsAppInfoHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber Copyright © 2022-${buildYear} Adil Hanney\nEz a program nem tartalmaz semmilyen garanciát. Ez egy szabad szoftver, és bizonyos feltételek mellett szabadon terjeszthető.';
	@override String get dirty => 'DIRTY';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Ide kattintva támogathat engem vagy vásárolhat több tárhelyet';
	@override String get licenseButton => 'További licencinformációk megtekintéséhez kattintson ide';
	@override String get privacyPolicyButton => 'Kattintson ide az adatvédelmi nyilatkozat megtekintéséhez';
}

// Path: update
class _TranslationsUpdateHu extends TranslationsUpdateEn {
	_TranslationsUpdateHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Frissítés elérhető';
	@override String get update => 'Frissítés';
	@override String get downloadNotAvailableYet => 'A letöltés még nem érhető el az Ön platformjára. Kérjük, nézzen vissza rövidesen.';
	@override String get updateAvailableDescription => 'Elérhető az alkalmazás új verziója a következő változtatásokkal:';
}

// Path: editor
class _TranslationsEditorHu extends TranslationsEditorEn {
	_TranslationsEditorHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarHu toolbar = _TranslationsEditorToolbarHu._(_root);
	@override late final _TranslationsEditorPensHu pens = _TranslationsEditorPensHu._(_root);
	@override late final _TranslationsEditorPenOptionsHu penOptions = _TranslationsEditorPenOptionsHu._(_root);
	@override late final _TranslationsEditorColorsHu colors = _TranslationsEditorColorsHu._(_root);
	@override late final _TranslationsEditorImageOptionsHu imageOptions = _TranslationsEditorImageOptionsHu._(_root);
	@override late final _TranslationsEditorSelectionBarHu selectionBar = _TranslationsEditorSelectionBarHu._(_root);
	@override late final _TranslationsEditorMenuHu menu = _TranslationsEditorMenuHu._(_root);
	@override late final _TranslationsEditorNewerFileFormatHu newerFileFormat = _TranslationsEditorNewerFileFormatHu._(_root);
	@override late final _TranslationsEditorQuillHu quill = _TranslationsEditorQuillHu._(_root);
	@override late final _TranslationsEditorHudHu hud = _TranslationsEditorHudHu._(_root);
	@override String get pages => 'Oldalak';
	@override String get untitled => 'Névtelen';
	@override String get needsToSaveBeforeExiting => 'A módosítások mentése... Ha kész, nyugodtan kiléphet a szerkesztőből';
}

// Path: home.tabs
class _TranslationsHomeTabsHu extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get home => 'Kezdőlap';
	@override String get browse => 'Böngészés';
	@override String get whiteboard => 'Tábla';
	@override String get settings => 'Beállítások';
}

// Path: home.titles
class _TranslationsHomeTitlesHu extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get home => 'Legutóbbi jegyzetek';
	@override String get whiteboard => 'Whiteboard';
	@override String get settings => 'Beállítások';
	@override String get browse => 'Böngészés';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsHu extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Új jegyzet';
	@override String get showUpdateDialog => 'Frissítési párbeszédablak megjelenítése';
	@override String get exportNote => 'Megjegyzés exportálása';
}

// Path: home.create
class _TranslationsHomeCreateHu extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Új jegyzet';
	@override String get importNote => 'Megjegyzés importálása';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderHu extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Új mappa';
	@override String get folderName => 'Mappa neve';
	@override String get create => 'Teremt';
	@override String get folderNameEmpty => 'A mappa neve nem lehet üres';
	@override String get folderNameContainsSlash => 'A mappa neve nem tartalmazhat perjelet';
	@override String get folderNameExists => 'Folder már létezik';
}

// Path: home.renameNote
class _TranslationsHomeRenameNoteHu extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Jegyzet átnevezése';
	@override String get noteName => 'Megjegyzés neve';
	@override String get rename => 'Átnevezés';
	@override String get noteNameEmpty => 'A jegyzet neve nem lehet üres';
	@override String get noteNameContainsSlash => 'A jegyzet neve nem tartalmazhat perjelet';
	@override String get noteNameExists => 'Már létezik ilyen nevű jegyzet';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteHu extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String moveNotes({required Object n}) => '${n} jegyzet mozgatása';
	@override String numberRenamedTo({required Object n}) => '${n} jegyzet átnevezésre kerül az ütközések elkerülése érdekében';
	@override String get multipleRenamedTo => 'A következő megjegyzések átnevezésre kerülnek:';
	@override String get moveNote => 'Jegyzet áthelyezése';
	@override String moveName({required Object f}) => 'Mozgassa ${f}';
	@override String get move => 'Mozog';
	@override String renamedTo({required Object newName}) => 'A jegyzet a következőre lesz átnevezve: ${newName}';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderHu extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get folderNameEmpty => 'A mappa neve nem lehet üres';
	@override String get renameFolder => 'Mappa átnevezése';
	@override String get folderNameExists => 'Már létezik ilyen nevű mappa';
	@override String get folderName => 'Mappa neve';
	@override String get rename => 'Átnevezés';
	@override String get folderNameContainsSlash => 'A mappa neve nem tartalmazhat perjelet';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderHu extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Töröl';
	@override String get alsoDeleteContents => 'Törölje az összes jegyzetet ebben a mappában';
	@override String get deleteFolder => 'Mappa törlése';
	@override String deleteName({required Object f}) => '${f} törlése';
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesHu extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get general => 'Általános';
	@override String get writing => 'Írás';
	@override String get performance => 'Teljesítmény';
	@override String get editor => 'Szerkesztő';
	@override String get advanced => 'Fejlett';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsHu extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Alkalmazás nyelve';
	@override String get appTheme => 'Alkalmazás témája';
	@override String get platform => 'Téma típusa';
	@override String get customAccentColor => 'Egyéni akcentusszín';
	@override String get hyperlegibleFont => 'Hyperlegible betűtipus';
	@override String get shouldCheckForUpdates => 'Automatikusan ellenőrzi a Saber frissítéseket';
	@override String get editorToolbarAlignment => 'A szerkesztő eszköztár igazítása';
	@override String get editorToolbarShowInFullscreen => 'A szerkesztő eszköztár megjelenítése teljes képernyős módban';
	@override String get editorAutoInvert => 'Jegyzetek színének felcserélése sötét módban';
	@override String get preferGreyscale => 'Szürkeárnyalatos színek előnyben részesítése';
	@override String get maxImageSize => 'Maximális képméret';
	@override String get autoClearWhiteboardOnExit => 'A tábla törlése az alkalmazásból való kilépés után';
	@override String get editorPromptRename => 'Új jegyzetek átnevezésére való felszólítás';
	@override String get hideHomeBackgrounds => 'Hátterek elrejtése a kezdőképernyőn';
	@override String get recentColorsDontSavePresets => 'Ne mentse az előre beállított színeket a legutóbbi színek között';
	@override String get simplifiedHomeLayout => 'Egyszerűsített otthoni elrendezés';
	@override String get pencilSoundSetting => 'Ceruza hanghatás';
	@override String get customDataDir => 'Egyedi adatkönyvtár';
	@override String get autoStraightenLines => 'A vonalak automatikus kiegyenesítése';
	@override String get shapeRecognitionDelay => 'Alakfelismerési késleltetés';
	@override String get recentColorsLength => 'Hány friss színt kell tárolni';
	@override String get layoutSize => 'Elrendezés típusa';
	@override String get printPageIndicators => 'Nyomtatási oldaljelzők';
	@override String get allowInsecureConnections => 'Engedélyezze a nem biztonságos kapcsolatokat';
	@override String get autosaveDelay => 'Auto-save késleltetés';
	@override String get hideFingerDrawingToggle => 'Az ujjrajzolás kapcsoló elrejtése';
	@override String get shouldAlwaysAlertForUpdates => 'Gyorsabb frissítések';
	@override String get disableEraserAfterUse => 'A radír automatikus letiltása';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsHu extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Az Atkinson Hyperlegible növeli az olvashatóságot a gyengén látók számára';
	@override String get preferGreyscale => 'E-tinta kijelzőkhöz';
	@override String get autoClearWhiteboardOnExit => 'Továbbra is szinkronizálva lesz a többi eszközzel';
	@override String get maxImageSize => 'Az ennél nagyobb képek tömörítve lesznek';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingHu hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingHu._(_root);
	@override String get editorPromptRename => 'A jegyzeteket később bármikor átnevezheti';
	@override String get hideHomeBackgrounds => 'Egy letisztultabb megjelenítésért';
	@override late final _TranslationsSettingsPrefDescriptionsPencilSoundSettingHu pencilSoundSetting = _TranslationsSettingsPrefDescriptionsPencilSoundSettingHu._(_root);
	@override String get simplifiedHomeLayout => 'Rögzített magasságot állít be minden hangjegy előnézetéhez';
	@override String get autoStraightenLines => 'Kiegyenesíti a hosszú vonalakat anélkül, hogy az alakos tollat ​​kellene használnia';
	@override String get shapeRecognitionDelay => 'Milyen gyakran kell frissíteni az alakzat előnézetét';
	@override String get printPageIndicators => 'Mutasson oldalmutatókat az exportban';
	@override String get allowInsecureConnections => '(Nem ajánlott) Engedélyezze a Saber-nek, hogy csatlakozzon önaláírt/nem megbízható tanúsítványokkal rendelkező szerverekhez';
	@override String get autosaveDelay => 'Mennyi ideig kell várni a jegyzet automatikus mentése előtt';
	@override String get shouldAlwaysAlertForUpdates => 'Szóljon nekem a frissítésekről, amint elérhetők';
	@override String get disableEraserAfterUse => 'A radír használata után automatikusan visszavált a tollra';
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesHu extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get system => 'Rendszer';
	@override String get light => 'Világos';
	@override String get dark => 'Sötét';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesHu extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Automata';
	@override String get phone => 'Telefon';
	@override String get tablet => 'Tabletta';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerHu extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Szín kiválasztása';
}

// Path: settings.reset
class _TranslationsSettingsResetHu extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Visszaállítsa ezt a beállítást?';
	@override String get button => 'Visszaállítás';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirHu extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Megszünteti';
	@override String get select => 'Válassza ki';
	@override String get mustBeEmpty => 'A kiválasztott könyvtárnak üresnek kell lennie';
	@override String get mustBeDoneSyncing => 'A könyvtár módosítása előtt győződjön meg arról, hogy a szinkronizálás befejeződött';
}

// Path: login.form
class _TranslationsLoginFormHu extends TranslationsLoginFormEn {
	_TranslationsLoginFormHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'A bejelentkezéssel elfogadja a '),
		linkToPrivacyPolicy('Adatvédelmi irányelvek'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusHu extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Kijelentkezve';
	@override String get tapToLogin => 'Kattintson a Nextclouddal való bejelentkezéshez';
	@override String get loggedIn => 'Bejelentkezve a Nextclouddal';
	@override String hi({required Object u}) => 'Szia ${u}!';
	@override String get almostDone => 'Szinte készen áll a szinkronizálásra, érintse meg a bejelentkezés befejezéséhez';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepHu extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsLoginNcLoginStepLoginFlowHu loginFlow = _TranslationsLoginNcLoginStepLoginFlowHu._(_root);
	@override String get whereToStoreData => 'Válassza ki, hol szeretné tárolni adatait:';
	@override String get saberNcServer => 'A Saber Nextcloud szervere';
	@override String get otherNcServer => 'Más Nextcloud szerver';
	@override String get serverUrl => 'Szerver URL';
	@override String get loginWithSaber => 'Jelentkezzen be Saber segítségével';
	@override String get loginWithNextcloud => 'Jelentkezzen be a Nextcloud segítségével';
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepHu extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Adatai védelme érdekében adja meg titkosítási jelszavát:';
	@override String get newToSaber => 'Új a Saber';
	@override String get encPassword => 'Titkosító jelszó';
	@override String get encFaqTitle => 'Gyakran Ismételt Kérdések';
	@override String get wrongEncPassword => 'A visszafejtés nem sikerült a megadott jelszóval. Kérjük, próbálja meg újra megadni.';
	@override String get connectionFailed => 'Hiba történt a szerverhez való csatlakozáskor. Kérlek, próbáld újra később.';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$Hu._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$Hu._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$Hu._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksHu extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Szerver honlapja';
	@override String get deleteAccount => 'Fiók törlése';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$Hu extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$Hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Elveszítem a jegyzeteimet, ha bejelentem?';
	@override String get a => 'Nem. Jegyzetei az eszközön és a szerveren is megmaradnak. Nem lesznek szinkronizálva a szerverrel, amíg újra be nem jelentkezik. A kijelentkezés előtt győződjön meg arról, hogy a szinkronizálás befejeződött, hogy ne veszítsen adatot (lásd a szinkronizálás folyamatát a kezdőképernyőn).';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$Hu extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$Hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Hogyan változtathatom meg a Nextcloud jelszavamat?';
	@override String get a => 'Nyissa meg a szerver webhelyét, és jelentkezzen be. Ezután lépjen a Beállítások > Biztonság > Jelszó módosítása menüpontra. Jelszava megváltoztatása után ki kell jelentkeznie, majd újra be kell jelentkeznie a Saberbe.';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$Hu extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$Hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Hogyan változtathatom meg a titkosítási jelszavamat?';
	@override String get a => '1. Jelentkezzen ki a Saberből. A kijelentkezés előtt győződjön meg arról, hogy a szinkronizálás befejeződött, hogy ne veszítsen adatot (lásd a szinkronizálás folyamatát a kezdőképernyőn).\n2. Nyissa meg a szerver webhelyét, és törölje a „Saber” mappát. Ezzel törli az összes jegyzetét a szerverről.\n3. Jelentkezzen be újra a Saberbe. Belépéskor választhat új titkosítási jelszót.\n4. Ne felejtsen el kijelentkezni és újra bejelentkezni a Saber szolgáltatásba a többi eszközén sem.';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$Hu extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$Hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Hogyan törölhetem a fiókomat?';
	@override String get a => 'Koppintson a fenti "${_root.profile.quickLinks.deleteAccount}" gombra, és ha szükséges, jelentkezzen be.\nHa a hivatalos Saber szervert használja, fiókja 1 hetes türelmi időszak után törlődik. Ebben az időszakban felveheti velem a kapcsolatot az adilhanney@disroot.org címen a törlés visszavonásához.\nHa harmadik féltől származó szervert használ, előfordulhat, hogy nincs lehetőség fiókja törlésére: további információkért olvassa el a szerver adatvédelmi szabályzatát.';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarHu extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarHu._(TranslationsHu root) : this._root = root, super.internal(root);

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
class _TranslationsEditorPensHu extends TranslationsEditorPensEn {
	_TranslationsEditorPensHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Töltőtoll';
	@override String get ballpointPen => 'Golyóstoll';
	@override String get highlighter => 'Kiemelő';
	@override String get pencil => 'Ceruza';
	@override String get shapePen => 'Forma toll';
	@override String get laserPointer => 'Lézer mutató';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsHu extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get size => 'Méret';
}

// Path: editor.colors
class _TranslationsEditorColorsHu extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String customBrightnessHue({required Object b, required Object h}) => 'Egyedi ${b} ${h}';
	@override String customHue({required Object h}) => 'Egyedi ${h}';
	@override String get dark => 'sötét';
	@override String get light => 'fény';
	@override String get cyan => 'Cián';
	@override String get pink => 'Rózsaszín';
	@override String get colorPicker => 'Színválasztó';
	@override String get black => 'Fekete';
	@override String get darkGrey => 'Sötét szürke';
	@override String get grey => 'Szürke';
	@override String get lightGrey => 'Világos szürke';
	@override String get white => 'fehér';
	@override String get red => 'Piros';
	@override String get green => 'Zöld';
	@override String get blue => 'Kék';
	@override String get yellow => 'Sárga';
	@override String get purple => 'Lila';
	@override String get orange => 'narancs';
	@override String get pastelRed => 'Pasztell vörös';
	@override String get pastelOrange => 'Pasztell narancs';
	@override String get pastelYellow => 'Pasztell sárga';
	@override String get pastelGreen => 'Pasztell zöld';
	@override String get pastelCyan => 'Pasztell cián';
	@override String get pastelBlue => 'Pasztell kék';
	@override String get pastelPurple => 'Pasztell lila';
	@override String get pastelPink => 'Pasztell rózsaszín';
}

// Path: editor.imageOptions
class _TranslationsEditorImageOptionsHu extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kép opciók';
	@override String get invertible => 'Megfordítható';
	@override String get download => 'Letöltés';
	@override String get setAsBackground => 'Beállítás háttérképként';
	@override String get delete => 'Törlés';
	@override String get removeAsBackground => 'Eltávolítás háttérként';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarHu extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Törlés';
	@override String get duplicate => 'Másolat';
}

// Path: editor.menu
class _TranslationsEditorMenuHu extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get clearAllPages => 'Összes oldal törlése';
	@override String get lineHeight => 'Vonalmagasság';
	@override String get backgroundPattern => 'Háttérminta';
	@override String get import => 'Importálás';
	@override late final _TranslationsEditorMenuBoxFitsHu boxFits = _TranslationsEditorMenuBoxFitsHu._(_root);
	@override late final _TranslationsEditorMenuBgPatternsHu bgPatterns = _TranslationsEditorMenuBgPatternsHu._(_root);
	@override String get lineThickness => 'Vonalvastagság';
	@override String get lineThicknessDescription => 'Háttérvonal vastagsága';
	@override String get watchServer => 'Figyelje a frissítéseket a szerveren';
	@override String get watchServerReadOnly => 'A szerver figyelése közben a szerkesztés le van tiltva';
	@override String get lineHeightDescription => 'A beírt jegyzetek szövegméretét is szabályozza';
	@override String get backgroundImageFit => 'Háttérkép';
	@override String clearPage({required Object page, required Object totalPages}) => '${page}/${totalPages} oldal törlése';
	@override String get insertPage => 'Az oldal beszúrása alább';
	@override String get duplicatePage => 'Ismétlődő oldal';
	@override String get deletePage => 'Oldal törlése';
}

// Path: editor.newerFileFormat
class _TranslationsEditorNewerFileFormatHu extends TranslationsEditorNewerFileFormatEn {
	_TranslationsEditorNewerFileFormatHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Csak olvasható mód';
	@override String get title => 'Ezt a jegyzetet a Saber egy újabb verziójával lett szerkesztve';
	@override String get subtitle => 'A jegyzet szerkesztése bizonyos információk elvesztését eredményezheti. Szeretné ezt figyelmen kívül hagyni, és mégis szerkeszteni?';
	@override String get allowEditing => 'Szerkesztés engedélyezése';
}

// Path: editor.quill
class _TranslationsEditorQuillHu extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Gépeljen ide valamit...';
}

// Path: editor.hud
class _TranslationsEditorHudHu extends TranslationsEditorHudEn {
	_TranslationsEditorHudHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Nagyítás feloldása';
	@override String get lockZoom => 'Nagyítás feloldása';
	@override String get unlockSingleFingerPan => 'Egyujjas lapozás engedélyezése';
	@override String get lockSingleFingerPan => 'Egyujjas lapozás letiltása';
	@override String get unlockAxisAlignedPan => 'Oldja fel a pásztázást vízszintesre vagy függőlegesre';
	@override String get lockAxisAlignedPan => 'A pásztázás rögzítése vízszintesre vagy függőlegesre';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingHu extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Megakadályozza a véletlen átkapcsolást';
	@override String get fixedOn => 'Az ujjlenyomat rögzítése engedélyezett állapotban van';
	@override String get fixedOff => 'Az ujjrajzolás letiltva van rögzítve';
}

// Path: settings.prefDescriptions.pencilSoundSetting
class _TranslationsSettingsPrefDescriptionsPencilSoundSettingHu extends TranslationsSettingsPrefDescriptionsPencilSoundSettingEn {
	_TranslationsSettingsPrefDescriptionsPencilSoundSettingHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get off => 'Nincs hang';
	@override String get onButNotInSilentMode => 'Engedélyezve (kivéve, ha néma módban van)';
	@override String get onAlways => 'Engedélyezve (néma módban is)';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowHu extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Engedélyezze a Saber-t, hogy hozzáférjen Nextcloud-fiókjához';
	@override String get followPrompts => 'Kérjük, kövesse a böngészőjében megjelenő utasításokat.';
	@override String get browserDidntOpen => 'A böngésző nem nyílt meg';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$Hu extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$Hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Mi a titkosítási jelszó?';
	@override String get a => 'A titkosítási jelszó az adatok titkosítására szolgál, mielőtt elküldené azokat a szervernek. Ezt választja ki, amikor először jelentkezik be a Saberbe, és nem kapcsolódik Nextcloud-fiókjához/jelszavához.\nSenki sem férhet hozzá a kiszolgálón lévő jegyzeteihez az Ön titkosítási jelszava nélkül. Ez azt is jelenti, hogy ha elfelejti titkosítási jelszavát, elveszíti hozzáférését az adataihoz.';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$Hu extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$Hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Miért használjunk két jelszót?';
	@override String get a => 'A Nextcloud jelszó a felhő eléréséhez használható. A titkosítási jelszó „összekeveri” az adatait, mielőtt azok elérnék a felhőt.\nMég akkor is, ha valaki hozzáfér a Nextcloud-fiókjához, jegyzetei biztonságban maradnak, és külön jelszóval titkosítva lesznek. Ez egy második biztonsági réteget biztosít az adatok védelméhez.';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$Hu extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$Hu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Használhatom mindkettőhöz ugyanazt a jelszót?';
	@override String get a => 'Igen, de ez kevésbé biztonságos. Mivel a Nextcloud jelszava elküldésre kerül a szervernek, valaki, aki hozzáfér a szerverhez, képes lesz visszafejteni a jegyzeteit. Csak akkor használja ugyanazt a jelszót, ha megbízik a szerver tulajdonosában.';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsHu extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Nyújtás';
	@override String get cover => 'Átfed';
	@override String get contain => 'Tartalmaz';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsHu extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsHu._(TranslationsHu root) : this._root = root, super.internal(root);

	final TranslationsHu _root; // ignore: unused_field

	// Translations
	@override String get none => 'Üres';
	@override String get college => 'College-ruled';
	@override String get lined => 'Vonalas';
	@override String get grid => 'Kockás';
	@override String get dots => 'Pontozott';
	@override String get collegeRtl => 'Főiskolai szabályozás (fordított)';
	@override String get staffs => 'Vezetők';
	@override String get cornell => 'Cornell';
	@override String get tablature => 'Tablatúra';
}
