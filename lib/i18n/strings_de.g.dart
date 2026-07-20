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
class TranslationsDe extends Translations with BaseTranslations<AppLocale, Translations> {
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
	@override late final _Translations$common$de common = _Translations$common$de._(_root);
	@override late final _Translations$home$de home = _Translations$home$de._(_root);
	@override late final _Translations$sentry$de sentry = _Translations$sentry$de._(_root);
	@override late final _Translations$settings$de settings = _Translations$settings$de._(_root);
	@override late final _Translations$logs$de logs = _Translations$logs$de._(_root);
	@override late final _Translations$login$de login = _Translations$login$de._(_root);
	@override late final _Translations$profile$de profile = _Translations$profile$de._(_root);
	@override late final _Translations$appInfo$de appInfo = _Translations$appInfo$de._(_root);
	@override late final _Translations$update$de update = _Translations$update$de._(_root);
	@override late final _Translations$editor$de editor = _Translations$editor$de._(_root);
}

// Path: common
class _Translations$common$de extends Translations$common$en {
	_Translations$common$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get done => 'Fertig';
	@override String get continueBtn => 'Weiter';
	@override String get cancel => 'Abbrechen';
}

// Path: home
class _Translations$home$de extends Translations$home$en {
	_Translations$home$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$de tabs = _Translations$home$tabs$de._(_root);
	@override late final _Translations$home$titles$de titles = _Translations$home$titles$de._(_root);
	@override late final _Translations$home$tooltips$de tooltips = _Translations$home$tooltips$de._(_root);
	@override late final _Translations$home$create$de create = _Translations$home$create$de._(_root);
	@override String get welcome => 'Willkommen bei Saber';
	@override String get invalidFormat => 'Das ausgewählte Dateiformat wird nicht unterstützt. Bitte wähle eine Datei mit dem Format sbn, sbn2, sba oder pdf.';
	@override String get noFiles => 'Keine Dateien gefunden';
	@override String get noPreviewAvailable => 'Keine Vorschau verfügbar';
	@override String get createNewNote => 'Drücke + für das Erstellen einer neuen Notiz';
	@override String get backFolder => 'Zum vorherigen Ordner zurückkehren';
	@override late final _Translations$home$newFolder$de newFolder = _Translations$home$newFolder$de._(_root);
	@override late final _Translations$home$renameNote$de renameNote = _Translations$home$renameNote$de._(_root);
	@override late final _Translations$home$moveNote$de moveNote = _Translations$home$moveNote$de._(_root);
	@override String get deleteNote => 'Notiz löschen';
	@override late final _Translations$home$deleteNoteDialog$de deleteNoteDialog = _Translations$home$deleteNoteDialog$de._(_root);
	@override late final _Translations$home$renameFolder$de renameFolder = _Translations$home$renameFolder$de._(_root);
	@override late final _Translations$home$deleteFolder$de deleteFolder = _Translations$home$deleteFolder$de._(_root);
	@override late final _Translations$home$sort$de sort = _Translations$home$sort$de._(_root);
	@override late final _Translations$home$layout$de layout = _Translations$home$layout$de._(_root);
}

// Path: sentry
class _Translations$sentry$de extends Translations$sentry$en {
	_Translations$sentry$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$de consent = _Translations$sentry$consent$de._(_root);
}

