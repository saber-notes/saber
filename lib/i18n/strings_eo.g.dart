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
class TranslationsEo extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.eo,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <eo>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsEo _root = this; // ignore: unused_field

	@override 
	TranslationsEo $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEo(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$eo common = _Translations$common$eo._(_root);
	@override late final _Translations$home$eo home = _Translations$home$eo._(_root);
	@override late final _Translations$sentry$eo sentry = _Translations$sentry$eo._(_root);
	@override late final _Translations$settings$eo settings = _Translations$settings$eo._(_root);
	@override late final _Translations$logs$eo logs = _Translations$logs$eo._(_root);
	@override late final _Translations$login$eo login = _Translations$login$eo._(_root);
	@override late final _Translations$profile$eo profile = _Translations$profile$eo._(_root);
	@override late final _Translations$appInfo$eo appInfo = _Translations$appInfo$eo._(_root);
	@override late final _Translations$update$eo update = _Translations$update$eo._(_root);
	@override late final _Translations$editor$eo editor = _Translations$editor$eo._(_root);
}

// Path: common
class _Translations$common$eo extends Translations$common$en {
	_Translations$common$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get done => 'Preta';
	@override String get continueBtn => 'Daŭru';
	@override String get cancel => 'Nuligu';
}

// Path: home
class _Translations$home$eo extends Translations$home$en {
	_Translations$home$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$eo tabs = _Translations$home$tabs$eo._(_root);
	@override late final _Translations$home$titles$eo titles = _Translations$home$titles$eo._(_root);
	@override late final _Translations$home$tooltips$eo tooltips = _Translations$home$tooltips$eo._(_root);
	@override late final _Translations$home$create$eo create = _Translations$home$create$eo._(_root);
	@override String get welcome => 'Bonvenon al Saber';
	@override String get invalidFormat => 'Via dosiero ne estas subtenata. Bonvolu elekti sbn, sbn2, sba aŭ pdf dosieron.';
	@override String get noFiles => 'Neniu dosiero trovita';
	@override String get noPreviewAvailable => 'Neniu antaŭrigardo havebla';
	@override String get createNewNote => 'Frapu la + butonon por krei novan noton';
	@override String get backFolder => 'Reenu al la antaŭa dosierujo';
	@override late final _Translations$home$newFolder$eo newFolder = _Translations$home$newFolder$eo._(_root);
	@override late final _Translations$home$renameNote$eo renameNote = _Translations$home$renameNote$eo._(_root);
	@override late final _Translations$home$moveNote$eo moveNote = _Translations$home$moveNote$eo._(_root);
	@override String get deleteNote => 'Forigu noton';
	@override late final _Translations$home$deleteNoteDialog$eo deleteNoteDialog = _Translations$home$deleteNoteDialog$eo._(_root);
	@override late final _Translations$home$renameFolder$eo renameFolder = _Translations$home$renameFolder$eo._(_root);
	@override late final _Translations$home$deleteFolder$eo deleteFolder = _Translations$home$deleteFolder$eo._(_root);
	@override late final _Translations$home$sort$eo sort = _Translations$home$sort$eo._(_root);
	@override late final _Translations$home$layout$eo layout = _Translations$home$layout$eo._(_root);
}

// Path: sentry
class _Translations$sentry$eo extends Translations$sentry$en {
	_Translations$sentry$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$eo consent = _Translations$sentry$consent$eo._(_root);
}

// Path: settings
class _Translations$settings$eo extends Translations$settings$en {
	_Translations$settings$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$eo prefCategories = _Translations$settings$prefCategories$eo._(_root);
	@override late final _Translations$settings$prefLabels$eo prefLabels = _Translations$settings$prefLabels$eo._(_root);
	@override late final _Translations$settings$prefDescriptions$eo prefDescriptions = _Translations$settings$prefDescriptions$eo._(_root);
	@override late final _Translations$settings$themeModes$eo themeModes = _Translations$settings$themeModes$eo._(_root);
	@override late final _Translations$settings$layoutSizes$eo layoutSizes = _Translations$settings$layoutSizes$eo._(_root);
	@override late final _Translations$settings$accentColorPicker$eo accentColorPicker = _Translations$settings$accentColorPicker$eo._(_root);
	@override String get systemLanguage => 'Aŭtomata';
	@override List<String> get axisDirections => [
		'Supre',
		'Dekstre',
		'Sube',
		'Maldekstre',
	];
	@override late final _Translations$settings$reset$eo reset = _Translations$settings$reset$eo._(_root);
	@override String get resyncEverything => 'Resinkronigu ĉion';
	@override String get openDataDir => 'Malfermu Saber-dosierujon';
	@override late final _Translations$settings$customDataDir$eo customDataDir = _Translations$settings$customDataDir$eo._(_root);
	@override String get autosaveDisabled => 'Neniam';
	@override String get shapeRecognitionDisabled => 'Neniam';
}

