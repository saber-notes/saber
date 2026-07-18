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
class TranslationsIt extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsIt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.it,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <it>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsIt _root = this; // ignore: unused_field

	@override 
	TranslationsIt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsIt(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$it common = _Translations$common$it._(_root);
	@override late final _Translations$home$it home = _Translations$home$it._(_root);
	@override late final _Translations$sentry$it sentry = _Translations$sentry$it._(_root);
	@override late final _Translations$settings$it settings = _Translations$settings$it._(_root);
	@override late final _Translations$logs$it logs = _Translations$logs$it._(_root);
	@override late final _Translations$login$it login = _Translations$login$it._(_root);
	@override late final _Translations$profile$it profile = _Translations$profile$it._(_root);
	@override late final _Translations$appInfo$it appInfo = _Translations$appInfo$it._(_root);
	@override late final _Translations$update$it update = _Translations$update$it._(_root);
	@override late final _Translations$editor$it editor = _Translations$editor$it._(_root);
}

// Path: common
class _Translations$common$it extends Translations$common$en {
	_Translations$common$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get done => 'Fatto';
	@override String get continueBtn => 'Continua';
	@override String get cancel => 'Annulla';
}

// Path: home
class _Translations$home$it extends Translations$home$en {
	_Translations$home$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$it tabs = _Translations$home$tabs$it._(_root);
	@override late final _Translations$home$titles$it titles = _Translations$home$titles$it._(_root);
	@override late final _Translations$home$tooltips$it tooltips = _Translations$home$tooltips$it._(_root);
	@override late final _Translations$home$create$it create = _Translations$home$create$it._(_root);
	@override String get welcome => 'Benvenuto su Saber';
	@override String get invalidFormat => 'Il file selezionato non è supportato. Seleziona un file sbn, sbn2, sba o pdf.';
	@override String get noFiles => 'Nessun file trovato';
	@override String get noPreviewAvailable => 'Nessuna anteprima disponibile';
	@override String get createNewNote => 'Tocca il pulsante + per creare una nuova nota';
	@override String get backFolder => 'Torna alla cartella precedente';
	@override late final _Translations$home$newFolder$it newFolder = _Translations$home$newFolder$it._(_root);
	@override late final _Translations$home$renameNote$it renameNote = _Translations$home$renameNote$it._(_root);
	@override late final _Translations$home$moveNote$it moveNote = _Translations$home$moveNote$it._(_root);
	@override String get deleteNote => 'Elimina nota';
	@override late final _Translations$home$deleteNoteDialog$it deleteNoteDialog = _Translations$home$deleteNoteDialog$it._(_root);
	@override late final _Translations$home$renameFolder$it renameFolder = _Translations$home$renameFolder$it._(_root);
	@override late final _Translations$home$deleteFolder$it deleteFolder = _Translations$home$deleteFolder$it._(_root);
}

// Path: sentry
class _Translations$sentry$it extends Translations$sentry$en {
	_Translations$sentry$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$it consent = _Translations$sentry$consent$it._(_root);
}

// Path: settings
class _Translations$settings$it extends Translations$settings$en {
	_Translations$settings$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$it prefCategories = _Translations$settings$prefCategories$it._(_root);
	@override late final _Translations$settings$prefLabels$it prefLabels = _Translations$settings$prefLabels$it._(_root);
	@override late final _Translations$settings$prefDescriptions$it prefDescriptions = _Translations$settings$prefDescriptions$it._(_root);
	@override late final _Translations$settings$themeModes$it themeModes = _Translations$settings$themeModes$it._(_root);
	@override late final _Translations$settings$layoutSizes$it layoutSizes = _Translations$settings$layoutSizes$it._(_root);
	@override late final _Translations$settings$accentColorPicker$it accentColorPicker = _Translations$settings$accentColorPicker$it._(_root);
	@override String get systemLanguage => 'Lingua di sistema';
	@override List<String> get axisDirections => [
		'Sopra',
		'Destra',
		'In basso',
		'Sinistra',
	];
	@override late final _Translations$settings$reset$it reset = _Translations$settings$reset$it._(_root);
	@override String get resyncEverything => 'Risincronizza tutto';
	@override String get openDataDir => 'Apri cartella Saber';
	@override late final _Translations$settings$customDataDir$it customDataDir = _Translations$settings$customDataDir$it._(_root);
	@override String get autosaveDisabled => 'Mai';
	@override String get shapeRecognitionDisabled => 'Mai';
}

