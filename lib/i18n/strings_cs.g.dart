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
class TranslationsCs extends Translations {
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
	@override late final _TranslationsCommonCs common = _TranslationsCommonCs._(_root);
	@override late final _TranslationsHomeCs home = _TranslationsHomeCs._(_root);
	@override late final _TranslationsSettingsCs settings = _TranslationsSettingsCs._(_root);
	@override late final _TranslationsLogsCs logs = _TranslationsLogsCs._(_root);
	@override late final _TranslationsLoginCs login = _TranslationsLoginCs._(_root);
	@override late final _TranslationsProfileCs profile = _TranslationsProfileCs._(_root);
	@override late final _TranslationsAppInfoCs appInfo = _TranslationsAppInfoCs._(_root);
	@override late final _TranslationsUpdateCs update = _TranslationsUpdateCs._(_root);
	@override late final _TranslationsEditorCs editor = _TranslationsEditorCs._(_root);
}

// Path: common
class _TranslationsCommonCs extends TranslationsCommonEn {
	_TranslationsCommonCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get done => 'Dokončit';
	@override String get continueBtn => 'Pokračovat';
	@override String get cancel => 'Zrušit';
}

// Path: home
class _TranslationsHomeCs extends TranslationsHomeEn {
	_TranslationsHomeCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsCs tabs = _TranslationsHomeTabsCs._(_root);
	@override late final _TranslationsHomeTitlesCs titles = _TranslationsHomeTitlesCs._(_root);
	@override late final _TranslationsHomeTooltipsCs tooltips = _TranslationsHomeTooltipsCs._(_root);
	@override late final _TranslationsHomeCreateCs create = _TranslationsHomeCreateCs._(_root);
	@override String get welcome => 'Vítejte v aplikaci Saber';
	@override String get invalidFormat => 'Vybrali jste nepodporovaný soubor. Vyberte prosím soubor s příponou .sbn, .sbn2, .sba nebo .pdf.';
	@override String get noFiles => 'Žádné poznámky nebyly nalezeny';
	@override String get noPreviewAvailable => 'Není k dispozici žádný náhled';
	@override String get createNewNote => 'Pro přidání nové poznámky klepněte na tlačítko +';
	@override String get backFolder => 'Přejít do předchozí složky';
	@override late final _TranslationsHomeNewFolderCs newFolder = _TranslationsHomeNewFolderCs._(_root);
	@override late final _TranslationsHomeRenameNoteCs renameNote = _TranslationsHomeRenameNoteCs._(_root);
	@override late final _TranslationsHomeMoveNoteCs moveNote = _TranslationsHomeMoveNoteCs._(_root);
	@override String get deleteNote => 'Odstranit poznámku';
	@override late final _TranslationsHomeRenameFolderCs renameFolder = _TranslationsHomeRenameFolderCs._(_root);
	@override late final _TranslationsHomeDeleteFolderCs deleteFolder = _TranslationsHomeDeleteFolderCs._(_root);
}

// Path: settings
class _TranslationsSettingsCs extends TranslationsSettingsEn {
	_TranslationsSettingsCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesCs prefCategories = _TranslationsSettingsPrefCategoriesCs._(_root);
	@override late final _TranslationsSettingsPrefLabelsCs prefLabels = _TranslationsSettingsPrefLabelsCs._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsCs prefDescriptions = _TranslationsSettingsPrefDescriptionsCs._(_root);
	@override late final _TranslationsSettingsThemeModesCs themeModes = _TranslationsSettingsThemeModesCs._(_root);
	@override late final _TranslationsSettingsLayoutSizesCs layoutSizes = _TranslationsSettingsLayoutSizesCs._(_root);
	@override late final _TranslationsSettingsAccentColorPickerCs accentColorPicker = _TranslationsSettingsAccentColorPickerCs._(_root);
	@override String get systemLanguage => 'Systémový jazyk';
	@override List<String> get axisDirections => [
		'Nahoře',
		'Vpravo',
		'Dole',
		'Vlevo',
	];
	@override late final _TranslationsSettingsResetCs reset = _TranslationsSettingsResetCs._(_root);
	@override String get resyncEverything => 'Znovu synchronizovat všechny poznámky';
	@override String get openDataDir => 'Otevřít složku aplikace Saber';
	@override late final _TranslationsSettingsCustomDataDirCs customDataDir = _TranslationsSettingsCustomDataDirCs._(_root);
}

