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
class TranslationsCs extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsCs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.cs,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <cs>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsCs _root = this; // ignore: unused_field

	@override 
	TranslationsCs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsCs(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$cs common = _Translations$common$cs._(_root);
	@override late final _Translations$home$cs home = _Translations$home$cs._(_root);
	@override late final _Translations$sentry$cs sentry = _Translations$sentry$cs._(_root);
	@override late final _Translations$settings$cs settings = _Translations$settings$cs._(_root);
	@override late final _Translations$logs$cs logs = _Translations$logs$cs._(_root);
	@override late final _Translations$login$cs login = _Translations$login$cs._(_root);
	@override late final _Translations$profile$cs profile = _Translations$profile$cs._(_root);
	@override late final _Translations$appInfo$cs appInfo = _Translations$appInfo$cs._(_root);
	@override late final _Translations$update$cs update = _Translations$update$cs._(_root);
	@override late final _Translations$editor$cs editor = _Translations$editor$cs._(_root);
}

// Path: common
class _Translations$common$cs extends Translations$common$en {
	_Translations$common$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get done => 'Dokončit';
	@override String get continueBtn => 'Pokračovat';
	@override String get cancel => 'Zrušit';
}

// Path: home
class _Translations$home$cs extends Translations$home$en {
	_Translations$home$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$cs tabs = _Translations$home$tabs$cs._(_root);
	@override late final _Translations$home$titles$cs titles = _Translations$home$titles$cs._(_root);
	@override late final _Translations$home$tooltips$cs tooltips = _Translations$home$tooltips$cs._(_root);
	@override late final _Translations$home$create$cs create = _Translations$home$create$cs._(_root);
	@override String get welcome => 'Vítejte v aplikaci Saber';
	@override String get invalidFormat => 'Vybrali jste nepodporovaný soubor. Vyberte prosím soubor s příponou .sbn, .sbn2, .sba nebo .pdf.';
	@override String get noFiles => 'Žádné poznámky nebyly nalezeny';
	@override String get noPreviewAvailable => 'Náhled není k dispozici';
	@override String get createNewNote => 'Pro přidání nové poznámky klepněte na tlačítko +';
	@override String get backFolder => 'Přejít do předchozí složky';
	@override late final _Translations$home$newFolder$cs newFolder = _Translations$home$newFolder$cs._(_root);
	@override late final _Translations$home$renameNote$cs renameNote = _Translations$home$renameNote$cs._(_root);
	@override late final _Translations$home$moveNote$cs moveNote = _Translations$home$moveNote$cs._(_root);
	@override String get deleteNote => 'Odstranit poznámku';
	@override late final _Translations$home$deleteNoteDialog$cs deleteNoteDialog = _Translations$home$deleteNoteDialog$cs._(_root);
	@override late final _Translations$home$renameFolder$cs renameFolder = _Translations$home$renameFolder$cs._(_root);
	@override late final _Translations$home$deleteFolder$cs deleteFolder = _Translations$home$deleteFolder$cs._(_root);
	@override late final _Translations$home$sort$cs sort = _Translations$home$sort$cs._(_root);
	@override late final _Translations$home$layout$cs layout = _Translations$home$layout$cs._(_root);
}

// Path: sentry
class _Translations$sentry$cs extends Translations$sentry$en {
	_Translations$sentry$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$cs consent = _Translations$sentry$consent$cs._(_root);
}

// Path: settings
class _Translations$settings$cs extends Translations$settings$en {
	_Translations$settings$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$cs prefCategories = _Translations$settings$prefCategories$cs._(_root);
	@override late final _Translations$settings$prefLabels$cs prefLabels = _Translations$settings$prefLabels$cs._(_root);
	@override late final _Translations$settings$prefDescriptions$cs prefDescriptions = _Translations$settings$prefDescriptions$cs._(_root);
	@override late final _Translations$settings$themeModes$cs themeModes = _Translations$settings$themeModes$cs._(_root);
	@override late final _Translations$settings$layoutSizes$cs layoutSizes = _Translations$settings$layoutSizes$cs._(_root);
	@override late final _Translations$settings$accentColorPicker$cs accentColorPicker = _Translations$settings$accentColorPicker$cs._(_root);
	@override String get systemLanguage => 'Zvolit automaticky';
	@override List<String> get axisDirections => [
		'Nahoře',
		'Vpravo',
		'Dole',
		'Vlevo',
	];
	@override late final _Translations$settings$reset$cs reset = _Translations$settings$reset$cs._(_root);
	@override String get resyncEverything => 'Znovu synchronizovat všechny poznámky';
	@override String get openDataDir => 'Otevřít složku aplikace Saber';
	@override late final _Translations$settings$customDataDir$cs customDataDir = _Translations$settings$customDataDir$cs._(_root);
	@override String get autosaveDisabled => 'Nikdy';
	@override String get shapeRecognitionDisabled => 'Nikdy';
}