// Path: logs
class _Translations$logs$it extends Translations$logs$en {
	_Translations$logs$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Log';
	@override String get viewLogs => 'Visualizza log';
	@override String get debuggingInfo => 'I log contengono informazioni utili per il debug e lo sviluppo';
	@override String get noLogs => 'Niente log qui!';
	@override String get useTheApp => 'I log appariranno qui mentre usi l\'app';
}

// Path: login
class _Translations$login$it extends Translations$login$en {
	_Translations$login$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Accesso';
	@override late final _Translations$login$form$it form = _Translations$login$form$it._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Non hai ancora un account? '),
		linkToSignup('Registrati ora'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'Non sei tu? '),
		undoLogin('Scegli un altro account'),
		const TextSpan(text: '.'),
	]);
	@override late final _Translations$login$status$it status = _Translations$login$status$it._(_root);
	@override late final _Translations$login$ncLoginStep$it ncLoginStep = _Translations$login$ncLoginStep$it._(_root);
	@override late final _Translations$login$encLoginStep$it encLoginStep = _Translations$login$encLoginStep$it._(_root);
}

// Path: profile
class _Translations$profile$it extends Translations$profile$en {
	_Translations$profile$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Il mio profilo';
	@override String get logout => 'Disconnessione';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Stai usando ${used} su ${total} (${percent}%)';
	@override String get connectedTo => 'Collegato a';
	@override late final _Translations$profile$quickLinks$it quickLinks = _Translations$profile$quickLinks$it._(_root);
	@override String get faqTitle => 'Domande frequenti';
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$it._(_root),
		_Translations$profile$faq$1$it._(_root),
		_Translations$profile$faq$2$it._(_root),
		_Translations$profile$faq$3$it._(_root),
	];
}

// Path: appInfo
class _Translations$appInfo$it extends Translations$appInfo$en {
	_Translations$appInfo$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber Copyright © 2022-${buildYear} Adil Hanney\nQuesto programma non ha alcuna garanzia. Questo è un software libero e sei libero di ridistribuirlo a determinate condizioni.';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Tocca qui per sponsorizzarmi o acquistare altro spazio di archiviazione';
	@override String get licenseButton => 'Tocca qui per visualizzare ulteriori informazioni sulla licenza';
	@override String get privacyPolicyButton => 'Tocca qui per visualizzare l\'informativa sulla privacy';
}

// Path: update
class _Translations$update$it extends Translations$update$en {
	_Translations$update$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Aggiornamento disponibile';
	@override String get updateAvailableDescription => 'È disponibile una nuova versione dell\'app:';
	@override String get update => 'Aggiornamento';
	@override String get downloadNotAvailableYet => 'Il download non è ancora disponibile per la tua piattaforma. Ti invitiamo a controllare nuovamente a breve.';
}