// Path: logs
class _TranslationsLogsCs extends TranslationsLogsEn {
	_TranslationsLogsCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Logy';
	@override String get viewLogs => 'Zobrazit logy';
	@override String get debuggingInfo => 'Logy obsahují informace užitečné pro ladění a vývoj';
	@override String get noLogs => 'Nejsou k dispozici žádné logy!';
	@override String get logsAreTemporary => 'Logy jsou zachovány pouze do uzavření aplikace';
}

// Path: login
class _TranslationsLoginCs extends TranslationsLoginEn {
	_TranslationsLoginCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Přihlášení';
	@override late final _TranslationsLoginFormCs form = _TranslationsLoginFormCs._(_root);
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
	@override late final _TranslationsLoginStatusCs status = _TranslationsLoginStatusCs._(_root);
	@override late final _TranslationsLoginNcLoginStepCs ncLoginStep = _TranslationsLoginNcLoginStepCs._(_root);
	@override late final _TranslationsLoginEncLoginStepCs encLoginStep = _TranslationsLoginEncLoginStepCs._(_root);
}

// Path: profile
class _TranslationsProfileCs extends TranslationsProfileEn {
	_TranslationsProfileCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Můj profil';
	@override String get logout => 'Odhlásit se';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Využíváte ${used} z ${total} (${percent} %)';
	@override String get connectedTo => 'Připojeno k';
	@override late final _TranslationsProfileQuickLinksCs quickLinks = _TranslationsProfileQuickLinksCs._(_root);
	@override String get faqTitle => 'Často kladené otázky';
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$Cs._(_root),
		_TranslationsProfile$faq$0i1$Cs._(_root),
		_TranslationsProfile$faq$0i2$Cs._(_root),
		_TranslationsProfile$faq$0i3$Cs._(_root),
	];
}

// Path: appInfo
class _TranslationsAppInfoCs extends TranslationsAppInfoEn {
	_TranslationsAppInfoCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nTento program je poskytován bez jakékoliv záruky. Jedná se o software poskytovaný zdarma, který je možné šířit při splnění určitých podmínek.';
	@override String get dirty => 'ZKUŠEBNÍ VERZE';
	@override String get debug => 'LADÍCÍ VERZE';
	@override String get sponsorButton => 'Klepněte sem, pokud mě chcete sponzorovat nebo si přikoupit úložiště';
	@override String get licenseButton => 'Klepněte sem pro zobrazení podrobnějších licenčních informací';
	@override String get privacyPolicyButton => 'Klepněte sem pro zobrazení zásad ochrany osobních údajů';
}

// Path: update
class _TranslationsUpdateCs extends TranslationsUpdateEn {
	_TranslationsUpdateCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Aktualizace k dispozici';
	@override String get updateAvailableDescription => 'Je k dispozici nová verze aplikace:';
	@override String get update => 'Aktualizovat';
	@override String get downloadNotAvailableYet => 'Pro vaši platformu zatím není stažení aplikace dostupné. Zkuste to prosím o něco později.';
}

// Path: editor
class _TranslationsEditorCs extends TranslationsEditorEn {
	_TranslationsEditorCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarCs toolbar = _TranslationsEditorToolbarCs._(_root);
	@override late final _TranslationsEditorPensCs pens = _TranslationsEditorPensCs._(_root);
	@override late final _TranslationsEditorPenOptionsCs penOptions = _TranslationsEditorPenOptionsCs._(_root);
	@override late final _TranslationsEditorColorsCs colors = _TranslationsEditorColorsCs._(_root);
	@override late final _TranslationsEditorImageOptionsCs imageOptions = _TranslationsEditorImageOptionsCs._(_root);
	@override late final _TranslationsEditorSelectionBarCs selectionBar = _TranslationsEditorSelectionBarCs._(_root);
	@override late final _TranslationsEditorMenuCs menu = _TranslationsEditorMenuCs._(_root);
	@override late final _TranslationsEditorNewerFileFormatCs newerFileFormat = _TranslationsEditorNewerFileFormatCs._(_root);
	@override late final _TranslationsEditorQuillCs quill = _TranslationsEditorQuillCs._(_root);
	@override late final _TranslationsEditorHudCs hud = _TranslationsEditorHudCs._(_root);
	@override String get pages => 'Stránky';
	@override String get untitled => 'Nepojmenovaná poznámka';
	@override String get needsToSaveBeforeExiting => 'Ukládání změn... Po skončení této operace můžete editor bezpečně opustit';
}