// Path: settings
class _Translations$settings$de extends Translations$settings$en {
	_Translations$settings$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$de prefCategories = _Translations$settings$prefCategories$de._(_root);
	@override late final _Translations$settings$prefLabels$de prefLabels = _Translations$settings$prefLabels$de._(_root);
	@override late final _Translations$settings$prefDescriptions$de prefDescriptions = _Translations$settings$prefDescriptions$de._(_root);
	@override late final _Translations$settings$themeModes$de themeModes = _Translations$settings$themeModes$de._(_root);
	@override late final _Translations$settings$layoutSizes$de layoutSizes = _Translations$settings$layoutSizes$de._(_root);
	@override late final _Translations$settings$accentColorPicker$de accentColorPicker = _Translations$settings$accentColorPicker$de._(_root);
	@override String get systemLanguage => 'Systemsprache';
	@override List<String> get axisDirections => [
		'Oben',
		'Rechts',
		'Unten',
		'Links',
	];
	@override late final _Translations$settings$reset$de reset = _Translations$settings$reset$de._(_root);
	@override String get resyncEverything => 'Alles neu Synchronisieren';
	@override String get openDataDir => 'Saber-Ordner öffnen';
	@override late final _Translations$settings$customDataDir$de customDataDir = _Translations$settings$customDataDir$de._(_root);
	@override String get autosaveDisabled => 'Nie';
	@override String get shapeRecognitionDisabled => 'Nie';
}

// Path: logs
class _Translations$logs$de extends Translations$logs$en {
	_Translations$logs$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Protokolle';
	@override String get viewLogs => 'Protokolle anzeigen';
	@override String get debuggingInfo => 'Protokolle enthalten hilfreiche Informationen zur Fehlerbehebung und Weiterentwicklung';
	@override String get noLogs => 'Keine Protokolle vorhanden!';
	@override String get useTheApp => 'Protokolle erscheinen hier während der Nutzung der App';
}

// Path: login
class _Translations$login$de extends Translations$login$en {
	_Translations$login$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Login';
	@override late final _Translations$login$form$de form = _Translations$login$form$de._(_root);
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
	@override late final _Translations$login$status$de status = _Translations$login$status$de._(_root);
	@override late final _Translations$login$ncLoginStep$de ncLoginStep = _Translations$login$ncLoginStep$de._(_root);
	@override late final _Translations$login$encLoginStep$de encLoginStep = _Translations$login$encLoginStep$de._(_root);
}

// Path: profile
class _Translations$profile$de extends Translations$profile$en {
	_Translations$profile$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mein Profil';
	@override String get logout => 'Abmelden';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Du verwendest ${used} von ${total} (${percent}%)';
	@override String get connectedTo => 'Verbunden mit';
	@override late final _Translations$profile$quickLinks$de quickLinks = _Translations$profile$quickLinks$de._(_root);
	@override String get faqTitle => 'Häufig gestellte Fragen';
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$de._(_root),
		_Translations$profile$faq$1$de._(_root),
		_Translations$profile$faq$2$de._(_root),
		_Translations$profile$faq$3$de._(_root),
	];
}

// Path: appInfo
class _Translations$appInfo$de extends Translations$appInfo$en {
	_Translations$appInfo$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nDieses Programm kommt ohne jegliche Gewährleistung. Dies ist freie Software und du bist herzlich eingeladen, diese unter bestimmten Bedingungen weiterzuverteilen.';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Hier tippen, um mich zu unterstützen oder mehr Speicherplatz zu kaufen';
	@override String get licenseButton => 'Hier tippen, um weitere Lizenzinformationen anzuzeigen';
	@override String get privacyPolicyButton => 'Hier tippen, um die Datenschutzrichtlinie anzuzeigen';
}

// Path: update
class _Translations$update$de extends Translations$update$en {
	_Translations$update$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Aktualisierung verfügbar';
	@override String get updateAvailableDescription => 'Eine neue Version der App ist verfügbar, mit folgenden Änderungen:';
	@override String get update => 'Aktualisieren';
	@override String get downloadNotAvailableYet => 'Der Download ist für deine Platform noch nicht verfügbar. Bitte schaue in Kürze noch einmal nach.';
}

