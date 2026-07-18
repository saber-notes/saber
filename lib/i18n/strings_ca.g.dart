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
class TranslationsCa extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsCa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ca,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ca>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsCa _root = this; // ignore: unused_field

	@override 
	TranslationsCa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsCa(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$ca common = _Translations$common$ca._(_root);
	@override late final _Translations$home$ca home = _Translations$home$ca._(_root);
	@override late final _Translations$sentry$ca sentry = _Translations$sentry$ca._(_root);
	@override late final _Translations$settings$ca settings = _Translations$settings$ca._(_root);
	@override late final _Translations$logs$ca logs = _Translations$logs$ca._(_root);
	@override late final _Translations$login$ca login = _Translations$login$ca._(_root);
	@override late final _Translations$profile$ca profile = _Translations$profile$ca._(_root);
	@override late final _Translations$appInfo$ca appInfo = _Translations$appInfo$ca._(_root);
	@override late final _Translations$update$ca update = _Translations$update$ca._(_root);
	@override late final _Translations$editor$ca editor = _Translations$editor$ca._(_root);
}

// Path: common
class _Translations$common$ca extends Translations$common$en {
	_Translations$common$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get done => 'Fet';
	@override String get continueBtn => 'Procedeix';
	@override String get cancel => 'Cancel·la';
}

// Path: home
class _Translations$home$ca extends Translations$home$en {
	_Translations$home$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$ca tabs = _Translations$home$tabs$ca._(_root);
	@override late final _Translations$home$titles$ca titles = _Translations$home$titles$ca._(_root);
	@override late final _Translations$home$tooltips$ca tooltips = _Translations$home$tooltips$ca._(_root);
	@override late final _Translations$home$create$ca create = _Translations$home$create$ca._(_root);
	@override String get welcome => 'Benvingut/d@ a Saber';
	@override String get invalidFormat => 'L\'arxiu seleccionat no és compatible.\nSiusplau, proveu-ho des d\'un dels següents formats: sbn, sbn2, sba o PDF';
	@override String get noFiles => 'Cap arxiu trobat';
	@override String get noPreviewAvailable => 'Previsualització no disponible';
	@override String get createNewNote => 'Prem + per a crear una nota nova';
	@override String get backFolder => 'Torna a la carpeta anterior';
	@override late final _Translations$home$newFolder$ca newFolder = _Translations$home$newFolder$ca._(_root);
	@override late final _Translations$home$renameNote$ca renameNote = _Translations$home$renameNote$ca._(_root);
	@override late final _Translations$home$moveNote$ca moveNote = _Translations$home$moveNote$ca._(_root);
	@override String get deleteNote => 'Esborrar nota';
	@override late final _Translations$home$deleteNoteDialog$ca deleteNoteDialog = _Translations$home$deleteNoteDialog$ca._(_root);
	@override late final _Translations$home$renameFolder$ca renameFolder = _Translations$home$renameFolder$ca._(_root);
	@override late final _Translations$home$deleteFolder$ca deleteFolder = _Translations$home$deleteFolder$ca._(_root);
}

// Path: sentry
class _Translations$sentry$ca extends Translations$sentry$en {
	_Translations$sentry$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$ca consent = _Translations$sentry$consent$ca._(_root);
}

// Path: settings
class _Translations$settings$ca extends Translations$settings$en {
	_Translations$settings$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$ca prefCategories = _Translations$settings$prefCategories$ca._(_root);
	@override late final _Translations$settings$prefLabels$ca prefLabels = _Translations$settings$prefLabels$ca._(_root);
	@override late final _Translations$settings$prefDescriptions$ca prefDescriptions = _Translations$settings$prefDescriptions$ca._(_root);
	@override late final _Translations$settings$themeModes$ca themeModes = _Translations$settings$themeModes$ca._(_root);
	@override late final _Translations$settings$layoutSizes$ca layoutSizes = _Translations$settings$layoutSizes$ca._(_root);
	@override late final _Translations$settings$accentColorPicker$ca accentColorPicker = _Translations$settings$accentColorPicker$ca._(_root);
	@override late final _Translations$settings$reset$ca reset = _Translations$settings$reset$ca._(_root);
	@override late final _Translations$settings$customDataDir$ca customDataDir = _Translations$settings$customDataDir$ca._(_root);
	@override List<String> get axisDirections => [
		'Sot',
		'Correcte',
		'Fons',
		'Esquerra',
	];
	@override String get systemLanguage => 'Automàtic';
	@override String get resyncEverything => 'Resincronitza tot';
	@override String get openDataDir => 'Obre la carpeta Saber';
	@override String get autosaveDisabled => 'Né jamais';
	@override String get shapeRecognitionDisabled => 'Né jamais';
}

