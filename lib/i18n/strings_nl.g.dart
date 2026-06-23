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
class TranslationsNl extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsNl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.nl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <nl>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsNl _root = this; // ignore: unused_field

	@override 
	TranslationsNl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsNl(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$nl common = _Translations$common$nl._(_root);
	@override late final _Translations$home$nl home = _Translations$home$nl._(_root);
	@override late final _Translations$sentry$nl sentry = _Translations$sentry$nl._(_root);
	@override late final _Translations$settings$nl settings = _Translations$settings$nl._(_root);
	@override late final _Translations$logs$nl logs = _Translations$logs$nl._(_root);
	@override late final _Translations$login$nl login = _Translations$login$nl._(_root);
	@override late final _Translations$profile$nl profile = _Translations$profile$nl._(_root);
	@override late final _Translations$appInfo$nl appInfo = _Translations$appInfo$nl._(_root);
	@override late final _Translations$update$nl update = _Translations$update$nl._(_root);
	@override late final _Translations$editor$nl editor = _Translations$editor$nl._(_root);
}

// Path: common
class _Translations$common$nl extends Translations$common$en {
	_Translations$common$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get done => 'Klaar';
	@override String get continueBtn => 'Volgende';
	@override String get cancel => 'Stop';
}

// Path: home
class _Translations$home$nl extends Translations$home$en {
	_Translations$home$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$nl tabs = _Translations$home$tabs$nl._(_root);
	@override late final _Translations$home$titles$nl titles = _Translations$home$titles$nl._(_root);
	@override late final _Translations$home$tooltips$nl tooltips = _Translations$home$tooltips$nl._(_root);
	@override late final _Translations$home$create$nl create = _Translations$home$create$nl._(_root);
	@override String get welcome => 'Welkom bij Saber';
	@override String get invalidFormat => 'Deze software werkt niet met het geselecteerde bestand. Selecteer een sbn, sbn2, sba of pdf bestand.';
	@override String get noFiles => 'Geen bestand gevonden';
	@override String get noPreviewAvailable => 'Geen voorbeeld beschikbaar';
	@override String get createNewNote => 'Klik het plus icoon om een nieuwe notitie te maken';
	@override String get backFolder => 'Ga terug naar de vorige map';
	@override late final _Translations$home$newFolder$nl newFolder = _Translations$home$newFolder$nl._(_root);
	@override late final _Translations$home$renameNote$nl renameNote = _Translations$home$renameNote$nl._(_root);
	@override late final _Translations$home$moveNote$nl moveNote = _Translations$home$moveNote$nl._(_root);
	@override String get deleteNote => 'Verwijder notitie';
	@override late final _Translations$home$deleteNoteDialog$nl deleteNoteDialog = _Translations$home$deleteNoteDialog$nl._(_root);
	@override late final _Translations$home$renameFolder$nl renameFolder = _Translations$home$renameFolder$nl._(_root);
	@override late final _Translations$home$deleteFolder$nl deleteFolder = _Translations$home$deleteFolder$nl._(_root);
}

// Path: sentry
class _Translations$sentry$nl extends Translations$sentry$en {
	_Translations$sentry$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$nl consent = _Translations$sentry$consent$nl._(_root);
}

// Path: settings
class _Translations$settings$nl extends Translations$settings$en {
	_Translations$settings$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$nl prefCategories = _Translations$settings$prefCategories$nl._(_root);
	@override late final _Translations$settings$prefLabels$nl prefLabels = _Translations$settings$prefLabels$nl._(_root);
	@override late final _Translations$settings$prefDescriptions$nl prefDescriptions = _Translations$settings$prefDescriptions$nl._(_root);
	@override late final _Translations$settings$themeModes$nl themeModes = _Translations$settings$themeModes$nl._(_root);
	@override late final _Translations$settings$layoutSizes$nl layoutSizes = _Translations$settings$layoutSizes$nl._(_root);
	@override late final _Translations$settings$accentColorPicker$nl accentColorPicker = _Translations$settings$accentColorPicker$nl._(_root);
	@override String get systemLanguage => 'Automatisch';
	@override List<String> get axisDirections => [
		'Bovenaan',
		'Rechts',
		'Onderaan',
		'Links',
	];
	@override late final _Translations$settings$reset$nl reset = _Translations$settings$reset$nl._(_root);
	@override String get resyncEverything => 'Alles hersynchroniseren';
	@override String get openDataDir => 'Saber map openen';
	@override late final _Translations$settings$customDataDir$nl customDataDir = _Translations$settings$customDataDir$nl._(_root);
	@override String get autosaveDisabled => 'Nooit';
	@override String get shapeRecognitionDisabled => 'Nooit';
}