// Path: editor
class _Translations$editor$de extends Translations$editor$en {
	_Translations$editor$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$de toolbar = _Translations$editor$toolbar$de._(_root);
	@override late final _Translations$editor$pens$de pens = _Translations$editor$pens$de._(_root);
	@override late final _Translations$editor$penOptions$de penOptions = _Translations$editor$penOptions$de._(_root);
	@override late final _Translations$editor$colors$de colors = _Translations$editor$colors$de._(_root);
	@override late final _Translations$editor$imageOptions$de imageOptions = _Translations$editor$imageOptions$de._(_root);
	@override late final _Translations$editor$selectionBar$de selectionBar = _Translations$editor$selectionBar$de._(_root);
	@override late final _Translations$editor$menu$de menu = _Translations$editor$menu$de._(_root);
	@override late final _Translations$editor$readOnlyBanner$de readOnlyBanner = _Translations$editor$readOnlyBanner$de._(_root);
	@override late final _Translations$editor$versionTooNew$de versionTooNew = _Translations$editor$versionTooNew$de._(_root);
	@override late final _Translations$editor$quill$de quill = _Translations$editor$quill$de._(_root);
	@override late final _Translations$editor$hud$de hud = _Translations$editor$hud$de._(_root);
	@override String get pages => 'Seiten';
	@override String get untitled => 'Unbenannt';
	@override String get needsToSaveBeforeExiting => 'Deine Änderungen werden noch gespeichert... Warte einen Moment, um Datenverluste zu vermeiden.';
}

// Path: home.tabs
class _Translations$home$tabs$de extends Translations$home$tabs$en {
	_Translations$home$tabs$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get home => 'Startseite';
	@override String get browse => 'Durchsuchen';
	@override String get whiteboard => 'Whiteboard';
	@override String get settings => 'Einstellungen';
}

// Path: home.titles
class _Translations$home$titles$de extends Translations$home$titles$en {
	_Translations$home$titles$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get home => 'Letzte Notizen';
	@override String get browse => 'Durchsuchen';
	@override String get whiteboard => 'Whiteboard';
	@override String get settings => 'Einstellungen';
}

// Path: home.tooltips
class _Translations$home$tooltips$de extends Translations$home$tooltips$en {
	_Translations$home$tooltips$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Notiz erstellen';
	@override String get showUpdateDialog => 'Update-Info einblenden';
	@override String get exportNote => 'Notiz exportieren';
}

// Path: home.create
class _Translations$home$create$de extends Translations$home$create$en {
	_Translations$home$create$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Neue Notiz';
	@override String get importNote => 'Notiz importieren';
}

// Path: home.newFolder
class _Translations$home$newFolder$de extends Translations$home$newFolder$en {
	_Translations$home$newFolder$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Neuer Ordner';
	@override String get folderName => 'Ordnername';
	@override String get create => 'Erstellen';
	@override String get folderNameEmpty => 'Bitte Ordnernamen hinzufügen';
	@override String get folderNameContainsSlash => 'Ordnername darf keine Schrägstrich enthalten';
	@override String get folderNameExists => 'Ordner existiert bereits';
}

// Path: home.renameNote
class _Translations$home$renameNote$de extends Translations$home$renameNote$en {
	_Translations$home$renameNote$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Notiz umbenennen';
	@override String get noteName => 'Notizname';
	@override String get rename => 'Umbenennen';
	@override String get noteNameEmpty => 'Name der Notiz darf nicht leer sein';
	@override String get noteNameExists => 'Es existiert bereits eine Notiz mit dem Namen';
	@override String get noteNameForbiddenCharacters => 'Dateiname enthält unzulässige Zeichen';
	@override String get noteNameReserved => 'Dateiname bereits vergeben';
}

// Path: home.moveNote
class _Translations$home$moveNote$de extends Translations$home$moveNote$en {
	_Translations$home$moveNote$de._(TranslationsDe root) : this._root = root, super.internal(root);

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

// Path: home.deleteNoteDialog
class _Translations$home$deleteNoteDialog$de extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String deleteNotes({required Object n}) => 'Lösche ${n} Notizen';
	@override String deleteName({required Object f}) => 'Lösche ${f}';
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(n,
		one: 'Die ausgewählte Notiz für immer Löschen?',
		other: 'Die ausgewählte Notiz für immer Löschen?',
	);
	@override String get delete => 'Lösche';
}