// Path: logs
class _Translations$logs$eo extends Translations$logs$en {
	_Translations$logs$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Protokoloj';
	@override String get viewLogs => 'Vidu protokolojn';
	@override String get debuggingInfo => 'Protokoloj enhavas informojn por sencimigado kaj disvolviĝo';
	@override String get noLogs => 'Neniu protokoloj tie ĉi!';
	@override String get useTheApp => 'Logs will appear here as you use the app';
}

// Path: login
class _Translations$login$eo extends Translations$login$en {
	_Translations$login$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ensaluto';
	@override late final _Translations$login$form$eo form = _Translations$login$form$eo._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Ĉu vi ankoraŭ ne havas konton? '),
		linkToSignup('Sign up now'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'Ne vi? '),
		undoLogin('Choose another account'),
		const TextSpan(text: '.'),
	]);
	@override late final _Translations$login$status$eo status = _Translations$login$status$eo._(_root);
	@override late final _Translations$login$ncLoginStep$eo ncLoginStep = _Translations$login$ncLoginStep$eo._(_root);
	@override late final _Translations$login$encLoginStep$eo encLoginStep = _Translations$login$encLoginStep$eo._(_root);
}

// Path: profile
class _Translations$profile$eo extends Translations$profile$en {
	_Translations$profile$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mia profilo';
	@override String get logout => 'Elsalutu';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Vi uzas ${used} el ${total} (${percent}%)';
	@override String get connectedTo => 'Konektita al';
	@override late final _Translations$profile$quickLinks$eo quickLinks = _Translations$profile$quickLinks$eo._(_root);
	@override String get faqTitle => 'Oftaj demandoj';
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$eo._(_root),
		_Translations$profile$faq$1$eo._(_root),
		_Translations$profile$faq$2$eo._(_root),
		_Translations$profile$faq$3$eo._(_root),
	];
}

// Path: appInfo
class _Translations$appInfo$eo extends Translations$appInfo$en {
	_Translations$appInfo$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Kopirajto de Saber © 2022-${buildYear} Adil Hanney\nĈi tiu programo havas neniun garantion. Ĉi tio estas senpaga programaro, kaj vi bonvenas redistribui ĝin kun certaj kondiĉoj.';
	@override String get debug => 'SENERARIGADO';
	@override String get sponsorButton => 'Frapu ĉi tie por sponsori min aŭ aĉeti pli da memorospaco';
	@override String get licenseButton => 'Frapu ĉi tie por vidi pli da informoj pri la licenco';
	@override String get privacyPolicyButton => 'Frapu ĉi tie por vidi la privatecopolitikon';
}

// Path: update
class _Translations$update$eo extends Translations$update$en {
	_Translations$update$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Ĝisdatigo disponebla';
	@override String get updateAvailableDescription => 'Nova versio de la aplikaĵo disponeblas:';
	@override String get update => 'Ĝisdatigo';
	@override String get downloadNotAvailableYet => 'La elŝuto ankoraŭ ne disponeblas por via platformo. Bonvolu rekontroli baldaŭ.';
}