// Path: home.tabs
class _TranslationsHomeTabsCs extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Domů';
	@override String get browse => 'Poznámky';
	@override String get whiteboard => 'Tabule';
	@override String get settings => 'Nastavení';
}

// Path: home.titles
class _TranslationsHomeTitlesCs extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Poslední poznámky';
	@override String get browse => 'Procházet poznámky';
	@override String get whiteboard => 'Tabule';
	@override String get settings => 'Nastavení';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsCs extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nová poznámka';
	@override String get showUpdateDialog => 'Zobrazit dialogové okno aktualizace';
	@override String get exportNote => 'Exportovat poznámku';
}

// Path: home.create
class _TranslationsHomeCreateCs extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nová poznámka';
	@override String get importNote => 'Import poznámky';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderCs extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderCs._(TranslationsCs root) : this._root = root, super.internal(root);

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
class _TranslationsHomeRenameNoteCs extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Přejmenovat poznámku';
	@override String get noteName => 'Nový název poznámky';
	@override String get rename => 'Přejmenovat';
	@override String get noteNameEmpty => 'Název poznámky nemůže být prázdný';
	@override String get noteNameContainsSlash => 'Název poznámky nemůže obsahovat lomítko';
	@override String get noteNameExists => 'Poznámka s tímto názvem již existuje';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteCs extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteCs._(TranslationsCs root) : this._root = root, super.internal(root);

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

// Path: home.renameFolder
class _TranslationsHomeRenameFolderCs extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderCs._(TranslationsCs root) : this._root = root, super.internal(root);

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
class _TranslationsHomeDeleteFolderCs extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Odstranit složku';
	@override String deleteName({required Object f}) => 'Odstranění složky ${f}';
	@override String get delete => 'Odstranit';
	@override String get alsoDeleteContents => 'Se složkou odstranit i obsažené poznámky';
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesCs extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get general => 'Obecné';
	@override String get writing => 'Psaní';
	@override String get editor => 'Editor';
	@override String get performance => 'Výkon';
	@override String get advanced => 'Pokročilé';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsCs extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Jazyk aplikace';
	@override String get appTheme => 'Barva motivu';
	@override String get platform => 'Motiv';
	@override String get layoutSize => 'Rozložení uživatelského rozhraní';
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
	@override String get editorPromptRename => 'Vybízet k přejmenování nových poznámek';
	@override String get hideHomeBackgrounds => 'Skrýt pozadí poznámek na hlavní obrazovce';
	@override String get recentColorsDontSavePresets => 'Neukládat přednastavené barvy mezi naposledy použité barvy';
	@override String get recentColorsLength => 'Kolik naposledy použitých barev se má ukládat';
	@override String get printPageIndicators => 'Tisknout čísla stránek';
	@override String get autosaveDelay => 'Zpoždění automatického ukládání';
	@override String get shapeRecognitionDelay => 'Zpoždění rozpoznávání tvarů';
	@override String get autoStraightenLines => 'Automaticky narovnávat čáry';
	@override String get simplifiedHomeLayout => 'Zjednodušené rozložení domovské obrazovky';
	@override String get customDataDir => 'Vlastní umístění složky aplikace Saber';
	@override String get pencilSoundSetting => 'Zvukový efekt psaní tužkou';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsCs extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Font Atkinson Hyperlegible zvyšuje čitelnost pro čtenáře se slabým zrakem';
	@override String get allowInsecureConnections => '(Nedoporučuje se) Povolit aplikaci Saber připojovat se k serverům se samopodepsaným/nedůvěryhodným certifikátem.';
	@override String get preferGreyscale => 'Pro elektronické čtečky knih s e-ink displejem';
	@override String get autoClearWhiteboardOnExit => 'Bude synchronizováno do dalších zařízení';
	@override String get disableEraserAfterUse => 'Po použití gumy automaticky přepnout zpět na pero';
	@override String get maxImageSize => 'Na větší obrázky bude aplikována komprese';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingCs hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingCs._(_root);
	@override String get editorPromptRename => 'Poznámky můžete vždy přejmenovat i později';
	@override String get hideHomeBackgrounds => 'Pro čistější vzhled';
	@override String get printPageIndicators => 'V exportech budou zobrazena čísla stránek';
	@override String get autosaveDelay => 'Jak dlouho počkat před automatickým uložením poznámky';
	@override String get shapeRecognitionDelay => 'Jak často aktualizovat náhled tvaru';
	@override String get autoStraightenLines => 'Automaticky narovná dlouhé čáry, aniž by bylo nutné využít tvarové pero';
	@override String get simplifiedHomeLayout => 'Nastaví pevnou výšku pro každý náhled poznámky';
	@override String get shouldAlwaysAlertForUpdates => 'Oznámit dostupnost aktualizací co nejdříve od jejich vydání';
	@override late final _TranslationsSettingsPrefDescriptionsPencilSoundSettingCs pencilSoundSetting = _TranslationsSettingsPrefDescriptionsPencilSoundSettingCs._(_root);
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesCs extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get system => 'Systémový';
	@override String get light => 'Světlý';
	@override String get dark => 'Tmavý';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesCs extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Automatické';
	@override String get phone => 'Telefon';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerCs extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Výběr vlastní barvy';
}

