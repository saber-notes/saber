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
class TranslationsIt extends Translations {
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
	@override late final _TranslationsCommonIt common = _TranslationsCommonIt._(_root);
	@override late final _TranslationsHomeIt home = _TranslationsHomeIt._(_root);
	@override late final _TranslationsSettingsIt settings = _TranslationsSettingsIt._(_root);
	@override late final _TranslationsLogsIt logs = _TranslationsLogsIt._(_root);
	@override late final _TranslationsLoginIt login = _TranslationsLoginIt._(_root);
	@override late final _TranslationsProfileIt profile = _TranslationsProfileIt._(_root);
	@override late final _TranslationsAppInfoIt appInfo = _TranslationsAppInfoIt._(_root);
	@override late final _TranslationsUpdateIt update = _TranslationsUpdateIt._(_root);
	@override late final _TranslationsEditorIt editor = _TranslationsEditorIt._(_root);
}

// Path: common
class _TranslationsCommonIt extends TranslationsCommonEn {
	_TranslationsCommonIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get done => 'Fatto';
	@override String get continueBtn => 'Continua';
	@override String get cancel => 'Cancella';
}

// Path: home
class _TranslationsHomeIt extends TranslationsHomeEn {
	_TranslationsHomeIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsIt tabs = _TranslationsHomeTabsIt._(_root);
	@override late final _TranslationsHomeTitlesIt titles = _TranslationsHomeTitlesIt._(_root);
	@override late final _TranslationsHomeTooltipsIt tooltips = _TranslationsHomeTooltipsIt._(_root);
	@override late final _TranslationsHomeCreateIt create = _TranslationsHomeCreateIt._(_root);
	@override String get welcome => 'Benvenuto su Saber';
	@override String get invalidFormat => 'Il file selezionato non è supportato. Seleziona un file .sbn, .sbn2, .sba o .pdf.';
	@override String get noFiles => 'Nessun file trovato';
	@override String get noPreviewAvailable => 'Nessuna anteprima disponibile';
	@override String get createNewNote => 'Tocca il pulsante + per creare una nuova nota';
	@override String get backFolder => 'Torna alla cartella precedente';
	@override late final _TranslationsHomeNewFolderIt newFolder = _TranslationsHomeNewFolderIt._(_root);
	@override late final _TranslationsHomeRenameNoteIt renameNote = _TranslationsHomeRenameNoteIt._(_root);
	@override late final _TranslationsHomeMoveNoteIt moveNote = _TranslationsHomeMoveNoteIt._(_root);
	@override String get deleteNote => 'Elimina nota';
	@override late final _TranslationsHomeRenameFolderIt renameFolder = _TranslationsHomeRenameFolderIt._(_root);
	@override late final _TranslationsHomeDeleteFolderIt deleteFolder = _TranslationsHomeDeleteFolderIt._(_root);
}

// Path: settings
class _TranslationsSettingsIt extends TranslationsSettingsEn {
	_TranslationsSettingsIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesIt prefCategories = _TranslationsSettingsPrefCategoriesIt._(_root);
	@override late final _TranslationsSettingsPrefLabelsIt prefLabels = _TranslationsSettingsPrefLabelsIt._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsIt prefDescriptions = _TranslationsSettingsPrefDescriptionsIt._(_root);
	@override late final _TranslationsSettingsThemeModesIt themeModes = _TranslationsSettingsThemeModesIt._(_root);
	@override late final _TranslationsSettingsLayoutSizesIt layoutSizes = _TranslationsSettingsLayoutSizesIt._(_root);
	@override late final _TranslationsSettingsAccentColorPickerIt accentColorPicker = _TranslationsSettingsAccentColorPickerIt._(_root);
	@override String get systemLanguage => 'Lingua del sistema';
	@override List<String> get axisDirections => [
		'Sopra',
		'Destra',
		'In basso',
		'Sotto',
	];
	@override late final _TranslationsSettingsResetIt reset = _TranslationsSettingsResetIt._(_root);
	@override String get resyncEverything => 'Risincronizza tutto';
	@override String get openDataDir => 'Apri cartella Saber';
	@override late final _TranslationsSettingsCustomDataDirIt customDataDir = _TranslationsSettingsCustomDataDirIt._(_root);
}