// Path: logs
class _Translations$logs$cs extends Translations$logs$en {
	_Translations$logs$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Logy';
	@override String get viewLogs => 'Zobrazit logy';
	@override String get debuggingInfo => 'Logy obsahují informace užitečné pro ladění a vývoj';
	@override String get noLogs => 'Nejsou k dispozici žádné logy!';
	@override String get useTheApp => 'Jakmile aplikaci začnete používat, logy se zobrazí na tomto místě';
}

// Path: login
class _Translations$login$cs extends Translations$login$en {
	_Translations$login$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Přihlášení';
	@override late final _Translations$login$form$cs form = _Translations$login$form$cs._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Ještě nemáte účet? '),
		linkToSignup('Zaregistrujte se'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'Nejste to vy? '),
		undoLogin('Zvolit jiný účet'),
		const TextSpan(text: '.'),
	]);
	@override late final _Translations$login$status$cs status = _Translations$login$status$cs._(_root);
	@override late final _Translations$login$ncLoginStep$cs ncLoginStep = _Translations$login$ncLoginStep$cs._(_root);
	@override late final _Translations$login$encLoginStep$cs encLoginStep = _Translations$login$encLoginStep$cs._(_root);
}

// Path: profile
class _Translations$profile$cs extends Translations$profile$en {
	_Translations$profile$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Můj profil';
	@override String get logout => 'Odhlásit se';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Využíváte ${used} z ${total} (${percent} %)';
	@override String get connectedTo => 'Připojeno k';
	@override late final _Translations$profile$quickLinks$cs quickLinks = _Translations$profile$quickLinks$cs._(_root);
	@override String get faqTitle => 'Často kladené otázky';
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$cs._(_root),
		_Translations$profile$faq$1$cs._(_root),
		_Translations$profile$faq$2$cs._(_root),
		_Translations$profile$faq$3$cs._(_root),
	];
}

// Path: appInfo
class _Translations$appInfo$cs extends Translations$appInfo$en {
	_Translations$appInfo$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nTento program je poskytován bez jakékoliv záruky. Jedná se o software poskytovaný zdarma, který je možné šířit při splnění určitých podmínek.';
	@override String get debug => 'LADÍCÍ VERZE';
	@override String get sponsorButton => 'Klepněte sem, pokud mě chcete sponzorovat nebo si přikoupit úložiště';
	@override String get licenseButton => 'Klepněte sem pro zobrazení podrobnějších licenčních informací';
	@override String get privacyPolicyButton => 'Klepněte sem pro zobrazení zásad ochrany osobních údajů';
}

// Path: update
class _Translations$update$cs extends Translations$update$en {
	_Translations$update$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Aktualizace k dispozici';
	@override String get updateAvailableDescription => 'Je k dispozici nová verze aplikace:';
	@override String get update => 'Aktualizovat';
	@override String get downloadNotAvailableYet => 'Pro vaši platformu zatím není stažení aplikace dostupné. Zkuste to prosím o něco později.';
}