// Path: editor
class _Translations$editor$it extends Translations$editor$en {
	_Translations$editor$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$it toolbar = _Translations$editor$toolbar$it._(_root);
	@override late final _Translations$editor$pens$it pens = _Translations$editor$pens$it._(_root);
	@override late final _Translations$editor$penOptions$it penOptions = _Translations$editor$penOptions$it._(_root);
	@override late final _Translations$editor$colors$it colors = _Translations$editor$colors$it._(_root);
	@override late final _Translations$editor$imageOptions$it imageOptions = _Translations$editor$imageOptions$it._(_root);
	@override late final _Translations$editor$selectionBar$it selectionBar = _Translations$editor$selectionBar$it._(_root);
	@override late final _Translations$editor$menu$it menu = _Translations$editor$menu$it._(_root);
	@override late final _Translations$editor$readOnlyBanner$it readOnlyBanner = _Translations$editor$readOnlyBanner$it._(_root);
	@override late final _Translations$editor$versionTooNew$it versionTooNew = _Translations$editor$versionTooNew$it._(_root);
	@override late final _Translations$editor$quill$it quill = _Translations$editor$quill$it._(_root);
	@override late final _Translations$editor$hud$it hud = _Translations$editor$hud$it._(_root);
	@override String get pages => 'Pagine';
	@override String get untitled => 'Senza titolo';
	@override String get needsToSaveBeforeExiting => 'Salvataggio delle modifiche... Puoi tranquillamente uscire dall\'editor una volta completato';
}

// Path: home.tabs
class _Translations$home$tabs$it extends Translations$home$tabs$en {
	_Translations$home$tabs$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Home';
	@override String get browse => 'Sfoglia';
	@override String get whiteboard => 'Lavagna';
	@override String get settings => 'Impostazioni';
}

// Path: home.titles
class _Translations$home$titles$it extends Translations$home$titles$en {
	_Translations$home$titles$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Note recenti';
	@override String get browse => 'Sfoglia';
	@override String get whiteboard => 'Lavagna';
	@override String get settings => 'Impostazioni';
}

// Path: home.tooltips
class _Translations$home$tooltips$it extends Translations$home$tooltips$en {
	_Translations$home$tooltips$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nuova nota';
	@override String get showUpdateDialog => 'Mostra finestra di aggiornamento';
	@override String get exportNote => 'Esporta nota';
}

// Path: home.create
class _Translations$home$create$it extends Translations$home$create$en {
	_Translations$home$create$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nuova nota';
	@override String get importNote => 'Importa nota';
}

// Path: home.newFolder
class _Translations$home$newFolder$it extends Translations$home$newFolder$en {
	_Translations$home$newFolder$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Nuova cartella';
	@override String get folderName => 'Nome cartella';
	@override String get create => 'Crea';
	@override String get folderNameEmpty => 'Il nome della cartella non può essere vuoto';
	@override String get folderNameContainsSlash => 'Il nome della cartella non può contenere il carattere "barra"';
	@override String get folderNameExists => 'La cartella esiste già';
}

// Path: home.renameNote
class _Translations$home$renameNote$it extends Translations$home$renameNote$en {
	_Translations$home$renameNote$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Rinomina nota';
	@override String get noteName => 'Nome nota';
	@override String get rename => 'Rinomina';
	@override String get noteNameEmpty => 'Il nome della nota non può essere vuoto';
	@override String get noteNameExists => 'Esiste già una nota con questo nome';
	@override String get noteNameForbiddenCharacters => 'Il nome della nota contiene caratteri vietati';
	@override String get noteNameReserved => 'Nome nota riservato';
}

// Path: home.moveNote
class _Translations$home$moveNote$it extends Translations$home$moveNote$en {
	_Translations$home$moveNote$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Sposta nota';
	@override String moveNotes({required Object n}) => 'Sposta ${n} note';
	@override String moveName({required Object f}) => 'Sposta ${f}';
	@override String get move => 'Sposta';
	@override String renamedTo({required Object newName}) => 'La nota verrà rinominata ${newName}';
	@override String get multipleRenamedTo => 'Le note seguenti verranno rinominate:';
	@override String numberRenamedTo({required Object n}) => '${n} note verranno rinominate per evitare conflitti';
}

// Path: home.deleteNoteDialog
class _Translations$home$deleteNoteDialog$it extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String deleteNotes({required Object n}) => 'Elimina ${n} note';
	@override String deleteName({required Object f}) => 'Elimina ${f}';
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(n,
		one: 'Eliminare definitivamente la nota selezionata?',
		other: 'Eliminare definitivamente le note selezionate?',
	);
	@override String get delete => 'Elimina';
}

