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
class TranslationsDe extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsDe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsDe _root = this; // ignore: unused_field

	@override 
	TranslationsDe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDe(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonDe common = _TranslationsCommonDe._(_root);
	@override late final _TranslationsHomeDe home = _TranslationsHomeDe._(_root);
	@override late final _TranslationsSettingsDe settings = _TranslationsSettingsDe._(_root);
	@override late final _TranslationsLogsDe logs = _TranslationsLogsDe._(_root);
	@override late final _TranslationsLoginDe login = _TranslationsLoginDe._(_root);
	@override late final _TranslationsProfileDe profile = _TranslationsProfileDe._(_root);
	@override late final _TranslationsAppInfoDe appInfo = _TranslationsAppInfoDe._(_root);
	@override late final _TranslationsUpdateDe update = _TranslationsUpdateDe._(_root);
	@override late final _TranslationsEditorDe editor = _TranslationsEditorDe._(_root);
}

// Path: common
class _TranslationsCommonDe extends TranslationsCommonEn {
	_TranslationsCommonDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get done => 'Fertig';
	@override String get continueBtn => 'Weiter';
	@override String get cancel => 'Abbruch';
}

// Path: home
class _TranslationsHomeDe extends TranslationsHomeEn {
	_TranslationsHomeDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsDe tabs = _TranslationsHomeTabsDe._(_root);
	@override late final _TranslationsHomeTitlesDe titles = _TranslationsHomeTitlesDe._(_root);
	@override late final _TranslationsHomeTooltipsDe tooltips = _TranslationsHomeTooltipsDe._(_root);
	@override late final _TranslationsHomeCreateDe create = _TranslationsHomeCreateDe._(_root);
	@override String get welcome => 'Willkommen bei Saber';
	@override String get invalidFormat => 'Die ausgewählte Datei wird nicht unterstützt. Bitte wähle eine Datei mit dem Format sbn, sbn2, sba oder pdf.';
	@override String get noFiles => 'Keine Dateien gefunden';
	@override String get noPreviewAvailable => 'Keine Vorschau verfügbar';
	@override String get createNewNote => 'Drücke die + Schaltfläche, um eine neue Notiz zu erstellen';
	@override String get backFolder => 'Zum vorherigen Ordner zurück gehen';
	@override late final _TranslationsHomeNewFolderDe newFolder = _TranslationsHomeNewFolderDe._(_root);
	@override late final _TranslationsHomeRenameNoteDe renameNote = _TranslationsHomeRenameNoteDe._(_root);
	@override late final _TranslationsHomeMoveNoteDe moveNote = _TranslationsHomeMoveNoteDe._(_root);
	@override String get deleteNote => 'Notiz löschen';
	@override late final _TranslationsHomeRenameFolderDe renameFolder = _TranslationsHomeRenameFolderDe._(_root);
	@override late final _TranslationsHomeDeleteFolderDe deleteFolder = _TranslationsHomeDeleteFolderDe._(_root);
}

// Path: settings
class _TranslationsSettingsDe extends TranslationsSettingsEn {
	_TranslationsSettingsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesDe prefCategories = _TranslationsSettingsPrefCategoriesDe._(_root);
	@override late final _TranslationsSettingsPrefLabelsDe prefLabels = _TranslationsSettingsPrefLabelsDe._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsDe prefDescriptions = _TranslationsSettingsPrefDescriptionsDe._(_root);
	@override late final _TranslationsSettingsThemeModesDe themeModes = _TranslationsSettingsThemeModesDe._(_root);
	@override late final _TranslationsSettingsLayoutSizesDe layoutSizes = _TranslationsSettingsLayoutSizesDe._(_root);
	@override late final _TranslationsSettingsAccentColorPickerDe accentColorPicker = _TranslationsSettingsAccentColorPickerDe._(_root);
	@override String get systemLanguage => 'Systemsprache';
	@override List<String> get axisDirections => [
		'Oben',
		'Rechts',
		'Unten',
		'Links',
	];
	@override late final _TranslationsSettingsResetDe reset = _TranslationsSettingsResetDe._(_root);
	@override String get resyncEverything => 'Alles neu Synchronisieren';
	@override String get openDataDir => 'Saber-Ordner öffnen';
	@override late final _TranslationsSettingsCustomDataDirDe customDataDir = _TranslationsSettingsCustomDataDirDe._(_root);
}