// Path: editor
class _Translations$editor$cs extends Translations$editor$en {
	_Translations$editor$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$cs toolbar = _Translations$editor$toolbar$cs._(_root);
	@override late final _Translations$editor$pens$cs pens = _Translations$editor$pens$cs._(_root);
	@override late final _Translations$editor$penOptions$cs penOptions = _Translations$editor$penOptions$cs._(_root);
	@override late final _Translations$editor$colors$cs colors = _Translations$editor$colors$cs._(_root);
	@override late final _Translations$editor$imageOptions$cs imageOptions = _Translations$editor$imageOptions$cs._(_root);
	@override late final _Translations$editor$selectionBar$cs selectionBar = _Translations$editor$selectionBar$cs._(_root);
	@override late final _Translations$editor$menu$cs menu = _Translations$editor$menu$cs._(_root);
	@override late final _Translations$editor$readOnlyBanner$cs readOnlyBanner = _Translations$editor$readOnlyBanner$cs._(_root);
	@override late final _Translations$editor$versionTooNew$cs versionTooNew = _Translations$editor$versionTooNew$cs._(_root);
	@override late final _Translations$editor$quill$cs quill = _Translations$editor$quill$cs._(_root);
	@override late final _Translations$editor$hud$cs hud = _Translations$editor$hud$cs._(_root);
	@override String get pages => 'Stránky';
	@override String get untitled => 'Nepojmenovaná poznámka';
	@override String get needsToSaveBeforeExiting => 'Ukládání změn... Po skončení této operace můžete editor bezpečně opustit';
}

// Path: home.tabs
class _Translations$home$tabs$cs extends Translations$home$tabs$en {
	_Translations$home$tabs$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Domů';
	@override String get browse => 'Poznámky';
	@override String get whiteboard => 'Tabule';
	@override String get settings => 'Nastavení';
}

// Path: home.titles
class _Translations$home$titles$cs extends Translations$home$titles$en {
	_Translations$home$titles$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Poslední poznámky';
	@override String get browse => 'Procházet poznámky';
	@override String get whiteboard => 'Tabule';
	@override String get settings => 'Nastavení';
}

// Path: home.tooltips
class _Translations$home$tooltips$cs extends Translations$home$tooltips$en {
	_Translations$home$tooltips$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nová poznámka';
	@override String get showUpdateDialog => 'Zobrazit dialogové okno aktualizace';
	@override String get exportNote => 'Exportovat poznámku';
}

// Path: home.create
class _Translations$home$create$cs extends Translations$home$create$en {
	_Translations$home$create$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nová poznámka';
	@override String get importNote => 'Import poznámky';
}

// Path: home.newFolder
class _Translations$home$newFolder$cs extends Translations$home$newFolder$en {
	_Translations$home$newFolder$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Nová složka';
	@override String get folderName => 'Název složky';
	@override String get create => 'Vytvořit';
	@override String get folderNameEmpty => 'Název složky nemůže být prázdný';
	@override String get folderNameContainsSlash => 'Název složky nemůže obsahovat lomítko';
	@override String get folderNameExists => 'Složka s tímto názvem již existuje';
}

// Path: home.renameNote
class _Translations$home$renameNote$cs extends Translations$home$renameNote$en {
	_Translations$home$renameNote$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Přejmenovat poznámku';
	@override String get noteName => 'Nový název poznámky';
	@override String get rename => 'Přejmenovat';
	@override String get noteNameEmpty => 'Název poznámky nemůže být prázdný';
	@override String get noteNameExists => 'Poznámka s tímto názvem již existuje';
	@override String get noteNameForbiddenCharacters => 'Zadaný název poznámky obsahuje nepovolené znaky';
	@override String get noteNameReserved => 'Tento název poznámky je rezervovaný pro účely aplikace';
}

// Path: home.moveNote
class _Translations$home$moveNote$cs extends Translations$home$moveNote$en {
	_Translations$home$moveNote$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Přesunout poznámku';
	@override String moveNotes({required Object n}) => 'Přesunout ${n} poznámek';
	@override String moveName({required Object f}) => 'Přesun poznámky ${f}';
	@override String get move => 'Přesunout';
	@override String renamedTo({required Object newName}) => 'Poznámka bude přejmenována na ${newName}';
	@override String get multipleRenamedTo => 'Následující poznámky budou přejmenovány:';
	@override String numberRenamedTo({required Object n}) => '${n} poznámek bude přejmenováno';
}

// Path: home.deleteNoteDialog
class _Translations$home$deleteNoteDialog$cs extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String deleteNotes({required Object n}) => 'Odstranit ${n} poznámek';
	@override String deleteName({required Object f}) => 'Odstranit poznámku ${f}';
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('cs'))(n,
		one: 'Přejete si trvale odstranit zvolenou poznámku?',
		other: 'Přejete si trvale odstranit zvolené poznámky?',
	);
	@override String get delete => 'Odstranit';
}