// Path: logs
class _Translations$logs$nl extends Translations$logs$en {
	_Translations$logs$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Logs';
	@override String get viewLogs => 'Logs bekijken';
	@override String get debuggingInfo => 'Logs bevatten informatie voor fouten vinden in de app en ontwikkelen van de app';
	@override String get noLogs => 'Er zijn nog geen logs!';
	@override String get useTheApp => 'Logs zullen hier verschijnen als je de app gebruikt';
}

// Path: login
class _Translations$login$nl extends Translations$login$en {
	_Translations$login$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Login';
	@override late final _Translations$login$form$nl form = _Translations$login$form$nl._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Nog geen account? '),
		linkToSignup('Registreer nu'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'Niet u? '),
		undoLogin('Kies een ander account'),
		const TextSpan(text: '.'),
	]);
	@override late final _Translations$login$status$nl status = _Translations$login$status$nl._(_root);
	@override late final _Translations$login$ncLoginStep$nl ncLoginStep = _Translations$login$ncLoginStep$nl._(_root);
	@override late final _Translations$login$encLoginStep$nl encLoginStep = _Translations$login$encLoginStep$nl._(_root);
}

// Path: profile
class _Translations$profile$nl extends Translations$profile$en {
	_Translations$profile$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mijn profiel';
	@override String get logout => 'Uitloggen';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => '${used} van ${total} in gebruik (${percent}%)';
	@override String get connectedTo => 'Verbonden met';
	@override late final _Translations$profile$quickLinks$nl quickLinks = _Translations$profile$quickLinks$nl._(_root);
	@override String get faqTitle => 'Vaak gevraagd';
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$nl._(_root),
		_Translations$profile$faq$1$nl._(_root),
		_Translations$profile$faq$2$nl._(_root),
		_Translations$profile$faq$3$nl._(_root),
	];
}

// Path: appInfo
class _Translations$appInfo$nl extends Translations$appInfo$en {
	_Translations$appInfo$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Klik hier om mij te sponsoren of om meer opslag te kopen';
	@override String get licenseButton => 'Klik hier om meer licentie informatie te zien';
	@override String get privacyPolicyButton => 'Klik hier voor het privacy policy';
}

// Path: update
class _Translations$update$nl extends Translations$update$en {
	_Translations$update$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Update beschikbaar';
	@override String get updateAvailableDescription => 'Een nieuwe versie van de app is beschikbaar:';
	@override String get update => 'Update';
	@override String get downloadNotAvailableYet => 'De download is nog niet beschikbaar voor jouw platform. Kijk later hier weer.';
}