// Path: logs
class _Translations$logs$ca extends Translations$logs$en {
	_Translations$logs$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Registres';
	@override String get viewLogs => 'Visualitza diaris';
	@override String get debuggingInfo => 'Els logs contenen informació útil per depurar i desenvolupar';
	@override String get noLogs => 'No hi ha aquí!';
	@override String get useTheApp => 'Els logs apareixeran aquí mentre utilitzes l\'aplicació';
}

// Path: login
class _Translations$login$ca extends Translations$login$en {
	_Translations$login$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override late final _Translations$login$form$ca form = _Translations$login$form$ca._(_root);
	@override late final _Translations$login$status$ca status = _Translations$login$status$ca._(_root);
	@override late final _Translations$login$ncLoginStep$ca ncLoginStep = _Translations$login$ncLoginStep$ca._(_root);
	@override late final _Translations$login$encLoginStep$ca encLoginStep = _Translations$login$encLoginStep$ca._(_root);
	@override String get title => 'Inloguin';
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'No tens aún? '),
		linkToSignup('Registra\'t-te ara'),
		const TextSpan(text: '.'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'No tu? '),
		undoLogin('Elegir otra cuenta'),
		const TextSpan(text: '.'),
	]);
}

// Path: profile
class _Translations$profile$ca extends Translations$profile$en {
	_Translations$profile$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override late final _Translations$profile$quickLinks$ca quickLinks = _Translations$profile$quickLinks$ca._(_root);
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$ca._(_root),
	];
	@override String get title => 'El meu perfil';
	@override String get logout => 'Desconnectar';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Estàs utilitzant ${used} de ${total} (${percent}%)';
	@override String get connectedTo => 'Connectat a';
	@override String get faqTitle => 'Preguntes freqüents';
}

// Path: appInfo
class _Translations$appInfo$ca extends Translations$appInfo$en {
	_Translations$appInfo$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nAquest programa no compta amb cap garantia. És programari lliure, i estàs en el teu dret de distribuir-ho sota certes condicions.';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Prem aquí per a mostrar-me el teu suport o ampliar l\'emmagatzematge';
	@override String get licenseButton => 'Prem aquí per a més informació sobre la llicència';
	@override String get privacyPolicyButton => 'Prem aquí per a consultar la política de privacitat';
}

// Path: update
class _Translations$update$ca extends Translations$update$en {
	_Translations$update$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Actualització disponible';
	@override String get updateAvailableDescription => 'Ja hi ha disponible una nova versió de l\'aplicació:';
	@override String get update => 'Actualitzar';
	@override String get downloadNotAvailableYet => 'Per a la teva plataforma, la descàrrega encara no està disponible.\nSiusplau, torna a intentar-ho més endavant.';
}

// Path: editor
class _Translations$editor$ca extends Translations$editor$en {
	_Translations$editor$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$ca toolbar = _Translations$editor$toolbar$ca._(_root);
	@override late final _Translations$editor$pens$ca pens = _Translations$editor$pens$ca._(_root);
	@override late final _Translations$editor$penOptions$ca penOptions = _Translations$editor$penOptions$ca._(_root);
	@override late final _Translations$editor$colors$ca colors = _Translations$editor$colors$ca._(_root);
	@override late final _Translations$editor$imageOptions$ca imageOptions = _Translations$editor$imageOptions$ca._(_root);
	@override late final _Translations$editor$selectionBar$ca selectionBar = _Translations$editor$selectionBar$ca._(_root);
	@override late final _Translations$editor$menu$ca menu = _Translations$editor$menu$ca._(_root);
	@override late final _Translations$editor$readOnlyBanner$ca readOnlyBanner = _Translations$editor$readOnlyBanner$ca._(_root);
	@override late final _Translations$editor$versionTooNew$ca versionTooNew = _Translations$editor$versionTooNew$ca._(_root);
	@override late final _Translations$editor$quill$ca quill = _Translations$editor$quill$ca._(_root);
	@override late final _Translations$editor$hud$ca hud = _Translations$editor$hud$ca._(_root);
	@override String get pages => 'Folis';
	@override String get untitled => 'Sense títol';
	@override String get needsToSaveBeforeExiting => 'Desant canvis... pots tancar l\'editor quan finalitzi el procés';
}