// Path: home.renameFolder
class _Translations$home$renameFolder$cs extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Přejmenovat složku';
	@override String get folderName => 'Název složky';
	@override String get rename => 'Přejmenovat';
	@override String get folderNameEmpty => 'Název složky nemůže být prázdný';
	@override String get folderNameContainsSlash => 'Název složky nemůže obsahovat lomítko';
	@override String get folderNameExists => 'Složka s tímto názvem již existuje';
}

// Path: home.deleteFolder
class _Translations$home$deleteFolder$cs extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Odstranit složku';
	@override String deleteName({required Object f}) => 'Odstranění složky ${f}';
	@override String get delete => 'Odstranit';
	@override String get alsoDeleteContents => 'Se složkou odstranit i obsažené poznámky';
}

// Path: home.sort
class _Translations$home$sort$cs extends Translations$home$sort$en {
	_Translations$home$sort$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get sortBy => 'Řazení podle';
	@override String get nameAToZ => 'Názvu (A–Z)';
	@override String get nameZToA => 'Názvu (Z–A)';
	@override String get lastModifiedNewToOld => 'Změny (nejprve novější)';
	@override String get lastModifiedOldToNew => 'Změny (nejprve starší)';
}

// Path: home.layout
class _Translations$home$layout$cs extends Translations$home$layout$en {
	_Translations$home$layout$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get layout => 'Rozvržení položek';
	@override String get masonryGrid => 'Cihlová mřížka';
	@override String get simpleGrid => 'Jednoduchá mřížka';
}

// Path: sentry.consent
class _Translations$sentry$consent$cs extends Translations$sentry$consent$en {
	_Translations$sentry$consent$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chcete pomoct vylepšit aplikaci Saber?';
	@override late final _Translations$sentry$consent$description$cs description = _Translations$sentry$consent$description$cs._(_root);
	@override late final _Translations$sentry$consent$answers$cs answers = _Translations$sentry$consent$answers$cs._(_root);
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$cs extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get general => 'Obecné';
	@override String get writing => 'Psaní';
	@override String get editor => 'Editor';
	@override String get performance => 'Výkon';
	@override String get advanced => 'Pokročilé';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$cs extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Jazyk';
	@override String get appTheme => 'Barva motivu';
	@override String get platform => 'Motiv';
	@override String get layoutSize => 'Rozvržení uživatelského rozhraní';
	@override String get customAccentColor => 'Vlastní barevný odstín';
	@override String get hyperlegibleFont => 'Lépe čitelný font';
	@override String get shouldCheckForUpdates => 'Automaticky kontrolovat dostupnost aktualizací aplikace Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Rychlejší aktualizace';
	@override String get allowInsecureConnections => 'Povolit nezabezpečená připojení';
	@override String get editorToolbarAlignment => 'Umístění nabídky editoru';
	@override String get editorToolbarShowInFullscreen => 'Zobrazovat nabídku editoru v režimu celé obrazovky';
	@override String get editorAutoInvert => 'V tmavém režimu invertovat poznámky';
	@override String get preferGreyscale => 'Preferovat černobílé barvy';
	@override String get maxImageSize => 'Maximální velikost obrázku';
	@override String get autoClearWhiteboardOnExit => 'Smazat tabuli po opuštění aplikace';
	@override String get disableEraserAfterUse => 'Automaticky vypínat gumu';
	@override String get hideFingerDrawingToggle => 'Skrýt přepínač pro kreslení prstem';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Automaticky vypínat kreslení prstem';
	@override String get editorPromptRename => 'Vybízet k přejmenování nových poznámek';
	@override String get recentColorsDontSavePresets => 'Neukládat přednastavené barvy mezi naposledy použité barvy';
	@override String get recentColorsLength => 'Kolik naposledy použitých barev se má ukládat';
	@override String get printPageIndicators => 'Tisknout čísla stránek';
	@override String get autosave => 'Automatické ukládání';
	@override String get shapeRecognitionDelay => 'Zpoždění rozpoznávání tvarů';
	@override String get autoStraightenLines => 'Automaticky narovnávat čáry';
	@override String get customDataDir => 'Vlastní umístění složky aplikace Saber';
	@override String get sentry => 'Hlášení chyb';
}