// Path: editor
class _Translations$editor$nl extends Translations$editor$en {
	_Translations$editor$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$nl toolbar = _Translations$editor$toolbar$nl._(_root);
	@override late final _Translations$editor$pens$nl pens = _Translations$editor$pens$nl._(_root);
	@override late final _Translations$editor$penOptions$nl penOptions = _Translations$editor$penOptions$nl._(_root);
	@override late final _Translations$editor$colors$nl colors = _Translations$editor$colors$nl._(_root);
	@override late final _Translations$editor$imageOptions$nl imageOptions = _Translations$editor$imageOptions$nl._(_root);
	@override late final _Translations$editor$selectionBar$nl selectionBar = _Translations$editor$selectionBar$nl._(_root);
	@override late final _Translations$editor$menu$nl menu = _Translations$editor$menu$nl._(_root);
	@override late final _Translations$editor$readOnlyBanner$nl readOnlyBanner = _Translations$editor$readOnlyBanner$nl._(_root);
	@override late final _Translations$editor$versionTooNew$nl versionTooNew = _Translations$editor$versionTooNew$nl._(_root);
	@override late final _Translations$editor$quill$nl quill = _Translations$editor$quill$nl._(_root);
	@override late final _Translations$editor$hud$nl hud = _Translations$editor$hud$nl._(_root);
	@override String get pages => 'Pagina\'s';
	@override String get untitled => 'GeenNaam';
	@override String get needsToSaveBeforeExiting => 'Je veranderingen bewaren... Je kunt de editor veilig verlaten als hij klaar is';
}

// Path: home.tabs
class _Translations$home$tabs$nl extends Translations$home$tabs$en {
	_Translations$home$tabs$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get home => 'Thuis';
	@override String get browse => 'Bladeren';
	@override String get whiteboard => 'Whiteboard';
	@override String get settings => 'Instellingen';
}

// Path: home.titles
class _Translations$home$titles$nl extends Translations$home$titles$en {
	_Translations$home$titles$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get home => 'Recente notities';
	@override String get browse => 'Bladeren';
	@override String get whiteboard => 'Whiteboard';
	@override String get settings => 'Instellingen';
}

// Path: home.tooltips
class _Translations$home$tooltips$nl extends Translations$home$tooltips$en {
	_Translations$home$tooltips$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nieuwe notitie';
	@override String get showUpdateDialog => 'Laat de laatste updates zien';
	@override String get exportNote => 'Exporteer notitie';
}

// Path: home.create
class _Translations$home$create$nl extends Translations$home$create$en {
	_Translations$home$create$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nieuwe notitie';
	@override String get importNote => 'Importeer notitie';
}

// Path: home.newFolder
class _Translations$home$newFolder$nl extends Translations$home$newFolder$en {
	_Translations$home$newFolder$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Nieuwe map';
	@override String get folderName => 'Map naam';
	@override String get create => 'Creëer';
	@override String get folderNameEmpty => 'Map naam mag niet leeg zijn';
	@override String get folderNameContainsSlash => 'Map naam mag geen "/" bevatten';
	@override String get folderNameExists => 'Map bestaat al';
}

// Path: home.renameNote
class _Translations$home$renameNote$nl extends Translations$home$renameNote$en {
	_Translations$home$renameNote$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Hernoem notitie';
	@override String get noteName => 'Notitie naam';
	@override String get rename => 'Hernoem';
	@override String get noteNameEmpty => 'Notitie naam mag niet leeg zijn';
	@override String get noteNameExists => 'Er bestaat al een notitie met die naam';
	@override String get noteNameForbiddenCharacters => 'Notitie naam heeft verboden karakters';
	@override String get noteNameReserved => 'Notitie naam gereserveerd';
}

// Path: home.moveNote
class _Translations$home$moveNote$nl extends Translations$home$moveNote$en {
	_Translations$home$moveNote$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Verplaats notitie';
	@override String moveNotes({required Object n}) => 'Verplaats ${n} notities';
	@override String moveName({required Object f}) => 'Verplaats ${f}';
	@override String get move => 'Verplaats';
	@override String renamedTo({required Object newName}) => 'Notitie zal hernoemd worden naar ${newName}';
	@override String get multipleRenamedTo => 'De volgende notities worden hernoemd:';
	@override String numberRenamedTo({required Object n}) => '${n} notities zullen hernoemd worden om conflicten te vermijden';
}

// Path: home.deleteNoteDialog
class _Translations$home$deleteNoteDialog$nl extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String deleteNotes({required Object n}) => 'Verwijder ${n} notities';
	@override String deleteName({required Object f}) => 'Verwijder ${f}';
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(n,
		one: 'Geselecteerde notitie permanent verwijderen?',
		other: 'Geselecteerde notities permanent verwijderen?',
	);
	@override String get delete => 'Verwijderen';
}

