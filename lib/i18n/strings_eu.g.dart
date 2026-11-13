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
class TranslationsEu extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.eu,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <eu>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	late final TranslationsEu _root = this; // ignore: unused_field

	@override 
	TranslationsEu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEu(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$eu common = _Translations$common$eu._(_root);
	@override late final _Translations$home$eu home = _Translations$home$eu._(_root);
	@override late final _Translations$sentry$eu sentry = _Translations$sentry$eu._(_root);
	@override late final _Translations$settings$eu settings = _Translations$settings$eu._(_root);
	@override late final _Translations$logs$eu logs = _Translations$logs$eu._(_root);
	@override late final _Translations$login$eu login = _Translations$login$eu._(_root);
	@override late final _Translations$profile$eu profile = _Translations$profile$eu._(_root);
	@override late final _Translations$appInfo$eu appInfo = _Translations$appInfo$eu._(_root);
	@override late final _Translations$update$eu update = _Translations$update$eu._(_root);
	@override late final _Translations$editor$eu editor = _Translations$editor$eu._(_root);
}

// Path: common
class _Translations$common$eu extends Translations$common$en {
	_Translations$common$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get done => 'Egina';
	@override String get continueBtn => 'Jarraitu';
	@override String get cancel => 'Ezeztatu';
}

// Path: home
class _Translations$home$eu extends Translations$home$en {
	_Translations$home$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$eu tabs = _Translations$home$tabs$eu._(_root);
	@override late final _Translations$home$titles$eu titles = _Translations$home$titles$eu._(_root);
	@override late final _Translations$home$tooltips$eu tooltips = _Translations$home$tooltips$eu._(_root);
	@override late final _Translations$home$create$eu create = _Translations$home$create$eu._(_root);
	@override late final _Translations$home$newFolder$eu newFolder = _Translations$home$newFolder$eu._(_root);
	@override late final _Translations$home$renameNote$eu renameNote = _Translations$home$renameNote$eu._(_root);
	@override late final _Translations$home$moveNote$eu moveNote = _Translations$home$moveNote$eu._(_root);
	@override late final _Translations$home$deleteNoteDialog$eu deleteNoteDialog = _Translations$home$deleteNoteDialog$eu._(_root);
	@override late final _Translations$home$renameFolder$eu renameFolder = _Translations$home$renameFolder$eu._(_root);
	@override late final _Translations$home$deleteFolder$eu deleteFolder = _Translations$home$deleteFolder$eu._(_root);
	@override late final _Translations$home$sort$eu sort = _Translations$home$sort$eu._(_root);
	@override late final _Translations$home$layout$eu layout = _Translations$home$layout$eu._(_root);
	@override String get welcome => 'Saberera aurrera';
	@override String get invalidFormat => 'Hiru datu gaineko fitxategia ez da adierazten. Mesedez, sbn, sbn2, sba edo pdf fitxategia aukeratu.';
	@override String get noFiles => 'Ez da fitxategiak aurkitako';
	@override String get noPreviewAvailable => 'Ikusi aurreikuntza ez dago';
	@override String get createNewNote => 'Aurkitu + gizuaren butonak sortzeko testua berria.';
	@override String get backFolder => 'Itzarera itzule';
	@override String get deleteNote => 'Ez daiteke nota ez.';
}

// Path: sentry
class _Translations$sentry$eu extends Translations$sentry$en {
	_Translations$sentry$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$eu consent = _Translations$sentry$consent$eu._(_root);
}

// Path: settings
class _Translations$settings$eu extends Translations$settings$en {
	_Translations$settings$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$eu prefCategories = _Translations$settings$prefCategories$eu._(_root);
	@override late final _Translations$settings$prefLabels$eu prefLabels = _Translations$settings$prefLabels$eu._(_root);
	@override late final _Translations$settings$prefDescriptions$eu prefDescriptions = _Translations$settings$prefDescriptions$eu._(_root);
	@override late final _Translations$settings$themeModes$eu themeModes = _Translations$settings$themeModes$eu._(_root);
	@override late final _Translations$settings$layoutSizes$eu layoutSizes = _Translations$settings$layoutSizes$eu._(_root);
	@override late final _Translations$settings$accentColorPicker$eu accentColorPicker = _Translations$settings$accentColorPicker$eu._(_root);
	@override late final _Translations$settings$reset$eu reset = _Translations$settings$reset$eu._(_root);
	@override late final _Translations$settings$customDataDir$eu customDataDir = _Translations$settings$customDataDir$eu._(_root);
	@override String get systemLanguage => 'Autodi';
	@override String get resyncEverything => 'Berazagar dena berriro sinkronizatzen.';
	@override String get openDataDir => 'Saber gehiak jorri';
	@override String get autosaveDisabled => 'Ez hamnago';
	@override String get shapeRecognitionDisabled => 'Ez bereiz';
	@override List<String> get axisDirections => [
		'Azpian',
		'Ez daiteke',
		'Azpian',
		'Ezera',
	];
}