// Path: logs
class _TranslationsLogsDe extends TranslationsLogsEn {
	_TranslationsLogsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Protokolle';
	@override String get viewLogs => 'Protokolle anzeigen';
	@override String get debuggingInfo => 'Protokolle enthalten Informationen, die für die Fehlerbehebung und Entwicklung nützlich sind';
	@override String get noLogs => 'Hier gibt es keine Protokolle!';
	@override String get logsAreTemporary => 'Protokolle werden nur so lange gespeichert, bis Sie die App schließen';
}

// Path: login
class _TranslationsLoginDe extends TranslationsLoginEn {
	_TranslationsLoginDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Login';
	@override late final _TranslationsLoginFormDe form = _TranslationsLoginFormDe._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Du hast noch kein Konto? '),
		linkToSignup('Erstelle jetzt eins'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'Nicht du? '),
		undoLogin('Wähle ein anderes Konto'),
		const TextSpan(text: '.'),
	]);
	@override late final _TranslationsLoginStatusDe status = _TranslationsLoginStatusDe._(_root);
	@override late final _TranslationsLoginNcLoginStepDe ncLoginStep = _TranslationsLoginNcLoginStepDe._(_root);
	@override late final _TranslationsLoginEncLoginStepDe encLoginStep = _TranslationsLoginEncLoginStepDe._(_root);
}

// Path: profile
class _TranslationsProfileDe extends TranslationsProfileEn {
	_TranslationsProfileDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mein Profil';
	@override String get logout => 'Abmelden';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Du verwendest ${used} von ${total} (${percent}%)';
	@override String get connectedTo => 'Verbunden mit';
	@override late final _TranslationsProfileQuickLinksDe quickLinks = _TranslationsProfileQuickLinksDe._(_root);
	@override String get faqTitle => 'Häufig gestellte Fragen';
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$De._(_root),
		_TranslationsProfile$faq$0i1$De._(_root),
		_TranslationsProfile$faq$0i2$De._(_root),
		_TranslationsProfile$faq$0i3$De._(_root),
	];
}

// Path: appInfo
class _TranslationsAppInfoDe extends TranslationsAppInfoEn {
	_TranslationsAppInfoDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nDieses Programm kommt ohne jegliche Gewährleistung. Dies ist freie Software und du bist herzlich eingeladen, diese unter bestimmten Bedingungen weiterzuverteilen.';
	@override String get dirty => 'TESTVERSION';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Hier tippen, um mich zu unterstützen oder mehr Speicherplatz zu kaufen';
	@override String get licenseButton => 'Hier tippen, um weitere Lizenzinformationen anzuzeigen';
	@override String get privacyPolicyButton => 'Hier tippen, um die Datenschutzrichtlinie anzuzeigen';
}

// Path: update
class _TranslationsUpdateDe extends TranslationsUpdateEn {
	_TranslationsUpdateDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Aktualisierung verfügbar';
	@override String get updateAvailableDescription => 'Eine neue Version der App ist verfügbar, mit folgenden Änderungen:';
	@override String get update => 'Aktualisieren';
	@override String get downloadNotAvailableYet => 'Der Download ist für deine Platform noch nicht verfügbar. Bitte schaue in Kürze noch einmal nach.';
}

// Path: editor
class _TranslationsEditorDe extends TranslationsEditorEn {
	_TranslationsEditorDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarDe toolbar = _TranslationsEditorToolbarDe._(_root);
	@override late final _TranslationsEditorPensDe pens = _TranslationsEditorPensDe._(_root);
	@override late final _TranslationsEditorPenOptionsDe penOptions = _TranslationsEditorPenOptionsDe._(_root);
	@override late final _TranslationsEditorColorsDe colors = _TranslationsEditorColorsDe._(_root);
	@override late final _TranslationsEditorImageOptionsDe imageOptions = _TranslationsEditorImageOptionsDe._(_root);
	@override late final _TranslationsEditorSelectionBarDe selectionBar = _TranslationsEditorSelectionBarDe._(_root);
	@override late final _TranslationsEditorMenuDe menu = _TranslationsEditorMenuDe._(_root);
	@override late final _TranslationsEditorNewerFileFormatDe newerFileFormat = _TranslationsEditorNewerFileFormatDe._(_root);
	@override late final _TranslationsEditorQuillDe quill = _TranslationsEditorQuillDe._(_root);
	@override late final _TranslationsEditorHudDe hud = _TranslationsEditorHudDe._(_root);
	@override String get pages => 'Seiten';
	@override String get untitled => 'Unbenannt';
	@override String get needsToSaveBeforeExiting => 'Deine Änderungen werden gespeichert... Du kannst den Editor ohne Datenverlust verlassen, sobald der Vorgang beendet ist.';
}