// Path: home.renameFolder
class _Translations$home$renameFolder$nl extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Map hernoemen';
	@override String get folderName => 'Map naam';
	@override String get rename => 'Hernoem';
	@override String get folderNameEmpty => 'Map naam mag niet leeg zijn';
	@override String get folderNameContainsSlash => 'Map naam mag geen "/" bevatten';
	@override String get folderNameExists => 'Een map met deze naam bestaat al';
}

// Path: home.deleteFolder
class _Translations$home$deleteFolder$nl extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Map verwijderen';
	@override String deleteName({required Object f}) => 'Verwijder ${f}';
	@override String get delete => 'Verwijder';
	@override String get alsoDeleteContents => 'Notities in deze map ook verwijderen';
}

// Path: sentry.consent
class _Translations$sentry$consent$nl extends Translations$sentry$consent$en {
	_Translations$sentry$consent$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Help Saber verbeteren?';
	@override late final _Translations$sentry$consent$description$nl description = _Translations$sentry$consent$description$nl._(_root);
	@override late final _Translations$sentry$consent$answers$nl answers = _Translations$sentry$consent$answers$nl._(_root);
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$nl extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get general => 'Algemeen';
	@override String get writing => 'Schrijven';
	@override String get editor => 'Editor';
	@override String get performance => 'Prestaties';
	@override String get advanced => 'Geavanceerd';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$nl extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Taal';
	@override String get appTheme => 'App thema';
	@override String get platform => 'Thema type';
	@override String get layoutSize => 'Indeling type';
	@override String get customAccentColor => 'Aangepaste accent kleur';
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible lettertype';
	@override String get shouldCheckForUpdates => 'Controleer op updates';
	@override String get shouldAlwaysAlertForUpdates => 'Snellere updates';
	@override String get allowInsecureConnections => 'Sta onversleutelde verbindingen toe';
	@override String get editorToolbarAlignment => 'Werkbalk positie';
	@override String get editorToolbarShowInFullscreen => 'Laat de werkbalk zien in volledig scherm modus';
	@override String get editorAutoInvert => 'Inverteer notities in donkere modus';
	@override String get preferGreyscale => 'Prefereer grijstinten';
	@override String get maxImageSize => 'Maximale afbeelding grootte';
	@override String get autoClearWhiteboardOnExit => 'Automatisch whiteboard leeg maken';
	@override String get disableEraserAfterUse => 'Automatisch gum deselecteren';
	@override String get hideFingerDrawingToggle => 'Vinger schrijven knop verbergen';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Automatisch vinger schrijven stoppen';
	@override String get editorPromptRename => 'Meteen vragen om notitie een naam te geven';
	@override String get recentColorsDontSavePresets => 'Sla geen vooraf ingestelde kleuren op in recente kleuren';
	@override String get recentColorsLength => 'Hoeveel aangepasten kleuren opslaan';
	@override String get printPageIndicators => 'Laat pagina nummers zien';
	@override String get autosave => 'Automatisch opslaan';
	@override String get shapeRecognitionDelay => 'Vorm herkenning vertraging';
	@override String get autoStraightenLines => 'Automatisch lijnen recht maken';
	@override String get simplifiedHomeLayout => 'Simpele thuis indeling';
	@override String get customDataDir => 'Aangepaste Saber map';
	@override String get sentry => 'Fouten rapportering';
}