// Path: logs
class _Translations$logs$eu extends Translations$logs$en {
	_Translations$logs$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Eregistroak';
	@override String get viewLogs => 'Ikusi gailaketak';
	@override String get debuggingInfo => 'Logak informazio útil bat diot debugatzeko eta aurreratzeko.';
	@override String get noLogs => 'Ez dago lanak ez dira ikusten!';
	@override String get useTheApp => 'Logak hara itzarriko dira aplikazioa erabiltzen duzunean.';
}

// Path: login
class _Translations$login$eu extends Translations$login$en {
	_Translations$login$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$login$form$eu form = _Translations$login$form$eu._(_root);
	@override late final _Translations$login$status$eu status = _Translations$login$status$eu._(_root);
	@override late final _Translations$login$ncLoginStep$eu ncLoginStep = _Translations$login$ncLoginStep$eu._(_root);
	@override late final _Translations$login$encLoginStep$eu encLoginStep = _Translations$login$encLoginStep$eu._(_root);
	@override String get title => 'Sartu';
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Ez duiko barketarekin, '),
		linkToSignup('Hitzaro daite'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'Ez ez daude? '),
		undoLogin('Zergar bat aukera egin'),
		const TextSpan(text: '.'),
	]);
}

// Path: profile
class _Translations$profile$eu extends Translations$profile$en {
	_Translations$profile$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$profile$quickLinks$eu quickLinks = _Translations$profile$quickLinks$eu._(_root);
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$eu._(_root),
		_Translations$profile$faq$1$eu._(_root),
		_Translations$profile$faq$2$eu._(_root),
		_Translations$profile$faq$3$eu._(_root),
	];
	@override String get title => 'Nire perfilak';
	@override String get logout => 'Irera sartzea';
	@override String quotaUsageUncapped({required Object used}) => '${used} erabiltzen ari zara';
	@override String get connectedTo => 'Harreagutua';
	@override String get faqTitle => 'Auztatu behartzen dituzten galdetak';
	@override String quotaUsage({required Object total, required Object percent, required Object used}) => '${total} (${percent}%) erabilatzen ari zara ${used}-a';
}

// Path: appInfo
class _Translations$appInfo$eu extends Translations$appInfo$en {
	_Translations$appInfo$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber Copyright © 2022-${buildYear} Adil Hanney\nProgram hau gabe ez du garantia betea. Software argintza da eta kondizio zehatzak emandenez berratu dezake.';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Hona aprekatzen utesi edo gordeta gehiago erosi';
	@override String get licenseButton => 'Hiru honetan klikatu erakunde informazio gehiago ikusteko';
	@override String get privacyPolicyButton => 'Hiru honetan klikatu eta ikusu gizurtasun politizikia.';
}

// Path: update
class _Translations$update$eu extends Translations$update$en {
	_Translations$update$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Berria itegiztea';
	@override String get updateAvailableDescription => 'Apparen berri bateko berberata dago:';
	@override String get update => 'Berazpenak eguneratu';
	@override String get downloadNotAvailableYet => 'Deskargaketa ez dago beraz zure plataformaari. Mesedez, bitartean itzali.';
}

// Path: editor
class _Translations$editor$eu extends Translations$editor$en {
	_Translations$editor$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$eu toolbar = _Translations$editor$toolbar$eu._(_root);
	@override late final _Translations$editor$pens$eu pens = _Translations$editor$pens$eu._(_root);
	@override late final _Translations$editor$penOptions$eu penOptions = _Translations$editor$penOptions$eu._(_root);
	@override late final _Translations$editor$colors$eu colors = _Translations$editor$colors$eu._(_root);
	@override late final _Translations$editor$imageOptions$eu imageOptions = _Translations$editor$imageOptions$eu._(_root);
	@override late final _Translations$editor$selectionBar$eu selectionBar = _Translations$editor$selectionBar$eu._(_root);
	@override late final _Translations$editor$menu$eu menu = _Translations$editor$menu$eu._(_root);
	@override late final _Translations$editor$photoPdfError$eu photoPdfError = _Translations$editor$photoPdfError$eu._(_root);
	@override late final _Translations$editor$readOnlyBanner$eu readOnlyBanner = _Translations$editor$readOnlyBanner$eu._(_root);
	@override late final _Translations$editor$versionTooNew$eu versionTooNew = _Translations$editor$versionTooNew$eu._(_root);
	@override late final _Translations$editor$quill$eu quill = _Translations$editor$quill$eu._(_root);
	@override late final _Translations$editor$hud$eu hud = _Translations$editor$hud$eu._(_root);
	@override String get pages => 'Orriak';
	@override String get untitled => 'Deskribatuta ez dagoena';
	@override String get needsToSaveBeforeExiting => 'Aldagai gaurtizten dituz... editoreare txertatu daiteko, gero amaituta dagoenean';
}