// Path: logs
class _TranslationsLogsIt extends TranslationsLogsEn {
	_TranslationsLogsIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Log';
	@override String get viewLogs => 'Visualizza log';
	@override String get debuggingInfo => 'I log contengono informazioni utili per il debug e lo sviluppo';
	@override String get noLogs => 'Niente log qui!';
	@override String get logsAreTemporary => 'I log vengono conservati solo finché non chiudi l\'app';
}

// Path: login
class _TranslationsLoginIt extends TranslationsLoginEn {
	_TranslationsLoginIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Login';
	@override late final _TranslationsLoginFormIt form = _TranslationsLoginFormIt._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Non hai ancora un account? '),
		linkToSignup('Registrati ora'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'Nn sei tu? '),
		undoLogin('Scegli un altro account'),
		const TextSpan(text: '.'),
	]);
	@override late final _TranslationsLoginStatusIt status = _TranslationsLoginStatusIt._(_root);
	@override late final _TranslationsLoginNcLoginStepIt ncLoginStep = _TranslationsLoginNcLoginStepIt._(_root);
	@override late final _TranslationsLoginEncLoginStepIt encLoginStep = _TranslationsLoginEncLoginStepIt._(_root);
}

// Path: profile
class _TranslationsProfileIt extends TranslationsProfileEn {
	_TranslationsProfileIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Il mio profilo';
	@override String get logout => 'Log out';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Stai ${used} di ${total} (${percent}%)';
	@override String get connectedTo => 'Collegato a';
	@override late final _TranslationsProfileQuickLinksIt quickLinks = _TranslationsProfileQuickLinksIt._(_root);
	@override String get faqTitle => 'Domande frequenti';
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$It._(_root),
		_TranslationsProfile$faq$0i1$It._(_root),
		_TranslationsProfile$faq$0i2$It._(_root),
		_TranslationsProfile$faq$0i3$It._(_root),
	];
}

// Path: appInfo
class _TranslationsAppInfoIt extends TranslationsAppInfoEn {
	_TranslationsAppInfoIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber Copyright © 2022-${buildYear} Adil Hanney\nQuesto programma non ha alcuna garanzia. Questo è un software libero e sei libero di ridistribuirlo a determinate condizioni.';
	@override String get dirty => 'GROSSOLANA';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Tocca qui per sponsorizzarmi o acquistare altro spazio di archiviazione';
	@override String get licenseButton => 'Tocca qui per visualizzare ulteriori informazioni sulla licenza';
	@override String get privacyPolicyButton => 'Tocca qui per visualizzare l\'informativa sulla privacy';
}

// Path: update
class _TranslationsUpdateIt extends TranslationsUpdateEn {
	_TranslationsUpdateIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Aggiornamento disponibile';
	@override String get updateAvailableDescription => 'È disponibile una nuova versione dell\'app, con queste modifiche:';
	@override String get update => 'Aggiornamento';
	@override String get downloadNotAvailableYet => 'Il download non è ancora disponibile per la tua piattaforma. Ti invitiamo a controllare nuovamente a breve.';
}