// Path: home.renameFolder
class _Translations$home$renameFolder$de extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Ordner umbenennen';
	@override String get folderName => 'Ordnername';
	@override String get rename => 'Umbenennen';
	@override String get folderNameEmpty => 'Ordnername darf nicht leer sin';
	@override String get folderNameContainsSlash => 'Ordername darf keinen Schrägstrich beinhalten';
	@override String get folderNameExists => 'Ein Ordner mit dem Namen existiert bereits';
}

// Path: home.deleteFolder
class _Translations$home$deleteFolder$de extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Ordner löschen';
	@override String deleteName({required Object f}) => '${f} löschen';
	@override String get delete => 'Löschen';
	@override String get alsoDeleteContents => 'Alle weiteren Notizen in diesem Ordner löschen';
}

// Path: home.sort
class _Translations$home$sort$de extends Translations$home$sort$en {
	_Translations$home$sort$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get sortBy => 'Sortieren nach';
	@override String get nameAToZ => 'Name (A-Z)';
	@override String get nameZToA => 'Name (A-Z)';
	@override String get lastModifiedNewToOld => 'Bearbeitet (Neuestes zuerst)';
	@override String get lastModifiedOldToNew => 'Bearbeitet (Älteste zuerst)';
}

// Path: home.layout
class _Translations$home$layout$de extends Translations$home$layout$en {
	_Translations$home$layout$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get layout => 'Layout';
	@override String get masonryGrid => 'Mauerwerk-Raster';
	@override String get simpleGrid => 'Einfaches Raster';
}

// Path: sentry.consent
class _Translations$sentry$consent$de extends Translations$sentry$consent$en {
	_Translations$sentry$consent$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Helfen, Saber zu verbessern?';
	@override late final _Translations$sentry$consent$description$de description = _Translations$sentry$consent$description$de._(_root);
	@override late final _Translations$sentry$consent$answers$de answers = _Translations$sentry$consent$answers$de._(_root);
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$de extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get general => 'Allgemein';
	@override String get writing => 'Eingabe';
	@override String get editor => 'Editor';
	@override String get performance => 'Leistung';
	@override String get advanced => 'Erweitert';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$de extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Sprache';
	@override String get appTheme => 'Hintergrundfarbe';
	@override String get platform => 'Oberfläche';
	@override String get layoutSize => 'Größe des Layouts';
	@override String get customAccentColor => 'Benutzerdefinierte Akzentfarbe';
	@override String get hyperlegibleFont => 'Verbesserte Lesbarkeit der Schrift';
	@override String get shouldCheckForUpdates => 'Suche nach Updates für Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Schneller aktualisieren';
	@override String get allowInsecureConnections => 'Unsichere Verbindung erlauben';
	@override String get editorToolbarAlignment => 'Position der Toolleiste';
	@override String get editorToolbarShowInFullscreen => 'Toolleiste im Vollbildmodus einblenden';
	@override String get editorAutoInvert => 'Notizfarbe im Dark Modus anpassen';
	@override String get preferGreyscale => 'Graustufen bevorzugen';
	@override String get maxImageSize => 'Maximale Bildgröße';
	@override String get autoClearWhiteboardOnExit => 'Automatisches Löschen des Whiteboards nach Verlassen der Anwendung';
	@override String get disableEraserAfterUse => 'Radierer automatisch deaktivieren';
	@override String get hideFingerDrawingToggle => 'Taste für das manuelle Zeichnen ausblenden';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Manuelles Zeichnen automatisch deaktivieren';
	@override String get editorPromptRename => 'Aufgeforderte Namensvergabe beim Erstellen von Notizen';
	@override String get recentColorsDontSavePresets => 'Standardfarben nicht bei den zuletzt verwendeten Farben speichern';
	@override String get recentColorsLength => 'Anzahl der zuletzt genutzten Farben';
	@override String get printPageIndicators => 'Seitennummerierung drucken';
	@override String get autosave => 'Automatisches Backup';
	@override String get shapeRecognitionDelay => 'Verzögerung der Formerkennung';
	@override String get autoStraightenLines => 'Linien automatisch begradigen';
	@override String get customDataDir => 'Eigener Saber-Ordner';
	@override String get sentry => 'Fehlerberichterstattung';
}