// Path: home.tabs
class _Translations$home$tabs$eu extends Translations$home$tabs$en {
	_Translations$home$tabs$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get home => 'Eroslana';
	@override String get browse => 'Sartu';
	@override String get whiteboard => 'Tablero zenbatzaileak';
	@override String get settings => 'Itazkiak';
}

// Path: home.titles
class _Translations$home$titles$eu extends Translations$home$titles$en {
	_Translations$home$titles$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get home => 'Oharrak berriak';
	@override String get browse => 'Sartu';
	@override String get whiteboard => 'Tablero';
	@override String get settings => 'Itazkiak';
}

// Path: home.tooltips
class _Translations$home$tooltips$eu extends Translations$home$tooltips$en {
	_Translations$home$tooltips$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nota berria';
	@override String get showUpdateDialog => 'Egoztu itzaleak';
	@override String get exportNote => 'Nota exportatzea';
}

// Path: home.create
class _Translations$home$create$eu extends Translations$home$create$en {
	_Translations$home$create$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nota berria';
	@override String get importNote => 'Nota importuaz';
}

// Path: home.newFolder
class _Translations$home$newFolder$eu extends Translations$home$newFolder$en {
	_Translations$home$newFolder$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Ordain berria';
	@override String get folderName => 'Ordainaren izena';
	@override String get create => 'Sartu';
	@override String get folderNameEmpty => 'Zerrenen izena ez da hutsikete bete ditzake.';
	@override String get folderNameContainsSlash => 'Karpenaren izenari / (slash) ez da otean.';
	@override String get folderNameExists => 'Zer daile dagoela folderak aurreikusten?';
}

// Path: home.renameNote
class _Translations$home$renameNote$eu extends Translations$home$renameNote$en {
	_Translations$home$renameNote$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Nota berriztea';
	@override String get noteName => 'Ondariaren izena';
	@override String get rename => 'Izena aldatu';
	@override String get noteNameEmpty => 'Ondariaren izena ez da bete ditzakeko.';
	@override String get noteNameExists => 'Eskualdapen honearekin dagoela nota beste bat daude';
	@override String get noteNameForbiddenCharacters => 'Ondariaren izenarengan karakterez nahikoak daude';
	@override String get noteNameReserved => 'Ondariena izatea erreserbatua da';
}

// Path: home.moveNote
class _Translations$home$moveNote$eu extends Translations$home$moveNote$en {
	_Translations$home$moveNote$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Mota mugatu';
	@override String moveNotes({required Object n}) => 'Mover ${n} notaak';
	@override String moveName({required Object f}) => 'Movera ${f}';
	@override String get move => 'Ugaldatu';
	@override String renamedTo({required Object newName}) => 'Nota honen izena ${newName} dela izango da';
	@override String get multipleRenamedTo => 'Azkoak honako hauek ez dira berrabiztea:';
	@override String numberRenamedTo({required Object n}) => '${n} notaak ez dira nahiztasun bat eraguteko berrabiztea.';
}

// Path: home.deleteNoteDialog
class _Translations$home$deleteNoteDialog$eu extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('eu'))(n,
		one: 'Suhestitua nota ez duela?',
		other: 'Ez duitate adierazten dituen notaak ezagutzeko?',
	);
	@override String deleteNotes({required Object n}) => 'Suahili nota ${n} ezazu';
	@override String deleteName({required Object f}) => 'Suplegia ${f}\$';
	@override String get delete => 'Suplegia';
}

// Path: home.renameFolder
class _Translations$home$renameFolder$eu extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Aldatzeko karpetua';
	@override String get folderName => 'Ordainaren izena';
	@override String get rename => 'Izena aldatu';
	@override String get folderNameEmpty => 'Sarkuntzaren izena ez da bete';
	@override String get folderNameContainsSlash => 'Karpenaren izenari / (slash) ez da otegarria';
	@override String get folderNameExists => 'Ez dago hiru datu horretan, baina hau da euskara baten nahiko tradizioa:\n\n"Folder honek ez du existitzen." (Hau eragiki bat da eta adierazten du "folder honek ez du aurreikusten").\n\nBeste aukera nagusiak hauek dira, kontextuaren arabera:\n\n*   **Egoera tekniko edo programazioa:** "Folder hau dagoelako." (Hau erudiago da).\n*   **Zuzena eta laburpena:** "Dizain honek aurreikusten."';
}