// Path: editor
class _Translations$editor$eo extends Translations$editor$en {
	_Translations$editor$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$eo toolbar = _Translations$editor$toolbar$eo._(_root);
	@override late final _Translations$editor$pens$eo pens = _Translations$editor$pens$eo._(_root);
	@override late final _Translations$editor$penOptions$eo penOptions = _Translations$editor$penOptions$eo._(_root);
	@override late final _Translations$editor$colors$eo colors = _Translations$editor$colors$eo._(_root);
	@override late final _Translations$editor$imageOptions$eo imageOptions = _Translations$editor$imageOptions$eo._(_root);
	@override late final _Translations$editor$selectionBar$eo selectionBar = _Translations$editor$selectionBar$eo._(_root);
	@override late final _Translations$editor$menu$eo menu = _Translations$editor$menu$eo._(_root);
	@override late final _Translations$editor$readOnlyBanner$eo readOnlyBanner = _Translations$editor$readOnlyBanner$eo._(_root);
	@override late final _Translations$editor$versionTooNew$eo versionTooNew = _Translations$editor$versionTooNew$eo._(_root);
	@override late final _Translations$editor$quill$eo quill = _Translations$editor$quill$eo._(_root);
	@override late final _Translations$editor$hud$eo hud = _Translations$editor$hud$eo._(_root);
	@override String get pages => 'Paĝoj';
	@override String get untitled => 'Sentitola';
	@override String get needsToSaveBeforeExiting => 'Konservado de viaj ŝanĝoj... Vi povas sekure forlasi la redaktilon, kiam ĝi finos.';
}

// Path: home.tabs
class _Translations$home$tabs$eo extends Translations$home$tabs$en {
	_Translations$home$tabs$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get home => 'Hejmo';
	@override String get browse => 'Foliumu';
	@override String get whiteboard => 'Tabulo';
	@override String get settings => 'Agordoj';
}

// Path: home.titles
class _Translations$home$titles$eo extends Translations$home$titles$en {
	_Translations$home$titles$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get home => 'Lastaj notoj';
	@override String get browse => 'Foliumu';
	@override String get whiteboard => 'Tabulo';
	@override String get settings => 'Agordoj';
}

// Path: home.tooltips
class _Translations$home$tooltips$eo extends Translations$home$tooltips$en {
	_Translations$home$tooltips$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nova noto';
	@override String get showUpdateDialog => 'Montru ĝisdatiga dialogo';
	@override String get exportNote => 'Eksportu noton';
}

// Path: home.create
class _Translations$home$create$eo extends Translations$home$create$en {
	_Translations$home$create$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nova noto';
	@override String get importNote => 'Enportu noton';
}

// Path: home.newFolder
class _Translations$home$newFolder$eo extends Translations$home$newFolder$en {
	_Translations$home$newFolder$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Nova dosierujo';
	@override String get folderName => 'Dosierujnomo';
	@override String get create => 'Kreu';
	@override String get folderNameEmpty => 'Dosierujnomo ne estu malplena';
	@override String get folderNameContainsSlash => 'Dosierujnomo ne havu oblikvon';
	@override String get folderNameExists => 'Dosierujo jam ekzistas';
}

// Path: home.renameNote
class _Translations$home$renameNote$eo extends Translations$home$renameNote$en {
	_Translations$home$renameNote$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Alinomu noton';
	@override String get noteName => 'Notonomo';
	@override String get rename => 'Alinomu';
	@override String get noteNameEmpty => 'Notonomo ne estu malplena';
	@override String get noteNameExists => 'Noto kun ĉi tiu nomo jam ekzistas';
	@override String get noteNameForbiddenCharacters => 'Notonomo enhavas malpermesitajn signojn';
	@override String get noteNameReserved => 'Noto nomo rezervita';
}

// Path: home.moveNote
class _Translations$home$moveNote$eo extends Translations$home$moveNote$en {
	_Translations$home$moveNote$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Movu noton';
	@override String moveNotes({required Object n}) => 'Movu ${n} notojn';
	@override String moveName({required Object f}) => 'Movu ${f}';
	@override String get move => 'Movu';
	@override String renamedTo({required Object newName}) => 'Noto alinomiĝos al ${newName}';
	@override String get multipleRenamedTo => 'La sekvaj notoj alinomiĝos:';
	@override String numberRenamedTo({required Object n}) => '${n} notoj alinomiĝos por eviti konfliktojn';
}

// Path: home.deleteNoteDialog
class _Translations$home$deleteNoteDialog$eo extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('eo'))(n,
		one: 'Perpetuebleman deleta la selektita noton?',
		other: 'Perpetuebleman diliĝi la selektitaj notoj?',
	);
	@override String deleteNotes({required Object n}) => '${n} нота들을 삭제하세요';
	@override String deleteName({required Object f}) => '${f}-ஐ நீக்கு';
	@override String get delete => 'Удалить';
}