// Path: settings.prefDescriptions
class _Translations$settings$prefDescriptions$nl extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Verbetert leesbaarheid voor gebruikers met weinig zicht';
	@override String get allowInsecureConnections => '(Niet aangeraden) Laat Saber met zelf getekende servers verbinden';
	@override String get preferGreyscale => 'Voor e-ink schermen';
	@override String get autoClearWhiteboardOnExit => 'Maakt het whiteboard leeg nadat de app is verlaten';
	@override String get disableEraserAfterUse => 'Automatisch terug gaan naar schrijven na gum gebruik';
	@override String get maxImageSize => 'Grotere afbeeldingen worden gecomprimeerd';
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$nl hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$nl._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Vinger schrijven uitzetten wanneer pen wordt gedetecteerd';
	@override String get editorPromptRename => 'Je kan een map altijd hernoemen';
	@override String get printPageIndicators => 'Laat pagina nummers zien in geëxporteerd bestand';
	@override String get autosave => 'Automatisch opslaan na een bepaalde tijd, of nooit';
	@override String get shapeRecognitionDelay => 'Hoe vaak de vorm herkenning updaten';
	@override String get autoStraightenLines => 'Lange lijnen recht maken zonder vorm pen te gebruiken';
	@override String get simplifiedHomeLayout => 'Maak elk notitievoorbeeld even groot';
	@override String get shouldAlwaysAlertForUpdates => 'Laat het meteen weten als er updates zijn';
	@override late final _Translations$settings$prefDescriptions$sentry$nl sentry = _Translations$settings$prefDescriptions$sentry$nl._(_root);
}

// Path: settings.themeModes
class _Translations$settings$themeModes$nl extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get system => 'Systeem';
	@override String get light => 'Licht';
	@override String get dark => 'Donker';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$nl extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Automatisch';
	@override String get phone => 'Telefoon';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$nl extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Kies een kleur';
}

// Path: settings.reset
class _Translations$settings$reset$nl extends Translations$settings$reset$en {
	_Translations$settings$reset$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Instelling terug zetten?';
	@override String get button => 'Terugzetten';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$nl extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Stop';
	@override String get select => 'Selecteer';
	@override String get mustBeEmpty => 'Geselecteerde map moet leeg zijn';
	@override String get mustBeDoneSyncing => 'Zorg ervoor dat alles is gesynchroniseerd voordat u de map verandert';
	@override String get unsupported => 'Deze functie is momenteel alleen voor ontwikkelaars. Het gebruik ervan zal waarschijnlijk leiden tot gegevensverlies.';
}