// Path: settings.reset
class _TranslationsSettingsResetCs extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chcete resetovat tuto volbu?';
	@override String get button => 'Resetovat';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirCs extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Zrušit';
	@override String get select => 'Zvolit';
	@override String get mustBeEmpty => 'Zvolená složka musí být prázdná';
	@override String get mustBeDoneSyncing => 'Než změníte složku, ujistěte se, že byla dokončena synchronizace';
}

// Path: login.form
class _TranslationsLoginFormCs extends TranslationsLoginFormEn {
	_TranslationsLoginFormCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Přihlášením souhlasíte se '),
		linkToPrivacyPolicy('Zásadami ochrany osobních údajů'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusCs extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Jste odhlášení';
	@override String get tapToLogin => 'Klepněte pro přihlášení pomocí Nextcloud účtu';
	@override String hi({required Object u}) => 'Zdravím, ${u}!';
	@override String get almostDone => 'Synchronizace je téměř připravena, pro dokončení přihlášení klepněte sem';
	@override String get loggedIn => 'Jste přihlášeni pomocí Nextcloud účtu';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepCs extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'Zvolte si, kam chcete ukládat svá data:';
	@override String get saberNcServer => 'Oficiální Nextcloud server aplikace Saber';
	@override String get otherNcServer => 'Jiný Nextcloud server';
	@override String get serverUrl => 'URL adresa serveru';
	@override String get loginWithSaber => 'Přihlásit přes aplikaci Saber';
	@override String get loginWithNextcloud => 'Přihlásit přes Nextcloud server';
	@override late final _TranslationsLoginNcLoginStepLoginFlowCs loginFlow = _TranslationsLoginNcLoginStepLoginFlowCs._(_root);
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepCs extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Pro ochranu svých dat prosím zadejte heslo pro šifrování:';
	@override String get newToSaber => 'Poprvé v aplikaci Saber? Stačí zadat nové heslo pro šifrování.';
	@override String get encPassword => 'Heslo pro šifrování';
	@override String get encFaqTitle => 'Často kladené otázky';
	@override String get wrongEncPassword => 'Dešifrování pomocí zadaného hesla pro šifrování selhalo. Zkuste ho prosím zadat znovu.';
	@override String get connectionFailed => 'Při připojování k serveru se něco pokazilo. Zkuste to prosím později.';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$Cs._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$Cs._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$Cs._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksCs extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Webové stránky serveru';
	@override String get deleteAccount => 'Odstranit účet';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$Cs extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$Cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Ztratím po odhlášení svoje poznámky?';
	@override String get a => 'Nikoliv. Vaše poznámky zůstanou jak na vašem zařízení, tak na serveru. Dokud se opět nepřihlásíte, nebudou synchronizovány se serverem. Před ohlášením se ujistěte, že byla dokončena synchronizace, abyste předešli ztrátě dat (průběh synchronizace uvidíte na domovské obrazovce).';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$Cs extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$Cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Jak změním své heslo k Nextcloud účtu?';
	@override String get a => 'Přejděte na webovou stránku vašeho serveru a přihlašte se. Poté přejděte do Nastavení > Zabezpečení > Změnit heslo. Po změně hesla se budete muset odhlásit z aplikace Saber a poté se do ní opětovně přihlásit.';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$Cs extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$Cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Jak změním své heslo pro šifrování?';
	@override String get a => '1. Odhlašte se z aplikace Saber. Před odhlášením se ujistěte, že byla dokončena synchronizace a nepřijdete o žádná data (průběh synchronizace uvidíte na domovské obrazovce).\n2. Přejděte na webovou stránku vašeho serveru a smažte složku „Saber“. Tím ze serveru odstraníte všechny poznámky.\n3. Opětovně se přihlašte do aplikace Saber. Při přihlašování můžete zvolit nové heslo pro šifrování.\n4. Nezapomeňte se z aplikace Saber odhlásit a opětovně se do ní přihlásit na ostatních zařízeních.';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$Cs extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$Cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Jak odstraním svůj účet?';
	@override String get a => 'Klepněte na tlačítko „${_root.profile.quickLinks.deleteAccount}“ umístěné výše a přihlašte se, pokud to bude vyžadováno.\nPokud používáte oficiální server od aplikace Saber, bude váš účet odstraněn po uplynutí týdenní ochranné lhůty. Během této lhůty mě můžete kontaktovat pro odvolání zrušení účtu na adilhanney@disroot.org.\nPokud používáte server třetí strany, nemusí nabízet možnost odstranění účtu: pro více informací se bude třeba obrátit na zásady ochrany osobních údajů daného serveru.';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarCs extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarCs._(TranslationsCs root) : this._root = root, super.internal(root);

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
class _TranslationsEditorPensCs extends TranslationsEditorPensEn {
	_TranslationsEditorPensCs._(TranslationsCs root) : this._root = root, super.internal(root);

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
class _TranslationsEditorPenOptionsCs extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get size => 'Velikost';
}

// Path: editor.colors
class _TranslationsEditorColorsCs extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Vybrat vlastní barvu';
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
class _TranslationsEditorImageOptionsCs extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Možnosti obrázku';
	@override String get invertible => 'Invertovat barvy podle motivu';
	@override String get download => 'Stáhnout';
	@override String get setAsBackground => 'Nastavit na pozadí';
	@override String get removeAsBackground => 'Odstranit obrázek z pozadí';
	@override String get delete => 'Odstranit';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarCs extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Odstranit';
	@override String get duplicate => 'Duplikovat';
}

// Path: editor.menu
class _TranslationsEditorMenuCs extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuCs._(TranslationsCs root) : this._root = root, super.internal(root);

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
	@override String get backgroundImageFit => 'Rozložení obrázku na pozadí';
	@override String get backgroundPattern => 'Vzor na pozadí';
	@override String get import => 'Importovat';
	@override String get watchServer => 'Sledovat aktualizace ze serveru';
	@override String get watchServerReadOnly => 'Během sledování serveru je vypnuto editování';
	@override late final _TranslationsEditorMenuBoxFitsCs boxFits = _TranslationsEditorMenuBoxFitsCs._(_root);
	@override late final _TranslationsEditorMenuBgPatternsCs bgPatterns = _TranslationsEditorMenuBgPatternsCs._(_root);
}