// Path: home.deleteFolder
class _Translations$home$deleteFolder$eu extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Suahili karnera jorua';
	@override String deleteName({required Object f}) => 'Suplegia ${f}\$';
	@override String get delete => 'Suplegia';
	@override String get alsoDeleteContents => 'Gainberdiko guztietako nota guztiak ez duplikatu.';
}

// Path: home.sort
class _Translations$home$sort$eu extends Translations$home$sort$en {
	_Translations$home$sort$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get sortBy => 'Eskaintza edo ordena zehatzatu';
	@override String get nameAToZ => 'Izena (A-Z)';
	@override String get nameZToA => 'Izena (Z-A)';
	@override String get lastModifiedNewToOld => 'Editatu (Berariazkoak lehenengo)';
	@override String get lastModifiedOldToNew => 'Editatu (Lehenengo datua lehenik)';
}

// Path: home.layout
class _Translations$home$layout$eu extends Translations$home$layout$en {
	_Translations$home$layout$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get layout => 'Diseinu';
	@override String get masonryGrid => 'Sarreko sartzaia';
	@override String get simpleGrid => 'Sarre sinplea';
}

// Path: sentry.consent
class _Translations$sentry$consent$eu extends Translations$sentry$consent$en {
	_Translations$sentry$consent$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$description$eu description = _Translations$sentry$consent$description$eu._(_root);
	@override late final _Translations$sentry$consent$answers$eu answers = _Translations$sentry$consent$answers$eu._(_root);
	@override String get title => 'Lagartza Saber hobetzeko?';
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$eu extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get general => 'Zentral';
	@override String get writing => 'Zazketa';
	@override String get editor => 'Editoreak';
	@override String get performance => 'Aurrezkoak';
	@override String get advanced => 'Aurreratu';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$eu extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Hizkuntza';
	@override String get appTheme => 'Aplikazioaren tema';
	@override String get platform => 'Tema mota';
	@override String get layoutSize => 'Tipolaketa mota';
	@override String get customAccentColor => 'Kolore azpiko kustomizatua';
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible fonta';
	@override String get shouldCheckForUpdates => 'Saber egunerak egiaztatu';
	@override String get shouldAlwaysAlertForUpdates => 'Beriketa azkarrak';
	@override String get allowInsecureConnections => 'Aukeratu koneizio segurtetsizak';
	@override String get editorToolbarAlignment => 'Aurrezkoaren pozizioa';
	@override String get editorToolbarShowInFullscreen => 'Erandua osoan erakusten du';
	@override String get editorAutoInvert => 'Invertizazioak modu eskolduan (dark mode)';
	@override String get preferGreyscale => 'Ezberdina koloreak preferitu egin ditu';
	@override String get maxImageSize => 'Imaxuagaren irizpiritza azkena';
	@override String get autoClearWhiteboardOnExit => 'Zerutsari zuzendu behar du den lehenak (autoclear)\n\n(or, depending on context):\n\nZubidura zehatzatu';
	@override String get disableEraserAfterUse => 'Automatik desaktatu eragileak';
	@override String get hideFingerDrawingToggle => 'Esgarraren marpatzealdia esku eragiteko ezkeroa itzaltzea';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Automatik desagertzea igotzenaren bidez';
	@override String get editorPromptRename => 'Sartu berriak emanzera';
	@override String get recentColorsDontSavePresets => 'Ez garabezen koloreak ez dituzu emandako koloreak emanduko.';
	@override String get recentColorsLength => 'Zenbat kolore berriago ematen dituzu jartze?';
	@override String get printPageIndicators => 'Itsaslepen orokorra eslatu';
	@override String get autosave => 'Autoguardatzea';
	@override String get shapeRecognitionDelay => 'Forma ezagutzearen lagunaldia';
	@override String get autoStraightenLines => 'Automatik lerroak erabilizko lineak zuzentzea';
	@override String get customDataDir => 'Saber-ren karpet personalizatua';
	@override String get sentry => 'Erroldea ematea';
}