// Path: home.renameFolder
class _Translations$home$renameFolder$it extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Rinomina cartella';
	@override String get folderName => 'Nome cartella';
	@override String get rename => 'Rinomina';
	@override String get folderNameEmpty => 'Il nome della cartella non può essere vuoto';
	@override String get folderNameContainsSlash => 'Il nome della cartella non può contenere il carattere "barra"';
	@override String get folderNameExists => 'Esiste già una cartella con questo nome';
}

// Path: home.deleteFolder
class _Translations$home$deleteFolder$it extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Elimina cartella';
	@override String deleteName({required Object f}) => 'Elimina ${f}';
	@override String get delete => 'Elimina';
	@override String get alsoDeleteContents => 'Elimina anche tutte le note all\'interno di questa cartella';
}

// Path: sentry.consent
class _Translations$sentry$consent$it extends Translations$sentry$consent$en {
	_Translations$sentry$consent$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vuoi aiutarci a migliorare Saber?';
	@override late final _Translations$sentry$consent$description$it description = _Translations$sentry$consent$description$it._(_root);
	@override late final _Translations$sentry$consent$answers$it answers = _Translations$sentry$consent$answers$it._(_root);
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$it extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get general => 'Generali';
	@override String get writing => 'Scrittura';
	@override String get editor => 'Editor';
	@override String get performance => 'Prestazioni';
	@override String get advanced => 'Avanzate';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$it extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Lingua';
	@override String get appTheme => 'Tema dell\'app';
	@override String get platform => 'Tipo di tema';
	@override String get layoutSize => 'Dimensione del layout';
	@override String get customAccentColor => 'Colore personalizzato';
	@override String get hyperlegibleFont => 'Font Atkinson Hyperlegible';
	@override String get shouldCheckForUpdates => 'Controlla automaticamente gli aggiornamenti di Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Aggiornamenti precoci';
	@override String get allowInsecureConnections => 'Consenti connessioni non sicure';
	@override String get editorToolbarAlignment => 'Posizione barra degli strumenti';
	@override String get editorToolbarShowInFullscreen => 'Mostra la barra degli strumenti in modalità a schermo intero';
	@override String get editorAutoInvert => 'Inverti le note in modalità scura';
	@override String get preferGreyscale => 'Preferisci i colori in scala di grigi';
	@override String get maxImageSize => 'Dimensione massima dell\'immagine';
	@override String get autoClearWhiteboardOnExit => 'Pulisci automaticamente la lavagna';
	@override String get disableEraserAfterUse => 'Disattiva automaticamente la gomma';
	@override String get hideFingerDrawingToggle => 'Nascondi l\'interruttore del disegno con le dita';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Disattiva automaticamente il disegno con le dita';
	@override String get editorPromptRename => 'Rinomina le nuove note';
	@override String get recentColorsDontSavePresets => 'Non salvare i colori preimpostati nei colori recenti';
	@override String get recentColorsLength => 'Quanti colori recenti memorizzare';
	@override String get printPageIndicators => 'Stampa indicatori di pagina';
	@override String get autosave => 'Salvataggio automatico';
	@override String get shapeRecognitionDelay => 'Ritardo nel riconoscimento della forma';
	@override String get autoStraightenLines => 'Raddrizzamento automatico delle linee';
	@override String get simplifiedHomeLayout => 'Layout semplificato della schermata home';
	@override String get customDataDir => 'Cartella Saber personalizzata';
	@override String get sentry => 'Segnalazione di errori';
}