// Path: home.tabs
class _TranslationsHomeTabsDe extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get home => 'Startseite';
	@override String get browse => 'Durchsuchen';
	@override String get whiteboard => 'Whiteboard';
	@override String get settings => 'Einstellungen';
}

// Path: home.titles
class _TranslationsHomeTitlesDe extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get home => 'Letzte Notizen';
	@override String get browse => 'Durchsuchen';
	@override String get whiteboard => 'Whiteboard';
	@override String get settings => 'Einstellungen';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsDe extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Notiz erstellen';
	@override String get showUpdateDialog => 'Aktualisierungsdialog anzeigen';
	@override String get exportNote => 'Notiz exportieren';
}

// Path: home.create
class _TranslationsHomeCreateDe extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Neue Notiz';
	@override String get importNote => 'Notiz importieren';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderDe extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Neuer Ordner';
	@override String get folderName => 'Ordnername';
	@override String get create => 'Erstellen';
	@override String get folderNameEmpty => 'Ordnername darf nicht leer sein';
	@override String get folderNameContainsSlash => 'Ordnernamen dürfen keine Schrägstriche enthalten';
	@override String get folderNameExists => 'Ordner existiert bereits';
}

// Path: home.renameNote
class _TranslationsHomeRenameNoteDe extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Notiz umbenennen';
	@override String get noteName => 'Name der Notiz';
	@override String get rename => 'Umbenennen';
	@override String get noteNameEmpty => 'Name der Notiz darf nicht leer sein';
	@override String get noteNameContainsSlash => 'Name der Notiz darf keinen Schrägstrich enthalten';
	@override String get noteNameExists => 'Notiz mit diesem Namen existiert bereits';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteDe extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Notiz verschieben';
	@override String moveNotes({required Object n}) => 'Verschiebe ${n} Notizen';
	@override String moveName({required Object f}) => 'verschiebe ${f}';
	@override String get move => 'Verschieben';
	@override String renamedTo({required Object newName}) => 'Notiz wird umbenannt zu ${newName}';
	@override String get multipleRenamedTo => 'Die folgenden Notizen werden umbenannt:';
	@override String numberRenamedTo({required Object n}) => '${n} Notizen werden umbenannt, um Konfilkte zu vermeiden';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderDe extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Ordner umbenennen';
	@override String get folderName => 'Ordner-Name';
	@override String get rename => 'Umbenennen';
	@override String get folderNameEmpty => 'Ordner-Name darf nicht leer sin';
	@override String get folderNameContainsSlash => 'Order-Name darf keinen Schrägstrich beinhalten';
	@override String get folderNameExists => 'Ein Ordner mit dem Namen existiert bereits';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderDe extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Ordner löschen';
	@override String deleteName({required Object f}) => '${f} löschen';
	@override String get delete => 'LÖschen';
	@override String get alsoDeleteContents => 'Auch alle Notizen in diesem Ordner löschen';
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesDe extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get general => 'Allgemein';
	@override String get writing => 'Eingabe';
	@override String get editor => 'Editor';
	@override String get performance => 'Leistung';
	@override String get advanced => 'Erweitert';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsDe extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Sprache';
	@override String get appTheme => 'Anwendungsthema';
	@override String get platform => 'Oberfläche';
	@override String get layoutSize => 'Größe des Layouts';
	@override String get customAccentColor => 'Benutzerdefinierte Akzentfarbe';
	@override String get hyperlegibleFont => 'Hyperlesbare Schrift';
	@override String get shouldCheckForUpdates => 'Suche automatisch nach Saber-Aktualisierungen';
	@override String get shouldAlwaysAlertForUpdates => 'Schneller aktualisieren';
	@override String get allowInsecureConnections => 'Unsichere Verbindung erlauben';
	@override String get editorToolbarAlignment => 'Position der Werkzeugleiste';
	@override String get editorToolbarShowInFullscreen => 'Zeige die Werkzeugleiste im Vollbild';
	@override String get editorAutoInvert => 'Notizen im Dunkelmodus invertieren';
	@override String get preferGreyscale => 'Graustufen bevorzugen';
	@override String get maxImageSize => 'Maximale Bildgröße';
	@override String get autoClearWhiteboardOnExit => 'Lösche das Whiteboard nach Verlassen der Anwendung';
	@override String get disableEraserAfterUse => 'Radierer automatisch deaktivieren';
	@override String get hideFingerDrawingToggle => 'Umschalter des Finger-Zeichnens ausblenden';
	@override String get editorPromptRename => 'Beim Erstellen von Notizen einen Namen erfragen';
	@override String get hideHomeBackgrounds => 'Hintergrund auf dem Startbildschirm verbergen';
	@override String get recentColorsDontSavePresets => 'Farbvorlagen nicht in den zuletzt genutzten Farben speichern';
	@override String get recentColorsLength => 'Anzahl der zuletzt genutzten Farben';
	@override String get printPageIndicators => 'Seitennummerierung drucken';
	@override String get autosaveDelay => 'Verzögerung des automatischen Speicherns';
	@override String get shapeRecognitionDelay => 'Verzögerung der Formerkennung';
	@override String get autoStraightenLines => 'Linien automatisch begradigen';
	@override String get simplifiedHomeLayout => 'Vereinfachtes Startbildschirmlayout';
	@override String get customDataDir => 'Eigener Saber-Ordner';
	@override String get pencilSoundSetting => 'Bleistiftgeräusch';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsDe extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible verbessert die Lesbarkeit für Menschen mit eingeschränkter Sicht';
	@override String get allowInsecureConnections => '(Nicht empfohlen) Saber erlauben, sich mit selbstsignierten/unsicheren Zertifikaten zu verbinden';
	@override String get preferGreyscale => 'Für E-Ink-Bildschirme';
	@override String get autoClearWhiteboardOnExit => 'Es wird dennoch mit deinen anderen Geräten synchronisiert';
	@override String get disableEraserAfterUse => 'Nach dem Nutzen des Radierers automatisch zum Stift zurückwechseln';
	@override String get maxImageSize => 'Bilder, die größer sind, werden komprimiert';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingDe hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingDe._(_root);
	@override String get editorPromptRename => 'Notizen können später immer noch umbenannt werden';
	@override String get hideHomeBackgrounds => 'Für ein sauberes Aussehen';
	@override String get printPageIndicators => 'Seitennummerierung bei Export anzeigen';
	@override String get autosaveDelay => 'Verzögerung des automatischen Speicherns einer Notiz';
	@override String get shapeRecognitionDelay => 'Häufigkeit der Aktualisierung der Form-Vorschau';
	@override String get autoStraightenLines => 'Lange Linien selbst ohne Form-Stift begradigen';
	@override String get simplifiedHomeLayout => 'Legt eine feste Höhe für jede Notizvorschau fest';
	@override String get shouldAlwaysAlertForUpdates => 'Über neue Updates informiert bleiben';
	@override late final _TranslationsSettingsPrefDescriptionsPencilSoundSettingDe pencilSoundSetting = _TranslationsSettingsPrefDescriptionsPencilSoundSettingDe._(_root);
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesDe extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get light => 'Hell';
	@override String get dark => 'Dunkel';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesDe extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Automatisch';
	@override String get phone => 'Handy';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerDe extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Wähle eine Farbe';
}