// Path: settings.prefDescriptions
class _Translations$settings$prefDescriptions$eu extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$eu hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$eu._(_root);
	@override late final _Translations$settings$prefDescriptions$sentry$eu sentry = _Translations$settings$prefDescriptions$sentry$eu._(_root);
	@override String get hyperlegibleFont => 'Aumentatzen du itxura baxua dituzten erabiltzaileak számára iragantza izugarria.';
	@override String get allowInsecureConnections => '(Ez adierazten) Sabelari sertifikatak berezaintzat/ez konfiantatuenarekin konektatzea ahalbidetzea';
	@override String get preferGreyscale => 'E-ink itzaleaketarako';
	@override String get autoClearWhiteboardOnExit => 'Zerugarrak kentzen ditu aplikazioare itzultzen ondoren';
	@override String get disableEraserAfterUse => 'Automatikoki itzuli bihurtzen den lapizaren eragilean (eraser) erabiltu ondoren';
	@override String get maxImageSize => 'Imago handierrak ez dira komprimatuko';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Desaktatu igotza/zuzentzeko funtzionalitatea stylus bat detektatzean.';
	@override String get editorPromptRename => 'Beste momentuan burutsiak galdeadaz dituzu.';
	@override String get printPageIndicators => 'Egoera zehatzak erakusten dituzte exportetan';
	@override String get autosave => 'Autoguardatzea labur itzalearen ondoren edo ez duela nahole';
	@override String get shapeRecognitionDelay => 'Norrotzen zehar aurreikuspenak zenbaitetan eguneratu?';
	@override String get autoStraightenLines => 'Zergatik ez duzu forma pena erabili beharrik, lortzen ditu lizeak zuzenak.';
	@override String get shouldAlwaysAlertForUpdates => 'Deskribatu zeure buruz eguneratzeak joan dituzten momentuan.';
}

// Path: settings.themeModes
class _Translations$settings$themeModes$eu extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get light => 'Argia';
	@override String get dark => 'Iturri';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$eu extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Autodi';
	@override String get phone => 'Telefono';
	@override String get tablet => 'Tableta';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$eu extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Zerango aukeratu?';
}

// Path: settings.reset
class _Translations$settings$reset$eu extends Translations$settings$reset$en {
	_Translations$settings$reset$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Zerrezten dituen aukerak berestea?';
	@override String get button => 'Berrezta';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$eu extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Ez duzu nahi duen egoera erabili, baina "Cancel" esatearen euskara zehatz bat da **"Guztatu"** edo **"Ez egin"**, kontextuan jarraitzen dependela.\n\nAdibideak:\n\n*   **Hizkuntza ziklo batean:** "Guztatu"\n*   **Prozedura baten aurrean (ez nahi duzu hasi/egite):** "Ez egin" / "Guztatu"\n\nEskualdian, **"Guztatu"** da erabilera nagusia.';
	@override String get select => 'Selektat';
	@override String get mustBeEmpty => 'Zerbadak aukeratua ez du gutxiago nahiz';
	@override String get mustBeDoneSyncing => 'Ez nahasi dugu sinkronizazioa amaituta dagoela antes harriteko gehiago.';
	@override String get unsupported => 'Ezko fitura orain desenvolvedzora ez diori. Erabili, datuen galtzea nahiko da.';
}