// Path: settings.prefDescriptions
class _Translations$settings$prefDescriptions$it extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Migliora la leggibilità per i lettori ipovedenti';
	@override String get allowInsecureConnections => '(Non consigliato) Consenti a Saber di connettersi ai server con certificati autofirmati/non attendibili';
	@override String get preferGreyscale => 'Per display e-ink';
	@override String get autoClearWhiteboardOnExit => 'Pulisce la lavagna alla chiusura dell\'app';
	@override String get disableEraserAfterUse => 'Torna automaticamente alla penna dopo aver utilizzato la gomma';
	@override String get maxImageSize => 'Le immagini più grandi verranno compresse';
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$it hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$it._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Disattiva il disegno con le dita quando viene rilevata una penna';
	@override String get editorPromptRename => 'Puoi sempre rinominare le note successivamente';
	@override String get printPageIndicators => 'Mostra indicatori di pagina nelle esportazioni';
	@override String get autosave => 'Salvataggio automatico dopo un breve ritardo, oppure mai';
	@override String get shapeRecognitionDelay => 'Quanto spesso aggiornare l\'anteprima della forma';
	@override String get autoStraightenLines => 'Raddrizza le linee lunghe senza dover utilizzare la penna per le forme';
	@override String get simplifiedHomeLayout => 'Imposta un\'altezza fissa per ogni anteprima della nota';
	@override String get shouldAlwaysAlertForUpdates => 'Segnalami gli aggiornamenti non appena sono disponibili';
	@override late final _Translations$settings$prefDescriptions$sentry$it sentry = _Translations$settings$prefDescriptions$sentry$it._(_root);
}

// Path: settings.themeModes
class _Translations$settings$themeModes$it extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get light => 'Chiaro';
	@override String get dark => 'Scuro';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$it extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Automatico';
	@override String get phone => 'Telefono';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$it extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Scegli un colore';
}

// Path: settings.reset
class _Translations$settings$reset$it extends Translations$settings$reset$en {
	_Translations$settings$reset$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ripristinare questa impostazione?';
	@override String get button => 'Ripristina';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$it extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Annulla';
	@override String get select => 'Seleziona';
	@override String get mustBeEmpty => 'La cartella selezionata deve essere vuota';
	@override String get mustBeDoneSyncing => 'Assicurati che la sincronizzazione sia completa prima di cambiare cartella';
	@override String get unsupported => 'Questa funzionalità è attualmente disponibile solo per gli sviluppatori. Il suo utilizzo comporterà probabilmente la perdita di dati.';
}

// Path: login.form
class _Translations$login$form$it extends Translations$login$form$en {
	_Translations$login$form$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Effettuando l\'accesso, accetti l\''),
		linkToPrivacyPolicy('Informativa sulla privacy'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _Translations$login$status$it extends Translations$login$status$en {
	_Translations$login$status$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Disconnesso';
	@override String get tapToLogin => 'Tocca per accedere con Nextcloud';
	@override String hi({required Object u}) => 'Ciao, ${u}!';
	@override String get almostDone => 'Quasi pronto per la sincronizzazione, tocca per completare l\'accesso';
	@override String get loggedIn => 'Effettuato l\'accesso con Nextcloud';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$it extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'Scegli dove vuoi archiviare i tuoi dati:';
	@override String get saberNcServer => 'Il server Nextcloud di Saber';
	@override String get otherNcServer => 'Altro server Nextcloud';
	@override String get serverUrl => 'URL Server';
	@override String get loginWithSaber => 'Accedi con Saber';
	@override String get loginWithNextcloud => 'Accedi con Nextcloud';
	@override late final _Translations$login$ncLoginStep$loginFlow$it loginFlow = _Translations$login$ncLoginStep$loginFlow$it._(_root);
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$it extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Per proteggere i tuoi dati, inserisci la tua password di cifratura:';
	@override String get newToSaber => 'Nuovo su Saber? Basta inserire una nuova password di cifratura.';
	@override String get encPassword => 'Password di cifratura';
	@override String get encFaqTitle => 'Domande frequenti';
	@override String get wrongEncPassword => 'La decrittazione non è riuscita con la password fornita. Per favore prova a inserirla nuovamente.';
	@override String get connectionFailed => 'Qualcosa è andato storto durante la connessione al server. Per favore riprova più tardi.';
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$it._(_root),
		_Translations$login$encLoginStep$encFaq$1$it._(_root),
		_Translations$login$encLoginStep$encFaq$2$it._(_root),
	];
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$it extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Homepage del server';
	@override String get deleteAccount => 'Elimina account';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$it extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Perderò le mie note se mi disconnetto?';
	@override String get a => 'No. Le tue note rimarranno sia sul tuo dispositivo che sul server. Non verranno sincronizzate con il server finché non effettuerai nuovamente l\'accesso. Assicurati che la sincronizzazione sia completata prima di disconnetterti in modo da non perdere alcun dato (vedi l\'avanzamento della sincronizzazione nella schermata home).';
}