// Path: settings.reset
class _TranslationsSettingsResetDe extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Diese Einstellung zurücksetzen?';
	@override String get button => 'Zurücksetzen';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirDe extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Abbrechen';
	@override String get select => 'Auswählen';
	@override String get mustBeEmpty => 'Ausgewählter Ordner muss leer sein';
	@override String get mustBeDoneSyncing => 'Stelle sicher, dass die Synchronisierung abgeschlossen ist, bevor du den Ordner wechselst';
}

// Path: login.form
class _TranslationsLoginFormDe extends TranslationsLoginFormEn {
	_TranslationsLoginFormDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Indem du dich anmeldest, stimmst du der '),
		linkToPrivacyPolicy('Datenschutzrichtlinie'),
		const TextSpan(text: ' zu.'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusDe extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Nicht angemeldet';
	@override String get tapToLogin => 'Hier tippen, um dich mit Nextcloud anzumelden';
	@override String hi({required Object u}) => 'Hi, ${u}!';
	@override String get almostDone => 'Fast bereit zum Synchronisieren. Tippe, um die Anmeldung abzuschließen';
	@override String get loggedIn => 'Mit Nextcloud angemeldet';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepDe extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'Wähle, wo du deine Daten speichern willst:';
	@override String get saberNcServer => 'Sabers Nextcloud-Server';
	@override String get otherNcServer => 'Anderer Nextcloud-Server';
	@override String get serverUrl => 'Server URL';
	@override String get loginWithSaber => 'Mit Saber anmelden';
	@override String get loginWithNextcloud => 'Mit Nextcloud anmelden';
	@override late final _TranslationsLoginNcLoginStepLoginFlowDe loginFlow = _TranslationsLoginNcLoginStepLoginFlowDe._(_root);
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepDe extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Gib dein Verschlüsselungspasswort an, um deine Daten zu schützen:';
	@override String get newToSaber => 'Neu bei Saber? Gib einfach ein neues Verschlüsselungspasswort an.';
	@override String get encPassword => 'Verschlüsselungspasswort';
	@override String get encFaqTitle => 'Häufig gestellte Fragen';
	@override String get wrongEncPassword => 'Entschlüsselung mit dem angegebenen Passwort fehlgeschlagen. Bitte versuche es erneut einzugeben.';
	@override String get connectionFailed => 'Verbindung zum Server fehlgeschlagen. Bitte versuche es später erneut.';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$De._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$De._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$De._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksDe extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Server-Startseite';
	@override String get deleteAccount => 'Account löschen';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$De extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$De._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Verliere ich meine Notizen, wenn ich mich abmelde?';
	@override String get a => 'Nein. Deine Notizen bleiben auf deinem Gerät und auf dem Server. Sie werden erst wieder synchronisiert, wenn du dich erneut anmeldest. Um Datenverlust zu vermeiden, solltest du sicherstellen, dass alles korrekt synchronisiert wurde, bevor du dich abmeldest. Dazu kannst du auf dem Startbildschirm den Synchronisationsfortschritt überprüfen.';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$De extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$De._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Wie ändere ich mein Nextcloud-Passwort?';
	@override String get a => 'Öffne die Server-Startseite und melde dich an. Unter Einstellungen > Sicherheit > Passwort, kannst du dein Passwort ändern. Nachdem du dein Passwort geändert hast, musst du dich in Saber ab- und wieder anmelden.';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$De extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$De._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Wie ändere ich mein Verschlüsselungspasswort?';
	@override String get a => '0. Bitte stelle zuerst sicher, dass alle Daten korrekt synchronisiert wurden, damit du keine Daten verlierst (du kannst den Fortschritt auf dem Startbildschirm prüfen).\n1. Melde dich in Saber ab.\n2. Öffne die Server-Startseite und lösche den „Saber“-Order. Dadurch werden alle Notizen vom Server gelöscht.\n3. Melde dich wieder in Saber an. Du wirst nach einem neuen Verschlüsselungspasswort gefragt.\n4. Vergiss nicht dich auf anderen Geräten in Saber ab- und wieder anzumelden.';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$De extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$De._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Wie lösche ich meinen Account?';
	@override String get a => 'Drücke oben den „${_root.profile.quickLinks.deleteAccount}“-Button und melde dich gegebenenfalls an.\nWenn du den offiziellen Saber-Server nutzt, wird dein Account automatisch nach einer Woche gelöscht. Du kannst mich während dieser Woche unter adilhanney@disroot.org kontaktieren um die Löschung rückgängig zu machen.\nWenn du einen anderen Server nutzt, kann es sein, dass du deinen Account nicht löschen kannst: Für mehr Information kannst du in der Datenschutzbestimmung des Servers nachgucken.';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarDe extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Farben umschalten (Strg + C)';
	@override String get select => 'Auswählen';
	@override String get toggleEraser => 'Radierer umschalten (Strg + E)';
	@override String get photo => 'Foto';
	@override String get text => 'Text';
	@override String get toggleFingerDrawing => 'Fingerzeichnen umschalten (Strg + F)';
	@override String get undo => 'Rückgängig';
	@override String get redo => 'Wiederholen';
	@override String get export => 'Exportieren (Strg + Shift + S)';
	@override String get exportAs => 'Exportieren als:';
	@override String get fullscreen => 'Vollbild umschalten (F11)';
}

// Path: editor.pens
class _TranslationsEditorPensDe extends TranslationsEditorPensEn {
	_TranslationsEditorPensDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Füllfederhalter';
	@override String get ballpointPen => 'Kugelschreiber';
	@override String get highlighter => 'Textmarker';
	@override String get pencil => 'Bleistift';
	@override String get shapePen => 'Form-Stift';
	@override String get laserPointer => 'Laserpointer';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsDe extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get size => 'Dicke';
}

// Path: editor.colors
class _TranslationsEditorColorsDe extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Farbauswahl';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Custom ${b} ${h}';
	@override String customHue({required Object h}) => 'Custom ${h}';
	@override String get dark => 'dunkel';
	@override String get light => 'hell';
	@override String get black => 'Schwarz';
	@override String get darkGrey => 'Dunkelgrau';
	@override String get grey => 'Grau';
	@override String get lightGrey => 'Hellgrau';
	@override String get white => 'Weiß';
	@override String get red => 'Rot';
	@override String get green => 'Grün';
	@override String get cyan => 'Cyan';
	@override String get blue => 'Blau';
	@override String get yellow => 'Gelb';
	@override String get purple => 'Lila';
	@override String get pink => 'Pink';
	@override String get orange => 'Orange';
	@override String get pastelRed => 'Pastellfarbenes Rot';
	@override String get pastelOrange => 'Pastellfarbenes Orange';
	@override String get pastelYellow => 'Pastellfarbenes Gelb';
	@override String get pastelGreen => 'Pastellfarbenes Grün';
	@override String get pastelCyan => 'Pastellfarbenes Türkis';
	@override String get pastelBlue => 'Pastellfarbenes Blau';
	@override String get pastelPurple => 'Pastellfarbenes Lila';
	@override String get pastelPink => 'Pastellfarbenes Rosa';
}