// Path: login.form
class _Translations$login$form$eu extends Translations$login$form$en {
	_Translations$login$form$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Sartu pertsonen zehatzpenak eragutzen dituzu '),
		linkToPrivacyPolicy('Gizpionitate Politika'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _Translations$login$status$eu extends Translations$login$status$en {
	_Translations$login$status$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Ingurua itzultuta dago';
	@override String hi({required Object u}) => 'Kaixo, ${u}!';
	@override String get almostDone => 'Sinkronizatzen utzi, saiatu sartzea amaitu.';
	@override String get loggedIn => 'Sartu Nextcloud-arekin';
	@override String get tapToLogin => 'Aurrekontratzeko Nextcloud-arekin klikatu';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$eu extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$login$ncLoginStep$loginFlow$eu loginFlow = _Translations$login$ncLoginStep$loginFlow$eu._(_root);
	@override String get whereToStoreData => 'Zer datuak saite nahi duzu:';
	@override String get saberNcServer => 'Saber-en Nextcloud servera';
	@override String get otherNcServer => 'Bezeroak beste Nextcloud serbereko';
	@override String get serverUrl => 'URL-a serverra';
	@override String get loginWithSaber => 'Saberare sartu';
	@override String get loginWithNextcloud => 'Sartu Nextcloud-arekin';
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$eu extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$eu._(_root),
		_Translations$login$encLoginStep$encFaq$1$eu._(_root),
		_Translations$login$encLoginStep$encFaq$2$eu._(_root),
	];
	@override String get enterEncPassword => 'Datu ez daitez babesteko, mesedez sartu zure szyfratze-lehenizko lehensa:';
	@override String get newToSaber => 'Saber-an berri zara? Saiatu szyfratze pasahit berria.';
	@override String get encPassword => 'Sifraz kriptografikoa';
	@override String get encFaqTitle => 'Auztatu behartzen dituzten galdetak';
	@override String get wrongEncPassword => 'Dekriptazioa ebaldi ez zen eskaintzen pasahitza. Mesedez, berriro saiatu sartzen.';
	@override String get connectionFailed => 'Sobertzen lagundu nahi du serverare konektatzeari. Mesedez, berriro entzun gero.';
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$eu extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Zerbitzuen orrialdeak';
	@override String get deleteAccount => 'Kontua ez du.';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$eu extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Galdera nahikoak gordeko dira iragertzen badira?';
	@override String get a => 'Ez ez da. Sustraietak zure gailuan eta serbikarrean mantentuko dira. Serberare sinkronizatuko dira berriro sartzen utziko arte. Aseguruatu sinkronizazioa uko egin dela antesala sartzen aurteko, ez duzu datozen datu hutsik (aurreko ekranan sinkronizazio-progresua ikusi).';
}

// Path: profile.faq.1
class _Translations$profile$faq$1$eu extends Translations$profile$faq$1$en {
	_Translations$profile$faq$1$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nola alda dezaket nire Nextcloud pasahitza?';
	@override String get a => 'Jo zure serbideraren gertubiko webgunean eta sartu. Bitarik, Azingerak pasahitza aldatuzko ondoren, sartzen eta berriro sartzea behar du.';
}

// Path: profile.faq.2
class _Translations$profile$faq$2$eu extends Translations$profile$faq$2$en {
	_Translations$profile$faq$2$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nola aldatzen dezaket nire szyfruaren adierazpenpasswarten?';
	@override String get a => '0. Aurrekoak sinkronizatuta dagoela ziurtatu (aurrekoak sinkronizazio-progresua etorrizko aurrekoan ikusi).\n1. Saber-etik irten.\n2. Goian duzun serveraren webgunean joan eta \'Saber\' gehiago ez. Horrek serverareko zure nota guztiak ez ditu.\n3. Berriro itzuli Saber-era. Itzulera sartzen zutegun bitartean enkripzio-leheniz berria aukeratu huts.\n4. Beste gailuetan ere, irten eta berriro itzultzea ez ahaztu.';
}

// Path: profile.faq.3
class _Translations$profile$faq$3$eu extends Translations$profile$faq$3$en {
	_Translations$profile$faq$3$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nola esan dezaket kontua ez?';
	@override String get a => 'Ir agertzen duen "${_root.profile.quickLinks.deleteAccount}" botoia aprezatu eta behar baduzu, sartu.\nSaber serbizar ofiziala erabiltzen ari zaren kasuan, kontua unegatze-periobe bat (1 aste) pasatiz ezera da itxiko. Hala esateko, adilhanney@disroot.org berrera kontaktatu dezakezu ez denbora horretan ezabaketa huts egiteko.\nZerrenda bateko serbizar erabiltzen ari zaren kasuan, kontua ezabatzeko aukera ez zaitezke aurkitzea: informazio gehiago eskatzeko serbizarren gizurtasun politikari joratu behar duzu.';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$eu extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Zergailak aldatu (Ctrl C)';
	@override String get select => 'Selektat';
	@override String get toggleEraser => 'Erasearen itzultzaileak (Ctrl E)';
	@override String get photo => 'Imagoak';
	@override String get text => 'Testu';
	@override String get toggleFingerDrawing => 'Zirkatu igotzeko itzultza (Ctrl F)';
	@override String get undo => 'Iturri beranda';
	@override String get redo => 'Berriro egin';
	@override String get export => 'Eportatu (Ctrl Shift S)';
	@override String get exportAs => 'Eportatu gisa:';
	@override String get fullscreen => 'Iturralde osoan itzaltzea (F11)';
}

// Path: editor.pens
class _Translations$editor$pens$eu extends Translations$editor$pens$en {
	_Translations$editor$pens$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Pluma';
	@override String get ballpointPen => 'Bolpenak';
	@override String get highlighter => 'Markadorki';
	@override String get pencil => 'Lápiz';
	@override String get shapePen => 'Penaren forma';
	@override String get laserPointer => 'Luz-igitelea';
}

// Path: editor.penOptions
class _Translations$editor$penOptions$eu extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get size => 'Irudi';
}