// Path: home.tabs
class _Translations$home$tabs$ca extends Translations$home$tabs$en {
	_Translations$home$tabs$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get home => 'Inici';
	@override String get browse => 'Cerca';
	@override String get whiteboard => 'Document en Blanc';
	@override String get settings => 'Configuració';
}

// Path: home.titles
class _Translations$home$titles$ca extends Translations$home$titles$en {
	_Translations$home$titles$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get home => 'Notes recents';
	@override String get browse => 'Cerca';
	@override String get whiteboard => 'Folis en Blanc';
	@override String get settings => 'Paràmetres';
}

// Path: home.tooltips
class _Translations$home$tooltips$ca extends Translations$home$tooltips$en {
	_Translations$home$tooltips$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nova nota';
	@override String get exportNote => 'Exportar nota';
	@override String get showUpdateDialog => 'Mostrar diàlog de actualització';
}

// Path: home.create
class _Translations$home$create$ca extends Translations$home$create$en {
	_Translations$home$create$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nota Nova';
	@override String get importNote => 'Importar nota';
}

// Path: home.newFolder
class _Translations$home$newFolder$ca extends Translations$home$newFolder$en {
	_Translations$home$newFolder$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Carpeta Nova';
	@override String get folderName => 'Nom de Carpeta';
	@override String get create => 'Crear';
	@override String get folderNameEmpty => 'El "nom de carpeta" no pot ser inexistent';
	@override String get folderNameContainsSlash => 'El nom de carpeta no pot contenir cap barra (/)';
	@override String get folderNameExists => 'Carpeta ja existent';
}

// Path: home.renameNote
class _Translations$home$renameNote$ca extends Translations$home$renameNote$en {
	_Translations$home$renameNote$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Reanomenar nota';
	@override String get noteName => 'Nom de nota';
	@override String get rename => 'Reanomenar';
	@override String get noteNameEmpty => 'El nom de nota no pot romandre buit';
	@override String get noteNameExists => 'Ja existeix una nota amb aquest nom';
	@override String get noteNameForbiddenCharacters => 'El nom de la nota conté símbols no vàlids';
	@override String get noteNameReserved => 'Nom de nota reservat';
}

// Path: home.moveNote
class _Translations$home$moveNote$ca extends Translations$home$moveNote$en {
	_Translations$home$moveNote$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Moure nota';
	@override String moveNotes({required Object n}) => 'Moure ${n} notes';
	@override String moveName({required Object f}) => 'Mou ${f}';
	@override String get move => 'Moure';
	@override String renamedTo({required Object newName}) => 'La nota serà renombrada com a ${newName}';
	@override String get multipleRenamedTo => 'Les següents notes seràn reanomenades:';
	@override String numberRenamedTo({required Object n}) => '${n} notes seran reanomenades per evitar conflictes';
}

// Path: home.deleteNoteDialog
class _Translations$home$deleteNoteDialog$ca extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ca'))(n,
		one: 'Eliminar permanentment la nota seleccionada?',
		other: 'Eliminar permanentment les notes seleccionades?',
	);
	@override String deleteNotes({required Object n}) => 'Borrar ${n} notes';
	@override String deleteName({required Object f}) => 'Borrar ${f}';
	@override String get delete => 'Borrar';
}

// Path: home.renameFolder
class _Translations$home$renameFolder$ca extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Reanomenar carpeta';
	@override String get folderName => 'Nom de carpeta';
	@override String get rename => 'Reanomena';
	@override String get folderNameEmpty => 'El nom de carpeta no pot romandre buit';
	@override String get folderNameContainsSlash => 'El nom de carpeta no pot contenir cap barra (/)';
	@override String get folderNameExists => 'Ja existeix una carpeta amb aquest nom';
}

// Path: home.deleteFolder
class _Translations$home$deleteFolder$ca extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Esborra carpeta';
	@override String deleteName({required Object f}) => 'Esborra ${f}';
	@override String get delete => 'Esborra';
	@override String get alsoDeleteContents => 'Esborra totes les notes d\'aquesta carpeta';
}