// Path: editor.imageOptions
class _TranslationsEditorImageOptionsDe extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bildoptionen';
	@override String get invertible => 'Invertierbar';
	@override String get download => 'Herunterladen';
	@override String get setAsBackground => 'Als Hintergrund festlegen';
	@override String get removeAsBackground => 'Hintergrund entfernen';
	@override String get delete => 'Entfernen';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarDe extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Entfernen';
	@override String get duplicate => 'Duplizieren';
}

// Path: editor.menu
class _TranslationsEditorMenuDe extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Seite ${page}/${totalPages} leeren';
	@override String get clearAllPages => 'Alle Seiten löschen';
	@override String get insertPage => 'Neue Seite unten anfügen';
	@override String get duplicatePage => 'Seite duplizieren';
	@override String get deletePage => 'Seite löschen';
	@override String get lineHeight => 'Zeilenhöhe';
	@override String get lineHeightDescription => 'Bestimmt ebenfalls die Textgröße der getippten Notizen';
	@override String get backgroundImageFit => 'Background image fit';
	@override String get backgroundPattern => 'Hintergrundmuster';
	@override String get import => 'Importieren';
	@override String get watchServer => 'Halte nach Aktualisierungen auf dem Server Ausschau';
	@override String get watchServerReadOnly => 'Bearbeiten ist deaktiviert, solange du den Server beobachtest';
	@override late final _TranslationsEditorMenuBoxFitsDe boxFits = _TranslationsEditorMenuBoxFitsDe._(_root);
	@override late final _TranslationsEditorMenuBgPatternsDe bgPatterns = _TranslationsEditorMenuBgPatternsDe._(_root);
	@override String get lineThickness => 'Liniendicke';
	@override String get lineThicknessDescription => 'Hintergrundliniendicke';
}