// Path: editor.newerFileFormat
class _TranslationsEditorNewerFileFormatCs extends TranslationsEditorNewerFileFormatEn {
	_TranslationsEditorNewerFileFormatCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Otevřít v režimu pouze pro čtení';
	@override String get title => 'Tato poznámka byla upravena v novější verzi aplikace Saber';
	@override String get subtitle => 'Úpravou této poznámky můžete přijít o některé informace. Přejete tuto skutečnost ignorovat a přesto pokračovat k úpravě poznámky?';
	@override String get allowEditing => 'Povolit úpravy';
}

// Path: editor.quill
class _TranslationsEditorQuillCs extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Něco sem napište...';
}

// Path: editor.hud
class _TranslationsEditorHudCs extends TranslationsEditorHudEn {
	_TranslationsEditorHudCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Odemknout přibližování';
	@override String get lockZoom => 'Zamknout přibližování';
	@override String get unlockSingleFingerPan => 'Odemknout posouvání jedním prsem';
	@override String get lockSingleFingerPan => 'Zamknout posouvání jedním prsem';
	@override String get unlockAxisAlignedPan => 'Odemknout horizontální a vertikální posouvání';
	@override String get lockAxisAlignedPan => 'Zamknout horizontální a vertikální posouvání';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingCs extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Zabraňuje nechtěnému přepnutí';
	@override String get fixedOn => 'Kreslení prstem je napevno zapnuté';
	@override String get fixedOff => 'Kreslení prstem je napevno vypnuté';
}