// Path: sentry.consent
class _Translations$sentry$consent$ca extends Translations$sentry$consent$en {
	_Translations$sentry$consent$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Vols ajudar a millorar Saber?';
	@override late final _Translations$sentry$consent$description$ca description = _Translations$sentry$consent$description$ca._(_root);
	@override late final _Translations$sentry$consent$answers$ca answers = _Translations$sentry$consent$answers$ca._(_root);
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$ca extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get general => 'General';
	@override String get writing => 'Escriptura';
	@override String get editor => 'Editor';
	@override String get performance => 'Performance';
	@override String get advanced => 'Avançat';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$ca extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Llengua';
	@override String get layoutSize => 'Format';
	@override String get shouldCheckForUpdates => 'Comprova si hi ha actualitzacions disponibles per Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Actualitzacions més ràpides';
	@override String get allowInsecureConnections => 'Permet connexions no segures';
	@override String get appTheme => 'tema de l\'aplicació';
	@override String get platform => 'tipus de teme';
	@override String get customAccentColor => 'Color d\'accent personnalisée';
	@override String get hyperlegibleFont => 'font Atkinson Hyperlegible';
	@override String get editorToolbarAlignment => 'posició de la barra d\'herrament';
	@override String get editorToolbarShowInFullscreen => 'Mostra la barra degli strumenti in modalità schermo intero';
	@override String get editorAutoInvert => 'Inverter notes en mode obscur';
	@override String get preferGreyscale => 'Preferir colors en escala de grises';
	@override String get maxImageSize => 'Màxim mida de imatge';
	@override String get autoClearWhiteboardOnExit => 'Borrar automàticament la llista blanca';
	@override String get disableEraserAfterUse => 'Desactivar automáticamente el borrador';
	@override String get hideFingerDrawingToggle => 'Ocultar el interruptor de dibujo con el dedo';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Desactivar el dibujo con el dedo automáticamente';
	@override String get editorPromptRename => 'Prompt per a tu perrener les noves notes';
	@override String get recentColorsDontSavePresets => 'No guardar colores preestablecidos en colores recientes';
	@override String get recentColorsLength => 'Quines de color recents a almacenar';
	@override String get printPageIndicators => 'Imprime indicadors de pàgina';
	@override String get autosave => 'Auto-guardat';
	@override String get shapeRecognitionDelay => 'Retard de reconnaissance de forme';
	@override String get autoStraightenLines => 'Rectificar líneas automáticamente';
	@override String get simplifiedHomeLayout => 'Disposició simplificada de la casa';
	@override String get customDataDir => 'Pàrador custom Saber';
	@override String get sentry => 'Informar errores';
}

// Path: settings.prefDescriptions
class _Translations$settings$prefDescriptions$ca extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$ca hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$ca._(_root);
	@override late final _Translations$settings$prefDescriptions$sentry$ca sentry = _Translations$settings$prefDescriptions$sentry$ca._(_root);
	@override String get hyperlegibleFont => 'Increxeix la legibilitat per als usuaris amb baixa visió';
	@override String get allowInsecureConnections => '(No recomanhat) Permitir a Saber conectar a serveis amb certs autogenerades/no fiables';
	@override String get preferGreyscale => 'Per a dispositius e-ink';
	@override String get autoClearWhiteboardOnExit => 'Borra la llista blanca després de sortir de l\'aplicació';
	@override String get disableEraserAfterUse => 'Automàticament torna al bolífer després de utilitzar l\'efaçador';
	@override String get maxImageSize => 'Les images plus grandes seront compressées';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Desactiva el dibujo con el dedo cuando se detecta un lápiz óptico';
	@override String get editorPromptRename => 'Pots sempre poti rinominare le note in seguito';
	@override String get printPageIndicators => 'Mostra indicadors de pàgina en exports';
	@override String get autosave => 'Auto-guardat després d\'un retard curt, o mai';
	@override String get shapeRecognitionDelay => 'Quetre freqüentament actualitzar la previsualització de la forma';
	@override String get autoStraightenLines => 'Rectifica les línies llonges sense avoir a utilitzar el rotuli de forma';
	@override String get simplifiedHomeLayout => 'Establir una altura fija para cada vista previa de nota';
	@override String get shouldAlwaysAlertForUpdates => 'Diga-me sobre as atualizações assim que estiverem disponíveis';
}