// Path: editor.newerFileFormat
class _TranslationsEditorNewerFileFormatDe extends TranslationsEditorNewerFileFormatEn {
	_TranslationsEditorNewerFileFormatDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Schreibgeschützter Modus';
	@override String get title => 'Diese Notiz wurde mit einer neueren Version von Saber bearbeitet';
	@override String get subtitle => 'Durch das Bearbeiten dieser Notiz können Daten verloren gehen. Möchtest du sie trotzdem bearbeiten?';
	@override String get allowEditing => 'Schreibschutz aufheben';
}

// Path: editor.quill
class _TranslationsEditorQuillDe extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Hier tippen...';
}

// Path: editor.hud
class _TranslationsEditorHudDe extends TranslationsEditorHudEn {
	_TranslationsEditorHudDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Zoom entsperren';
	@override String get lockZoom => 'Zoom sperren';
	@override String get unlockSingleFingerPan => 'Verschieben mit einem Finger aktivieren';
	@override String get lockSingleFingerPan => 'Verschieben mit einem Finger deaktivieren';
	@override String get unlockAxisAlignedPan => 'Beschränkung der Horizontal- bzw. Vertikalverschiebung aufheben';
	@override String get lockAxisAlignedPan => 'Verschieben auf Horizontale oder Vertikale beschränken';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingDe extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Schützt vor versehentlichem Umschalten';
	@override String get fixedOn => 'Finger-Zeichnen ist als aktiviert festgelegt';
	@override String get fixedOff => 'Finger-Zeichnen ist als deaktiviert festgelegt';
}