// Path: home.renameFolder
class _Translations$home$renameFolder$eo extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Alinomu dosierujon';
	@override String get folderName => 'Dosierujnomo';
	@override String get rename => 'Alinomu';
	@override String get folderNameEmpty => 'Dosierujnomo ne estu malplena';
	@override String get folderNameContainsSlash => 'Dosierujnomo ne havu oblikvon';
	@override String get folderNameExists => 'Dosierujnomo jam estas uzata';
}

// Path: home.deleteFolder
class _Translations$home$deleteFolder$eo extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Forigu dosierujon';
	@override String deleteName({required Object f}) => 'Forigu ${f}';
	@override String get delete => 'Forigu';
	@override String get alsoDeleteContents => 'Ankaŭ forigu ĉiujn notojn en ĉi tiu dosierujo';
}

// Path: home.sort
class _Translations$home$sort$eo extends Translations$home$sort$en {
	_Translations$home$sort$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get sortBy => 'Ordeku per';
	@override String get nameAToZ => 'Nomo (de A ĝis Z)';
	@override String get nameZToA => 'Nomo (de A al Z)';
	@override String get lastModifiedNewToOld => 'Redaktita (La plej nova unue)';
	@override String get lastModifiedOldToNew => 'Redaktita (La pliĝanta unue)';
}

// Path: home.layout
class _Translations$home$layout$eo extends Translations$home$layout$en {
	_Translations$home$layout$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get layout => 'Disegno';
	@override String get masonryGrid => 'Mosaika retablo';
	@override String get simpleGrid => 'Simpla retablo';
}

// Path: sentry.consent
class _Translations$sentry$consent$eo extends Translations$sentry$consent$en {
	_Translations$sentry$consent$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Helpu plibonigi Saber';
	@override late final _Translations$sentry$consent$description$eo description = _Translations$sentry$consent$description$eo._(_root);
	@override late final _Translations$sentry$consent$answers$eo answers = _Translations$sentry$consent$answers$eo._(_root);
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$eo extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get general => 'Ĝeneralaj';
	@override String get writing => 'Enigaj';
	@override String get editor => 'Redaktilaj';
	@override String get performance => 'Rendimentaj';
	@override String get advanced => 'Altnivelaj';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$eo extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Lingvo';
	@override String get appTheme => 'Heleco';
	@override String get platform => 'Etoso';
	@override String get layoutSize => 'Aranĝo';
	@override String get customAccentColor => 'Kutima akcentokoloro';
	@override String get hyperlegibleFont => 'Superlegebla tiparo';
	@override String get shouldCheckForUpdates => 'Kontrolu por ĝisdatigoj';
	@override String get shouldAlwaysAlertForUpdates => 'Pli rapidaj ĝisdatigoj';
	@override String get allowInsecureConnections => 'Permesu nesekurajn konektojn';
	@override String get editorToolbarAlignment => 'Pozicio de ilobreto';
	@override String get editorToolbarShowInFullscreen => 'Montru ilobreton en plenekranreĝimo';
	@override String get editorAutoInvert => 'Inversigu notojn en malhelreĝimo';
	@override String get preferGreyscale => 'Preferu grizkolorojn';
	@override String get maxImageSize => 'Maksimuma bildgrandeco';
	@override String get autoClearWhiteboardOnExit => 'Malplenigu la tablon post foriro';
	@override String get disableEraserAfterUse => 'Malaktivigu la forviŝilon';
	@override String get hideFingerDrawingToggle => 'Kaŝu la fingrodesegnan ŝaltilon';
	@override String get editorPromptRename => 'Petu vin alinomi novajn notojn';
	@override String get recentColorsDontSavePresets => 'Ne konservu kolorŝablonon en la lastuzitaj koloroj';
	@override String get recentColorsLength => 'Nombro da lastuzitaj koloroj';
	@override String get printPageIndicators => 'Presu paĝnumeradon';
	@override String get autosave => 'Aŭtomata konservado';
	@override String get shapeRecognitionDelay => 'Prokrasto de formorekono';
	@override String get autoStraightenLines => 'Aŭtomate rektigu liniojn';
	@override String get customDataDir => 'Kutima Saber-dosierujo';
	@override String get sentry => 'Erarraportado';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Aŭtomate malŝalti fingrodesegnadon';
}