// Path: settings.prefDescriptions
class _Translations$settings$prefDescriptions$de extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Verbessert die Lesbarkeit für Menschen mit geringer Sehkraft';
	@override String get allowInsecureConnections => 'Saber erlauben, unsichere Zertifikaten zu verwenden (Nicht empfohlen)';
	@override String get preferGreyscale => 'Optimierung für E-Ink-Displays';
	@override String get autoClearWhiteboardOnExit => 'Löscht das Whiteboard beim Beenden der App';
	@override String get disableEraserAfterUse => 'Nach dem Nutzen des Radierers automatisch zum Stift zurückwechseln';
	@override String get maxImageSize => 'Größere Bilder werden komprimiert';
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$de hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$de._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Schalte manuelles Zeichnen für die optimale Verwendung eines Eingabestiftes aus';
	@override String get editorPromptRename => 'Notizen können später immer noch umbenannt werden';
	@override String get printPageIndicators => 'Seitennummerierung beim Export anzeigen';
	@override String get autosave => 'Automatisches Backup in kurzen Abständen (wenn aktiviert)';
	@override String get shapeRecognitionDelay => 'Aktualisierungshäufigkeit der Vorschau';
	@override String get autoStraightenLines => 'Lange Linien auch ohne Formen-Stift automatisch begradigen';
	@override String get shouldAlwaysAlertForUpdates => 'Über neue Updates informiert bleiben';
	@override late final _Translations$settings$prefDescriptions$sentry$de sentry = _Translations$settings$prefDescriptions$sentry$de._(_root);
}

// Path: settings.themeModes
class _Translations$settings$themeModes$de extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get light => 'Hell';
	@override String get dark => 'Dunkel';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$de extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Automatisch';
	@override String get phone => 'Handy';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$de extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Wähle eine Farbe';
}

// Path: settings.reset
class _Translations$settings$reset$de extends Translations$settings$reset$en {
	_Translations$settings$reset$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Diese Einstellung zurücksetzen?';
	@override String get button => 'Zurücksetzen';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$de extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Abbrechen';
	@override String get select => 'Auswählen';
	@override String get mustBeEmpty => 'Ausgewählter Ordner muss leer sein';
	@override String get mustBeDoneSyncing => 'Stelle sicher, dass die Synchronisierung abgeschlossen ist, bevor du den Ordner wechselst';
	@override String get unsupported => 'Die Funktion ist zur Zeit nur für Entwickler gedacht. Die Verwendung führt wahrscheinlich zu Datenverlust.';
}

// Path: login.form
class _Translations$login$form$de extends Translations$login$form$en {
	_Translations$login$form$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Indem du dich anmeldest, stimmst du der '),
		linkToPrivacyPolicy('Datenschutzrichtlinie'),
		const TextSpan(text: ' zu.'),
	]);
}