// Path: login.form
class _Translations$login$form$nl extends Translations$login$form$en {
	_Translations$login$form$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Door in te loggen bent u eens met het '),
		linkToPrivacyPolicy('Privacy Policy'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _Translations$login$status$nl extends Translations$login$status$en {
	_Translations$login$status$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Uitgelogd';
	@override String get tapToLogin => 'Klik om in te loggen met Nextcloud';
	@override String hi({required Object u}) => 'Hi, ${u}!';
	@override String get almostDone => 'Bijna klaar om te synchroniseren, klik om in te loggen';
	@override String get loggedIn => 'Ingelogd met Nextcloud';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$nl extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'Kies welke opslag te gebruiken:';
	@override String get saberNcServer => 'Saber\'s Nextcloud server';
	@override String get otherNcServer => 'Andere Nextcloud server';
	@override String get serverUrl => 'Server URL';
	@override String get loginWithSaber => 'Inloggen met Saber';
	@override String get loginWithNextcloud => 'Inloggen met Nextcloud';
	@override late final _Translations$login$ncLoginStep$loginFlow$nl loginFlow = _Translations$login$ncLoginStep$loginFlow$nl._(_root);
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$nl extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Om uw gegevens te beschermen, geef hier uw versleutelingswachtwoord op:';
	@override String get newToSaber => 'Nieuw bij Saber? Bedenk gewoon een nieuw wachtwoord.';
	@override String get encPassword => 'Versleutelingswachtwoord';
	@override String get encFaqTitle => 'Vaak gevraagd';
	@override String get wrongEncPassword => 'Ontsleuteling gefaald met gegeven wachtwoord, probeer opnieuw.';
	@override String get connectionFailed => 'Er ging iets fout met de verbinding met de server. Probeer later opnieuw.';
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$nl._(_root),
		_Translations$login$encLoginStep$encFaq$1$nl._(_root),
		_Translations$login$encLoginStep$encFaq$2$nl._(_root),
	];
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$nl extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Server thuispagina';
	@override String get deleteAccount => 'Verwijder account';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$nl extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Ben ik mijn notities kwijt als ik uitlog?';
	@override String get a => 'Nee. Je notities blijven zowel op je apparaat als op de server staan. Ze worden pas gesynchroniseerd met de server als je weer inlogt. Zorg dat de synchronisatie voltooid is voordat je uitlogt, zodat je geen data verliest (zie de synchronisatievoortgang op het startscherm).';
}

// Path: profile.faq.1
class _Translations$profile$faq$1$nl extends Translations$profile$faq$1$en {
	_Translations$profile$faq$1$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Hoe verander ik mijn Nextcloud wachtwoord?';
	@override String get a => 'Ga naar de website van je server en log in. Ga dan naar Instellingen > Beveiliging > Wachtwoord wijzigen. Je moet uitloggen en weer inloggen op Saber nadat je je wachtwoord hebt veranderd.';
}

// Path: profile.faq.2
class _Translations$profile$faq$2$nl extends Translations$profile$faq$2$en {
	_Translations$profile$faq$2$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Hoe verander ik mijn versleutelingswachtwoord?';
	@override String get a => '0. Zorg dat de synchronisatie voltooid is (zie de voortgang van synchronisatie op het startscherm).\n1. Log uit bij Saber.\n2. Ga naar de website van je server en verwijder je \'Saber\'-map. Dit verwijdert al je notities van de server.\n3. Log weer in op Saber. Je kunt een nieuw encryptiewachtwoord kiezen bij het inloggen.\n4. Vergeet niet uit te loggen en weer in te loggen op Saber op je andere apparaten.';
}

// Path: profile.faq.3
class _Translations$profile$faq$3$nl extends Translations$profile$faq$3$en {
	_Translations$profile$faq$3$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Hoe kan ik mijn account verwijderen?';
	@override String get a => 'Tik op de knop "${_root.profile.quickLinks.deleteAccount}" hierboven en log in indien nodig.\nAls je de officiële Saber-server gebruikt, wordt je account na een periode van 1 week verwijderd. Je kunt me in deze periode op adilhanney@disroot.org contacteren om de verwijdering te annuleren.\nAls je een server van derden gebruikt, is er mogelijk geen optie om je account te verwijderen: je moet het privacybeleid van de server raadplegen voor meer informatie.';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$nl extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Verander kleur (Ctrl C)';
	@override String get select => 'Selecteer';
	@override String get toggleEraser => 'Toggle gum (Ctrl E)';
	@override String get photo => 'Afbeeldingen';
	@override String get text => 'Tekst';
	@override String get toggleFingerDrawing => 'Toggle vinger schrijven (Ctrl F)';
	@override String get undo => 'Terug';
	@override String get redo => 'Heen';
	@override String get export => 'Exporteer (Ctrl Shift S)';
	@override String get exportAs => 'Exporteer als:';
	@override String get fullscreen => 'Toggle volledig scherm (F11)';
}

// Path: editor.pens
class _Translations$editor$pens$nl extends Translations$editor$pens$en {
	_Translations$editor$pens$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Vulpen';
	@override String get ballpointPen => 'Balpen';
	@override String get highlighter => 'Highlighter';
	@override String get pencil => 'Potlood';
	@override String get shapePen => 'Vormpen';
	@override String get laserPointer => 'Laser pointer';
}

// Path: editor.penOptions
class _Translations$editor$penOptions$nl extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get size => 'Grootte';
}