// Path: settings.prefDescriptions
class _Translations$settings$prefDescriptions$eo extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Pliigas legeblecon por uzantoj kun malalta vidkapablo';
	@override String get allowInsecureConnections => '(Nerekomendita) Permesu al Sabero konektiĝi al serviloj kun mem-subskribitaj/nefidindaj atestiloj';
	@override String get preferGreyscale => 'Por ekranoj de bitlegiloj';
	@override String get autoClearWhiteboardOnExit => 'Malplenigas la tabulon post kiam vi foriras la aplikaĵon';
	@override String get disableEraserAfterUse => 'Aŭtomate ŝanĝas reen al la plumo post uzi la forviŝilon';
	@override String get maxImageSize => 'Pli grandaj bildoj densiĝos';
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$eo hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$eo._(_root);
	@override String get editorPromptRename => 'Vi ĉiam povas renomi notojn poste';
	@override String get printPageIndicators => 'Montru paĝnumeradon post eksporto';
	@override String get autosave => 'Aŭtomate konservas post iom da tempo aŭ neniam';
	@override String get shapeRecognitionDelay => 'Ofteco de ĝisdatigo de la formantaŭrigardo';
	@override String get autoStraightenLines => 'Rektigas longajn liniojn sen uzado de la formskribilon';
	@override String get shouldAlwaysAlertForUpdates => 'Informu min pri ĝisdatigoj tuj kiam ili disponebliĝos';
	@override late final _Translations$settings$prefDescriptions$sentry$eo sentry = _Translations$settings$prefDescriptions$sentry$eo._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Malŝaltu fingrodesegnadon kiam grifelo estas detektita';
}

// Path: settings.themeModes
class _Translations$settings$themeModes$eo extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistemo';
	@override String get light => 'Hela';
	@override String get dark => 'Malhela';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$eo extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Aŭtomata';
	@override String get phone => 'Poŝtelefona';
	@override String get tablet => 'Platkomputila';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$eo extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Elektu koloron';
}

// Path: settings.reset
class _Translations$settings$reset$eo extends Translations$settings$reset$en {
	_Translations$settings$reset$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Restarigu agordon?';
	@override String get button => 'Restarigo';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$eo extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Nuligu';
	@override String get select => 'Elektu';
	@override String get mustBeEmpty => 'La elektita dosierujo estu malplena';
	@override String get mustBeDoneSyncing => 'Certigu, ĉu la sinkronigado kompletas antaŭ ŝanĝi dosierujon';
	@override String get unsupported => 'Ĉi tiu funkcio nuntempe estas nur por programistoj. Uzado verŝajne rezultigos datumperdon';
}