// Path: editor.colors
class _Translations$editor$colors$eu extends Translations$editor$colors$en {
	_Translations$editor$colors$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Kolore aukizleari';
	@override String customBrightnessHue({required Object b, required Object h}) => '${b} ${h} ezberdina';
	@override String customHue({required Object h}) => '${h} zehatzeko';
	@override String get dark => 'itberduna';
	@override String get light => 'argi';
	@override String get black => 'Itala';
	@override String get darkGrey => 'Arrakizak izbeak';
	@override String get grey => 'Arrak';
	@override String get lightGrey => 'Arrakizak argia';
	@override String get white => 'Zuri';
	@override String get red => 'Gora';
	@override String get green => 'Berdea';
	@override String get cyan => 'Zian';
	@override String get blue => 'Azul';
	@override String get yellow => 'Gora';
	@override String get purple => 'Azura';
	@override String get pink => 'Rosa';
	@override String get orange => 'Naranja';
	@override String get pastelRed => 'Gora roxo';
	@override String get pastelOrange => 'Naranja pastel';
	@override String get pastelYellow => 'Gialdina pastel';
	@override String get pastelGreen => 'Berde pastel';
	@override String get pastelCyan => 'Azul gaztea pastelak';
	@override String get pastelBlue => 'Azul pastel';
	@override String get pastelPurple => 'Purpura pastel';
	@override String get pastelPink => 'Rosa pastel';
}

// Path: editor.imageOptions
class _Translations$editor$imageOptions$eu extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opzionak azpian';
	@override String get invertible => 'Inbertsiozko';
	@override String get download => 'Deskargatu';
	@override String get setAsBackground => 'Itazkari gisa ezartu';
	@override String get removeAsBackground => 'Fondo gisa ez du.';
	@override String get delete => 'Suplegia';
}

// Path: editor.selectionBar
class _Translations$editor$selectionBar$eu extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Suplegia';
	@override String get duplicate => 'Duplikatu';
}

// Path: editor.menu
class _Translations$editor$menu$eu extends Translations$editor$menu$en {
	_Translations$editor$menu$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$menu$boxFits$eu boxFits = _Translations$editor$menu$boxFits$eu._(_root);
	@override late final _Translations$editor$menu$bgPatterns$eu bgPatterns = _Translations$editor$menu$bgPatterns$eu._(_root);
	@override String clearPage({required Object page, required Object totalPages}) => 'Zerargatu orria ${page}/${totalPages}';
	@override String get clearAllPages => 'Lortu guztien zerbeoa jada ez dago';
	@override String get insertPage => 'Sartu orria zehar';
	@override String get duplicatePage => 'Ordupetuta orria';
	@override String get deletePage => 'Ezdugo orria';
	@override String get lineHeight => 'Aldeus altzaria';
	@override String get lineHeightDescription => 'Azkionakaren iragazpenetarako tamaina ere kontrolatzen du';
	@override String get lineThickness => 'Liniaren albortasuna';
	@override String get lineThicknessDescription => 'Aurrezko lizearen albortasuna';
	@override String get backgroundImageFit => 'Fit imaxua gaineko';
	@override String get backgroundPattern => 'Aurrezko adierazpenaren aurreko adierazpena';
	@override String get import => 'Importatu';
	@override String get watchServer => 'Ikusi serbideraren eguneratzeak';
	@override String get watchServerReadOnly => 'Editak ez dira itxita servera ikusten barne';
}

// Path: editor.photoPdfError
class _Translations$editor$photoPdfError$eu extends Translations$editor$photoPdfError$en {
	_Translations$editor$photoPdfError$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Erro';
	@override String get message => 'PDF arreak ez dira sagarra gehi daitezkeen, horrek ${_root.editor.menu.import} > PDF erabiltzea eskatzen du.';
}

// Path: editor.readOnlyBanner
class _Translations$editor$readOnlyBanner$eu extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Modu iragartzeko';
	@override String get watchingServer => 'Egunera, serbideraren eguneratzeak ikasten ari zara. Modi honetan edita ez da aukira.';
	@override String get corrupted => 'Nota pasatzeko ekailak ez dira. Korruptua daiteke edo berandu ari den.';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$eu extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hiru hau editatu zen, Saberaren berriago bertsio batean.';
	@override String get subtitle => 'Hauko nota honi edita zitza informazio bat gordeta daiteke. Aurreikusten du hau ignoratu eta editu egiaztu?';
	@override String get allowEditing => 'Editatu ematea';
}

// Path: editor.quill
class _Translations$editor$quill$eu extends Translations$editor$quill$en {
	_Translations$editor$quill$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Ezer idazteazu...';
}