// Path: settings.prefDescriptions.pencilSoundSetting
class _TranslationsSettingsPrefDescriptionsPencilSoundSettingCs extends TranslationsSettingsPrefDescriptionsPencilSoundSettingEn {
	_TranslationsSettingsPrefDescriptionsPencilSoundSettingCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get off => 'Bez zvuku';
	@override String get onButNotInSilentMode => 'Zapnuto (mimo tichý režim)';
	@override String get onAlways => 'Zapnuto (i v tichém režimu)';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowCs extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Autorizujte prosím aplikaci Saber k přístupu na váš Nextcloud účet';
	@override String get followPrompts => 'Následujte prosím kroky v rozhraní Nextcloud serveru';
	@override String get browserDidntOpen => 'Neotevřela se přihlašovací stránka? Klepněte zde';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$Cs extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$Cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Co je to heslo pro šifrování? Proč používat dvě hesla?';
	@override String get a => 'Heslo k Nextcloud účtu se používá pro přístup do cloudu. Heslo pro šifrování „zamaskuje“ vaše data dokonce ještě, než dorazí na cloud.\nI kdyby někdo získal přístup k vašemu Nextcloud účtu, vaše poznámky zůstanou v bezpečí, zašifrované oddělným heslem. To vám přináší druhou úroveň bezpečnosti ochrany vašich dat.\nNikdo k vašim poznámkám nemůže přistoupit bez hesla pro šifrování, což ale také znamená, že pokud své heslo pro šifrování zapomenete, ztratíte přístup ke svým datům.';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$Cs extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$Cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Ještě jsem heslo pro šifrování nenastavoval. Kde ho získám?';
	@override String get a => 'Zvolte si nové heslo pro šifrování a zadejte ho výše.\nAplikace Saber z hesla automaticky vygeneruje šifrovací klíče.';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$Cs extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$Cs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Mohu jako heslo pro šifrování použít své heslo od Nextcloud účtu?';
	@override String get a => 'Ano, ale mějte na paměti, že bude pro administrátora Nextcloud serveru či kohokoliv jiného, kdo získá přístup k vašemu Nextcloud účtu, jednodušší získat přístup k vašim poznámkám.';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsCs extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsCs._(TranslationsCs root) : this._root = root, super.internal(root);

	final TranslationsCs _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Roztáhnout';
	@override String get cover => 'Vyplnit';
	@override String get contain => 'Přizpůsobit';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsCs extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsCs._(TranslationsCs root) : this._root = root, super.internal(root);

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