// Path: profile.faq.1
class _Translations$profile$faq$1$it extends Translations$profile$faq$1$en {
	_Translations$profile$faq$1$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Come cambio la mia password Nextcloud?';
	@override String get a => 'Vai al sito web del tuo server e accedi. Quindi vai in Impostazioni > Sicurezza > Cambia password. Dovrai disconnetterti e riconnetterti a Saber dopo aver cambiato la tua password.';
}

// Path: profile.faq.2
class _Translations$profile$faq$2$it extends Translations$profile$faq$2$en {
	_Translations$profile$faq$2$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Come cambio la mia password di cifratura?';
	@override String get a => '0. Assicurati che la sincronizzazione sia completata (vedi l\'avanzamento della sincronizzazione nella schermata home).\n1. Disconnettiti da Saber. \n2. Vai al sito Web del tuo server ed elimina la cartella "Saber". Questo eliminerà tutte le tue note dal server.\n3. Accedi nuovamente a Saber. Puoi scegliere una nuova password di cifratura quando accedi.\n4. Non dimenticare di disconnetterti e accedere nuovamente a Saber anche sugli altri tuoi dispositivi.';
}

// Path: profile.faq.3
class _Translations$profile$faq$3$it extends Translations$profile$faq$3$en {
	_Translations$profile$faq$3$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Come posso eliminare il mio account?';
	@override String get a => 'Tocca il pulsante "${_root.profile.quickLinks.deleteAccount}" in alto e, se necessario, accedi.\nSe stai utilizzando il server Saber ufficiale, il tuo account verrà eliminato dopo un periodo di tolleranza di 1 settimana. Puoi contattarmi all\'indirizzo adilhanney@disroot.org durante questo periodo per annullare l\'eliminazione.\nSe stai utilizzando un server di terze parti, potrebbe non esserci un\'opzione per eliminare il tuo account: dovrai consultare la politica sulla privacy del server per ulteriori informazioni.';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$it extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Attiva/disattiva i colori (Ctrl C)';
	@override String get select => 'Seleziona';
	@override String get toggleEraser => 'Attiva/disattiva gomma (Ctrl E)';
	@override String get photo => 'Immagini';
	@override String get text => 'Testo';
	@override String get toggleFingerDrawing => 'Attiva/disattiva il disegno con il dito (Ctrl F)';
	@override String get undo => 'Annulla';
	@override String get redo => 'Rifai';
	@override String get export => 'Esporta (Ctrl Shift S)';
	@override String get exportAs => 'Esporta come:';
	@override String get fullscreen => 'Passa a schermo intero (F11)';
}

// Path: editor.pens
class _Translations$editor$pens$it extends Translations$editor$pens$en {
	_Translations$editor$pens$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Penna stilografica';
	@override String get ballpointPen => 'Penna a sfera';
	@override String get highlighter => 'Evidenziatore';
	@override String get pencil => 'Matita';
	@override String get shapePen => 'Penna per le forme';
	@override String get laserPointer => 'Puntatore laser';
}

// Path: editor.penOptions
class _Translations$editor$penOptions$it extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get size => 'Dimensione';
}