// Path: settings.prefDescriptions
class _Translations$settings$prefDescriptions$cs extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Font Atkinson Hyperlegible zvyšuje čitelnost pro čtenáře se slabým zrakem';
	@override String get allowInsecureConnections => '(Nedoporučuje se) Povolit aplikaci Saber připojovat se k serverům se samopodepsaným/nedůvěryhodným certifikátem';
	@override String get preferGreyscale => 'Pro elektronické čtečky knih s e-ink displejem';
	@override String get autoClearWhiteboardOnExit => 'Bude synchronizováno do dalších zařízení';
	@override String get disableEraserAfterUse => 'Po použití gumy automaticky přepnout zpět na pero';
	@override String get maxImageSize => 'Na větší obrázky bude aplikována komprese';
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$cs hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$cs._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Kreslení prstem se vypne, pokud je detekován stylus';
	@override String get editorPromptRename => 'Poznámky můžete vždy přejmenovat i později';
	@override String get printPageIndicators => 'V exportech budou zobrazena čísla stránek';
	@override String get autosave => 'Poznámky se budou automaticky ukládat po krátké prodlevě, nebo nikdy';
	@override String get shapeRecognitionDelay => 'Jak často aktualizovat náhled tvaru';
	@override String get autoStraightenLines => 'Automaticky narovná dlouhé čáry, aniž by bylo nutné využít tvarové pero';
	@override String get shouldAlwaysAlertForUpdates => 'Oznámit dostupnost aktualizací co nejdříve od jejich vydání';
	@override late final _Translations$settings$prefDescriptions$sentry$cs sentry = _Translations$settings$prefDescriptions$sentry$cs._(_root);
}

// Path: settings.themeModes
class _Translations$settings$themeModes$cs extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get system => 'Systémový';
	@override String get light => 'Světlý';
	@override String get dark => 'Tmavý';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$cs extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Automatické';
	@override String get phone => 'Telefon';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$cs extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Výběr vlastní barvy';
}

// Path: settings.reset
class _Translations$settings$reset$cs extends Translations$settings$reset$en {
	_Translations$settings$reset$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chcete resetovat tuto volbu?';
	@override String get button => 'Resetovat';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$cs extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Zrušit';
	@override String get select => 'Zvolit';
	@override String get mustBeEmpty => 'Zvolená složka musí být prázdná';
	@override String get mustBeDoneSyncing => 'Než změníte složku, ujistěte se, že byla dokončena synchronizace';
	@override String get unsupported => 'Tato funkce je v současné době pouze pro vývojáře. Její využití pravděpodobně povede ke ztrátě dat.';
}