// Path: login.form
class _Translations$login$form$eo extends Translations$login$form$en {
	_Translations$login$form$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Ensalutante, vi konsentas pri la '),
		linkToPrivacyPolicy('Privacy Policy'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _Translations$login$status$eo extends Translations$login$status$en {
	_Translations$login$status$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Elsalutita';
	@override String get tapToLogin => 'Frapetu por ensaluti per Nextcloud-konto';
	@override String hi({required Object u}) => 'Saluton, ${u}!';
	@override String get almostDone => 'Preskaŭpreta por sinkronigado, frapetu por fini ensaluton';
	@override String get loggedIn => 'Ensalutita per NextCloud-konto';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$eo extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'Elektu kie vi volas konservi viajn datumojn:';
	@override String get saberNcServer => 'Sabera Nextcloud-servilo';
	@override String get otherNcServer => 'Aliaj Nextcloud-serviloj';
	@override String get serverUrl => 'Retadreso de servilo';
	@override String get loginWithSaber => 'Ensalutu per Saber-konto';
	@override String get loginWithNextcloud => 'Ensalutu per Nextcloud-konto';
	@override late final _Translations$login$ncLoginStep$loginFlow$eo loginFlow = _Translations$login$ncLoginStep$loginFlow$eo._(_root);
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$eo extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'To protect your data, please enter your encryption password:';
	@override String get newToSaber => 'Ĉu vi estas nova uzanto? Nur eniru novan ĉifradopasvorton';
	@override String get encPassword => 'Ĉifradopasvorto';
	@override String get encFaqTitle => 'Oftaj demandoj';
	@override String get wrongEncPassword => 'Malĉifrado per enigita pasvorto malsukcesis. Bonvolu enigi ĝin denove';
	@override String get connectionFailed => 'Konektado al la servilo fiaskis. Bonvolu provi denove poste.';
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$eo._(_root),
		_Translations$login$encLoginStep$encFaq$1$eo._(_root),
		_Translations$login$encLoginStep$encFaq$2$eo._(_root),
	];
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$eo extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Hejmpaĝo de la servilo';
	@override String get deleteAccount => 'Forigu konton';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$eo extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get q => 'Ĉu mi perdos miajn notojn se mi elsalutas?';
	@override String get a => 'Ne. Viaj notoj restos kaj sur via aparato kaj sur la servilo. Ili ne estos sinkronigataj kun la servilo ĝis vi reensalutos. Certigu, ke la sinkronigado estas kompleta antaŭ ol elsaluti, por ke vi ne perdu iujn ajn datumojn (vidu la sinkronigan progreson sur la ĉefekrano).';
}

// Path: profile.faq.1
class _Translations$profile$faq$1$eo extends Translations$profile$faq$1$en {
	_Translations$profile$faq$1$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get q => 'Kiel mi ŝanĝas mian Nextcloud-pasvorton?';
	@override String get a => 'Iru al la retejo de via servilo kaj ensalutu. Poste iru al Agordoj > Sekureco > Ŝanĝu pasvorton. Elsalutu kaj reensalutu al Saber post via pasvortoŝanĝo.';
}

// Path: profile.faq.2
class _Translations$profile$faq$2$eo extends Translations$profile$faq$2$en {
	_Translations$profile$faq$2$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get q => 'Kiel mi ŝanĝas mian ĉifradopasvorton?';
	@override String get a => '0. Certigu, ke la sinkronigado estas kompleta (vidu la sinkronigan progreson sur la ĉefekrano).\n1. Elsalutu el Saber.\n2. Iru al la retejo de via servilo kaj forigu vian Saber-dosierujon. Ĉi tio forigos ĉiujn viajn notojn de la servilo.\n3. Reensalutu al Saber. Vi povas elekti novan ĉifradopasvorton dum ensalutado.\n4. Ne forgesu elsaluti kaj reensaluti al Saber ankaŭ per viaj aliaj aparatoj.';
}

// Path: profile.faq.3
class _Translations$profile$faq$3$eo extends Translations$profile$faq$3$en {
	_Translations$profile$faq$3$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get q => 'Kiel mi povas forigi mian konton?';
	@override String get a => 'Frapetu la butonon "${_root.profile.quickLinks.deleteAccount}" supre, kaj ensalutu se necese.\nSe vi uzas la oficialan Saber-servilon, via konto estos forigita post 1-semajna indulgoperiodo. Vi povas kontakti min ĉe adilhanney@disroot.org dum ĉi tiu periodo por nuligi la forigon.\nSe vi uzas eksteran servilon, eble ne estos eblo forigi vian konton: vi devos konsulti la privatecopolitikon de la servilo por pliaj informoj.';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$eo extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Ŝaltu kolorojn (Ktrl C)';
	@override String get select => 'Elektu';
	@override String get toggleEraser => 'Ŝaltu forviŝilon (Ktrl E)';
	@override String get photo => 'Bildoj';
	@override String get text => 'Teksto';
	@override String get toggleFingerDrawing => 'Ŝaltu fingrodesegnadon (Ktrl F)';
	@override String get undo => 'Malfaru';
	@override String get redo => 'Refaru';
	@override String get export => 'Eksportu (Ktrl Majuskliga S)';
	@override String get exportAs => 'Eksportu kiel:';
	@override String get fullscreen => 'Ŝaltu plenekrane (F11)';
}

// Path: editor.pens
class _Translations$editor$pens$eo extends Translations$editor$pens$en {
	_Translations$editor$pens$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Fontoplumo';
	@override String get ballpointPen => 'Globkrajono';
	@override String get highlighter => 'Emfazilo';
	@override String get pencil => 'Krajono';
	@override String get shapePen => 'Formoplumo';
	@override String get laserPointer => 'Lasermontrilo';
}

// Path: editor.penOptions
class _Translations$editor$penOptions$eo extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get size => 'Grandeco';
}