// Path: editor
class _TranslationsEditorIt extends TranslationsEditorEn {
	_TranslationsEditorIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarIt toolbar = _TranslationsEditorToolbarIt._(_root);
	@override late final _TranslationsEditorPensIt pens = _TranslationsEditorPensIt._(_root);
	@override late final _TranslationsEditorPenOptionsIt penOptions = _TranslationsEditorPenOptionsIt._(_root);
	@override late final _TranslationsEditorColorsIt colors = _TranslationsEditorColorsIt._(_root);
	@override late final _TranslationsEditorImageOptionsIt imageOptions = _TranslationsEditorImageOptionsIt._(_root);
	@override late final _TranslationsEditorSelectionBarIt selectionBar = _TranslationsEditorSelectionBarIt._(_root);
	@override late final _TranslationsEditorMenuIt menu = _TranslationsEditorMenuIt._(_root);
	@override late final _TranslationsEditorNewerFileFormatIt newerFileFormat = _TranslationsEditorNewerFileFormatIt._(_root);
	@override late final _TranslationsEditorQuillIt quill = _TranslationsEditorQuillIt._(_root);
	@override late final _TranslationsEditorHudIt hud = _TranslationsEditorHudIt._(_root);
	@override String get pages => 'Pagine';
	@override String get untitled => 'Senza titolo';
	@override String get needsToSaveBeforeExiting => 'Salvataggio delle modifiche... Puoi tranquillamente uscire dall\'editor quando hai finito';
}

// Path: home.tabs
class _TranslationsHomeTabsIt extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Home';
	@override String get browse => 'Sfoglia';
	@override String get whiteboard => 'Lavagna';
	@override String get settings => 'Impostazioni';
}

// Path: home.titles
class _TranslationsHomeTitlesIt extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Note recenti';
	@override String get browse => 'Sfoglia';
	@override String get whiteboard => 'Lavagna';
	@override String get settings => 'Impostazioni';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsIt extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nuova nota';
	@override String get showUpdateDialog => 'Mostra finestra di aggiornamento';
	@override String get exportNote => 'Esporta nota';
}

// Path: home.create
class _TranslationsHomeCreateIt extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nuova nota';
	@override String get importNote => 'Importa nota';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderIt extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Nuova cartella';
	@override String get folderName => 'Nome cartella';
	@override String get create => 'Crea';
	@override String get folderNameEmpty => 'Il nome della cartella non può essere vuoto';
	@override String get folderNameContainsSlash => 'Il nome della cartella non può contenere una barra';
	@override String get folderNameExists => 'La cartella esiste già';
}