// Path: login.status
class _Translations$login$status$de extends Translations$login$status$en {
	_Translations$login$status$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Nicht angemeldet';
	@override String get tapToLogin => 'Hier tippen, um dich mit Nextcloud anzumelden';
	@override String hi({required Object u}) => 'Hi, ${u}!';
	@override String get almostDone => 'Fast bereit zum Synchronisieren. Tippe, um die Anmeldung abzuschließen';
	@override String get loggedIn => 'Mit Nextcloud angemeldet';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$de extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'Wähle, wo du deine Daten speichern willst:';
	@override String get saberNcServer => 'Sabers Nextcloud-Server';
	@override String get otherNcServer => 'Anderer Nextcloud-Server';
	@override String get serverUrl => 'Server URL';
	@override String get loginWithSaber => 'Mit Saber anmelden';
	@override String get loginWithNextcloud => 'Mit Nextcloud anmelden';
	@override late final _Translations$login$ncLoginStep$loginFlow$de loginFlow = _Translations$login$ncLoginStep$loginFlow$de._(_root);
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$de extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Gib dein Verschlüsselungspasswort an, um deine Daten zu schützen:';
	@override String get newToSaber => 'Neu bei Saber? Gib einfach ein neues Verschlüsselungspasswort an.';
	@override String get encPassword => 'Verschlüsselungspasswort';
	@override String get encFaqTitle => 'Häufig gestellte Fragen';
	@override String get wrongEncPassword => 'Entschlüsselung mit dem angegebenen Passwort fehlgeschlagen. Bitte versuche es erneut einzugeben.';
	@override String get connectionFailed => 'Verbindung zum Server fehlgeschlagen. Bitte versuche es später erneut.';
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$de._(_root),
		_Translations$login$encLoginStep$encFaq$1$de._(_root),
		_Translations$login$encLoginStep$encFaq$2$de._(_root),
	];
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$de extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Server-Startseite';
	@override String get deleteAccount => 'Account löschen';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$de extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Verliere ich meine Notizen, wenn ich mich abmelde?';
	@override String get a => 'Nein. Deine Notizen bleiben auf deinem Gerät und auf dem Server. Sie werden erst wieder synchronisiert, wenn du dich erneut anmeldest. Um Datenverlust zu vermeiden, solltest du sicherstellen, dass alles korrekt synchronisiert wurde, bevor du dich abmeldest. Dazu kannst du auf dem Startbildschirm den Synchronisationsfortschritt überprüfen.';
}

// Path: profile.faq.1
class _Translations$profile$faq$1$de extends Translations$profile$faq$1$en {
	_Translations$profile$faq$1$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Wie ändere ich mein Nextcloud-Passwort?';
	@override String get a => 'Öffne die Server-Startseite und melde dich an. Unter Einstellungen > Sicherheit > Passwort, kannst du dein Passwort ändern. Nachdem du dein Passwort geändert hast, musst du dich in Saber ab- und wieder anmelden.';
}

// Path: profile.faq.2
class _Translations$profile$faq$2$de extends Translations$profile$faq$2$en {
	_Translations$profile$faq$2$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Wie ändere ich mein Verschlüsselungspasswort?';
	@override String get a => '0. Bitte stelle zuerst sicher, dass alle Daten korrekt synchronisiert wurden, damit du keine Daten verlierst (du kannst den Fortschritt auf dem Startbildschirm prüfen).\n1. Melde dich in Saber ab.\n2. Öffne die Server-Startseite und lösche den „Saber“-Order. Dadurch werden alle Notizen vom Server gelöscht.\n3. Melde dich wieder in Saber an. Du wirst nach einem neuen Verschlüsselungspasswort gefragt.\n4. Vergiss nicht dich auf anderen Geräten in Saber ab- und wieder anzumelden.';
}

// Path: profile.faq.3
class _Translations$profile$faq$3$de extends Translations$profile$faq$3$en {
	_Translations$profile$faq$3$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Wie lösche ich meinen Account?';
	@override String get a => 'Drücke oben den „${_root.profile.quickLinks.deleteAccount}“-Button und melde dich gegebenenfalls an.\nWenn du den offiziellen Saber-Server nutzt, wird dein Account automatisch nach einer Woche gelöscht. Du kannst mich während dieser Woche unter adilhanney@disroot.org kontaktieren um die Löschung rückgängig zu machen.\nWenn du einen anderen Server nutzt, kann es sein, dass du deinen Account nicht löschen kannst: Für mehr Information kannst du in der Datenschutzbestimmung des Servers nachgucken.';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$de extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Farben umschalten (Strg + C)';
	@override String get select => 'Auswählen';
	@override String get toggleEraser => 'Radierer umschalten (Strg + E)';
	@override String get photo => 'Foto';
	@override String get text => 'Text';
	@override String get toggleFingerDrawing => 'Umschalten auf manuelles Zeichnen (Strg + F)';
	@override String get undo => 'Rückgängig';
	@override String get redo => 'Wiederholen';
	@override String get export => 'Exportieren (Strg + Shift + S)';
	@override String get exportAs => 'Exportieren als:';
	@override String get fullscreen => 'Vollbild umschalten (F11)';
}