// Path: editor.colors
class _Translations$editor$colors$eo extends Translations$editor$colors$en {
	_Translations$editor$colors$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Kolorelektilo';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Kutima ${b} ${h}';
	@override String customHue({required Object h}) => 'Kutima ${h}';
	@override String get dark => 'malhela';
	@override String get light => 'hela';
	@override String get black => 'Nigra';
	@override String get darkGrey => 'Malhelgriza';
	@override String get grey => 'Griza';
	@override String get lightGrey => 'Helgriza';
	@override String get white => 'Blanka';
	@override String get red => 'Ruĝa';
	@override String get green => 'Verda';
	@override String get cyan => 'Cejana';
	@override String get blue => 'Blua';
	@override String get yellow => 'Flava';
	@override String get purple => 'Viola';
	@override String get pink => 'Rozeva';
	@override String get orange => 'Oranĝeva';
	@override String get pastelRed => 'Pastelruĝa';
	@override String get pastelOrange => 'Pasteloranĝeva';
	@override String get pastelYellow => 'Pastelflava';
	@override String get pastelGreen => 'Pastelverda';
	@override String get pastelCyan => 'Pastelcejana';
	@override String get pastelBlue => 'Pastelblua';
	@override String get pastelPurple => 'Pastelviola';
	@override String get pastelPink => 'Pastelrozeva';
}

// Path: editor.imageOptions
class _Translations$editor$imageOptions$eo extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bildopcioj';
	@override String get invertible => 'Inversigebla';
	@override String get download => 'Elŝuto';
	@override String get setAsBackground => 'Agordu kiel fono';
	@override String get removeAsBackground => 'Forigu kiel fono';
	@override String get delete => 'Forigu';
}

// Path: editor.selectionBar
class _Translations$editor$selectionBar$eo extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Forigu';
	@override String get duplicate => 'Duobligu';
}

// Path: editor.menu
class _Translations$editor$menu$eo extends Translations$editor$menu$en {
	_Translations$editor$menu$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Malplenigu paĝon ${page}/${totalPages}';
	@override String get clearAllPages => 'Malplenigu ĉiujn paĝojn';
	@override String get insertPage => 'Enmetu paĝon sube';
	@override String get duplicatePage => 'Duobligu paĝon';
	@override String get deletePage => 'Forigu paĝon';
	@override String get lineHeight => 'Linioalto';
	@override String get lineHeightDescription => 'Ankaŭ regas la tekstograndeco por tajpitaj notoj';
	@override String get lineThickness => 'Liniodikeco';
	@override String get lineThicknessDescription => 'Fonliniodikeco';
	@override String get backgroundImageFit => 'Fonbildĝustigo';
	@override String get backgroundPattern => 'Fonŝablono';
	@override String get import => 'Enportu';
	@override String get watchServer => 'Kontrolu ĝisdatigojn ĉe la servilo';
	@override String get watchServerReadOnly => 'Redaktado estas malŝaltita dum spektado de la servilo';
	@override late final _Translations$editor$menu$boxFits$eo boxFits = _Translations$editor$menu$boxFits$eo._(_root);
	@override late final _Translations$editor$menu$bgPatterns$eo bgPatterns = _Translations$editor$menu$bgPatterns$eo._(_root);
}

// Path: editor.readOnlyBanner
class _Translations$editor$readOnlyBanner$eo extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nurlegebla reĝimo';
	@override String get watchingServer => 'Vi nuntempe rigardas por ĝisdatigoj sur la servilo. Redaktado estas malŝaltita en ĉi tiu reĝimo.';
	@override String get corrupted => 'Malsukcesis ŝargi noton. Ĝi povas esti koruptita aŭ ankoraŭ elŝutita.';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$eo extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ĉi tiu noto estis redaktita per pli nova versio de Saber';
	@override String get subtitle => 'Redakti ĉi tiun noton eble kaŭzos perdon de iuj informoj. Ĉu vi volas malatenti kaj redakti ĝin spite al tio?';
	@override String get allowEditing => 'Permesu redaktadon';
}

// Path: editor.quill
class _Translations$editor$quill$eo extends Translations$editor$quill$en {
	_Translations$editor$quill$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Tajpu ion ĉi tie...';
}

// Path: editor.hud
class _Translations$editor$hud$eo extends Translations$editor$hud$en {
	_Translations$editor$hud$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Malŝlosu zomadon';
	@override String get lockZoom => 'Ŝlosu zomadon';
	@override String get unlockSingleFingerPan => 'Malŝlosu movadon per unu fingro';
	@override String get lockSingleFingerPan => 'Ŝlosu movadon per unu fingro';
	@override String get unlockAxisAlignedPan => 'Malŝlosu movadon laŭ aksoj (horizontala/vertikala)';
	@override String get lockAxisAlignedPan => 'Ŝlosu movadon laŭ aksoj (horizontala/vertikala)';
}