// Path: home.renameNote
class _TranslationsHomeRenameNoteIt extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Rinomina nota';
	@override String get noteName => 'Nome nota';
	@override String get rename => 'Rinomina';
	@override String get noteNameEmpty => 'Il nome della nota non può essere vuoto';
	@override String get noteNameContainsSlash => 'Il nome della nota non può contenere una barra';
	@override String get noteNameExists => 'Esiste già una nota con questo nome';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteIt extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Sposta nota';
	@override String moveNotes({required Object n}) => 'Sposta ${n} note';
	@override String moveName({required Object f}) => 'Sposta ${f}';
	@override String get move => 'Sposta';
	@override String renamedTo({required Object newName}) => 'La nota verrà rinominata in ${newName}';
	@override String get multipleRenamedTo => 'Le note seguenti verranno rinominate:';
	@override String numberRenamedTo({required Object n}) => '${n} le note verranno rinominate per evitare conflitti';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderIt extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Rinomina cartella';
	@override String get folderName => 'Nome cartella';
	@override String get rename => 'Rinomina';
	@override String get folderNameEmpty => 'Il nome della cartella non può essere vuoto';
	@override String get folderNameContainsSlash => 'Il nome della cartella non può contenere una barra';
	@override String get folderNameExists => 'Esiste già una cartella con questo nome';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderIt extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Elimina cartella';
	@override String deleteName({required Object f}) => 'Elimina ${f}';
	@override String get delete => 'Elimina';
	@override String get alsoDeleteContents => 'Elimina anche tutte le note all\'interno di questa cartella';
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesIt extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get general => 'Generale';
	@override String get writing => 'Scrittura';
	@override String get editor => 'Editor';
	@override String get performance => 'Prestazioni';
	@override String get advanced => 'Avanzato';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsIt extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Lingua app';
	@override String get appTheme => 'Tema dell\'app';
	@override String get platform => 'Tipo di tema';
	@override String get layoutSize => 'Dimensione layout';
	@override String get customAccentColor => 'Colore personalizzato';
	@override String get hyperlegibleFont => 'Carattere iperleggibile';
	@override String get shouldCheckForUpdates => 'Controlla automaticamente gli aggiornamenti di Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Aggiornamenti veloci';
	@override String get allowInsecureConnections => 'Consenti connessioni non sicure';
	@override String get editorToolbarAlignment => 'Allineamento della barra degli strumenti dell\'editor';
	@override String get editorToolbarShowInFullscreen => 'Mostra la barra degli strumenti dell\'editor in modalità a schermo intero';
	@override String get editorAutoInvert => 'Inverti le note in modalità scura';
	@override String get preferGreyscale => 'Preferisci i colori in scala di grigi';
	@override String get maxImageSize => 'Dimensione massima dell\'immagine';
	@override String get autoClearWhiteboardOnExit => 'Svuota la lavagna dopo essere uscito dall\'app';
	@override String get disableEraserAfterUse => 'Disattiva automaticamente la gomma';
	@override String get hideFingerDrawingToggle => 'Nascondi l\'interruttore del disegno con le dita';
	@override String get editorPromptRename => 'Richiede di rinominare nuove note';
	@override String get hideHomeBackgrounds => 'Nascondi gli sfondi nella schermata iniziale';
	@override String get recentColorsDontSavePresets => 'Non salvare i colori preimpostati nei colori recenti';
	@override String get recentColorsLength => 'Quanti colori recenti memorizzare';
	@override String get printPageIndicators => 'Stampa indicatori di pagina';
	@override String get autosaveDelay => 'Ritardo di salvataggio automatico';
	@override String get shapeRecognitionDelay => 'Ritardo nel riconoscimento della forma';
	@override String get autoStraightenLines => 'Raddrizzamento automatico delle linee';
	@override String get simplifiedHomeLayout => 'Layout semplificato della home';
	@override String get customDataDir => 'Cartella Saber personalizzata';
	@override String get pencilSoundSetting => 'Effetto sonoro della matita';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsIt extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Iperleggibile aumenta la leggibilità per i lettori ipovedenti';
	@override String get allowInsecureConnections => '(Non consigliato) Consenti a Saber di connettersi ai server con certificati autofirmati/non attendibili';
	@override String get preferGreyscale => 'Per display e-ink';
	@override String get autoClearWhiteboardOnExit => 'Sarà comunque sincronizzato con gli altri tuoi dispositivi';
	@override String get disableEraserAfterUse => 'Torna automaticamente alla penna dopo aver utilizzato la gomma';
	@override String get maxImageSize => 'Le immagini più grandi verranno compresse';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingIt hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingIt._(_root);
	@override String get editorPromptRename => 'Puoi sempre rinominare le note in un secondo momento';
	@override String get hideHomeBackgrounds => 'Per un aspetto più pulito';
	@override String get printPageIndicators => 'Mostra indicatori di pagina nelle esportazioni';
	@override String get autosaveDelay => 'Quanto tempo aspettare prima di salvare automaticamente una nota';
	@override String get shapeRecognitionDelay => 'Quanto spesso aggiornare l\'anteprima della forma';
	@override String get autoStraightenLines => 'Raddrizza le linee lunghe senza dover utilizzare la penna sagomatrice';
	@override String get simplifiedHomeLayout => 'Imposta un\'altezza fissa per ogni anteprima della nota';
	@override String get shouldAlwaysAlertForUpdates => 'Segnalami aggiornamenti non appena sono disponibili';
	@override late final _TranslationsSettingsPrefDescriptionsPencilSoundSettingIt pencilSoundSetting = _TranslationsSettingsPrefDescriptionsPencilSoundSettingIt._(_root);
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesIt extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get light => 'Chiaro';
	@override String get dark => 'Scuro';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesIt extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Automatico';
	@override String get phone => 'Telefono';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerIt extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Scegli un colore';
}