// Path: editor.colors
class _Translations$editor$colors$it extends Translations$editor$colors$en {
	_Translations$editor$colors$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Selettore di colori';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Personalizzato ${b} ${h}';
	@override String customHue({required Object h}) => 'Personalizzato ${h}';
	@override String get dark => 'scuro';
	@override String get light => 'chiaro';
	@override String get black => 'Nero';
	@override String get darkGrey => 'Grigio scuro';
	@override String get grey => 'Grigio';
	@override String get lightGrey => 'Grigio chiaro';
	@override String get white => 'Bianco';
	@override String get red => 'Rosso';
	@override String get green => 'Verde';
	@override String get cyan => 'Ciano';
	@override String get blue => 'Blu';
	@override String get yellow => 'Giallo';
	@override String get purple => 'Viola';
	@override String get pink => 'Rosa';
	@override String get orange => 'Arancione';
	@override String get pastelRed => 'Rosso pastello';
	@override String get pastelOrange => 'Arancione pastello';
	@override String get pastelYellow => 'Giallo pastello';
	@override String get pastelGreen => 'Verde pastello';
	@override String get pastelCyan => 'Ciano pastello';
	@override String get pastelBlue => 'Blu pastello';
	@override String get pastelPurple => 'Viola pastello';
	@override String get pastelPink => 'Rosa pastello';
}

// Path: editor.imageOptions
class _Translations$editor$imageOptions$it extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opzioni immagine';
	@override String get invertible => 'Invertibile';
	@override String get download => 'Scarica';
	@override String get setAsBackground => 'Imposta come sfondo';
	@override String get removeAsBackground => 'Rimuovi come sfondo';
	@override String get delete => 'Elimina';
}

// Path: editor.selectionBar
class _Translations$editor$selectionBar$it extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Elimina';
	@override String get duplicate => 'Duplica';
}

// Path: editor.menu
class _Translations$editor$menu$it extends Translations$editor$menu$en {
	_Translations$editor$menu$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Pulisci pagina ${page}/${totalPages}';
	@override String get clearAllPages => 'Pulisci tutte le pagine';
	@override String get insertPage => 'Inserisci pagina sotto';
	@override String get duplicatePage => 'Duplica pagina';
	@override String get deletePage => 'Elimina pagina';
	@override String get lineHeight => 'Altezza delle linee';
	@override String get lineHeightDescription => 'Regola anche la dimensione del testo per le note digitate';
	@override String get lineThickness => 'Spessore delle linee';
	@override String get lineThicknessDescription => 'Spessore delle linee dello sfondo';
	@override String get backgroundImageFit => 'Adattamento immagine di sfondo';
	@override String get backgroundPattern => 'Modello dello sfondo';
	@override String get import => 'Importa';
	@override String get watchServer => 'Controlla gli aggiornamenti sul server';
	@override String get watchServerReadOnly => 'La modifica è disabilitata mentre si controlla il server';
	@override late final _Translations$editor$menu$boxFits$it boxFits = _Translations$editor$menu$boxFits$it._(_root);
	@override late final _Translations$editor$menu$bgPatterns$it bgPatterns = _Translations$editor$menu$bgPatterns$it._(_root);
}

// Path: editor.readOnlyBanner
class _Translations$editor$readOnlyBanner$it extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Modalità di sola lettura';
	@override String get watchingServer => 'Al momento stai monitorando gli aggiornamenti sul server. La modifica è disabilitata in questa modalità.';
	@override String get corrupted => 'Impossibile caricare la nota. Potrebbe essere danneggiata o ancora in fase di download.';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$it extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Questa nota è stata modificata utilizzando una versione più recente di Saber';
	@override String get subtitle => 'La modifica di questa nota potrebbe comportare la perdita di alcune informazioni. Vuoi ignorare e modificarla comunque?';
	@override String get allowEditing => 'Consenti modifica';
}

// Path: editor.quill
class _Translations$editor$quill$it extends Translations$editor$quill$en {
	_Translations$editor$quill$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Scrivi qualcosa qui...';
}