// Path: sentry.consent.description
class _Translations$sentry$consent$description$eo extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get question => 'Ĉu vi aŭtomate raportus neatenditajn erarojn? Tio helpus min identigi kaj solvi problemojn pli rapide.';
	@override String get scope => 'La raportoj enhavus informojn pri la eraro kaj aparato. Mi faris ĉion por kolekti malpli da persondatumojn, sed iuj eble kolektiĝus.';
	@override String get currentlyOff => 'Se vi konsentas, eraroraportado ebligos post rekomencigo de la aplikaĵo.';
	@override String get currentlyOn => 'Se vi malkonsentos, bonvole rekomecigu la aplikaĵon por ne eraroraporti plu.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Lernu pli en la '),
		link('privacy policy'),
		const TextSpan(text: '.'),
	]);
}

// Path: sentry.consent.answers
class _Translations$sentry$consent$answers$eo extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Jes';
	@override String get no => 'Ne';
	@override String get later => 'Demandu poste';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$eo extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Malhelpas hazardan ŝaltadon';
	@override String get fixedOn => 'Fingrodesegnado estas fiksita kiel ebligita';
	@override String get fixedOff => 'Fingrodesegnado estas fiksita kiel malebligita';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$eo extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get active => 'Aktiva';
	@override String get inactive => 'Malaktiva';
	@override String get activeUntilRestart => 'Aktiva ĝis vi rekomencas la aplikaĵon';
	@override String get inactiveUntilRestart => 'Neaktiva ĝis vi rekomencas la aplikaĵon';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$eo extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Bonvolu rajtigi Saber por aliri vian NextCloud-konton';
	@override String get followPrompts => 'Bonvolu sekvi la instrukciojn en la Nextcloud-interfaco';
	@override String get browserDidntOpen => 'Ensalutpaĝo ne malfermiĝis? Alklaku ĉi tie';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$eo extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get q => 'Kio estas ĉifradopasvorto? Kial uzi du pasvortojn?';
	@override String get a => 'La pasvorto de Nextcloud estas uzata por aliri la nubon. La ĉifradopasvorto "miksas" vian datumon antaŭ ol ili iam ajn atingas la nubon. \nEĉ se iu akiras aliron al via Nextcloud-konto, viaj notoj restos sekuraj kaj ĉifritaj per aparta pasvorto. Ĉi tio provizas al vi duan tavolon de sekureco por protekti vian datumon. \nNeniu povas vidi viajn notojn sur la servilo sen via ĉifradopasvorto, sed ĉi tio ankaŭ signifas, ke se vi forgesas vian ĉifrandopasvorton, vi perdos aliron al viaj datumoj.';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$eo extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get q => 'Mi ankoraŭ ne agordis ĉifradopasvorton. Kie mi agordis ĝin?';
	@override String get a => 'Elektu novan ĉifradopasvorton kaj enigu ĝin supre.\nSaber aŭtomate generos viajn ĉifradoŝlosilojn el ĉi tiu pasvorto.';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$eo extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get q => 'Ĉu mi povas uzi la saman pasvorton por mia Nextcloud-konto?';
	@override String get a => 'Jes, sed memoru, ke estus pli facile por la servilestro aŭ iu alia aliri viajn notojn se ili akiras aliron al via Nextcloud-konto.';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$eo extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Etendu';
	@override String get cover => 'Kovru';
	@override String get contain => 'Enhavu';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$eo extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$eo._(TranslationsEo root) : this._root = root, super.internal(root);

	final TranslationsEo _root; // ignore: unused_field

	// Translations
	@override String get none => 'Malplena';
	@override String get college => 'Linioj (universitata)';
	@override String get collegeRtl => 'Linioj (universitata, inversa)';
	@override String get lined => 'Linioj';
	@override String get grid => 'Krado';
	@override String get dots => 'Punktoj';
	@override String get staffs => 'Notlinioj';
	@override String get tablature => 'Tablaturo';
	@override String get cornell => 'Kornela notmetodo';
}