// Path: settings.reset
class _TranslationsSettingsResetIt extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ripristinare questa impostazione?';
	@override String get button => 'Ripristina';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirIt extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Annulla';
	@override String get select => 'Seleziona';
	@override String get mustBeEmpty => 'La cartella selezionata deve essere vuota';
	@override String get mustBeDoneSyncing => 'Assicurati che la sincronizzazione sia completa prima di cambiare cartella';
}

// Path: login.form
class _TranslationsLoginFormIt extends TranslationsLoginFormEn {
	_TranslationsLoginFormIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Effettuando l\'accesso, accetti la '),
		linkToPrivacyPolicy('Informativa sulla privacy'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusIt extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Disconnesso';
	@override String get tapToLogin => 'Tocca per accedere con Nextcloud';
	@override String hi({required Object u}) => 'Ciao, ${u}!';
	@override String get almostDone => 'Quasi pronto per la sincronizzazione, tocca per completare l\'accesso';
	@override String get loggedIn => 'Effettuato l\'accesso con Nextcloud';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepIt extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'Scegli dove vuoi archiviare i tuoi dati:';
	@override String get saberNcServer => 'Il server Nextcloud di Saber';
	@override String get otherNcServer => 'Altro server Nextcloud';
	@override String get serverUrl => 'URL Server';
	@override String get loginWithSaber => 'Accedi con Saber';
	@override String get loginWithNextcloud => 'Accedi con Nextcloud';
	@override late final _TranslationsLoginNcLoginStepLoginFlowIt loginFlow = _TranslationsLoginNcLoginStepLoginFlowIt._(_root);
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepIt extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Per proteggere i tuoi dati, inserisci la password crittografata:';
	@override String get newToSaber => 'Nuovo su Saber? Basta inserire una nuova password crittografata.';
	@override String get encPassword => 'Password crittografata';
	@override String get encFaqTitle => 'Domande frequenti';
	@override String get wrongEncPassword => 'La decrittografia non è riuscita con la password fornita. Per favore prova a inserirla di nuovo.';
	@override String get connectionFailed => 'Qualcosa è andato storto durante la connessione al server. Per favore riprova più tardi.';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$It._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$It._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$It._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksIt extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Homepage del server';
	@override String get deleteAccount => 'Elimina account';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$It extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$It._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Perderò i miei appunti se mi disconnetto?';
	@override String get a => 'No. Le tue note rimarranno sia sul tuo dispositivo che sul server. Non verranno sincronizzati con il server fino a quando non effettui nuovamente l\'accesso. Assicurati che la sincronizzazione sia completa prima di uscire in modo da non perdere alcun dato (vedi l\'avanzamento della sincronizzazione nella schermata iniziale).';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$It extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$It._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Come cambio la mia password Nextcloud?';
	@override String get a => 'Vai al sito web del tuo server e accedi. Quindi vai su Impostazioni > Sicurezza > Cambia password. Dovrai disconnetterti e riconnetterti a Saber dopo aver cambiato la tua password.';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$It extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$It._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Come cambio la mia password di crittografia?';
	@override String get a => '1. Disconnettersi da Saber. Assicurati che la sincronizzazione sia completa prima di uscire in modo da non perdere alcun dato (vedi l\'avanzamento della sincronizzazione nella schermata iniziale).\n2. Vai al sito Web del tuo server ed elimina la cartella "Saber". Questo eliminerà tutte le tue note dal server.\n3. Accedi nuovamente a Saber. Puoi scegliere una nuova password di crittografia quando accedi.\n4. Non dimenticare di disconnetterti e accedere nuovamente a Saber anche sugli altri tuoi dispositivi.';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$It extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$It._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Come posso eliminare il mio account?';
	@override String get a => 'Tocca il pulsante "${_root.profile.quickLinks.deleteAccount}" in alto e, se necessario, accedi.\nSe stai utilizzando il server Saber ufficiale, il tuo account verrà eliminato dopo un periodo di tolleranza di 1 settimana. Puoi contattarmi all\'indirizzo adilhanney@disroot.org durante questo periodo per annullare l\'eliminazione.\nSe stai utilizzando un server di terze parti, potrebbe non esserci un\'opzione per eliminare il tuo account: dovrai consultare la politica sulla privacy del server per ulteriori informazioni.';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarIt extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Attiva/disattiva i colori (Ctrl C)';
	@override String get select => 'Selezione';
	@override String get toggleEraser => 'Attiva/disattiva gomma (Ctrl E)';
	@override String get photo => 'Foto';
	@override String get text => 'Testo';
	@override String get toggleFingerDrawing => 'Attiva/disattiva il disegno con il dito (Ctrl F)';
	@override String get undo => 'Annulla';
	@override String get redo => 'Rifai';
	@override String get export => 'Esporta (Ctrl Shift S)';
	@override String get exportAs => 'Esporta come:';
	@override String get fullscreen => 'Passa a schermo intero (F11)';
}