// Path: editor.hud
class _Translations$editor$hud$eu extends Translations$editor$hud$en {
	_Translations$editor$hud$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Zoom ireki';
	@override String get lockZoom => 'Zoom lukitzea';
	@override String get unlockSingleFingerPan => 'Ezinbesteko panak aktibatzea';
	@override String get lockSingleFingerPan => 'Desaktatu ir-behereko panaketa';
	@override String get unlockAxisAlignedPan => 'Irekiak goian edo goera/ikurri gehiago egin';
	@override String get lockAxisAlignedPan => 'Itxaldarpenak gohian edo gorriari lotu';
}

// Path: sentry.consent.description
class _Translations$sentry$consent$description$eu extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get question => 'Zerko erroak espero ez dituzte automatikoziarekin aztertu? Horrek laguntzen dizut mujhe problema identifikatu eta soldu azkarago.';
	@override String get scope => 'Raportek erroari eta zure gailuari buruzko informazioa ahal du b据. Datu pertsonalak ez izateko bera bera espretzatu ditut, baina batzuk geratzen daiteke.';
	@override String get currentlyOff => 'Adartez adierazpenak, aplikazioa berriro esartze ondoren aurreko-erroren azterketa aktibatko.';
	@override String get currentlyOn => 'Ez daiteke atzera itegiztea (consent-a ez bada), erantzutegi aplikazioak errorezko informazioaren bideratzea hutsakertzeko.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Ego aurkitu gehiago '),
		link('gizertapen politika'),
		const TextSpan(text: '.'),
	]);
}

// Path: sentry.consent.answers
class _Translations$sentry$consent$answers$eu extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Bai';
	@override String get no => 'Ez';
	@override String get later => 'Gero, gero gaurko.';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$eu extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Gaukitzen ekartzen duen akzioak (erratuz) itzultzea gailagaitzen du';
	@override String get fixedOn => 'Beziari marrategia aktibo gisa ez da aldatzen.';
	@override String get fixedOff => 'Bezeroak ez dira erabili daiteko (disabled) bezala finkatuta.';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$eu extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get active => 'Aktibo';
	@override String get inactive => 'Inaktibo';
	@override String get activeUntilRestart => 'Aktibo hasta aplikazioa berriro emartzean.';
	@override String get inactiveUntilRestart => 'Inaktibo hasta aplikazioa berriro hastearen arte';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$eu extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Mesedez, autoratu Saberari zure Nextcloud kontura sartzea.';
	@override String get followPrompts => 'Zerbitzuaren/Interfazen zuzenko eskaerak jarraitzen baduzu';
	@override String get browserDidntOpen => 'Sida sartzeko orria ez zen ireki? Klikatu herian';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$eu extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Zer da szyfratzeko adierazpenak? Nirein zeharketa bi adierazpenak erabiltzen?';
	@override String get a => 'Nextcloud-ko adierazpenak nubesik sartzeko erabiltzen da. Adierazpenaren adierazpenak zure datuak nubesera iritsi aurretik "zuztatu" ditu.\nNeketak Nextcloud-ko kontura sartzea lortzen badira, zure notaak erabili duen adierazpen berezia baten laguntzan seguru eta adierazpina mantentuko dira. Horrek datuak babesteko segurtasun zuzen bat ematen utzi zait.\nNeketak serverrean nahako ez du aukera zure adierazpenaren adierazpena gabe, baina horrek bermatzeko dizki adierazpenaren adierazpena ahaztu gero, datuei sartzeago.';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$eu extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Eskriptatze lehenago ez dut ezartu. Non hartzen dezuke?';
	@override String get a => 'Zerbitzari berri bat aukeratu eta sartzen ditu gainean.\nSaber-ek sortuko dira zure kriptografiaren gakoak honeetik automatikoki.';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$eu extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Ahal dezake nire Nextcloud kontua berriaren azpitatzaile bera erabiltzen?';
	@override String get a => 'Bai, baina saioa administrazioari edo beste norbait eragiarriago izango dela kontuan hartu, ez duela zure Nextcloud kontura eskaera lortzen.';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$eu extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Estiratu';
	@override String get cover => 'Osagarla';
	@override String get contain => 'Contiene';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$eu extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$eu._(TranslationsEu root) : this._root = root, super.internal(root);

	final TranslationsEu _root; // ignore: unused_field

	// Translations
	@override String get none => 'Bidaiaren bidaia';
	@override String get college => 'Kollegeko aurreko';
	@override String get collegeRtl => 'Kollegeko aurreko (Inversioa)';
	@override String get lined => 'Aurrakonak';
	@override String get grid => 'Sarre';
	@override String get dots => 'Pintxak';
	@override String get staffs => 'Zerbitzariak';
	@override String get tablature => 'Tablatura';
	@override String get cornell => 'Cornell';
}