// Path: login.form
class _Translations$login$form$cs extends Translations$login$form$en {
	_Translations$login$form$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Přihlášením souhlasíte se '),
		linkToPrivacyPolicy('Zásadami ochrany osobních údajů'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _Translations$login$status$cs extends Translations$login$status$en {
	_Translations$login$status$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Jste odhlášení';
	@override String get tapToLogin => 'Klepněte pro přihlášení pomocí Nextcloud účtu';
	@override String hi({required Object u}) => 'Zdravím, ${u}!';
	@override String get almostDone => 'Synchronizace je téměř připravena, pro dokončení přihlášení klepněte sem';
	@override String get loggedIn => 'Jste přihlášeni pomocí Nextcloud účtu';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$cs extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'Zvolte si, kam chcete ukládat svá data:';
	@override String get saberNcServer => 'Oficiální Nextcloud server aplikace Saber';
	@override String get otherNcServer => 'Jiný Nextcloud server';
	@override String get serverUrl => 'URL adresa serveru';
	@override String get loginWithSaber => 'Přihlásit přes aplikaci Saber';
	@override String get loginWithNextcloud => 'Přihlásit přes Nextcloud server';
	@override late final _Translations$login$ncLoginStep$loginFlow$cs loginFlow = _Translations$login$ncLoginStep$loginFlow$cs._(_root);
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$cs extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Pro ochranu svých dat prosím zadejte heslo pro šifrování:';
	@override String get newToSaber => 'Poprvé v aplikaci Saber? Stačí zadat nové heslo pro šifrování.';
	@override String get encPassword => 'Heslo pro šifrování';
	@override String get encFaqTitle => 'Často kladené otázky';
	@override String get wrongEncPassword => 'Dešifrování pomocí zadaného hesla pro šifrování selhalo. Zkuste ho prosím zadat znovu.';
	@override String get connectionFailed => 'Při připojování k serveru se něco pokazilo. Zkuste to prosím později.';
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$cs._(_root),
		_Translations$login$encLoginStep$encFaq$1$cs._(_root),
		_Translations$login$encLoginStep$encFaq$2$cs._(_root),
	];
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$cs extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Webové stránky serveru';
	@override String get deleteAccount => 'Odstranit účet';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$cs extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Ztratím po odhlášení svoje poznámky?';
	@override String get a => 'Nikoliv. Vaše poznámky zůstanou jak na vašem zařízení, tak na serveru. Dokud se opět nepřihlásíte, nebudou synchronizovány se serverem. Před ohlášením se ujistěte, že byla dokončena synchronizace, abyste předešli ztrátě dat (průběh synchronizace uvidíte na domovské obrazovce).';
}

// Path: profile.faq.1
class _Translations$profile$faq$1$cs extends Translations$profile$faq$1$en {
	_Translations$profile$faq$1$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Jak změním své heslo k Nextcloud účtu?';
	@override String get a => 'Přejděte na webovou stránku vašeho serveru a přihlašte se. Poté přejděte do Nastavení > Zabezpečení > Změnit heslo. Po změně hesla se budete muset odhlásit z aplikace Saber a poté se do ní opětovně přihlásit.';
}

// Path: profile.faq.2
class _Translations$profile$faq$2$cs extends Translations$profile$faq$2$en {
	_Translations$profile$faq$2$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Jak změním své heslo pro šifrování?';
	@override String get a => '0. Ujistěte se, že byla dokončena synchronizace (průběh synchronizace uvidíte na domovské obrazovce).\n1. Odhlašte se z aplikace Saber.\n2. Přejděte na webovou stránku vašeho serveru a smažte složku „Saber“. Tím ze serveru odstraníte všechny poznámky.\n3. Opětovně se přihlašte do aplikace Saber. Při přihlašování můžete zvolit nové heslo pro šifrování.\n4. Nezapomeňte se z aplikace Saber odhlásit a opětovně se do ní přihlásit na ostatních zařízeních.';
}

// Path: profile.faq.3
class _Translations$profile$faq$3$cs extends Translations$profile$faq$3$en {
	_Translations$profile$faq$3$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Jak odstraním svůj účet?';
	@override String get a => 'Klepněte na tlačítko „${_root.profile.quickLinks.deleteAccount}“ umístěné výše a přihlašte se, pokud to bude vyžadováno.\nPokud používáte oficiální server od aplikace Saber, bude váš účet odstraněn po uplynutí týdenní ochranné lhůty. Během této lhůty mě můžete kontaktovat pro odvolání zrušení účtu na adilhanney@disroot.org.\nPokud používáte server třetí strany, nemusí nabízet možnost odstranění účtu: pro více informací se bude třeba obrátit na zásady ochrany osobních údajů daného serveru.';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$cs extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Změnit barvu (Ctrl C)';
	@override String get select => 'Výběr';
	@override String get toggleEraser => 'Guma (Ctrl E)';
	@override String get photo => 'Obrázek';
	@override String get text => 'Text';
	@override String get toggleFingerDrawing => 'Možnost kreslení prstem (Ctrl F)';
	@override String get undo => 'Zpět';
	@override String get redo => 'Obnovit';
	@override String get export => 'Exportovat (Ctrl Shift S)';
	@override String get exportAs => 'Exportovat jako:';
	@override String get fullscreen => 'Režim celé obrazovky (F11)';
}

// Path: editor.pens
class _Translations$editor$pens$cs extends Translations$editor$pens$en {
	_Translations$editor$pens$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Plnící pero';
	@override String get ballpointPen => 'Kuličkové pero';
	@override String get highlighter => 'Zvýrazňovač';
	@override String get pencil => 'Tužka';
	@override String get shapePen => 'Pero pro kreslení tvarů';
	@override String get laserPointer => 'Laserové ukazovátko';
}

// Path: editor.penOptions
class _Translations$editor$penOptions$cs extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get size => 'Velikost';
}