// Path: editor.pens
class _TranslationsEditorPensIt extends TranslationsEditorPensEn {
	_TranslationsEditorPensIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Penna stilografica';
	@override String get ballpointPen => 'Penna a sfera';
	@override String get highlighter => 'Evidenziatore';
	@override String get pencil => 'Matita';
	@override String get shapePen => 'Forma della penna';
	@override String get laserPointer => 'Puntatore laser';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsIt extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get size => 'Dimesione';
}

// Path: editor.colors
class _TranslationsEditorColorsIt extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsIt._(TranslationsIt root) : this._root = root, super.internal(root);

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
	@override String get purple => 'Porpora';
	@override String get pink => 'Rosa';
	@override String get orange => 'Arancione';
	@override String get pastelRed => 'Rosso pastello';
	@override String get pastelOrange => 'Arancione pastello';
	@override String get pastelYellow => 'Giallo pastello';
	@override String get pastelGreen => 'Verde pastello';
	@override String get pastelCyan => 'Ciano pastello';
	@override String get pastelBlue => 'Blu pastello';
	@override String get pastelPurple => 'Porpora pastella';
	@override String get pastelPink => 'Rosa pastello';
}

// Path: editor.imageOptions
class _TranslationsEditorImageOptionsIt extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opzioni immagine';
	@override String get invertible => 'Invertibile';
	@override String get download => 'Download';
	@override String get setAsBackground => 'Imposta come sfondo';
	@override String get removeAsBackground => 'Rimuovi come sfondo';
	@override String get delete => 'Cancella';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarIt extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Cancella';
	@override String get duplicate => 'Duplicare';
}

// Path: editor.menu
class _TranslationsEditorMenuIt extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Pulisci pagina ${page}/${totalPages} totali';
	@override String get clearAllPages => 'Pulisci tutte le pagine';
	@override String get insertPage => 'Inserisci pagina sotto';
	@override String get duplicatePage => 'Pagina duplicata';
	@override String get deletePage => 'Elimina pagina';
	@override String get lineHeight => 'Altezza della linea';
	@override String get lineHeightDescription => 'Controlla anche la dimensione del testo per le note digitate';
	@override String get backgroundImageFit => 'Adattamento immagine di sfondo';
	@override String get backgroundPattern => 'Modello di sfondo';
	@override String get import => 'Importa';
	@override String get watchServer => 'Controlla gli aggiornamenti sul server';
	@override String get watchServerReadOnly => 'La modifica è disabilitata mentre si guarda il server';
	@override late final _TranslationsEditorMenuBoxFitsIt boxFits = _TranslationsEditorMenuBoxFitsIt._(_root);
	@override late final _TranslationsEditorMenuBgPatternsIt bgPatterns = _TranslationsEditorMenuBgPatternsIt._(_root);
	@override String get lineThickness => 'Spessore della linea';
	@override String get lineThicknessDescription => 'Spessore della linea di sfondo';
}