// Path: settings.prefDescriptions.pencilSoundSetting
class _TranslationsSettingsPrefDescriptionsPencilSoundSettingDe extends TranslationsSettingsPrefDescriptionsPencilSoundSettingEn {
	_TranslationsSettingsPrefDescriptionsPencilSoundSettingDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get off => 'Kein Geräusch';
	@override String get onButNotInSilentMode => 'Aktiv (außer im Stummmodus)';
	@override String get onAlways => 'Aktiv (sogar im Stummmodus)';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowDe extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Bitte gib Saber Zugriff auf dein Nextcloud Konto';
	@override String get followPrompts => 'Bitte folge den Anweisungen in der Nextcloud-Oberfläche';
	@override String get browserDidntOpen => 'Die Anmeldeseite hat sich nicht geöffnet? Klicke hier';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$De extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$De._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Was ist ein Verschlüsselungspasswort? Wozu zwei Passwörter?';
	@override String get a => 'Mit dem Nextcloud-Passwort greifst du auf die Cloud zu. Das Verschlüsselungspasswort schützt deine Daten, bevor sie jemals die Cloud erreichen.\nSelbst wenn jemand Zugriff zu deinem Nextcloud-Konto erlangt, bleiben deine Notizen sicher und verschlüsselt mit einem separaten Passwort. Das bietet dir eine weitere Sicherheitsschicht zum Schutz deiner Daten.\nNiemand kann ohne dein Verschlüsselungspasswort auf deine Notizen auf dem Server zugreifen. Das bedeutet allerdings auch, dass du den Zugriff auf deine Daten verlierst, falls du dein Verschlüsselungspasswort vergisst.';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$De extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$De._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Ich habe noch kein Verschlüsselungspasswort festgelegt. Wo bekomme ich das her?';
	@override String get a => 'Wähle ein neues Verschlüsselungspasswort und gib es oben ein.\nSaber wird mit diesem Passwort automatisch deine Schlüssel generieren.';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$De extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$De._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Kann ich das gleiche Passwort wie bei meinem Nextcloud-Konto verwenden?';
	@override String get a => 'Ja, aber sei dir bewusst, dass es so für den Serveradministrator oder jemand anderen einfacher wäre, auf deine Notizen zuzugreifen, falls dieser Zugriff auf dein Nextcloud-Konto erlangt.';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsDe extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Dehnen';
	@override String get cover => 'Abdecken';
	@override String get contain => 'Beinhalten';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsDe extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get none => 'Leer';
	@override String get college => 'College';
	@override String get collegeRtl => 'College (umgekehrt)';
	@override String get lined => 'Liniert';
	@override String get grid => 'Kariert';
	@override String get dots => 'Gepunktet';
	@override String get staffs => 'Notenpapier';
	@override String get tablature => 'Tablature';
	@override String get cornell => 'Cornell-Stil';
}