// Path: editor.hud
class _Translations$editor$hud$it extends Translations$editor$hud$en {
	_Translations$editor$hud$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Sblocca zoom';
	@override String get lockZoom => 'Blocca zoom';
	@override String get unlockSingleFingerPan => 'Attiva la panoramica con un solo dito';
	@override String get lockSingleFingerPan => 'Blocca la panoramica con un solo dito';
	@override String get unlockAxisAlignedPan => 'Sblocca la panoramica orizzontale o verticale';
	@override String get lockAxisAlignedPan => 'Blocca la panoramica in orizzontale o verticale';
}

// Path: sentry.consent.description
class _Translations$sentry$consent$description$it extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Vuoi segnalare automaticamente gli errori imprevisti? Questo mi aiuta a identificare e risolvere i problemi più velocemente.';
	@override String get scope => 'I resoconti potrebbero contenere informazioni sull\'errore e sul tuo dispositivo. Ho fatto il possibile per rimuovere dati personali, ma alcuni potrebbero rimanere.';
	@override String get currentlyOff => 'Se acconsenti, la segnalazione degli errori verrà abilitata dopo il riavvio dell\'app.';
	@override String get currentlyOn => 'Se revochi il consenso, riavvia l\'app per disattivare la segnalazione degli errori.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Scopri di più in '),
		link('privacy policy'),
		const TextSpan(text: '.'),
	]);
}

// Path: sentry.consent.answers
class _Translations$sentry$consent$answers$it extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Sì';
	@override String get no => 'No';
	@override String get later => 'Chiedimelo più tardi';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$it extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Impedisce l\'attivazione accidentale';
	@override String get fixedOn => 'Il disegno con le dita è sempre abilitato';
	@override String get fixedOff => 'Il disegno con le dita è sempre disabilitato';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$it extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get active => 'Attivo';
	@override String get inactive => 'Non attivo';
	@override String get activeUntilRestart => 'Attivo fino al riavvio dell\'app';
	@override String get inactiveUntilRestart => 'Non attivo finché non riavvii l\'app';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$it extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Autorizza Saber ad accedere al tuo account Nextcloud';
	@override String get followPrompts => 'Seguire le istruzioni nell\'interfaccia Nextcloud';
	@override String get browserDidntOpen => 'La pagina di accesso non si è aperta? Clicca qui';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$it extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Cos\'è una password di cifratura? Perché usare due password?';
	@override String get a => 'La password Nextcloud viene utilizzata per accedere al cloud. La password di cifratura "rimescola" i tuoi dati prima che raggiungano il cloud.\n Anche se qualcuno riesce ad accedere al tuo account Nextcloud, le tue note rimarranno al sicuro e criptate con una password separata. Ciò fornisce un secondo livello di sicurezza per proteggere i tuoi dati.\n Nessuno può accedere alle tue note sul server senza la tua password di cifratura, ma ciò significa anche che se dimentichi la tua password di cifratura, perderai l\'accesso ai tuoi dati.';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$it extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Non ho ancora impostato una password di cifratura. Come posso ottenerla?';
	@override String get a => 'Scegli una nuova password di cifratura e inseriscila sopra.\nSaber genererà automaticamente le chiavi di cifratura da questa password.';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$it extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Posso utilizzare la stessa password del mio account Nextcloud?';
	@override String get a => 'Sì, ma tieni presente che sarebbe più semplice per l\'amministratore del server o per qualcun altro accedere alle tue note se avessero accesso al tuo account Nextcloud.';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$it extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Riempi';
	@override String get cover => 'Copri';
	@override String get contain => 'Adatta';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$it extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$it._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get none => 'Vuoto';
	@override String get college => 'Righe (margine sinistro)';
	@override String get collegeRtl => 'Righe (margine destro)';
	@override String get lined => 'Righe';
	@override String get grid => 'Griglia';
	@override String get dots => 'Punti';
	@override String get staffs => 'Pentagrammi';
	@override String get tablature => 'Tablatura';
	@override String get cornell => 'Metodo Cornell';
}