// Path: editor.colors
class _Translations$editor$colors$nl extends Translations$editor$colors$en {
	_Translations$editor$colors$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Kleur kiezer';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Aangepast ${b} ${h}';
	@override String customHue({required Object h}) => 'Aangepast ${h}';
	@override String get dark => 'donker';
	@override String get light => 'licht';
	@override String get black => 'Zwart';
	@override String get darkGrey => 'Donker grijs';
	@override String get grey => 'Grijs';
	@override String get lightGrey => 'Licht grijs';
	@override String get white => 'Wit';
	@override String get red => 'Rood';
	@override String get green => 'Groen';
	@override String get cyan => 'Cyaan';
	@override String get blue => 'Blauw';
	@override String get yellow => 'Geel';
	@override String get purple => 'Paars';
	@override String get pink => 'Roze';
	@override String get orange => 'Oranje';
	@override String get pastelRed => 'Pastel rood';
	@override String get pastelOrange => 'Pastel oranje';
	@override String get pastelYellow => 'Pastel geel';
	@override String get pastelGreen => 'Pastel groen';
	@override String get pastelCyan => 'Pastel cyaan';
	@override String get pastelBlue => 'Pastel blauw';
	@override String get pastelPurple => 'Pastel paars';
	@override String get pastelPink => 'Pastel roze';
}

// Path: editor.imageOptions
class _Translations$editor$imageOptions$nl extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Afbeelding opties';
	@override String get invertible => 'Inverteerbaar';
	@override String get download => 'Download';
	@override String get setAsBackground => 'Als achtergrond gebruiken';
	@override String get removeAsBackground => 'Als achtergrond verwijderen';
	@override String get delete => 'Verwijderen';
}

// Path: editor.selectionBar
class _Translations$editor$selectionBar$nl extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Verwijderen';
	@override String get duplicate => 'Duplicaat';
}

// Path: editor.menu
class _Translations$editor$menu$nl extends Translations$editor$menu$en {
	_Translations$editor$menu$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Pagina ${page}/${totalPages} legen';
	@override String get clearAllPages => 'Alle pagina\'s legen';
	@override String get insertPage => 'Pagina hieronder invoegen';
	@override String get duplicatePage => 'Pagina dupliceren';
	@override String get deletePage => 'Pagina verwijderen';
	@override String get lineHeight => 'Tekst grootte';
	@override String get lineHeightDescription => 'Regelt ook de tekstgrootte voor getypte notities';
	@override String get lineThickness => 'Lijndikte';
	@override String get lineThicknessDescription => 'Achtergrond lijndikte';
	@override String get backgroundImageFit => 'Achtergrond afbeelding plaats';
	@override String get backgroundPattern => 'Achtergrond patroon';
	@override String get import => 'Importeer';
	@override String get watchServer => 'Synchroniseer updates van de server';
	@override String get watchServerReadOnly => 'Bewerken is uitgeschakeld terwijl je synchroniseert met de server';
	@override late final _Translations$editor$menu$boxFits$nl boxFits = _Translations$editor$menu$boxFits$nl._(_root);
	@override late final _Translations$editor$menu$bgPatterns$nl bgPatterns = _Translations$editor$menu$bgPatterns$nl._(_root);
}

// Path: editor.readOnlyBanner
class _Translations$editor$readOnlyBanner$nl extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Alleen-lezen modus';
	@override String get watchingServer => 'Je bent momenteel aan het synchroniseren met updates van de server. Bewerken is uitgeschakeld in deze modus.';
	@override String get corrupted => 'Notitie is niet geladen. Het kan corrupt zijn of nog steeds aan het downloaden zijn.';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$nl extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Deze notitie is gemaakt met een nieuwere versie van Saber';
	@override String get subtitle => 'Het bewerken van deze notitie kan ertoe leiden dat sommige informatie verloren gaat. Wil je dit negeren en toch bewerken?';
	@override String get allowEditing => 'Veranderen toestaan';
}

// Path: editor.quill
class _Translations$editor$quill$nl extends Translations$editor$quill$en {
	_Translations$editor$quill$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Typ hier iets...';
}