// Path: editor.colors
class _Translations$editor$colors$cs extends Translations$editor$colors$en {
	_Translations$editor$colors$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Zvolit vlastní barvu';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Vlastní ${b} ${h}';
	@override String customHue({required Object h}) => 'Vlastní ${h}';
	@override String get dark => 'tmavě';
	@override String get light => 'světle';
	@override String get black => 'Černá';
	@override String get darkGrey => 'Tmavě šedá';
	@override String get grey => 'Šedá';
	@override String get lightGrey => 'Světle šedá';
	@override String get white => 'Bílá';
	@override String get red => 'Červená';
	@override String get green => 'Zelená';
	@override String get cyan => 'Azurová';
	@override String get blue => 'Modrá';
	@override String get yellow => 'Žlutá';
	@override String get purple => 'Purpurová';
	@override String get pink => 'Růžová';
	@override String get orange => 'Oranžová';
	@override String get pastelRed => 'Pastelová červená';
	@override String get pastelOrange => 'Pastelová oranžová';
	@override String get pastelYellow => 'Pastelová žlutá';
	@override String get pastelGreen => 'Pastelová zelená';
	@override String get pastelCyan => 'Pastelová azurová';
	@override String get pastelBlue => 'Pastelová modrá';
	@override String get pastelPurple => 'Pastelová purpurová';
	@override String get pastelPink => 'Pastelová růžová';
}

// Path: editor.imageOptions
class _Translations$editor$imageOptions$cs extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Možnosti obrázku';
	@override String get invertible => 'Invertovat podle motivu';
	@override String get download => 'Stáhnout';
	@override String get setAsBackground => 'Nastavit na pozadí';
	@override String get removeAsBackground => 'Odstranit obrázek z pozadí';
	@override String get delete => 'Odstranit';
}

// Path: editor.selectionBar
class _Translations$editor$selectionBar$cs extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Odstranit';
	@override String get duplicate => 'Duplikovat';
}

// Path: editor.menu
class _Translations$editor$menu$cs extends Translations$editor$menu$en {
	_Translations$editor$menu$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Smazat obsah stránky ${page}/${totalPages}';
	@override String get clearAllPages => 'Smazat všechny stránky';
	@override String get insertPage => 'Přidat stránku za tuto';
	@override String get duplicatePage => 'Duplikovat stránku';
	@override String get deletePage => 'Odstranit stránku';
	@override String get lineHeight => 'Výška řádku';
	@override String get lineHeightDescription => 'Ovlivňuje také velikost textu psaných poznámek';
	@override String get lineThickness => 'Tloušťka linek';
	@override String get lineThicknessDescription => 'Tloušťka čar ve vzoru na pozadí';
	@override String get backgroundImageFit => 'Přizpůsobení obrázku na pozadí';
	@override String get backgroundPattern => 'Vzor na pozadí';
	@override String get import => 'Importovat';
	@override String get watchServer => 'Sledovat aktualizace ze serveru';
	@override String get watchServerReadOnly => 'Během sledování serveru je vypnuto editování';
	@override late final _Translations$editor$menu$boxFits$cs boxFits = _Translations$editor$menu$boxFits$cs._(_root);
	@override late final _Translations$editor$menu$bgPatterns$cs bgPatterns = _Translations$editor$menu$bgPatterns$cs._(_root);
}

// Path: editor.readOnlyBanner
class _Translations$editor$readOnlyBanner$cs extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Otevřít v režimu pouze pro čtení';
	@override String get watchingServer => 'Aktuálně máte zapnuté sledování změn ze serveru. V tomto módu jsou vypnuté úpravy.';
	@override String get corrupted => 'Poznámku se nepodařilo načíst. Buď se ještě stahuje, nebo může být poškozená.';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$cs extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tato poznámka byla upravena v novější verzi aplikace Saber';
	@override String get subtitle => 'Úpravou této poznámky můžete přijít o některé informace. Přejete tuto skutečnost ignorovat a přesto pokračovat k úpravě poznámky?';
	@override String get allowEditing => 'Povolit úpravy';
}

// Path: editor.quill
class _Translations$editor$quill$cs extends Translations$editor$quill$en {
	_Translations$editor$quill$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Něco sem napište...';
}