// Path: editor.pens
class _Translations$editor$pens$de extends Translations$editor$pens$en {
	_Translations$editor$pens$de._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _Translations$editor$penOptions$de extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get size => 'Dicke';
}

// Path: editor.colors
class _Translations$editor$colors$de extends Translations$editor$colors$en {
	_Translations$editor$colors$de._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _Translations$editor$imageOptions$de extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$de._(TranslationsDe root) : this._root = root, super.internal(root);

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
class _Translations$editor$selectionBar$de extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Entfernen';
	@override String get duplicate => 'Duplizieren';
}

// Path: editor.menu
class _Translations$editor$menu$de extends Translations$editor$menu$en {
	_Translations$editor$menu$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Seite ${page}/${totalPages} leeren';
	@override String get clearAllPages => 'Alle Seiten löschen';
	@override String get insertPage => 'Neue Seite unten anfügen';
	@override String get duplicatePage => 'Seite duplizieren';
	@override String get deletePage => 'Seite löschen';
	@override String get lineHeight => 'Zeilenhöhe';
	@override String get lineHeightDescription => 'Bestimmt ebenfalls die Textgröße der getippten Notizen';
	@override String get lineThickness => 'Strichstärke';
	@override String get lineThicknessDescription => 'Hintergrundstrichstärke';
	@override String get backgroundImageFit => 'Background image fit';
	@override String get backgroundPattern => 'Hintergrundmuster';
	@override String get import => 'Importieren';
	@override String get watchServer => 'Halte nach Aktualisierungen auf dem Server Ausschau';
	@override String get watchServerReadOnly => 'Bearbeiten ist deaktiviert, solange du den Server beobachtest';
	@override late final _Translations$editor$menu$boxFits$de boxFits = _Translations$editor$menu$boxFits$de._(_root);
	@override late final _Translations$editor$menu$bgPatterns$de bgPatterns = _Translations$editor$menu$bgPatterns$de._(_root);
}

// Path: editor.readOnlyBanner
class _Translations$editor$readOnlyBanner$de extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Schreibgeschützter Modus';
	@override String get watchingServer => 'Sie warten derzeit auf Aktualisierungen des Servers. Die Bearbeitung ist in diesem Modus deaktiviert.';
	@override String get corrupted => 'Die Notiz konnte nicht geladen werden. Sie ist möglicherweise beschädigt oder wird noch heruntergeladen.';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$de extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Diese Notiz wurde mit einer neueren Version von Saber bearbeitet';
	@override String get subtitle => 'Durch das Bearbeiten dieser Notiz können Daten verloren gehen. Möchtest du sie trotzdem bearbeiten?';
	@override String get allowEditing => 'Schreibschutz aufheben';
}

// Path: editor.quill
class _Translations$editor$quill$de extends Translations$editor$quill$en {
	_Translations$editor$quill$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Hier tippen...';
}

// Path: editor.hud
class _Translations$editor$hud$de extends Translations$editor$hud$en {
	_Translations$editor$hud$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Zoom entsperren';
	@override String get lockZoom => 'Zoom sperren';
	@override String get unlockSingleFingerPan => 'Verschieben mit einem Finger aktivieren';
	@override String get lockSingleFingerPan => 'Verschieben mit einem Finger deaktivieren';
	@override String get unlockAxisAlignedPan => 'Beschränkung der Horizontal- bzw. Vertikalverschiebung aufheben';
	@override String get lockAxisAlignedPan => 'Verschieben auf Horizontale oder Vertikale beschränken';
}