// Path: settings.themeModes
class _Translations$settings$themeModes$ca extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get light => 'Llum';
	@override String get dark => 'Oscur';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$ca extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Automàtic';
	@override String get phone => 'Telèfon';
	@override String get tablet => 'Tableta';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$ca extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Escoig un color';
}

// Path: settings.reset
class _Translations$settings$reset$ca extends Translations$settings$reset$en {
	_Translations$settings$reset$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Restaurar aquesta configuració?';
	@override String get button => 'Restaurar';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$ca extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Cancelar';
	@override String get select => 'Seleccionar';
	@override String get mustBeEmpty => 'La carpeta seleccionada debe estar vacía';
	@override String get mustBeDoneSyncing => 'Asegúrate de que la sincronización esté completa antes de cambiar la carpeta';
	@override String get unsupported => 'Aquesta funcició és actualment només per desenvolupadors. L\'ús d\'ella pot resultar en pèrdua de dades.';
}

// Path: login.form
class _Translations$login$form$ca extends Translations$login$form$en {
	_Translations$login$form$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Al iniciar sesión, aceptas la '),
		linkToPrivacyPolicy('Política de privacidad'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _Translations$login$status$ca extends Translations$login$status$en {
	_Translations$login$status$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Desconnectat';
	@override String get tapToLogin => 'Toca per iniciar la sessió amb Nextcloud';
	@override String hi({required Object u}) => 'Hola, ${u}!';
	@override String get almostDone => 'Pràcticament preparat per a sincronització, toca per finalitzar la connexió';
	@override String get loggedIn => 'Ingessat amb Nextcloud';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$ca extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override late final _Translations$login$ncLoginStep$loginFlow$ca loginFlow = _Translations$login$ncLoginStep$loginFlow$ca._(_root);
	@override String get whereToStoreData => 'Escollreu on où voleu guardar els teus dades:';
	@override String get saberNcServer => 'Serveur Nextcloud de Saber';
	@override String get otherNcServer => 'Un servidor Nextcloud';
	@override String get serverUrl => 'URL del servidor';
	@override String get loginWithSaber => 'Inglesar amb Saber';
	@override String get loginWithNextcloud => 'Inglesar amb Nextcloud';
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$ca extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$ca._(_root),
		_Translations$login$encLoginStep$encFaq$1$ca._(_root),
		_Translations$login$encLoginStep$encFaq$2$ca._(_root),
	];
	@override String get enterEncPassword => 'Per protegere i tuoi dati, inserisci la tua password di crittografia:';
	@override String get newToSaber => 'Nou en Saber? Simplement ingresa una nova contrasenya de cifratura.';
	@override String get encPassword => 'contraseña de cifrado';
	@override String get encFaqTitle => 'Preguntes freqüents';
	@override String get wrongEncPassword => 'Descodificació fallada amb la contrasenya proporcionada. Si us plau, intenteu introduir-la de nou.';
	@override String get connectionFailed => 'Vaixament va tenir lloc connectar-se al servidor. Si us plau, intenteu de nou més tard.';
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$ca extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'pàgina d\'accés del servidor';
	@override String get deleteAccount => 'Borrar compte';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$ca extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get q => 'Trobaré si perdré les mes notes si je me déconnecte ?';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$ca extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get select => 'Seleccionar';
	@override String get photo => 'Imatge';
	@override String get text => 'Text';
	@override String get undo => 'Desfer';
	@override String get redo => 'Refer';
	@override String get export => 'exportar';
	@override String get exportAs => 'Exportar com a:';
	@override String get toggleColors => 'Alternar colors (Ctrl C)';
	@override String get toggleEraser => 'Alternar borrador (Ctrl E)';
	@override String get toggleFingerDrawing => 'Alternar dibuix amb el dita (Ctrl F)';
	@override String get fullscreen => 'Alternar pantalla completa (F11)';
}

// Path: editor.pens
class _Translations$editor$pens$ca extends Translations$editor$pens$en {
	_Translations$editor$pens$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get highlighter => 'Marcador';
	@override String get pencil => 'Llapis';
	@override String get fountainPen => 'Pluma estilográfica';
	@override String get ballpointPen => 'pluma';
	@override String get shapePen => 'bol de forma';
	@override String get laserPointer => 'Punter laser';
}

// Path: editor.penOptions
class _Translations$editor$penOptions$ca extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get size => 'Mida';
}