// Path: editor.hud
class _Translations$editor$hud$cs extends Translations$editor$hud$en {
	_Translations$editor$hud$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Odemknout přibližování';
	@override String get lockZoom => 'Zamknout přibližování';
	@override String get unlockSingleFingerPan => 'Odemknout posouvání jedním prsem';
	@override String get lockSingleFingerPan => 'Zamknout posouvání jedním prsem';
	@override String get unlockAxisAlignedPan => 'Odemknout horizontální a vertikální posouvání';
	@override String get lockAxisAlignedPan => 'Zamknout horizontální a vertikální posouvání';
}

// Path: sentry.consent.description
class _Translations$sentry$consent$description$cs extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get question => 'Chtěli byste automaticky nahlašovat neočekávané chyby? Pomohlo by mi to s rychlejší identifikací a opravou.';
	@override String get scope => 'Hlášení mohou obsahovat informace o chybě a vašem zařízení. Dělal jsem, co bylo v mých silách, abych odfiltroval osobní data, ale i tak mohou některá zůstat.';
	@override String get currentlyOff => 'Nahlašování chyb se v případě udělení souhlasu zapne po restartu aplikace.';
	@override String get currentlyOn => 'Po odvolání souhlasu prosím restartujte aplikaci, abyste nahlašování chyb vypnuli.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Více se dozvíte v '),
		link('Zásadách ochrany osobních údajů'),
		const TextSpan(text: ' (anglicky).'),
	]);
}

// Path: sentry.consent.answers
class _Translations$sentry$consent$answers$cs extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Ano';
	@override String get no => 'Ne';
	@override String get later => 'Odložit na později';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$cs extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Zabraňuje nechtěnému přepnutí';
	@override String get fixedOn => 'Kreslení prstem je napevno zapnuté';
	@override String get fixedOff => 'Kreslení prstem je napevno vypnuté';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$cs extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get active => 'Aktivní';
	@override String get inactive => 'Neaktivní';
	@override String get activeUntilRestart => 'Aktivní, dokud nerestartujete aplikaci';
	@override String get inactiveUntilRestart => 'Neaktivní, dokud nerestartujete aplikaci';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$cs extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Autorizujte prosím aplikaci Saber k přístupu na váš Nextcloud účet';
	@override String get followPrompts => 'Následujte prosím kroky v rozhraní Nextcloud serveru';
	@override String get browserDidntOpen => 'Neotevřela se přihlašovací stránka? Klepněte zde';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$cs extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Co je to heslo pro šifrování? Proč používat dvě hesla?';
	@override String get a => 'Heslo k Nextcloud účtu se používá pro přístup do cloudu. Heslo pro šifrování „zamaskuje“ vaše data dokonce ještě, než dorazí na cloud.\nI kdyby někdo získal přístup k vašemu Nextcloud účtu, vaše poznámky zůstanou v bezpečí, zašifrované oddělným heslem. To vám přináší druhou úroveň bezpečnosti ochrany vašich dat.\nNikdo k vašim poznámkám nemůže přistoupit bez hesla pro šifrování, což ale také znamená, že pokud své heslo pro šifrování zapomenete, ztratíte přístup ke svým datům.';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$cs extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Ještě jsem heslo pro šifrování nenastavoval. Kde ho získám?';
	@override String get a => 'Zvolte si nové heslo pro šifrování a zadejte ho výše.\nAplikace Saber z hesla automaticky vygeneruje šifrovací klíče.';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$cs extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Mohu jako heslo pro šifrování použít své heslo od Nextcloud účtu?';
	@override String get a => 'Ano, ale mějte na paměti, že bude pro administrátora Nextcloud serveru či kohokoliv jiného, kdo získá přístup k vašemu Nextcloud účtu, jednodušší získat přístup k vašim poznámkám.';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$cs extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Roztáhnout';
	@override String get cover => 'Vyplnit';
	@override String get contain => 'Přizpůsobit';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$cs extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get none => 'Žádný';
	@override String get college => 'Linky s okrajem';
	@override String get collegeRtl => 'Linky s okrajem (obráceně)';
	@override String get lined => 'Linky';
	@override String get grid => 'Čtverečky';
	@override String get dots => 'Tečkovaná mřížka';
	@override String get staffs => 'Notová osnova';
	@override String get tablature => 'Tabulatura';
	@override String get cornell => 'Cornellova metoda';
}