// Path: editor.newerFileFormat
class _TranslationsEditorNewerFileFormatIt extends TranslationsEditorNewerFileFormatEn {
	_TranslationsEditorNewerFileFormatIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Modalità di sola lettura';
	@override String get title => 'Questa nota è stata modificata utilizzando una versione più recente di Saber';
	@override String get subtitle => 'La modifica di questa nota potrebbe comportare la perdita di alcune informazioni. Vuoi ignorare e modificarla comunque?';
	@override String get allowEditing => 'Consenti modifica';
}

// Path: editor.quill
class _TranslationsEditorQuillIt extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Scrivi qualcosa qui...';
}

// Path: editor.hud
class _TranslationsEditorHudIt extends TranslationsEditorHudEn {
	_TranslationsEditorHudIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Sblocca zoom';
	@override String get lockZoom => 'Blocca zoom';
	@override String get unlockSingleFingerPan => 'Attiva la panoramica con un solo dito';
	@override String get lockSingleFingerPan => 'Disabilita la panoramica con un solo dito';
	@override String get unlockAxisAlignedPan => 'Sblocca la panoramica orizzontale o verticale';
	@override String get lockAxisAlignedPan => 'Blocca la panoramica su orizzontale o verticale';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingIt extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Impedisce l\'attivazione accidentale';
	@override String get fixedOn => 'Il disegno con le dita è fissato come abilitato';
	@override String get fixedOff => 'Il disegno con le dita è fisso come disabilitato';
}

// Path: settings.prefDescriptions.pencilSoundSetting
class _TranslationsSettingsPrefDescriptionsPencilSoundSettingIt extends TranslationsSettingsPrefDescriptionsPencilSoundSettingEn {
	_TranslationsSettingsPrefDescriptionsPencilSoundSettingIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get off => 'Nessun suono';
	@override String get onButNotInSilentMode => 'Abilitato (a meno che non sia in modalità silenziosa)';
	@override String get onAlways => 'Abilitato (anche in modalità silenziosa)';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowIt extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Autorizza Saber ad accedere al tuo account Nextcloud';
	@override String get followPrompts => 'Seguire le istruzioni nell\'interfaccia Nextcloud';
	@override String get browserDidntOpen => 'La pagina di accesso non si è aperta? Clicca qui';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$It extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$It._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Cos\'è una password crittografata? Perché usare due password?';
	@override String get a => 'La password Nextcloud viene utilizzata per accedere al cloud. La password di crittografia "codifica" i tuoi dati prima che raggiungano il cloud.\n Anche se qualcuno riesce ad accedere al tuo account Nextcloud, le tue note rimarranno al sicuro e crittografate con una password separata. Ciò fornisce un secondo livello di sicurezza per proteggere i tuoi dati.\n Nessuno può accedere alle tue note sul server senza la tua password di crittografia, ma ciò significa anche che se dimentichi la password di crittografia, perderai l\'accesso ai tuoi dati.';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$It extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$It._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Non ho ancora impostato una password di crittografia. Dove lo posso ottenere?';
	@override String get a => 'Scegli una nuova password crittografata e inseriscila sopra.\nSaber genererà automaticamente le chiavi di crittografia da questa password.';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$It extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$It._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Posso utilizzare la stessa password del mio account Nextcloud?';
	@override String get a => 'Sì, ma tieni presente che sarebbe più semplice per l\'amministratore del server o qualcun altro accedere alle tue note se accedessero al tuo account Nextcloud.';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsIt extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Tratto';
	@override String get cover => 'Copertina';
	@override String get contain => 'Contiene';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsIt extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsIt._(TranslationsIt root) : this._root = root, super.internal(root);

	final TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get none => 'Vuoto';
	@override String get college => 'College-ruled';
	@override String get collegeRtl => 'College governato (inverso)';
	@override String get lined => 'Lined';
	@override String get grid => 'Griglia';
	@override String get dots => 'Punti';
	@override String get staffs => 'Pentagrammi';
	@override String get tablature => 'Tablatura';
	@override String get cornell => 'Metodo Cornell';
}