// Path: editor.colors
class _Translations$editor$colors$ca extends Translations$editor$colors$en {
	_Translations$editor$colors$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Selector de color';
	@override String get dark => 'Fosc';
	@override String get light => 'Clar';
	@override String get black => 'Negre';
	@override String get darkGrey => 'Gris fosc';
	@override String get grey => 'Gris';
	@override String get lightGrey => 'Gris Clar';
	@override String get white => 'Blanc';
	@override String get red => 'Vermell';
	@override String get green => 'Verd';
	@override String get cyan => 'Cian';
	@override String get blue => 'Blau';
	@override String get yellow => 'Groc';
	@override String get purple => 'Porpra';
	@override String get pink => 'Rosa';
	@override String get orange => 'Taronja';
	@override String get pastelRed => 'Vermell Pastel';
	@override String get pastelPink => 'Rosa Pastel';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Custom ${b} ${h}';
	@override String customHue({required Object h}) => 'Custom ${h}';
	@override String get pastelOrange => 'aranja pastel';
	@override String get pastelYellow => 'amarillo pastel';
	@override String get pastelGreen => 'verde pastel';
	@override String get pastelCyan => 'cian pastel';
	@override String get pastelBlue => 'blau marí';
	@override String get pastelPurple => 'lavanda pastel';
}

// Path: editor.imageOptions
class _Translations$editor$imageOptions$ca extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opcions d\'imatge';
	@override String get download => 'Descarregar';
	@override String get setAsBackground => 'Usa-ho com a fons';
	@override String get removeAsBackground => 'Elimina-ho com a fons';
	@override String get delete => 'Esborra';
	@override String get invertible => 'Invertible';
}

// Path: editor.selectionBar
class _Translations$editor$selectionBar$ca extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Esborra';
	@override String get duplicate => 'Duplica';
}

// Path: editor.menu
class _Translations$editor$menu$ca extends Translations$editor$menu$en {
	_Translations$editor$menu$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get clearAllPages => 'Neteja tots els folis';
	@override String get duplicatePage => 'Duplicar foli';
	@override String get deletePage => 'Esborra foli';
	@override String get lineThickness => 'Gruix de la línia';
	@override String get lineThicknessDescription => 'Gruix de la línia del fons';
	@override String get backgroundPattern => 'Patró de fons';
	@override String get import => 'Importa';
	@override String get watchServer => 'Cerca actualitzacions disponibles al servidor';
	@override late final _Translations$editor$menu$boxFits$ca boxFits = _Translations$editor$menu$boxFits$ca._(_root);
	@override late final _Translations$editor$menu$bgPatterns$ca bgPatterns = _Translations$editor$menu$bgPatterns$ca._(_root);
	@override String clearPage({required Object page, required Object totalPages}) => 'Borrar pàgina ${page}/${totalPages}';
	@override String get insertPage => 'Insertar pàgina sota';
	@override String get lineHeight => 'altura de línea';
	@override String get lineHeightDescription => 'També controla el màxim de text per a les notes tapates.';
	@override String get backgroundImageFit => 'imatge de fons ajustat';
	@override String get watchServerReadOnly => 'L\'edició està desactivada mentre siva el servidor';
}

// Path: editor.readOnlyBanner
class _Translations$editor$readOnlyBanner$ca extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mode de Lectura';
	@override String get watchingServer => 'Actualmente se están buscando actualizaciones en el servidor. La edición está deshabilitada en este modo.';
	@override String get corrupted => 'Fallida la descàrre de la nota. Podria estar corrompuda o encara en descàrre.';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$ca extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aquesta nota va ser editada des d\'una versió més recent de Saber';
	@override String get allowEditing => 'Habilitar edició';
	@override String get subtitle => 'L\'édition de cette note peut entraîner la perte d\'informations. Voulez-vous ignorer cela et éditer quand même ?';
}

// Path: editor.quill
class _Translations$editor$quill$ca extends Translations$editor$quill$en {
	_Translations$editor$quill$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Escriu alguna cosa aquí...';
}