// Path: editor.hud
class _Translations$editor$hud$nl extends Translations$editor$hud$en {
	_Translations$editor$hud$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Zoomen toestaan';
	@override String get lockZoom => 'Zoomen tegenhouden';
	@override String get unlockSingleFingerPan => 'Schakel rondkijken met één vinger in';
	@override String get lockSingleFingerPan => 'Schakel rondkijken met één vinger uit';
	@override String get unlockAxisAlignedPan => 'Ontgrendel horizontaal of verticaal rondkijken';
	@override String get lockAxisAlignedPan => 'Vergrendel horizontaal of verticaal rondkijken';
}

// Path: sentry.consent.description
class _Translations$sentry$consent$description$nl extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get question => 'Automatisch fouten rapporteren? Dit helpt sneller fouten vinden.';
	@override String get scope => 'Het rapport kan informatie over uw apparaat bevatten.';
	@override String get currentlyOff => 'Als u het toestaat, dan wordt fouten rapportage aangezet na het herstarten van de app.';
	@override String get currentlyOn => 'Als je toestemming intrekt, start dan de app opnieuw op om foutenrapportage uit te schakelen.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Lees meer in het '),
		link('privacy policy'),
		const TextSpan(text: '.'),
	]);
}

// Path: sentry.consent.answers
class _Translations$sentry$consent$answers$nl extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Ja';
	@override String get no => 'Nee';
	@override String get later => 'Vraag later nogmaals';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$nl extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Gaat per ongeluk aanzetten tegen';
	@override String get fixedOn => 'Vinger schrijven altijd aan';
	@override String get fixedOff => 'Vinger schrijven is altijd uit';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$nl extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get active => 'Actief';
	@override String get inactive => 'Inactief';
	@override String get activeUntilRestart => 'Actief tot de app herstart is';
	@override String get inactiveUntilRestart => 'Inactief tot de app herstart is';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$nl extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Autoriseer Saber bij je Nextcloud account';
	@override String get followPrompts => 'Volg de instructies op de Nextcloud pagina';
	@override String get browserDidntOpen => 'Is de login pagina niet geopend? Klik hier';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$nl extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Wat is een versleutelingswachtwoord? Waarom moet ik twee wachtwoorden gebruiken?';
	@override String get a => 'Het Nextcloud-wachtwoord wordt gebruikt om toegang te krijgen tot de cloud. Het encryptiewachtwoord versleutelt je data voordat deze de cloud bereikt.\nZelfs als iemand toegang krijgt tot je Nextcloud-account, blijven je notities veilig en versleuteld met een apart wachtwoord. Dit biedt je een tweede beveiligingslaag om je data te beschermen.\nNiemand kan je notities op de server inzien zonder je encryptiewachtwoord, maar dit betekent ook dat als je je encryptiewachtwoord vergeet, je de toegang tot je gegevens verliest.';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$nl extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Ik heb nog geen versleutelingswachtwoord gebruikt, waar krijg ik deze?';
	@override String get a => 'Kies een nieuw versleutelingswachtwoord en voer hem hierboven in.\nSaber zal automatisch versleutelingssleutels maken van dit wachtwoord.';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$nl extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get q => 'Kan ik hetzelfde wachtwoord als my Nextcloud wachtwoord gebruiken?';
	@override String get a => 'Ja, maar houd er rekening mee dat het makkelijker is voor de serverbeheerder of iemand anders om toegang te krijgen tot je notities als ze toegang krijgen tot je Nextcloud-account.';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$nl extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Span';
	@override String get cover => 'Bedek';
	@override String get contain => 'Bevat';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$nl extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$nl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get none => 'Blank';
	@override String get college => 'Lijntjes papier';
	@override String get collegeRtl => 'Lijntjespapier (omgedraaid)';
	@override String get lined => 'Lijntjes';
	@override String get grid => 'Raster';
	@override String get dots => 'Puntjes';
	@override String get staffs => 'Staffs';
	@override String get tablature => 'Tablatuur';
	@override String get cornell => 'Cornell';
}