// Path: sentry.consent.description
class _Translations$sentry$consent$description$de extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get question => 'Möchtest du unerwartete Fehler automatisch melden? Das hilft mir dabei, Fehler schneller zu erkennen und zu beheben.';
	@override String get scope => 'Diese Berichte können Informationen über den Fehler und dein Gerät enthalten. Ich habe mein Bestes getan, um persönliche Daten herauszufiltern, allerdings könnten dennoch personenbezogene Daten enthalten sein.';
	@override String get currentlyOff => 'Wenn du zustimmst, wird die Fehlerberichterstattung nach dem Neustarten der App aktiviert.';
	@override String get currentlyOn => 'Falls du deine Zustimmung zurücknimmst, starte die App bitte neu, um die Fehlerberichterstattung zu deaktivieren.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Erfahre mehr in der '),
		link('Datenschutzrichtlinie'),
		const TextSpan(text: '.'),
	]);
}

// Path: sentry.consent.answers
class _Translations$sentry$consent$answers$de extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Ja';
	@override String get no => 'Nein';
	@override String get later => 'Später erneut fragen';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$de extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Verhindert versehentliches Umschalten';
	@override String get fixedOn => 'Der Modus für manuelles Zeichen ist aktiviert';
	@override String get fixedOff => 'Der Modus für manuelles Zeichnen ist deaktiviert';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$de extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get active => 'Aktiviert';
	@override String get inactive => 'Nicht aktiviert';
	@override String get activeUntilRestart => 'Aktiv bis zum Neustart der App';
	@override String get inactiveUntilRestart => 'Inaktiv bis zum Neustart der App';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$de extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Bitte gib Saber Zugriff auf dein Nextcloud Konto';
	@override String get followPrompts => 'Bitte folge den Anweisungen in der Nextcloud-Oberfläche';
	@override String get browserDidntOpen => 'Die Anmeldeseite hat sich nicht geöffnet? Klicke hier';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$de extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Was ist ein Verschlüsselungspasswort? Wozu zwei Passwörter?';
	@override String get a => 'Mit dem Nextcloud-Passwort greifst du auf die Cloud zu. Das Verschlüsselungspasswort schützt deine Daten, bevor sie jemals die Cloud erreichen.\nSelbst wenn jemand Zugriff zu deinem Nextcloud-Konto erlangt, bleiben deine Notizen sicher und verschlüsselt mit einem separaten Passwort. Das bietet dir eine weitere Sicherheitsschicht zum Schutz deiner Daten.\nNiemand kann ohne dein Verschlüsselungspasswort auf deine Notizen auf dem Server zugreifen. Das bedeutet allerdings auch, dass du den Zugriff auf deine Daten verlierst, falls du dein Verschlüsselungspasswort vergisst.';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$de extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Ich habe noch kein Verschlüsselungspasswort festgelegt. Wo bekomme ich das her?';
	@override String get a => 'Wähle ein neues Verschlüsselungspasswort und gib es oben ein.\nSaber wird mit diesem Passwort automatisch deine Schlüssel generieren.';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$de extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Kann ich das gleiche Passwort wie bei meinem Nextcloud-Konto verwenden?';
	@override String get a => 'Ja, aber sei dir bewusst, dass es so für den Serveradministrator oder jemand anderen einfacher wäre, auf deine Notizen zuzugreifen, falls dieser Zugriff auf dein Nextcloud-Konto erlangt.';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$de extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$de._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Dehnen';
	@override String get cover => 'Abdecken';
	@override String get contain => 'Beinhalten';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$de extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$de._(TranslationsDe root) : this._root = root, super.internal(root);

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