// Path: editor.hud
class _Translations$editor$hud$ca extends Translations$editor$hud$en {
	_Translations$editor$hud$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Desbloquejar Zoom';
	@override String get lockZoom => 'Fixar zoom';
	@override String get lockAxisAlignedPan => 'Fixar desplaçament com a horitzontal o vertical';
	@override String get unlockSingleFingerPan => 'Activar el paneo con un dedo';
	@override String get lockSingleFingerPan => 'Desactiva el paneo con un dedo';
	@override String get unlockAxisAlignedPan => 'Desbloquea el paneo a horizontal o vertical';
}

// Path: sentry.consent.description
class _Translations$sentry$consent$description$ca extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get currentlyOff => 'Si acceptes, els informes d\'errors s\'activaran un cop reiniciada l\'app';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Més informació a '),
		link('privacy policy'),
		const TextSpan(text: '.'),
	]);
	@override String get question => 'T\'agria que raporti errors inesperades mà automaticament? Això m\'ajuda a identificar i a classar problemes més ràpid.';
	@override String get scope => 'Els informes podem contenir informació sobre l\'error i el teu dispositiu. He fet cada esforç per filtrar els dades personals, però algunes poden quedar.';
	@override String get currentlyOn => 'Si revoca el consentimiento, por favor reinicia la aplicación para deshabilitar la notificación de errores.';
}

// Path: sentry.consent.answers
class _Translations$sentry$consent$answers$ca extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Sí';
	@override String get no => 'No';
	@override String get later => 'Demana-m\'ho en un altre moment';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$ca extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Prevén el cambio accidental';
	@override String get fixedOn => 'El dibujado del dedo está fijado como habilitado';
	@override String get fixedOff => 'El dibujado del dedo está fijado como deshabilitado';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$ca extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get active => 'Actiu';
	@override String get inactive => 'Inactiu';
	@override String get activeUntilRestart => 'Actiu fins a que reinicies l\'aplicació';
	@override String get inactiveUntilRestart => 'Inactiu fins que reinicies l\'aplicació';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$ca extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Permeta a Saber accedir a la teva compte de Nextcloud';
	@override String get followPrompts => 'Si us plauseguda les instruccions a l\'interfície de Nextcloud';
	@override String get browserDidntOpen => 'La pàgina de connexió no s\'ha obert? Clic aquí';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$ca extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get q => 'Què és una contrasenya de cifratge? Per què utilitzar dues contrasenyes?';
	@override String get a => 'La contrasenya de Nextcloud es la que se utiliza para acceder a la nube. La contrasenya de cifrado "scrambles" tus datos antes de que lleguen a la nube.\nIncluso si alguien obtiene acceso a tu cuenta de Nextcloud, tus notas seguirán a salvo y cifradas con una contraseña separada. Esto te proporciona una segunda capa de seguridad para proteger tus datos.\nNadie puede acceder a tus notas en el servidor sin tu contraseña de cifrado, pero esto también significa que si olvidas tu contraseña de cifrado, perderás el acceso a tus datos.';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$ca extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get q => 'No he menet altrepass de cifratge fins ara. On l\'obtenc?';
	@override String get a => 'Escoll un nou contrasen de cifratge i introduïu-lo a la sota.\nSaber generarà les teves clau de cifratge automàticament a partir d\'aquest contrasen.';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$ca extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get q => 'Pucso el mate de la teva compte de Nextcloud?';
	@override String get a => 'Sí, pero ten en cuenta que sería más fácil para el administrador del servidor o alguien más acceder a tus notas si obtienen acceso a tu cuenta de Nextcloud.';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$ca extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Estirar';
	@override String get cover => 'Tapa';
	@override String get contain => 'Conténhir';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$ca extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$ca._(TranslationsCa root) : this._root = root, super.internal(root);

	final TranslationsCa _root; // ignore: unused_field

	// Translations
	@override String get grid => 'Graella';
	@override String get dots => 'Punts';
	@override String get none => 'Blanc';
	@override String get college => 'regla de college';
	@override String get collegeRtl => 'Regla de colegio (Inversa)';
	@override String get lined => 'Línea';
	@override String get staffs => 'Personal</td>';
	@override String get tablature => 'Tablatura';
	@override String get cornell => 'Cornell';
}
