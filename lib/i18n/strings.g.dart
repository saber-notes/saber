/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 16
/// Strings: 3966 (247 per locale)
///
/// Built on 2023-10-30 at 22:46 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	ar(languageCode: 'ar', build: _StringsAr.build),
	cs(languageCode: 'cs', build: _StringsCs.build),
	de(languageCode: 'de', build: _StringsDe.build),
	es(languageCode: 'es', build: _StringsEs.build),
	fa(languageCode: 'fa', build: _StringsFa.build),
	fr(languageCode: 'fr', build: _StringsFr.build),
	he(languageCode: 'he', build: _StringsHe.build),
	hu(languageCode: 'hu', build: _StringsHu.build),
	it(languageCode: 'it', build: _StringsIt.build),
	ja(languageCode: 'ja', build: _StringsJa.build),
	ptBr(languageCode: 'pt', countryCode: 'BR', build: _StringsPtBr.build),
	ru(languageCode: 'ru', build: _StringsRu.build),
	tr(languageCode: 'tr', build: _StringsTr.build),
	zhHansCn(languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN', build: _StringsZhHansCn.build),
	zhHantTw(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW', build: _StringsZhHantTw.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  );

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	late final _StringsHomeEn home = _StringsHomeEn._(_root);
	late final _StringsSettingsEn settings = _StringsSettingsEn._(_root);
	late final _StringsLoginEn login = _StringsLoginEn._(_root);
	late final _StringsProfileEn profile = _StringsProfileEn._(_root);
	late final _StringsAppInfoEn appInfo = _StringsAppInfoEn._(_root);
	late final _StringsUpdateEn update = _StringsUpdateEn._(_root);
	late final _StringsEditorEn editor = _StringsEditorEn._(_root);
}

// Path: home
class _StringsHomeEn {
	_StringsHomeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsHomeTabsEn tabs = _StringsHomeTabsEn._(_root);
	late final _StringsHomeTitlesEn titles = _StringsHomeTitlesEn._(_root);
	late final _StringsHomeTooltipsEn tooltips = _StringsHomeTooltipsEn._(_root);
	late final _StringsHomeCreateEn create = _StringsHomeCreateEn._(_root);
	String get welcome => 'Welcome to Saber';
	String get invalidFormat => 'The file you selected is not supported. Please select a .sbn, .sbn2 or .pdf file.';
	String get noFiles => 'No files found';
	String get createNewNote => 'Tap the + button to create a new note';
	String get backFolder => 'Go back to the previous folder';
	late final _StringsHomeNewFolderEn newFolder = _StringsHomeNewFolderEn._(_root);
	late final _StringsHomeRenameNoteEn renameNote = _StringsHomeRenameNoteEn._(_root);
	late final _StringsHomeMoveNoteEn moveNote = _StringsHomeMoveNoteEn._(_root);
	String get deleteNote => 'Delete note';
	late final _StringsHomeRenameFolderEn renameFolder = _StringsHomeRenameFolderEn._(_root);
	late final _StringsHomeDeleteFolderEn deleteFolder = _StringsHomeDeleteFolderEn._(_root);
}

// Path: settings
class _StringsSettingsEn {
	_StringsSettingsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsSettingsPrefCategoriesEn prefCategories = _StringsSettingsPrefCategoriesEn._(_root);
	late final _StringsSettingsPrefLabelsEn prefLabels = _StringsSettingsPrefLabelsEn._(_root);
	late final _StringsSettingsPrefDescriptionsEn prefDescriptions = _StringsSettingsPrefDescriptionsEn._(_root);
	late final _StringsSettingsThemeModesEn themeModes = _StringsSettingsThemeModesEn._(_root);
	late final _StringsSettingsLayoutSizesEn layoutSizes = _StringsSettingsLayoutSizesEn._(_root);
	late final _StringsSettingsAccentColorPickerEn accentColorPicker = _StringsSettingsAccentColorPickerEn._(_root);
	String get systemLanguage => 'Default';
	List<String> get axisDirections => [
		'Top',
		'Right',
		'Bottom',
		'Left',
	];
	late final _StringsSettingsResetEn reset = _StringsSettingsResetEn._(_root);
}

// Path: login
class _StringsLoginEn {
	_StringsLoginEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Login';
	late final _StringsLoginFeedbacksEn feedbacks = _StringsLoginFeedbacksEn._(_root);
	late final _StringsLoginFormEn form = _StringsLoginFormEn._(_root);
	TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Don\'t have an account yet? '),
		linkToSignup('Sign up now'),
		const TextSpan(text: '!'),
	]);
	late final _StringsLoginStatusEn status = _StringsLoginStatusEn._(_root);
	List<dynamic> get faq => [
		_StringsLogin$faq$0i0$En._(_root),
		_StringsLogin$faq$0i1$En._(_root),
		_StringsLogin$faq$0i2$En._(_root),
		_StringsLogin$faq$0i3$En._(_root),
		_StringsLogin$faq$0i4$En._(_root),
	];
}

// Path: profile
class _StringsProfileEn {
	_StringsProfileEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'My profile';
	String get logout => 'Log out';
	late final _StringsProfileQuickLinksEn quickLinks = _StringsProfileQuickLinksEn._(_root);
	List<dynamic> get faq => [
		_StringsProfile$faq$0i0$En._(_root),
		_StringsProfile$faq$0i1$En._(_root),
		_StringsProfile$faq$0i2$En._(_root),
		_StringsProfile$faq$0i3$En._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoEn {
	_StringsAppInfoEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
	String get dirty => 'DIRTY';
	String get debug => 'DEBUG';
	String get sponsorButton => 'Tap here to sponsor me or buy more storage';
	String get licenseButton => 'Tap here to view more license information';
	String get privacyPolicyButton => 'Tap here to view the privacy policy';
}

// Path: update
class _StringsUpdateEn {
	_StringsUpdateEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get updateAvailable => 'Update available';
	String get updateAvailableDescription => 'A new version of the app is available, with these changes:';
	String get update => 'Update';
}

// Path: editor
class _StringsEditorEn {
	_StringsEditorEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsEditorToolbarEn toolbar = _StringsEditorToolbarEn._(_root);
	late final _StringsEditorPensEn pens = _StringsEditorPensEn._(_root);
	late final _StringsEditorPenOptionsEn penOptions = _StringsEditorPenOptionsEn._(_root);
	late final _StringsEditorColorsEn colors = _StringsEditorColorsEn._(_root);
	late final _StringsEditorImageOptionsEn imageOptions = _StringsEditorImageOptionsEn._(_root);
	late final _StringsEditorSelectionBarEn selectionBar = _StringsEditorSelectionBarEn._(_root);
	late final _StringsEditorMenuEn menu = _StringsEditorMenuEn._(_root);
	late final _StringsEditorNewerFileFormatEn newerFileFormat = _StringsEditorNewerFileFormatEn._(_root);
	late final _StringsEditorQuillEn quill = _StringsEditorQuillEn._(_root);
	late final _StringsEditorHudEn hud = _StringsEditorHudEn._(_root);
	String get pages => 'Pages';
	String get untitled => 'Untitled';
	String get needsToSaveBeforeExiting => 'Saving your changes... You can safely exit the editor when it\'s done';
}

// Path: home.tabs
class _StringsHomeTabsEn {
	_StringsHomeTabsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get home => 'Home';
	String get browse => 'Browse';
	String get whiteboard => 'Whiteboard';
	String get settings => 'Settings';
}

// Path: home.titles
class _StringsHomeTitlesEn {
	_StringsHomeTitlesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get home => 'Recent notes';
	String get browse => 'Browse';
	String get whiteboard => 'Whiteboard';
	String get settings => 'Settings';
}

// Path: home.tooltips
class _StringsHomeTooltipsEn {
	_StringsHomeTooltipsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get newNote => 'New note';
	String get showUpdateDialog => 'Show update dialog';
}

// Path: home.create
class _StringsHomeCreateEn {
	_StringsHomeCreateEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get newNote => 'New note';
	String get importNote => 'Import note';
}

// Path: home.newFolder
class _StringsHomeNewFolderEn {
	_StringsHomeNewFolderEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get newFolder => 'New folder';
	String get folderName => 'Folder name';
	String get create => 'Create';
	String get folderNameEmpty => 'Folder name can\'t be empty';
	String get folderNameContainsSlash => 'Folder name can\'t contain a slash';
	String get folderNameExists => 'Folder already exists';
}

// Path: home.renameNote
class _StringsHomeRenameNoteEn {
	_StringsHomeRenameNoteEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get renameNote => 'Rename note';
	String get noteName => 'Note name';
	String get rename => 'Rename';
	String get noteNameEmpty => 'Note name can\'t be empty';
	String get noteNameContainsSlash => 'Note name can\'t contain a slash';
	String get noteNameExists => 'A note with this name already exists';
}

// Path: home.moveNote
class _StringsHomeMoveNoteEn {
	_StringsHomeMoveNoteEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get moveNote => 'Move note';
	String moveNotes({required Object n}) => 'Move ${n} notes';
	String moveName({required Object f}) => 'Move ${f}';
	String get move => 'Move';
	String renamedTo({required Object newName}) => 'Note will be renamed to ${newName}';
	String get multipleRenamedTo => 'The following notes will be renamed:';
	String numberRenamedTo({required Object n}) => '${n} notes will be renamed to avoid conflicts';
}

// Path: home.renameFolder
class _StringsHomeRenameFolderEn {
	_StringsHomeRenameFolderEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get renameFolder => 'Rename folder';
	String get folderName => 'Folder name';
	String get rename => 'Rename';
	String get folderNameEmpty => 'Folder name can\'t be empty';
	String get folderNameContainsSlash => 'Folder name can\'t contain a slash';
	String get folderNameExists => 'A folder with this name already exists';
}

// Path: home.deleteFolder
class _StringsHomeDeleteFolderEn {
	_StringsHomeDeleteFolderEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get deleteFolder => 'Delete folder';
	String deleteName({required Object f}) => 'Delete ${f}';
	String get delete => 'Delete';
	String get alsoDeleteContents => 'Also delete all notes inside this folder';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get general => 'General';
	String get writing => 'Writing';
	String get editor => 'Editor';
	String get advanced => 'Advanced';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get locale => 'App language';
	String get appTheme => 'App theme';
	String get platform => 'Theme type';
	String get layoutSize => 'Layout type';
	String get customAccentColor => 'Custom accent color';
	String get hyperlegibleFont => 'Atkinson Hyperlegible font';
	String get shouldCheckForUpdates => 'Check for Saber updates';
	String get shouldAlwaysAlertForUpdates => 'Faster updates';
	String get disableAds => 'Disable ads';
	String get changeAdsConsent => 'Change ads consent';
	String get allowInsecureConnections => 'Allow insecure connections';
	String get editorToolbarAlignment => 'Toolbar position';
	String get editorToolbarShowInFullscreen => 'Show the toolbar in fullscreen mode';
	String get editorAutoInvert => 'Invert notes in dark mode';
	String get editorOpaqueBackgrounds => 'Opaque backgrounds';
	String get preferGreyscale => 'Prefer greyscale colors';
	String get maxImageSize => 'Maximum image size';
	String get autoClearWhiteboardOnExit => 'Auto-clear the whiteboard';
	String get disableEraserAfterUse => 'Auto-disable the eraser';
	String get hideFingerDrawingToggle => 'Hide the finger drawing toggle';
	String get editorPromptRename => 'Prompt you to rename new notes';
	String get hideHomeBackgrounds => 'Hide backgrounds on the home screen';
	String get recentColorsDontSavePresets => 'Don\'t save preset colors in recent colors';
	String get recentColorsLength => 'How many recent colors to store';
	String get printPageIndicators => 'Print page indicators';
	String get autosaveDelay => 'Auto-save delay';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get hyperlegibleFont => 'Increases legibility for users with low vision';
	String get disableAds => 'Ads help support Saber\'s development, but you can disable them if you\'d like';
	String get allowInsecureConnections => '(Not recommended) Allow Saber to connect to servers with self-signed/untrusted certificates';
	String get editorOpaqueBackgrounds => 'Remove transparency from background images and PDFs';
	String get preferGreyscale => 'For e-ink displays';
	String get autoClearWhiteboardOnExit => 'Clears the whiteboard after you exit the app';
	String get disableEraserAfterUse => 'Automatically switches back to the pen after using the eraser';
	String get maxImageSize => 'Larger images will be compressed';
	late final _StringsSettingsPrefDescriptionsHideFingerDrawingEn hideFingerDrawing = _StringsSettingsPrefDescriptionsHideFingerDrawingEn._(_root);
	String get editorPromptRename => 'You can always rename notes later';
	String get hideHomeBackgrounds => 'For a cleaner look';
	String get printPageIndicators => 'Show page indicators in exports';
	String get autosaveDelay => 'How long to wait before auto-saving a note';
	String get shouldAlwaysAlertForUpdates => 'Tell me about updates as soon as they\'re available';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get system => 'System';
	String get light => 'Light';
	String get dark => 'Dark';
}

// Path: settings.layoutSizes
class _StringsSettingsLayoutSizesEn {
	_StringsSettingsLayoutSizesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get auto => 'Auto';
	String get phone => 'Phone';
	String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get pickAColor => 'Pick a color';
}

// Path: settings.reset
class _StringsSettingsResetEn {
	_StringsSettingsResetEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Reset this setting?';
	String get button => 'Reset';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get checkUsername => 'Please double check your username or email.';
	String get enterNcPassword => 'Please enter your Nextcloud password.';
	String get enterEncPassword => 'Please enter your encryption password.';
	String get checkUrl => 'Please enter a valid URL.';
	String get ncLoginFailed => 'Log in failed, please check your details and network connection.';
	String ncUnsupportedFailure({required Object v, required Object s}) => 'The given server is running Nextcloud ${v} but this version of Saber only supports Nextcloud ${s}.';
	String get encLoginFailed => 'Log in failed, please check your encryption password.';
	String get loginSuccess => 'Log in successful! Please wait while we set up...';
}

// Path: login.form
class _StringsLoginFormEn {
	_StringsLoginFormEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get useCustomServer => 'I want to use a custom Nextcloud server';
	String get customServerUrl => 'Custom server URL';
	String get username => 'Username or email';
	String get ncPassword => 'Nextcloud password';
	String get encPassword => 'Encryption password';
	TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'By logging in, you agree to the '),
		linkToPrivacyPolicy('Privacy Policy'),
		const TextSpan(text: '.'),
	]);
	String get login => 'Log in';
}

// Path: login.status
class _StringsLoginStatusEn {
	_StringsLoginStatusEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get loggedIn => 'Logged in with Nextcloud';
	String get loggedOut => 'Logged out';
	String get tapToLogin => 'Tap to log in with Nextcloud';
}

// Path: login.faq.0
class _StringsLogin$faq$0i0$En {
	_StringsLogin$faq$0i0$En._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get q => 'What is Nextcloud?';
	String get a => 'Nextcloud is a private file sync server, among other things. You can use the default Saber Nextcloud server, use a third-party server, or self-host your own for full control of your data.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$En._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get q => 'What is the encryption password?';
	String get a => 'The encryption password is used to encrypt your data before it is sent to the server. You choose it when you first login to Saber, and it\'s not related to your Nextcloud account/password.\nNo-one can access your notes on the server without your encryption password. This also means that if you forget your encryption password, you will lose access to your data.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$En._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get q => 'Why use two passwords?';
	String get a => 'The Nextcloud password is used to access the cloud. The encryption password "scrambles" your data before it ever reaches the cloud.\nEven if someone gains access to your Nextcloud account, your notes will remain safe and encrypted with a separate password. This provides you a second layer of security to protect your data.';
}

// Path: login.faq.3
class _StringsLogin$faq$0i3$En {
	_StringsLogin$faq$0i3$En._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get q => 'How do I login if I use 2FA?';
	String get a => 'Instead of your regular Nextcloud password, you\'ll need to create an "app password". You can do this in your Nextcloud settings under Security > Devices & sessions > Create new app password. Your encryption password is unaffected.';
}

// Path: login.faq.4
class _StringsLogin$faq$0i4$En {
	_StringsLogin$faq$0i4$En._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get q => 'Can I use the same password for both?';
	String get a => 'Yes, but doing so is less secure. Since your Nextcloud password is sent to the server, someone with access to the server would be able to decrypt your notes. Only use the same password if you trust the server owner.';
}

// Path: profile.quickLinks
class _StringsProfileQuickLinksEn {
	_StringsProfileQuickLinksEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Quick links';
	String get serverHomepage => 'Server homepage';
	String get deleteAccount => 'Delete account';
}

// Path: profile.faq.0
class _StringsProfile$faq$0i0$En {
	_StringsProfile$faq$0i0$En._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get q => 'Will I lose my notes if I log out?';
	String get a => 'No. Your notes will remain both on your device and on the server. They won\'t be synced with the server until you log back in. Make sure syncing is complete before logging out so you don\'t lose any data (see the sync progress on the home screen).';
}

// Path: profile.faq.1
class _StringsProfile$faq$0i1$En {
	_StringsProfile$faq$0i1$En._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get q => 'How do I change my Nextcloud password?';
	String get a => 'Go to your server website and log in. Then go to Settings > Security > Change password. You\'ll need to log out and log back in to Saber after changing your password.';
}

// Path: profile.faq.2
class _StringsProfile$faq$0i2$En {
	_StringsProfile$faq$0i2$En._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get q => 'How do I change my encryption password?';
	String get a => '0. Make sure syncing is complete (see the sync progress on the home screen).\n1. Log out of Saber.\n2. Go to your server website and delete your \'Saber\' folder. This will delete all your notes from the server.\n3. Log back in to Saber. You can choose a new encryption password when logging in.\n4. Don\'t forget to log out and log back in to Saber on your other devices too.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$En._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get q => 'How can I delete my account?';
	String get a => 'Tap on the "${_root.profile.quickLinks.deleteAccount}" button above, and login if needed.\nIf you are using the official Saber server, your account will be deleted after a 1 week grace period. You can contact me at adilhanney@disroot.org during this period to cancel the deletion.\nIf you are using a third party server, there might not be an option to delete your account: you\'ll need to consult the server\'s privacy policy for more information.';
}

// Path: editor.toolbar
class _StringsEditorToolbarEn {
	_StringsEditorToolbarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get toggleColors => 'Toggle colors (Ctrl C)';
	String get select => 'Select';
	String get toggleEraser => 'Toggle eraser (Ctrl E)';
	String get photo => 'Images';
	String get text => 'Text';
	String get toggleFingerDrawing => 'Toggle finger drawing (Ctrl F)';
	String get undo => 'Undo';
	String get redo => 'Redo';
	String get export => 'Export (Ctrl Shift S)';
	String get exportAs => 'Export as:';
	String get fullscreen => 'Toggle fullscreen (F11)';
}

// Path: editor.pens
class _StringsEditorPensEn {
	_StringsEditorPensEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get fountainPen => 'Fountain pen';
	String get ballpointPen => 'Ballpoint pen';
	String get highlighter => 'Highlighter';
	String get shapePen => 'Shape pen';
	String get laserPointer => 'Laser pointer';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get size => 'Size';
	String get sizeDragHint => 'Drag left or right to change the size';
}

// Path: editor.colors
class _StringsEditorColorsEn {
	_StringsEditorColorsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get colorPicker => 'Color picker';
	String customBrightnessHue({required Object b, required Object h}) => 'Custom ${b} ${h}';
	String customHue({required Object h}) => 'Custom ${h}';
	String get dark => 'dark';
	String get light => 'light';
	String get black => 'Black';
	String get darkGrey => 'Dark grey';
	String get grey => 'Grey';
	String get lightGrey => 'Light grey';
	String get white => 'White';
	String get red => 'Red';
	String get green => 'Green';
	String get cyan => 'Cyan';
	String get blue => 'Blue';
	String get yellow => 'Yellow';
	String get purple => 'Purple';
	String get pink => 'Pink';
	String get orange => 'Orange';
	String get pastelRed => 'Pastel red';
	String get pastelOrange => 'Pastel orange';
	String get pastelYellow => 'Pastel yellow';
	String get pastelGreen => 'Pastel green';
	String get pastelCyan => 'Pastel cyan';
	String get pastelBlue => 'Pastel blue';
	String get pastelPurple => 'Pastel purple';
	String get pastelPink => 'Pastel pink';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Image options';
	String get invertible => 'Invertible';
	String get download => 'Download';
	String get setAsBackground => 'Set as background';
	String get removeAsBackground => 'Remove as background';
	String get delete => 'Delete';
}

// Path: editor.selectionBar
class _StringsEditorSelectionBarEn {
	_StringsEditorSelectionBarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get delete => 'Delete';
	String get duplicate => 'Duplicate';
}

// Path: editor.menu
class _StringsEditorMenuEn {
	_StringsEditorMenuEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String clearPage({required Object page, required Object totalPages}) => 'Clear page ${page}/${totalPages}';
	String get clearAllPages => 'Clear all pages';
	String get insertPage => 'Insert page below';
	String get duplicatePage => 'Duplicate page';
	String get deletePage => 'Delete page';
	String get lineHeight => 'Line height';
	String get lineHeightDescription => 'Also controls the text size';
	String get backgroundImageFit => 'Background image fit';
	String get backgroundPattern => 'Background pattern';
	String get import => 'Import';
	late final _StringsEditorMenuBoxFitsEn boxFits = _StringsEditorMenuBoxFitsEn._(_root);
	late final _StringsEditorMenuBgPatternsEn bgPatterns = _StringsEditorMenuBgPatternsEn._(_root);
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get readOnlyMode => 'Read-only mode';
	String get title => 'This note was edited using a newer version of Saber';
	String get subtitle => 'Editing this note may result in some information being lost. Do you want to ignore this and edit it anyway?';
	String get allowEditing => 'Allow editing';
	String get cancel => 'Cancel';
}

// Path: editor.quill
class _StringsEditorQuillEn {
	_StringsEditorQuillEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get typeSomething => 'Type something here...';
}

// Path: editor.hud
class _StringsEditorHudEn {
	_StringsEditorHudEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get unlockZoom => 'Unlock zoom';
	String get lockZoom => 'Lock zoom';
	String get unlockSingleFingerPan => 'Enable single-finger panning';
	String get lockSingleFingerPan => 'Disable single-finger panning';
	String get unlockAxisAlignedPan => 'Unlock panning to horizontal or vertical';
	String get lockAxisAlignedPan => 'Lock panning to horizontal or vertical';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _StringsSettingsPrefDescriptionsHideFingerDrawingEn {
	_StringsSettingsPrefDescriptionsHideFingerDrawingEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get shown => 'Prevents accidental toggling';
	String get fixedOn => 'Finger drawing is fixed as enabled';
	String get fixedOff => 'Finger drawing is fixed as disabled';
}

// Path: editor.menu.boxFits
class _StringsEditorMenuBoxFitsEn {
	_StringsEditorMenuBoxFitsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get fill => 'Stretch';
	String get cover => 'Cover';
	String get contain => 'Contain';
}

// Path: editor.menu.bgPatterns
class _StringsEditorMenuBgPatternsEn {
	_StringsEditorMenuBgPatternsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get none => 'Blank';
	String get college => 'College-ruled';
	String get collegeRtl => 'College-ruled (Reverse)';
	String get lined => 'Lined';
	String get grid => 'Grid';
	String get dots => 'Dots';
	String get staffs => 'Staffs';
	String get tablature => 'Tablature';
	String get cornell => 'Cornell';
}

// Path: <root>
class _StringsAr extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsAr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsAr _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeAr home = _StringsHomeAr._(_root);
	@override late final _StringsSettingsAr settings = _StringsSettingsAr._(_root);
	@override late final _StringsLoginAr login = _StringsLoginAr._(_root);
	@override late final _StringsProfileAr profile = _StringsProfileAr._(_root);
	@override late final _StringsAppInfoAr appInfo = _StringsAppInfoAr._(_root);
	@override late final _StringsUpdateAr update = _StringsUpdateAr._(_root);
	@override late final _StringsEditorAr editor = _StringsEditorAr._(_root);
}

// Path: home
class _StringsHomeAr extends _StringsHomeEn {
	_StringsHomeAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsAr tabs = _StringsHomeTabsAr._(_root);
	@override late final _StringsHomeTitlesAr titles = _StringsHomeTitlesAr._(_root);
	@override late final _StringsHomeTooltipsAr tooltips = _StringsHomeTooltipsAr._(_root);
	@override late final _StringsHomeCreateAr create = _StringsHomeCreateAr._(_root);
	@override String get welcome => 'مرحباً بك في Saber';
	@override String get noFiles => 'لم يتم العثور على ملفات';
	@override String get createNewNote => 'اضغط على زر + لإنشاء ملاحظة جديدة';
	@override late final _StringsHomeNewFolderAr newFolder = _StringsHomeNewFolderAr._(_root);
	@override late final _StringsHomeRenameNoteAr renameNote = _StringsHomeRenameNoteAr._(_root);
	@override late final _StringsHomeMoveNoteAr moveNote = _StringsHomeMoveNoteAr._(_root);
	@override late final _StringsHomeRenameFolderAr renameFolder = _StringsHomeRenameFolderAr._(_root);
	@override late final _StringsHomeDeleteFolderAr deleteFolder = _StringsHomeDeleteFolderAr._(_root);
	@override String get backFolder => 'ارجع إلى المجلد السابق';
	@override String get deleteNote => 'حذف الملاحظة';
	@override String get invalidFormat => 'الملف الذي حددته غير مدعوم. الرجاء تحديد ملف .sbn، .sbn2 أو .pdf.';
}

// Path: settings
class _StringsSettingsAr extends _StringsSettingsEn {
	_StringsSettingsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefCategoriesAr prefCategories = _StringsSettingsPrefCategoriesAr._(_root);
	@override late final _StringsSettingsPrefLabelsAr prefLabels = _StringsSettingsPrefLabelsAr._(_root);
	@override late final _StringsSettingsPrefDescriptionsAr prefDescriptions = _StringsSettingsPrefDescriptionsAr._(_root);
	@override late final _StringsSettingsThemeModesAr themeModes = _StringsSettingsThemeModesAr._(_root);
	@override late final _StringsSettingsLayoutSizesAr layoutSizes = _StringsSettingsLayoutSizesAr._(_root);
	@override late final _StringsSettingsAccentColorPickerAr accentColorPicker = _StringsSettingsAccentColorPickerAr._(_root);
	@override String get systemLanguage => 'لغة النظام';
	@override List<String> get axisDirections => [
		'أعلى',
		'يمين',
		'أسفل',
		'يسار',
	];
	@override late final _StringsSettingsResetAr reset = _StringsSettingsResetAr._(_root);
}

// Path: login
class _StringsLoginAr extends _StringsLoginEn {
	_StringsLoginAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'تسجيل الدخول';
	@override late final _StringsLoginFeedbacksAr feedbacks = _StringsLoginFeedbacksAr._(_root);
	@override late final _StringsLoginFormAr form = _StringsLoginFormAr._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'لا تملك حسابا حتى الآن؟ '),
		linkToSignup('سجل حساباً الأن'),
		const TextSpan(text: '!'),
	]);
	@override late final _StringsLoginStatusAr status = _StringsLoginStatusAr._(_root);
	@override List<dynamic> get faq => [
		_StringsLogin$faq$0i0$Ar._(_root),
		_StringsLogin$faq$0i1$Ar._(_root),
		_StringsLogin$faq$0i2$Ar._(_root),
		_StringsLogin$faq$0i3$Ar._(_root),
		_StringsLogin$faq$0i4$Ar._(_root),
	];
}

// Path: profile
class _StringsProfileAr extends _StringsProfileEn {
	_StringsProfileAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'ملفي الشخصي';
	@override String get logout => 'تسجيل الخروج';
	@override late final _StringsProfileQuickLinksAr quickLinks = _StringsProfileQuickLinksAr._(_root);
	@override List<dynamic> get faq => [
		_StringsProfile$faq$0i0$Ar._(_root),
		_StringsProfile$faq$0i1$Ar._(_root),
		_StringsProfile$faq$0i2$Ar._(_root),
		_StringsProfile$faq$0i3$Ar._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoAr extends _StringsAppInfoEn {
	_StringsAppInfoAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber حقوق نشر © 2022-${buildYear}  Adil Hanney\nهذا البرنامج لا يأتي مع أي ضمان على الإطلاق. هذا برنامج مجاني، ونرحب بإعادة توزيعه في ظل ظروف معينة.';
	@override String get dirty => 'قذر';
	@override String get debug => 'تصحيح أخطاء';
	@override String get sponsorButton => 'انقر هنا لتدعمني أو شراء المزيد من مساحة التخزين';
	@override String get licenseButton => 'انقر هنا لعرض المزيد من معلومات الترخيص';
	@override String get privacyPolicyButton => 'انقر هنا لعرض سياسة الخصوصية';
}

// Path: update
class _StringsUpdateAr extends _StringsUpdateEn {
	_StringsUpdateAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'تحديث متاح';
	@override String get updateAvailableDescription => 'يتوفر إصدار جديد من التطبيق مع هذه التغييرات:';
	@override String get update => 'تحديث';
}

// Path: editor
class _StringsEditorAr extends _StringsEditorEn {
	_StringsEditorAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarAr toolbar = _StringsEditorToolbarAr._(_root);
	@override late final _StringsEditorPensAr pens = _StringsEditorPensAr._(_root);
	@override late final _StringsEditorPenOptionsAr penOptions = _StringsEditorPenOptionsAr._(_root);
	@override late final _StringsEditorColorsAr colors = _StringsEditorColorsAr._(_root);
	@override late final _StringsEditorImageOptionsAr imageOptions = _StringsEditorImageOptionsAr._(_root);
	@override late final _StringsEditorSelectionBarAr selectionBar = _StringsEditorSelectionBarAr._(_root);
	@override late final _StringsEditorMenuAr menu = _StringsEditorMenuAr._(_root);
	@override late final _StringsEditorNewerFileFormatAr newerFileFormat = _StringsEditorNewerFileFormatAr._(_root);
	@override late final _StringsEditorQuillAr quill = _StringsEditorQuillAr._(_root);
	@override late final _StringsEditorHudAr hud = _StringsEditorHudAr._(_root);
	@override String get pages => 'صفحات';
	@override String get untitled => 'بدون عنوان';
	@override String get needsToSaveBeforeExiting => 'حفظ التغييرات... يمكنك الخروج بأمان من المحرر عند الانتهاء';
}

// Path: home.tabs
class _StringsHomeTabsAr extends _StringsHomeTabsEn {
	_StringsHomeTabsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get home => 'الرئيسية';
	@override String get browse => 'تصفح';
	@override String get whiteboard => 'السبورة';
	@override String get settings => 'الإعدادات';
}

// Path: home.titles
class _StringsHomeTitlesAr extends _StringsHomeTitlesEn {
	_StringsHomeTitlesAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get home => 'الملاحظات الأخيرة';
	@override String get whiteboard => 'السبورة';
	@override String get settings => 'الإعدادات';
	@override String get browse => 'تصفح';
}

// Path: home.tooltips
class _StringsHomeTooltipsAr extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'محلاظة جديدة';
	@override String get showUpdateDialog => 'إظهار مربع حوار التحديث';
}

// Path: home.create
class _StringsHomeCreateAr extends _StringsHomeCreateEn {
	_StringsHomeCreateAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get importNote => 'مذكرة استيراد';
	@override String get newNote => 'مذكرة جديدة';
}

// Path: home.newFolder
class _StringsHomeNewFolderAr extends _StringsHomeNewFolderEn {
	_StringsHomeNewFolderAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'مجلد جديد';
	@override String get folderName => 'إسم المجلد';
	@override String get create => 'إنشاء';
	@override String get folderNameEmpty => 'لا يمكن أن يكون اسم المجلد فارغًا';
	@override String get folderNameContainsSlash => 'لا يمكن أن يحتوي اسم المجلد على شرطة مائلة';
	@override String get folderNameExists => 'المجلد موجود بالفعل';
}

// Path: home.renameNote
class _StringsHomeRenameNoteAr extends _StringsHomeRenameNoteEn {
	_StringsHomeRenameNoteAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'إعادة تسمية الملاحظة';
	@override String get noteName => 'اسم الملاحظة';
	@override String get rename => 'إعادة تسمية';
	@override String get noteNameEmpty => 'لا يمكن أن يكون اسم الملاحظة فارغًا';
	@override String get noteNameContainsSlash => 'لا يمكن أن يحتوي اسم الملاحظة على شرطة مائلة';
	@override String get noteNameExists => 'توجد بالفعل ملاحظة بهذا الاسم';
}

// Path: home.moveNote
class _StringsHomeMoveNoteAr extends _StringsHomeMoveNoteEn {
	_StringsHomeMoveNoteAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'تحريك الملاحظة';
	@override String get move => 'تحريك';
	@override String renamedTo({required Object newName}) => 'ستتم إعادة تسمية الملاحظة إلى ${newName}';
	@override String moveNotes({required Object n}) => 'نقل ${n} الملاحظات';
	@override String get multipleRenamedTo => 'وستعاد تسمية الملاحظات التالية:';
	@override String numberRenamedTo({required Object n}) => 'ستتم إعادة تسمية الملاحظات ${n} لتجنب التعارضات';
	@override String moveName({required Object f}) => 'نقل ${f}';
}

// Path: home.renameFolder
class _StringsHomeRenameFolderAr extends _StringsHomeRenameFolderEn {
	_StringsHomeRenameFolderAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get folderName => 'إسم الملف';
	@override String get folderNameExists => 'يوجد مجلد بهذا الاسم بالفعل';
	@override String get rename => 'إعادة تسمية';
	@override String get folderNameEmpty => 'لا يمكن أن يكون اسماً فارغاً';
	@override String get folderNameContainsSlash => 'لا يمكن أن يحتوي اسم المجلد على شرطة مائلة';
	@override String get renameFolder => 'إعادة تسمية المجلد';
}

// Path: home.deleteFolder
class _StringsHomeDeleteFolderAr extends _StringsHomeDeleteFolderEn {
	_StringsHomeDeleteFolderAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String deleteName({required Object f}) => 'حذف ${f}';
	@override String get deleteFolder => 'احذف المجلد';
	@override String get alsoDeleteContents => 'احذف أيضًا جميع الملاحظات الموجودة داخل هذا المجلد';
	@override String get delete => 'يمسح';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesAr extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get general => 'عام';
	@override String get writing => 'كتابة';
	@override String get editor => 'محرر';
	@override String get advanced => 'متقدم';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsAr extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get locale => 'لغة التطبيق';
	@override String get appTheme => 'مظهر التطبيق';
	@override String get platform => 'نوع المظهر';
	@override String get layoutSize => 'نوع التخطيط';
	@override String get customAccentColor => 'لون التمييز المخصص';
	@override String get hyperlegibleFont => 'Hyperlegible خط';
	@override String get shouldCheckForUpdates => 'تحقق تلقائيًا من وجود تحديثات Saber';
	@override String get editorToolbarAlignment => 'محاذاة شريط أدوات المحرر';
	@override String get editorToolbarShowInFullscreen => 'أظهر شريط أدوات المحرر في وضع ملء الشاشة';
	@override String get editorAutoInvert => 'اقلب الملاحظات في الوضع المظلم';
	@override String get editorOpaqueBackgrounds => 'خلفيات معتمة';
	@override String get preferGreyscale => 'تفضيل الألوان الرمادية';
	@override String get maxImageSize => 'الحجم الأقصى للصورة';
	@override String get autoClearWhiteboardOnExit => 'امسح السبورة بعد الخروج من التطبيق';
	@override String get editorPromptRename => 'مطالبتك بإعادة تسمية الملاحظات الجديدة';
	@override String get hideHomeBackgrounds => 'إخفاء الخلفيات على الشاشة الرئيسية';
	@override String get recentColorsDontSavePresets => 'لا تحفظ الألوان المعينة مسبقًا كألوان حديثة';
	@override String get printPageIndicators => 'طباعة مؤشرات الصفحة';
	@override String get recentColorsLength => 'كم عدد الألوان الحديثة التي سيتم تخزينها';
	@override String get changeAdsConsent => 'تغيير موافقة الإعلانات';
	@override String get disableAds => 'عطل الاعلانات';
	@override String get allowInsecureConnections => 'السماح بعلاقات غير آمنة';
	@override String get autosaveDelay => 'تأخير الحفظ التلقائي';
	@override String get hideFingerDrawingToggle => 'إخفاء تبديل رسم الإصبع';
	@override String get shouldAlwaysAlertForUpdates => 'التحديثات السريعة';
	@override String get disableEraserAfterUse => 'تعطيل تلقائي للممحاة';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsAr extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'يزيد Atkinson Hyperlegible من وضوح الرؤية للقراء الذين يعانون من ضعف في الرؤية';
	@override String get editorOpaqueBackgrounds => 'قم بإزالة الشفافية من صور الخلفية وملفات PDF';
	@override String get preferGreyscale => 'لشاشات الحبر الإلكتروني';
	@override String get autoClearWhiteboardOnExit => 'ستظل متزامنة مع أجهزتك الأخرى';
	@override String get maxImageSize => 'سيتم ضغط الصور الأكبر من هذا';
	@override late final _StringsSettingsPrefDescriptionsHideFingerDrawingAr hideFingerDrawing = _StringsSettingsPrefDescriptionsHideFingerDrawingAr._(_root);
	@override String get editorPromptRename => 'يمكنك دائمًا إعادة تسمية الملاحظات لاحقًا';
	@override String get hideHomeBackgrounds => 'للحصول على مظهر أنظف';
	@override String get printPageIndicators => 'تظهر مؤشرات الصفحة في الصادرات';
	@override String get disableAds => '(أدز) يساعد في دعم تطوير (سابر) لكن يمكنك إزالتهم إذا أردت';
	@override String get allowInsecureConnections => '(غير مستحسن) السماح لـ Saber بالاتصال بالخوادم ذات الشهادات الموقعة ذاتيًا / غير الموثوق بها';
	@override String get autosaveDelay => 'كم من الوقت للانتظار قبل تقديم مذكرة';
	@override String get disableEraserAfterUse => 'يعود تلقائيًا إلى القلم بعد استخدام الممحاة';
	@override String get shouldAlwaysAlertForUpdates => 'أخبرني عن التحديثات بمجرد توفرها';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesAr extends _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get system => 'النظام';
	@override String get light => 'ساطع';
	@override String get dark => 'داكن';
}

// Path: settings.layoutSizes
class _StringsSettingsLayoutSizesAr extends _StringsSettingsLayoutSizesEn {
	_StringsSettingsLayoutSizesAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get auto => 'آلي';
	@override String get phone => 'هاتف';
	@override String get tablet => 'لوحي';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerAr extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'اختر لوناً';
}

// Path: settings.reset
class _StringsSettingsResetAr extends _StringsSettingsResetEn {
	_StringsSettingsResetAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'إعادة تعيين هذا الإعداد؟';
	@override String get button => 'إعادة تعيين';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksAr extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get checkUsername => 'يرجى التحقق مرة أخرى من اسم المستخدم أو البريد الإلكتروني الخاص بك.';
	@override String get enterNcPassword => 'الرجاء إدخال كلمة مرور Nextcloud الخاصة بك.';
	@override String get enterEncPassword => 'الرجاء إدخال كلمة مرور التشفير الخاصة بك.';
	@override String get checkUrl => 'أدخل رابط URL صالح من فضلك.';
	@override String get ncLoginFailed => 'فشل تسجيل الدخول ، يرجى التحقق من التفاصيل الخاصة بك واتصال الشبكة.';
	@override String ncUnsupportedFailure({required Object v, required Object s}) => 'يقوم الخادم المحدد بتشغيل Nextcloud ${v} لكن هذا الإصدار من Saber يدعم فقط Nextcloud ${s}.';
	@override String get encLoginFailed => 'فشل تسجيل الدخول ، يرجى التحقق من كلمة مرور التشفير الخاصة بك.';
	@override String get loginSuccess => 'تم تسجيل الدخول بنجاح! الرجاء الانتظار بينما نقوم بالإعداد ...';
}

// Path: login.form
class _StringsLoginFormAr extends _StringsLoginFormEn {
	_StringsLoginFormAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get useCustomServer => 'أريد استخدام خادم Nextcloud مخصص';
	@override String get customServerUrl => 'عنوان URL مخصص للخادم';
	@override String get username => 'اسم المستخدم أو البريد الالكتروني';
	@override String get ncPassword => 'Nextcloud كلمة المرور';
	@override String get encPassword => 'كلمة مرور التشفير';
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'بتسجيل الدخول، فإنك توافق على '),
		linkToPrivacyPolicy('سياسة الخصوصية'),
		const TextSpan(text: '.'),
	]);
	@override String get login => 'تسجيل الدخول';
}

// Path: login.status
class _StringsLoginStatusAr extends _StringsLoginStatusEn {
	_StringsLoginStatusAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => 'تم تسجيل الدخول باستخدام Nextcloud';
	@override String get loggedOut => 'تسجيل الخروج';
	@override String get tapToLogin => 'انقر لتسجيل الدخول باستخدام Nextcloud';
}

// Path: login.faq.0
class _StringsLogin$faq$0i0$Ar extends _StringsLogin$faq$0i0$En {
	_StringsLogin$faq$0i0$Ar._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'ما هو Nextcloud؟';
	@override String get a => 'Nextcloud هو خادم مزامنة ملفات خاص، من بين أشياء أخرى. يمكنك استخدام خادم Saber Nextcloud الافتراضي، أو استخدام خادم جهة خارجية، أو الاستضافة الذاتية الخاصة بك للتحكم الكامل في بياناتك.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$Ar extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$Ar._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'ما هي كلمة مرور التشفير؟';
	@override String get a => 'تُستخدم كلمة مرور التشفير لتشفير بياناتك قبل إرسالها إلى الخادم. يمكنك اختيارها عند تسجيل الدخول لأول مرة إلى Saber ،وهي غير مرتبطة بحساب/كلمة مرور Nextcloud الخاصة بك.\nلا يمكن لأحد الوصول إلى ملاحظاتك على الخادم بدون كلمة مرور التشفير الخاصة بك. هذا يعني أيضًا أنك إذا نسيت كلمة مرور التشفير، فستفقد إمكانية الوصول إلى بياناتك.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Ar extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Ar._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'لماذا نستخدم كلمتين من كلمات المرور؟';
	@override String get a => 'يتم استخدام كلمة مرور Nextcloud للوصول إلى السحابة. كلمة مرور التشفير "تشويش " بياناتك قبل أن تصل إلى السحابة.\nحتى إذا تمكن شخص ما من الوصول إلى حسابك على Nextcloud ،فستظل ملاحظاتك آمنة ومشفرة بكلمة مرور منفصلة. يوفر لك هذا طبقة ثانية من الأمان لحماية بياناتك.';
}

// Path: login.faq.3
class _StringsLogin$faq$0i3$Ar extends _StringsLogin$faq$0i3$En {
	_StringsLogin$faq$0i3$Ar._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'كيف يمكنني تسجيل الدخول إذا كنت أستخدم المصادقة الثنائية (2FA)؟';
	@override String get a => 'بدلاً من كلمة مرور Nextcloud العادية، ستحتاج إلى إنشاء "كلمة مرور التطبيق". يمكنك القيام بذلك في إعدادات Nextcloud الخاصة بك ضمن الأمان> الأجهزة والجلسات> إنشاء كلمة مرور جديدة للتطبيق. كلمة مرور التشفير الخاصة بك لا تتأثر.';
}

// Path: login.faq.4
class _StringsLogin$faq$0i4$Ar extends _StringsLogin$faq$0i4$En {
	_StringsLogin$faq$0i4$Ar._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'هل يمكنني استخدام نفس كلمة المرور لكليهما؟';
	@override String get a => 'نعم، لكن القيام بذلك أقل أمانًا. نظرًا لأنه يتم إرسال كلمة مرور Nextcloud الخاصة بك إلى الخادم، فسيتمكن شخص لديه حق الوصول إلى الخادم من فك تشفير ملاحظاتك. استخدم نفس كلمة المرور فقط إذا كنت تثق في مالك الخادم.';
}

// Path: profile.quickLinks
class _StringsProfileQuickLinksAr extends _StringsProfileQuickLinksEn {
	_StringsProfileQuickLinksAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'روابط سريعة';
	@override String get serverHomepage => 'الصفحة الرئيسية للخادم';
	@override String get deleteAccount => 'حذف الحساب';
}

// Path: profile.faq.0
class _StringsProfile$faq$0i0$Ar extends _StringsProfile$faq$0i0$En {
	_StringsProfile$faq$0i0$Ar._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'هل سأفقد ملاحظاتي إذا قمت بتسجيل الخروج؟';
	@override String get a => 'لا. ستظل ملاحظاتك على كل من جهازك وعلى الخادم. لن تتم مزامنتها مع الخادم حتى تقوم بتسجيل الدخول مرة أخرى. تأكد من اكتمال المزامنة قبل تسجيل الخروج حتى لا تفقد أي بيانات (انظر تقدم المزامنة على الشاشة الرئيسية).';
}

// Path: profile.faq.1
class _StringsProfile$faq$0i1$Ar extends _StringsProfile$faq$0i1$En {
	_StringsProfile$faq$0i1$Ar._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'كيف يمكنني تغيير كلمة المرور الخاصة بي على Nextcloud؟';
	@override String get a => 'انتقل إلى موقع الخادم الخاص بك وقم بتسجيل الدخول. ثم انتقل إلى الإعدادات > الأمان > تغيير كلمة المرور. ستحتاج إلى تسجيل الخروج وتسجيل الدخول مرة أخرى إلى Saber بعد تغيير كلمة المرور الخاصة بك.';
}

// Path: profile.faq.2
class _StringsProfile$faq$0i2$Ar extends _StringsProfile$faq$0i2$En {
	_StringsProfile$faq$0i2$Ar._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'كيف يمكنني تغيير كلمة مرور التشفير الخاصة بي؟';
	@override String get a => '1. تسجيل الخروج من Saber. تأكد من اكتمال المزامنة قبل تسجيل الخروج حتى لا تفقد أي بيانات (انظر تقدم المزامنة على الشاشة الرئيسية).\n2. اذهب إلى موقع الخادم الخاص بك واحذف مجلد "Saber" الخاص بك. سيؤدي هذا إلى حذف كافة ملاحظاتك من الخادم.\n3. قم بتسجيل الدخول مرة أخرى إلى Saber. يمكنك اختيار كلمة مرور تشفير جديدة عند تسجيل الدخول.\n4. لا تنس تسجيل الخروج وتسجيل الدخول مرة أخرى إلى Saber على أجهزتك الأخرى أيضًا.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$Ar extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$Ar._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'كيف يمكنني حذف حسابي؟';
	@override String get a => 'انتقل إلى موقع الخادم الخاص بك وقم بتسجيل الدخول. ثم انتقل إلى الإعدادات> حذف الحساب.\nإذا كنت تستخدم خادم Saber الرسمي، فسيتم حذف حسابك بعد فترة سماح مدتها أسبوع. يمكنك الاتصال بي على adilhanney@disroot.org خلال هذه الفترة لإلغاء الحذف.\nإذا كنت تستخدم خادم جهة خارجية، فقد لا يكون هناك خيار لحذف حسابك: ستحتاج إلى استشارة خصوصية الخادم سياسة لمزيد من المعلومات.';
}

// Path: editor.toolbar
class _StringsEditorToolbarAr extends _StringsEditorToolbarEn {
	_StringsEditorToolbarAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'تبديل الألوان (Ctrl C)';
	@override String get select => 'اختر';
	@override String get toggleEraser => 'تبديل الممحاة (Ctrl E)';
	@override String get photo => 'صور';
	@override String get text => 'نص';
	@override String get toggleFingerDrawing => 'تبديل رسم الإصبع (Ctrl F)';
	@override String get undo => 'تراجع';
	@override String get redo => 'إعادة';
	@override String get export => 'تصدير (Ctrl Shift S)';
	@override String get exportAs => 'تصدير كـ:';
	@override String get fullscreen => 'تبديل ملء الشاشة (F11)';
}

// Path: editor.pens
class _StringsEditorPensAr extends _StringsEditorPensEn {
	_StringsEditorPensAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'قلم حبر';
	@override String get ballpointPen => 'قلم برأس كروي';
	@override String get highlighter => 'هايلايتر';
	@override String get laserPointer => 'مؤشر الليزر';
	@override String get shapePen => 'قلم الشكل';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsAr extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get size => 'حجم';
	@override String get sizeDragHint => 'اسحب لليسار أو لليمين لتغيير الحجم';
}

// Path: editor.colors
class _StringsEditorColorsAr extends _StringsEditorColorsEn {
	_StringsEditorColorsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'أداة انتقاء اللون';
	@override String customBrightnessHue({required Object b, required Object h}) => 'مخصص ${b} ${h}';
	@override String customHue({required Object h}) => 'مخصص ${h}';
	@override String get dark => 'مظلم';
	@override String get light => 'ضوء';
	@override String get black => 'أسود';
	@override String get darkGrey => 'الرمادي الداكن';
	@override String get grey => 'رمادي';
	@override String get lightGrey => 'رمادي فاتح';
	@override String get white => 'أبيض';
	@override String get red => 'أحمر';
	@override String get green => 'أخضر';
	@override String get blue => 'أزرق';
	@override String get yellow => 'أصفر';
	@override String get purple => 'أرجواني';
	@override String get orange => 'برتقالي';
	@override String get pastelRed => 'باستيل أحمر';
	@override String get pastelOrange => 'برتقال باستيل';
	@override String get pastelYellow => 'باستيل أصفر';
	@override String get pastelGreen => 'الباستيل الأخضر';
	@override String get pastelCyan => 'باستيل سماوي';
	@override String get pastelBlue => 'الباستيل الأزرق';
	@override String get pastelPurple => 'الباستيل الأرجواني';
	@override String get pastelPink => 'الباستيل الوردي';
	@override String get cyan => 'ازرق سماوي';
	@override String get pink => 'لون القرنفل';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsAr extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'خيارات الصورة';
	@override String get invertible => 'قابل للعكس';
	@override String get download => 'تحميل';
	@override String get setAsBackground => 'تعيين كخلفية';
	@override String get removeAsBackground => 'إزالة كخلفية';
	@override String get delete => 'حذف';
}

// Path: editor.selectionBar
class _StringsEditorSelectionBarAr extends _StringsEditorSelectionBarEn {
	_StringsEditorSelectionBarAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get delete => 'حذف';
	@override String get duplicate => 'ينسخ';
}

// Path: editor.menu
class _StringsEditorMenuAr extends _StringsEditorMenuEn {
	_StringsEditorMenuAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'تنظيف الصفحة ${page}/${totalPages}';
	@override String get clearAllPages => 'امسح كل الصفحات';
	@override String get insertPage => 'أدخل الصفحة أدناه';
	@override String get duplicatePage => 'تكرار الصفحة';
	@override String get deletePage => 'حذف الصفحة';
	@override String get lineHeight => 'ارتفاع خط';
	@override String get lineHeightDescription => 'يتحكم أيضًا في حجم النص';
	@override String get backgroundPattern => 'نمط الخلفية';
	@override String get import => 'يستورد';
	@override late final _StringsEditorMenuBoxFitsAr boxFits = _StringsEditorMenuBoxFitsAr._(_root);
	@override late final _StringsEditorMenuBgPatternsAr bgPatterns = _StringsEditorMenuBgPatternsAr._(_root);
	@override String get backgroundImageFit => 'الصورة الخلفية';
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatAr extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'وضع القراءة فقط';
	@override String get title => 'تم تحرير هذه الملاحظة باستخدام إصدار أحدث من Saber';
	@override String get subtitle => 'قد يؤدي تحرير هذه الملاحظة إلى ضياع بعض المعلومات. هل تريد تجاهل هذا وتعديله على أي حال؟';
	@override String get allowEditing => 'السماح بالتعديل';
	@override String get cancel => 'إلغاء';
}

// Path: editor.quill
class _StringsEditorQuillAr extends _StringsEditorQuillEn {
	_StringsEditorQuillAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'اكتب شيئًا هنا...';
}

// Path: editor.hud
class _StringsEditorHudAr extends _StringsEditorHudEn {
	_StringsEditorHudAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'إلغاء قفل التكبير';
	@override String get lockZoom => 'قفل التكبير';
	@override String get unlockSingleFingerPan => 'تمكين التحريك بإصبع واحد';
	@override String get lockSingleFingerPan => 'تعطيل التحريك بإصبع واحد';
	@override String get unlockAxisAlignedPan => 'إلغاء قفل التحريك إلى أفقي أو عمودي';
	@override String get lockAxisAlignedPan => 'قفل التحريك إلى أفقي أو رأسي';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _StringsSettingsPrefDescriptionsHideFingerDrawingAr extends _StringsSettingsPrefDescriptionsHideFingerDrawingEn {
	_StringsSettingsPrefDescriptionsHideFingerDrawingAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get shown => 'يمنع التبديل العرضي';
	@override String get fixedOn => 'تم إصلاح رسم الإصبع على أنه ممكن';
	@override String get fixedOff => 'تم إصلاح رسم الإصبع على أنه معطل';
}

// Path: editor.menu.boxFits
class _StringsEditorMenuBoxFitsAr extends _StringsEditorMenuBoxFitsEn {
	_StringsEditorMenuBoxFitsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get fill => 'تمتد';
	@override String get cover => 'غطاء';
	@override String get contain => 'يحتوي';
}

// Path: editor.menu.bgPatterns
class _StringsEditorMenuBgPatternsAr extends _StringsEditorMenuBgPatternsEn {
	_StringsEditorMenuBgPatternsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get none => 'فارغ';
	@override String get college => 'كلية تحكم';
	@override String get collegeRtl => 'محكوم الكلية (عكسي)';
	@override String get lined => 'مبطن';
	@override String get grid => 'شبكة';
	@override String get dots => 'نقاط';
	@override String get staffs => 'موظفون';
	@override String get cornell => 'كورنيل';
	@override String get tablature => 'تبلتثر';
}

// Path: <root>
class _StringsCs extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsCs.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.cs,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <cs>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsCs _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeCs home = _StringsHomeCs._(_root);
	@override late final _StringsSettingsCs settings = _StringsSettingsCs._(_root);
	@override late final _StringsLoginCs login = _StringsLoginCs._(_root);
	@override late final _StringsProfileCs profile = _StringsProfileCs._(_root);
	@override late final _StringsAppInfoCs appInfo = _StringsAppInfoCs._(_root);
	@override late final _StringsUpdateCs update = _StringsUpdateCs._(_root);
	@override late final _StringsEditorCs editor = _StringsEditorCs._(_root);
}

// Path: home
class _StringsHomeCs extends _StringsHomeEn {
	_StringsHomeCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsCs tabs = _StringsHomeTabsCs._(_root);
	@override late final _StringsHomeTitlesCs titles = _StringsHomeTitlesCs._(_root);
	@override late final _StringsHomeTooltipsCs tooltips = _StringsHomeTooltipsCs._(_root);
	@override late final _StringsHomeCreateCs create = _StringsHomeCreateCs._(_root);
	@override String get welcome => 'Vítejte v aplikaci Saber';
	@override String get invalidFormat => 'Vybrali jste nepodporovaný soubor. Vyberte prosím soubor s příponou .sbn, .sbn2 nebo .pdf.';
	@override String get noFiles => 'Žádné poznámky nebyly nalezeny';
	@override String get createNewNote => 'Pro přidání nové poznámky klepněte na tlačítko +';
	@override String get backFolder => 'Přejít do předchozí složky';
	@override late final _StringsHomeNewFolderCs newFolder = _StringsHomeNewFolderCs._(_root);
	@override late final _StringsHomeRenameNoteCs renameNote = _StringsHomeRenameNoteCs._(_root);
	@override late final _StringsHomeMoveNoteCs moveNote = _StringsHomeMoveNoteCs._(_root);
	@override String get deleteNote => 'Odstranit poznámku';
	@override late final _StringsHomeRenameFolderCs renameFolder = _StringsHomeRenameFolderCs._(_root);
	@override late final _StringsHomeDeleteFolderCs deleteFolder = _StringsHomeDeleteFolderCs._(_root);
}

// Path: settings
class _StringsSettingsCs extends _StringsSettingsEn {
	_StringsSettingsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefCategoriesCs prefCategories = _StringsSettingsPrefCategoriesCs._(_root);
	@override late final _StringsSettingsPrefLabelsCs prefLabels = _StringsSettingsPrefLabelsCs._(_root);
	@override late final _StringsSettingsPrefDescriptionsCs prefDescriptions = _StringsSettingsPrefDescriptionsCs._(_root);
	@override late final _StringsSettingsThemeModesCs themeModes = _StringsSettingsThemeModesCs._(_root);
	@override late final _StringsSettingsLayoutSizesCs layoutSizes = _StringsSettingsLayoutSizesCs._(_root);
	@override late final _StringsSettingsAccentColorPickerCs accentColorPicker = _StringsSettingsAccentColorPickerCs._(_root);
	@override String get systemLanguage => 'Systémový jazyk';
	@override List<String> get axisDirections => [
		'Nahoře',
		'Vpravo',
		'Dole',
		'Vlevo',
	];
	@override late final _StringsSettingsResetCs reset = _StringsSettingsResetCs._(_root);
}

// Path: login
class _StringsLoginCs extends _StringsLoginEn {
	_StringsLoginCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Přihlásit se';
	@override late final _StringsLoginFeedbacksCs feedbacks = _StringsLoginFeedbacksCs._(_root);
	@override late final _StringsLoginFormCs form = _StringsLoginFormCs._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Ještě nemáte účet? '),
		linkToSignup('Zaregistrujte se'),
		const TextSpan(text: '!'),
	]);
	@override late final _StringsLoginStatusCs status = _StringsLoginStatusCs._(_root);
	@override List<dynamic> get faq => [
		_StringsLogin$faq$0i0$Cs._(_root),
		_StringsLogin$faq$0i1$Cs._(_root),
		_StringsLogin$faq$0i2$Cs._(_root),
		_StringsLogin$faq$0i3$Cs._(_root),
		_StringsLogin$faq$0i4$Cs._(_root),
	];
}

// Path: profile
class _StringsProfileCs extends _StringsProfileEn {
	_StringsProfileCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Můj profil';
	@override String get logout => 'Odhlásit se';
	@override late final _StringsProfileQuickLinksCs quickLinks = _StringsProfileQuickLinksCs._(_root);
	@override List<dynamic> get faq => [
		_StringsProfile$faq$0i0$Cs._(_root),
		_StringsProfile$faq$0i1$Cs._(_root),
		_StringsProfile$faq$0i2$Cs._(_root),
		_StringsProfile$faq$0i3$Cs._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoCs extends _StringsAppInfoEn {
	_StringsAppInfoCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nTento program je poskytován bez jakékoliv záruky. Jedná se o software poskytovaný zdarma, který je možné šířit při splnění určitých podmínek.';
	@override String get dirty => 'ZKUŠEBNÍ VERZE';
	@override String get debug => 'LADÍCÍ VERZE';
	@override String get sponsorButton => 'Klepněte sem, pokud mě chcete sponzorovat nebo si přikoupit úložiště';
	@override String get licenseButton => 'Klepněte sem pro zobrazení podrobnějších licenčních informací';
	@override String get privacyPolicyButton => 'Klepněte sem pro zobrazení zásad ochrany osobních údajů';
}

// Path: update
class _StringsUpdateCs extends _StringsUpdateEn {
	_StringsUpdateCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Aktualizace k dispozici';
	@override String get updateAvailableDescription => 'Je k dispozici nová verze aplikace, která zahrnuje tyto změny:';
	@override String get update => 'Aktualizovat';
}

// Path: editor
class _StringsEditorCs extends _StringsEditorEn {
	_StringsEditorCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarCs toolbar = _StringsEditorToolbarCs._(_root);
	@override late final _StringsEditorPensCs pens = _StringsEditorPensCs._(_root);
	@override late final _StringsEditorPenOptionsCs penOptions = _StringsEditorPenOptionsCs._(_root);
	@override late final _StringsEditorColorsCs colors = _StringsEditorColorsCs._(_root);
	@override late final _StringsEditorImageOptionsCs imageOptions = _StringsEditorImageOptionsCs._(_root);
	@override late final _StringsEditorSelectionBarCs selectionBar = _StringsEditorSelectionBarCs._(_root);
	@override late final _StringsEditorMenuCs menu = _StringsEditorMenuCs._(_root);
	@override late final _StringsEditorNewerFileFormatCs newerFileFormat = _StringsEditorNewerFileFormatCs._(_root);
	@override late final _StringsEditorQuillCs quill = _StringsEditorQuillCs._(_root);
	@override late final _StringsEditorHudCs hud = _StringsEditorHudCs._(_root);
	@override String get pages => 'Stránky';
	@override String get untitled => 'Nepojmenovaná poznámka';
	@override String get needsToSaveBeforeExiting => 'Ukládání změn... Po skončení této operace můžete editor bezpečně opustit';
}

// Path: home.tabs
class _StringsHomeTabsCs extends _StringsHomeTabsEn {
	_StringsHomeTabsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Domů';
	@override String get browse => 'Poznámky';
	@override String get whiteboard => 'Tabule';
	@override String get settings => 'Nastavení';
}

// Path: home.titles
class _StringsHomeTitlesCs extends _StringsHomeTitlesEn {
	_StringsHomeTitlesCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Poslední poznámky';
	@override String get browse => 'Procházet poznámky';
	@override String get whiteboard => 'Tabule';
	@override String get settings => 'Nastavení';
}

// Path: home.tooltips
class _StringsHomeTooltipsCs extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nová poznámka';
	@override String get showUpdateDialog => 'Zobrazit dialogové okno aktualizace';
}

// Path: home.create
class _StringsHomeCreateCs extends _StringsHomeCreateEn {
	_StringsHomeCreateCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nová poznámka';
	@override String get importNote => 'Import poznámky';
}

// Path: home.newFolder
class _StringsHomeNewFolderCs extends _StringsHomeNewFolderEn {
	_StringsHomeNewFolderCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Nová složka';
	@override String get folderName => 'Název složky';
	@override String get create => 'Vytvořit';
	@override String get folderNameEmpty => 'Název složky nemůže být prázdný';
	@override String get folderNameContainsSlash => 'Název složky nemůže obsahovat lomítko';
	@override String get folderNameExists => 'Složka s tímto názvem již existuje';
}

// Path: home.renameNote
class _StringsHomeRenameNoteCs extends _StringsHomeRenameNoteEn {
	_StringsHomeRenameNoteCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Přejmenovat poznámku';
	@override String get noteName => 'Nový název poznámky';
	@override String get rename => 'Přejmenovat';
	@override String get noteNameEmpty => 'Název poznámky nemůže být prázdný';
	@override String get noteNameContainsSlash => 'Název poznámky nemůže obsahovat lomítko';
	@override String get noteNameExists => 'Poznámka s tímto názvem již existuje';
}

// Path: home.moveNote
class _StringsHomeMoveNoteCs extends _StringsHomeMoveNoteEn {
	_StringsHomeMoveNoteCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

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
class _StringsHomeRenameFolderCs extends _StringsHomeRenameFolderEn {
	_StringsHomeRenameFolderCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Přejmenovat složku';
	@override String get folderName => 'Název složky';
	@override String get rename => 'Přejmenovat';
	@override String get folderNameEmpty => 'Název složky nemůže být prázdný';
	@override String get folderNameContainsSlash => 'Název složky nemůže obsahovat lomítko';
	@override String get folderNameExists => 'Složka s tímto názvem již existuje';
}

// Path: home.deleteFolder
class _StringsHomeDeleteFolderCs extends _StringsHomeDeleteFolderEn {
	_StringsHomeDeleteFolderCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Odstranit složku';
	@override String deleteName({required Object f}) => 'Odstranění složky ${f}';
	@override String get delete => 'Odstranit';
	@override String get alsoDeleteContents => 'Se složkou odstranit i obsažené poznámky';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesCs extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get general => 'Obecné';
	@override String get writing => 'Psaní';
	@override String get editor => 'Editor';
	@override String get advanced => 'Pokročilé';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsCs extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Jazyk aplikace';
	@override String get appTheme => 'Barva motivu';
	@override String get platform => 'Motiv';
	@override String get layoutSize => 'Rozložení uživatelského rozhraní';
	@override String get customAccentColor => 'Vlastní barevný odstín';
	@override String get hyperlegibleFont => 'Lépe čitelný font';
	@override String get shouldCheckForUpdates => 'Automaticky kontrolovat dostupnost aktualizací aplikace Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Rychlejší aktualizace';
	@override String get disableAds => 'Vypnout reklamy';
	@override String get changeAdsConsent => 'Změnit předvolby pro reklamy';
	@override String get allowInsecureConnections => 'Povolit nezabezpečená připojení';
	@override String get editorToolbarAlignment => 'Umístění nabídky editoru';
	@override String get editorToolbarShowInFullscreen => 'Zobrazovat nabídku editoru v režimu celé obrazovky';
	@override String get editorAutoInvert => 'V tmavém režimu invertovat poznámky';
	@override String get editorOpaqueBackgrounds => 'Neprůhledná pozadí';
	@override String get preferGreyscale => 'Preferovat černobílé barvy';
	@override String get maxImageSize => 'Maximální velikost obrázku';
	@override String get autoClearWhiteboardOnExit => 'Smazat tabuli po opuštění aplikace';
	@override String get disableEraserAfterUse => 'Automaticky vypínat gumu';
	@override String get hideFingerDrawingToggle => 'Skrýt přepínač pro kreslení prstem';
	@override String get editorPromptRename => 'Vybízet k přejmenování nových poznámek';
	@override String get hideHomeBackgrounds => 'Skrýt pozadí poznámek na hlavní obrazovce';
	@override String get recentColorsDontSavePresets => 'Neukládat přednastavené barvy mezi naposledy použité barvy';
	@override String get printPageIndicators => 'Tisknout čísla stránek';
	@override String get autosaveDelay => 'Zpoždění automatického ukládání';
	@override String get recentColorsLength => 'Kolik posledních barev uložit';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsCs extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Font Atkinson Hyperlegible zvyšuje čitelnost pro čtenáře se slabým zrakem';
	@override String get disableAds => 'Reklamy podporují vývoj aplikace Saber, ale pokud chcete, můžete je vypnout';
	@override String get allowInsecureConnections => '(Nedoporučuje se) Povolit aplikaci Saber připojovat se k serverům se samopodepsaným/nedůvěryhodným certifikátem.';
	@override String get editorOpaqueBackgrounds => 'Odstraní průhlednost z obrázků a PDF na pozadí';
	@override String get preferGreyscale => 'Pro elektronické čtečky knih s e-ink displejem';
	@override String get autoClearWhiteboardOnExit => 'Bude synchronizováno do dalších zařízení';
	@override String get disableEraserAfterUse => 'Po použití gumy automaticky přepnout zpět na pero';
	@override String get maxImageSize => 'Na větší obrázky bude aplikována komprese';
	@override late final _StringsSettingsPrefDescriptionsHideFingerDrawingCs hideFingerDrawing = _StringsSettingsPrefDescriptionsHideFingerDrawingCs._(_root);
	@override String get editorPromptRename => 'Poznámky můžete vždy přejmenovat i později';
	@override String get hideHomeBackgrounds => 'Pro čistější vzhled';
	@override String get printPageIndicators => 'V exportech budou zobrazena čísla stránek';
	@override String get autosaveDelay => 'Jak dlouho počkat před automatickým uložením poznámky';
	@override String get shouldAlwaysAlertForUpdates => 'Oznámit dostupnost aktualizací co nejdříve od jejich vydání';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesCs extends _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get system => 'Systémový';
	@override String get light => 'Světlý';
	@override String get dark => 'Tmavý';
}

// Path: settings.layoutSizes
class _StringsSettingsLayoutSizesCs extends _StringsSettingsLayoutSizesEn {
	_StringsSettingsLayoutSizesCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Automatické';
	@override String get phone => 'Telefon';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerCs extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Výběr vlastní barvy';
}

// Path: settings.reset
class _StringsSettingsResetCs extends _StringsSettingsResetEn {
	_StringsSettingsResetCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chcete resetovat tuto volbu?';
	@override String get button => 'Resetovat';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksCs extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get checkUsername => 'Zkontrolujte prosím své uživatelské jméno a heslo.';
	@override String get enterNcPassword => 'Zadejte prosím své heslo k Nextcloud účtu.';
	@override String get enterEncPassword => 'Zadejte prosím své heslo pro šifrování.';
	@override String get checkUrl => 'Zadejte prosím správnou URL adresu.';
	@override String get ncLoginFailed => 'Přihlašování selhalo, zkontrolujte prosím zadané údaje a připojení k internetu.';
	@override String ncUnsupportedFailure({required Object v, required Object s}) => 'Zadaný server používá Nextcloud ${v}, ale tato verze aplikace Saber podporuje pouze Nextcloud ${s}.';
	@override String get encLoginFailed => 'Přihlašování selhalo, zkontrolujte prosím své heslo pro šifrování.';
	@override String get loginSuccess => 'Přihlášení bylo úspěšné! Vyčkejte prosím, nastavíme vše potřebné...';
}

// Path: login.form
class _StringsLoginFormCs extends _StringsLoginFormEn {
	_StringsLoginFormCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get useCustomServer => 'Chci využít vlastní Nextcloud server';
	@override String get customServerUrl => 'URL adresa vlastního Nextcloud serveru';
	@override String get username => 'Přihlašovací jméno nebo e-mail';
	@override String get ncPassword => 'Heslo k Nextcloud účtu';
	@override String get encPassword => 'Heslo pro šifrování';
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Přihlášením souhlasíte se '),
		linkToPrivacyPolicy('Zásadami ochrany osobních údajů'),
		const TextSpan(text: '.'),
	]);
	@override String get login => 'Přihlásit se';
}

// Path: login.status
class _StringsLoginStatusCs extends _StringsLoginStatusEn {
	_StringsLoginStatusCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => 'Jste přihlášeni pomocí Nextcloud účtu';
	@override String get loggedOut => 'Jste odhlášení';
	@override String get tapToLogin => 'Klepněte pro přihlášení pomocí Nextcloud účtu';
}

// Path: login.faq.0
class _StringsLogin$faq$0i0$Cs extends _StringsLogin$faq$0i0$En {
	_StringsLogin$faq$0i0$Cs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Co je to Nextcloud?';
	@override String get a => 'Nextcloud je mimo jiné osobní server pro synchronizaci souborů. Můžete používat výchozí Nextcloud server poskytovaný aplikací Saber, použít server hostovaný třetí stranou, nebo vlastní server pro plnou kontrolu nad svými daty.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$Cs extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$Cs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'K čemu je heslo pro šifrování?';
	@override String get a => 'Heslo pro šifrování je použito k zašifrování vašich dat před jejich odesláním na server. Zvolíte si ho při prvním přihlášení do aplikace Saber, není nijak vázáno na heslo k vašemu Nextcloud účtu nebo na účet samotný.\nBez jeho znalosti nemůže nikdo přistoupit k vašim poznámkám uloženým na serveru. To také znamená, že pokud ho zapomenete, ztratíte přístup ke svým datům.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Cs extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Cs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Proč používat dvě hesla?';
	@override String get a => 'Heslo k Nextcloud účtu se používá k přístupu do cloudu. Heslo pro šifrování "utají" vaše data ještě před tím, než se na cloud dostanou.\nI když by někdo získat přístup k vašemu Nextcloud účtu, vaše poznámky zůstanou v bezpečí zašifrované vlastním heslem. To vám poskytuje druhou vrstvu ochrany vašich dat.';
}

// Path: login.faq.3
class _StringsLogin$faq$0i3$Cs extends _StringsLogin$faq$0i3$En {
	_StringsLogin$faq$0i3$Cs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Jak se přihlásím, když používám 2FA?';
	@override String get a => 'Místo běžného hesla k Nextcloud účtu si potřebujete vytvořit "heslo aplikace". Toho můžete docílit v nastavení Nextcloudu v záložce Zabezpečení > Zařízení a sezení > Vytvořit nové heslo aplikace. Vašeho hesla pro šifrování se to nijak netýká.';
}

// Path: login.faq.4
class _StringsLogin$faq$0i4$Cs extends _StringsLogin$faq$0i4$En {
	_StringsLogin$faq$0i4$Cs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Mohu použít stejné heslo k Nextcloud účtu a pro šifrování?';
	@override String get a => 'Ano, ale je není to tak bezpečné. Jelikož je heslo k Nextcloud účtu odesíláno na server, kdokoliv s přístupem k serveru může dešifrovat vaše poznámky. Stejné heslo použijte jen v případě, že věříte vlastníkovi serveru.';
}

// Path: profile.quickLinks
class _StringsProfileQuickLinksCs extends _StringsProfileQuickLinksEn {
	_StringsProfileQuickLinksCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rychlé odkazy';
	@override String get serverHomepage => 'Webové stránky serveru';
	@override String get deleteAccount => 'Odstranit účet';
}

// Path: profile.faq.0
class _StringsProfile$faq$0i0$Cs extends _StringsProfile$faq$0i0$En {
	_StringsProfile$faq$0i0$Cs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Ztratím po odhlášení svoje poznámky?';
	@override String get a => 'Nikoliv. Vaše poznámky zůstanou jak na vašem zařízení, tak na serveru. Dokud se opět nepřihlásíte, nebudou synchronizovány se serverem. Před ohlášením se ujistěte, že byla dokončena synchronizace, abyste předešli ztrátě dat (průběh synchronizace uvidíte na domovské obrazovce).';
}

// Path: profile.faq.1
class _StringsProfile$faq$0i1$Cs extends _StringsProfile$faq$0i1$En {
	_StringsProfile$faq$0i1$Cs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Jak změním své heslo k Nextcloud účtu?';
	@override String get a => 'Přejděte na webovou stránku vašeho serveru a přihlašte se. Poté přejděte do Nastavení > Zabezpečení > Změnit heslo. Po změně hesla se budete muset odhlásit z aplikace Saber a poté se do ní opětovně přihlásit.';
}

// Path: profile.faq.2
class _StringsProfile$faq$0i2$Cs extends _StringsProfile$faq$0i2$En {
	_StringsProfile$faq$0i2$Cs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Jak změním své heslo pro šifrování?';
	@override String get a => '1. Odhlašte se z aplikace Saber. Před odhlášením se ujistěte, že byla dokončena synchronizace a nepřijdete o žádná data (průběh synchronizace uvidíte na domovské obrazovce).\n2. Přejděte na webovou stránku vašeho serveru a smažte složku \'Saber\'. Tím ze serveru odstraníte všechny poznámky.\n3. Opětovně se přihlašte do aplikace Saber. Při přihlašování můžete zvolit nové heslo pro šifrování.\n4. Nezapomeňte se z aplikace Saber odhlásit a opětovně se do ní přihlásit na ostatních zařízeních.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$Cs extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$Cs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Jak odstraním svůj účet?';
	@override String get a => 'Klepněte na tlačítko "${_root.profile.quickLinks.deleteAccount}" umístěné výše a přihlašte se, pokud to bude vyžadováno.\nPokud používáte výchozí server od aplikace Saber, bude váš účet odstraněn po uplynutí týdenní ochranné lhůty. Během této lhůty mě můžete kontaktovat pro odvolání zrušení účtu na adilhanney@disroot.org.\nPokud používáte server třetí strany, nemusí nabízet možnost odstranění účtu: pro více informací se bude třeba obrátit na zásady ochrany osobních údajů daného serveru.';
}

// Path: editor.toolbar
class _StringsEditorToolbarCs extends _StringsEditorToolbarEn {
	_StringsEditorToolbarCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

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
class _StringsEditorPensCs extends _StringsEditorPensEn {
	_StringsEditorPensCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Plnící pero';
	@override String get ballpointPen => 'Kuličkové pero';
	@override String get highlighter => 'Zvýrazňovač';
	@override String get shapePen => 'Pero pro kreslení tvarů';
	@override String get laserPointer => 'Laserové ukazovátko';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsCs extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get size => 'Velikost';
	@override String get sizeDragHint => 'Posunem vlevo nebo vpravo změníte velikost';
}

// Path: editor.colors
class _StringsEditorColorsCs extends _StringsEditorColorsEn {
	_StringsEditorColorsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Vybrat vlastní barvu';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Vlastní ${b} ${h}';
	@override String customHue({required Object h}) => 'Vlastní ${h}';
	@override String get dark => 'temný';
	@override String get light => 'světlo';
	@override String get black => 'Černá';
	@override String get darkGrey => 'Tmavě šedá';
	@override String get grey => 'Šedá';
	@override String get lightGrey => 'Světle šedá';
	@override String get white => 'Bílá';
	@override String get red => 'Červená';
	@override String get green => 'Zelená';
	@override String get blue => 'Modrá';
	@override String get yellow => 'Žlutá';
	@override String get purple => 'Purpurová';
	@override String get orange => 'Oranžová';
	@override String get pastelRed => 'Pastelová červená';
	@override String get pastelOrange => 'Pastelová oranžová';
	@override String get pastelYellow => 'Pastelová žlutá';
	@override String get pastelGreen => 'Pastelová zelená';
	@override String get pastelCyan => 'Pastelová azurová';
	@override String get pastelBlue => 'Pastelová modrá';
	@override String get pastelPurple => 'Pastelová purpurová';
	@override String get pastelPink => 'Pastelová růžová';
	@override String get cyan => 'Tyrkysová';
	@override String get pink => 'Růžový';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsCs extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Možnosti obrázku';
	@override String get invertible => 'Invertovat barvy podle motivu';
	@override String get download => 'Stáhnout';
	@override String get setAsBackground => 'Nastavit na pozadí';
	@override String get removeAsBackground => 'Odstranit obrázek z pozadí';
	@override String get delete => 'Odstranit';
}

// Path: editor.selectionBar
class _StringsEditorSelectionBarCs extends _StringsEditorSelectionBarEn {
	_StringsEditorSelectionBarCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Odstranit';
	@override String get duplicate => 'Duplikovat';
}

// Path: editor.menu
class _StringsEditorMenuCs extends _StringsEditorMenuEn {
	_StringsEditorMenuCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Smazat obsah stránky ${page}/${totalPages}';
	@override String get clearAllPages => 'Smazat všechny stránky';
	@override String get insertPage => 'Přidat stránku za tuto';
	@override String get duplicatePage => 'Duplikovat stránku';
	@override String get deletePage => 'Odstranit stránku';
	@override String get lineHeight => 'Výška řádku';
	@override String get lineHeightDescription => 'Ovlivňuje také velikost textu';
	@override String get backgroundImageFit => 'Rozložení obrázku na pozadí';
	@override String get backgroundPattern => 'Vzor na pozadí';
	@override String get import => 'Importovat';
	@override late final _StringsEditorMenuBoxFitsCs boxFits = _StringsEditorMenuBoxFitsCs._(_root);
	@override late final _StringsEditorMenuBgPatternsCs bgPatterns = _StringsEditorMenuBgPatternsCs._(_root);
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatCs extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Otevřít v režimu pouze pro čtení';
	@override String get title => 'Tato poznámka byla upravena v novější verzi aplikace Saber';
	@override String get subtitle => 'Úpravou této poznámky můžete přijít o některé informace. Přejete tuto skutečnost ignorovat a přesto pokračovat k úpravě poznámky?';
	@override String get allowEditing => 'Povolit úpravy';
	@override String get cancel => 'Zrušit';
}

// Path: editor.quill
class _StringsEditorQuillCs extends _StringsEditorQuillEn {
	_StringsEditorQuillCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Něco sem napište...';
}

// Path: editor.hud
class _StringsEditorHudCs extends _StringsEditorHudEn {
	_StringsEditorHudCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Odemknout přibližování';
	@override String get lockZoom => 'Zamknout přibližování';
	@override String get unlockSingleFingerPan => 'Odemknout posouvání jedním prsem';
	@override String get lockSingleFingerPan => 'Zamknout posouvání jedním prsem';
	@override String get unlockAxisAlignedPan => 'Odemknout horizontální a vertikální posouvání';
	@override String get lockAxisAlignedPan => 'Zamknout horizontální a vertikální posouvání';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _StringsSettingsPrefDescriptionsHideFingerDrawingCs extends _StringsSettingsPrefDescriptionsHideFingerDrawingEn {
	_StringsSettingsPrefDescriptionsHideFingerDrawingCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Zabraňuje nechtěnému přepnutí';
	@override String get fixedOn => 'Kreslení prstem je napevno zapnuté';
	@override String get fixedOff => 'Kreslení prstem je napevno vypnuté';
}

// Path: editor.menu.boxFits
class _StringsEditorMenuBoxFitsCs extends _StringsEditorMenuBoxFitsEn {
	_StringsEditorMenuBoxFitsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Roztáhnout';
	@override String get cover => 'Vyplnit';
	@override String get contain => 'Přizpůsobit';
}

// Path: editor.menu.bgPatterns
class _StringsEditorMenuBgPatternsCs extends _StringsEditorMenuBgPatternsEn {
	_StringsEditorMenuBgPatternsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

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

// Path: <root>
class _StringsDe extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsDe.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsDe _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeDe home = _StringsHomeDe._(_root);
	@override late final _StringsSettingsDe settings = _StringsSettingsDe._(_root);
	@override late final _StringsLoginDe login = _StringsLoginDe._(_root);
	@override late final _StringsProfileDe profile = _StringsProfileDe._(_root);
	@override late final _StringsAppInfoDe appInfo = _StringsAppInfoDe._(_root);
	@override late final _StringsUpdateDe update = _StringsUpdateDe._(_root);
	@override late final _StringsEditorDe editor = _StringsEditorDe._(_root);
}

// Path: home
class _StringsHomeDe extends _StringsHomeEn {
	_StringsHomeDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsDe tabs = _StringsHomeTabsDe._(_root);
	@override late final _StringsHomeTitlesDe titles = _StringsHomeTitlesDe._(_root);
	@override late final _StringsHomeTooltipsDe tooltips = _StringsHomeTooltipsDe._(_root);
	@override late final _StringsHomeCreateDe create = _StringsHomeCreateDe._(_root);
	@override String get welcome => 'Willkommen bei Saber';
	@override String get noFiles => 'Keine Dateien gefunden';
	@override String get createNewNote => 'Drücke die + Schaltfläche, um eine neue Notiz zu erstellen';
	@override late final _StringsHomeNewFolderDe newFolder = _StringsHomeNewFolderDe._(_root);
	@override late final _StringsHomeRenameNoteDe renameNote = _StringsHomeRenameNoteDe._(_root);
	@override late final _StringsHomeMoveNoteDe moveNote = _StringsHomeMoveNoteDe._(_root);
	@override late final _StringsHomeRenameFolderDe renameFolder = _StringsHomeRenameFolderDe._(_root);
	@override late final _StringsHomeDeleteFolderDe deleteFolder = _StringsHomeDeleteFolderDe._(_root);
	@override String get backFolder => 'Zurück zum vorherigen Ordner';
	@override String get deleteNote => 'Notiz löschen';
	@override String get invalidFormat => 'Die ausgewählte Datei wird nicht unterstützt. Bitte wähle eine .sbn-, .sbn2- oder .pdf-Datei aus.';
}

// Path: settings
class _StringsSettingsDe extends _StringsSettingsEn {
	_StringsSettingsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefCategoriesDe prefCategories = _StringsSettingsPrefCategoriesDe._(_root);
	@override late final _StringsSettingsPrefLabelsDe prefLabels = _StringsSettingsPrefLabelsDe._(_root);
	@override late final _StringsSettingsPrefDescriptionsDe prefDescriptions = _StringsSettingsPrefDescriptionsDe._(_root);
	@override late final _StringsSettingsThemeModesDe themeModes = _StringsSettingsThemeModesDe._(_root);
	@override late final _StringsSettingsLayoutSizesDe layoutSizes = _StringsSettingsLayoutSizesDe._(_root);
	@override late final _StringsSettingsAccentColorPickerDe accentColorPicker = _StringsSettingsAccentColorPickerDe._(_root);
	@override String get systemLanguage => 'Systemsprache';
	@override List<String> get axisDirections => [
		'Oben',
		'Rechts',
		'Unten',
		'Links',
	];
	@override late final _StringsSettingsResetDe reset = _StringsSettingsResetDe._(_root);
}

// Path: login
class _StringsLoginDe extends _StringsLoginEn {
	_StringsLoginDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Login';
	@override late final _StringsLoginFeedbacksDe feedbacks = _StringsLoginFeedbacksDe._(_root);
	@override late final _StringsLoginFormDe form = _StringsLoginFormDe._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Du hast noch kein Konto? '),
		linkToSignup('Erstelle jetzt eins'),
		const TextSpan(text: '!'),
	]);
	@override late final _StringsLoginStatusDe status = _StringsLoginStatusDe._(_root);
	@override List<dynamic> get faq => [
		_StringsLogin$faq$0i0$De._(_root),
		_StringsLogin$faq$0i1$De._(_root),
		_StringsLogin$faq$0i2$De._(_root),
		_StringsLogin$faq$0i3$De._(_root),
		_StringsLogin$faq$0i4$De._(_root),
	];
}

// Path: profile
class _StringsProfileDe extends _StringsProfileEn {
	_StringsProfileDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mein Profil';
	@override String get logout => 'Abmelden';
	@override late final _StringsProfileQuickLinksDe quickLinks = _StringsProfileQuickLinksDe._(_root);
	@override List<dynamic> get faq => [
		_StringsProfile$faq$0i0$De._(_root),
		_StringsProfile$faq$0i1$De._(_root),
		_StringsProfile$faq$0i2$De._(_root),
		_StringsProfile$faq$0i3$De._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoDe extends _StringsAppInfoEn {
	_StringsAppInfoDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nDieses Programm kommt ohne jegliche Gewährleistung. Dies ist freie Software und du bist herzlich eingeladen, diese unter bestimmten Bedingungen weiterzuverteilen.';
	@override String get dirty => 'TESTVERSION';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Hier tippen, um mich zu unterstützen oder mehr Speicherplatz zu kaufen';
	@override String get licenseButton => 'Hier tippen, um weitere Lizenzinformationen anzuzeigen';
	@override String get privacyPolicyButton => 'Hier tippen, um die Datenschutzrichtlinie anzuzeigen';
}

// Path: update
class _StringsUpdateDe extends _StringsUpdateEn {
	_StringsUpdateDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Aktualisierung verfügbar';
	@override String get updateAvailableDescription => 'Eine neue Version der App ist verfügbar, mit folgenden Änderungen:';
	@override String get update => 'Aktualisieren';
}

// Path: editor
class _StringsEditorDe extends _StringsEditorEn {
	_StringsEditorDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarDe toolbar = _StringsEditorToolbarDe._(_root);
	@override late final _StringsEditorPensDe pens = _StringsEditorPensDe._(_root);
	@override late final _StringsEditorPenOptionsDe penOptions = _StringsEditorPenOptionsDe._(_root);
	@override late final _StringsEditorColorsDe colors = _StringsEditorColorsDe._(_root);
	@override late final _StringsEditorImageOptionsDe imageOptions = _StringsEditorImageOptionsDe._(_root);
	@override late final _StringsEditorSelectionBarDe selectionBar = _StringsEditorSelectionBarDe._(_root);
	@override late final _StringsEditorMenuDe menu = _StringsEditorMenuDe._(_root);
	@override late final _StringsEditorNewerFileFormatDe newerFileFormat = _StringsEditorNewerFileFormatDe._(_root);
	@override late final _StringsEditorQuillDe quill = _StringsEditorQuillDe._(_root);
	@override late final _StringsEditorHudDe hud = _StringsEditorHudDe._(_root);
	@override String get pages => 'Seiten';
	@override String get untitled => 'Unbenannt';
	@override String get needsToSaveBeforeExiting => 'Deine Änderungen werden gespeichert... Du kannst den Editor ohne Datenverlust verlassen, sobald der Vorgang beendet ist.';
}

// Path: home.tabs
class _StringsHomeTabsDe extends _StringsHomeTabsEn {
	_StringsHomeTabsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get home => 'Startseite';
	@override String get browse => 'Durchsuchen';
	@override String get whiteboard => 'Whiteboard';
	@override String get settings => 'Einstellungen';
}

// Path: home.titles
class _StringsHomeTitlesDe extends _StringsHomeTitlesEn {
	_StringsHomeTitlesDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get home => 'Letzte Notizen';
	@override String get whiteboard => 'Whiteboard';
	@override String get settings => 'Einstellungen';
	@override String get browse => 'Durchsuchen';
}

// Path: home.tooltips
class _StringsHomeTooltipsDe extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Notiz erstellen';
	@override String get showUpdateDialog => 'Aktualisierungsdialog anzeigen';
}

// Path: home.create
class _StringsHomeCreateDe extends _StringsHomeCreateEn {
	_StringsHomeCreateDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Neue Notiz';
	@override String get importNote => 'Notiz importieren';
}

// Path: home.newFolder
class _StringsHomeNewFolderDe extends _StringsHomeNewFolderEn {
	_StringsHomeNewFolderDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Neuer Ordner';
	@override String get folderName => 'Ordnername';
	@override String get create => 'Erstellen';
	@override String get folderNameEmpty => 'Ordnername darf nicht leer sein';
	@override String get folderNameContainsSlash => 'Ordnernamen dürfen keine Schrägstriche enthalten';
	@override String get folderNameExists => 'Ordner existiert bereits';
}

// Path: home.renameNote
class _StringsHomeRenameNoteDe extends _StringsHomeRenameNoteEn {
	_StringsHomeRenameNoteDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Notiz umbenennen';
	@override String get noteName => 'Name der Notiz';
	@override String get rename => 'Umbenennen';
	@override String get noteNameEmpty => 'Name der Notiz darf nicht leer sein';
	@override String get noteNameContainsSlash => 'Name der Notiz darf keinen Schrägstrich enthalten';
	@override String get noteNameExists => 'Notiz mit diesem Namen existiert bereits';
}

// Path: home.moveNote
class _StringsHomeMoveNoteDe extends _StringsHomeMoveNoteEn {
	_StringsHomeMoveNoteDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Notiz verschieben';
	@override String moveName({required Object f}) => 'verschiebe ${f}';
	@override String get move => 'Verschieben';
	@override String renamedTo({required Object newName}) => 'Notiz wird umbenannt zu ${newName}';
	@override String moveNotes({required Object n}) => '${n} Notizen verschieben';
	@override String get multipleRenamedTo => 'Folgende Anmerkungen werden umbenannt:';
	@override String numberRenamedTo({required Object n}) => '${n} Notizen werden umbenannt, um Konflikte zu vermeiden';
}

// Path: home.renameFolder
class _StringsHomeRenameFolderDe extends _StringsHomeRenameFolderEn {
	_StringsHomeRenameFolderDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get folderNameEmpty => 'Der Ordnername darf nicht leer sein';
	@override String get renameFolder => 'Ordner umbenennen';
	@override String get folderName => 'Ordnernamen';
	@override String get rename => 'Name';
	@override String get folderNameContainsSlash => 'Der Ordnername darf keinen Schrägstrich enthalten';
	@override String get folderNameExists => 'Ein Ordner mit diesem Namen existiert bereits';
}

// Path: home.deleteFolder
class _StringsHomeDeleteFolderDe extends _StringsHomeDeleteFolderEn {
	_StringsHomeDeleteFolderDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String deleteName({required Object f}) => '${f} löschen';
	@override String get deleteFolder => 'Lösche Ordner';
	@override String get delete => 'Löschen';
	@override String get alsoDeleteContents => 'Lösche außerdem alle Notizen in diesem Ordner';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesDe extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get general => 'Allgemein';
	@override String get writing => 'Eingabe';
	@override String get advanced => 'Fortgeschritten';
	@override String get editor => 'Herausgeber';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsDe extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Sprache';
	@override String get appTheme => 'Anwendungsthema';
	@override String get platform => 'Oberfläche';
	@override String get layoutSize => 'Größe des Layouts';
	@override String get customAccentColor => 'Benutzerdefinierte Akzentfarbe';
	@override String get hyperlegibleFont => 'Hyperlesbare Schrift';
	@override String get shouldCheckForUpdates => 'Suche automatisch nach Saber-Aktualisierungen';
	@override String get disableAds => 'Werbung deaktivieren';
	@override String get changeAdsConsent => 'Werbungsinhalt anpassen';
	@override String get allowInsecureConnections => 'Unsichere Verbindung erlauben';
	@override String get editorToolbarAlignment => 'Position der Werkzeugleiste';
	@override String get editorToolbarShowInFullscreen => 'Zeige die Werkzeugleiste im Vollbild';
	@override String get editorAutoInvert => 'Notizen im Dunkelmodus invertieren';
	@override String get editorOpaqueBackgrounds => 'Undurchsichtige Hintergründe';
	@override String get preferGreyscale => 'Graustufen bevorzugen';
	@override String get maxImageSize => 'Maximale Bildgröße';
	@override String get autoClearWhiteboardOnExit => 'Lösche das Whiteboard nach Verlassen der Anwendung';
	@override String get editorPromptRename => 'Beim Erstellen von Notizen einen Namen erfragen';
	@override String get hideHomeBackgrounds => 'Hintergrund auf dem Startbildschirm verbergen';
	@override String get recentColorsDontSavePresets => 'Farbvorlagen nicht in den zuletzt genutzten Farben speichern';
	@override String get printPageIndicators => 'Seitennummerierung drucken';
	@override String get recentColorsLength => 'Wie viele aktuelle Farben gespeichert werden sollen';
	@override String get autosaveDelay => 'Verzögerung beim automatischen Speichern';
	@override String get hideFingerDrawingToggle => 'Den Fingerzeichnungsschalter ausblenden';
	@override String get shouldAlwaysAlertForUpdates => 'Schnellere Updates';
	@override String get disableEraserAfterUse => 'Deaktivieren Sie den Radierer automatisch';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsDe extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible verbessert die Lesbarkeit für Menschen mit eingeschränkter Sicht';
	@override String get disableAds => 'Die Entwicklung von Saber wird duch Werbung finanziert. Die Werbung kann auf Wunsch deaktiviert werden.';
	@override String get allowInsecureConnections => '(Nicht empfohlen) Saber erlauben sich mit selbstsignierten/unsicheren Zertifikaten zu verbinden';
	@override String get editorOpaqueBackgrounds => 'Hintergrundbilder und PDFs undurchsichtig machen';
	@override String get preferGreyscale => 'Für E-Ink-Bildschirme';
	@override String get autoClearWhiteboardOnExit => 'Es wird dennoch mit deinen anderen Geräten synchronisiert';
	@override String get maxImageSize => 'Bilder, die größer sind, werden komprimiert';
	@override late final _StringsSettingsPrefDescriptionsHideFingerDrawingDe hideFingerDrawing = _StringsSettingsPrefDescriptionsHideFingerDrawingDe._(_root);
	@override String get editorPromptRename => 'Notizen können später immer noch umbenannt werden';
	@override String get hideHomeBackgrounds => 'Für ein sauberes Aussehen';
	@override String get printPageIndicators => 'Seitennummerierung bei Export anzeigen';
	@override String get autosaveDelay => 'Wartezeit, bevor eine Notiz automatisch gespeichert wird';
	@override String get disableEraserAfterUse => 'Schaltet nach Verwendung des Radiergummis automatisch wieder auf den Stift zurück';
	@override String get shouldAlwaysAlertForUpdates => 'Informiere mich über Updates, sobald sie verfügbar sind';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesDe extends _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get light => 'Hell';
	@override String get dark => 'Dunkel';
}

// Path: settings.layoutSizes
class _StringsSettingsLayoutSizesDe extends _StringsSettingsLayoutSizesEn {
	_StringsSettingsLayoutSizesDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Automatisch';
	@override String get phone => 'Handy';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerDe extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Wähle eine Farbe';
}

// Path: settings.reset
class _StringsSettingsResetDe extends _StringsSettingsResetEn {
	_StringsSettingsResetDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Diese Einstellung zurücksetzen?';
	@override String get button => 'Zurücksetzen';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksDe extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get checkUsername => 'Bitte überprüfe deinen Benutzernamen oder deine E-Mail.';
	@override String get enterNcPassword => 'Bitte gib dein Nextcloud-Passwort ein.';
	@override String get enterEncPassword => 'Bitte gib dein Verschlüsselungspasswort ein.';
	@override String get checkUrl => 'Bitte gib eine gültige URL an.';
	@override String get ncLoginFailed => 'Anmeldung fehlgeschlagen, bitte überprüfe deine Angaben und deine Netzwerkverbindung.';
	@override String ncUnsupportedFailure({required Object v, required Object s}) => 'Der angegebene Nextcloud-Server nutzt Version ${v}, aber diese Version von Saber unterstützt nur Nextcloud ${s}.';
	@override String get encLoginFailed => 'Anmeldung fehlgeschlagen, bitte überprüfe dein Verschlüsselungspasswort.';
	@override String get loginSuccess => 'Anmeldung erfolgreich! Bitte warte, während wir alles einrichten...';
}

// Path: login.form
class _StringsLoginFormDe extends _StringsLoginFormEn {
	_StringsLoginFormDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get useCustomServer => 'Ich möchte einen eigenen Nextcloud-Server verwenden';
	@override String get customServerUrl => 'Eigene Server-URL';
	@override String get username => 'Benutzername oder E-Mail';
	@override String get ncPassword => 'Nextcloud-Passwort';
	@override String get encPassword => 'Verschlüsselungspasswort';
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Indem du dich anmeldest, stimmst du der '),
		linkToPrivacyPolicy('Datenschutzrichtlinie'),
		const TextSpan(text: ' zu.'),
	]);
	@override String get login => 'Anmelden';
}

// Path: login.status
class _StringsLoginStatusDe extends _StringsLoginStatusEn {
	_StringsLoginStatusDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => 'Mit Nextcloud angemeldet';
	@override String get loggedOut => 'Nicht angemeldet';
	@override String get tapToLogin => 'Hier tippen, um dich mit Nextcloud anzumelden';
}

// Path: login.faq.0
class _StringsLogin$faq$0i0$De extends _StringsLogin$faq$0i0$En {
	_StringsLogin$faq$0i0$De._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Was ist Nextcloud?';
	@override String get a => 'Nextcloud ist unter anderem ein privater Dateisynchronisationsserver. Du kannst den Standard-Saber-Nextcloud-Server, einen Drittanbieter-, oder einen selbst-gehosteten Server verwenden, um volle Kontrolle über deine Daten zu behalten.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$De extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$De._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Was ist das Verchlüsselungspasswort?';
	@override String get a => 'Das Verschlüsselungspasswort wird verwendet, um deine Daten zu verschlüsseln, bevor diese an den Server gesendet werden. Es wird nicht auf dem Server gespeichert und nur von Saber verwendet, um deine Daten zu ver- und entschlüsseln.\nNiemand kann ohne dieses Passwort auf deine Notizen auf dem Server zugreifen. Das bedeutet allerdings auch, dass du, wenn du dein Verschlüsselungspasswort vergisst, den Zugriff auf deine Daten verlierst.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$De extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$De._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Wieso zwei Passwörter?';
	@override String get a => 'Das Nextcloud-Passwort wird verwendet, um auf die Cloud zuzugreifen. Das Verschlüsselungspasswort „verwürfelt“ deine Daten, bevor diese die Cloud erreichen.\nSelbst wenn jemand Zugriff zu deinem Nextcloud-Konto erlangt, bleiben deine Notizen sicher und verschlüsselt mit einem seperaten Passwort. Dies stellt eine zweite Sicherheitsebene zum Schutz deiner Daten dar.';
}

// Path: login.faq.3
class _StringsLogin$faq$0i3$De extends _StringsLogin$faq$0i3$En {
	_StringsLogin$faq$0i3$De._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Wie melde ich mich an, wenn ich Zwei-Faktor-Authentifikation verwende?';
	@override String get a => 'Anstatt dein normales Nextcloud-Passwort zu verwenden, musst du ein "App Password" erstellen. Das kannst du in den Nextcloud-Einstellungen unter Sicherheit > Geräte & Sitzungen > Neues App-Passwort erstellen tun. Das betrifft nicht dein Verschlüsselungspasswort.';
}

// Path: login.faq.4
class _StringsLogin$faq$0i4$De extends _StringsLogin$faq$0i4$En {
	_StringsLogin$faq$0i4$De._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Kann ich dasselbe Passwort für beide verwenden?';
	@override String get a => 'Ja, aber das ist nicht so sicher. Da dein Nextcloud-Passwort an den Server übertragen wird, kann jemand mit Zugriff auf den Server deine Notizen entschlüsseln. Du solltest also nur dasselbe Passwort verwenden, wenn du der Person, die den Server besitzt, vertraust.';
}

// Path: profile.quickLinks
class _StringsProfileQuickLinksDe extends _StringsProfileQuickLinksEn {
	_StringsProfileQuickLinksDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Schnellzugriff';
	@override String get serverHomepage => 'Server-Startseite';
	@override String get deleteAccount => 'Account löschen';
}

// Path: profile.faq.0
class _StringsProfile$faq$0i0$De extends _StringsProfile$faq$0i0$En {
	_StringsProfile$faq$0i0$De._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Verliere ich meine Notizen, wenn ich mich abmelde?';
	@override String get a => 'Nein. Deine Notizen bleiben auf deinem Gerät und auf dem Server. Sie werden erst wieder synchronisiert, wenn du dich erneut anmeldest. Um Datenverlust zu vermeiden, solltest du sicherstellen, dass alles korrekt synchronisiert wurde, bevor du dich abmeldest. Dazu kannst du auf dem Startbildschirm den Synchronisationsfortschritt überprüfen.';
}

// Path: profile.faq.1
class _StringsProfile$faq$0i1$De extends _StringsProfile$faq$0i1$En {
	_StringsProfile$faq$0i1$De._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Wie ändere ich mein Nextcloud-Passwort?';
	@override String get a => 'Öffne die Server-Startseite und melde dich an. Unter Einstellungen > Sicherheit > Passwort, kannst du dein Passwort ändern. Nachdem du dein Passwort geändert hast, musst du dich in Saber ab- und wieder anmelden.';
}

// Path: profile.faq.2
class _StringsProfile$faq$0i2$De extends _StringsProfile$faq$0i2$En {
	_StringsProfile$faq$0i2$De._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Wie ändere ich mein Verschlüsselungspasswort?';
	@override String get a => '0. Bitte stelle zuerst sicher, dass alle Daten korrekt synchronisiert wurden, damit du keine Daten verlierst (du kannst den Fortschritt auf dem Startbildschirm prüfen).\n1. Melde dich in Saber ab.\n2. Öffne die Server-Startseite und lösche den „Saber“-Order. Dadurch werden alle Notizen vom Server gelöscht.\n3. Melde dich wieder in Saber an. Du wirst nach einem neuen Verschlüsselungspasswort gefragt.\n4. Vergiss nicht dich auf anderen Geräten in Saber ab- und wieder anzumelden.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$De extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$De._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Wie lösche ich meinen Account?';
	@override String get a => 'Drücke oben den „${_root.profile.quickLinks.deleteAccount}“-Button und melde dich gegebenenfalls an.\nWenn du den offiziellen Saber-Server nutzt, wird dein Account automatisch nach einer Woche gelöscht. Du kannst mich während dieser Woche unter adilhanney@disroot.org kontaktieren um die Löschung rückgängig zu machen.\nWenn du einen anderen Server nutzt, kann es sein, dass du deinen Account nicht löschen kannst: Für mehr Information kannst du in der Datenschutzbestimmung des Servers nachgucken.';
}

// Path: editor.toolbar
class _StringsEditorToolbarDe extends _StringsEditorToolbarEn {
	_StringsEditorToolbarDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

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
class _StringsEditorPensDe extends _StringsEditorPensEn {
	_StringsEditorPensDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Füllfederhalter';
	@override String get ballpointPen => 'Kugelschreiber';
	@override String get highlighter => 'Textmarker';
	@override String get laserPointer => 'Laserpointer';
	@override String get shapePen => 'Formstift';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsDe extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get size => 'Dicke';
	@override String get sizeDragHint => 'Nach links oder rechts ziehen, um die Dicke zu ändern';
}

// Path: editor.colors
class _StringsEditorColorsDe extends _StringsEditorColorsEn {
	_StringsEditorColorsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Farbauswahl';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Benutzerdefiniert ${b} ${h}';
	@override String customHue({required Object h}) => 'Benutzerdefiniert ${h}';
	@override String get dark => 'dunkel';
	@override String get light => 'Licht';
	@override String get black => 'Schwarz';
	@override String get darkGrey => 'Dunkelgrau';
	@override String get grey => 'Grau';
	@override String get lightGrey => 'Hellgrau';
	@override String get white => 'Weiß';
	@override String get red => 'Rot';
	@override String get green => 'Grün';
	@override String get blue => 'Blau';
	@override String get yellow => 'Gelb';
	@override String get purple => 'Lila';
	@override String get orange => 'Orange';
	@override String get pastelRed => 'Pastellfarbenes Rot';
	@override String get pastelOrange => 'Pastellfarbenes Orange';
	@override String get pastelYellow => 'Pastellfarbenes Gelb';
	@override String get pastelGreen => 'Pastellfarbenes Grün';
	@override String get pastelCyan => 'Pastellfarbenes Türkis';
	@override String get pastelBlue => 'Pastellfarbenes Blau';
	@override String get pastelPurple => 'Pastellfarbenes Lila';
	@override String get pastelPink => 'Pastellfarbenes Rosa';
	@override String get pink => 'Rosa';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsDe extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bildoptionen';
	@override String get invertible => 'Invertierbar';
	@override String get download => 'Herunterladen';
	@override String get setAsBackground => 'Als Hintergrund festlegen';
	@override String get removeAsBackground => 'Hintergrund entfernen';
	@override String get delete => 'Entfernen';
}

// Path: editor.selectionBar
class _StringsEditorSelectionBarDe extends _StringsEditorSelectionBarEn {
	_StringsEditorSelectionBarDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Entfernen';
	@override String get duplicate => 'Duplikat';
}

// Path: editor.menu
class _StringsEditorMenuDe extends _StringsEditorMenuEn {
	_StringsEditorMenuDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Seite ${page}/${totalPages} leeren';
	@override String get clearAllPages => 'Alle Seiten löschen';
	@override String get insertPage => 'Neue Seite unten anfügen';
	@override String get duplicatePage => 'Seite duplizieren';
	@override String get deletePage => 'Seite löschen';
	@override String get lineHeight => 'Zeilenhöhe';
	@override String get lineHeightDescription => 'Beeinflusst außerdem die Schriftgröße';
	@override String get backgroundPattern => 'Hintergrundmuster';
	@override String get import => 'Importieren';
	@override late final _StringsEditorMenuBoxFitsDe boxFits = _StringsEditorMenuBoxFitsDe._(_root);
	@override late final _StringsEditorMenuBgPatternsDe bgPatterns = _StringsEditorMenuBgPatternsDe._(_root);
	@override String get backgroundImageFit => 'Hintergrundbild';
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatDe extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Schreibgeschützter Modus';
	@override String get title => 'Diese Notiz wurde mit einer neueren Version von Saber bearbeitet';
	@override String get subtitle => 'Durch das Bearbeiten dieser Notiz können Daten verloren gehen. Möchtest du sie trotzdem bearbeiten?';
	@override String get allowEditing => 'Schreibschutz aufheben';
	@override String get cancel => 'Abbruch';
}

// Path: editor.quill
class _StringsEditorQuillDe extends _StringsEditorQuillEn {
	_StringsEditorQuillDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Hier tippen...';
}

// Path: editor.hud
class _StringsEditorHudDe extends _StringsEditorHudEn {
	_StringsEditorHudDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Zoom entsperren';
	@override String get lockZoom => 'Zoom sperren';
	@override String get unlockSingleFingerPan => 'Verschieben mit einem Finger aktivieren';
	@override String get lockSingleFingerPan => 'Verschieben mit einem Finger deaktivieren';
	@override String get unlockAxisAlignedPan => 'Beschränkung der Horizontal- bzw. Vertikalverschiebung aufheben';
	@override String get lockAxisAlignedPan => 'Verschieben auf Horizontale oder Vertikale beschränken';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _StringsSettingsPrefDescriptionsHideFingerDrawingDe extends _StringsSettingsPrefDescriptionsHideFingerDrawingEn {
	_StringsSettingsPrefDescriptionsHideFingerDrawingDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get fixedOn => 'Das Fingerzeichnen ist derzeit aktiviert';
	@override String get fixedOff => 'Das Fingerzeichnen ist derzeit deaktiviert';
	@override String get shown => 'Verhindert versehentliches Umschalten';
}

// Path: editor.menu.boxFits
class _StringsEditorMenuBoxFitsDe extends _StringsEditorMenuBoxFitsEn {
	_StringsEditorMenuBoxFitsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Dehnen';
	@override String get cover => 'Abdecken';
	@override String get contain => 'Beinhalten';
}

// Path: editor.menu.bgPatterns
class _StringsEditorMenuBgPatternsDe extends _StringsEditorMenuBgPatternsEn {
	_StringsEditorMenuBgPatternsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get none => 'Leer';
	@override String get college => 'College';
	@override String get collegeRtl => 'College (umgekehrt)';
	@override String get lined => 'Liniert';
	@override String get grid => 'Kariert';
	@override String get dots => 'Gepunktet';
	@override String get staffs => 'Notenpapier';
	@override String get cornell => 'Cornell-Stil';
	@override String get tablature => 'Tabulatur';
}

// Path: <root>
class _StringsEs extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEs.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsEs _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeEs home = _StringsHomeEs._(_root);
	@override late final _StringsSettingsEs settings = _StringsSettingsEs._(_root);
	@override late final _StringsLoginEs login = _StringsLoginEs._(_root);
	@override late final _StringsProfileEs profile = _StringsProfileEs._(_root);
	@override late final _StringsAppInfoEs appInfo = _StringsAppInfoEs._(_root);
	@override late final _StringsUpdateEs update = _StringsUpdateEs._(_root);
	@override late final _StringsEditorEs editor = _StringsEditorEs._(_root);
}

// Path: home
class _StringsHomeEs extends _StringsHomeEn {
	_StringsHomeEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsEs tabs = _StringsHomeTabsEs._(_root);
	@override late final _StringsHomeTitlesEs titles = _StringsHomeTitlesEs._(_root);
	@override late final _StringsHomeTooltipsEs tooltips = _StringsHomeTooltipsEs._(_root);
	@override late final _StringsHomeCreateEs create = _StringsHomeCreateEs._(_root);
	@override String get welcome => 'Te damos la bienvenida a Saber';
	@override String get invalidFormat => 'El archivo que seleccionaste no es válido. Por favor, selecciona un archivo .sbn, .sbn2 or .pdf.';
	@override String get noFiles => 'No se ha encontrado ninguna nota';
	@override String get createNewNote => 'Presiona el botón + para crear una nueva nota';
	@override String get backFolder => 'Volver a la carpeta anterior';
	@override late final _StringsHomeNewFolderEs newFolder = _StringsHomeNewFolderEs._(_root);
	@override late final _StringsHomeRenameNoteEs renameNote = _StringsHomeRenameNoteEs._(_root);
	@override late final _StringsHomeMoveNoteEs moveNote = _StringsHomeMoveNoteEs._(_root);
	@override String get deleteNote => 'Eliminar nota';
	@override late final _StringsHomeRenameFolderEs renameFolder = _StringsHomeRenameFolderEs._(_root);
	@override late final _StringsHomeDeleteFolderEs deleteFolder = _StringsHomeDeleteFolderEs._(_root);
}

// Path: settings
class _StringsSettingsEs extends _StringsSettingsEn {
	_StringsSettingsEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefCategoriesEs prefCategories = _StringsSettingsPrefCategoriesEs._(_root);
	@override late final _StringsSettingsPrefLabelsEs prefLabels = _StringsSettingsPrefLabelsEs._(_root);
	@override late final _StringsSettingsPrefDescriptionsEs prefDescriptions = _StringsSettingsPrefDescriptionsEs._(_root);
	@override late final _StringsSettingsThemeModesEs themeModes = _StringsSettingsThemeModesEs._(_root);
	@override late final _StringsSettingsLayoutSizesEs layoutSizes = _StringsSettingsLayoutSizesEs._(_root);
	@override late final _StringsSettingsAccentColorPickerEs accentColorPicker = _StringsSettingsAccentColorPickerEs._(_root);
	@override String get systemLanguage => 'Idioma del sistema';
	@override List<String> get axisDirections => [
		'Arriba',
		'Derecha',
		'Abajo',
		'Izquierda',
	];
	@override late final _StringsSettingsResetEs reset = _StringsSettingsResetEs._(_root);
}

// Path: login
class _StringsLoginEs extends _StringsLoginEn {
	_StringsLoginEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Iniciar sesión';
	@override late final _StringsLoginFeedbacksEs feedbacks = _StringsLoginFeedbacksEs._(_root);
	@override late final _StringsLoginFormEs form = _StringsLoginFormEs._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: '¿Aún no tienes una cuenta? '),
		linkToSignup('Regístrate ahora'),
	]);
	@override late final _StringsLoginStatusEs status = _StringsLoginStatusEs._(_root);
	@override List<dynamic> get faq => [
		_StringsLogin$faq$0i0$Es._(_root),
		_StringsLogin$faq$0i1$Es._(_root),
		_StringsLogin$faq$0i2$Es._(_root),
		_StringsLogin$faq$0i3$Es._(_root),
		_StringsLogin$faq$0i4$Es._(_root),
	];
}

// Path: profile
class _StringsProfileEs extends _StringsProfileEn {
	_StringsProfileEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mi perfil';
	@override String get logout => 'Cerrar sesión';
	@override late final _StringsProfileQuickLinksEs quickLinks = _StringsProfileQuickLinksEs._(_root);
	@override List<dynamic> get faq => [
		_StringsProfile$faq$0i0$Es._(_root),
		_StringsProfile$faq$0i1$Es._(_root),
		_StringsProfile$faq$0i2$Es._(_root),
		_StringsProfile$faq$0i3$Es._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoEs extends _StringsAppInfoEn {
	_StringsAppInfoEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nEste programa no tiene ninguna garantía. Es un software libre, y se puede redistribuir bajo ciertas condiciones.';
	@override String get dirty => 'DIRTY';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Toca aquí para patrocinarme o comprar más almacenamiento';
	@override String get licenseButton => 'Toca aquí para ver más información sobre la licencia';
	@override String get privacyPolicyButton => 'Toca aquí para ver nuestra política de privacidad';
}

// Path: update
class _StringsUpdateEs extends _StringsUpdateEn {
	_StringsUpdateEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Actualización disponible';
	@override String get updateAvailableDescription => 'Hay una nueva versión de la aplicación disponible. Novedades en esta versión:';
	@override String get update => 'Actualizar';
}

// Path: editor
class _StringsEditorEs extends _StringsEditorEn {
	_StringsEditorEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarEs toolbar = _StringsEditorToolbarEs._(_root);
	@override late final _StringsEditorPensEs pens = _StringsEditorPensEs._(_root);
	@override late final _StringsEditorPenOptionsEs penOptions = _StringsEditorPenOptionsEs._(_root);
	@override late final _StringsEditorColorsEs colors = _StringsEditorColorsEs._(_root);
	@override late final _StringsEditorImageOptionsEs imageOptions = _StringsEditorImageOptionsEs._(_root);
	@override late final _StringsEditorSelectionBarEs selectionBar = _StringsEditorSelectionBarEs._(_root);
	@override late final _StringsEditorMenuEs menu = _StringsEditorMenuEs._(_root);
	@override late final _StringsEditorNewerFileFormatEs newerFileFormat = _StringsEditorNewerFileFormatEs._(_root);
	@override late final _StringsEditorQuillEs quill = _StringsEditorQuillEs._(_root);
	@override late final _StringsEditorHudEs hud = _StringsEditorHudEs._(_root);
	@override String get pages => 'Páginas';
	@override String get untitled => 'Sin título';
	@override String get needsToSaveBeforeExiting => 'Guardando los cambios... Puedes salir del editor de forma segura cuando se haya guardado todo';
}

// Path: home.tabs
class _StringsHomeTabsEs extends _StringsHomeTabsEn {
	_StringsHomeTabsEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Inicio';
	@override String get browse => 'Explorar';
	@override String get whiteboard => 'Pizarra';
	@override String get settings => 'Configuración';
}

// Path: home.titles
class _StringsHomeTitlesEs extends _StringsHomeTitlesEn {
	_StringsHomeTitlesEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Notas recientes';
	@override String get browse => 'Navegar';
	@override String get whiteboard => 'Pizarra';
	@override String get settings => 'Configuración';
}

// Path: home.tooltips
class _StringsHomeTooltipsEs extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Crear nota';
	@override String get showUpdateDialog => 'Mostrar cuadro de diálogo de actualizaciónes';
}

// Path: home.create
class _StringsHomeCreateEs extends _StringsHomeCreateEn {
	_StringsHomeCreateEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nueva nota';
	@override String get importNote => 'Importar nota';
}

// Path: home.newFolder
class _StringsHomeNewFolderEs extends _StringsHomeNewFolderEn {
	_StringsHomeNewFolderEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Nueva carpeta';
	@override String get folderName => 'Nombre de la carpeta';
	@override String get create => 'Crear';
	@override String get folderNameEmpty => 'El nombre de la carpeta no puede estar vacío';
	@override String get folderNameContainsSlash => 'El nombre de la carpeta no puede contener una barra vertical';
	@override String get folderNameExists => 'Ya existe una carpeta con este nombre';
}

// Path: home.renameNote
class _StringsHomeRenameNoteEs extends _StringsHomeRenameNoteEn {
	_StringsHomeRenameNoteEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Renombrar nota';
	@override String get noteName => 'Nombre de la nota';
	@override String get rename => 'Renombrar';
	@override String get noteNameEmpty => 'El nombre de la nota no puede estar vacío';
	@override String get noteNameContainsSlash => 'El nombre de la nota no puede contener una barra vertical';
	@override String get noteNameExists => 'Ya existe una nota con este nombre';
}

// Path: home.moveNote
class _StringsHomeMoveNoteEs extends _StringsHomeMoveNoteEn {
	_StringsHomeMoveNoteEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Mover nota';
	@override String moveName({required Object f}) => 'Mover ${f}';
	@override String get move => 'Mover';
	@override String renamedTo({required Object newName}) => 'Se renombrará la nota a ${newName}';
	@override String moveNotes({required Object n}) => 'Mover notas de ${n}';
	@override String get multipleRenamedTo => 'Las siguientes notas cambiarán de nombre:';
	@override String numberRenamedTo({required Object n}) => '${n} notas serán renombradas para evitar conflictos';
}

// Path: home.renameFolder
class _StringsHomeRenameFolderEs extends _StringsHomeRenameFolderEn {
	_StringsHomeRenameFolderEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Renombrar carpeta';
	@override String get folderName => 'Nombre de la carpeta';
	@override String get rename => 'Renombrar';
	@override String get folderNameEmpty => 'El nombre de la carpeta no puede estar vacío';
	@override String get folderNameContainsSlash => 'El nombre de la carpeta no puede contener una barra (/)';
	@override String get folderNameExists => 'Ya existe una carpeta con este nombre';
}

// Path: home.deleteFolder
class _StringsHomeDeleteFolderEs extends _StringsHomeDeleteFolderEn {
	_StringsHomeDeleteFolderEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Eliminar carpeta';
	@override String deleteName({required Object f}) => 'Eliminar ${f}';
	@override String get delete => 'Eliminar';
	@override String get alsoDeleteContents => 'Eliminar también las notas guardadas dentro de la carpeta';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesEs extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get general => 'General';
	@override String get writing => 'Escritura';
	@override String get editor => 'Editor';
	@override String get advanced => 'Avanzado';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsEs extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Idioma de la aplicación';
	@override String get appTheme => 'Tema de la aplicación';
	@override String get platform => 'Tipo de tema';
	@override String get layoutSize => 'Tipo de disposición';
	@override String get customAccentColor => 'Color de acento personalizado';
	@override String get hyperlegibleFont => 'Fuente hiperlegible';
	@override String get shouldCheckForUpdates => 'Buscar actualizaciones de Saber automáticamente';
	@override String get shouldAlwaysAlertForUpdates => 'Actualizaciones más rápidas';
	@override String get disableAds => 'Desactivar anuncios';
	@override String get changeAdsConsent => 'Cambiar el consentimiento de los anuncios';
	@override String get allowInsecureConnections => 'Permitir conexiones inseguras';
	@override String get editorToolbarAlignment => 'Alineación de la barra de herramientas del editor';
	@override String get editorToolbarShowInFullscreen => 'Mostrar la barra de herramientas del editor en el modo de pantalla completa';
	@override String get editorAutoInvert => 'Invertir notas en el modo oscuro';
	@override String get editorOpaqueBackgrounds => 'Fondos opacos';
	@override String get preferGreyscale => 'Preferir colores en escala de grises';
	@override String get maxImageSize => 'Tamaño máximo de la imagen';
	@override String get autoClearWhiteboardOnExit => 'Borrar la pizarra después de salir de la aplicación';
	@override String get disableEraserAfterUse => 'Desactivar automáticamente la goma de borrar';
	@override String get hideFingerDrawingToggle => 'Ocultar la opción para activar/desactivar la escritura con el dedo';
	@override String get editorPromptRename => 'Solicitarte cambiar el nombre de nuevas notas';
	@override String get hideHomeBackgrounds => 'Ocultar fondos en la pantalla de inicio';
	@override String get recentColorsDontSavePresets => 'No guardar colores preestablecidos en los colores recientes';
	@override String get printPageIndicators => 'Indicadores de página de impresión';
	@override String get autosaveDelay => 'Retardo en el autoguardado';
	@override String get recentColorsLength => '¿Cuántos colores recientes almacenar?';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsEs extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible aumenta la legibilidad para lectores con poca visión';
	@override String get disableAds => 'Los anuncios ayudan al desarrollo de Saber, pero puedes desactivarlos si lo prefieres';
	@override String get allowInsecureConnections => '(No recomendado) Autorizar a Saber a conectarse a servidores con certificados autofirmados o no fiables';
	@override String get editorOpaqueBackgrounds => 'Elimina la transparencia de las imágenes de fondo y los archivos PDF';
	@override String get preferGreyscale => 'Para pantallas con tinta electrónica';
	@override String get autoClearWhiteboardOnExit => 'Aún se sincronizará con tus otros dispositivos';
	@override String get disableEraserAfterUse => 'Volver automáticamente al bolígrafo tras usar la goma';
	@override String get maxImageSize => 'Las imágenes más grandes que este valor serán comprimidas';
	@override late final _StringsSettingsPrefDescriptionsHideFingerDrawingEs hideFingerDrawing = _StringsSettingsPrefDescriptionsHideFingerDrawingEs._(_root);
	@override String get editorPromptRename => 'Siempre puedes cambiar el nombre de las notas más tarde';
	@override String get hideHomeBackgrounds => 'Para una vista más limpia';
	@override String get printPageIndicators => 'Mostrar indicadores de página en las exportaciones';
	@override String get autosaveDelay => 'Cuánto esperar antes de autoguardar una nota';
	@override String get shouldAlwaysAlertForUpdates => 'Avísame sobre actualizaciones tan pronto como estén disponibles';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesEs extends _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get light => 'Claro';
	@override String get dark => 'Oscuro';
}

// Path: settings.layoutSizes
class _StringsSettingsLayoutSizesEs extends _StringsSettingsLayoutSizesEn {
	_StringsSettingsLayoutSizesEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Auto';
	@override String get phone => 'Teléfono';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerEs extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Elegir un color';
}

// Path: settings.reset
class _StringsSettingsResetEs extends _StringsSettingsResetEn {
	_StringsSettingsResetEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '¿Quieres restablecer esta configuración?';
	@override String get button => 'Restablecer';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksEs extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get checkUsername => 'Por favor verifica tu nombre de usuario o correo electrónico.';
	@override String get enterNcPassword => 'Por favor ingresa tu contraseña de Nextcloud.';
	@override String get enterEncPassword => 'Por favor introduce tu contraseña de cifrado.';
	@override String get checkUrl => 'Por favor introduce una dirección URL válida.';
	@override String get ncLoginFailed => 'No se pudo iniciar sesión, por favor verifica tus datos y conexión a internet.';
	@override String ncUnsupportedFailure({required Object v, required Object s}) => 'El servidor al que intentas conectar tiene la versión ${v} de Nextcloud pero esta versión de Saber solo soporta la versión ${s}.';
	@override String get encLoginFailed => 'No se pudo iniciar sesión, por favor verifica tu contraseña de cifrado.';
	@override String get loginSuccess => '¡Inicio de sesión exitoso! Por favor espera mientras configuramos todo...';
}

// Path: login.form
class _StringsLoginFormEs extends _StringsLoginFormEn {
	_StringsLoginFormEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get useCustomServer => 'Quiero utilizar un servidor de Nextcloud personalizado';
	@override String get customServerUrl => 'Dirección URL del servidor personalizada';
	@override String get username => 'Nombre de usuario o correo electrónico';
	@override String get ncPassword => 'Contraseña de Nextcloud';
	@override String get encPassword => 'Contraseña de cifrado';
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Al iniciar sesión, aceptas nuestra '),
		linkToPrivacyPolicy('Política de privacidad'),
		const TextSpan(text: '.'),
	]);
	@override String get login => 'Iniciar sesión';
}

// Path: login.status
class _StringsLoginStatusEs extends _StringsLoginStatusEn {
	_StringsLoginStatusEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => 'Sesión iniciada con Nextcloud';
	@override String get loggedOut => 'Desconectado';
	@override String get tapToLogin => 'Toca para iniciar sesión con Nextcloud';
}

// Path: login.faq.0
class _StringsLogin$faq$0i0$Es extends _StringsLogin$faq$0i0$En {
	_StringsLogin$faq$0i0$Es._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Qué es Nextcloud?';
	@override String get a => 'Nextcloud es un servidor privado de sincronización de archivos, entre otras cosas. Puedes usar el servidor de Saber Nextcloud predeterminado, usar un servidor de terceros o alojar el tuyo propio para tener un control total de tus datos.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$Es extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$Es._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Qué es la contraseña de cifrado?';
	@override String get a => 'La contraseña de cifrado se utiliza para cifrar tus datos antes de enviarlos al servidor. La eliges cuando inicias sesión por primera vez en Saber, y no está relacionada con tu cuenta/contraseña de Nextcloud.\nNadie puede acceder a tus notas en el servidor sin tu contraseña de cifrado. Esto significa que si olvidas tu contraseña de cifrado, perderás el acceso a tus datos.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Es extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Es._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Por qué usar dos contraseñas?';
	@override String get a => 'La contraseña de Nextcloud se utiliza para acceder a la nube. La contraseña de encriptación "codifica" tus datos antes de que lleguen a la nube.\nIncluso si alguien obtiene acceso a tu cuenta de Nextcloud, tus notas permanecerán seguras y encriptadas con una contraseña separada. Esto te proporciona una segunda capa de seguridad para proteger tus datos.';
}

// Path: login.faq.3
class _StringsLogin$faq$0i3$Es extends _StringsLogin$faq$0i3$En {
	_StringsLogin$faq$0i3$Es._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Cómo puedo iniciar sesión si uso autenticación en dos pasos (2FA)?';
	@override String get a => 'En vez de usar tu contraseña habitual de Nextcloud, deberás crear una "contraseña de aplicación". Puedes hacerlo en la configuración de Nextcloud en Seguridad > Dispositivos y sesiones > Crear nueva contraseña de aplicación. Tu contraseña de cifrado no se ve afectada.';
}

// Path: login.faq.4
class _StringsLogin$faq$0i4$Es extends _StringsLogin$faq$0i4$En {
	_StringsLogin$faq$0i4$Es._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Puedo usar la misma contraseña para ambos?';
	@override String get a => 'Sí, pero hacer esto es menos seguro. Dado que tu contraseña de Nextcloud se envía al servidor, alguien con acceso al servidor podría descifrar tus notas. Solo usa la misma contraseña si confías en el propietario del servidor.';
}

// Path: profile.quickLinks
class _StringsProfileQuickLinksEs extends _StringsProfileQuickLinksEn {
	_StringsProfileQuickLinksEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Enlaces rápidos';
	@override String get serverHomepage => 'Página de inicio del servidor';
	@override String get deleteAccount => 'Eliminar cuenta';
}

// Path: profile.faq.0
class _StringsProfile$faq$0i0$Es extends _StringsProfile$faq$0i0$En {
	_StringsProfile$faq$0i0$Es._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Pierdo mis notas si cierro sesión?';
	@override String get a => 'No. Tus notas permanecerán tanto en tu dispositivo como en el servidor. Solo no se sincronizarán con el servidor hasta que vuelvas a iniciar sesión. Asegúrate de que la sincronización se completó antes de cerrar la sesión para asegurarte de que no pierdes nada (puedes ver el progreso en la pantalla de inicio).';
}

// Path: profile.faq.1
class _StringsProfile$faq$0i1$Es extends _StringsProfile$faq$0i1$En {
	_StringsProfile$faq$0i1$Es._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Cómo puedo cambiar mi contraseña de Nextcloud?';
	@override String get a => 'Accede a la web de tu servidor e inicia sesión. Luego, accede a Ajustes > Seguridad > Cambiar contraseña. Necesitarás cerrar la sesión e iniciarla de nuevo en Saber tras cambiar la contraseña.';
}

// Path: profile.faq.2
class _StringsProfile$faq$0i2$Es extends _StringsProfile$faq$0i2$En {
	_StringsProfile$faq$0i2$Es._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Cómo cambio mi contraseña de cifrado?';
	@override String get a => '1. Cierra la sesión en Saber. Asegúrate de que la sincronización se completó antes de cerrar la sesión para asegurarte de que no pierdes nada (puedes ver el progreso en la pantalla de inicio).\n2. Accede a la web de tu servidor y elimina la carpeta \'Saber\'. Esto eliminará todas las notas del servidor.\n3. Inicia sesión de nuevo en Saber. Puedes elegir una nueva contraseña de cifrado al iniciar la sesión.\n4. No te olvides de cerrar e iniciar la sesión de Saber de nuevo en el resto de tus dispositivos.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$Es extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$Es._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Cómo puedo eliminar mi cuenta?';
	@override String get a => 'Pincha en el botón "${_root.profile.quickLinks.deleteAccount}", e inicia sesión si es necesario.\nSi estás usando el servidor oficial de Saber, tu cuenta se eliminará después de un periodo de una semana. Puedes contactar conmigo en la dirección adilhanney@disroot.org durante este tiempo para cancelar la eliminación.\nSi estás usando un servidor de terceros, puede ser que la opción de eliminar no exista: necesitas consultar la política de privacidad del servidor para más información.';
}

// Path: editor.toolbar
class _StringsEditorToolbarEs extends _StringsEditorToolbarEn {
	_StringsEditorToolbarEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Paleta de colores (Ctrl C)';
	@override String get select => 'Seleccionar';
	@override String get toggleEraser => 'Borrar (Ctrl E)';
	@override String get photo => 'Foto';
	@override String get text => 'Texto';
	@override String get toggleFingerDrawing => 'Dibujar con el dedo (Ctrl F)';
	@override String get undo => 'Deshacer';
	@override String get redo => 'Rehacer';
	@override String get export => 'Exportar (Ctrl Shift S)';
	@override String get exportAs => 'Exportar cómo:';
	@override String get fullscreen => 'Pantalla completa (F11)';
}

// Path: editor.pens
class _StringsEditorPensEs extends _StringsEditorPensEn {
	_StringsEditorPensEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Lápiz';
	@override String get ballpointPen => 'Bolígrafo';
	@override String get highlighter => 'Resaltador';
	@override String get laserPointer => 'Puntero láser';
	@override String get shapePen => 'Pluma de forma';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsEs extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get size => 'Tamaño';
	@override String get sizeDragHint => 'Arrastra hacia la izquierda o hacia la derecha para cambiar el tamaño';
}

// Path: editor.colors
class _StringsEditorColorsEs extends _StringsEditorColorsEn {
	_StringsEditorColorsEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Selector de color';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Personalizado ${b} ${h}';
	@override String customHue({required Object h}) => '${h} personalizados';
	@override String get dark => 'oscuro';
	@override String get light => 'luz';
	@override String get black => 'Negro';
	@override String get darkGrey => 'Gris oscuro';
	@override String get grey => 'Gris';
	@override String get lightGrey => 'Gris claro';
	@override String get white => 'Blanco';
	@override String get red => 'Rojo';
	@override String get green => 'Verde';
	@override String get blue => 'Azul';
	@override String get yellow => 'Amarillo';
	@override String get purple => 'Morado';
	@override String get orange => 'Naranja';
	@override String get pastelRed => 'Rojo pastel';
	@override String get pastelOrange => 'Naranja pastel';
	@override String get pastelYellow => 'Amarillo pastel';
	@override String get pastelGreen => 'Verde pastel';
	@override String get pastelCyan => 'Azul cyan pastel';
	@override String get pastelBlue => 'Azul pastel';
	@override String get pastelPurple => 'Morado pastel';
	@override String get pastelPink => 'Rosa pastel';
	@override String get cyan => 'cian';
	@override String get pink => 'Rosa';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsEs extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opciones de imagen';
	@override String get invertible => 'Invertible';
	@override String get download => 'Descargar';
	@override String get setAsBackground => 'Usar como fondo';
	@override String get removeAsBackground => 'Eliminar como fondo';
	@override String get delete => 'Eliminar';
}

// Path: editor.selectionBar
class _StringsEditorSelectionBarEs extends _StringsEditorSelectionBarEn {
	_StringsEditorSelectionBarEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Eliminar';
	@override String get duplicate => 'Duplicar';
}

// Path: editor.menu
class _StringsEditorMenuEs extends _StringsEditorMenuEn {
	_StringsEditorMenuEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Eliminar páginas ${page}/${totalPages}';
	@override String get clearAllPages => 'Borrar todas las páginas';
	@override String get insertPage => 'Insertar página debajo';
	@override String get duplicatePage => 'Duplicar página';
	@override String get deletePage => 'Eliminar página';
	@override String get lineHeight => 'Altura de la línea';
	@override String get lineHeightDescription => 'Controla también el tamaño del texto';
	@override String get backgroundImageFit => 'Ajuste de la imagen de fondo';
	@override String get backgroundPattern => 'Patrón de fondo';
	@override String get import => 'Importar';
	@override late final _StringsEditorMenuBoxFitsEs boxFits = _StringsEditorMenuBoxFitsEs._(_root);
	@override late final _StringsEditorMenuBgPatternsEs bgPatterns = _StringsEditorMenuBgPatternsEs._(_root);
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatEs extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Modo de solo lectura';
	@override String get title => 'Esta nota fue editada usando una versión más reciente de Saber';
	@override String get subtitle => 'La edición de esta nota puede resultar en la pérdida de cierta información. ¿Quieres ignorar esto y editarlo de todos modos?';
	@override String get allowEditing => 'Editar';
	@override String get cancel => 'Cancelar';
}

// Path: editor.quill
class _StringsEditorQuillEs extends _StringsEditorQuillEn {
	_StringsEditorQuillEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Escribe algo aquí...';
}

// Path: editor.hud
class _StringsEditorHudEs extends _StringsEditorHudEn {
	_StringsEditorHudEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Desbloquear zoom';
	@override String get lockZoom => 'Bloquear zoom';
	@override String get unlockSingleFingerPan => 'Habilitar la panorámica con un solo dedo';
	@override String get lockSingleFingerPan => 'Deshabilitar la panorámica con un solo dedo';
	@override String get unlockAxisAlignedPan => 'Desbloquear el desplazamiento a horizontal o vertical';
	@override String get lockAxisAlignedPan => 'Bloquear el desplazamiento a horizontal o vertical';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _StringsSettingsPrefDescriptionsHideFingerDrawingEs extends _StringsSettingsPrefDescriptionsHideFingerDrawingEn {
	_StringsSettingsPrefDescriptionsHideFingerDrawingEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Evita cambios accidentales';
	@override String get fixedOn => 'Dibujar o escribir con el dedo está activado';
	@override String get fixedOff => 'Dibujar o escribir con el dedo está desactivado';
}

// Path: editor.menu.boxFits
class _StringsEditorMenuBoxFitsEs extends _StringsEditorMenuBoxFitsEn {
	_StringsEditorMenuBoxFitsEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Llenar';
	@override String get cover => 'Cubrir';
	@override String get contain => 'Contener';
}

// Path: editor.menu.bgPatterns
class _StringsEditorMenuBgPatternsEs extends _StringsEditorMenuBgPatternsEn {
	_StringsEditorMenuBgPatternsEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get none => 'En blanco';
	@override String get college => 'Rayado universitario';
	@override String get collegeRtl => 'Rayado universitario (inverso)';
	@override String get lined => 'Rayado';
	@override String get grid => 'Cuadrículado';
	@override String get dots => 'Punteado';
	@override String get staffs => 'Pentagrama';
	@override String get tablature => 'Tablatura';
	@override String get cornell => 'Método Cornell';
}

// Path: <root>
class _StringsFa extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsFa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.fa,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <fa>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsFa _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeFa home = _StringsHomeFa._(_root);
	@override late final _StringsSettingsFa settings = _StringsSettingsFa._(_root);
	@override late final _StringsLoginFa login = _StringsLoginFa._(_root);
	@override late final _StringsProfileFa profile = _StringsProfileFa._(_root);
	@override late final _StringsAppInfoFa appInfo = _StringsAppInfoFa._(_root);
	@override late final _StringsUpdateFa update = _StringsUpdateFa._(_root);
	@override late final _StringsEditorFa editor = _StringsEditorFa._(_root);
}

// Path: home
class _StringsHomeFa extends _StringsHomeEn {
	_StringsHomeFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsFa tabs = _StringsHomeTabsFa._(_root);
	@override late final _StringsHomeTitlesFa titles = _StringsHomeTitlesFa._(_root);
	@override late final _StringsHomeTooltipsFa tooltips = _StringsHomeTooltipsFa._(_root);
	@override late final _StringsHomeCreateFa create = _StringsHomeCreateFa._(_root);
	@override String get welcome => 'خوش آمدید';
	@override String get noFiles => 'فایلی پیدا نشد';
	@override String get createNewNote => 'برای ساخت یادداشت دکمه + را بزنید';
	@override String get backFolder => 'به پوشه قبلی برگردید';
	@override late final _StringsHomeNewFolderFa newFolder = _StringsHomeNewFolderFa._(_root);
	@override late final _StringsHomeRenameNoteFa renameNote = _StringsHomeRenameNoteFa._(_root);
	@override late final _StringsHomeMoveNoteFa moveNote = _StringsHomeMoveNoteFa._(_root);
	@override String get deleteNote => 'حذف یادداشت';
	@override late final _StringsHomeRenameFolderFa renameFolder = _StringsHomeRenameFolderFa._(_root);
	@override late final _StringsHomeDeleteFolderFa deleteFolder = _StringsHomeDeleteFolderFa._(_root);
	@override String get invalidFormat => 'فایلی که انتخاب کرده اید پشتیبانی نمی شود. لطفاً یک فایل .sbn، .sbn2 یا pdf. انتخاب کنید.';
}

// Path: settings
class _StringsSettingsFa extends _StringsSettingsEn {
	_StringsSettingsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefCategoriesFa prefCategories = _StringsSettingsPrefCategoriesFa._(_root);
	@override late final _StringsSettingsPrefLabelsFa prefLabels = _StringsSettingsPrefLabelsFa._(_root);
	@override late final _StringsSettingsPrefDescriptionsFa prefDescriptions = _StringsSettingsPrefDescriptionsFa._(_root);
	@override late final _StringsSettingsThemeModesFa themeModes = _StringsSettingsThemeModesFa._(_root);
	@override late final _StringsSettingsLayoutSizesFa layoutSizes = _StringsSettingsLayoutSizesFa._(_root);
	@override late final _StringsSettingsAccentColorPickerFa accentColorPicker = _StringsSettingsAccentColorPickerFa._(_root);
	@override String get systemLanguage => 'زبان سیستم';
	@override List<String> get axisDirections => [
		'بالا',
		'راست',
		'پایین',
		'چپ',
	];
	@override late final _StringsSettingsResetFa reset = _StringsSettingsResetFa._(_root);
}

// Path: login
class _StringsLoginFa extends _StringsLoginEn {
	_StringsLoginFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'وارد شدن';
	@override late final _StringsLoginFeedbacksFa feedbacks = _StringsLoginFeedbacksFa._(_root);
	@override late final _StringsLoginFormFa form = _StringsLoginFormFa._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'حساب کاربری ندارید؟ '),
		linkToSignup('Sign up now'),
		const TextSpan(text: '!'),
	]);
	@override late final _StringsLoginStatusFa status = _StringsLoginStatusFa._(_root);
	@override List<dynamic> get faq => [
		_StringsLogin$faq$0i0$Fa._(_root),
		_StringsLogin$faq$0i1$Fa._(_root),
		_StringsLogin$faq$0i2$Fa._(_root),
		_StringsLogin$faq$0i3$Fa._(_root),
		_StringsLogin$faq$0i4$Fa._(_root),
	];
}

// Path: profile
class _StringsProfileFa extends _StringsProfileEn {
	_StringsProfileFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'پروفایل من';
	@override String get logout => 'خروج';
	@override late final _StringsProfileQuickLinksFa quickLinks = _StringsProfileQuickLinksFa._(_root);
	@override List<dynamic> get faq => [
		_StringsProfile$faq$0i0$Fa._(_root),
		_StringsProfile$faq$0i1$Fa._(_root),
		_StringsProfile$faq$0i2$Fa._(_root),
		_StringsProfile$faq$0i3$Fa._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoFa extends _StringsAppInfoEn {
	_StringsAppInfoFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nاین برنامه کاملاً بدون گارانتی ارائه می شود. این نرم‌افزار رایگان است و شما می‌توانید تحت شرایط خاصی آن را مجدداً توزیع کنید';
	@override String get dirty => 'دیرتی';
	@override String get debug => 'دیباگ';
	@override String get sponsorButton => 'برای حمایت مالی از من یا خرید فضای ذخیره بیشتر، اینجا ضربه بزنید';
	@override String get licenseButton => 'برای مشاهده اطلاعات بیشتر مجوز اینجا را ضربه بزنید';
	@override String get privacyPolicyButton => 'برای مشاهده سیاست حفظ حریم خصوصی اینجا را ضربه بزنید';
}

// Path: update
class _StringsUpdateFa extends _StringsUpdateEn {
	_StringsUpdateFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'به‌روزرسانی‌ در دسترس است';
	@override String get updateAvailableDescription => 'نسخه جدیدی از برنامه با این تغییرات در دسترس است:';
	@override String get update => 'بروزرسانی';
}

// Path: editor
class _StringsEditorFa extends _StringsEditorEn {
	_StringsEditorFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarFa toolbar = _StringsEditorToolbarFa._(_root);
	@override late final _StringsEditorPensFa pens = _StringsEditorPensFa._(_root);
	@override late final _StringsEditorPenOptionsFa penOptions = _StringsEditorPenOptionsFa._(_root);
	@override late final _StringsEditorColorsFa colors = _StringsEditorColorsFa._(_root);
	@override late final _StringsEditorImageOptionsFa imageOptions = _StringsEditorImageOptionsFa._(_root);
	@override late final _StringsEditorSelectionBarFa selectionBar = _StringsEditorSelectionBarFa._(_root);
	@override late final _StringsEditorMenuFa menu = _StringsEditorMenuFa._(_root);
	@override late final _StringsEditorNewerFileFormatFa newerFileFormat = _StringsEditorNewerFileFormatFa._(_root);
	@override late final _StringsEditorQuillFa quill = _StringsEditorQuillFa._(_root);
	@override late final _StringsEditorHudFa hud = _StringsEditorHudFa._(_root);
	@override String get pages => 'صفحات';
	@override String get untitled => 'بدون عنوان';
	@override String get needsToSaveBeforeExiting => 'در حال ذخیره تغییرات شما... می توانید با خیال راحت از ویرایشگر خارج شوید';
}

// Path: home.tabs
class _StringsHomeTabsFa extends _StringsHomeTabsEn {
	_StringsHomeTabsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get home => 'خانه';
	@override String get browse => 'مرور کردن';
	@override String get whiteboard => 'وایت برد';
	@override String get settings => 'تنظیمات';
}

// Path: home.titles
class _StringsHomeTitlesFa extends _StringsHomeTitlesEn {
	_StringsHomeTitlesFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get home => 'یادداشت های اخیر';
	@override String get browse => 'مرور کردن';
	@override String get whiteboard => 'وایت برد';
	@override String get settings => 'تنظیمات';
}

// Path: home.tooltips
class _StringsHomeTooltipsFa extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'یادداشت جدید';
	@override String get showUpdateDialog => 'نمایش به روز رسانی';
}

// Path: home.create
class _StringsHomeCreateFa extends _StringsHomeCreateEn {
	_StringsHomeCreateFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'یادداشت جدید';
	@override String get importNote => 'یادداشت وارد کنید';
}

// Path: home.newFolder
class _StringsHomeNewFolderFa extends _StringsHomeNewFolderEn {
	_StringsHomeNewFolderFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'پوشه جدید';
	@override String get folderName => 'نام پوشه';
	@override String get create => 'ايجاد كردن';
	@override String get folderNameEmpty => 'نام پوشه نمی تواند خالی باشد';
	@override String get folderNameContainsSlash => 'نام پوشه نمی تواند دارای اسلش باشد';
	@override String get folderNameExists => 'پوشه از قبل وجود دارد';
}

// Path: home.renameNote
class _StringsHomeRenameNoteFa extends _StringsHomeRenameNoteEn {
	_StringsHomeRenameNoteFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'تغییر نام یادداشت';
	@override String get noteName => 'نام یادداشت';
	@override String get rename => 'تغییر نام دهید';
	@override String get noteNameEmpty => 'نام یادداشت نمی‌تواند خالی باشد';
	@override String get noteNameContainsSlash => 'نام یادداشت نمی‌تواند دارای اسلش باشد';
	@override String get noteNameExists => 'یادداشتی با این نام از قبل وجود دارد';
}

// Path: home.moveNote
class _StringsHomeMoveNoteFa extends _StringsHomeMoveNoteEn {
	_StringsHomeMoveNoteFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'انتقال یادداشت';
	@override String moveName({required Object f}) => 'انتقال ${f}';
	@override String get move => 'انتقال';
	@override String renamedTo({required Object newName}) => 'یادداشت به ${newName} تغییر نام می یابد';
	@override String numberRenamedTo({required Object n}) => '${n} یادداشت برای جلوگیری از تداخل نام تغییر خواهد کرد';
	@override String moveNotes({required Object n}) => '${n} یادداشت را جابجا کنید';
	@override String get multipleRenamedTo => 'یادداشت های زیر تغییر خواهند کرد:';
}

// Path: home.renameFolder
class _StringsHomeRenameFolderFa extends _StringsHomeRenameFolderEn {
	_StringsHomeRenameFolderFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get folderNameEmpty => 'نام پوشه نمی تواند خالی باشد';
	@override String get folderNameContainsSlash => 'نام پوشه نمی تواند حاوی یک برش باشد';
	@override String get folderNameExists => 'پوشه ای با این نام از قبل وجود دارد';
	@override String get renameFolder => 'تغییر نام پوشه';
	@override String get folderName => 'نام پوشه';
	@override String get rename => 'تغییر نام دهید';
}

// Path: home.deleteFolder
class _StringsHomeDeleteFolderFa extends _StringsHomeDeleteFolderEn {
	_StringsHomeDeleteFolderFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'پوشه را حذف کنید';
	@override String deleteName({required Object f}) => '${f} را حذف کنید';
	@override String get delete => 'حذف';
	@override String get alsoDeleteContents => 'همچنین تمام یادداشت های داخل این پوشه را حذف کنید';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesFa extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get general => 'عمومی';
	@override String get writing => 'نوشتن';
	@override String get editor => 'ویرایشگر';
	@override String get advanced => 'پیشرفته';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsFa extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get locale => 'زبان برنامه';
	@override String get appTheme => 'تم برنامه';
	@override String get platform => 'نوع تم';
	@override String get layoutSize => 'نوع چیدمان';
	@override String get customAccentColor => 'رنگ سفارشی';
	@override String get hyperlegibleFont => 'فونت بیش از حد خوانا';
	@override String get shouldCheckForUpdates => 'به‌روزرسانی‌ برنامه را به‌طور خودکار بررسی کنید';
	@override String get shouldAlwaysAlertForUpdates => 'به روز رسانی سریع تر';
	@override String get disableAds => 'غیرفعال کردن تبلیغات';
	@override String get changeAdsConsent => 'تغییر رضایت تبلیغات';
	@override String get allowInsecureConnections => 'به اتصالات ناامن اجازه دهید';
	@override String get editorToolbarAlignment => 'تراز کردن نوار ابزار ویرایشگر';
	@override String get editorToolbarShowInFullscreen => 'نوار ابزار ویرایشگر را در حالت تمام صفحه نمایش دهید';
	@override String get editorAutoInvert => 'معکوس کردن رنگ یادداشت ها در حالت تاریک';
	@override String get editorOpaqueBackgrounds => 'پس زمینه مات';
	@override String get preferGreyscale => 'رنگ های خاکستری را در اولویت قرار دهید';
	@override String get maxImageSize => 'حداکثر اندازه تصویر';
	@override String get autoClearWhiteboardOnExit => 'پس از خروج از برنامه، وایت برد پاک شود';
	@override String get disableEraserAfterUse => 'پاک کن را به صورت خودکار غیرفعال کنید';
	@override String get hideFingerDrawingToggle => 'ضامن طراحی انگشت را پنهان کنید';
	@override String get editorPromptRename => 'از شما می خواهد که نام یادداشت های جدید را تغییر دهید';
	@override String get hideHomeBackgrounds => 'پس زمینه را در صفحه اصلی پنهان کنید';
	@override String get recentColorsDontSavePresets => 'رنگ های از پیش تعیین شده را در رنگ های اخیر ذخیره نکنید';
	@override String get printPageIndicators => 'چاپ نشانگرهای صفحه';
	@override String get autosaveDelay => 'تأخیر ذخیره خودکار';
	@override String get recentColorsLength => 'چند رنگ اخیر برای ذخیره';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsFa extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'خوانایی را برای خوانندگان کم بینا افزایش می دهد';
	@override String get disableAds => 'تبلیغات به پشتیبانی از توسعه Saber کمک می کند، اما در صورت تمایل می توانید آنها را غیرفعال کنید';
	@override String get allowInsecureConnections => '(توصیه نمی شود) به Saber اجازه دهید به سرورهایی با گواهینامه های خودامضا/غیر قابل اعتماد متصل شود';
	@override String get editorOpaqueBackgrounds => 'حذف شفافیت از تصاویر پس زمینه و PDFها';
	@override String get preferGreyscale => 'برای نمایشگر های e-ink';
	@override String get autoClearWhiteboardOnExit => 'همچنان با دستگاه‌های دیگر شما همگام‌سازی می‌شود';
	@override String get disableEraserAfterUse => 'پس از استفاده از پاک کن به صورت خودکار به خودکار برمی گردد';
	@override String get maxImageSize => 'تصاویر بزرگتر از این فشرده خواهند شد';
	@override late final _StringsSettingsPrefDescriptionsHideFingerDrawingFa hideFingerDrawing = _StringsSettingsPrefDescriptionsHideFingerDrawingFa._(_root);
	@override String get editorPromptRename => 'همیشه می توانید بعداً نام یادداشت ها را تغییر دهید';
	@override String get hideHomeBackgrounds => 'برای ظاهری تمیز تر';
	@override String get printPageIndicators => 'نمایش نشانگرهای صفحه در خروجی';
	@override String get autosaveDelay => 'چه مدت باید قبل از ذخیره خودکار یادداشت صبر کرد';
	@override String get shouldAlwaysAlertForUpdates => 'به محض اینکه به‌روزرسانی‌ها در دسترس هستند، به من بگویید';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesFa extends _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get system => 'سیستم';
	@override String get light => 'روشن';
	@override String get dark => 'تاریک';
}

// Path: settings.layoutSizes
class _StringsSettingsLayoutSizesFa extends _StringsSettingsLayoutSizesEn {
	_StringsSettingsLayoutSizesFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get auto => 'خودکار';
	@override String get phone => 'تلفن';
	@override String get tablet => 'تبلت';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerFa extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'یک رنگ انتخاب کنید';
}

// Path: settings.reset
class _StringsSettingsResetFa extends _StringsSettingsResetEn {
	_StringsSettingsResetFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'این تنظیمات را بازنشانی می کنید؟';
	@override String get button => 'بازنشانی';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksFa extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get checkUsername => 'لطفا نام کاربری یا ایمیل خود را دوباره چک کنید';
	@override String get enterNcPassword => 'لطفا رمز Nextcloud خود را وارد کنید';
	@override String get enterEncPassword => 'لطفا رمز رمزگذاری خود را وارد کنید';
	@override String get checkUrl => 'لطفا یک آدرس اینترنتی معتبر وارد کنید';
	@override String get ncLoginFailed => 'ورود ناموفق بود، لطفاً جزئیات و اتصال شبکه خود را بررسی کنید';
	@override String ncUnsupportedFailure({required Object v, required Object s}) => 'سرور داده شده Nextcloud ${v} را اجرا می کند اما این نسخه از Saber فقط از Nextcloud ${s} پشتیبانی می کند.';
	@override String get encLoginFailed => 'ورود ناموفق بود، لطفا رمز عبور رمزگذاری خود را بررسی کنید';
	@override String get loginSuccess => 'با موفقیت وارد شدید لطفا تا راه اندازی صبر کنید';
}

// Path: login.form
class _StringsLoginFormFa extends _StringsLoginFormEn {
	_StringsLoginFormFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get useCustomServer => 'من می خواهم از یک سرور Nextcloud سفارشی استفاده کنم';
	@override String get customServerUrl => 'آدرس اینترنتی سرور سفارشی';
	@override String get username => 'نام کاربری یا ایمیل';
	@override String get ncPassword => 'رمز ورود Nextcloud';
	@override String get encPassword => 'رمز رمزگذاری';
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'با ورود به سیستم، با قوانین موافقت خواهد شد '),
		linkToPrivacyPolicy('Privacy Policy'),
		const TextSpan(text: '.'),
	]);
	@override String get login => 'وارد شدن';
}

// Path: login.status
class _StringsLoginStatusFa extends _StringsLoginStatusEn {
	_StringsLoginStatusFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => 'وارد شدن با Nextcloud';
	@override String get loggedOut => 'خروج';
	@override String get tapToLogin => 'برای ورود با Nextcloud ضربه بزنید';
}

// Path: login.faq.0
class _StringsLogin$faq$0i0$Fa extends _StringsLogin$faq$0i0$En {
	_StringsLogin$faq$0i0$Fa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nextcloud چیست؟';
	@override String get a => 'نکست کلاود یک سرور خصوصی همگام سازی فایل است، در میان چیزهای دیگر. می‌توانید از سرور پیش‌فرض Nextcloud ما استفاده کنید، از یک سرور شخص ثالث استفاده کنید یا برای کنترل کامل داده‌های خود، سرور خود را میزبانی کنید.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$Fa extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$Fa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get q => 'رمز عبور رمزنگاری چیست؟';
	@override String get a => 'رمز عبور رمزگذاری برای رمزگذاری داده های شما قبل از ارسال به سرور استفاده می شود.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Fa extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Fa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get q => 'چرا از دو رمز عبور استفاده میشود؟';
	@override String get a => 'رمز عبور Nextcloud برای دسترسی به ابر استفاده می شود و رمزعبور دوم برای رمزنگاری استفاده میشود';
}

// Path: login.faq.3
class _StringsLogin$faq$0i3$Fa extends _StringsLogin$faq$0i3$En {
	_StringsLogin$faq$0i3$Fa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get q => 'اگر از 2FA استفاده کنم چگونه وارد سیستم شوم؟';
	@override String get a => 'به جای رمز عبور عادی Nextcloud خود، باید یک "گذرواژه برنامه" ایجاد کنید. می‌توانید این کار را در تنظیمات Nextcloud خود در بخش امنیت > دستگاه‌ها و جلسات > ایجاد رمز عبور برنامه جدید انجام دهید. رمز رمزگذاری شما تحت تأثیر قرار نمیگیرد است.';
}

// Path: login.faq.4
class _StringsLogin$faq$0i4$Fa extends _StringsLogin$faq$0i4$En {
	_StringsLogin$faq$0i4$Fa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get q => 'آیا می توانم از یک رمز عبور برای هر دو استفاده کنم؟';
	@override String get a => 'بله، اما انجام این کار امنیت کمتری دارد. از آنجایی که رمز عبور Nextcloud شما به سرور ارسال می شود، شخصی که به سرور دسترسی دارد می تواند یادداشت های شما را رمزگشایی کند. فقط در صورتی از همان رمز عبور استفاده کنید که به مالک سرور اعتماد دارید.';
}

// Path: profile.quickLinks
class _StringsProfileQuickLinksFa extends _StringsProfileQuickLinksEn {
	_StringsProfileQuickLinksFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'لینک های سریع';
	@override String get serverHomepage => 'صفحه اصلی سرور';
	@override String get deleteAccount => 'حذف حساب';
}

// Path: profile.faq.0
class _StringsProfile$faq$0i0$Fa extends _StringsProfile$faq$0i0$En {
	_StringsProfile$faq$0i0$Fa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get q => 'ایا اگر خارج شوم یادداشت هایم را از دست خواهم داد؟';
	@override String get a => 'خیر. یادداشت‌های شما هم روی دستگاه و هم روی سرور باقی می‌مانند. تا زمانی که دوباره وارد سیستم نشوید با سرور همگام‌سازی نمی‌شوند. قبل از خروج از سیستم مطمئن شوید که همگام‌سازی کامل شده است تا هیچ داده‌ای را از دست ندهید (پیشرفت همگام‌سازی را در صفحه اصلی ببینید).';
}

// Path: profile.faq.1
class _StringsProfile$faq$0i1$Fa extends _StringsProfile$faq$0i1$En {
	_StringsProfile$faq$0i1$Fa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get q => 'چگونه رمز عبور Nextcloud خود را تغییر دهم؟';
	@override String get a => 'به وب سایت سرور خود بروید و وارد شوید. سپس به تنظیمات > امنیت > تغییر رمز عبور بروید. پس از تغییر رمز عبور، باید از سیستم خارج شوید و دوباره وارد Saber شوید.';
}

// Path: profile.faq.2
class _StringsProfile$faq$0i2$Fa extends _StringsProfile$faq$0i2$En {
	_StringsProfile$faq$0i2$Fa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get q => 'چگونه رمز رمزگذاری خود را تغییر دهم؟';
	@override String get a => '1. از Saber خارج شوید. قبل از خروج از سیستم مطمئن شوید که همگام‌سازی کامل شده است تا هیچ داده‌ای را از دست ندهید (پیشرفت همگام‌سازی را در صفحه اصلی ببینید).\n2. به وب سایت سرور خود بروید و پوشه \'Saber\' خود را حذف کنید. با این کار تمام یادداشت های شما از سرور حذف می شود.\n3. دوباره وارد سابر شوید. هنگام ورود به سیستم می‌توانید رمز رمزگذاری جدیدی انتخاب کنید.\n4. فراموش نکنید که از سیستم خارج شوید و در دستگاه های دیگر خود نیز دوباره وارد Saber شوید.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$Fa extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$Fa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get q => 'چگونه می توانم حساب کاربری خود را حذف کنم؟';
	@override String get a => 'روی دکمه "${_root.profile.quickLinks.deleteAccount}" در بالا ضربه بزنید و در صورت نیاز وارد شوید.\nاگر از سرور رسمی Saber استفاده می‌کنید، حساب شما پس از یک هفته مهلت حذف می‌شود. می‌توانید در این مدت با من در adilhanney@disroot.org تماس بگیرید تا حذف را لغو کنید.\nاگر از یک سرور شخص ثالث استفاده می‌کنید، ممکن است گزینه‌ای برای حذف حساب شما وجود نداشته باشد: باید با حفظ حریم خصوصی سرور مشورت کنید. سیاست برای اطلاعات بیشتر';
}

// Path: editor.toolbar
class _StringsEditorToolbarFa extends _StringsEditorToolbarEn {
	_StringsEditorToolbarFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'تغییر رنگ (Ctrl C)';
	@override String get select => 'اتخاب';
	@override String get toggleEraser => 'تغییر پاک کن (Ctrl E)';
	@override String get photo => 'عکس';
	@override String get text => 'متن';
	@override String get toggleFingerDrawing => 'تغییر دادن نقاشی با انگشت (Ctrl F)';
	@override String get undo => 'واگرد';
	@override String get redo => 'برگشت';
	@override String get export => 'صدور (Ctrl Shift S)';
	@override String get exportAs => 'صدور به عنوان:';
	@override String get fullscreen => 'تغییر به تمام صفحه (F11)';
}

// Path: editor.pens
class _StringsEditorPensFa extends _StringsEditorPensEn {
	_StringsEditorPensFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'خودنویس';
	@override String get ballpointPen => 'خودکار';
	@override String get highlighter => 'هایلایتر';
	@override String get laserPointer => 'اشاره گر لیزری';
	@override String get shapePen => 'قلم شکل';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsFa extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get size => 'اندازه';
	@override String get sizeDragHint => 'برای تغییر اندازه به چپ یا راست بکشید';
}

// Path: editor.colors
class _StringsEditorColorsFa extends _StringsEditorColorsEn {
	_StringsEditorColorsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'انتخاب کننده رنگ';
	@override String customBrightnessHue({required Object b, required Object h}) => 'سفارشی ${b} ${h}';
	@override String customHue({required Object h}) => 'سفارشی ${h}';
	@override String get dark => 'تاریک';
	@override String get light => 'سبک';
	@override String get black => 'مشکی';
	@override String get darkGrey => 'خاکستری تیره';
	@override String get grey => 'خاکستری';
	@override String get lightGrey => 'خاکستری روشن';
	@override String get white => 'سفید';
	@override String get red => 'قرمز';
	@override String get green => 'سبز';
	@override String get blue => 'آبی';
	@override String get yellow => 'زرد';
	@override String get purple => 'بنفش';
	@override String get orange => 'نارنجی';
	@override String get pastelRed => 'قرمز پاستلی';
	@override String get pastelOrange => 'نارنجی پاستلی';
	@override String get pastelYellow => 'زرد پاستلی';
	@override String get pastelGreen => 'سبز پاستلی';
	@override String get pastelCyan => 'فیروزه ای پاستلی';
	@override String get pastelBlue => 'آبی پاستلی';
	@override String get pastelPurple => 'بنفش پاستلی';
	@override String get pastelPink => 'صورتی پاستلی';
	@override String get cyan => 'فیروزه ای';
	@override String get pink => 'رنگ صورتی';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsFa extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'گزینه های تصویر';
	@override String get invertible => 'معکوس پذیر';
	@override String get download => 'دانلود';
	@override String get setAsBackground => 'قرار دادن به عنوان تصویر زمینه';
	@override String get removeAsBackground => 'حذف از پس زمینه';
	@override String get delete => 'حذف';
}

// Path: editor.selectionBar
class _StringsEditorSelectionBarFa extends _StringsEditorSelectionBarEn {
	_StringsEditorSelectionBarFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get delete => 'حذف';
	@override String get duplicate => 'تکراری';
}

// Path: editor.menu
class _StringsEditorMenuFa extends _StringsEditorMenuEn {
	_StringsEditorMenuFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'صفحه ${page}/${totalPages} را پاک کنید';
	@override String get clearAllPages => 'تمام صفحات را پاک کنید';
	@override String get insertPage => 'درج صفحه در زیر';
	@override String get duplicatePage => 'تکرار صفحه';
	@override String get deletePage => 'حذف صفحه';
	@override String get lineHeight => 'ارتفاع خط';
	@override String get lineHeightDescription => 'همچنین اندازه متن را کنترل می کند';
	@override String get backgroundPattern => 'الگوی پس زمینه';
	@override String get import => 'واردکردن';
	@override late final _StringsEditorMenuBoxFitsFa boxFits = _StringsEditorMenuBoxFitsFa._(_root);
	@override late final _StringsEditorMenuBgPatternsFa bgPatterns = _StringsEditorMenuBgPatternsFa._(_root);
	@override String get backgroundImageFit => 'تصویر پس زمینه';
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatFa extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'حالت فقط خواندنی';
	@override String get title => 'این یادداشت با استفاده از نسخه جدیدتر برنامه ویرایش شده است';
	@override String get subtitle => 'ویرایش این یادداشت ممکن است منجر به از بین رفتن برخی از اطلاعات شود. آیا می خواهید این را نادیده بگیرید و به هر حال آن را ویرایش کنید؟';
	@override String get allowEditing => 'اجازه ویرایش';
	@override String get cancel => 'لغو';
}

// Path: editor.quill
class _StringsEditorQuillFa extends _StringsEditorQuillEn {
	_StringsEditorQuillFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'اینجا چیزی تایپ کنید...';
}

// Path: editor.hud
class _StringsEditorHudFa extends _StringsEditorHudEn {
	_StringsEditorHudFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'قفل زوم را باز کنید';
	@override String get lockZoom => 'قفل زوم';
	@override String get unlockSingleFingerPan => 'تحرک تک انگشتی را فعال کنید';
	@override String get lockSingleFingerPan => 'تحرک تک انگشتی را غیرفعال کنید';
	@override String get unlockAxisAlignedPan => 'باز کردن قفل حرکت به حالت افقی یا عمودی';
	@override String get lockAxisAlignedPan => 'پانینگ را به صورت افقی یا عمودی قفل کنید';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _StringsSettingsPrefDescriptionsHideFingerDrawingFa extends _StringsSettingsPrefDescriptionsHideFingerDrawingEn {
	_StringsSettingsPrefDescriptionsHideFingerDrawingFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get shown => 'از جابجایی تصادفی جلوگیری می کند';
	@override String get fixedOn => 'طراحی با انگشت به صورت فعال ثابت شده است';
	@override String get fixedOff => 'طراحی با انگشت به عنوان غیرفعال ثابت است';
}

// Path: editor.menu.boxFits
class _StringsEditorMenuBoxFitsFa extends _StringsEditorMenuBoxFitsEn {
	_StringsEditorMenuBoxFitsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get fill => 'کش آمدن';
	@override String get cover => 'پوشش دادن';
	@override String get contain => 'محتوی';
}

// Path: editor.menu.bgPatterns
class _StringsEditorMenuBgPatternsFa extends _StringsEditorMenuBgPatternsEn {
	_StringsEditorMenuBgPatternsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get none => 'جای خالی';
	@override String get college => 'قوانین کالج';
	@override String get collegeRtl => 'تحت حاکمیت دانشگاهی (معکوس)';
	@override String get lined => 'خط کشی شده';
	@override String get grid => 'توری';
	@override String get dots => 'نقطه ای';
	@override String get staffs => 'کارکنان';
	@override String get cornell => 'کرنل';
	@override String get tablature => 'جدول بندی';
}

// Path: <root>
class _StringsFr extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsFr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsFr _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeFr home = _StringsHomeFr._(_root);
	@override late final _StringsSettingsFr settings = _StringsSettingsFr._(_root);
	@override late final _StringsLoginFr login = _StringsLoginFr._(_root);
	@override late final _StringsProfileFr profile = _StringsProfileFr._(_root);
	@override late final _StringsAppInfoFr appInfo = _StringsAppInfoFr._(_root);
	@override late final _StringsUpdateFr update = _StringsUpdateFr._(_root);
	@override late final _StringsEditorFr editor = _StringsEditorFr._(_root);
}

// Path: home
class _StringsHomeFr extends _StringsHomeEn {
	_StringsHomeFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsFr tabs = _StringsHomeTabsFr._(_root);
	@override late final _StringsHomeTitlesFr titles = _StringsHomeTitlesFr._(_root);
	@override late final _StringsHomeTooltipsFr tooltips = _StringsHomeTooltipsFr._(_root);
	@override late final _StringsHomeCreateFr create = _StringsHomeCreateFr._(_root);
	@override String get welcome => 'Bienvenue dans Saber';
	@override String get invalidFormat => 'Type de fichier non supporté. Veuillez choisr un fichier .sbn, .sbn2 ou .pdf.';
	@override String get noFiles => 'Aucun fichier trouvé';
	@override String get createNewNote => 'Presser le bouton + pour créer une nouvelle note';
	@override String get backFolder => 'Retour au dossier précédent';
	@override late final _StringsHomeNewFolderFr newFolder = _StringsHomeNewFolderFr._(_root);
	@override late final _StringsHomeRenameNoteFr renameNote = _StringsHomeRenameNoteFr._(_root);
	@override late final _StringsHomeMoveNoteFr moveNote = _StringsHomeMoveNoteFr._(_root);
	@override String get deleteNote => 'Effacer la note';
	@override late final _StringsHomeRenameFolderFr renameFolder = _StringsHomeRenameFolderFr._(_root);
	@override late final _StringsHomeDeleteFolderFr deleteFolder = _StringsHomeDeleteFolderFr._(_root);
}

// Path: settings
class _StringsSettingsFr extends _StringsSettingsEn {
	_StringsSettingsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefCategoriesFr prefCategories = _StringsSettingsPrefCategoriesFr._(_root);
	@override late final _StringsSettingsPrefLabelsFr prefLabels = _StringsSettingsPrefLabelsFr._(_root);
	@override late final _StringsSettingsPrefDescriptionsFr prefDescriptions = _StringsSettingsPrefDescriptionsFr._(_root);
	@override late final _StringsSettingsThemeModesFr themeModes = _StringsSettingsThemeModesFr._(_root);
	@override late final _StringsSettingsLayoutSizesFr layoutSizes = _StringsSettingsLayoutSizesFr._(_root);
	@override late final _StringsSettingsAccentColorPickerFr accentColorPicker = _StringsSettingsAccentColorPickerFr._(_root);
	@override String get systemLanguage => 'Langue système';
	@override List<String> get axisDirections => [
		'Haut',
		'Droite',
		'Bas',
		'Gauche',
	];
	@override late final _StringsSettingsResetFr reset = _StringsSettingsResetFr._(_root);
}

// Path: login
class _StringsLoginFr extends _StringsLoginEn {
	_StringsLoginFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Connexion';
	@override late final _StringsLoginFeedbacksFr feedbacks = _StringsLoginFeedbacksFr._(_root);
	@override late final _StringsLoginFormFr form = _StringsLoginFormFr._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Pas encore de compte ? '),
		linkToSignup('Sign up now'),
		const TextSpan(text: ' !'),
	]);
	@override late final _StringsLoginStatusFr status = _StringsLoginStatusFr._(_root);
	@override List<dynamic> get faq => [
		_StringsLogin$faq$0i0$Fr._(_root),
		_StringsLogin$faq$0i1$Fr._(_root),
		_StringsLogin$faq$0i2$Fr._(_root),
		_StringsLogin$faq$0i3$Fr._(_root),
		_StringsLogin$faq$0i4$Fr._(_root),
	];
}

// Path: profile
class _StringsProfileFr extends _StringsProfileEn {
	_StringsProfileFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mon profil';
	@override String get logout => 'Déconnexion';
	@override late final _StringsProfileQuickLinksFr quickLinks = _StringsProfileQuickLinksFr._(_root);
	@override List<dynamic> get faq => [
		_StringsProfile$faq$0i0$Fr._(_root),
		_StringsProfile$faq$0i1$Fr._(_root),
		_StringsProfile$faq$0i2$Fr._(_root),
		_StringsProfile$faq$0i3$Fr._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoFr extends _StringsAppInfoEn {
	_StringsAppInfoFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nCe programme est livré sans aucune garantie. Il s\'agit d\'un logiciel libre, et vous pouvez le diffuser sous certaines conditions.';
	@override String get dirty => 'DIRTY';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Appuyer ici pour me soutenir ou acheter ou acheter plus d\'espace de stockage';
	@override String get licenseButton => 'Appuyer ici pour plus d\'information de licence';
	@override String get privacyPolicyButton => 'Appuyez ici pour voir la politique de confidentialité';
}

// Path: update
class _StringsUpdateFr extends _StringsUpdateEn {
	_StringsUpdateFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Mise à jour disponible';
	@override String get updateAvailableDescription => 'Une nouvelle version de cette application est disponible, avec les changements suivants :';
	@override String get update => 'Mettre à jour';
}

// Path: editor
class _StringsEditorFr extends _StringsEditorEn {
	_StringsEditorFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarFr toolbar = _StringsEditorToolbarFr._(_root);
	@override late final _StringsEditorPensFr pens = _StringsEditorPensFr._(_root);
	@override late final _StringsEditorPenOptionsFr penOptions = _StringsEditorPenOptionsFr._(_root);
	@override late final _StringsEditorColorsFr colors = _StringsEditorColorsFr._(_root);
	@override late final _StringsEditorImageOptionsFr imageOptions = _StringsEditorImageOptionsFr._(_root);
	@override late final _StringsEditorSelectionBarFr selectionBar = _StringsEditorSelectionBarFr._(_root);
	@override late final _StringsEditorMenuFr menu = _StringsEditorMenuFr._(_root);
	@override late final _StringsEditorNewerFileFormatFr newerFileFormat = _StringsEditorNewerFileFormatFr._(_root);
	@override late final _StringsEditorQuillFr quill = _StringsEditorQuillFr._(_root);
	@override late final _StringsEditorHudFr hud = _StringsEditorHudFr._(_root);
	@override String get pages => 'Pages';
	@override String get untitled => 'Sans titre';
	@override String get needsToSaveBeforeExiting => 'Sauvegarde en cours... Vous pourrez quitter l\'éditeur en toute sécurité une fois qu\'elle sera terminée';
}

// Path: home.tabs
class _StringsHomeTabsFr extends _StringsHomeTabsEn {
	_StringsHomeTabsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Accueil';
	@override String get browse => 'Parcourir';
	@override String get whiteboard => 'Tableau blanc';
	@override String get settings => 'Paramètres';
}

// Path: home.titles
class _StringsHomeTitlesFr extends _StringsHomeTitlesEn {
	_StringsHomeTitlesFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Notes récentes';
	@override String get browse => 'Parcourir';
	@override String get whiteboard => 'Tableau blanc';
	@override String get settings => 'Paramètres';
}

// Path: home.tooltips
class _StringsHomeTooltipsFr extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nouvelle note';
	@override String get showUpdateDialog => 'Afficher le dialogue de mise à jour';
}

// Path: home.create
class _StringsHomeCreateFr extends _StringsHomeCreateEn {
	_StringsHomeCreateFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nouvelle note';
	@override String get importNote => 'Importer une note';
}

// Path: home.newFolder
class _StringsHomeNewFolderFr extends _StringsHomeNewFolderEn {
	_StringsHomeNewFolderFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Nouveau dossier';
	@override String get folderName => 'Mom du dossier';
	@override String get create => 'Créer';
	@override String get folderNameEmpty => 'Le nom de fichier ne peut pas être vide';
	@override String get folderNameContainsSlash => 'Le nom de fichier ne peut pas contenir une barre oblique';
	@override String get folderNameExists => 'Un fichier du même nom existe déjà';
}

// Path: home.renameNote
class _StringsHomeRenameNoteFr extends _StringsHomeRenameNoteEn {
	_StringsHomeRenameNoteFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Renommer une note';
	@override String get noteName => 'Nom de note';
	@override String get rename => 'Renommer';
	@override String get noteNameEmpty => 'Le nom de note ne peut pas être vide';
	@override String get noteNameContainsSlash => 'Le nom de note ne peut pas contenir une barre oblique';
	@override String get noteNameExists => 'Une note du même nom existe déjà';
}

// Path: home.moveNote
class _StringsHomeMoveNoteFr extends _StringsHomeMoveNoteEn {
	_StringsHomeMoveNoteFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Déplacer la note';
	@override String moveName({required Object f}) => 'Déplacer ${f}';
	@override String get move => 'Déplacer';
	@override String renamedTo({required Object newName}) => 'La note sera renommée en ${newName}';
	@override String moveNotes({required Object n}) => 'Déplacer les notes ${n}';
	@override String get multipleRenamedTo => 'Les notes suivantes seront renommées :';
	@override String numberRenamedTo({required Object n}) => '${n} notes sera renommé pour éviter les conflits';
}

// Path: home.renameFolder
class _StringsHomeRenameFolderFr extends _StringsHomeRenameFolderEn {
	_StringsHomeRenameFolderFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Renommer le dossier';
	@override String get folderName => 'Nom de dossier';
	@override String get rename => 'Renommer';
	@override String get folderNameEmpty => 'Le nom de dossier ne peut pas être vide';
	@override String get folderNameContainsSlash => 'Le nom de dossier ne peut pas contenir une barre oblique';
	@override String get folderNameExists => 'Un dossier du même nom existe déjà';
}

// Path: home.deleteFolder
class _StringsHomeDeleteFolderFr extends _StringsHomeDeleteFolderEn {
	_StringsHomeDeleteFolderFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Supprimer le dossier';
	@override String deleteName({required Object f}) => 'Supprimer ${f}';
	@override String get delete => 'Supprimer';
	@override String get alsoDeleteContents => 'Supprimer aussi toutes les notes rangées dans ce dossier';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesFr extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get general => 'Général';
	@override String get writing => 'Tracé';
	@override String get editor => 'Editeur';
	@override String get advanced => 'Avancé';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsFr extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Langue';
	@override String get appTheme => 'Thème de l\'application';
	@override String get platform => 'Type de thème';
	@override String get layoutSize => 'Type de disposition';
	@override String get customAccentColor => 'Couleur d\'accentuation personnalisée';
	@override String get hyperlegibleFont => 'Fonte Hyperlegible';
	@override String get shouldCheckForUpdates => 'Rechercher automatiquement les mises à jour';
	@override String get shouldAlwaysAlertForUpdates => 'M\'alerter à chaque mise à jour';
	@override String get disableAds => 'Désactiver les publicités';
	@override String get changeAdsConsent => 'Modifier le consentement aux publicités';
	@override String get allowInsecureConnections => 'Autoriser les connexions non sécurisées';
	@override String get editorToolbarAlignment => 'Position de la barre d\'outils';
	@override String get editorToolbarShowInFullscreen => 'Afficher la barre d\'outils en mode plein écran';
	@override String get editorAutoInvert => 'Inverser les couleurs en mode sombre';
	@override String get editorOpaqueBackgrounds => 'Fonds opaques';
	@override String get preferGreyscale => 'Préférer les nuances de gris';
	@override String get maxImageSize => 'Taille d\'image maximum';
	@override String get autoClearWhiteboardOnExit => 'Effacer le tableau blanc quand vous fermez l\'application';
	@override String get disableEraserAfterUse => 'Désactiver automatiquement la gomme après usage';
	@override String get hideFingerDrawingToggle => 'Cacher l\'icône d\'activation/désactivation de tracé au doigt';
	@override String get editorPromptRename => 'Vous rappeler de renommer les notes';
	@override String get hideHomeBackgrounds => 'Cacher le fond de la page d\'accueil';
	@override String get recentColorsDontSavePresets => 'Ne pas conserver les couleurs pré-définies parmi les couleurs récentes';
	@override String get printPageIndicators => 'Imprimer les numéros de pages';
	@override String get autosaveDelay => 'Délai entre les sauvegardes automatiques';
	@override String get recentColorsLength => 'Combien de couleurs récentes stocker';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsFr extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'La fonte Atkinson Hyperlegible améliore la lisibilité pour les personnes malvoyantes';
	@override String get disableAds => 'Les publicités aident au développement de Saber, mais vous pouvez les désactiver si vous le souhaitez';
	@override String get allowInsecureConnections => '(Déconseillé) Autoriser Saber à se connecter à des serveurs dont les certificats sont auto-signés/non-sécurisé';
	@override String get editorOpaqueBackgrounds => 'Supprime la transparence du fond dans les images et les PDF';
	@override String get preferGreyscale => 'Pour les couleurs de stylos proposées';
	@override String get autoClearWhiteboardOnExit => 'Il restera synchronisé avec vos autres appareils';
	@override String get disableEraserAfterUse => 'Revenir automatiquement au stylo après usage de la gomme';
	@override String get maxImageSize => 'Les images plus grandes seront compressées';
	@override late final _StringsSettingsPrefDescriptionsHideFingerDrawingFr hideFingerDrawing = _StringsSettingsPrefDescriptionsHideFingerDrawingFr._(_root);
	@override String get editorPromptRename => 'Vous pourrez toujours les renommer plus tard';
	@override String get hideHomeBackgrounds => 'Pour une apparence plus sobre';
	@override String get printPageIndicators => 'Montrer les numéros de pages dans les exportations';
	@override String get autosaveDelay => 'Combien de temps attendre avant de sauvegarder automatiquement une note';
	@override String get shouldAlwaysAlertForUpdates => 'Me prévenir dès qu\'une mise à jour est disponible';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesFr extends _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Système';
	@override String get light => 'Clair';
	@override String get dark => 'Foncé';
}

// Path: settings.layoutSizes
class _StringsSettingsLayoutSizesFr extends _StringsSettingsLayoutSizesEn {
	_StringsSettingsLayoutSizesFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Auto';
	@override String get phone => 'Smartphone';
	@override String get tablet => 'Tablette';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerFr extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Choisir une couleur';
}

// Path: settings.reset
class _StringsSettingsResetFr extends _StringsSettingsResetEn {
	_StringsSettingsResetFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rétablir les valeurs par défaut ?';
	@override String get button => 'Défaut';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksFr extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get checkUsername => 'Veuillez verifier votre nom d\'utilisateur ou votre e-mail.';
	@override String get enterNcPassword => 'Veuiller saisir votre mot de passe Nextcloud.';
	@override String get enterEncPassword => 'Veuillez saisir votre mot de passe de cryptage.';
	@override String get checkUrl => 'Veuillez saisir une URL valide.';
	@override String get ncLoginFailed => 'La connexion a échoué, veuillez vérifier vos identifiants et votre connexion réseau.';
	@override String ncUnsupportedFailure({required Object v, required Object s}) => 'Le serveur indiqué utilise Nextcloud ${v} mais cette version de Saber ne supporte que Nextcloud ${s}.';
	@override String get encLoginFailed => 'La connexion a échoué, veuillez vérifier votre mot de passe de cryptage.';
	@override String get loginSuccess => 'Connexion reussie ! Veuillez patienter pendant la configuration...';
}

// Path: login.form
class _StringsLoginFormFr extends _StringsLoginFormEn {
	_StringsLoginFormFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get useCustomServer => 'Je veux utiliser un serveur Nextcloud personnalisé';
	@override String get customServerUrl => 'URL du serveur personnalisé';
	@override String get username => 'Nom d\'utilisateur ou adresse mel';
	@override String get ncPassword => 'Mot de passe Nextcloud';
	@override String get encPassword => 'Mot de passe de cryptage';
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'En vous connectant, vous acceptez les '),
		linkToPrivacyPolicy('Privacy Policy'),
		const TextSpan(text: '.'),
	]);
	@override String get login => 'Se connecter';
}

// Path: login.status
class _StringsLoginStatusFr extends _StringsLoginStatusEn {
	_StringsLoginStatusFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => 'Connecté avec Nextcloud';
	@override String get loggedOut => 'Déconnecté';
	@override String get tapToLogin => 'Appuyer pour vous connecter avec Nextcloud';
}

// Path: login.faq.0
class _StringsLogin$faq$0i0$Fr extends _StringsLogin$faq$0i0$En {
	_StringsLogin$faq$0i0$Fr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Qu\'est-ce que Nextcloud ?';
	@override String get a => 'Nextcloud est, entre autres choses, un serveur privé de synchronisation de fichiers. Vous pouvez utiliser le serveur Nextcloud par défaut de Saber, utiliser un serveur tiers ou auto-héberger le vôtre pour un contrôle total de vos données.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$Fr extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$Fr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Qu\'est-ce que le mot de passe de cryptage ?';
	@override String get a => 'Le mot de passe de cryptage est utilisé pour crypter vos données avant qu\'elles ne soient envoyées au serveur. Vous le créez lors de votre première connexion à Saber, et il est indépendant de votre compte et de votre mot de passe sur Nextcloud.\nPersonne ne peut accéder à vos notes sur le serveur sans votre mot de passe de chiffrement. Cela implique aussi que si vous oubliez votre mot de passe de cryptage, vous perdrez l\'accès à vos données.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Fr extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Fr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Pourquoi utiliser deux mots de passe ?';
	@override String get a => 'Le mot de passe Nextcloud est utilisé pour accéder au nuage (cloud). Le mot de passe de cryptage "brouille" vos données avant même qu\'elles n\'atteignent le nuage.\nMême si quelqu\'un accède à votre compte Nextcloud, vos notes resteront sécurisées et cryptées avec un mot de passe distinct. Cela crée un deuxième niveau de sécurité pour protéger vos données.';
}

// Path: login.faq.3
class _StringsLogin$faq$0i3$Fr extends _StringsLogin$faq$0i3$En {
	_StringsLogin$faq$0i3$Fr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Comment me connecter si j\'utilise 2FA ?';
	@override String get a => 'Au lieu d\'utiliser votre mot de passe Nextcloud habituel, vous devrez créer un "mot de passe d\'application". Vous pouvez le faire dans les paramètres de Nextcloud, via Sécurité > Appareils & sessions > Créer un nouveau mot de passe d\'application. Votre mot de passe de cryptage reste inchangé.';
}

// Path: login.faq.4
class _StringsLogin$faq$0i4$Fr extends _StringsLogin$faq$0i4$En {
	_StringsLogin$faq$0i4$Fr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Puis-je utiliser le même mot de passe pour les deux ?';
	@override String get a => 'Oui, mais c\'est moins sécurisé. Comme votre mot de passe sur Nextcloud est envoyé au serveur, toute personne qui y aurait accès pourrait decrypter vos notes. N\'utilisez le même mot de passe que si vous faites confiance aux personnes qui gèrent le serveur.';
}

// Path: profile.quickLinks
class _StringsProfileQuickLinksFr extends _StringsProfileQuickLinksEn {
	_StringsProfileQuickLinksFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Raccourcis';
	@override String get serverHomepage => 'Page d\'accueil du serveur';
	@override String get deleteAccount => 'Supprimer le compte';
}

// Path: profile.faq.0
class _StringsProfile$faq$0i0$Fr extends _StringsProfile$faq$0i0$En {
	_StringsProfile$faq$0i0$Fr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Vais-je perdre mes notes si je me déconnecte ?';
	@override String get a => 'Non. Vos notes seront conservées à la fois sur votre poste et sur le serveur. Elles ne seront pas synchronisées avec le serveur jusqu\'à votre prochaine connexion. Assurez-vous que la synchronisation soit terminée avant de vous déconnecter pour ne perdre aucune donnée (consultez la barre de progression sur l\'écran d\'accueil).';
}

// Path: profile.faq.1
class _StringsProfile$faq$0i1$Fr extends _StringsProfile$faq$0i1$En {
	_StringsProfile$faq$0i1$Fr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Comment changer mon mot de passe Nextcloud ?';
	@override String get a => 'Allez sur le site web du serveur et connectez-vous. Allez dans Paramètres > Sécurité > Changer mon mot de passe. Vous devrez vous déconnecter et vous reconnecter dans Saber après avoir changé votre mot de passe.';
}

// Path: profile.faq.2
class _StringsProfile$faq$0i2$Fr extends _StringsProfile$faq$0i2$En {
	_StringsProfile$faq$0i2$Fr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Comment changer mon mot de passe de chiffrement ?';
	@override String get a => '1. Déconnectez-vous de Saber. Assurez-vous que la synchronisation soit terminée avant de vous déconnecter afin de ne perdre aucune donnée (consultez la barre de progression sur l\'écran d\'accueil).\n2. Sur le site web du serveur supprimez votre dossier \'Saber\'. Cela supprimera toutes vos notes sur le serveur.\n3. Connectez-vous à nouveau dans Saber. Vous pourrez choisir un nouveau mot de passe de chiffrement à la connexion.\n4. N\'oubliez pas de vous déconnecter et vous re-connecter dans Saber sur votre poste également.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$Fr extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$Fr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Comment puis-je supprimer mon compte ?';
	@override String get a => 'Cliquez sur le button "${_root.profile.quickLinks.deleteAccount}" ci-dessus, et connectez-vous si nécessaire.\nSi vous utilisez le serveur Saber officiel, votre compte sera supprimé au bout d\'une semaine . Durant cette période, vous pourrez me contacter à adilhanney@disroot.org pour annuler la suppression.\nSi vous utilisez un autre serveur, il n\'est pas certain que vous puissiez supprimer votre compte dessus : il vous faudra consulter les règles de confidentialité du serveur pour plus d\'informations.';
}

// Path: editor.toolbar
class _StringsEditorToolbarFr extends _StringsEditorToolbarEn {
	_StringsEditorToolbarFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Afficher/cacher les couleurs (Ctrl C)';
	@override String get select => 'Sélectionner';
	@override String get toggleEraser => 'Activer/désactiver la gomme (Ctrl E)';
	@override String get photo => 'Images';
	@override String get text => 'Texte';
	@override String get toggleFingerDrawing => 'Activer/désactiver le tracé (Ctrl F)';
	@override String get undo => 'Annuler';
	@override String get redo => 'Refaire';
	@override String get export => 'Exporter (Ctrl Shift S)';
	@override String get exportAs => 'Exporter comme :';
	@override String get fullscreen => 'Basculer en plein ecran (F11)';
}

// Path: editor.pens
class _StringsEditorPensFr extends _StringsEditorPensEn {
	_StringsEditorPensFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Stylo encre';
	@override String get ballpointPen => 'Stylo bille';
	@override String get highlighter => 'Surligneur';
	@override String get laserPointer => 'Pointeur laser';
	@override String get shapePen => 'Stylo de forme';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsFr extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get size => 'Taille';
	@override String get sizeDragHint => 'Glisser vers la gauche ou la droite pour changer la taille';
}

// Path: editor.colors
class _StringsEditorColorsFr extends _StringsEditorColorsEn {
	_StringsEditorColorsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Pipette de couleur';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Personnalisé ${b} ${h}';
	@override String customHue({required Object h}) => '${h} personnalisé';
	@override String get dark => 'sombre';
	@override String get light => 'lumière';
	@override String get black => 'Noir';
	@override String get darkGrey => 'Gris sombre';
	@override String get grey => 'Gris';
	@override String get lightGrey => 'Gris clair';
	@override String get white => 'Blanc';
	@override String get red => 'Rouge';
	@override String get green => 'Vert';
	@override String get blue => 'Bleu';
	@override String get yellow => 'Jaune';
	@override String get purple => 'Violet';
	@override String get orange => 'Orange';
	@override String get pastelRed => 'Rouge pâle';
	@override String get pastelOrange => 'Orange pâle';
	@override String get pastelYellow => 'Jaune pâle';
	@override String get pastelGreen => 'Vert pâle';
	@override String get pastelCyan => 'Cyan pâle';
	@override String get pastelBlue => 'Bleu pâle';
	@override String get pastelPurple => 'Violet pâle';
	@override String get pastelPink => 'Rose pâle';
	@override String get pink => 'Rose';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsFr extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Options d\'image';
	@override String get invertible => 'Couleurs inversibles';
	@override String get download => 'Télécharger';
	@override String get setAsBackground => 'Utiliser comme fond';
	@override String get removeAsBackground => 'Supprimer de l\'arrière-plan';
	@override String get delete => 'Effacer';
}

// Path: editor.selectionBar
class _StringsEditorSelectionBarFr extends _StringsEditorSelectionBarEn {
	_StringsEditorSelectionBarFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Effacer';
	@override String get duplicate => 'Dupliquer';
}

// Path: editor.menu
class _StringsEditorMenuFr extends _StringsEditorMenuEn {
	_StringsEditorMenuFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Effacer la page ${page}/${totalPages}';
	@override String get clearAllPages => 'Effacer toutes les pages';
	@override String get insertPage => 'Insérer une page après';
	@override String get duplicatePage => 'Dupliquer la page';
	@override String get deletePage => 'Supprimer la page';
	@override String get lineHeight => 'Hauteur de ligne';
	@override String get lineHeightDescription => 'Contrôle aussi la taille du texte';
	@override String get backgroundImageFit => 'Adaptation de l\'image de fond';
	@override String get backgroundPattern => 'Texture de fond';
	@override String get import => 'Importer';
	@override late final _StringsEditorMenuBoxFitsFr boxFits = _StringsEditorMenuBoxFitsFr._(_root);
	@override late final _StringsEditorMenuBgPatternsFr bgPatterns = _StringsEditorMenuBgPatternsFr._(_root);
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatFr extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Mode lecture seule';
	@override String get title => 'Cette note a été modifiée avec une version plus récente de Saber';
	@override String get subtitle => 'Éditer cette note pourrait entraîner la perte de certaines informations. Voulez-vous la modifier quand même ?';
	@override String get allowEditing => 'Autoriser les modifications';
	@override String get cancel => 'Annuler';
}

// Path: editor.quill
class _StringsEditorQuillFr extends _StringsEditorQuillEn {
	_StringsEditorQuillFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Taper du texte ici...';
}

// Path: editor.hud
class _StringsEditorHudFr extends _StringsEditorHudEn {
	_StringsEditorHudFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Déverrouiller le zoom';
	@override String get lockZoom => 'Verrouiller le zoom';
	@override String get unlockSingleFingerPan => 'Activer le défilement à un seul doigt';
	@override String get lockSingleFingerPan => 'Désactiver le défilement à un seul doigt';
	@override String get unlockAxisAlignedPan => 'Déverrouiller le panoramique à l\'horizontale ou à la verticale';
	@override String get lockAxisAlignedPan => 'Verrouiller le panoramique à l\'horizontale ou à la verticale';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _StringsSettingsPrefDescriptionsHideFingerDrawingFr extends _StringsSettingsPrefDescriptionsHideFingerDrawingEn {
	_StringsSettingsPrefDescriptionsHideFingerDrawingFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Empêcher l\'activation/désactivation accidentelle';
	@override String get fixedOn => 'Le tracé au doigt est fixé à activé';
	@override String get fixedOff => 'Le tracé au doigt est fixé à désactivé';
}

// Path: editor.menu.boxFits
class _StringsEditorMenuBoxFitsFr extends _StringsEditorMenuBoxFitsEn {
	_StringsEditorMenuBoxFitsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get fill => 'S\'ajuste';
	@override String get cover => 'Couvre';
	@override String get contain => 'Contient';
}

// Path: editor.menu.bgPatterns
class _StringsEditorMenuBgPatternsFr extends _StringsEditorMenuBgPatternsEn {
	_StringsEditorMenuBgPatternsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get none => 'Vide';
	@override String get college => 'Lignes et marge';
	@override String get collegeRtl => 'College-ruled (Reverse)';
	@override String get lined => 'Lignes';
	@override String get grid => 'Grille';
	@override String get dots => 'Points';
	@override String get staffs => 'Staffs';
	@override String get tablature => 'Tablature';
	@override String get cornell => 'Cornell';
}

// Path: <root>
class _StringsHe extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsHe.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.he,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <he>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsHe _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeHe home = _StringsHomeHe._(_root);
	@override late final _StringsSettingsHe settings = _StringsSettingsHe._(_root);
	@override late final _StringsLoginHe login = _StringsLoginHe._(_root);
	@override late final _StringsProfileHe profile = _StringsProfileHe._(_root);
	@override late final _StringsAppInfoHe appInfo = _StringsAppInfoHe._(_root);
	@override late final _StringsUpdateHe update = _StringsUpdateHe._(_root);
	@override late final _StringsEditorHe editor = _StringsEditorHe._(_root);
}

// Path: home
class _StringsHomeHe extends _StringsHomeEn {
	_StringsHomeHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsHe tabs = _StringsHomeTabsHe._(_root);
	@override late final _StringsHomeTitlesHe titles = _StringsHomeTitlesHe._(_root);
	@override late final _StringsHomeTooltipsHe tooltips = _StringsHomeTooltipsHe._(_root);
	@override late final _StringsHomeCreateHe create = _StringsHomeCreateHe._(_root);
	@override String get welcome => 'ברוכים הבאים ל Saber';
	@override String get invalidFormat => 'הקובץ שבחרת אינו תומך. אנא בחר בקובץ .sbn\' .sbn2 או .pdf';
	@override String get noFiles => 'קבצים לא נמצאו';
	@override String get createNewNote => 'הקש על הלחצן + כדי ליצור הערה חדשה';
	@override String get backFolder => 'חזור אחורה לתקייה הקודמת';
	@override late final _StringsHomeNewFolderHe newFolder = _StringsHomeNewFolderHe._(_root);
	@override late final _StringsHomeRenameNoteHe renameNote = _StringsHomeRenameNoteHe._(_root);
	@override late final _StringsHomeMoveNoteHe moveNote = _StringsHomeMoveNoteHe._(_root);
	@override String get deleteNote => 'מחק פתק';
	@override late final _StringsHomeRenameFolderHe renameFolder = _StringsHomeRenameFolderHe._(_root);
	@override late final _StringsHomeDeleteFolderHe deleteFolder = _StringsHomeDeleteFolderHe._(_root);
}

// Path: settings
class _StringsSettingsHe extends _StringsSettingsEn {
	_StringsSettingsHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefCategoriesHe prefCategories = _StringsSettingsPrefCategoriesHe._(_root);
	@override late final _StringsSettingsPrefLabelsHe prefLabels = _StringsSettingsPrefLabelsHe._(_root);
	@override late final _StringsSettingsPrefDescriptionsHe prefDescriptions = _StringsSettingsPrefDescriptionsHe._(_root);
	@override late final _StringsSettingsThemeModesHe themeModes = _StringsSettingsThemeModesHe._(_root);
	@override late final _StringsSettingsLayoutSizesHe layoutSizes = _StringsSettingsLayoutSizesHe._(_root);
	@override late final _StringsSettingsAccentColorPickerHe accentColorPicker = _StringsSettingsAccentColorPickerHe._(_root);
	@override String get systemLanguage => 'ברירת מחדל';
	@override List<String> get axisDirections => [
		'למעלה',
		'ימין',
		'למטה',
		'שמאל',
	];
	@override late final _StringsSettingsResetHe reset = _StringsSettingsResetHe._(_root);
}

// Path: login
class _StringsLoginHe extends _StringsLoginEn {
	_StringsLoginHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'התחבר';
	@override late final _StringsLoginFeedbacksHe feedbacks = _StringsLoginFeedbacksHe._(_root);
	@override late final _StringsLoginFormHe form = _StringsLoginFormHe._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'אין לך עוד משתמש '),
		linkToSignup('הירשם עכשיו'),
		const TextSpan(text: '!'),
	]);
	@override late final _StringsLoginStatusHe status = _StringsLoginStatusHe._(_root);
	@override List<dynamic> get faq => [
		_StringsLogin$faq$0i0$He._(_root),
		_StringsLogin$faq$0i1$He._(_root),
		_StringsLogin$faq$0i2$He._(_root),
		_StringsLogin$faq$0i3$He._(_root),
		_StringsLogin$faq$0i4$He._(_root),
	];
}

// Path: profile
class _StringsProfileHe extends _StringsProfileEn {
	_StringsProfileHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הפרופיל שלי';
	@override String get logout => 'התנתק';
	@override late final _StringsProfileQuickLinksHe quickLinks = _StringsProfileQuickLinksHe._(_root);
	@override List<dynamic> get faq => [
		_StringsProfile$faq$0i0$He._(_root),
		_StringsProfile$faq$0i1$He._(_root),
		_StringsProfile$faq$0i2$He._(_root),
		_StringsProfile$faq$0i3$He._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoHe extends _StringsAppInfoEn {
	_StringsAppInfoHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nתוכנית זו מגיעה ללא כל אחריות. זוהי תוכנה חופשית ואתה מוזמן להפיץ אותו מחדש בתנאים מסוימים.';
	@override String get dirty => 'מלוכלך';
	@override String get debug => 'דִּיבָּג';
	@override String get sponsorButton => 'הקש כאן כדי לתת לי חסות או לקנות שטח אחסון נוסף';
	@override String get licenseButton => 'הקש כאן כדי להציג פרטי רישיון נוספים';
	@override String get privacyPolicyButton => 'הקש כאן כדי להציג את מדיניות הפרטיות';
}

// Path: update
class _StringsUpdateHe extends _StringsUpdateEn {
	_StringsUpdateHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'עדכון זמין';
	@override String get updateAvailableDescription => 'גרסה חדשה של היישום זמינה עם שינויים אלה:';
	@override String get update => 'עדכן';
}

// Path: editor
class _StringsEditorHe extends _StringsEditorEn {
	_StringsEditorHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarHe toolbar = _StringsEditorToolbarHe._(_root);
	@override late final _StringsEditorPensHe pens = _StringsEditorPensHe._(_root);
	@override late final _StringsEditorPenOptionsHe penOptions = _StringsEditorPenOptionsHe._(_root);
	@override late final _StringsEditorColorsHe colors = _StringsEditorColorsHe._(_root);
	@override late final _StringsEditorImageOptionsHe imageOptions = _StringsEditorImageOptionsHe._(_root);
	@override late final _StringsEditorSelectionBarHe selectionBar = _StringsEditorSelectionBarHe._(_root);
	@override late final _StringsEditorMenuHe menu = _StringsEditorMenuHe._(_root);
	@override late final _StringsEditorNewerFileFormatHe newerFileFormat = _StringsEditorNewerFileFormatHe._(_root);
	@override late final _StringsEditorQuillHe quill = _StringsEditorQuillHe._(_root);
	@override late final _StringsEditorHudHe hud = _StringsEditorHudHe._(_root);
	@override String get pages => 'דפים';
	@override String get untitled => 'חסר כותרת';
	@override String get needsToSaveBeforeExiting => 'שמירת השינויים... אתה יכול לצאת בבטחה מהעורך בסיום';
}

// Path: home.tabs
class _StringsHomeTabsHe extends _StringsHomeTabsEn {
	_StringsHomeTabsHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get home => 'בית';
	@override String get browse => 'דפדף';
	@override String get whiteboard => 'לוח לבן';
	@override String get settings => 'הגדרות';
}

// Path: home.titles
class _StringsHomeTitlesHe extends _StringsHomeTitlesEn {
	_StringsHomeTitlesHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get home => 'פתקים אחרונים';
	@override String get browse => 'דפדף';
	@override String get whiteboard => 'לוח לבן';
	@override String get settings => 'הגדרות';
}

// Path: home.tooltips
class _StringsHomeTooltipsHe extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'פתק חדש';
	@override String get showUpdateDialog => 'תיבת הדו-שיח הצג עדכון';
}

// Path: home.create
class _StringsHomeCreateHe extends _StringsHomeCreateEn {
	_StringsHomeCreateHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'פתק חדש';
	@override String get importNote => 'יבא פתק';
}

// Path: home.newFolder
class _StringsHomeNewFolderHe extends _StringsHomeNewFolderEn {
	_StringsHomeNewFolderHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'תקייה חדשה';
	@override String get folderName => 'שם התקייה';
	@override String get create => 'צור';
	@override String get folderNameEmpty => 'שם התקייה לא יכול להיות ריק';
	@override String get folderNameContainsSlash => 'שם התקייה לא יכול להכיל לוכסן';
	@override String get folderNameExists => 'תקייה כבר קיימת';
}

// Path: home.renameNote
class _StringsHomeRenameNoteHe extends _StringsHomeRenameNoteEn {
	_StringsHomeRenameNoteHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'שנה את שם הפתק';
	@override String get noteName => 'שם הפתק';
	@override String get rename => 'שנה שם';
	@override String get noteNameEmpty => 'שם הערה לא יכול להיות ריק';
	@override String get noteNameContainsSlash => 'שם הערה לא יכול להכיל קו נטוי';
	@override String get noteNameExists => 'הערה בשם זה כבר קיימת';
}

// Path: home.moveNote
class _StringsHomeMoveNoteHe extends _StringsHomeMoveNoteEn {
	_StringsHomeMoveNoteHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'הזז פתק';
	@override String moveName({required Object f}) => 'הזז ${f}';
	@override String get move => 'הזז';
	@override String renamedTo({required Object newName}) => 'שם הפתק ישתנה ל ${newName}';
	@override String moveNotes({required Object n}) => 'העבר ${n} פתקים';
	@override String get multipleRenamedTo => 'שמות ההערות הבאות ישונו:';
	@override String numberRenamedTo({required Object n}) => 'השם של ${n} הערות ישונה כדי למנוע התנגשויות';
}

// Path: home.renameFolder
class _StringsHomeRenameFolderHe extends _StringsHomeRenameFolderEn {
	_StringsHomeRenameFolderHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'שנה את שם התקייה';
	@override String get folderName => 'שם התקייה';
	@override String get rename => 'שנה שם';
	@override String get folderNameEmpty => 'שם התקייה לא יכול להיות ריק';
	@override String get folderNameContainsSlash => 'שם התקייה לא יכול להכיל לוכסן';
	@override String get folderNameExists => 'תקייה כבר קיימת';
}

// Path: home.deleteFolder
class _StringsHomeDeleteFolderHe extends _StringsHomeDeleteFolderEn {
	_StringsHomeDeleteFolderHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'מחק תקייה';
	@override String deleteName({required Object f}) => 'מחק ${f}';
	@override String get delete => 'מחק';
	@override String get alsoDeleteContents => 'גם תמחק את כל הפתקים בתקייה זו';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesHe extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get general => 'כללי';
	@override String get writing => 'כתיבה';
	@override String get editor => 'עורך';
	@override String get advanced => 'מתקדם';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsHe extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get locale => 'שפת התוכנה';
	@override String get appTheme => 'ערכת הנושא של האפליקציה';
	@override String get platform => 'סוג ערכת הנושא';
	@override String get layoutSize => 'סוג פריסה';
	@override String get customAccentColor => 'צבע הדגשה מותאם אישית';
	@override String get hyperlegibleFont => 'גופן Atkinson Hyperreadible';
	@override String get shouldCheckForUpdates => 'בדוק אם קיימים עדכוני Saber';
	@override String get shouldAlwaysAlertForUpdates => 'עדכונים מהירים יותר';
	@override String get disableAds => 'השבת פרסומות';
	@override String get changeAdsConsent => 'שנה את הסכמת המודעות';
	@override String get allowInsecureConnections => 'אפשר חיבורים לא מאובטחים';
	@override String get editorToolbarAlignment => 'מיקום סרגל הכלים';
	@override String get editorToolbarShowInFullscreen => 'הצג את סרגל הכלים במצב מסך מלא';
	@override String get editorAutoInvert => 'הפוך הערות במצב כהה';
	@override String get editorOpaqueBackgrounds => 'רקעים אטומים';
	@override String get preferGreyscale => 'העדיפו צבעי גווני אפור';
	@override String get maxImageSize => 'גודל תמונה מקסימלי';
	@override String get autoClearWhiteboardOnExit => 'נקה אוטומטית את הלוח הלבן';
	@override String get disableEraserAfterUse => 'השבת אוטומטית את המחק';
	@override String get hideFingerDrawingToggle => 'הסתר את מתג ציור האצבע';
	@override String get editorPromptRename => 'מבקש ממך לשנות את שם הערות חדשות';
	@override String get hideHomeBackgrounds => 'הסתר רקעים במסך הבית';
	@override String get recentColorsDontSavePresets => 'אל תשמור צבעים מוגדרים מראש בצבעים אחרונים';
	@override String get printPageIndicators => 'הדפסת עמודים מחוונים';
	@override String get autosaveDelay => 'השהיית שמירה אוטומטית';
	@override String get recentColorsLength => 'כמה צבעים אחרונים לאחסן';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsHe extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'מגביר את הקריאות למשתמשים עם ראייה לקויה';
	@override String get disableAds => 'מודעות עוזרות לתמוך בפיתוח של סאבר, אבל אתה יכול להשבית אותן אם תרצה';
	@override String get allowInsecureConnections => '(לא מומלץ) אפשר לסבר להתחבר לשרתים עם אישורים חתומים/לא מהימנים';
	@override String get editorOpaqueBackgrounds => 'הסר שקיפות מתמונות רקע וקובצי PDF';
	@override String get preferGreyscale => 'עבור תצוגות דיו אלקטרוני';
	@override String get autoClearWhiteboardOnExit => 'מנקה את לוח הציור לאחר היציאה מהאפליקציה';
	@override String get disableEraserAfterUse => 'מעבר אוטומטי חזרה לעט לאחר שימוש במחק';
	@override String get maxImageSize => 'תמונות גדולות יותר יידחסו';
	@override late final _StringsSettingsPrefDescriptionsHideFingerDrawingHe hideFingerDrawing = _StringsSettingsPrefDescriptionsHideFingerDrawingHe._(_root);
	@override String get editorPromptRename => 'תמיד תוכל לשנות את שם הפתקים מאוחר יותר';
	@override String get hideHomeBackgrounds => 'למראה נקי יותר';
	@override String get printPageIndicators => 'הצג מחווני עמודים בייצוא';
	@override String get autosaveDelay => 'כמה זמן לחכות לפני שמירת הערה אוטומטית';
	@override String get shouldAlwaysAlertForUpdates => 'ספר לי על עדכונים ברגע שהם יהיו זמינים';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesHe extends _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get system => 'מערכת';
	@override String get light => 'בהיר';
	@override String get dark => 'כהה';
}

// Path: settings.layoutSizes
class _StringsSettingsLayoutSizesHe extends _StringsSettingsLayoutSizesEn {
	_StringsSettingsLayoutSizesHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get auto => 'אוטומטי';
	@override String get phone => 'טלפון';
	@override String get tablet => 'טאבלט';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerHe extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'בחר צבע';
}

// Path: settings.reset
class _StringsSettingsResetHe extends _StringsSettingsResetEn {
	_StringsSettingsResetHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'אפס הגדרה זו?';
	@override String get button => 'אפס';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksHe extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get checkUsername => 'אנא בדוק שוב את שם המשתמש או הדוא"ל שלך.';
	@override String get enterNcPassword => 'הזן את סיסמת NextCloud שלך.';
	@override String get enterEncPassword => 'הזן את סיסמת ההצפנה שלך.';
	@override String get checkUrl => 'הזן כתובת URL חוקית.';
	@override String get ncLoginFailed => 'הכניסה נכשלה, אנא בדוק את הפרטים שלך ואת חיבור הרשת.';
	@override String ncUnsupportedFailure({required Object v, required Object s}) => 'השרת הנתון מריץ את NextCloud ${v} אך גרסה זו של Saber תומכת רק ב- NextCloud ${s}.';
	@override String get encLoginFailed => 'הכניסה נכשלה, אנא בדוק את סיסמת ההצפנה שלך.';
	@override String get loginSuccess => 'ההתחבר בהצלחה! אנא המתן בזמן שאנו מגדירים...';
}

// Path: login.form
class _StringsLoginFormHe extends _StringsLoginFormEn {
	_StringsLoginFormHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get useCustomServer => 'אני רוצה להשתמש בשרת Nextcloud מותאם אישית';
	@override String get customServerUrl => 'כתובת אתר מותאמת אישית של שרת';
	@override String get username => 'שם משתמש או אימייל';
	@override String get ncPassword => 'סיסמת NextCloud';
	@override String get encPassword => 'סיסמה מוצפנת';
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'על ידי התחברות, אתה מסכים ל '),
		linkToPrivacyPolicy('מדיניות הפרטיות'),
		const TextSpan(text: '.'),
	]);
	@override String get login => 'התחבר';
}

// Path: login.status
class _StringsLoginStatusHe extends _StringsLoginStatusEn {
	_StringsLoginStatusHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => 'מחובר עם NextCloud';
	@override String get loggedOut => 'מנותק';
	@override String get tapToLogin => 'לחץ כדי להתחבר עם NextCloud';
}

// Path: login.faq.0
class _StringsLogin$faq$0i0$He extends _StringsLogin$faq$0i0$En {
	_StringsLogin$faq$0i0$He._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'מה זה Nextcloud?';
	@override String get a => 'Nextcloud הוא שרת סנכרון קבצים פרטי, בין היתר. אתה יכול להשתמש בשרת ברירת המחדל של Saber Nextcloud, להשתמש בשרת של צד שלישי או לארח בעצמך לשליטה מלאה בנתונים שלך.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$He extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$He._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'מהי הסיסמא המוצפנת?';
	@override String get a => 'סיסמת ההצפנה משמשת להצפנת הנתונים שלך לפני שליחתם לשרת. אתה בוחר את זה כשאתה נכנס לראשונה ל-Saber, וזה לא קשור לחשבון/סיסמת Nextcloud שלך.\nאף אחד לא יכול לגשת להערות שלך בשרת ללא סיסמת ההצפנה שלך. זה גם אומר שאם תשכח את סיסמת ההצפנה שלך, תאבד את הגישה לנתונים שלך.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$He extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$He._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'למה להשתמש בשתי סיסמאות?';
	@override String get a => 'סיסמת Nextcloud משמשת לגישה לענן. סיסמת ההצפנה "מערבלת" את הנתונים שלך לפני שהם מגיעים לענן.\n גם אם מישהו יקבל גישה לחשבון Nextcloud שלך, ההערות שלך יישארו בטוחות ומוצפנות עם סיסמה נפרדת. זה מספק לך שכבה שנייה של אבטחה כדי להגן על הנתונים שלך.';
}

// Path: login.faq.3
class _StringsLogin$faq$0i3$He extends _StringsLogin$faq$0i3$En {
	_StringsLogin$faq$0i3$He._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'איך אני מתחבר אם אני משתמש ב-2FA?';
	@override String get a => 'במקום סיסמת Nextcloud הרגילה שלך, תצטרך ליצור "app password". תוכל לעשות זאת בהגדרות Nextcloud שלך תחת אבטחה > מכשירים והפעלות > צור סיסמת אפליקציה חדשה. סיסמת ההצפנה שלך לא מושפעת.';
}

// Path: login.faq.4
class _StringsLogin$faq$0i4$He extends _StringsLogin$faq$0i4$En {
	_StringsLogin$faq$0i4$He._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Can I use the same password for both?';
	@override String get a => 'כן, אבל זה פחות מאובטח. מכיוון שסיסמת Nextcloud שלך נשלחת לשרת, מישהו עם גישה לשרת יוכל לפענח את ההערות שלך. השתמש באותה סיסמה רק אם אתה סומך על בעל השרת.';
}

// Path: profile.quickLinks
class _StringsProfileQuickLinksHe extends _StringsProfileQuickLinksEn {
	_StringsProfileQuickLinksHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'קישורים מהירים';
	@override String get serverHomepage => 'דף הבית של השרת';
	@override String get deleteAccount => 'מחק משתמש';
}

// Path: profile.faq.0
class _StringsProfile$faq$0i0$He extends _StringsProfile$faq$0i0$En {
	_StringsProfile$faq$0i0$He._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'אני אאבד את הפתקים שלי אם אני אתנתק?';
	@override String get a => 'לא. ההערות שלך יישארו גם במכשיר וגם בשרת. הם לא יסונכרנו עם השרת עד שתתחבר חזרה. ודא שהסנכרון הושלם לפני היציאה כדי שלא תאבד נתונים (ראה את התקדמות הסנכרון במסך הבית).';
}

// Path: profile.faq.1
class _StringsProfile$faq$0i1$He extends _StringsProfile$faq$0i1$En {
	_StringsProfile$faq$0i1$He._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'איך אני משנה את סיסמאת ה NextCloud שלי';
	@override String get a => 'עבור לאתר השרת שלך והתחבר. לאחר מכן עבור אל הגדרות > אבטחה > שנה סיסמה. תצטרך להתנתק ולהיכנס שוב ל-Saber לאחר שינוי הסיסמה שלך.';
}

// Path: profile.faq.2
class _StringsProfile$faq$0i2$He extends _StringsProfile$faq$0i2$En {
	_StringsProfile$faq$0i2$He._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'איך אני משנה את הסיסמא המוצפנת שלי?';
	@override String get a => '0. ודא שהסנכרון הושלם (ראה את התקדמות הסנכרון במסך הבית).\n1. התנתק מ Saber.\n2. עבור אל אתר האינטרנט של השרת שלך ומחק את התיקיה \'Saber\' שלך. פעולה זו תמחק את כל ההערות שלך מהשרת.\n3. היכנס שוב ל-Saber. אתה יכול לבחור סיסמת הצפנה חדשה בעת הכניסה.\n4. אל תשכח להתנתק ולהתחבר שוב ל-Saber גם במכשירים האחרים שלך.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$He extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$He._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'איך אני יכול למחוק את החשבון שלי?';
	@override String get a => 'הקש על הלחצן "${_root.profile.quickLinks.deleteAccount}" למעלה, והיכנס במידת הצורך.\n אם אתה משתמש בשרת Saber הרשמי, החשבון שלך יימחק לאחר תקופת חסד של שבוע. ניתן ליצור איתי קשר בכתובת adilhanney@disroot.org במהלך תקופה זו כדי לבטל את המחיקה.\n אם אתה משתמש בשרת של צד שלישי, ייתכן שלא תהיה אפשרות למחוק את חשבונך: תצטרך לעיין במדיניות הפרטיות של השרת לקבלת מידע נוסף.';
}

// Path: editor.toolbar
class _StringsEditorToolbarHe extends _StringsEditorToolbarEn {
	_StringsEditorToolbarHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'החלפת מצב צבע (Ctrl C)';
	@override String get select => 'בחר';
	@override String get toggleEraser => 'החלפת מצב מחק (Ctrl E)';
	@override String get photo => 'תמונות';
	@override String get text => 'טקסט';
	@override String get toggleFingerDrawing => 'החלפת מצב ציור אצבע (Ctrl F)';
	@override String get undo => 'בטל';
	@override String get redo => 'שחזר ביטול';
	@override String get export => 'יצא (Ctrl Shift S)';
	@override String get exportAs => 'יצא כ:';
	@override String get fullscreen => 'החלפת מצב מסך מלא (F11)';
}

// Path: editor.pens
class _StringsEditorPensHe extends _StringsEditorPensEn {
	_StringsEditorPensHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'עט נובע';
	@override String get ballpointPen => 'עט כדורי';
	@override String get highlighter => 'מרקר';
	@override String get laserPointer => 'סמן לייזר';
	@override String get shapePen => 'עט צורה';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsHe extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get size => 'גודל';
	@override String get sizeDragHint => 'גרור שמאלה או ימינה כדי לשנות את הגודל';
}

// Path: editor.colors
class _StringsEditorColorsHe extends _StringsEditorColorsEn {
	_StringsEditorColorsHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'בורר צבעים';
	@override String customBrightnessHue({required Object b, required Object h}) => 'מותאם אישית ${b} ${h}';
	@override String customHue({required Object h}) => 'מותאם אישית ${h}';
	@override String get dark => 'אפל';
	@override String get light => 'אוֹר';
	@override String get black => 'שחור';
	@override String get darkGrey => 'עפור ככה';
	@override String get grey => 'עפור';
	@override String get lightGrey => 'עפור בהיר';
	@override String get white => 'לבן';
	@override String get red => 'אדום';
	@override String get green => 'ירוק';
	@override String get blue => 'כחול';
	@override String get yellow => 'צהוב';
	@override String get purple => 'סגול';
	@override String get orange => 'כתום';
	@override String get pastelRed => 'אדום פסטל';
	@override String get pastelOrange => 'כתום פסטל';
	@override String get pastelYellow => 'צהוב פסטל';
	@override String get pastelGreen => 'ירוק פסטל';
	@override String get pastelCyan => 'תכלת פסטל';
	@override String get pastelBlue => 'כחול פסטל';
	@override String get pastelPurple => 'סגול פסטל';
	@override String get pastelPink => 'ורוד פסטל';
	@override String get cyan => 'טורקיז';
	@override String get pink => 'וָרוֹד';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsHe extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'אפשרויות תמונה';
	@override String get invertible => 'הפיך';
	@override String get download => 'הורד';
	@override String get setAsBackground => 'הגדר כרקע';
	@override String get removeAsBackground => 'הסר כרקע';
	@override String get delete => 'מחק';
}

// Path: editor.selectionBar
class _StringsEditorSelectionBarHe extends _StringsEditorSelectionBarEn {
	_StringsEditorSelectionBarHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get delete => 'מחק';
	@override String get duplicate => 'שכפל';
}

// Path: editor.menu
class _StringsEditorMenuHe extends _StringsEditorMenuEn {
	_StringsEditorMenuHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'נקה דף ${page}/${totalPages}';
	@override String get clearAllPages => 'נקה את כל הדפים';
	@override String get insertPage => 'הכנס דף מלמטה';
	@override String get duplicatePage => 'שכפל דף';
	@override String get deletePage => 'מחק דף';
	@override String get lineHeight => 'גובה הקו';
	@override String get lineHeightDescription => 'שולט גם בגודל הטקסט';
	@override String get backgroundImageFit => 'התאמת תמונת רקע';
	@override String get backgroundPattern => 'תבנית רקע';
	@override String get import => 'יבוא';
	@override late final _StringsEditorMenuBoxFitsHe boxFits = _StringsEditorMenuBoxFitsHe._(_root);
	@override late final _StringsEditorMenuBgPatternsHe bgPatterns = _StringsEditorMenuBgPatternsHe._(_root);
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatHe extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'מצב צפייה בלבד';
	@override String get title => 'הערה זו נערכה באמצעות גרסה חדשה יותר של Saber';
	@override String get subtitle => 'עריכת פתק זה עלולה לגרום לאיבוד מידע מסוים. האם אתה רוצה להתאלם מזה בכל מקרה?';
	@override String get allowEditing => 'אפשר עריכה';
	@override String get cancel => 'בטל';
}

// Path: editor.quill
class _StringsEditorQuillHe extends _StringsEditorQuillEn {
	_StringsEditorQuillHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'תכתוב משהו פה...';
}

// Path: editor.hud
class _StringsEditorHudHe extends _StringsEditorHudEn {
	_StringsEditorHudHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'בטל נעילת זום';
	@override String get lockZoom => 'נעיל זום';
	@override String get unlockSingleFingerPan => 'הפיכת גלילה רציפה באצבע אחת לזמינה';
	@override String get lockSingleFingerPan => 'הפיכת גלילה רציפה באצבע אחת ללא זמינה';
	@override String get unlockAxisAlignedPan => 'ביטול נעילה של גלילה רציפה לאופקית או אנכית';
	@override String get lockAxisAlignedPan => 'נעילת גלילה רציפה לאופקית או אנכית';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _StringsSettingsPrefDescriptionsHideFingerDrawingHe extends _StringsSettingsPrefDescriptionsHideFingerDrawingEn {
	_StringsSettingsPrefDescriptionsHideFingerDrawingHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get shown => 'מונע החלפת מצב בשוגג';
	@override String get fixedOn => 'ציור אצבע קבוע כזמין';
	@override String get fixedOff => 'ציור אצבע קבוע כלא זמין';
}

// Path: editor.menu.boxFits
class _StringsEditorMenuBoxFitsHe extends _StringsEditorMenuBoxFitsEn {
	_StringsEditorMenuBoxFitsHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get fill => 'מתיחה';
	@override String get cover => 'כיסוי';
	@override String get contain => 'מכיל';
}

// Path: editor.menu.bgPatterns
class _StringsEditorMenuBgPatternsHe extends _StringsEditorMenuBgPatternsEn {
	_StringsEditorMenuBgPatternsHe._(_StringsHe root) : this._root = root, super._(root);

	@override final _StringsHe _root; // ignore: unused_field

	// Translations
	@override String get none => 'ריק';
	@override String get college => 'שורות עם קו בצד שמאל';
	@override String get collegeRtl => 'שורות עם קו בצד ימין';
	@override String get lined => 'שורות';
	@override String get grid => 'משבצות';
	@override String get dots => 'נקודות';
	@override String get staffs => 'צוותים';
	@override String get tablature => 'כרטיסייה';
	@override String get cornell => 'קורנל';
}

// Path: <root>
class _StringsHu extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsHu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.hu,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <hu>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsHu _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeHu home = _StringsHomeHu._(_root);
	@override late final _StringsSettingsHu settings = _StringsSettingsHu._(_root);
	@override late final _StringsLoginHu login = _StringsLoginHu._(_root);
	@override late final _StringsProfileHu profile = _StringsProfileHu._(_root);
	@override late final _StringsAppInfoHu appInfo = _StringsAppInfoHu._(_root);
	@override late final _StringsUpdateHu update = _StringsUpdateHu._(_root);
	@override late final _StringsEditorHu editor = _StringsEditorHu._(_root);
}

// Path: home
class _StringsHomeHu extends _StringsHomeEn {
	_StringsHomeHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsHu tabs = _StringsHomeTabsHu._(_root);
	@override late final _StringsHomeTitlesHu titles = _StringsHomeTitlesHu._(_root);
	@override late final _StringsHomeTooltipsHu tooltips = _StringsHomeTooltipsHu._(_root);
	@override late final _StringsHomeCreateHu create = _StringsHomeCreateHu._(_root);
	@override String get welcome => 'Üdvözli a Saber';
	@override String get noFiles => 'Nem található ilyen fájl';
	@override String get createNewNote => 'Kattintson a + gombora egy új jegyzet létrehozásához';
	@override late final _StringsHomeNewFolderHu newFolder = _StringsHomeNewFolderHu._(_root);
	@override late final _StringsHomeRenameNoteHu renameNote = _StringsHomeRenameNoteHu._(_root);
	@override late final _StringsHomeMoveNoteHu moveNote = _StringsHomeMoveNoteHu._(_root);
	@override late final _StringsHomeRenameFolderHu renameFolder = _StringsHomeRenameFolderHu._(_root);
	@override late final _StringsHomeDeleteFolderHu deleteFolder = _StringsHomeDeleteFolderHu._(_root);
	@override String get backFolder => 'Menjen vissza az előző mappába';
	@override String get deleteNote => 'Jegyzet törlése';
	@override String get invalidFormat => 'A kiválasztott fájl nem támogatott. Kérjük, válasszon .sbn, .sbn2 vagy .pdf fájlt.';
}

// Path: settings
class _StringsSettingsHu extends _StringsSettingsEn {
	_StringsSettingsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefCategoriesHu prefCategories = _StringsSettingsPrefCategoriesHu._(_root);
	@override late final _StringsSettingsPrefLabelsHu prefLabels = _StringsSettingsPrefLabelsHu._(_root);
	@override late final _StringsSettingsPrefDescriptionsHu prefDescriptions = _StringsSettingsPrefDescriptionsHu._(_root);
	@override late final _StringsSettingsThemeModesHu themeModes = _StringsSettingsThemeModesHu._(_root);
	@override late final _StringsSettingsLayoutSizesHu layoutSizes = _StringsSettingsLayoutSizesHu._(_root);
	@override late final _StringsSettingsAccentColorPickerHu accentColorPicker = _StringsSettingsAccentColorPickerHu._(_root);
	@override String get systemLanguage => 'Rendszerspecifikus nyelve';
	@override List<String> get axisDirections => [
		'Fel',
		'Jobbra',
		'Le',
		'Balra',
	];
	@override late final _StringsSettingsResetHu reset = _StringsSettingsResetHu._(_root);
}

// Path: login
class _StringsLoginHu extends _StringsLoginEn {
	_StringsLoginHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bejelentkezés';
	@override late final _StringsLoginFeedbacksHu feedbacks = _StringsLoginFeedbacksHu._(_root);
	@override late final _StringsLoginFormHu form = _StringsLoginFormHu._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Még nincsen fiókja? '),
		linkToSignup('Regisztrálás'),
		const TextSpan(text: '!'),
	]);
	@override late final _StringsLoginStatusHu status = _StringsLoginStatusHu._(_root);
	@override List<dynamic> get faq => [
		_StringsLogin$faq$0i0$Hu._(_root),
		_StringsLogin$faq$0i1$Hu._(_root),
		_StringsLogin$faq$0i2$Hu._(_root),
		_StringsLogin$faq$0i3$Hu._(_root),
		_StringsLogin$faq$0i4$Hu._(_root),
	];
}

// Path: profile
class _StringsProfileHu extends _StringsProfileEn {
	_StringsProfileHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override late final _StringsProfileQuickLinksHu quickLinks = _StringsProfileQuickLinksHu._(_root);
	@override String get title => 'A profilom';
	@override String get logout => 'Kijelentkezés';
	@override List<dynamic> get faq => [
		_StringsProfile$faq$0i0$Hu._(_root),
		_StringsProfile$faq$0i1$Hu._(_root),
		_StringsProfile$faq$0i2$Hu._(_root),
		_StringsProfile$faq$0i3$Hu._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoHu extends _StringsAppInfoEn {
	_StringsAppInfoHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber Copyright © 2022-${buildYear} Adil Hanney\nEz a program nem tartalmaz semmilyen garanciát. Ez egy szabad szoftver, és bizonyos feltételek mellett szabadon terjeszthető.';
	@override String get dirty => 'DIRTY';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Ide kattintva támogathat engem vagy vásárolhat több tárhelyet';
	@override String get licenseButton => 'További licencinformációk megtekintéséhez kattintson ide';
	@override String get privacyPolicyButton => 'Kattintson ide az adatvédelmi nyilatkozat megtekintéséhez';
}

// Path: update
class _StringsUpdateHu extends _StringsUpdateEn {
	_StringsUpdateHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Frissítés elérhető';
	@override String get update => 'Frissítés';
	@override String get updateAvailableDescription => 'Elérhető az alkalmazás új verziója a következő változtatásokkal:';
}

// Path: editor
class _StringsEditorHu extends _StringsEditorEn {
	_StringsEditorHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarHu toolbar = _StringsEditorToolbarHu._(_root);
	@override late final _StringsEditorPensHu pens = _StringsEditorPensHu._(_root);
	@override late final _StringsEditorPenOptionsHu penOptions = _StringsEditorPenOptionsHu._(_root);
	@override late final _StringsEditorColorsHu colors = _StringsEditorColorsHu._(_root);
	@override late final _StringsEditorImageOptionsHu imageOptions = _StringsEditorImageOptionsHu._(_root);
	@override late final _StringsEditorSelectionBarHu selectionBar = _StringsEditorSelectionBarHu._(_root);
	@override late final _StringsEditorMenuHu menu = _StringsEditorMenuHu._(_root);
	@override late final _StringsEditorNewerFileFormatHu newerFileFormat = _StringsEditorNewerFileFormatHu._(_root);
	@override late final _StringsEditorQuillHu quill = _StringsEditorQuillHu._(_root);
	@override late final _StringsEditorHudHu hud = _StringsEditorHudHu._(_root);
	@override String get pages => 'Oldalak';
	@override String get untitled => 'Névtelen';
	@override String get needsToSaveBeforeExiting => 'A módosítások mentése... Ha kész, nyugodtan kiléphet a szerkesztőből';
}

// Path: home.tabs
class _StringsHomeTabsHu extends _StringsHomeTabsEn {
	_StringsHomeTabsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get home => 'Kezdőlap';
	@override String get browse => 'Böngészés';
	@override String get whiteboard => 'Tábla';
	@override String get settings => 'Beállítások';
}

// Path: home.titles
class _StringsHomeTitlesHu extends _StringsHomeTitlesEn {
	_StringsHomeTitlesHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get home => 'Legutóbbi jegyzetek';
	@override String get whiteboard => 'Whiteboard';
	@override String get settings => 'Beállítások';
	@override String get browse => 'Böngészés';
}

// Path: home.tooltips
class _StringsHomeTooltipsHu extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Új jegyzet';
	@override String get showUpdateDialog => 'Frissítési párbeszédablak megjelenítése';
}

// Path: home.create
class _StringsHomeCreateHu extends _StringsHomeCreateEn {
	_StringsHomeCreateHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Új jegyzet';
	@override String get importNote => 'Megjegyzés importálása';
}

// Path: home.newFolder
class _StringsHomeNewFolderHu extends _StringsHomeNewFolderEn {
	_StringsHomeNewFolderHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Új mappa';
	@override String get folderName => 'Mappa neve';
	@override String get create => 'Teremt';
	@override String get folderNameEmpty => 'A mappa neve nem lehet üres';
	@override String get folderNameContainsSlash => 'A mappa neve nem tartalmazhat perjelet';
	@override String get folderNameExists => 'Folder már létezik';
}

// Path: home.renameNote
class _StringsHomeRenameNoteHu extends _StringsHomeRenameNoteEn {
	_StringsHomeRenameNoteHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Jegyzet átnevezése';
	@override String get noteName => 'Megjegyzés neve';
	@override String get rename => 'Átnevezés';
	@override String get noteNameEmpty => 'A jegyzet neve nem lehet üres';
	@override String get noteNameContainsSlash => 'A jegyzet neve nem tartalmazhat perjelet';
	@override String get noteNameExists => 'Már létezik ilyen nevű jegyzet';
}

// Path: home.moveNote
class _StringsHomeMoveNoteHu extends _StringsHomeMoveNoteEn {
	_StringsHomeMoveNoteHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String moveNotes({required Object n}) => '${n} jegyzet mozgatása';
	@override String numberRenamedTo({required Object n}) => '${n} jegyzet átnevezésre kerül az ütközések elkerülése érdekében';
	@override String get multipleRenamedTo => 'A következő megjegyzések átnevezésre kerülnek:';
	@override String get moveNote => 'Jegyzet áthelyezése';
	@override String moveName({required Object f}) => 'Mozgassa ${f}';
	@override String get move => 'Mozog';
	@override String renamedTo({required Object newName}) => 'A jegyzet a következőre lesz átnevezve: ${newName}';
}

// Path: home.renameFolder
class _StringsHomeRenameFolderHu extends _StringsHomeRenameFolderEn {
	_StringsHomeRenameFolderHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get folderNameEmpty => 'A mappa neve nem lehet üres';
	@override String get renameFolder => 'Mappa átnevezése';
	@override String get folderNameExists => 'Már létezik ilyen nevű mappa';
	@override String get folderName => 'Mappa neve';
	@override String get rename => 'Átnevezés';
	@override String get folderNameContainsSlash => 'A mappa neve nem tartalmazhat perjelet';
}

// Path: home.deleteFolder
class _StringsHomeDeleteFolderHu extends _StringsHomeDeleteFolderEn {
	_StringsHomeDeleteFolderHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Töröl';
	@override String get alsoDeleteContents => 'Törölje az összes jegyzetet ebben a mappában';
	@override String get deleteFolder => 'Mappa törlése';
	@override String deleteName({required Object f}) => '${f} törlése';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesHu extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get general => 'Általános';
	@override String get writing => 'Írás';
	@override String get editor => 'Szerkesztő';
	@override String get advanced => 'Fejlett';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsHu extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Alkalmazás nyelve';
	@override String get appTheme => 'Alkalmazás témája';
	@override String get platform => 'Téma típusa';
	@override String get customAccentColor => 'Egyéni akcentusszín';
	@override String get hyperlegibleFont => 'Hyperlegible betűtipus';
	@override String get shouldCheckForUpdates => 'Automatikusan ellenőrzi a Saber frissítéseket';
	@override String get editorToolbarAlignment => 'A szerkesztő eszköztár igazítása';
	@override String get editorToolbarShowInFullscreen => 'A szerkesztő eszköztár megjelenítése teljes képernyős módban';
	@override String get editorAutoInvert => 'Jegyzetek színének felcserélése sötét módban';
	@override String get editorOpaqueBackgrounds => 'Áttetsző hátterek';
	@override String get preferGreyscale => 'Szürkeárnyalatos színek előnyben részesítése';
	@override String get maxImageSize => 'Maximális képméret';
	@override String get autoClearWhiteboardOnExit => 'A tábla törlése az alkalmazásból való kilépés után';
	@override String get editorPromptRename => 'Új jegyzetek átnevezésére való felszólítás';
	@override String get hideHomeBackgrounds => 'Hátterek elrejtése a kezdőképernyőn';
	@override String get recentColorsDontSavePresets => 'Ne mentse az előre beállított színeket a legutóbbi színek között';
	@override String get recentColorsLength => 'Hány friss színt kell tárolni';
	@override String get changeAdsConsent => 'A hirdetések megváltoztatása beleegyezik';
	@override String get layoutSize => 'Elrendezés típusa';
	@override String get disableAds => 'Hirdetések letiltása';
	@override String get printPageIndicators => 'Nyomtatási oldaljelzők';
	@override String get allowInsecureConnections => 'Engedélyezze a nem biztonságos kapcsolatokat';
	@override String get autosaveDelay => 'Auto-save késleltetés';
	@override String get hideFingerDrawingToggle => 'Az ujjrajzolás kapcsoló elrejtése';
	@override String get shouldAlwaysAlertForUpdates => 'Gyorsabb frissítések';
	@override String get disableEraserAfterUse => 'A radír automatikus letiltása';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsHu extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Az Atkinson Hyperlegible növeli az olvashatóságot a gyengén látók számára';
	@override String get editorOpaqueBackgrounds => 'Átlátszóság eltávolítása a háttérképről és a PDF-ekből';
	@override String get preferGreyscale => 'E-tinta kijelzőkhöz';
	@override String get autoClearWhiteboardOnExit => 'Továbbra is szinkronizálva lesz a többi eszközzel';
	@override String get maxImageSize => 'Az ennél nagyobb képek tömörítve lesznek';
	@override late final _StringsSettingsPrefDescriptionsHideFingerDrawingHu hideFingerDrawing = _StringsSettingsPrefDescriptionsHideFingerDrawingHu._(_root);
	@override String get editorPromptRename => 'A jegyzeteket később bármikor átnevezheti';
	@override String get hideHomeBackgrounds => 'Egy letisztultabb megjelenítésért';
	@override String get disableAds => 'A hirdetések segítik a Saber fejlesztését, de tilthatja őket, ha tetszik';
	@override String get printPageIndicators => 'Mutasson oldalmutatókat az exportban';
	@override String get allowInsecureConnections => '(Nem ajánlott) Engedélyezze a Saber-nek, hogy csatlakozzon önaláírt/nem megbízható tanúsítványokkal rendelkező szerverekhez';
	@override String get autosaveDelay => 'Mennyi ideig kell várni a jegyzet automatikus mentése előtt';
	@override String get shouldAlwaysAlertForUpdates => 'Szóljon nekem a frissítésekről, amint elérhetők';
	@override String get disableEraserAfterUse => 'A radír használata után automatikusan visszavált a tollra';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesHu extends _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get system => 'Rendszer';
	@override String get light => 'Világos';
	@override String get dark => 'Sötét';
}

// Path: settings.layoutSizes
class _StringsSettingsLayoutSizesHu extends _StringsSettingsLayoutSizesEn {
	_StringsSettingsLayoutSizesHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Automata';
	@override String get phone => 'Telefon';
	@override String get tablet => 'Tabletta';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerHu extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Szín kiválasztása';
}

// Path: settings.reset
class _StringsSettingsResetHu extends _StringsSettingsResetEn {
	_StringsSettingsResetHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Visszaállítsa ezt a beállítást?';
	@override String get button => 'Visszaállítás';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksHu extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get checkUsername => 'Kérjem, ellenőrizze kétszer is a felhasználónevét vagy az e-mail címét';
	@override String get enterNcPassword => 'Kérem, adja meg a Nextcloud jelszavát';
	@override String get enterEncPassword => 'Kérem, adja meg a titkosítási jelszavát';
	@override String get checkUrl => 'Kérem adjon meg egy érvényes URL-címet';
	@override String get ncLoginFailed => 'A bejelentkezés sikertelen, kérem, ellenőrizze adatait és hálózati kapcsolatát';
	@override String get encLoginFailed => 'A bejelentkezés sikertelen, kérem, ellenőrizze a titkosítási jelszavát';
	@override String get loginSuccess => 'Bejelentkezés sikeres! Kérjük, várjon, amíg beüzemeljük...';
	@override String ncUnsupportedFailure({required Object v, required Object s}) => 'Az adott szerveren a Nextcloud ${v} fut, de a Saber ezen verziója csak a Nextcloud ${s}-t támogatja.';
}

// Path: login.form
class _StringsLoginFormHu extends _StringsLoginFormEn {
	_StringsLoginFormHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get useCustomServer => 'Egyéni Nextcloud-kiszolgálót szeretnék használni';
	@override String get customServerUrl => 'Egyéni kiszolgáló URL-címe';
	@override String get username => 'Felhasnálónév vagy e-mail';
	@override String get ncPassword => 'Nextcloud jelszó';
	@override String get encPassword => 'Titkosítási jelszó';
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'A bejelentkezéssel elfogadja a '),
		linkToPrivacyPolicy('Adatvédelmi irányelvek'),
		const TextSpan(text: '.'),
	]);
	@override String get login => 'Bejelentkezés';
}

// Path: login.status
class _StringsLoginStatusHu extends _StringsLoginStatusEn {
	_StringsLoginStatusHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => 'Bejelentkezve a Nextclouddal';
	@override String get loggedOut => 'Kijelentkezve';
	@override String get tapToLogin => 'Kattintson a Nextclouddal való bejelentkezéshez';
}

// Path: login.faq.0
class _StringsLogin$faq$0i0$Hu extends _StringsLogin$faq$0i0$En {
	_StringsLogin$faq$0i0$Hu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Mi az a Nextcloud?';
	@override String get a => 'A Nextcloud többek között egy privát fájlszinkronizáló szerver. Használhatja az alapértelmezett Saber Nextcloud kiszolgálót, használhat harmadik féltől származó kiszolgálót, vagy saját maga tárolhatja az adatait az adatok teljes ellenőrzéséhez.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$Hu extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$Hu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Mi a titkosítási jelszó?';
	@override String get a => 'A titkosítási jelszó az adatok titkosítására szolgál, mielőtt elküldené azokat a szervernek. Ezt választja ki, amikor először jelentkezik be a Saberbe, és nem kapcsolódik Nextcloud-fiókjához/jelszavához.\nSenki sem férhet hozzá a kiszolgálón lévő jegyzeteihez az Ön titkosítási jelszava nélkül. Ez azt is jelenti, hogy ha elfelejti titkosítási jelszavát, elveszíti hozzáférését az adataihoz.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Hu extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Hu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Miért használjunk két jelszót?';
	@override String get a => 'A Nextcloud jelszó a felhő eléréséhez használható. A titkosítási jelszó „összekeveri” az adatait, mielőtt azok elérnék a felhőt.\nMég akkor is, ha valaki hozzáfér a Nextcloud-fiókjához, jegyzetei biztonságban maradnak, és külön jelszóval titkosítva lesznek. Ez egy második biztonsági réteget biztosít az adatok védelméhez.';
}

// Path: login.faq.3
class _StringsLogin$faq$0i3$Hu extends _StringsLogin$faq$0i3$En {
	_StringsLogin$faq$0i3$Hu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Hogyan tudok bejelentkezni, ha 2FA-t használok?';
	@override String get a => 'A szokásos Nextcloud-jelszó helyett létre kell hoznia egy „alkalmazásjelszót”. Ezt megteheti a Nextcloud beállításai között a Biztonság > Eszközök és munkamenetek > Új alkalmazásjelszó létrehozása alatt. A titkosítási jelszó nem változik.';
}

// Path: login.faq.4
class _StringsLogin$faq$0i4$Hu extends _StringsLogin$faq$0i4$En {
	_StringsLogin$faq$0i4$Hu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Használhatom mindkettőhöz ugyanazt a jelszót?';
	@override String get a => 'Igen, de ez kevésbé biztonságos. Mivel a Nextcloud jelszava elküldésre kerül a szervernek, valaki, aki hozzáfér a szerverhez, képes lesz visszafejteni a jegyzeteit. Csak akkor használja ugyanazt a jelszót, ha megbízik a szerver tulajdonosában.';
}

// Path: profile.quickLinks
class _StringsProfileQuickLinksHu extends _StringsProfileQuickLinksEn {
	_StringsProfileQuickLinksHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gyors linkek';
	@override String get serverHomepage => 'Szerver honlapja';
	@override String get deleteAccount => 'Fiók törlése';
}

// Path: profile.faq.0
class _StringsProfile$faq$0i0$Hu extends _StringsProfile$faq$0i0$En {
	_StringsProfile$faq$0i0$Hu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Elveszítem a jegyzeteimet, ha bejelentem?';
	@override String get a => 'Nem. Jegyzetei az eszközön és a szerveren is megmaradnak. Nem lesznek szinkronizálva a szerverrel, amíg újra be nem jelentkezik. A kijelentkezés előtt győződjön meg arról, hogy a szinkronizálás befejeződött, hogy ne veszítsen adatot (lásd a szinkronizálás folyamatát a kezdőképernyőn).';
}

// Path: profile.faq.1
class _StringsProfile$faq$0i1$Hu extends _StringsProfile$faq$0i1$En {
	_StringsProfile$faq$0i1$Hu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Hogyan változtathatom meg a Nextcloud jelszavamat?';
	@override String get a => 'Nyissa meg a szerver webhelyét, és jelentkezzen be. Ezután lépjen a Beállítások > Biztonság > Jelszó módosítása menüpontra. Jelszava megváltoztatása után ki kell jelentkeznie, majd újra be kell jelentkeznie a Saberbe.';
}

// Path: profile.faq.2
class _StringsProfile$faq$0i2$Hu extends _StringsProfile$faq$0i2$En {
	_StringsProfile$faq$0i2$Hu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Hogyan változtathatom meg a titkosítási jelszavamat?';
	@override String get a => '1. Jelentkezzen ki a Saberből. A kijelentkezés előtt győződjön meg arról, hogy a szinkronizálás befejeződött, hogy ne veszítsen adatot (lásd a szinkronizálás folyamatát a kezdőképernyőn).\n2. Nyissa meg a szerver webhelyét, és törölje a „Saber” mappát. Ezzel törli az összes jegyzetét a szerverről.\n3. Jelentkezzen be újra a Saberbe. Belépéskor választhat új titkosítási jelszót.\n4. Ne felejtsen el kijelentkezni és újra bejelentkezni a Saber szolgáltatásba a többi eszközén sem.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$Hu extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$Hu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Hogyan törölhetem a fiókomat?';
	@override String get a => 'Koppintson a fenti "${_root.profile.quickLinks.deleteAccount}" gombra, és ha szükséges, jelentkezzen be.\nHa a hivatalos Saber szervert használja, fiókja 1 hetes türelmi időszak után törlődik. Ebben az időszakban felveheti velem a kapcsolatot az adilhanney@disroot.org címen a törlés visszavonásához.\nHa harmadik féltől származó szervert használ, előfordulhat, hogy nincs lehetőség fiókja törlésére: további információkért olvassa el a szerver adatvédelmi szabályzatát.';
}

// Path: editor.toolbar
class _StringsEditorToolbarHu extends _StringsEditorToolbarEn {
	_StringsEditorToolbarHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Színek váltása (Ctrl+C)';
	@override String get select => 'Kiválasztás';
	@override String get toggleEraser => 'Radír ki-be kapcsolása (Ctrl+E)';
	@override String get photo => 'Képek';
	@override String get text => 'Szöveg';
	@override String get toggleFingerDrawing => 'Ujjal való rajzolásra váltása (Ctrl+F)';
	@override String get undo => 'Visszavonás';
	@override String get redo => 'Mégis';
	@override String get export => 'Exportálás (Ctrl+Shift+S)';
	@override String get exportAs => 'Exportálás mint:';
	@override String get fullscreen => 'Teljes képernyő bekapcsolása (F11)';
}

// Path: editor.pens
class _StringsEditorPensHu extends _StringsEditorPensEn {
	_StringsEditorPensHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Töltőtoll';
	@override String get ballpointPen => 'Golyóstoll';
	@override String get highlighter => 'Kiemelő';
	@override String get shapePen => 'Forma toll';
	@override String get laserPointer => 'Lézer mutató';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsHu extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get size => 'Méret';
	@override String get sizeDragHint => 'Húzza balra vagy jobbra a méret megváltoztatásához';
}

// Path: editor.colors
class _StringsEditorColorsHu extends _StringsEditorColorsEn {
	_StringsEditorColorsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String customBrightnessHue({required Object b, required Object h}) => 'Egyedi ${b} ${h}';
	@override String customHue({required Object h}) => 'Egyedi ${h}';
	@override String get dark => 'sötét';
	@override String get light => 'fény';
	@override String get cyan => 'Cián';
	@override String get pink => 'Rózsaszín';
	@override String get colorPicker => 'Színválasztó';
	@override String get black => 'Fekete';
	@override String get darkGrey => 'Sötét szürke';
	@override String get grey => 'Szürke';
	@override String get lightGrey => 'Világos szürke';
	@override String get white => 'fehér';
	@override String get red => 'Piros';
	@override String get green => 'Zöld';
	@override String get blue => 'Kék';
	@override String get yellow => 'Sárga';
	@override String get purple => 'Lila';
	@override String get orange => 'narancs';
	@override String get pastelRed => 'Pasztell vörös';
	@override String get pastelOrange => 'Pasztell narancs';
	@override String get pastelYellow => 'Pasztell sárga';
	@override String get pastelGreen => 'Pasztell zöld';
	@override String get pastelCyan => 'Pasztell cián';
	@override String get pastelBlue => 'Pasztell kék';
	@override String get pastelPurple => 'Pasztell lila';
	@override String get pastelPink => 'Pasztell rózsaszín';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsHu extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kép opciók';
	@override String get invertible => 'Megfordítható';
	@override String get download => 'Letöltés';
	@override String get setAsBackground => 'Beállítás háttérképként';
	@override String get delete => 'Törlés';
	@override String get removeAsBackground => 'Eltávolítás háttérként';
}

// Path: editor.selectionBar
class _StringsEditorSelectionBarHu extends _StringsEditorSelectionBarEn {
	_StringsEditorSelectionBarHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Törlés';
	@override String get duplicate => 'Másolat';
}

// Path: editor.menu
class _StringsEditorMenuHu extends _StringsEditorMenuEn {
	_StringsEditorMenuHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get clearAllPages => 'Összes oldal törlése';
	@override String get lineHeight => 'Vonalmagasság';
	@override String get backgroundPattern => 'Háttérminta';
	@override String get import => 'Importálás';
	@override late final _StringsEditorMenuBoxFitsHu boxFits = _StringsEditorMenuBoxFitsHu._(_root);
	@override late final _StringsEditorMenuBgPatternsHu bgPatterns = _StringsEditorMenuBgPatternsHu._(_root);
	@override String get backgroundImageFit => 'Háttérkép';
	@override String clearPage({required Object page, required Object totalPages}) => '${page}/${totalPages} oldal törlése';
	@override String get insertPage => 'Az oldal beszúrása alább';
	@override String get duplicatePage => 'Ismétlődő oldal';
	@override String get deletePage => 'Oldal törlése';
	@override String get lineHeightDescription => 'Szintén ellenőrzi a szöveg méretét';
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatHu extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Csak olvasható mód';
	@override String get title => 'Ezt a jegyzetet a Saber egy újabb verziójával lett szerkesztve';
	@override String get subtitle => 'A jegyzet szerkesztése bizonyos információk elvesztését eredményezheti. Szeretné ezt figyelmen kívül hagyni, és mégis szerkeszteni?';
	@override String get allowEditing => 'Szerkesztés engedélyezése';
	@override String get cancel => 'Mégse';
}

// Path: editor.quill
class _StringsEditorQuillHu extends _StringsEditorQuillEn {
	_StringsEditorQuillHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Gépeljen ide valamit...';
}

// Path: editor.hud
class _StringsEditorHudHu extends _StringsEditorHudEn {
	_StringsEditorHudHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Nagyítás feloldása';
	@override String get lockZoom => 'Nagyítás feloldása';
	@override String get unlockSingleFingerPan => 'Egyujjas lapozás engedélyezése';
	@override String get lockSingleFingerPan => 'Egyujjas lapozás letiltása';
	@override String get unlockAxisAlignedPan => 'Oldja fel a pásztázást vízszintesre vagy függőlegesre';
	@override String get lockAxisAlignedPan => 'A pásztázás rögzítése vízszintesre vagy függőlegesre';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _StringsSettingsPrefDescriptionsHideFingerDrawingHu extends _StringsSettingsPrefDescriptionsHideFingerDrawingEn {
	_StringsSettingsPrefDescriptionsHideFingerDrawingHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Megakadályozza a véletlen átkapcsolást';
	@override String get fixedOn => 'Az ujjlenyomat rögzítése engedélyezett állapotban van';
	@override String get fixedOff => 'Az ujjrajzolás letiltva van rögzítve';
}

// Path: editor.menu.boxFits
class _StringsEditorMenuBoxFitsHu extends _StringsEditorMenuBoxFitsEn {
	_StringsEditorMenuBoxFitsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Nyújtás';
	@override String get cover => 'Átfed';
	@override String get contain => 'Tartalmaz';
}

// Path: editor.menu.bgPatterns
class _StringsEditorMenuBgPatternsHu extends _StringsEditorMenuBgPatternsEn {
	_StringsEditorMenuBgPatternsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get none => 'Üres';
	@override String get college => 'College-ruled';
	@override String get lined => 'Vonalas';
	@override String get grid => 'Kockás';
	@override String get dots => 'Pontozott';
	@override String get collegeRtl => 'Főiskolai szabályozás (fordított)';
	@override String get staffs => 'Vezetők';
	@override String get cornell => 'Cornell';
	@override String get tablature => 'Tablatúra';
}

// Path: <root>
class _StringsIt extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsIt.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.it,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <it>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsIt _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeIt home = _StringsHomeIt._(_root);
	@override late final _StringsSettingsIt settings = _StringsSettingsIt._(_root);
	@override late final _StringsLoginIt login = _StringsLoginIt._(_root);
	@override late final _StringsProfileIt profile = _StringsProfileIt._(_root);
	@override late final _StringsAppInfoIt appInfo = _StringsAppInfoIt._(_root);
	@override late final _StringsUpdateIt update = _StringsUpdateIt._(_root);
	@override late final _StringsEditorIt editor = _StringsEditorIt._(_root);
}

// Path: home
class _StringsHomeIt extends _StringsHomeEn {
	_StringsHomeIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsIt tabs = _StringsHomeTabsIt._(_root);
	@override late final _StringsHomeTitlesIt titles = _StringsHomeTitlesIt._(_root);
	@override late final _StringsHomeTooltipsIt tooltips = _StringsHomeTooltipsIt._(_root);
	@override late final _StringsHomeCreateIt create = _StringsHomeCreateIt._(_root);
	@override String get welcome => 'Benvenuto su Saber';
	@override String get invalidFormat => 'Il file selezionato non è supportato. Seleziona un file .sbn, .sbn2 o .pdf.';
	@override String get noFiles => 'Nessun file trovato';
	@override String get createNewNote => 'Tocca il pulsante + per creare una nuova nota';
	@override String get backFolder => 'Torna alla cartella precedente';
	@override late final _StringsHomeNewFolderIt newFolder = _StringsHomeNewFolderIt._(_root);
	@override late final _StringsHomeRenameNoteIt renameNote = _StringsHomeRenameNoteIt._(_root);
	@override late final _StringsHomeMoveNoteIt moveNote = _StringsHomeMoveNoteIt._(_root);
	@override String get deleteNote => 'Elimina nota';
	@override late final _StringsHomeRenameFolderIt renameFolder = _StringsHomeRenameFolderIt._(_root);
	@override late final _StringsHomeDeleteFolderIt deleteFolder = _StringsHomeDeleteFolderIt._(_root);
}

// Path: settings
class _StringsSettingsIt extends _StringsSettingsEn {
	_StringsSettingsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefCategoriesIt prefCategories = _StringsSettingsPrefCategoriesIt._(_root);
	@override late final _StringsSettingsPrefLabelsIt prefLabels = _StringsSettingsPrefLabelsIt._(_root);
	@override late final _StringsSettingsPrefDescriptionsIt prefDescriptions = _StringsSettingsPrefDescriptionsIt._(_root);
	@override late final _StringsSettingsThemeModesIt themeModes = _StringsSettingsThemeModesIt._(_root);
	@override late final _StringsSettingsLayoutSizesIt layoutSizes = _StringsSettingsLayoutSizesIt._(_root);
	@override late final _StringsSettingsAccentColorPickerIt accentColorPicker = _StringsSettingsAccentColorPickerIt._(_root);
	@override String get systemLanguage => 'Lingua del sistema';
	@override List<String> get axisDirections => [
		'Sopra',
		'Destra',
		'In basso',
		'Sotto',
	];
	@override late final _StringsSettingsResetIt reset = _StringsSettingsResetIt._(_root);
}

// Path: login
class _StringsLoginIt extends _StringsLoginEn {
	_StringsLoginIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Login';
	@override late final _StringsLoginFeedbacksIt feedbacks = _StringsLoginFeedbacksIt._(_root);
	@override late final _StringsLoginFormIt form = _StringsLoginFormIt._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Non hai ancora un account? '),
		linkToSignup('Registrati ora'),
		const TextSpan(text: '!'),
	]);
	@override late final _StringsLoginStatusIt status = _StringsLoginStatusIt._(_root);
	@override List<dynamic> get faq => [
		_StringsLogin$faq$0i0$It._(_root),
		_StringsLogin$faq$0i1$It._(_root),
		_StringsLogin$faq$0i2$It._(_root),
		_StringsLogin$faq$0i3$It._(_root),
		_StringsLogin$faq$0i4$It._(_root),
	];
}

// Path: profile
class _StringsProfileIt extends _StringsProfileEn {
	_StringsProfileIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Il mio profilo';
	@override String get logout => 'Log out';
	@override late final _StringsProfileQuickLinksIt quickLinks = _StringsProfileQuickLinksIt._(_root);
	@override List<dynamic> get faq => [
		_StringsProfile$faq$0i0$It._(_root),
		_StringsProfile$faq$0i1$It._(_root),
		_StringsProfile$faq$0i2$It._(_root),
		_StringsProfile$faq$0i3$It._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoIt extends _StringsAppInfoEn {
	_StringsAppInfoIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber Copyright © 2022-${buildYear} Adil Hanney\nQuesto programma non ha alcuna garanzia. Questo è un software libero e sei libero di ridistribuirlo a determinate condizioni.';
	@override String get dirty => 'GROSSOLANA';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Tocca qui per sponsorizzarmi o acquistare altro spazio di archiviazione';
	@override String get licenseButton => 'Tocca qui per visualizzare ulteriori informazioni sulla licenza';
	@override String get privacyPolicyButton => 'Tocca qui per visualizzare l\'informativa sulla privacy';
}

// Path: update
class _StringsUpdateIt extends _StringsUpdateEn {
	_StringsUpdateIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Aggiornamento disponibile';
	@override String get updateAvailableDescription => 'È disponibile una nuova versione dell\'app, con queste modifiche:';
	@override String get update => 'Aggiornamento';
}

// Path: editor
class _StringsEditorIt extends _StringsEditorEn {
	_StringsEditorIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarIt toolbar = _StringsEditorToolbarIt._(_root);
	@override late final _StringsEditorPensIt pens = _StringsEditorPensIt._(_root);
	@override late final _StringsEditorPenOptionsIt penOptions = _StringsEditorPenOptionsIt._(_root);
	@override late final _StringsEditorColorsIt colors = _StringsEditorColorsIt._(_root);
	@override late final _StringsEditorImageOptionsIt imageOptions = _StringsEditorImageOptionsIt._(_root);
	@override late final _StringsEditorSelectionBarIt selectionBar = _StringsEditorSelectionBarIt._(_root);
	@override late final _StringsEditorMenuIt menu = _StringsEditorMenuIt._(_root);
	@override late final _StringsEditorNewerFileFormatIt newerFileFormat = _StringsEditorNewerFileFormatIt._(_root);
	@override late final _StringsEditorQuillIt quill = _StringsEditorQuillIt._(_root);
	@override late final _StringsEditorHudIt hud = _StringsEditorHudIt._(_root);
	@override String get pages => 'Pagine';
	@override String get untitled => 'Senza titolo';
	@override String get needsToSaveBeforeExiting => 'Salvataggio delle modifiche... Puoi tranquillamente uscire dall\'editor quando hai finito';
}

// Path: home.tabs
class _StringsHomeTabsIt extends _StringsHomeTabsEn {
	_StringsHomeTabsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Home';
	@override String get browse => 'Sfoglia';
	@override String get whiteboard => 'Lavagna';
	@override String get settings => 'Impostazioni';
}

// Path: home.titles
class _StringsHomeTitlesIt extends _StringsHomeTitlesEn {
	_StringsHomeTitlesIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Note recenti';
	@override String get browse => 'Sfoglia';
	@override String get whiteboard => 'Lavagna';
	@override String get settings => 'Impostazioni';
}

// Path: home.tooltips
class _StringsHomeTooltipsIt extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nuova nota';
	@override String get showUpdateDialog => 'Mostra finestra di aggiornamento';
}

// Path: home.create
class _StringsHomeCreateIt extends _StringsHomeCreateEn {
	_StringsHomeCreateIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nuova nota';
	@override String get importNote => 'Importa nota';
}

// Path: home.newFolder
class _StringsHomeNewFolderIt extends _StringsHomeNewFolderEn {
	_StringsHomeNewFolderIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Nuova cartella';
	@override String get folderName => 'Nome cartella';
	@override String get create => 'Crea';
	@override String get folderNameEmpty => 'Il nome della cartella non può essere vuoto';
	@override String get folderNameContainsSlash => 'Il nome della cartella non può contenere una barra';
	@override String get folderNameExists => 'La cartella esiste già';
}

// Path: home.renameNote
class _StringsHomeRenameNoteIt extends _StringsHomeRenameNoteEn {
	_StringsHomeRenameNoteIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Rinomina nota';
	@override String get noteName => 'Nome nota';
	@override String get rename => 'Rinomina';
	@override String get noteNameEmpty => 'Il nome della nota non può essere vuoto';
	@override String get noteNameContainsSlash => 'Il nome della nota non può contenere una barra';
	@override String get noteNameExists => 'Esiste già una nota con questo nome';
}

// Path: home.moveNote
class _StringsHomeMoveNoteIt extends _StringsHomeMoveNoteEn {
	_StringsHomeMoveNoteIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Sposta nota';
	@override String moveName({required Object f}) => 'Sposta ${f}';
	@override String get move => 'Sposta';
	@override String renamedTo({required Object newName}) => 'La nota verrà rinominata in ${newName}';
	@override String moveNotes({required Object n}) => 'Sposta ${n} note';
	@override String get multipleRenamedTo => 'Le seguenti note saranno rinominate:';
	@override String numberRenamedTo({required Object n}) => '${n} note verranno rinominate per evitare conflitti';
}

// Path: home.renameFolder
class _StringsHomeRenameFolderIt extends _StringsHomeRenameFolderEn {
	_StringsHomeRenameFolderIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Rinomina cartella';
	@override String get folderName => 'Nome cartella';
	@override String get rename => 'Rinomina';
	@override String get folderNameEmpty => 'Il nome della cartella non può essere vuoto';
	@override String get folderNameContainsSlash => 'Il nome della cartella non può contenere una barra';
	@override String get folderNameExists => 'Esiste già una cartella con questo nome';
}

// Path: home.deleteFolder
class _StringsHomeDeleteFolderIt extends _StringsHomeDeleteFolderEn {
	_StringsHomeDeleteFolderIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Elimina cartella';
	@override String deleteName({required Object f}) => 'Elimina ${f}';
	@override String get delete => 'Elimina';
	@override String get alsoDeleteContents => 'Elimina anche tutte le note all\'interno di questa cartella';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesIt extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get general => 'Generale';
	@override String get writing => 'Scrittura';
	@override String get editor => 'Editor';
	@override String get advanced => 'Avanzato';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsIt extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Lingua app';
	@override String get appTheme => 'Tema dell\'app';
	@override String get platform => 'Tipo di tema';
	@override String get layoutSize => 'Dimensione layout';
	@override String get customAccentColor => 'Colore personalizzato';
	@override String get hyperlegibleFont => 'Carattere iperleggibile';
	@override String get shouldCheckForUpdates => 'Controlla automaticamente gli aggiornamenti di Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Aggiornamenti veloci';
	@override String get disableAds => 'Disattiva annunci';
	@override String get changeAdsConsent => 'Modifica il consenso agli annunci';
	@override String get allowInsecureConnections => 'Consenti connessioni non sicure';
	@override String get editorToolbarAlignment => 'Allineamento della barra degli strumenti dell\'editor';
	@override String get editorToolbarShowInFullscreen => 'Mostra la barra degli strumenti dell\'editor in modalità a schermo intero';
	@override String get editorAutoInvert => 'Inverti le note in modalità scura';
	@override String get editorOpaqueBackgrounds => 'Sfondi opachi';
	@override String get preferGreyscale => 'Preferisci i colori in scala di grigi';
	@override String get maxImageSize => 'Dimensione massima dell\'immagine';
	@override String get autoClearWhiteboardOnExit => 'Svuota la lavagna dopo essere uscito dall\'app';
	@override String get disableEraserAfterUse => 'Disattiva automaticamente la gomma';
	@override String get hideFingerDrawingToggle => 'Nascondi l\'interruttore del disegno con le dita';
	@override String get editorPromptRename => 'Richiede di rinominare nuove note';
	@override String get hideHomeBackgrounds => 'Nascondi gli sfondi nella schermata iniziale';
	@override String get recentColorsDontSavePresets => 'Non salvare i colori preimpostati nei colori recenti';
	@override String get printPageIndicators => 'Stampa indicatori di pagina';
	@override String get autosaveDelay => 'Ritardo di salvataggio automatico';
	@override String get recentColorsLength => 'Quanti colori recenti memorizzare';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsIt extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible aumenta la leggibilità per i lettori ipovedenti';
	@override String get disableAds => 'Gli annunci aiutano a supportare lo sviluppo di Saber, ma puoi disattivarli se lo desideri';
	@override String get allowInsecureConnections => '(Non consigliato) Consenti a Saber di connettersi ai server con certificati autofirmati/non attendibili';
	@override String get editorOpaqueBackgrounds => 'Rimuovi la trasparenza dalle immagini di sfondo e dai PDF';
	@override String get preferGreyscale => 'Per display e-ink';
	@override String get autoClearWhiteboardOnExit => 'Sarà comunque sincronizzato con gli altri tuoi dispositivi';
	@override String get disableEraserAfterUse => 'Torna automaticamente alla penna dopo aver utilizzato la gomma';
	@override String get maxImageSize => 'Le immagini più grandi verranno compresse';
	@override late final _StringsSettingsPrefDescriptionsHideFingerDrawingIt hideFingerDrawing = _StringsSettingsPrefDescriptionsHideFingerDrawingIt._(_root);
	@override String get editorPromptRename => 'Puoi sempre rinominare le note in un secondo momento';
	@override String get hideHomeBackgrounds => 'Per un aspetto più pulito';
	@override String get printPageIndicators => 'Mostra indicatori di pagina nelle esportazioni';
	@override String get autosaveDelay => 'Quanto tempo aspettare prima di salvare automaticamente una nota';
	@override String get shouldAlwaysAlertForUpdates => 'Segnalami aggiornamenti non appena sono disponibili';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesIt extends _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get light => 'Chiaro';
	@override String get dark => 'Scuro';
}

// Path: settings.layoutSizes
class _StringsSettingsLayoutSizesIt extends _StringsSettingsLayoutSizesEn {
	_StringsSettingsLayoutSizesIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Automatico';
	@override String get phone => 'Telefono';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerIt extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Scegli un colore';
}

// Path: settings.reset
class _StringsSettingsResetIt extends _StringsSettingsResetEn {
	_StringsSettingsResetIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ripristinare questa impostazione?';
	@override String get button => 'Ripristina';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksIt extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get checkUsername => 'Ricontrolla il tuo nome utente o e-mail.';
	@override String get enterNcPassword => 'Inserisci la tua password Nextcloud.';
	@override String get enterEncPassword => 'Inserisci la tua password di crittografia.';
	@override String get checkUrl => 'Per favore, inserisci un URL valido.';
	@override String get ncLoginFailed => 'Accesso fallito, controlla i tuoi dati e la connessione di rete.';
	@override String ncUnsupportedFailure({required Object v, required Object s}) => 'Il server specificato esegue Nextcloud ${v} ma questa versione di Saber supporta solo Nextcloud ${s}.';
	@override String get encLoginFailed => 'Accesso non riuscito, controllare la password di crittografia.';
	@override String get loginSuccess => 'Accesso riuscito! Si prega di attendere mentre configuriamo...';
}

// Path: login.form
class _StringsLoginFormIt extends _StringsLoginFormEn {
	_StringsLoginFormIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get useCustomServer => 'Voglio utilizzare un server Nextcloud personalizzato';
	@override String get customServerUrl => 'URL del server personalizzato';
	@override String get username => 'Nome utente o email';
	@override String get ncPassword => 'Password nextcloud';
	@override String get encPassword => 'Password di crittografata';
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Effettuando l\'accesso, accetti la '),
		linkToPrivacyPolicy('Informativa sulla privacy'),
		const TextSpan(text: '.'),
	]);
	@override String get login => 'Log in';
}

// Path: login.status
class _StringsLoginStatusIt extends _StringsLoginStatusEn {
	_StringsLoginStatusIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => 'Effettuato l\'accesso con Nextcloud';
	@override String get loggedOut => 'Disconnesso';
	@override String get tapToLogin => 'Tocca per accedere con Nextcloud';
}

// Path: login.faq.0
class _StringsLogin$faq$0i0$It extends _StringsLogin$faq$0i0$En {
	_StringsLogin$faq$0i0$It._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Che cos\'è Nextcloud?';
	@override String get a => 'Nextcloud è un server di sincronizzazione file privato, tra le altre cose. Puoi utilizzare il server Saber Nextcloud predefinito, utilizzare un server di terze parti o ospitare autonomamente il tuo per il pieno controllo dei tuoi dati.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$It extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$It._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Qual è la password di crittografia?';
	@override String get a => 'La password di crittografia viene utilizzata per crittografare i dati prima che vengano inviati al server. Lo scegli quando accedi per la prima volta a Saber e non è correlato al tuo account/password Nextcloud.\nNessuno può accedere alle tue note sul server senza la tua password di crittografia. Ciò significa anche che se dimentichi la password di crittografia, perderai l\'accesso ai tuoi dati.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$It extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$It._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Perché usare due password?';
	@override String get a => 'La password Nextcloud viene utilizzata per accedere al cloud. La password di crittografia "codifica" i tuoi dati prima che raggiungano il cloud.\nAnche se qualcuno riesce ad accedere al tuo account Nextcloud, le tue note rimarranno al sicuro e crittografate con una password separata. Questo ti fornisce un secondo livello di sicurezza per proteggere i tuoi dati.';
}

// Path: login.faq.3
class _StringsLogin$faq$0i3$It extends _StringsLogin$faq$0i3$En {
	_StringsLogin$faq$0i3$It._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Come faccio ad accedere se utilizzo 2FA?';
	@override String get a => 'Invece della tua normale password Nextcloud, dovrai creare una "password per l\'app". Puoi farlo nelle impostazioni di Nextcloud in Sicurezza > Dispositivi e sessioni > Crea una nuova password per l\'app. La tua password di crittografia rimane inalterata.';
}

// Path: login.faq.4
class _StringsLogin$faq$0i4$It extends _StringsLogin$faq$0i4$En {
	_StringsLogin$faq$0i4$It._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Posso usare la stessa password per entrambi?';
	@override String get a => 'Sì, ma farlo è meno sicuro. Poiché la tua password Nextcloud viene inviata al server, qualcuno con accesso al server sarebbe in grado di decrittografare le tue note. Usa la stessa password solo se ti fidi del proprietario del server.';
}

// Path: profile.quickLinks
class _StringsProfileQuickLinksIt extends _StringsProfileQuickLinksEn {
	_StringsProfileQuickLinksIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Collegamenti veloci';
	@override String get serverHomepage => 'Homepage del server';
	@override String get deleteAccount => 'Elimina account';
}

// Path: profile.faq.0
class _StringsProfile$faq$0i0$It extends _StringsProfile$faq$0i0$En {
	_StringsProfile$faq$0i0$It._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Perderò i miei appunti se mi disconnetto?';
	@override String get a => 'No. Le tue note rimarranno sia sul tuo dispositivo che sul server. Non verranno sincronizzati con il server fino a quando non effettui nuovamente l\'accesso. Assicurati che la sincronizzazione sia completa prima di uscire in modo da non perdere alcun dato (vedi l\'avanzamento della sincronizzazione nella schermata iniziale).';
}

// Path: profile.faq.1
class _StringsProfile$faq$0i1$It extends _StringsProfile$faq$0i1$En {
	_StringsProfile$faq$0i1$It._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Come cambio la mia password Nextcloud?';
	@override String get a => 'Vai al sito web del tuo server e accedi. Quindi vai su Impostazioni > Sicurezza > Cambia password. Dovrai disconnetterti e riconnetterti a Saber dopo aver cambiato la tua password.';
}

// Path: profile.faq.2
class _StringsProfile$faq$0i2$It extends _StringsProfile$faq$0i2$En {
	_StringsProfile$faq$0i2$It._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Come cambio la mia password di crittografia?';
	@override String get a => '1. Disconnettersi da Saber. Assicurati che la sincronizzazione sia completa prima di uscire in modo da non perdere alcun dato (vedi l\'avanzamento della sincronizzazione nella schermata iniziale).\n2. Vai al sito Web del tuo server ed elimina la cartella "Saber". Questo eliminerà tutte le tue note dal server.\n3. Accedi nuovamente a Saber. Puoi scegliere una nuova password di crittografia quando accedi.\n4. Non dimenticare di disconnetterti e accedere nuovamente a Saber anche sugli altri tuoi dispositivi.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$It extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$It._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Come posso eliminare il mio account?';
	@override String get a => 'Tocca il pulsante "${_root.profile.quickLinks.deleteAccount}" in alto e, se necessario, accedi.\nSe stai utilizzando il server Saber ufficiale, il tuo account verrà eliminato dopo un periodo di tolleranza di 1 settimana. Puoi contattarmi all\'indirizzo adilhanney@disroot.org durante questo periodo per annullare l\'eliminazione.\nSe stai utilizzando un server di terze parti, potrebbe non esserci un\'opzione per eliminare il tuo account: dovrai consultare la politica sulla privacy del server per ulteriori informazioni.';
}

// Path: editor.toolbar
class _StringsEditorToolbarIt extends _StringsEditorToolbarEn {
	_StringsEditorToolbarIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

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
class _StringsEditorPensIt extends _StringsEditorPensEn {
	_StringsEditorPensIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Penna stilografica';
	@override String get ballpointPen => 'Penna a sfera';
	@override String get highlighter => 'Evidenziatore';
	@override String get shapePen => 'Forma della penna';
	@override String get laserPointer => 'Puntatore laser';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsIt extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get size => 'Dimesione';
	@override String get sizeDragHint => 'Trascina a sinistra o a destra per modificare le dimensioni';
}

// Path: editor.colors
class _StringsEditorColorsIt extends _StringsEditorColorsEn {
	_StringsEditorColorsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Selettore di colori';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Personalizzato ${b} ${h}';
	@override String customHue({required Object h}) => 'Personalizzato ${h}';
	@override String get dark => 'buio';
	@override String get light => 'leggero';
	@override String get black => 'Nero';
	@override String get darkGrey => 'Grigio scuro';
	@override String get grey => 'Grigio';
	@override String get lightGrey => 'Grigio chiaro';
	@override String get white => 'Bianco';
	@override String get red => 'Rosso';
	@override String get green => 'Verde';
	@override String get blue => 'Blu';
	@override String get yellow => 'Giallo';
	@override String get purple => 'Porpora';
	@override String get orange => 'Arancione';
	@override String get pastelRed => 'Rosso pastello';
	@override String get pastelOrange => 'Arancione pastello';
	@override String get pastelYellow => 'Giallo pastello';
	@override String get pastelGreen => 'Verde pastello';
	@override String get pastelCyan => 'Ciano pastello';
	@override String get pastelBlue => 'Blu pastello';
	@override String get pastelPurple => 'Porpora pastella';
	@override String get pastelPink => 'Rosa pastello';
	@override String get cyan => 'Ciano';
	@override String get pink => 'Rosa';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsIt extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opzioni immagine';
	@override String get invertible => 'Invertibile';
	@override String get download => 'Download';
	@override String get setAsBackground => 'Imposta come sfondo';
	@override String get removeAsBackground => 'Rimuovi come sfondo';
	@override String get delete => 'Cancella';
}

// Path: editor.selectionBar
class _StringsEditorSelectionBarIt extends _StringsEditorSelectionBarEn {
	_StringsEditorSelectionBarIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Cancella';
	@override String get duplicate => 'Duplicare';
}

// Path: editor.menu
class _StringsEditorMenuIt extends _StringsEditorMenuEn {
	_StringsEditorMenuIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Pulisci pagina ${page}/${totalPages} totali';
	@override String get clearAllPages => 'Pulisci tutte le pagine';
	@override String get insertPage => 'Inserisci pagina sotto';
	@override String get duplicatePage => 'Pagina duplicata';
	@override String get deletePage => 'Elimina pagina';
	@override String get lineHeight => 'Altezza della linea';
	@override String get lineHeightDescription => 'Inoltre controlla la dimensione del testo';
	@override String get backgroundImageFit => 'Adattamento immagine di sfondo';
	@override String get backgroundPattern => 'Modello di sfondo';
	@override String get import => 'Importa';
	@override late final _StringsEditorMenuBoxFitsIt boxFits = _StringsEditorMenuBoxFitsIt._(_root);
	@override late final _StringsEditorMenuBgPatternsIt bgPatterns = _StringsEditorMenuBgPatternsIt._(_root);
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatIt extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Modalità di sola lettura';
	@override String get title => 'Questa nota è stata modificata utilizzando una versione più recente di Saber';
	@override String get subtitle => 'La modifica di questa nota potrebbe comportare la perdita di alcune informazioni. Vuoi ignorare e modificarla comunque?';
	@override String get allowEditing => 'Consenti modifica';
	@override String get cancel => 'Cancella';
}

// Path: editor.quill
class _StringsEditorQuillIt extends _StringsEditorQuillEn {
	_StringsEditorQuillIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Scrivi qualcosa qui...';
}

// Path: editor.hud
class _StringsEditorHudIt extends _StringsEditorHudEn {
	_StringsEditorHudIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Sblocca zoom';
	@override String get lockZoom => 'Blocca zoom';
	@override String get unlockSingleFingerPan => 'Attiva la panoramica con un solo dito';
	@override String get lockSingleFingerPan => 'Disabilita la panoramica con un solo dito';
	@override String get unlockAxisAlignedPan => 'Sblocca la panoramica orizzontale o verticale';
	@override String get lockAxisAlignedPan => 'Blocca la panoramica su orizzontale o verticale';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _StringsSettingsPrefDescriptionsHideFingerDrawingIt extends _StringsSettingsPrefDescriptionsHideFingerDrawingEn {
	_StringsSettingsPrefDescriptionsHideFingerDrawingIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Impedisce l\'attivazione accidentale';
	@override String get fixedOn => 'Il disegno con le dita è fissato come abilitato';
	@override String get fixedOff => 'Il disegno con le dita è fisso come disabilitato';
}

// Path: editor.menu.boxFits
class _StringsEditorMenuBoxFitsIt extends _StringsEditorMenuBoxFitsEn {
	_StringsEditorMenuBoxFitsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Tratto';
	@override String get cover => 'Copertina';
	@override String get contain => 'Contiene';
}

// Path: editor.menu.bgPatterns
class _StringsEditorMenuBgPatternsIt extends _StringsEditorMenuBgPatternsEn {
	_StringsEditorMenuBgPatternsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

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

// Path: <root>
class _StringsJa extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsJa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsJa _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeJa home = _StringsHomeJa._(_root);
	@override late final _StringsSettingsJa settings = _StringsSettingsJa._(_root);
	@override late final _StringsLoginJa login = _StringsLoginJa._(_root);
	@override late final _StringsProfileJa profile = _StringsProfileJa._(_root);
	@override late final _StringsAppInfoJa appInfo = _StringsAppInfoJa._(_root);
	@override late final _StringsUpdateJa update = _StringsUpdateJa._(_root);
	@override late final _StringsEditorJa editor = _StringsEditorJa._(_root);
}

// Path: home
class _StringsHomeJa extends _StringsHomeEn {
	_StringsHomeJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsJa tabs = _StringsHomeTabsJa._(_root);
	@override late final _StringsHomeTitlesJa titles = _StringsHomeTitlesJa._(_root);
	@override late final _StringsHomeTooltipsJa tooltips = _StringsHomeTooltipsJa._(_root);
	@override late final _StringsHomeCreateJa create = _StringsHomeCreateJa._(_root);
	@override String get welcome => 'ようこそSaberへ';
	@override String get noFiles => 'ファイルが見つかりません';
	@override String get createNewNote => '+ボタンで新しくメモを作成';
	@override late final _StringsHomeNewFolderJa newFolder = _StringsHomeNewFolderJa._(_root);
	@override late final _StringsHomeRenameNoteJa renameNote = _StringsHomeRenameNoteJa._(_root);
	@override late final _StringsHomeMoveNoteJa moveNote = _StringsHomeMoveNoteJa._(_root);
	@override late final _StringsHomeRenameFolderJa renameFolder = _StringsHomeRenameFolderJa._(_root);
	@override late final _StringsHomeDeleteFolderJa deleteFolder = _StringsHomeDeleteFolderJa._(_root);
	@override String get backFolder => '前のフォルダーに戻ります';
	@override String get deleteNote => 'メモの削除';
	@override String get invalidFormat => '選択したファイルはサポートされていません。 .sbn、.sbn2、または .pdf ファイルを選択してください。';
}

// Path: settings
class _StringsSettingsJa extends _StringsSettingsEn {
	_StringsSettingsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefCategoriesJa prefCategories = _StringsSettingsPrefCategoriesJa._(_root);
	@override late final _StringsSettingsPrefLabelsJa prefLabels = _StringsSettingsPrefLabelsJa._(_root);
	@override late final _StringsSettingsPrefDescriptionsJa prefDescriptions = _StringsSettingsPrefDescriptionsJa._(_root);
	@override late final _StringsSettingsThemeModesJa themeModes = _StringsSettingsThemeModesJa._(_root);
	@override late final _StringsSettingsLayoutSizesJa layoutSizes = _StringsSettingsLayoutSizesJa._(_root);
	@override late final _StringsSettingsAccentColorPickerJa accentColorPicker = _StringsSettingsAccentColorPickerJa._(_root);
	@override String get systemLanguage => 'システムの言語';
	@override List<String> get axisDirections => [
		'上部',
		'右側',
		'下部',
		'左側',
	];
	@override late final _StringsSettingsResetJa reset = _StringsSettingsResetJa._(_root);
}

// Path: login
class _StringsLoginJa extends _StringsLoginEn {
	_StringsLoginJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ログイン';
	@override late final _StringsLoginFeedbacksJa feedbacks = _StringsLoginFeedbacksJa._(_root);
	@override late final _StringsLoginFormJa form = _StringsLoginFormJa._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'まだアカウントをお持ちでないですか？ '),
		linkToSignup('今すぐ登録'),
		const TextSpan(text: '!'),
	]);
	@override late final _StringsLoginStatusJa status = _StringsLoginStatusJa._(_root);
	@override List<dynamic> get faq => [
		_StringsLogin$faq$0i0$Ja._(_root),
		_StringsLogin$faq$0i1$Ja._(_root),
		_StringsLogin$faq$0i2$Ja._(_root),
		_StringsLogin$faq$0i3$Ja._(_root),
		_StringsLogin$faq$0i4$Ja._(_root),
	];
}

// Path: profile
class _StringsProfileJa extends _StringsProfileEn {
	_StringsProfileJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'プロフィール';
	@override String get logout => 'ログアウト';
	@override late final _StringsProfileQuickLinksJa quickLinks = _StringsProfileQuickLinksJa._(_root);
	@override List<dynamic> get faq => [
		_StringsProfile$faq$0i0$Ja._(_root),
		_StringsProfile$faq$0i1$Ja._(_root),
		_StringsProfile$faq$0i2$Ja._(_root),
		_StringsProfile$faq$0i3$Ja._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoJa extends _StringsAppInfoEn {
	_StringsAppInfoJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nこのプログラムには一切の保証がありません。これはフリーソフトウェアであり、一定の条件下で再配布することを歓迎します。';
	@override String get dirty => 'DIRTY';
	@override String get debug => 'デバッグ';
	@override String get sponsorButton => '私のスポンサーになる、またはストレージを購入する際は、ここをタップしてください。';
	@override String get licenseButton => 'ライセンス情報を見るには、ここをタップして';
	@override String get privacyPolicyButton => 'プライバシーポリシーを見るには、ここをタップして';
}

// Path: update
class _StringsUpdateJa extends _StringsUpdateEn {
	_StringsUpdateJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => '更新が可能です';
	@override String get updateAvailableDescription => '新バージョンのアプリがリリースされ、以下の変更があった：';
	@override String get update => '更新';
}

// Path: editor
class _StringsEditorJa extends _StringsEditorEn {
	_StringsEditorJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarJa toolbar = _StringsEditorToolbarJa._(_root);
	@override late final _StringsEditorPensJa pens = _StringsEditorPensJa._(_root);
	@override late final _StringsEditorPenOptionsJa penOptions = _StringsEditorPenOptionsJa._(_root);
	@override late final _StringsEditorColorsJa colors = _StringsEditorColorsJa._(_root);
	@override late final _StringsEditorImageOptionsJa imageOptions = _StringsEditorImageOptionsJa._(_root);
	@override late final _StringsEditorSelectionBarJa selectionBar = _StringsEditorSelectionBarJa._(_root);
	@override late final _StringsEditorMenuJa menu = _StringsEditorMenuJa._(_root);
	@override late final _StringsEditorNewerFileFormatJa newerFileFormat = _StringsEditorNewerFileFormatJa._(_root);
	@override late final _StringsEditorQuillJa quill = _StringsEditorQuillJa._(_root);
	@override late final _StringsEditorHudJa hud = _StringsEditorHudJa._(_root);
	@override String get pages => 'ページ';
	@override String get untitled => '無題';
	@override String get needsToSaveBeforeExiting => '変更を保存する... 編集が終わったら、エディターを安全に終了することができます。';
}

// Path: home.tabs
class _StringsHomeTabsJa extends _StringsHomeTabsEn {
	_StringsHomeTabsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get home => 'ホーム';
	@override String get browse => '閲覧';
	@override String get whiteboard => 'ホワイトボード';
	@override String get settings => '設定';
}

// Path: home.titles
class _StringsHomeTitlesJa extends _StringsHomeTitlesEn {
	_StringsHomeTitlesJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get home => '最近のメモ';
	@override String get whiteboard => 'ホワイトボード';
	@override String get settings => '設定';
	@override String get browse => '閲覧';
}

// Path: home.tooltips
class _StringsHomeTooltipsJa extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新しいメモ';
	@override String get showUpdateDialog => '更新ダイアログの表示';
}

// Path: home.create
class _StringsHomeCreateJa extends _StringsHomeCreateEn {
	_StringsHomeCreateJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新しいメモ';
	@override String get importNote => 'インポートメモ';
}

// Path: home.newFolder
class _StringsHomeNewFolderJa extends _StringsHomeNewFolderEn {
	_StringsHomeNewFolderJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get newFolder => '新しいフォルダー';
	@override String get folderName => 'フォルダー名';
	@override String get create => '作成';
	@override String get folderNameEmpty => 'フォルダー名は空欄にすることはできません';
	@override String get folderNameContainsSlash => 'フォルダー名にはスラッシュを使用できません';
	@override String get folderNameExists => '同一のフォルダー名がすでに存在します';
}

// Path: home.renameNote
class _StringsHomeRenameNoteJa extends _StringsHomeRenameNoteEn {
	_StringsHomeRenameNoteJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'メモのタイトルを変更';
	@override String get noteName => 'メモのタイトル';
	@override String get rename => '名称変更';
	@override String get noteNameEmpty => 'メモのタイトルは空欄にすることはできません';
	@override String get noteNameContainsSlash => 'メモのタイトルにはスラッシュを使用できません';
	@override String get noteNameExists => '同一のタイトルがすでに存在します';
}

// Path: home.moveNote
class _StringsHomeMoveNoteJa extends _StringsHomeMoveNoteEn {
	_StringsHomeMoveNoteJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'メモを移動';
	@override String moveName({required Object f}) => '${f} を移動';
	@override String get move => '移動';
	@override String renamedTo({required Object newName}) => '${newName} に名称を変更した';
	@override String moveNotes({required Object n}) => '${n}のノートを移動する';
	@override String get multipleRenamedTo => '次のメモの名前が変更されます。';
	@override String numberRenamedTo({required Object n}) => '${n} のノートは、競合を避けるために名前を変更されます';
}

// Path: home.renameFolder
class _StringsHomeRenameFolderJa extends _StringsHomeRenameFolderEn {
	_StringsHomeRenameFolderJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get folderNameEmpty => 'フォルダー名を空にすることはできません';
	@override String get renameFolder => 'フォルダーの名前を変更する';
	@override String get folderName => 'フォルダ名';
	@override String get rename => '名前の変更';
	@override String get folderNameContainsSlash => 'フォルダ名はスラッシュを含まない';
	@override String get folderNameExists => 'この名前のフォルダーはすでに存在します';
}

// Path: home.deleteFolder
class _StringsHomeDeleteFolderJa extends _StringsHomeDeleteFolderEn {
	_StringsHomeDeleteFolderJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'フォルダの削除';
	@override String deleteName({required Object f}) => '${f}を削除';
	@override String get delete => '消去';
	@override String get alsoDeleteContents => 'このフォルダー内のすべてのメモも削除します';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesJa extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get general => '一般';
	@override String get writing => '文章';
	@override String get editor => '編集';
	@override String get advanced => 'アドバンスド';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsJa extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get locale => 'アプリの言語';
	@override String get appTheme => 'アプリのテーマ';
	@override String get platform => 'テーマの種類';
	@override String get layoutSize => 'レイアウトの種類';
	@override String get customAccentColor => 'オリジナルの色';
	@override String get hyperlegibleFont => 'Hyperlegible フォント';
	@override String get shouldCheckForUpdates => 'Saberの更新を自動的に確認する';
	@override String get disableAds => '広告を表示しない';
	@override String get changeAdsConsent => '広告の同意を変更する';
	@override String get allowInsecureConnections => '安全でない接続を許可する';
	@override String get editorToolbarAlignment => '編集ツールバーの位置調整';
	@override String get editorToolbarShowInFullscreen => 'フルスクリーンモードで編集ツールバーを表示する';
	@override String get editorAutoInvert => 'ダークモードでメモを反転';
	@override String get editorOpaqueBackgrounds => '不透明な背景';
	@override String get preferGreyscale => 'グレースケールを優先';
	@override String get maxImageSize => '最大画像サイズ';
	@override String get autoClearWhiteboardOnExit => 'アプリを終了したらホワイトボードを消去する';
	@override String get editorPromptRename => '新しいメモの名前を変更するよう促す';
	@override String get hideHomeBackgrounds => 'ホーム画面で背景を隠す';
	@override String get recentColorsDontSavePresets => '最近使用した色をプリセットに登録しない';
	@override String get printPageIndicators => '印刷ページのインジケーター';
	@override String get recentColorsLength => '最近使用した色を何色保存するか';
	@override String get autosaveDelay => '自動保存の遅延';
	@override String get hideFingerDrawingToggle => '指の描画トグルを非表示にする';
	@override String get shouldAlwaysAlertForUpdates => 'アップデートの高速化';
	@override String get disableEraserAfterUse => '消しゴムを自動的に無効にする';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsJa extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegibleは、弱視読者の読みやすさを向上させます。';
	@override String get disableAds => '広告はSaberの開発支援に貢献できますが、必要に応じて無効にすることも可能です';
	@override String get allowInsecureConnections => '(非推奨) Saber が自己署名/信頼できない証明書を持つサーバーに接続できるようにする';
	@override String get editorOpaqueBackgrounds => '背景画像とPDFから透明度を削除する';
	@override String get preferGreyscale => 'e-inkディスプレイ用';
	@override String get autoClearWhiteboardOnExit => '他のデバイスと同期されます';
	@override String get maxImageSize => 'これより大きな画像は圧縮されます';
	@override late final _StringsSettingsPrefDescriptionsHideFingerDrawingJa hideFingerDrawing = _StringsSettingsPrefDescriptionsHideFingerDrawingJa._(_root);
	@override String get editorPromptRename => 'メモの名前は後でいつでも変更できます';
	@override String get hideHomeBackgrounds => 'よりクリーンな外観に';
	@override String get printPageIndicators => 'エクスポートにページインジケーターを表示';
	@override String get autosaveDelay => 'メモを自動保存するまでの待ち時間';
	@override String get disableEraserAfterUse => '消しゴムを使用した後は自動的にペンに戻ります';
	@override String get shouldAlwaysAlertForUpdates => 'アップデートが利用可能になり次第お知らせください';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesJa extends _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get system => 'システム';
	@override String get light => 'ライト';
	@override String get dark => 'ダーク';
}

// Path: settings.layoutSizes
class _StringsSettingsLayoutSizesJa extends _StringsSettingsLayoutSizesEn {
	_StringsSettingsLayoutSizesJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get auto => '自動';
	@override String get phone => '電話';
	@override String get tablet => 'タブレット';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerJa extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => '色を選択する';
}

// Path: settings.reset
class _StringsSettingsResetJa extends _StringsSettingsResetEn {
	_StringsSettingsResetJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'この設定をリセットしますか？';
	@override String get button => 'リセット';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksJa extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get checkUsername => 'ユーザー名またはEメールを再度ご確認ください。';
	@override String get enterNcPassword => 'Nextcloudのパスワードを入力してください。';
	@override String get enterEncPassword => '暗号化パスワードを入力してください。';
	@override String get checkUrl => '有効なURLを入力してください。';
	@override String get ncLoginFailed => 'ログインに失敗しました。詳細とネットワーク接続を確認してください。';
	@override String ncUnsupportedFailure({required Object v, required Object s}) => '指定されたサーバーはNextcloud ${v} を実行していますが、このバージョンのSaberはNextcloud ${s} しかサポートしていません。';
	@override String get encLoginFailed => 'ログインに失敗しました。暗号化パスワードを確認してください。';
	@override String get loginSuccess => 'ログインに成功しました！セットアップ中です。しばらくお待ちください...';
}

// Path: login.form
class _StringsLoginFormJa extends _StringsLoginFormEn {
	_StringsLoginFormJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get useCustomServer => 'カスタムNextcloudサーバーを使いたい';
	@override String get customServerUrl => 'カスタムサーバーURL';
	@override String get username => 'ユーザー名またはメールアドレス';
	@override String get ncPassword => 'Nextcloudのパスワード';
	@override String get encPassword => '暗号化パスワード';
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'ログインすることにより、'),
		linkToPrivacyPolicy('プライベートポリシー'),
		const TextSpan(text: 'に同意したものとみなされます。'),
	]);
	@override String get login => 'ログイン';
}

// Path: login.status
class _StringsLoginStatusJa extends _StringsLoginStatusEn {
	_StringsLoginStatusJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => 'Nextcloudでログイン';
	@override String get loggedOut => 'ログアウト';
	@override String get tapToLogin => 'タップしてNextcloudにログイン';
}

// Path: login.faq.0
class _StringsLogin$faq$0i0$Ja extends _StringsLogin$faq$0i0$En {
	_StringsLogin$faq$0i0$Ja._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nextcloudとは？';
	@override String get a => 'Nextcloudは、プライベートなファイル同期サーバーです。デフォルトのSaber Nextcloudサーバーを使用することも、サードパーティのサーバーを使用することも、データを完全に管理するために自身でホストすることも可能です。';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$Ja extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$Ja._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get q => '暗号化パスワードは何ですか？';
	@override String get a => '暗号化パスワードは、サーバーに送信する前にデータを暗号化するために使用されます。Saberに最初にログインする際に選択するもので、Nextcloudのアカウントやパスワードとは関係ありません。\n暗号化パスワードがなければ、誰もサーバー上のメモにアクセスすることはできません。また、暗号化パスワードを忘れると、データにアクセスすることができなくなります。';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Ja extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Ja._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get q => 'なぜ2つのパスワードを使うのですか？';
	@override String get a => 'Nextcloudのパスワードはクラウドに接続するために使用されます。暗号化パスワードを用いてデータがクラウドに届く前にデータを "暗号化" します。\nそのため、たとえ誰かがあなたのNextcloudアカウントにアクセスしたとしても、メモは別のパスワードで暗号化されている状態になります。これにより、Saberのデーターは2重に保護されます。';
}

// Path: login.faq.3
class _StringsLogin$faq$0i3$Ja extends _StringsLogin$faq$0i3$En {
	_StringsLogin$faq$0i3$Ja._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get q => '2FAを使用している場合、どのようにログインすればいいですか？';
	@override String get a => '通常のNextcloudパスワードの代わりに、"アプリパスワード"を作成する必要があります。これはNextcloudの設定で、「セキュリティ」>「デバイスとセッション」>「新しいアプリパスワードを作成」でできます。暗号化パスワードは影響を受けません。';
}

// Path: login.faq.4
class _StringsLogin$faq$0i4$Ja extends _StringsLogin$faq$0i4$En {
	_StringsLogin$faq$0i4$Ja._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get q => '両方に同じパスワードを使用できますか？';
	@override String get a => '可能ですが、そうすれば安全性が低下します。Nextcloudのパスワードはサーバーに送信されるため、サーバーにアクセスできる人はメモを解読することができます。サーバーの所有者を信頼できる場合にのみ、同じパスワードを使用してください。';
}

// Path: profile.quickLinks
class _StringsProfileQuickLinksJa extends _StringsProfileQuickLinksEn {
	_StringsProfileQuickLinksJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'クイックリンク';
	@override String get serverHomepage => 'サーバーホームページ';
	@override String get deleteAccount => 'アカウントの削除';
}

// Path: profile.faq.0
class _StringsProfile$faq$0i0$Ja extends _StringsProfile$faq$0i0$En {
	_StringsProfile$faq$0i0$Ja._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get q => 'ログアウトするとメモが消えてしまいますか？';
	@override String get a => 'いいえ。メモはデバイスとサーバーの両方に残ります。ログインし直すまで、サーバーとは同期されません。データを失わないように、ログアウトする前に同期が完了したことを確認してください（ホーム画面の同期進行状況をご覧ください）。';
}

// Path: profile.faq.1
class _StringsProfile$faq$0i1$Ja extends _StringsProfile$faq$0i1$En {
	_StringsProfile$faq$0i1$Ja._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nextcloudのパスワードを変更する方法を教えてください';
	@override String get a => 'サーバーのウェブサイトにアクセスし、ログインします。「設定」>「セキュリティ」>「パスワードの変更」を選択します。パスワード変更後は、Saberからログアウトし、再度ログインする必要があります。';
}

// Path: profile.faq.2
class _StringsProfile$faq$0i2$Ja extends _StringsProfile$faq$0i2$En {
	_StringsProfile$faq$0i2$Ja._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get q => '暗号化パスワードの変更方法を教えてください。';
	@override String get a => '1. Saberからログアウトする。データが失われないように、ログアウトする前に同期が完了していることを確認してください（ホーム画面で同期の進行状況を確認できます）。\n2. サーバーのウェブサイトにアクセスし、「Saber」フォルダを削除してください。これにより、サーバーからすべてのメモが削除されます。\n3. セーバーに再ログインする。ログイン時に新しい暗号化パスワードを選択できます。\n4. 他のデバイスでもログアウトしてログインし直すことをお忘れなく。';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$Ja extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$Ja._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get q => 'アカウントを削除するにはどうすればよいですか？';
	@override String get a => '上部の"${_root.profile.quickLinks.deleteAccount}"ボタンをタップし、必要であればログインしてください。Saber公式サーバーを利用している場合、1週間の猶予期間の後にアカウントが削除されます。この期間中であれば、adilhanney@disroot.orgまでご連絡いただければ、削除を取り消すことが可能です。サードパーティのサーバーをご利用の場合、アカウントを削除するオプションがない場合があります。詳細については、ご利用のサーバープライバシーポリシーをご確認ください。';
}

// Path: editor.toolbar
class _StringsEditorToolbarJa extends _StringsEditorToolbarEn {
	_StringsEditorToolbarJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => '色の切り替え (Ctrl C)';
	@override String get select => '選択';
	@override String get toggleEraser => '消しゴムに切り替え (Ctrl E)';
	@override String get photo => '画像';
	@override String get text => 'テキスト';
	@override String get toggleFingerDrawing => '指での描画に切り替え (Ctrl F)';
	@override String get undo => '元に戻す';
	@override String get redo => 'やり直す';
	@override String get export => 'エクスポート (Ctrl Shift S)';
	@override String get exportAs => '次にエキスポート:';
	@override String get fullscreen => 'フルスクリーンに切り替え (F11)';
}

// Path: editor.pens
class _StringsEditorPensJa extends _StringsEditorPensEn {
	_StringsEditorPensJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => '万年筆';
	@override String get ballpointPen => 'ボールペン';
	@override String get highlighter => '蛍光ペン';
	@override String get laserPointer => 'レーザーポインター';
	@override String get shapePen => 'シェイプペン';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsJa extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get size => 'サイズ';
	@override String get sizeDragHint => '左右にドラッグしてサイズを変更';
}

// Path: editor.colors
class _StringsEditorColorsJa extends _StringsEditorColorsEn {
	_StringsEditorColorsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'カラーピッカー';
	@override String customBrightnessHue({required Object b, required Object h}) => 'カスタム ${b} ${h}';
	@override String customHue({required Object h}) => 'カスタム ${h}';
	@override String get dark => '暗い';
	@override String get light => 'ライト';
	@override String get black => '黒';
	@override String get darkGrey => '濃い灰色';
	@override String get grey => '灰色';
	@override String get lightGrey => '明るい灰色';
	@override String get white => '白色';
	@override String get red => '赤色';
	@override String get green => '緑色';
	@override String get blue => '青色';
	@override String get yellow => '黄色';
	@override String get purple => '紫色';
	@override String get orange => '橙色';
	@override String get pastelRed => 'パステル・赤';
	@override String get pastelOrange => 'パステル・橙色';
	@override String get pastelYellow => 'パステル・黄色';
	@override String get pastelGreen => 'パステル・緑色';
	@override String get pastelCyan => 'パステル・青緑色';
	@override String get pastelBlue => 'パステル・青色';
	@override String get pastelPurple => 'パステル・紫色';
	@override String get pastelPink => 'パステル・桃色';
	@override String get cyan => 'シアン';
	@override String get pink => 'ピンク';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsJa extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '画像オプション';
	@override String get invertible => '不可逆';
	@override String get download => 'ダウンロード';
	@override String get setAsBackground => '背景に設定';
	@override String get removeAsBackground => '背景として削除';
	@override String get delete => '削除';
}

// Path: editor.selectionBar
class _StringsEditorSelectionBarJa extends _StringsEditorSelectionBarEn {
	_StringsEditorSelectionBarJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get delete => '削除';
	@override String get duplicate => '重複';
}

// Path: editor.menu
class _StringsEditorMenuJa extends _StringsEditorMenuEn {
	_StringsEditorMenuJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'ページを削除 ${page}/${totalPages}';
	@override String get clearAllPages => 'すべてのページを消去する';
	@override String get insertPage => '以下のページを挿入';
	@override String get duplicatePage => '重複したページ';
	@override String get deletePage => 'ページの削除';
	@override String get lineHeight => '行の高さ';
	@override String get lineHeightDescription => '文字サイズを調整';
	@override String get backgroundPattern => '背景パターン';
	@override String get import => 'インポート';
	@override late final _StringsEditorMenuBoxFitsJa boxFits = _StringsEditorMenuBoxFitsJa._(_root);
	@override late final _StringsEditorMenuBgPatternsJa bgPatterns = _StringsEditorMenuBgPatternsJa._(_root);
	@override String get backgroundImageFit => '背景画像';
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatJa extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => '読み取り専用モード';
	@override String get title => 'このメモは新しいバージョンのSaberを使用して編集されたものです';
	@override String get subtitle => 'このメモを編集すると、いくつかの情報が失われる可能性があります。これを無視して編集しますか？';
	@override String get allowEditing => '編集を許可する';
	@override String get cancel => '取消';
}

// Path: editor.quill
class _StringsEditorQuillJa extends _StringsEditorQuillEn {
	_StringsEditorQuillJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'ここに何かを入力してください...';
}

// Path: editor.hud
class _StringsEditorHudJa extends _StringsEditorHudEn {
	_StringsEditorHudJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'ズームの解除';
	@override String get lockZoom => 'ズームを固定する';
	@override String get unlockSingleFingerPan => '一本指でのパン操作を有効にする';
	@override String get lockSingleFingerPan => '一本指でのパン操作を無効にする';
	@override String get unlockAxisAlignedPan => '水平または垂直へのパンロックを解除';
	@override String get lockAxisAlignedPan => 'パンニングを水平または垂直にロックする';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _StringsSettingsPrefDescriptionsHideFingerDrawingJa extends _StringsSettingsPrefDescriptionsHideFingerDrawingEn {
	_StringsSettingsPrefDescriptionsHideFingerDrawingJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get fixedOn => '指の描画が有効に固定される';
	@override String get shown => '偶発的な切り替えを防止します';
	@override String get fixedOff => '指の描画が無効に固定される';
}

// Path: editor.menu.boxFits
class _StringsEditorMenuBoxFitsJa extends _StringsEditorMenuBoxFitsEn {
	_StringsEditorMenuBoxFitsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get fill => '貼る';
	@override String get cover => 'カバー';
	@override String get contain => 'コンテイン';
}

// Path: editor.menu.bgPatterns
class _StringsEditorMenuBgPatternsJa extends _StringsEditorMenuBgPatternsEn {
	_StringsEditorMenuBgPatternsJa._(_StringsJa root) : this._root = root, super._(root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get none => '空白';
	@override String get college => '罫線';
	@override String get collegeRtl => '罫線 (反転)';
	@override String get lined => '線';
	@override String get grid => '格子';
	@override String get dots => '点';
	@override String get staffs => 'スタッフ';
	@override String get cornell => '角';
	@override String get tablature => 'タベルチュア';
}

// Path: <root>
class _StringsPtBr extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsPtBr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ptBr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <pt-BR>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsPtBr _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomePtBr home = _StringsHomePtBr._(_root);
	@override late final _StringsSettingsPtBr settings = _StringsSettingsPtBr._(_root);
	@override late final _StringsLoginPtBr login = _StringsLoginPtBr._(_root);
	@override late final _StringsProfilePtBr profile = _StringsProfilePtBr._(_root);
	@override late final _StringsAppInfoPtBr appInfo = _StringsAppInfoPtBr._(_root);
	@override late final _StringsUpdatePtBr update = _StringsUpdatePtBr._(_root);
	@override late final _StringsEditorPtBr editor = _StringsEditorPtBr._(_root);
}

// Path: home
class _StringsHomePtBr extends _StringsHomeEn {
	_StringsHomePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsPtBr tabs = _StringsHomeTabsPtBr._(_root);
	@override late final _StringsHomeTitlesPtBr titles = _StringsHomeTitlesPtBr._(_root);
	@override late final _StringsHomeTooltipsPtBr tooltips = _StringsHomeTooltipsPtBr._(_root);
	@override late final _StringsHomeCreatePtBr create = _StringsHomeCreatePtBr._(_root);
	@override String get welcome => 'Bem-vindo(a) ao Saber';
	@override String get invalidFormat => 'O arquivo que você selecionou não é suportado. Por favor selecione um arquivo .sbn, .sbn2 ou .pdf.';
	@override String get noFiles => 'Nenhum arquivo encontrado';
	@override String get createNewNote => 'Toque no botão + para criar uma nova nota';
	@override String get backFolder => 'Retornar para a pasta anterior';
	@override late final _StringsHomeNewFolderPtBr newFolder = _StringsHomeNewFolderPtBr._(_root);
	@override late final _StringsHomeRenameNotePtBr renameNote = _StringsHomeRenameNotePtBr._(_root);
	@override late final _StringsHomeMoveNotePtBr moveNote = _StringsHomeMoveNotePtBr._(_root);
	@override String get deleteNote => 'Apagar nota';
	@override late final _StringsHomeRenameFolderPtBr renameFolder = _StringsHomeRenameFolderPtBr._(_root);
	@override late final _StringsHomeDeleteFolderPtBr deleteFolder = _StringsHomeDeleteFolderPtBr._(_root);
}

// Path: settings
class _StringsSettingsPtBr extends _StringsSettingsEn {
	_StringsSettingsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefCategoriesPtBr prefCategories = _StringsSettingsPrefCategoriesPtBr._(_root);
	@override late final _StringsSettingsPrefLabelsPtBr prefLabels = _StringsSettingsPrefLabelsPtBr._(_root);
	@override late final _StringsSettingsPrefDescriptionsPtBr prefDescriptions = _StringsSettingsPrefDescriptionsPtBr._(_root);
	@override late final _StringsSettingsThemeModesPtBr themeModes = _StringsSettingsThemeModesPtBr._(_root);
	@override late final _StringsSettingsLayoutSizesPtBr layoutSizes = _StringsSettingsLayoutSizesPtBr._(_root);
	@override late final _StringsSettingsAccentColorPickerPtBr accentColorPicker = _StringsSettingsAccentColorPickerPtBr._(_root);
	@override String get systemLanguage => 'Idioma do sistema';
	@override List<String> get axisDirections => [
		'Em cima',
		'Direita',
		'Embaixo',
		'Esquerda',
	];
	@override late final _StringsSettingsResetPtBr reset = _StringsSettingsResetPtBr._(_root);
}

// Path: login
class _StringsLoginPtBr extends _StringsLoginEn {
	_StringsLoginPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Login';
	@override late final _StringsLoginFeedbacksPtBr feedbacks = _StringsLoginFeedbacksPtBr._(_root);
	@override late final _StringsLoginFormPtBr form = _StringsLoginFormPtBr._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Ainda não tem uma conta? '),
		linkToSignup('Registre-se agora'),
		const TextSpan(text: '!'),
	]);
	@override late final _StringsLoginStatusPtBr status = _StringsLoginStatusPtBr._(_root);
	@override List<dynamic> get faq => [
		_StringsLogin$faq$0i0$PtBr._(_root),
		_StringsLogin$faq$0i1$PtBr._(_root),
		_StringsLogin$faq$0i2$PtBr._(_root),
		_StringsLogin$faq$0i3$PtBr._(_root),
		_StringsLogin$faq$0i4$PtBr._(_root),
	];
}

// Path: profile
class _StringsProfilePtBr extends _StringsProfileEn {
	_StringsProfilePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Meu perfil';
	@override String get logout => 'Sair';
	@override late final _StringsProfileQuickLinksPtBr quickLinks = _StringsProfileQuickLinksPtBr._(_root);
	@override List<dynamic> get faq => [
		_StringsProfile$faq$0i0$PtBr._(_root),
		_StringsProfile$faq$0i1$PtBr._(_root),
		_StringsProfile$faq$0i2$PtBr._(_root),
		_StringsProfile$faq$0i3$PtBr._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoPtBr extends _StringsAppInfoEn {
	_StringsAppInfoPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nEste programa vem sem absolutamente nenhuma garantia. Este é um software livre e você pode redistribuí-lo sob certas condições.';
	@override String get dirty => 'DIRTY';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Toque aqui para me patrocinar ou comprar mais armazenamento';
	@override String get licenseButton => 'Toque aqui para ver mais informações de licença';
	@override String get privacyPolicyButton => 'Toque aqui para ver a política de privacidade';
}

// Path: update
class _StringsUpdatePtBr extends _StringsUpdateEn {
	_StringsUpdatePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Atualização disponível';
	@override String get updateAvailableDescription => 'Uma nova versão do aplicativo está disponível, com estas mudanças:';
	@override String get update => 'Atualizar';
}

// Path: editor
class _StringsEditorPtBr extends _StringsEditorEn {
	_StringsEditorPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarPtBr toolbar = _StringsEditorToolbarPtBr._(_root);
	@override late final _StringsEditorPensPtBr pens = _StringsEditorPensPtBr._(_root);
	@override late final _StringsEditorPenOptionsPtBr penOptions = _StringsEditorPenOptionsPtBr._(_root);
	@override late final _StringsEditorColorsPtBr colors = _StringsEditorColorsPtBr._(_root);
	@override late final _StringsEditorImageOptionsPtBr imageOptions = _StringsEditorImageOptionsPtBr._(_root);
	@override late final _StringsEditorSelectionBarPtBr selectionBar = _StringsEditorSelectionBarPtBr._(_root);
	@override late final _StringsEditorMenuPtBr menu = _StringsEditorMenuPtBr._(_root);
	@override late final _StringsEditorNewerFileFormatPtBr newerFileFormat = _StringsEditorNewerFileFormatPtBr._(_root);
	@override late final _StringsEditorQuillPtBr quill = _StringsEditorQuillPtBr._(_root);
	@override late final _StringsEditorHudPtBr hud = _StringsEditorHudPtBr._(_root);
	@override String get pages => 'Páginas';
	@override String get untitled => 'Sem título';
	@override String get needsToSaveBeforeExiting => 'Salvando as suas alterações... Você pode sair do editor com segurança quando isto terminar';
}

// Path: home.tabs
class _StringsHomeTabsPtBr extends _StringsHomeTabsEn {
	_StringsHomeTabsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Início';
	@override String get browse => 'Explorar';
	@override String get whiteboard => 'Quadro branco';
	@override String get settings => 'Configurações';
}

// Path: home.titles
class _StringsHomeTitlesPtBr extends _StringsHomeTitlesEn {
	_StringsHomeTitlesPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Notas recentes';
	@override String get browse => 'Navegar';
	@override String get whiteboard => 'Quadro branco';
	@override String get settings => 'Configurações';
}

// Path: home.tooltips
class _StringsHomeTooltipsPtBr extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nova nota';
	@override String get showUpdateDialog => 'Mostrar caixa de diálogo de atualização';
}

// Path: home.create
class _StringsHomeCreatePtBr extends _StringsHomeCreateEn {
	_StringsHomeCreatePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nova nota';
	@override String get importNote => 'Importar nota';
}

// Path: home.newFolder
class _StringsHomeNewFolderPtBr extends _StringsHomeNewFolderEn {
	_StringsHomeNewFolderPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Nova pasta';
	@override String get folderName => 'Nome da pasta';
	@override String get create => 'Criar';
	@override String get folderNameEmpty => 'O nome da pasta não pode estar vazio';
	@override String get folderNameContainsSlash => 'O nome da pasta não pode conter uma barra';
	@override String get folderNameExists => 'A pasta já existe';
}

// Path: home.renameNote
class _StringsHomeRenameNotePtBr extends _StringsHomeRenameNoteEn {
	_StringsHomeRenameNotePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Renomear nota';
	@override String get noteName => 'Nome da nota';
	@override String get rename => 'Renomear';
	@override String get noteNameEmpty => 'O nome da nota não pode estar vazio';
	@override String get noteNameContainsSlash => 'O nome da nota não pode conter uma barra';
	@override String get noteNameExists => 'Já existe uma nota com este nome';
}

// Path: home.moveNote
class _StringsHomeMoveNotePtBr extends _StringsHomeMoveNoteEn {
	_StringsHomeMoveNotePtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Mover a nota';
	@override String moveName({required Object f}) => 'Mover ${f}';
	@override String get move => 'Mover';
	@override String renamedTo({required Object newName}) => 'A nota será renomeada para ${newName}';
	@override String moveNotes({required Object n}) => 'Mover ${n} notas';
	@override String get multipleRenamedTo => 'As seguintes notas serão renomeadas:';
	@override String numberRenamedTo({required Object n}) => '${n} notas serão renomeadas para evitar conflitos';
}

// Path: home.renameFolder
class _StringsHomeRenameFolderPtBr extends _StringsHomeRenameFolderEn {
	_StringsHomeRenameFolderPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Renomear pasta';
	@override String get folderName => 'Nome da pasta';
	@override String get rename => 'Renomear';
	@override String get folderNameEmpty => 'O nome da pasta não pode estar vazio';
	@override String get folderNameContainsSlash => 'O nome da pasta não pode conter uma barra';
	@override String get folderNameExists => 'Já existe uma pasta com este nome';
}

// Path: home.deleteFolder
class _StringsHomeDeleteFolderPtBr extends _StringsHomeDeleteFolderEn {
	_StringsHomeDeleteFolderPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Apagar pasta';
	@override String deleteName({required Object f}) => 'Apagar ${f}';
	@override String get delete => 'Apagar';
	@override String get alsoDeleteContents => 'Apagar também todas as notas dentro desta pasta';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesPtBr extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get general => 'Geral';
	@override String get writing => 'Escrita';
	@override String get editor => 'editor';
	@override String get advanced => 'Avançado';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsPtBr extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Idioma do aplicativo';
	@override String get appTheme => 'Tema do aplicativo';
	@override String get platform => 'Tipo do tema';
	@override String get layoutSize => 'Tipo de leiaute';
	@override String get customAccentColor => 'Cor de destaque personalizada';
	@override String get hyperlegibleFont => 'Fonte hiperlegível';
	@override String get shouldCheckForUpdates => 'Verificar automaticamente as atualizações do Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Atualizações mais rápidas';
	@override String get disableAds => 'Desativar anúncios';
	@override String get changeAdsConsent => 'Alterar o consentimento de anúncios';
	@override String get allowInsecureConnections => 'Permitir conexões inseguras';
	@override String get editorToolbarAlignment => 'Alinhamento da barra de ferramentas do editor';
	@override String get editorToolbarShowInFullscreen => 'Mostrar a barra de ferramentas do editor no modo de tela cheia';
	@override String get editorAutoInvert => 'Inverter as notas no modo escuro';
	@override String get editorOpaqueBackgrounds => 'Planos de fundo opacos';
	@override String get preferGreyscale => 'Preferir as cores em escala de cinza';
	@override String get maxImageSize => 'Tamanho máximo da imagem';
	@override String get autoClearWhiteboardOnExit => 'Limpar o quadro branco depois de sair do aplicativo';
	@override String get disableEraserAfterUse => 'Desativar automaticamente a borracha';
	@override String get hideFingerDrawingToggle => 'Ocultar o botão de desenho com o dedo';
	@override String get editorPromptRename => 'Solicitar que você renomeie novas notas';
	@override String get hideHomeBackgrounds => 'Ocultar planos de fundo na tela inicial';
	@override String get recentColorsDontSavePresets => 'Não salvar as cores predefinidas nas cores recentes';
	@override String get printPageIndicators => 'Imprimir os indicadores de página';
	@override String get autosaveDelay => 'Atraso de salvamento automático';
	@override String get recentColorsLength => 'Quantas cores recentes armazenar';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsPtBr extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible aumenta a legibilidade para leitores com baixa visão';
	@override String get disableAds => 'Os anúncios ajudam no desenvolvimento do Saber, mas você pode desativá-los se quiser';
	@override String get allowInsecureConnections => '(Não recomendado) Permitir que o Saber se conecte a servidores com certificados autoassinados/não-confiáveis';
	@override String get editorOpaqueBackgrounds => 'Remover a transparência das imagens de plano de fundo e dos PDFs';
	@override String get preferGreyscale => 'Para telas e-ink';
	@override String get autoClearWhiteboardOnExit => 'Ainda será sincronizado com seus outros dispositivos';
	@override String get disableEraserAfterUse => 'Voltar automaticamente para a caneta depois de usar a borracha';
	@override String get maxImageSize => 'Imagens maiores que isso serão compactadas';
	@override late final _StringsSettingsPrefDescriptionsHideFingerDrawingPtBr hideFingerDrawing = _StringsSettingsPrefDescriptionsHideFingerDrawingPtBr._(_root);
	@override String get editorPromptRename => 'Você pode sempre renomear as notas mais tarde';
	@override String get hideHomeBackgrounds => 'Para uma aparência mais limpa';
	@override String get printPageIndicators => 'Mostrar os indicadores de página nas exportações';
	@override String get autosaveDelay => 'Quanto tempo esperar antes de salvar automaticamente uma nota';
	@override String get shouldAlwaysAlertForUpdates => 'Conte-me sobre atualizações assim que elas estiverem disponíveis';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesPtBr extends _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get light => 'Claro';
	@override String get dark => 'Escuro';
}

// Path: settings.layoutSizes
class _StringsSettingsLayoutSizesPtBr extends _StringsSettingsLayoutSizesEn {
	_StringsSettingsLayoutSizesPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Automático';
	@override String get phone => 'Celular';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerPtBr extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Selecionar uma cor';
}

// Path: settings.reset
class _StringsSettingsResetPtBr extends _StringsSettingsResetEn {
	_StringsSettingsResetPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Redefinir esta configuração?';
	@override String get button => 'Redefinir';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksPtBr extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get checkUsername => 'Por favor verifique o seu nome de usuário ou e-mail.';
	@override String get enterNcPassword => 'Por favor digite a sua senha do Nextcloud.';
	@override String get enterEncPassword => 'Por favor digite a sua senha de criptografia.';
	@override String get checkUrl => 'Por favor insira uma URL válida.';
	@override String get ncLoginFailed => 'Falha no login, por favor verifique os seus dados e a conexão de rede.';
	@override String ncUnsupportedFailure({required Object v, required Object s}) => 'O servidor fornecido está executando o Nextcloud ${v}, mas esta versão do Saber apenas suporta o Nextcloud ${s}.';
	@override String get encLoginFailed => 'Falha no login, por favor verifique a sua senha de criptografia.';
	@override String get loginSuccess => 'Login bem-sucedido! Aguarde enquanto configuramos...';
}

// Path: login.form
class _StringsLoginFormPtBr extends _StringsLoginFormEn {
	_StringsLoginFormPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get useCustomServer => 'Eu quero usar um servidor Nextcloud personalizado';
	@override String get customServerUrl => 'URL do servidor personalizado';
	@override String get username => 'Nome de usuário ou e-mail';
	@override String get ncPassword => 'Senha do Nextcloud';
	@override String get encPassword => 'Senha de criptografia';
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Ao fazer login, você concorda com a '),
		linkToPrivacyPolicy('Política de Privacidade'),
		const TextSpan(text: '.'),
	]);
	@override String get login => 'Login';
}

// Path: login.status
class _StringsLoginStatusPtBr extends _StringsLoginStatusEn {
	_StringsLoginStatusPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => 'Logado com o Nextcloud';
	@override String get loggedOut => 'Desconectado';
	@override String get tapToLogin => 'Toque para fazer login com o Nextcloud';
}

// Path: login.faq.0
class _StringsLogin$faq$0i0$PtBr extends _StringsLogin$faq$0i0$En {
	_StringsLogin$faq$0i0$PtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'O que é o Nextcloud?';
	@override String get a => 'O Nextcloud é um servidor privado de sincronização de arquivos, entre outras coisas. Você pode usar o servidor Nextcloud padrão do Saber, usar um servidor de terceiros ou auto-hospedar o seu próprio servidor para controle total dos seus dados.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$PtBr extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$PtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'O que é uma senha de criptografia?';
	@override String get a => 'A senha de criptografia é usada para criptografar os seus dados antes de eles serem enviados ao servidor. Você a escolhe quando faz login pela primeira vez no Saber, e ela não está relacionada à sua conta/senha do Nextcloud.\nNinguém pode acessar as suas notas no servidor sem a sua senha de criptografia. Isso também significa que, se você esquecer a sua senha de criptografia, perderá o acesso aos seus dados.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$PtBr extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$PtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Por que usar duas senhas?';
	@override String get a => 'A senha do Nextcloud é usada para acessar a nuvem. A senha de criptografia "embaralha" os seus dados antes que eles cheguem à nuvem.\nMesmo que alguém obtenha acesso à sua conta do Nextcloud, as suas notas permanecerão seguras e criptografadas com uma senha separada. Isso fornece uma segunda camada de segurança para proteger os seus dados.';
}

// Path: login.faq.3
class _StringsLogin$faq$0i3$PtBr extends _StringsLogin$faq$0i3$En {
	_StringsLogin$faq$0i3$PtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Como eu faço login usando autenticação de dois fatores (2FA)?';
	@override String get a => 'Em vez de sua senha regular do Nextcloud, você precisará criar uma "senha de aplicativo". Você pode fazer isso nas configurações do Nextcloud em Segurança > Dispositivos e sessões > Criar nova senha de aplicativo. A sua senha de criptografia não é afetada.';
}

// Path: login.faq.4
class _StringsLogin$faq$0i4$PtBr extends _StringsLogin$faq$0i4$En {
	_StringsLogin$faq$0i4$PtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Posso usar a mesma senha para ambos?';
	@override String get a => 'Sim, mas isso é menos seguro. Como a sua senha do Nextcloud é enviada ao servidor, alguém com acesso ao servidor poderá descriptografar as suas notas. Use a mesma senha apenas se você confiar no proprietário do servidor. ';
}

// Path: profile.quickLinks
class _StringsProfileQuickLinksPtBr extends _StringsProfileQuickLinksEn {
	_StringsProfileQuickLinksPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Links rápidos';
	@override String get serverHomepage => 'Página inicial do servidor';
	@override String get deleteAccount => 'Apagar conta';
}

// Path: profile.faq.0
class _StringsProfile$faq$0i0$PtBr extends _StringsProfile$faq$0i0$En {
	_StringsProfile$faq$0i0$PtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Eu perderei as minhas notas se eu sair da minha conta?';
	@override String get a => 'Não. As suas notas permanecerão tanto no seu dispositivo quanto no servidor. Elas não serão sincronizadas com o servidor até você fazer login novamente. Tenha certeza de que a sincronização foi finalizada antes de sair, de modo que você não perca nenhum dado (veja o progresso da sincronização na tela inicial).';
}

// Path: profile.faq.1
class _StringsProfile$faq$0i1$PtBr extends _StringsProfile$faq$0i1$En {
	_StringsProfile$faq$0i1$PtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Como eu mudo a minha senha do Nextcloud?';
	@override String get a => 'Vá para o website do seu servidor e faça login. Então vá para Configurações > Segurança > Mudar senha. Você precisará sair da conta e fazer login novamente no Saber depois de mudar a sua senha.';
}

// Path: profile.faq.2
class _StringsProfile$faq$0i2$PtBr extends _StringsProfile$faq$0i2$En {
	_StringsProfile$faq$0i2$PtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Como eu mudo a minha senha de criptografia?';
	@override String get a => '1. Saia da sua conta do Saber. Tenha certeza de que a sincronização foi finalizada antes de sair, de modo que você não perca nenhum dado (veja o progresso da sincronização na tela inicial).\n2. Vá para o website do seu servidor e apague a sua pasta do Saber. Isso apagará todas as suas notas do servidor.\n3. Faça login na sua conta do Saber. Você pode escolher uma nova senha de criptografia quando fizer login.\n4. Não se esqueça de sair e fazer login novamente no Saber em seus outros dispositivos também.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$PtBr extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$PtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Como eu posso apagar a minha conta?';
	@override String get a => 'Toque no "${_root.profile.quickLinks.deleteAccount}" botão acima, e faça login se necessário.\nSe você estiver usando o servidor oficial do Saber, a sua conta será apagada depois de um período de carência de uma semana. Você pode entrar em contato comigo em adilhanney@disroot.org durante esse período para cancelar a exclusão.\nSe você estiver usando um servidor de terceiros, pode ser que não haja uma opção de apagar a sua conta: você precisará consultar a política de privacidade do servidor para mais informações.';
}

// Path: editor.toolbar
class _StringsEditorToolbarPtBr extends _StringsEditorToolbarEn {
	_StringsEditorToolbarPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Paleta de cores (Ctrl C)';
	@override String get select => 'Selecionar';
	@override String get toggleEraser => 'Borracha (Ctrl E)';
	@override String get photo => 'Imagens';
	@override String get text => 'Texto';
	@override String get toggleFingerDrawing => 'Desenhar com o dedo (Ctrl F)';
	@override String get undo => 'Desfazer';
	@override String get redo => 'Refazer';
	@override String get export => 'Exportar (Ctrl Shift S)';
	@override String get exportAs => 'Exportar como:';
	@override String get fullscreen => 'Tela cheia (F11)';
}

// Path: editor.pens
class _StringsEditorPensPtBr extends _StringsEditorPensEn {
	_StringsEditorPensPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Caneta tinteiro';
	@override String get ballpointPen => 'Caneta esferográfica';
	@override String get highlighter => 'Marcador';
	@override String get laserPointer => 'Apontador laser';
	@override String get shapePen => 'Caneta de forma';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsPtBr extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get size => 'Tamanho';
	@override String get sizeDragHint => 'Arraste para a esquerda ou para a direita para alterar o tamanho';
}

// Path: editor.colors
class _StringsEditorColorsPtBr extends _StringsEditorColorsEn {
	_StringsEditorColorsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Seletor de cores';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Personalizado ${b} ${h}';
	@override String customHue({required Object h}) => '${h} personalizado';
	@override String get dark => 'escuro';
	@override String get light => 'luz';
	@override String get black => 'Preto';
	@override String get darkGrey => 'Cinza escuro';
	@override String get grey => 'Cinza';
	@override String get lightGrey => 'Cinza claro';
	@override String get white => 'Branco';
	@override String get red => 'Vermelho';
	@override String get green => 'Verde';
	@override String get blue => 'Azul';
	@override String get yellow => 'Amarelo';
	@override String get purple => 'Roxo';
	@override String get orange => 'Laranja';
	@override String get pastelRed => 'Vermelho pastel';
	@override String get pastelOrange => 'Laranja pastel';
	@override String get pastelYellow => 'Amarelo pastel';
	@override String get pastelGreen => 'Verde pastel';
	@override String get pastelCyan => 'Ciano pastel';
	@override String get pastelBlue => 'Azul pastel';
	@override String get pastelPurple => 'Roxo pastel';
	@override String get pastelPink => 'Rosa pastel';
	@override String get cyan => 'Ciano';
	@override String get pink => 'Rosa';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsPtBr extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opções de imagem';
	@override String get invertible => 'Invertível';
	@override String get download => 'Download';
	@override String get setAsBackground => 'Definir como plano de fundo';
	@override String get removeAsBackground => 'Remover como plano de fundo';
	@override String get delete => 'Excluir';
}

// Path: editor.selectionBar
class _StringsEditorSelectionBarPtBr extends _StringsEditorSelectionBarEn {
	_StringsEditorSelectionBarPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Excluir';
	@override String get duplicate => 'Duplicação';
}

// Path: editor.menu
class _StringsEditorMenuPtBr extends _StringsEditorMenuEn {
	_StringsEditorMenuPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Limpar a página ${page}/${totalPages}';
	@override String get clearAllPages => 'Limpar todas as páginas';
	@override String get insertPage => 'Inserir página abaixo';
	@override String get duplicatePage => 'Duplicar página';
	@override String get deletePage => 'Apagar página';
	@override String get lineHeight => 'Altura da linha';
	@override String get lineHeightDescription => 'Também controla o tamanho do texto';
	@override String get backgroundImageFit => 'Ajustar a imagem de plano de fundo';
	@override String get backgroundPattern => 'Padrão de plano de fundo';
	@override String get import => 'Importar';
	@override late final _StringsEditorMenuBoxFitsPtBr boxFits = _StringsEditorMenuBoxFitsPtBr._(_root);
	@override late final _StringsEditorMenuBgPatternsPtBr bgPatterns = _StringsEditorMenuBgPatternsPtBr._(_root);
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatPtBr extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Modo somente leitura';
	@override String get title => 'Esta nota foi editada usando uma versão mais recente do Saber';
	@override String get subtitle => 'A edição desta nota pode resultar na perda de algumas informações. Deseja ignorar isso e editá-la mesmo assim?';
	@override String get allowEditing => 'Permitir edição';
	@override String get cancel => 'Cancelar';
}

// Path: editor.quill
class _StringsEditorQuillPtBr extends _StringsEditorQuillEn {
	_StringsEditorQuillPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Digite algo aqui...';
}

// Path: editor.hud
class _StringsEditorHudPtBr extends _StringsEditorHudEn {
	_StringsEditorHudPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Desbloquear zoom';
	@override String get lockZoom => 'Bloquear zoom';
	@override String get unlockSingleFingerPan => 'Ativar rolagem com um dedo';
	@override String get lockSingleFingerPan => 'Desativar rolagem com um dedo';
	@override String get unlockAxisAlignedPan => 'Desbloqueie a rolagem para horizontal ou vertical';
	@override String get lockAxisAlignedPan => 'Bloqueie a rolagem para horizontal ou vertical';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _StringsSettingsPrefDescriptionsHideFingerDrawingPtBr extends _StringsSettingsPrefDescriptionsHideFingerDrawingEn {
	_StringsSettingsPrefDescriptionsHideFingerDrawingPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Evitar alternância acidental';
	@override String get fixedOn => 'O desenho com o dedo está ativado';
	@override String get fixedOff => 'O desenho com o dedo está desativado';
}

// Path: editor.menu.boxFits
class _StringsEditorMenuBoxFitsPtBr extends _StringsEditorMenuBoxFitsEn {
	_StringsEditorMenuBoxFitsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Esticar';
	@override String get cover => 'Cobrir';
	@override String get contain => 'Conter';
}

// Path: editor.menu.bgPatterns
class _StringsEditorMenuBgPatternsPtBr extends _StringsEditorMenuBgPatternsEn {
	_StringsEditorMenuBgPatternsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get none => 'Em branco';
	@override String get college => 'Pautado com margem';
	@override String get collegeRtl => 'Pautado com margem (Invertido)';
	@override String get lined => 'Pautado';
	@override String get grid => 'Grade';
	@override String get dots => 'Pontos';
	@override String get staffs => 'Pentagrama';
	@override String get tablature => 'Tablatura';
	@override String get cornell => 'Cornell';
}

// Path: <root>
class _StringsRu extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsRu _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeRu home = _StringsHomeRu._(_root);
	@override late final _StringsSettingsRu settings = _StringsSettingsRu._(_root);
	@override late final _StringsLoginRu login = _StringsLoginRu._(_root);
	@override late final _StringsProfileRu profile = _StringsProfileRu._(_root);
	@override late final _StringsAppInfoRu appInfo = _StringsAppInfoRu._(_root);
	@override late final _StringsUpdateRu update = _StringsUpdateRu._(_root);
	@override late final _StringsEditorRu editor = _StringsEditorRu._(_root);
}

// Path: home
class _StringsHomeRu extends _StringsHomeEn {
	_StringsHomeRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsRu tabs = _StringsHomeTabsRu._(_root);
	@override late final _StringsHomeTitlesRu titles = _StringsHomeTitlesRu._(_root);
	@override late final _StringsHomeTooltipsRu tooltips = _StringsHomeTooltipsRu._(_root);
	@override late final _StringsHomeCreateRu create = _StringsHomeCreateRu._(_root);
	@override String get welcome => 'Приветствуем в Saber';
	@override String get invalidFormat => 'Выбранный вами файл не поддерживается. Выберите файл .sbn, .sbn2 или .pdf.';
	@override String get noFiles => 'Файлов ещё нет';
	@override String get createNewNote => 'Нажмите кнопку «+» чтобы создать новую заметку';
	@override String get backFolder => 'Вернуться к предыдущей папке';
	@override late final _StringsHomeNewFolderRu newFolder = _StringsHomeNewFolderRu._(_root);
	@override late final _StringsHomeRenameNoteRu renameNote = _StringsHomeRenameNoteRu._(_root);
	@override late final _StringsHomeMoveNoteRu moveNote = _StringsHomeMoveNoteRu._(_root);
	@override String get deleteNote => 'Удалить заметку';
	@override late final _StringsHomeRenameFolderRu renameFolder = _StringsHomeRenameFolderRu._(_root);
	@override late final _StringsHomeDeleteFolderRu deleteFolder = _StringsHomeDeleteFolderRu._(_root);
}

// Path: settings
class _StringsSettingsRu extends _StringsSettingsEn {
	_StringsSettingsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefCategoriesRu prefCategories = _StringsSettingsPrefCategoriesRu._(_root);
	@override late final _StringsSettingsPrefLabelsRu prefLabels = _StringsSettingsPrefLabelsRu._(_root);
	@override late final _StringsSettingsPrefDescriptionsRu prefDescriptions = _StringsSettingsPrefDescriptionsRu._(_root);
	@override late final _StringsSettingsThemeModesRu themeModes = _StringsSettingsThemeModesRu._(_root);
	@override late final _StringsSettingsLayoutSizesRu layoutSizes = _StringsSettingsLayoutSizesRu._(_root);
	@override late final _StringsSettingsAccentColorPickerRu accentColorPicker = _StringsSettingsAccentColorPickerRu._(_root);
	@override String get systemLanguage => 'Язык системы';
	@override List<String> get axisDirections => [
		'Сверху',
		'Справа',
		'Снизу',
		'Слева',
	];
	@override late final _StringsSettingsResetRu reset = _StringsSettingsResetRu._(_root);
}

// Path: login
class _StringsLoginRu extends _StringsLoginEn {
	_StringsLoginRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Авторизация';
	@override late final _StringsLoginFeedbacksRu feedbacks = _StringsLoginFeedbacksRu._(_root);
	@override late final _StringsLoginFormRu form = _StringsLoginFormRu._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'У вас нет учётной записи? '),
		linkToSignup('Зарегистрируйтесь сейчас'),
		const TextSpan(text: '!'),
	]);
	@override late final _StringsLoginStatusRu status = _StringsLoginStatusRu._(_root);
	@override List<dynamic> get faq => [
		_StringsLogin$faq$0i0$Ru._(_root),
		_StringsLogin$faq$0i1$Ru._(_root),
		_StringsLogin$faq$0i2$Ru._(_root),
		_StringsLogin$faq$0i3$Ru._(_root),
		_StringsLogin$faq$0i4$Ru._(_root),
	];
}

// Path: profile
class _StringsProfileRu extends _StringsProfileEn {
	_StringsProfileRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Мой профиль';
	@override String get logout => 'Выйти';
	@override late final _StringsProfileQuickLinksRu quickLinks = _StringsProfileQuickLinksRu._(_root);
	@override List<dynamic> get faq => [
		_StringsProfile$faq$0i0$Ru._(_root),
		_StringsProfile$faq$0i1$Ru._(_root),
		_StringsProfile$faq$0i2$Ru._(_root),
		_StringsProfile$faq$0i3$Ru._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoRu extends _StringsAppInfoEn {
	_StringsAppInfoRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nЭта программа поставляется без каких-либо гарантий. Это бесплатное программное обеспечение, и вы можете распространять его при определенных условиях.';
	@override String get dirty => 'ГРЯЗНАЯ';
	@override String get debug => 'ОТЛАДКА';
	@override String get sponsorButton => 'Проспонсируйте меня или купите дополнительное пространство';
	@override String get licenseButton => 'Просмотрите дополнительную информацию о лицензии';
	@override String get privacyPolicyButton => 'Просмотр политики конфиденциальности';
}

// Path: update
class _StringsUpdateRu extends _StringsUpdateEn {
	_StringsUpdateRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Доступно обновление';
	@override String get updateAvailableDescription => 'Доступна новая версия приложения со следующими изменениями:';
	@override String get update => 'Обновить';
}

// Path: editor
class _StringsEditorRu extends _StringsEditorEn {
	_StringsEditorRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarRu toolbar = _StringsEditorToolbarRu._(_root);
	@override late final _StringsEditorPensRu pens = _StringsEditorPensRu._(_root);
	@override late final _StringsEditorPenOptionsRu penOptions = _StringsEditorPenOptionsRu._(_root);
	@override late final _StringsEditorColorsRu colors = _StringsEditorColorsRu._(_root);
	@override late final _StringsEditorImageOptionsRu imageOptions = _StringsEditorImageOptionsRu._(_root);
	@override late final _StringsEditorSelectionBarRu selectionBar = _StringsEditorSelectionBarRu._(_root);
	@override late final _StringsEditorMenuRu menu = _StringsEditorMenuRu._(_root);
	@override late final _StringsEditorNewerFileFormatRu newerFileFormat = _StringsEditorNewerFileFormatRu._(_root);
	@override late final _StringsEditorQuillRu quill = _StringsEditorQuillRu._(_root);
	@override late final _StringsEditorHudRu hud = _StringsEditorHudRu._(_root);
	@override String get pages => 'Листы';
	@override String get untitled => 'Без названия';
	@override String get needsToSaveBeforeExiting => 'Сохраните Ваши изменения... Вы можете безопасно выйти из редактора, когда это будет сделано';
}

// Path: home.tabs
class _StringsHomeTabsRu extends _StringsHomeTabsEn {
	_StringsHomeTabsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get home => 'Домашняя';
	@override String get browse => 'Обзор';
	@override String get whiteboard => 'Чистый лист';
	@override String get settings => 'Настройки';
}

// Path: home.titles
class _StringsHomeTitlesRu extends _StringsHomeTitlesEn {
	_StringsHomeTitlesRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get home => 'Недавние заметки';
	@override String get browse => 'Обзор';
	@override String get whiteboard => 'Чистый лист';
	@override String get settings => 'Настройки';
}

// Path: home.tooltips
class _StringsHomeTooltipsRu extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Новая заметка';
	@override String get showUpdateDialog => 'Показывать диалог обновления';
}

// Path: home.create
class _StringsHomeCreateRu extends _StringsHomeCreateEn {
	_StringsHomeCreateRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Новая заметка';
	@override String get importNote => 'Импорт заметки';
}

// Path: home.newFolder
class _StringsHomeNewFolderRu extends _StringsHomeNewFolderEn {
	_StringsHomeNewFolderRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Новая папка';
	@override String get folderName => 'Имя папки';
	@override String get create => 'Создать';
	@override String get folderNameEmpty => 'Имя папки не может быть пустым';
	@override String get folderNameContainsSlash => 'Имя папки не должно содержать косую черту';
	@override String get folderNameExists => 'Папка уже существует';
}

// Path: home.renameNote
class _StringsHomeRenameNoteRu extends _StringsHomeRenameNoteEn {
	_StringsHomeRenameNoteRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Переименовать заметку';
	@override String get noteName => 'Название заметки';
	@override String get rename => 'Переименовать';
	@override String get noteNameEmpty => 'Название заметки не может быть пустым';
	@override String get noteNameContainsSlash => 'Название заметки не может содержать косую черту';
	@override String get noteNameExists => 'Заметка с таким названием уже существует';
}

// Path: home.moveNote
class _StringsHomeMoveNoteRu extends _StringsHomeMoveNoteEn {
	_StringsHomeMoveNoteRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Переместить заметку';
	@override String moveName({required Object f}) => 'Переместить ${f}';
	@override String get move => 'Перемещение';
	@override String renamedTo({required Object newName}) => 'Заметка будет переименована в ${newName}';
	@override String moveNotes({required Object n}) => 'Переместить ${n} заметки';
	@override String get multipleRenamedTo => 'Следующие заметки будут переименованы:';
	@override String numberRenamedTo({required Object n}) => '${n} заметки будут переименованы, чтобы избежать конфликтов';
}

// Path: home.renameFolder
class _StringsHomeRenameFolderRu extends _StringsHomeRenameFolderEn {
	_StringsHomeRenameFolderRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Переименовать папку';
	@override String get folderName => 'Имя папки';
	@override String get rename => 'Переименовать';
	@override String get folderNameEmpty => 'Имя папки не может быть пустым';
	@override String get folderNameContainsSlash => 'Имя папки не может содержать косую черту';
	@override String get folderNameExists => 'Папка с таким названием уже существует';
}

// Path: home.deleteFolder
class _StringsHomeDeleteFolderRu extends _StringsHomeDeleteFolderEn {
	_StringsHomeDeleteFolderRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Удалить папку';
	@override String deleteName({required Object f}) => 'Удалить ${f}';
	@override String get delete => 'Удалить';
	@override String get alsoDeleteContents => 'Также, удалить все заметки в этой папке';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesRu extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get general => 'Общие';
	@override String get writing => 'Письмо';
	@override String get editor => 'Редактор';
	@override String get advanced => 'Дополнительно';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsRu extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Язык приложения';
	@override String get appTheme => 'Тема оформления';
	@override String get platform => 'Тип темы';
	@override String get layoutSize => 'Размер макета';
	@override String get customAccentColor => 'Свой цвет акцента';
	@override String get hyperlegibleFont => 'Гипер разборчивый шрифт';
	@override String get shouldCheckForUpdates => 'Автоматически проверять обновления Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Быстрые обновления';
	@override String get disableAds => 'Отключить рекламу';
	@override String get changeAdsConsent => 'Согласие на рекламу';
	@override String get allowInsecureConnections => 'Разрешить небезопасные соединения';
	@override String get editorToolbarAlignment => 'Панель инструментов редактора';
	@override String get editorToolbarShowInFullscreen => 'Показывать инструменты в полноэкранном режиме';
	@override String get editorAutoInvert => 'Инвертировать заметки в тёмном режиме';
	@override String get editorOpaqueBackgrounds => 'Непрозрачные фоны';
	@override String get preferGreyscale => 'Предпочтение оттенкам серого';
	@override String get maxImageSize => 'Макс. размер изображения';
	@override String get autoClearWhiteboardOnExit => 'Очищать лист при выходе из приложения';
	@override String get disableEraserAfterUse => 'Автоотключение ластика';
	@override String get hideFingerDrawingToggle => 'Скрыть переключатель «Рисование пальцем»';
	@override String get editorPromptRename => 'Предлагать переименовывать новые заметки';
	@override String get hideHomeBackgrounds => 'Скрыть фон на главном экране';
	@override String get recentColorsDontSavePresets => 'Не сохранять предустановленные цвета в последних цветах';
	@override String get printPageIndicators => 'Печатать номера страниц';
	@override String get autosaveDelay => 'Задержка автосохранения';
	@override String get recentColorsLength => 'Сколько последних цветов хранить';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsRu extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Шрифт Atkinson Hyperlegible повышает разборчивость для читателей с плохим зрением';
	@override String get disableAds => 'Реклама помогает поддерживать разработку Saber, но вы можете отключить её, если захотите.';
	@override String get allowInsecureConnections => '(Не рекомендуется) Разрешить Saber подключаться к серверам с самоподписанными/ненадёжными сертификатами.';
	@override String get editorOpaqueBackgrounds => 'Удалить прозрачность фоновых изображений и PDF-файлов';
	@override String get preferGreyscale => 'Для e-ink экранов';
	@override String get autoClearWhiteboardOnExit => 'Это будет синхронизировано с другими вашими устройствами';
	@override String get disableEraserAfterUse => 'Автоматически переключается на перо после использования ластика';
	@override String get maxImageSize => 'Большие изображения будут сжаты';
	@override late final _StringsSettingsPrefDescriptionsHideFingerDrawingRu hideFingerDrawing = _StringsSettingsPrefDescriptionsHideFingerDrawingRu._(_root);
	@override String get editorPromptRename => 'Вы всегда можете переименовать заметки позже';
	@override String get hideHomeBackgrounds => 'Для чистого вида';
	@override String get printPageIndicators => 'Показывать номера страниц при экспорте';
	@override String get autosaveDelay => 'Время ожидания до автосохранения заметки';
	@override String get shouldAlwaysAlertForUpdates => 'Сообщать мне об обновлениях, как только они станут доступны';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesRu extends _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get system => 'Системная';
	@override String get light => 'Светлая';
	@override String get dark => 'Тёмная';
}

// Path: settings.layoutSizes
class _StringsSettingsLayoutSizesRu extends _StringsSettingsLayoutSizesEn {
	_StringsSettingsLayoutSizesRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Авто';
	@override String get phone => 'Телефон';
	@override String get tablet => 'Планшет';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerRu extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Выбери цвет';
}

// Path: settings.reset
class _StringsSettingsResetRu extends _StringsSettingsResetEn {
	_StringsSettingsResetRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Сбросить эту настройку?';
	@override String get button => 'Сбросить';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksRu extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get checkUsername => 'Дважды проверьте своё имя пользователя или адрес электронной почты.';
	@override String get enterNcPassword => 'Введите свой пароль Nextcloud.';
	@override String get enterEncPassword => 'Введите пароль шифрования.';
	@override String get checkUrl => 'Пожалуйста, введите корректный URL адрес.';
	@override String get ncLoginFailed => 'Ошибка входа. Проверьте свои данные и подключение к сети.';
	@override String ncUnsupportedFailure({required Object v, required Object s}) => 'На данном сервере запущен Nextcloud ${v}. Но, эта версия Saber поддерживает только Nextcloud ${s}.';
	@override String get encLoginFailed => 'Не удалось войти. Проверьте пароль шифрования.';
	@override String get loginSuccess => 'Вход выполнен успешно! Пожалуйста подождите, пока мы настроим…';
}

// Path: login.form
class _StringsLoginFormRu extends _StringsLoginFormEn {
	_StringsLoginFormRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get useCustomServer => 'Я буду использовать свой Nextcloud сервер';
	@override String get customServerUrl => 'Адрес Вашего сервера';
	@override String get username => 'Имя пользователя или e-mail';
	@override String get ncPassword => 'Пароль Nextcloud';
	@override String get encPassword => 'Пароль шифрования';
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Авторизуясь, вы соглашаетесь с '),
		linkToPrivacyPolicy('политикой конфиденциальности'),
		const TextSpan(text: '.'),
	]);
	@override String get login => 'Авторизоваться';
}

// Path: login.status
class _StringsLoginStatusRu extends _StringsLoginStatusEn {
	_StringsLoginStatusRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => 'Авторизован в Nextcloud';
	@override String get loggedOut => 'Не авторизован';
	@override String get tapToLogin => 'Нажми для авторизации в Nextcloud';
}

// Path: login.faq.0
class _StringsLogin$faq$0i0$Ru extends _StringsLogin$faq$0i0$En {
	_StringsLogin$faq$0i0$Ru._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Что такое Nextcloud?';
	@override String get a => 'Nextcloud — это частный сервер синхронизации файлов, помимо всего прочего. Вы можете использовать сервер Saber Nextcloud по умолчанию, использовать сторонний сервер или самостоятельно разместить свой собственный для полного контроля над своими данными.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$Ru extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$Ru._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Что такое пароль шифрования?';
	@override String get a => 'Пароль шифрования используется для шифрования ваших данных перед их отправкой на сервер. Вы выбираете его при первом входе в Saber, и он не связан с вашей учетной записью/паролем Nextcloud.\nНикто не сможет получить доступ к вашим заметкам на сервере без вашего пароля шифрования. Это также означает, что если вы забудете пароль для шифрования, вы потеряете доступ к своим данным.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Ru extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Ru._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Зачем использовать два пароля?';
	@override String get a => 'Пароль Nextcloud используется для доступа к облаку. Пароль шифрования «шифрует» ваши данные еще до того, как они попадут в облако.\nДаже если кто-то получит доступ к вашей учетной записи Nextcloud, ваши заметки останутся в безопасности и будут зашифрованы с помощью отдельного пароля. Это обеспечивает вам второй уровень безопасности для защиты ваших данных.';
}

// Path: login.faq.3
class _StringsLogin$faq$0i3$Ru extends _StringsLogin$faq$0i3$En {
	_StringsLogin$faq$0i3$Ru._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Как мне войти, если я использую 2FA?';
	@override String get a => 'Вместо обычного пароля Nextcloud Вам нужно будет создать "Пароль приложения". Вы можете сделать это в настройках Nextcloud в разделе «Безопасность» -> «Устройства и сеансы» -> «Создать новый пароль приложения». Ваш пароль шифрования не изменится.';
}

// Path: login.faq.4
class _StringsLogin$faq$0i4$Ru extends _StringsLogin$faq$0i4$En {
	_StringsLogin$faq$0i4$Ru._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Могу ли я использовать один и тот же пароль для обоих?';
	@override String get a => 'Да, но это менее безопасно. Поскольку ваш пароль Nextcloud отправляется на сервер, кто-то, имеющий доступ к серверу, сможет расшифровать ваши заметки. Используйте тот же пароль, только если вы доверяете владельцу сервера.';
}

// Path: profile.quickLinks
class _StringsProfileQuickLinksRu extends _StringsProfileQuickLinksEn {
	_StringsProfileQuickLinksRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Быстрые ссылки';
	@override String get serverHomepage => 'Домашняя страница сервера';
	@override String get deleteAccount => 'Удалить учётную запись';
}

// Path: profile.faq.0
class _StringsProfile$faq$0i0$Ru extends _StringsProfile$faq$0i0$En {
	_StringsProfile$faq$0i0$Ru._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Потеряю ли я свои заметки, если выйду из системы?';
	@override String get a => 'Нет. Ваши заметки останутся как на вашем устройстве, так и на сервере. Они не будут синхронизированы с сервером, пока вы снова не войдете в систему. Перед выходом из системы убедитесь, что синхронизация завершена, чтобы не потерять данные (см. синхронизацию на главном экране).';
}

// Path: profile.faq.1
class _StringsProfile$faq$0i1$Ru extends _StringsProfile$faq$0i1$En {
	_StringsProfile$faq$0i1$Ru._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Как изменить свой пароль Nextcloud?';
	@override String get a => 'Перейдите на веб-сайт своего сервера и войдите в систему. Затем перейдите в «Параметры пользователя» > «Безопасность» > «Пароль». Вам нужно будет выйти и снова войти в Saber после смены пароля.';
}

// Path: profile.faq.2
class _StringsProfile$faq$0i2$Ru extends _StringsProfile$faq$0i2$En {
	_StringsProfile$faq$0i2$Ru._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Как изменить свой пароль шифрования?';
	@override String get a => '1. Выйдите из Saber. Перед выходом убедитесь, что синхронизация завершена, чтобы не потерять данные (см. синхронизацию на главном экране).\n2. Перейдите на веб-сайт своего сервера и удалите папку «Saber». Это приведет к удалению всех ваших заметок с сервера.\n3. Снова войдите в Saber. Вы можете создать новый пароль шифрования при входе в систему.\n4. Не забудьте выйти и снова войти в Saber на других своих устройствах.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$Ru extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$Ru._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Как я могу удалить свою учётную запись?';
	@override String get a => 'Нажмите кнопку "${_root.profile.quickLinks.deleteAccount}" выше и войдите в систему, если необходимо.\nЕсли вы используете официальный сервер Saber, ваша учётная запись будет удалена по истечении 1-недельного льготного периода. Вы можете связаться со мной по адресу adilhanney@disroot.org в течение этого периода, чтобы отменить удаление.\nЕсли вы используете сторонний сервер, то у вас может не быть возможности удалить свою учётную запись. Вам нужно будет ознакомиться с политикой конфиденциальности сервера, для получения дополнительной информации.';
}

// Path: editor.toolbar
class _StringsEditorToolbarRu extends _StringsEditorToolbarEn {
	_StringsEditorToolbarRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Выбор цвета (Ctrl C)';
	@override String get select => 'Выделение';
	@override String get toggleEraser => 'Ластик (Ctrl E)';
	@override String get photo => 'Фото';
	@override String get text => 'Текст';
	@override String get toggleFingerDrawing => 'Рисование пальцем (Ctrl F)';
	@override String get undo => 'Отменить';
	@override String get redo => 'Вернуть';
	@override String get export => 'Экспорт (Ctrl Shift S)';
	@override String get exportAs => 'Сохранить как:';
	@override String get fullscreen => 'Полноэкранный режим (F11)';
}

// Path: editor.pens
class _StringsEditorPensRu extends _StringsEditorPensEn {
	_StringsEditorPensRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Перьевая ручка';
	@override String get ballpointPen => 'Шариковая ручка';
	@override String get highlighter => 'Маркер';
	@override String get shapePen => 'Вид ручки';
	@override String get laserPointer => 'Лазерная указка';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsRu extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get size => 'Размер';
	@override String get sizeDragHint => 'Тяните влево или вправо, чтобы изменить размер';
}

// Path: editor.colors
class _StringsEditorColorsRu extends _StringsEditorColorsEn {
	_StringsEditorColorsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Выбор цвета';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Пользовательский ${b} ${h}';
	@override String customHue({required Object h}) => 'Пользовательский ${h}';
	@override String get dark => 'темный';
	@override String get light => 'свет';
	@override String get black => 'Чёрный';
	@override String get darkGrey => 'Тёмно-серый';
	@override String get grey => 'Серый';
	@override String get lightGrey => 'Светло-серый';
	@override String get white => 'Белый';
	@override String get red => 'Красный';
	@override String get green => 'Зелёный';
	@override String get blue => 'Синий';
	@override String get yellow => 'Жёлтый';
	@override String get purple => 'Фиолетовый';
	@override String get orange => 'Оранжевый';
	@override String get pastelRed => 'Пастельный красный';
	@override String get pastelOrange => 'Пастельный оранжевый';
	@override String get pastelYellow => 'Пастельный жёлтый';
	@override String get pastelGreen => 'Пастельный зелёный';
	@override String get pastelCyan => 'Пастельный голубой';
	@override String get pastelBlue => 'Пастельный синий';
	@override String get pastelPurple => 'Пастельный фиолетовый';
	@override String get pastelPink => 'Пастельный розовый';
	@override String get cyan => 'Голубой';
	@override String get pink => 'Розовый';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsRu extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Параметры изображения';
	@override String get invertible => 'Инвертировать';
	@override String get download => 'Сохранить';
	@override String get setAsBackground => 'Сделать фоном';
	@override String get removeAsBackground => 'Удалить фон';
	@override String get delete => 'Удалить';
}

// Path: editor.selectionBar
class _StringsEditorSelectionBarRu extends _StringsEditorSelectionBarEn {
	_StringsEditorSelectionBarRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Удалить';
	@override String get duplicate => 'Дублировать';
}

// Path: editor.menu
class _StringsEditorMenuRu extends _StringsEditorMenuEn {
	_StringsEditorMenuRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Очистить лист ${page}/${totalPages}';
	@override String get clearAllPages => 'Очистить все листы';
	@override String get insertPage => 'Вставить страницу ниже';
	@override String get duplicatePage => 'Дубликат страницы';
	@override String get deletePage => 'Удалить страницу';
	@override String get lineHeight => 'Высота строки';
	@override String get lineHeightDescription => 'Также управляет размером текста';
	@override String get backgroundImageFit => 'Фоновое изображение';
	@override String get backgroundPattern => 'Фоновый шаблон';
	@override String get import => 'Импорт';
	@override late final _StringsEditorMenuBoxFitsRu boxFits = _StringsEditorMenuBoxFitsRu._(_root);
	@override late final _StringsEditorMenuBgPatternsRu bgPatterns = _StringsEditorMenuBgPatternsRu._(_root);
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatRu extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Режим «Только чтение»';
	@override String get title => 'Эта заметка была отредактирована в более новой версии Saber.';
	@override String get subtitle => 'Редактирование этой заметки может привести к потере некоторой информации. Вы хотите проигнорировать это и начать редактирование?';
	@override String get allowEditing => 'Разрешить редактирование';
	@override String get cancel => 'Отмена';
}

// Path: editor.quill
class _StringsEditorQuillRu extends _StringsEditorQuillEn {
	_StringsEditorQuillRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Напишите что-нибудь здесь...';
}

// Path: editor.hud
class _StringsEditorHudRu extends _StringsEditorHudEn {
	_StringsEditorHudRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Разблок. увеличение';
	@override String get lockZoom => 'Блок. увеличения';
	@override String get unlockSingleFingerPan => 'Разрешить панораму одним пальцем';
	@override String get lockSingleFingerPan => 'Запретить панораму одним пальцем';
	@override String get unlockAxisAlignedPan => 'Разблокировать панораму по горизонтали или вертикали';
	@override String get lockAxisAlignedPan => 'Блокировать панораму по горизонтали или вертикали';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _StringsSettingsPrefDescriptionsHideFingerDrawingRu extends _StringsSettingsPrefDescriptionsHideFingerDrawingEn {
	_StringsSettingsPrefDescriptionsHideFingerDrawingRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Предотвращать случайное переключение';
	@override String get fixedOn => '«Рисование пальцем» зафиксировано как включенное';
	@override String get fixedOff => '«Рисование пальцем» зафиксировано как выключенное';
}

// Path: editor.menu.boxFits
class _StringsEditorMenuBoxFitsRu extends _StringsEditorMenuBoxFitsEn {
	_StringsEditorMenuBoxFitsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Растянуть';
	@override String get cover => 'Обрезать';
	@override String get contain => 'Вместить';
}

// Path: editor.menu.bgPatterns
class _StringsEditorMenuBgPatternsRu extends _StringsEditorMenuBgPatternsEn {
	_StringsEditorMenuBgPatternsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get none => 'Пустой';
	@override String get college => 'Школьная тетрадь';
	@override String get collegeRtl => 'Школьная тетрадь (Поворот)';
	@override String get lined => 'Линии';
	@override String get grid => 'Сетка';
	@override String get dots => 'Точки';
	@override String get staffs => 'Персональный';
	@override String get tablature => 'Табулатура';
	@override String get cornell => 'Корнелл';
}

// Path: <root>
class _StringsTr extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsTr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.tr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <tr>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsTr _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTr home = _StringsHomeTr._(_root);
	@override late final _StringsSettingsTr settings = _StringsSettingsTr._(_root);
	@override late final _StringsLoginTr login = _StringsLoginTr._(_root);
	@override late final _StringsProfileTr profile = _StringsProfileTr._(_root);
	@override late final _StringsAppInfoTr appInfo = _StringsAppInfoTr._(_root);
	@override late final _StringsUpdateTr update = _StringsUpdateTr._(_root);
	@override late final _StringsEditorTr editor = _StringsEditorTr._(_root);
}

// Path: home
class _StringsHomeTr extends _StringsHomeEn {
	_StringsHomeTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsTr tabs = _StringsHomeTabsTr._(_root);
	@override late final _StringsHomeTitlesTr titles = _StringsHomeTitlesTr._(_root);
	@override late final _StringsHomeTooltipsTr tooltips = _StringsHomeTooltipsTr._(_root);
	@override late final _StringsHomeCreateTr create = _StringsHomeCreateTr._(_root);
	@override String get welcome => 'Saber\'a hoş geldiniz';
	@override String get invalidFormat => 'Seçtiğiniz dosya desteklenmiyor. Lütfen bir .sbn, .sbn2 veya .pdf dosyası seçin.';
	@override String get noFiles => 'Dosya yok';
	@override String get createNewNote => 'Yeni bir not oluşturmak için + butonuna tıklayınız';
	@override String get backFolder => 'Önceki klasöre dön';
	@override late final _StringsHomeNewFolderTr newFolder = _StringsHomeNewFolderTr._(_root);
	@override late final _StringsHomeRenameNoteTr renameNote = _StringsHomeRenameNoteTr._(_root);
	@override late final _StringsHomeMoveNoteTr moveNote = _StringsHomeMoveNoteTr._(_root);
	@override String get deleteNote => 'Notu sil';
	@override late final _StringsHomeRenameFolderTr renameFolder = _StringsHomeRenameFolderTr._(_root);
	@override late final _StringsHomeDeleteFolderTr deleteFolder = _StringsHomeDeleteFolderTr._(_root);
}

// Path: settings
class _StringsSettingsTr extends _StringsSettingsEn {
	_StringsSettingsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefCategoriesTr prefCategories = _StringsSettingsPrefCategoriesTr._(_root);
	@override late final _StringsSettingsPrefLabelsTr prefLabels = _StringsSettingsPrefLabelsTr._(_root);
	@override late final _StringsSettingsPrefDescriptionsTr prefDescriptions = _StringsSettingsPrefDescriptionsTr._(_root);
	@override late final _StringsSettingsThemeModesTr themeModes = _StringsSettingsThemeModesTr._(_root);
	@override late final _StringsSettingsLayoutSizesTr layoutSizes = _StringsSettingsLayoutSizesTr._(_root);
	@override late final _StringsSettingsAccentColorPickerTr accentColorPicker = _StringsSettingsAccentColorPickerTr._(_root);
	@override String get systemLanguage => 'Sistem dili';
	@override List<String> get axisDirections => [
		'Üst',
		'Sağ',
		'Aşağı',
		'Sol',
	];
	@override late final _StringsSettingsResetTr reset = _StringsSettingsResetTr._(_root);
}

// Path: login
class _StringsLoginTr extends _StringsLoginEn {
	_StringsLoginTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Giriş yap';
	@override late final _StringsLoginFeedbacksTr feedbacks = _StringsLoginFeedbacksTr._(_root);
	@override late final _StringsLoginFormTr form = _StringsLoginFormTr._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Henüz hesabınız yok mu? '),
		linkToSignup('Hesap oluşturmak için tıklayın'),
		const TextSpan(text: '!'),
	]);
	@override late final _StringsLoginStatusTr status = _StringsLoginStatusTr._(_root);
	@override List<dynamic> get faq => [
		_StringsLogin$faq$0i0$Tr._(_root),
		_StringsLogin$faq$0i1$Tr._(_root),
		_StringsLogin$faq$0i2$Tr._(_root),
		_StringsLogin$faq$0i3$Tr._(_root),
		_StringsLogin$faq$0i4$Tr._(_root),
	];
}

// Path: profile
class _StringsProfileTr extends _StringsProfileEn {
	_StringsProfileTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profilim';
	@override String get logout => 'Çıkış yap';
	@override late final _StringsProfileQuickLinksTr quickLinks = _StringsProfileQuickLinksTr._(_root);
	@override List<dynamic> get faq => [
		_StringsProfile$faq$0i0$Tr._(_root),
		_StringsProfile$faq$0i1$Tr._(_root),
		_StringsProfile$faq$0i2$Tr._(_root),
		_StringsProfile$faq$0i3$Tr._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoTr extends _StringsAppInfoEn {
	_StringsAppInfoTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nBu program hiçbir şeyi garanti etmez ve güvence vermez.\nBu program özgür (free) bir yazılımdır ve belli koşullar sağlandığında yeniden dağıtıma müsaittir.';
	@override String get dirty => 'TEST';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Beni sponsorlamak veya daha fazla alan satın almak için buraya tıkla';
	@override String get licenseButton => 'Lisans bilgisinin detaylarını görmek için buraya tıkla';
	@override String get privacyPolicyButton => 'Gizlilik Politikasını görmek için buraya tıkla';
}

// Path: update
class _StringsUpdateTr extends _StringsUpdateEn {
	_StringsUpdateTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Güncelleme var';
	@override String get updateAvailableDescription => 'Uygulamanın şu değişiklikleri içeren yeni bir sürümü mevcut:';
	@override String get update => 'Güncelle';
}

// Path: editor
class _StringsEditorTr extends _StringsEditorEn {
	_StringsEditorTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarTr toolbar = _StringsEditorToolbarTr._(_root);
	@override late final _StringsEditorPensTr pens = _StringsEditorPensTr._(_root);
	@override late final _StringsEditorPenOptionsTr penOptions = _StringsEditorPenOptionsTr._(_root);
	@override late final _StringsEditorColorsTr colors = _StringsEditorColorsTr._(_root);
	@override late final _StringsEditorImageOptionsTr imageOptions = _StringsEditorImageOptionsTr._(_root);
	@override late final _StringsEditorSelectionBarTr selectionBar = _StringsEditorSelectionBarTr._(_root);
	@override late final _StringsEditorMenuTr menu = _StringsEditorMenuTr._(_root);
	@override late final _StringsEditorNewerFileFormatTr newerFileFormat = _StringsEditorNewerFileFormatTr._(_root);
	@override late final _StringsEditorQuillTr quill = _StringsEditorQuillTr._(_root);
	@override late final _StringsEditorHudTr hud = _StringsEditorHudTr._(_root);
	@override String get pages => 'Sayfalar';
	@override String get untitled => 'İsimsiz';
	@override String get needsToSaveBeforeExiting => 'Değişiklikler kaydediliyor... kayıt tamamlandığında editörden güvenli biçimde çıkabilirsiniz.';
}

// Path: home.tabs
class _StringsHomeTabsTr extends _StringsHomeTabsEn {
	_StringsHomeTabsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Giriş';
	@override String get browse => 'Göz at';
	@override String get whiteboard => 'Beyaz tahta';
	@override String get settings => 'Ayarlar';
}

// Path: home.titles
class _StringsHomeTitlesTr extends _StringsHomeTitlesEn {
	_StringsHomeTitlesTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Son notlar';
	@override String get browse => 'Göz at';
	@override String get whiteboard => 'Beyaz tahta';
	@override String get settings => 'Ayarlar';
}

// Path: home.tooltips
class _StringsHomeTooltipsTr extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Yeni not';
	@override String get showUpdateDialog => 'Güncelleme diyalogunu göster';
}

// Path: home.create
class _StringsHomeCreateTr extends _StringsHomeCreateEn {
	_StringsHomeCreateTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Yeni not';
	@override String get importNote => 'Notu içeri aktar';
}

// Path: home.newFolder
class _StringsHomeNewFolderTr extends _StringsHomeNewFolderEn {
	_StringsHomeNewFolderTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Yeni klasör';
	@override String get folderName => 'Klasör adı';
	@override String get create => 'Oluştur';
	@override String get folderNameEmpty => 'Klasör adı boş bırakılamaz';
	@override String get folderNameContainsSlash => 'Klasör adı eğik çizgi işareti içeremez';
	@override String get folderNameExists => 'Bu isimde bir klasör zaten var';
}

// Path: home.renameNote
class _StringsHomeRenameNoteTr extends _StringsHomeRenameNoteEn {
	_StringsHomeRenameNoteTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Notu yeniden adlandır';
	@override String get noteName => 'Not adı';
	@override String get rename => 'Yeniden adlandır';
	@override String get noteNameEmpty => 'Not adı boş bırakılamaz';
	@override String get noteNameContainsSlash => 'Not adı eğik çizgi işareti içeremez';
	@override String get noteNameExists => 'Bu isimde bir not zaten var';
}

// Path: home.moveNote
class _StringsHomeMoveNoteTr extends _StringsHomeMoveNoteEn {
	_StringsHomeMoveNoteTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Notu taşı';
	@override String moveName({required Object f}) => '${f} dosyasını taşı';
	@override String get move => 'Taşı';
	@override String renamedTo({required Object newName}) => 'Not ${newName} olarak yeniden adlandırılacak';
	@override String moveNotes({required Object n}) => '${n} notu taşı';
	@override String get multipleRenamedTo => 'Aşağıdaki notlar yeniden adlandırılacaktır:';
	@override String numberRenamedTo({required Object n}) => 'Çakışmaları önlemek için ${n} notu yeniden adlandırılacak';
}

// Path: home.renameFolder
class _StringsHomeRenameFolderTr extends _StringsHomeRenameFolderEn {
	_StringsHomeRenameFolderTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Klasörü adlandır';
	@override String get folderName => 'Klasör ismi';
	@override String get rename => 'Yeniden adlandır';
	@override String get folderNameEmpty => 'Klasör ismi boş bırakılamaz';
	@override String get folderNameContainsSlash => 'Klasör isminde slash kullanılamaz';
	@override String get folderNameExists => 'Bu isme sahip bir klasör zaten var';
}

// Path: home.deleteFolder
class _StringsHomeDeleteFolderTr extends _StringsHomeDeleteFolderEn {
	_StringsHomeDeleteFolderTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Klasörü sil';
	@override String deleteName({required Object f}) => '${f} silinecek';
	@override String get delete => 'Sil';
	@override String get alsoDeleteContents => 'Bu klasördeki tüm notları da sil';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesTr extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get general => 'Genel';
	@override String get writing => 'Yazım';
	@override String get editor => 'Editör';
	@override String get advanced => 'Gelişmiş';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsTr extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Uygulama dili';
	@override String get appTheme => 'Uygulama teması';
	@override String get platform => 'Tema tipi';
	@override String get layoutSize => 'Yerleşim tipi';
	@override String get customAccentColor => 'Farklı ana renk';
	@override String get hyperlegibleFont => 'Hyperlegible font';
	@override String get shouldCheckForUpdates => 'Otomatik olarak Saber güncellemelerini kontrol et';
	@override String get shouldAlwaysAlertForUpdates => 'Hızlı güncellemeler';
	@override String get disableAds => 'Reklamları devre dışı bırak';
	@override String get changeAdsConsent => 'Reklam iznini değiştir';
	@override String get allowInsecureConnections => 'Güvensiz bağlantılara izin ver';
	@override String get editorToolbarAlignment => 'Editör araç çubuğunun yerleşimi';
	@override String get editorToolbarShowInFullscreen => 'Editör araç kutusunu tam ekranda göster';
	@override String get editorAutoInvert => 'Karanlık temada notların rengini tersine çevir';
	@override String get editorOpaqueBackgrounds => 'Opak arkaplan';
	@override String get preferGreyscale => 'Gri tonlamayı tercih et';
	@override String get maxImageSize => 'Maksimum görsel boyutu';
	@override String get autoClearWhiteboardOnExit => 'Uygulamadan çıkıldığında beyaz tahtayı temizle';
	@override String get disableEraserAfterUse => 'Silgiden kaleme geçiş';
	@override String get hideFingerDrawingToggle => 'Parmakla çizme kilidini sakla';
	@override String get editorPromptRename => 'Notları yeniden adlandırmak için uyar';
	@override String get hideHomeBackgrounds => 'Ana ekranda arkaplanları gizle';
	@override String get recentColorsDontSavePresets => 'Ön tanımlı renkleri son kullanılanlara kaydetme';
	@override String get printPageIndicators => 'Sayfa belirteçlerini yazdır';
	@override String get autosaveDelay => 'Otomatik kayıt aralığı';
	@override String get recentColorsLength => 'Kaç tane yeni renk depolanacak';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsTr extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible, görme sorunu yaşayanların okumasını kolaylaştıran bir fonttur';
	@override String get disableAds => 'Reklamlar Saber\'ın geliştirilmesine yardım ediyor fakat dilerseniz devre dışı bırakabilirsiniz';
	@override String get allowInsecureConnections => '(Önerilmez) Saber\'ın kendinden imzalı/güvensiz sertifika kullanan sunuculara bağlanmasına izin verir';
	@override String get editorOpaqueBackgrounds => 'PDF\'ler ve arkaplan resimlerinden transparanlığı kaldırır';
	@override String get preferGreyscale => 'E-mürekkep ekranlar için';
	@override String get autoClearWhiteboardOnExit => 'Diğer cihazlarınıza senkronize edilmeye devam edecek';
	@override String get disableEraserAfterUse => 'Silgiyi kullandıktan sonra otomatik olarak kaleme geçer';
	@override String get maxImageSize => 'Bundan daha büyük görseller sıkıştırılacak';
	@override late final _StringsSettingsPrefDescriptionsHideFingerDrawingTr hideFingerDrawing = _StringsSettingsPrefDescriptionsHideFingerDrawingTr._(_root);
	@override String get editorPromptRename => 'Notlarınızı daha sonra da yeniden adlandırabilirsiniz';
	@override String get hideHomeBackgrounds => 'Daha sade bir görüntü için';
	@override String get printPageIndicators => 'Çıktılarda sayfa belirteçlerini göster';
	@override String get autosaveDelay => 'Bir notu otomatik kaydetmeden önce ne kadar bekleneceğini ayarlar';
	@override String get shouldAlwaysAlertForUpdates => 'Güncelleme mevcut olduğu gibi bana haber ver';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesTr extends _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem teması';
	@override String get light => 'Aydınlık';
	@override String get dark => 'Karanlık';
}

// Path: settings.layoutSizes
class _StringsSettingsLayoutSizesTr extends _StringsSettingsLayoutSizesEn {
	_StringsSettingsLayoutSizesTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Otomatik';
	@override String get phone => 'Telefon';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerTr extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Bir renk seçin';
}

// Path: settings.reset
class _StringsSettingsResetTr extends _StringsSettingsResetEn {
	_StringsSettingsResetTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ayarı sıfırlamak istiyor musunuz?';
	@override String get button => 'Sıfırla';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksTr extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get checkUsername => 'Lütfen kullanıcı adınız veya e-posta adresinizi kontrol edin.';
	@override String get enterNcPassword => 'Lütfen Nextcloud parolanızı girin.';
	@override String get enterEncPassword => 'Lütfen şifreleme parolanızı girin.';
	@override String get checkUrl => 'Lütfen geçerli bir URL girin.';
	@override String get ncLoginFailed => 'Giriş başarısız, Nextcloud parolanızı ve internet bağlantınızı kontrol edin.';
	@override String ncUnsupportedFailure({required Object v, required Object s}) => 'Girilen sunucu Nextcloud ${v} sürümünü kullanıyor ancak Saber\'ın bu sürümü sadece Nextcloud ${s} sürümünü destekliyor.';
	@override String get encLoginFailed => 'Giriş başarısız, şifreleme parolanızı kontrol ediniz.';
	@override String get loginSuccess => 'Giriş başarılı! Kurulum gerçekleşirken lütfen bekleyin...';
}

// Path: login.form
class _StringsLoginFormTr extends _StringsLoginFormEn {
	_StringsLoginFormTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get useCustomServer => 'Farklı bir Nextcloud sunucusu kullanmak istiyorum';
	@override String get customServerUrl => 'Farklı bir sunucu URL\'i';
	@override String get username => 'Kullanıcı adı veya e-posta adresi';
	@override String get ncPassword => 'Nextcloud parolası';
	@override String get encPassword => 'Şifreleme parolası';
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Giriş yaparak '),
		linkToPrivacyPolicy('Gizlilik Politikasını'),
		const TextSpan(text: ' kabul edersiniz.'),
	]);
	@override String get login => 'Giriş yap';
}

// Path: login.status
class _StringsLoginStatusTr extends _StringsLoginStatusEn {
	_StringsLoginStatusTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => 'Nextcloud\'a giriş yapıldı';
	@override String get loggedOut => 'Çıkış yapıldı';
	@override String get tapToLogin => 'Nextcloud oturumu açmak için tıklayın';
}

// Path: login.faq.0
class _StringsLogin$faq$0i0$Tr extends _StringsLogin$faq$0i0$En {
	_StringsLogin$faq$0i0$Tr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nextcloud nedir?';
	@override String get a => 'Nextcloud sunduğu birçok özelliğin yanı sıra, özel bir dosya senkronizasyon sunucusudur. Varsayılan Saber Nextcloud sunucusunu, 3. parti bir sunucuyu kullanmayı tercih edebilir veya kendi verinizin tam sahipliğini elde etmek için kendi host ettiğiniz sunucunuza bağlanabilirsiniz.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$Tr extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$Tr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Şifreleme parolası nedir?';
	@override String get a => 'Şifreleme parolası, verilerinizin sunucuya yollanmadan önce şifrelenmesinde kullanılıyor. Saber\'a ilk defa giriş yaptığınızda bu parolayı ayarlayabilirsiniz ve bu parola Nextcloud hesabınız/parolanız ile alakalı değildir.\nŞifreleme parolanız olmadan sunucudaki notlarınıza kimse erişemez. Dolayısıyla eğer şifreleme parolanızı unutursanız verilerinize erişimi de kaybedersiniz.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Tr extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Tr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Neden iki şifre kullanılıyor?';
	@override String get a => 'Nextcloud parolası bulut sunucuya erişmek için kullanılıyor. Şifreleme parolası, verilerinizin bulut sunucuya yollanmadan önce "karmaşıklaştırılması"nı sağlıyor.\nHerhangi birisi Nextcloud hesabınıza erişebilseydi bile, farklı bir şifreleme parolası kullandığınız için notlarınızı okuyamazdı. Böylece verilerinizin korunması için ikinci bir katman oluşuyor.';
}

// Path: login.faq.3
class _StringsLogin$faq$0i3$Tr extends _StringsLogin$faq$0i3$En {
	_StringsLogin$faq$0i3$Tr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Eğer Çift Faktörlü Koruma (2FA) kullanıyorsam nasıl giriş yapacağım?';
	@override String get a => 'Nextcloud parolanız yerine üreteceğiniz "uygulama parolası" ile giriş yapacaksınız. Bu parolayı Nextcloud ayarlarınız içerisinde Güvenlik > Cihazlar & oturumlar > Yeni uygulama parolası üret aşamalarını takip ederek gerçekleştirebilirsiniz. Şifreleme parolanız bundan etkilenmez.';
}

// Path: login.faq.4
class _StringsLogin$faq$0i4$Tr extends _StringsLogin$faq$0i4$En {
	_StringsLogin$faq$0i4$Tr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Her ikisi için de aynı parolayı kullanabilir miyim?';
	@override String get a => 'Evet ancak bu daha az güvenlidir. Nextcloud parolanız sunucuya gönderildiğinden, sunucuya erişimi olan birisi notlarınızın şifresini de çözebilir. Yalnızca sunucu sahibine güveniyorsanız aynı şifreyi kullanın.';
}

// Path: profile.quickLinks
class _StringsProfileQuickLinksTr extends _StringsProfileQuickLinksEn {
	_StringsProfileQuickLinksTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hızlı linkler';
	@override String get serverHomepage => 'Sunucu anasayfası';
	@override String get deleteAccount => 'Hesabı sil';
}

// Path: profile.faq.0
class _StringsProfile$faq$0i0$Tr extends _StringsProfile$faq$0i0$En {
	_StringsProfile$faq$0i0$Tr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Çıkış yaparsam notlarımı kaybedecek miyim?';
	@override String get a => 'Hayır. Notlarınız hem cihazınızda hem de sunucuda tutuluyor olacak. Siz tekrardan giriş yapana dek notlarınız senkronize edilmeyecek. Veri kaybı yaşamamak için çıkış yapmadan önce senkronizasyonun tamamlandığından emin olun (ana sayfada senkronizasyon ilerlemesini görebilirsiniz).';
}

// Path: profile.faq.1
class _StringsProfile$faq$0i1$Tr extends _StringsProfile$faq$0i1$En {
	_StringsProfile$faq$0i1$Tr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nextcloud parolamı nasıl değiştirebilirim?';
	@override String get a => 'Sunucu websitesine gidin ve hesabınıza giriş yapın. Arayüzde Ayarlar > Güvenlik > Parola değiştir yolunu takip edin. Parolanızı değiştirdikten sonra Saber\'dan çıkış yapıp tekrardan giriş yapmanız gerekecek.';
}

// Path: profile.faq.2
class _StringsProfile$faq$0i2$Tr extends _StringsProfile$faq$0i2$En {
	_StringsProfile$faq$0i2$Tr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Şifreleme parolamı nasıl değiştirebilirim?';
	@override String get a => '"1. Saber\'dan çıkış yap. Veri kaybı yaşamamak için çıkış yapmadan önce senkronizasyonun tamamlandığından emin olun (ana sayfada senkronizasyon ilerlemesini görebilirsiniz)."\n2. Sunucu websitesine gidin ve \'Saber\' klasörünü silin. Bu sunucudaki tüm notları silecek.\n"3. Saber\'a giriş yap. Tekrar giriş yaparken yeni şifreleme parolanızı belirleyebilirsiniz.\n4. Diğer cihazlarınızda da Saber\'dan çıkış yapıp tekrar giriş yapmayı unutmayın.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$Tr extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$Tr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Hesabımı nasıl silebilirim?';
	@override String get a => 'Üstte yer alan "${_root.profile.quickLinks.deleteAccount}" butonuna tıklayın, gerekirse giriş yapın.\nEğer resmi Saber sunucusunu kullanıyorsanız hesabınız 1 haftalık bekleme süresinden sonra silinecek. adilhanney@disroot.org adresinden benimle iletişime geçerek silinme talebini iptal edebilirsiniz.\nEğer üçüncü parti bir sunucu kullanıyorsanız hesabınızı silme seçeneği sunulmuyor olabilir: daha fazla bilgi için ilgili sunucunun gizlilik politikasını inceleyin.';
}

// Path: editor.toolbar
class _StringsEditorToolbarTr extends _StringsEditorToolbarEn {
	_StringsEditorToolbarTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Renklere geç (Ctrl C)';
	@override String get select => 'Seç';
	@override String get toggleEraser => 'Silgiyi aktifleştir (Ctrl E)';
	@override String get photo => 'Fotoğraf';
	@override String get text => 'Metin';
	@override String get toggleFingerDrawing => 'Parmakla çizimi aktifleştir (Ctrl F)';
	@override String get undo => 'Geri al';
	@override String get redo => 'Yeniden yap';
	@override String get export => 'Dışa aktar (Ctrl Shift S)';
	@override String get exportAs => 'Farklı formatta dışa aktar:';
	@override String get fullscreen => 'Tam ekrana geç (F11)';
}

// Path: editor.pens
class _StringsEditorPensTr extends _StringsEditorPensEn {
	_StringsEditorPensTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Dolma kalem';
	@override String get ballpointPen => 'Tükenmez kalem';
	@override String get highlighter => 'İşaretleme kalemi';
	@override String get laserPointer => 'Lazer işaretçi';
	@override String get shapePen => 'Şekil kalemi';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsTr extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get size => 'Boyut';
	@override String get sizeDragHint => 'Boyutu değiştirmek için sağa veya sola kaydır';
}

// Path: editor.colors
class _StringsEditorColorsTr extends _StringsEditorColorsEn {
	_StringsEditorColorsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Renk seçici';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Özel ${b} ${h}';
	@override String customHue({required Object h}) => 'Özel ${h}';
	@override String get dark => 'karanlık';
	@override String get light => 'ışık';
	@override String get black => 'Siyah';
	@override String get darkGrey => 'Koyu gri';
	@override String get grey => 'Gri';
	@override String get lightGrey => 'Açık gri';
	@override String get white => 'Beyaz';
	@override String get red => 'Kırmızı';
	@override String get green => 'Yeşil';
	@override String get blue => 'Mavi';
	@override String get yellow => 'Sarı';
	@override String get purple => 'Mor';
	@override String get orange => 'Turuncu';
	@override String get pastelRed => 'Pastel kırmızı';
	@override String get pastelOrange => 'Pastel turuncu';
	@override String get pastelYellow => 'Pastel sarı';
	@override String get pastelGreen => 'Pastel yeşil';
	@override String get pastelCyan => 'Pastel camgöbeği';
	@override String get pastelBlue => 'Pastel mavi';
	@override String get pastelPurple => 'Pastel mor';
	@override String get pastelPink => 'Pastel pembe';
	@override String get cyan => 'Camgöbeği';
	@override String get pink => 'Pembe';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsTr extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Görüntü ayarları';
	@override String get invertible => '(Rengi) Tersine çevrilebilir';
	@override String get download => 'İndir';
	@override String get setAsBackground => 'Arkaplan olarak ayarla';
	@override String get removeAsBackground => 'Arkaplanı kaldır';
	@override String get delete => 'Sil';
}

// Path: editor.selectionBar
class _StringsEditorSelectionBarTr extends _StringsEditorSelectionBarEn {
	_StringsEditorSelectionBarTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Sil';
	@override String get duplicate => 'Çoğalt';
}

// Path: editor.menu
class _StringsEditorMenuTr extends _StringsEditorMenuEn {
	_StringsEditorMenuTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => '${page}/${totalPages} numaralı sayfayı temizle';
	@override String get clearAllPages => 'Tüm sayfaları temizle';
	@override String get insertPage => 'Aşağıya sayfa ekle';
	@override String get duplicatePage => 'Sayfayı çoğalt';
	@override String get deletePage => 'Sayfayı sil';
	@override String get lineHeight => 'Satır aralığı';
	@override String get lineHeightDescription => 'Metnin boyutunu da kontrol eder';
	@override String get backgroundImageFit => 'Arkaplan görüntüsünü sığdır';
	@override String get backgroundPattern => 'Arkaplan deseni';
	@override String get import => 'İçe aktar';
	@override late final _StringsEditorMenuBoxFitsTr boxFits = _StringsEditorMenuBoxFitsTr._(_root);
	@override late final _StringsEditorMenuBgPatternsTr bgPatterns = _StringsEditorMenuBgPatternsTr._(_root);
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatTr extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Yalnızca okunabilir mod';
	@override String get title => 'Bu not Saber\'ın yeni bir versiyonunda düzenlenmiş';
	@override String get subtitle => 'Bu notu düzenlemek veri kaybına sebep olabilir. Bunu görmezden gelerek düzenlemek ister misiniz?';
	@override String get allowEditing => 'Düzenlemeye izin ver';
	@override String get cancel => 'İptal';
}

// Path: editor.quill
class _StringsEditorQuillTr extends _StringsEditorQuillEn {
	_StringsEditorQuillTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Buraya bir şey yaz...';
}

// Path: editor.hud
class _StringsEditorHudTr extends _StringsEditorHudEn {
	_StringsEditorHudTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Yakınlaştırma kilidini aç';
	@override String get lockZoom => 'Yakınlaştırmayı kilitle';
	@override String get unlockSingleFingerPan => 'Tek parmakla kaydırma kilidini aç';
	@override String get lockSingleFingerPan => 'Tek parmakla kaydırmayı kilitle';
	@override String get unlockAxisAlignedPan => 'Yatay ve dikey hareket kilidini aç';
	@override String get lockAxisAlignedPan => 'Yatay ve dikey hareketi kilitle';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _StringsSettingsPrefDescriptionsHideFingerDrawingTr extends _StringsSettingsPrefDescriptionsHideFingerDrawingEn {
	_StringsSettingsPrefDescriptionsHideFingerDrawingTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Yanlışlıkla değiştirilmesini engeller';
	@override String get fixedOn => 'Parmakla çizim izni verildi ve sabitlendi';
	@override String get fixedOff => 'Parmakla çizim izni verilmedi ve sabitlendi';
}

// Path: editor.menu.boxFits
class _StringsEditorMenuBoxFitsTr extends _StringsEditorMenuBoxFitsEn {
	_StringsEditorMenuBoxFitsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Yaydır';
	@override String get cover => 'Kapla';
	@override String get contain => 'İçer';
}

// Path: editor.menu.bgPatterns
class _StringsEditorMenuBgPatternsTr extends _StringsEditorMenuBgPatternsEn {
	_StringsEditorMenuBgPatternsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get none => 'Boş';
	@override String get college => 'Std. çizgili defter';
	@override String get collegeRtl => 'Std. çizgili defter (Tersine çevrik)';
	@override String get lined => 'Çizgili';
	@override String get grid => 'Kareli';
	@override String get dots => 'Noktalı';
	@override String get staffs => 'Porte (müzik)';
	@override String get tablature => 'Nota kağıdı';
	@override String get cornell => 'Cornell not şablonu';
}

// Path: <root>
class _StringsZhHansCn extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsZhHansCn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.zhHansCn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <zh-Hans-CN>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsZhHansCn _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeZhHansCn home = _StringsHomeZhHansCn._(_root);
	@override late final _StringsSettingsZhHansCn settings = _StringsSettingsZhHansCn._(_root);
	@override late final _StringsLoginZhHansCn login = _StringsLoginZhHansCn._(_root);
	@override late final _StringsProfileZhHansCn profile = _StringsProfileZhHansCn._(_root);
	@override late final _StringsAppInfoZhHansCn appInfo = _StringsAppInfoZhHansCn._(_root);
	@override late final _StringsUpdateZhHansCn update = _StringsUpdateZhHansCn._(_root);
	@override late final _StringsEditorZhHansCn editor = _StringsEditorZhHansCn._(_root);
}

// Path: home
class _StringsHomeZhHansCn extends _StringsHomeEn {
	_StringsHomeZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsZhHansCn tabs = _StringsHomeTabsZhHansCn._(_root);
	@override late final _StringsHomeTitlesZhHansCn titles = _StringsHomeTitlesZhHansCn._(_root);
	@override late final _StringsHomeTooltipsZhHansCn tooltips = _StringsHomeTooltipsZhHansCn._(_root);
	@override late final _StringsHomeCreateZhHansCn create = _StringsHomeCreateZhHansCn._(_root);
	@override String get welcome => '欢迎使用 Saber';
	@override String get invalidFormat => '不支持该文件。请选择 .sbn、.sbn2 或 .pdf 文件。';
	@override String get noFiles => '未找到文件';
	@override String get createNewNote => '点击 + 按钮新建一个笔记';
	@override String get backFolder => '回到上一个文件夹';
	@override late final _StringsHomeNewFolderZhHansCn newFolder = _StringsHomeNewFolderZhHansCn._(_root);
	@override late final _StringsHomeRenameNoteZhHansCn renameNote = _StringsHomeRenameNoteZhHansCn._(_root);
	@override late final _StringsHomeMoveNoteZhHansCn moveNote = _StringsHomeMoveNoteZhHansCn._(_root);
	@override String get deleteNote => '删除笔记';
	@override late final _StringsHomeRenameFolderZhHansCn renameFolder = _StringsHomeRenameFolderZhHansCn._(_root);
	@override late final _StringsHomeDeleteFolderZhHansCn deleteFolder = _StringsHomeDeleteFolderZhHansCn._(_root);
}

// Path: settings
class _StringsSettingsZhHansCn extends _StringsSettingsEn {
	_StringsSettingsZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefCategoriesZhHansCn prefCategories = _StringsSettingsPrefCategoriesZhHansCn._(_root);
	@override late final _StringsSettingsPrefLabelsZhHansCn prefLabels = _StringsSettingsPrefLabelsZhHansCn._(_root);
	@override late final _StringsSettingsPrefDescriptionsZhHansCn prefDescriptions = _StringsSettingsPrefDescriptionsZhHansCn._(_root);
	@override late final _StringsSettingsThemeModesZhHansCn themeModes = _StringsSettingsThemeModesZhHansCn._(_root);
	@override late final _StringsSettingsLayoutSizesZhHansCn layoutSizes = _StringsSettingsLayoutSizesZhHansCn._(_root);
	@override late final _StringsSettingsAccentColorPickerZhHansCn accentColorPicker = _StringsSettingsAccentColorPickerZhHansCn._(_root);
	@override String get systemLanguage => '系统语言';
	@override List<String> get axisDirections => [
		'上',
		'右',
		'下',
		'左',
	];
	@override late final _StringsSettingsResetZhHansCn reset = _StringsSettingsResetZhHansCn._(_root);
}

// Path: login
class _StringsLoginZhHansCn extends _StringsLoginEn {
	_StringsLoginZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '登录';
	@override late final _StringsLoginFeedbacksZhHansCn feedbacks = _StringsLoginFeedbacksZhHansCn._(_root);
	@override late final _StringsLoginFormZhHansCn form = _StringsLoginFormZhHansCn._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: '还没有帐户？ '),
		linkToSignup('立即注册'),
		const TextSpan(text: '！'),
	]);
	@override late final _StringsLoginStatusZhHansCn status = _StringsLoginStatusZhHansCn._(_root);
	@override List<dynamic> get faq => [
		_StringsLogin$faq$0i0$ZhHansCn._(_root),
		_StringsLogin$faq$0i1$ZhHansCn._(_root),
		_StringsLogin$faq$0i2$ZhHansCn._(_root),
		_StringsLogin$faq$0i3$ZhHansCn._(_root),
		_StringsLogin$faq$0i4$ZhHansCn._(_root),
	];
}

// Path: profile
class _StringsProfileZhHansCn extends _StringsProfileEn {
	_StringsProfileZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '我的用户资料';
	@override String get logout => '注销';
	@override late final _StringsProfileQuickLinksZhHansCn quickLinks = _StringsProfileQuickLinksZhHansCn._(_root);
	@override List<dynamic> get faq => [
		_StringsProfile$faq$0i0$ZhHansCn._(_root),
		_StringsProfile$faq$0i1$ZhHansCn._(_root),
		_StringsProfile$faq$0i2$ZhHansCn._(_root),
		_StringsProfile$faq$0i3$ZhHansCn._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoZhHansCn extends _StringsAppInfoEn {
	_StringsAppInfoZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  版权所有 © 2022-${buildYear}  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
	@override String get dirty => 'DIRTY';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => '点击此处赞助我或购买更多存储空间';
	@override String get licenseButton => '点击此处查看更多许可证信息';
	@override String get privacyPolicyButton => '点击此处查看隐私政策';
}

// Path: update
class _StringsUpdateZhHansCn extends _StringsUpdateEn {
	_StringsUpdateZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => '可用更新';
	@override String get updateAvailableDescription => '该应用的新版本可用，具有以下变更：';
	@override String get update => '更新';
}

// Path: editor
class _StringsEditorZhHansCn extends _StringsEditorEn {
	_StringsEditorZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarZhHansCn toolbar = _StringsEditorToolbarZhHansCn._(_root);
	@override late final _StringsEditorPensZhHansCn pens = _StringsEditorPensZhHansCn._(_root);
	@override late final _StringsEditorPenOptionsZhHansCn penOptions = _StringsEditorPenOptionsZhHansCn._(_root);
	@override late final _StringsEditorColorsZhHansCn colors = _StringsEditorColorsZhHansCn._(_root);
	@override late final _StringsEditorImageOptionsZhHansCn imageOptions = _StringsEditorImageOptionsZhHansCn._(_root);
	@override late final _StringsEditorSelectionBarZhHansCn selectionBar = _StringsEditorSelectionBarZhHansCn._(_root);
	@override late final _StringsEditorMenuZhHansCn menu = _StringsEditorMenuZhHansCn._(_root);
	@override late final _StringsEditorNewerFileFormatZhHansCn newerFileFormat = _StringsEditorNewerFileFormatZhHansCn._(_root);
	@override late final _StringsEditorQuillZhHansCn quill = _StringsEditorQuillZhHansCn._(_root);
	@override late final _StringsEditorHudZhHansCn hud = _StringsEditorHudZhHansCn._(_root);
	@override String get pages => '页面';
	@override String get untitled => '未命名';
	@override String get needsToSaveBeforeExiting => '正在保存您的更改。。。完成后您可以安全地退出编辑器';
}

// Path: home.tabs
class _StringsHomeTabsZhHansCn extends _StringsHomeTabsEn {
	_StringsHomeTabsZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get home => '主页';
	@override String get browse => '全部笔记';
	@override String get whiteboard => '白板';
	@override String get settings => '设置';
}

// Path: home.titles
class _StringsHomeTitlesZhHansCn extends _StringsHomeTitlesEn {
	_StringsHomeTitlesZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get home => '最近笔记';
	@override String get browse => '浏览';
	@override String get whiteboard => '白板';
	@override String get settings => '设置';
}

// Path: home.tooltips
class _StringsHomeTooltipsZhHansCn extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新建笔记';
	@override String get showUpdateDialog => '显示更新对话框';
}

// Path: home.create
class _StringsHomeCreateZhHansCn extends _StringsHomeCreateEn {
	_StringsHomeCreateZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新建笔记';
	@override String get importNote => '导入笔记';
}

// Path: home.newFolder
class _StringsHomeNewFolderZhHansCn extends _StringsHomeNewFolderEn {
	_StringsHomeNewFolderZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get newFolder => '新建文件夹';
	@override String get folderName => '文件夹名称';
	@override String get create => '创建';
	@override String get folderNameEmpty => '文件夹名称不能为空';
	@override String get folderNameContainsSlash => '文件夹名称不能包含斜杠';
	@override String get folderNameExists => '文件夹已存在';
}

// Path: home.renameNote
class _StringsHomeRenameNoteZhHansCn extends _StringsHomeRenameNoteEn {
	_StringsHomeRenameNoteZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get renameNote => '重命名笔记';
	@override String get noteName => '笔记名称';
	@override String get rename => '重命名';
	@override String get noteNameEmpty => '笔记名称不能为空';
	@override String get noteNameContainsSlash => '注意名称不能包含斜杠';
	@override String get noteNameExists => '此名称的笔记已经存在';
}

// Path: home.moveNote
class _StringsHomeMoveNoteZhHansCn extends _StringsHomeMoveNoteEn {
	_StringsHomeMoveNoteZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get moveNote => '移动笔记';
	@override String moveName({required Object f}) => '移动 ${f}';
	@override String get move => '移动';
	@override String renamedTo({required Object newName}) => '笔记将重命名为 ${newName}';
	@override String moveNotes({required Object n}) => '移动 ${n} 笔记';
	@override String get multipleRenamedTo => '以下注释将被重命名：';
	@override String numberRenamedTo({required Object n}) => '${n} 笔记将被重命名以避免冲突';
}

// Path: home.renameFolder
class _StringsHomeRenameFolderZhHansCn extends _StringsHomeRenameFolderEn {
	_StringsHomeRenameFolderZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => '重命名文件夹';
	@override String get folderName => '文件夹名称';
	@override String get rename => '重命名';
	@override String get folderNameEmpty => '文件夹不能为空';
	@override String get folderNameContainsSlash => '文件夹名称不能包含斜线';
	@override String get folderNameExists => '已存在该名称的文件夹';
}

// Path: home.deleteFolder
class _StringsHomeDeleteFolderZhHansCn extends _StringsHomeDeleteFolderEn {
	_StringsHomeDeleteFolderZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => '删除文件夹';
	@override String deleteName({required Object f}) => '删除 ${f}';
	@override String get delete => '删除';
	@override String get alsoDeleteContents => '同时删除此文件夹中的所有笔记';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesZhHansCn extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get general => '通用';
	@override String get writing => '书写';
	@override String get editor => '编辑器';
	@override String get advanced => '高级';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsZhHansCn extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get locale => '应用语言';
	@override String get appTheme => '应用主题';
	@override String get platform => '主题类型';
	@override String get layoutSize => '布局大小';
	@override String get customAccentColor => '自定义主题色';
	@override String get hyperlegibleFont => '易读字体';
	@override String get shouldCheckForUpdates => '自动检查 Saber 更新';
	@override String get shouldAlwaysAlertForUpdates => '更快的更新提醒';
	@override String get disableAds => '禁用广告';
	@override String get changeAdsConsent => '更改广告许可';
	@override String get allowInsecureConnections => '允许不安全的连接';
	@override String get editorToolbarAlignment => '编辑工具栏对齐方式';
	@override String get editorToolbarShowInFullscreen => '在全屏模式中显示编辑菜单栏';
	@override String get editorAutoInvert => '在深色模式下使用反色笔记背景';
	@override String get editorOpaqueBackgrounds => '不透明背景';
	@override String get preferGreyscale => '使用灰度颜色';
	@override String get maxImageSize => '最大图片大小';
	@override String get autoClearWhiteboardOnExit => '离开应用后清除白板';
	@override String get disableEraserAfterUse => '自动禁用橡皮擦';
	@override String get hideFingerDrawingToggle => '隐藏 切换手指绘制';
	@override String get editorPromptRename => '提示您重命名新笔记';
	@override String get hideHomeBackgrounds => '在主页隐藏背景';
	@override String get recentColorsDontSavePresets => '不在最近使用的颜色中保存预设颜色';
	@override String get printPageIndicators => '打印页码';
	@override String get autosaveDelay => '自动保存延迟';
	@override String get recentColorsLength => '要存储多少种最近的颜色';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsZhHansCn extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible 字体为低视力读者提高易读性';
	@override String get disableAds => '广告有助于支持 Saber 的开发，但如果你不喜欢，你可以禁用它们';
	@override String get allowInsecureConnections => '（不推荐）允许 Saber 连接到具有自签名/不受信任证书的服务器';
	@override String get editorOpaqueBackgrounds => '移除背景图像和 PDF 的透明度';
	@override String get preferGreyscale => '用于电子墨水显示器';
	@override String get autoClearWhiteboardOnExit => '这将会同步到您的其他设备';
	@override String get disableEraserAfterUse => '使用橡皮擦后自动切换回笔';
	@override String get maxImageSize => '更大的图片将会被压缩';
	@override late final _StringsSettingsPrefDescriptionsHideFingerDrawingZhHansCn hideFingerDrawing = _StringsSettingsPrefDescriptionsHideFingerDrawingZhHansCn._(_root);
	@override String get editorPromptRename => '您可以总是稍后重命名笔记';
	@override String get hideHomeBackgrounds => '更简洁的外观';
	@override String get printPageIndicators => '在导出中显示页码';
	@override String get autosaveDelay => '自动保存便笺需要等待的时间';
	@override String get shouldAlwaysAlertForUpdates => '在更新可用时尽快告诉我';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesZhHansCn extends _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get system => '系统';
	@override String get light => '浅色';
	@override String get dark => '深色';
}

// Path: settings.layoutSizes
class _StringsSettingsLayoutSizesZhHansCn extends _StringsSettingsLayoutSizesEn {
	_StringsSettingsLayoutSizesZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get auto => '自动';
	@override String get phone => '手机';
	@override String get tablet => '平板';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerZhHansCn extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => '选取颜色';
}

// Path: settings.reset
class _StringsSettingsResetZhHansCn extends _StringsSettingsResetEn {
	_StringsSettingsResetZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '重置此设置？';
	@override String get button => '重置';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksZhHansCn extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get checkUsername => '请仔细检查您的用户名或电子邮件。';
	@override String get enterNcPassword => '请输入您的 Nextcloud 密码。';
	@override String get enterEncPassword => '请输入您的加密密码。';
	@override String get checkUrl => '请输入有效链接。';
	@override String get ncLoginFailed => '登录失败，请检查您的详细信息和网络连接。';
	@override String ncUnsupportedFailure({required Object v, required Object s}) => '指定的服务器正在运行 Nextcloud ${v}，但此版本的 Saber 仅支持 Nextcloud ${s}。';
	@override String get encLoginFailed => '登录失败，请检查您的加密密码。';
	@override String get loginSuccess => '登录成功！我们正在设置中，请稍候……';
}

// Path: login.form
class _StringsLoginFormZhHansCn extends _StringsLoginFormEn {
	_StringsLoginFormZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get useCustomServer => '我想要使用自定义 Nextcloud 服务器';
	@override String get customServerUrl => '自定义服务器链接';
	@override String get username => '用户名或邮箱';
	@override String get ncPassword => 'Nextcloud 密码';
	@override String get encPassword => '加密密码';
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: '登录即表示您同意 '),
		linkToPrivacyPolicy('隐私政策'),
		const TextSpan(text: '。'),
	]);
	@override String get login => '登录';
}

// Path: login.status
class _StringsLoginStatusZhHansCn extends _StringsLoginStatusEn {
	_StringsLoginStatusZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => '已使用 Nextcloud 登录';
	@override String get loggedOut => '已注销';
	@override String get tapToLogin => '点击以使用 Nextcloud 登录';
}

// Path: login.faq.0
class _StringsLogin$faq$0i0$ZhHansCn extends _StringsLogin$faq$0i0$En {
	_StringsLogin$faq$0i0$ZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nextcloud 是什么？';
	@override String get a => 'Nextcloud 是一个私人文件同步服务器，等等。您可以使用默认的 Saber Nextcloud 服务器、使用第三方服务器或自行托管您自己的服务器以完全控制您的数据。';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$ZhHansCn extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$ZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '加密密码是什么？';
	@override String get a => '加密密码用于在将数据发送到服务器之前对其进行加密。您在首次登录 Saber 时选择它，它与您的 Nextcloud 帐户密码无关。\n没有您的加密密码，任何人都无法访问您在服务器上的笔记。这也意味着，如果您忘记了加密密码，您将无法访问您的数据。';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$ZhHansCn extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$ZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '为什么要使用两个密码？';
	@override String get a => 'Nextcloud 密码用于访问云端。加密密码会在您的数据到达云端之前对其进行“加密”。\n即使有人获得了您的 Nextcloud 帐户的访问权限，您的笔记也会保持安全并使用单独的密码进行加密。这为您提供了第二层安全保护来保护您的数据。”';
}

// Path: login.faq.3
class _StringsLogin$faq$0i3$ZhHansCn extends _StringsLogin$faq$0i3$En {
	_StringsLogin$faq$0i3$ZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '如果我使用 2FA，我该如何登录？';
	@override String get a => '您需要创建一个“应用密码”，而不是常规的 Nextcloud 密码。您可以在安全 > 设备和会话 > 创建新应用密码下的 Nextcloud 设置中执行此操作。您的加密密码不受影响。';
}

// Path: login.faq.4
class _StringsLogin$faq$0i4$ZhHansCn extends _StringsLogin$faq$0i4$En {
	_StringsLogin$faq$0i4$ZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '我可以为两者使用相同的密码吗？';
	@override String get a => '是的，但这样做不太安全。由于您的 Nextcloud 密码已发送到服务器，因此有权访问服务器的人将能够解密您的笔记。请仅在您信任服务器所有者的情况下使用相同的密码。';
}

// Path: profile.quickLinks
class _StringsProfileQuickLinksZhHansCn extends _StringsProfileQuickLinksEn {
	_StringsProfileQuickLinksZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '快速链接';
	@override String get serverHomepage => '服务器主页';
	@override String get deleteAccount => '删除帐户';
}

// Path: profile.faq.0
class _StringsProfile$faq$0i0$ZhHansCn extends _StringsProfile$faq$0i0$En {
	_StringsProfile$faq$0i0$ZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '如果我注销，我的笔记会丢失吗？';
	@override String get a => '不会。您的笔记将保留在您的设备和服务器上。在您重新登录之前，它们不会与服务器同步。请确保在注销前完成同步，以免丢失任何数据（请在主屏幕上查看同步进度）。';
}

// Path: profile.faq.1
class _StringsProfile$faq$0i1$ZhHansCn extends _StringsProfile$faq$0i1$En {
	_StringsProfile$faq$0i1$ZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '如何更改我的 Nextcloud 密码？';
	@override String get a => '转到您的服务器网站并登录。然后转到设置 > 安全 > 更改密码。更改密码后，您需要注销并重新登录 Saber。';
}

// Path: profile.faq.2
class _StringsProfile$faq$0i2$ZhHansCn extends _StringsProfile$faq$0i2$En {
	_StringsProfile$faq$0i2$ZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '如何更改我的加密密码？';
	@override String get a => '1.退出Saber。请确保在注销前完成同步，以免丢失任何数据（在主屏幕上查看同步进度）。\n2.转到您的服务器网站并删除您的“Saber”文件夹。这将从服务器中删除您的所有笔记。\n3.重新登录 Saber。您可以在登录时选择一个新的加密密码。\n4.不要忘记在您的其他设备上注销并重新登录 Saber。';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$ZhHansCn extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$ZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '如何删除我的帐户？';
	@override String get a => '点击上面的 "${_root.profile.quickLinks.deleteAccount}" 按钮，并在需要时登录。\n如果您使用的是官方 Saber 服务器，您的帐户将在 1 周的宽限期后被删除。在此期间，您可以通过 adilhanney@disroot.org 与我联系以取消删除。\n如果您使用的是第三方服务器，则可能没有删除帐户的选项：您需要咨询服务器的隐私政策以获取更多信息。';
}

// Path: editor.toolbar
class _StringsEditorToolbarZhHansCn extends _StringsEditorToolbarEn {
	_StringsEditorToolbarZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => '切换颜色 (Ctrl C)';
	@override String get select => '选择';
	@override String get toggleEraser => '切换橡皮擦 (Ctrl E)';
	@override String get photo => '照片';
	@override String get text => '文本';
	@override String get toggleFingerDrawing => '切换手写 (Ctrl F)';
	@override String get undo => '撤销';
	@override String get redo => '重做';
	@override String get export => '导出 (Ctrl Shift S)';
	@override String get exportAs => '导出为：';
	@override String get fullscreen => '切换全屏 (F11)';
}

// Path: editor.pens
class _StringsEditorPensZhHansCn extends _StringsEditorPensEn {
	_StringsEditorPensZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => '钢笔';
	@override String get ballpointPen => '圆珠笔';
	@override String get highlighter => '荧光笔';
	@override String get laserPointer => '激光笔';
	@override String get shapePen => '造型笔';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsZhHansCn extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get size => '粗细';
	@override String get sizeDragHint => '左右拖动更改粗细';
}

// Path: editor.colors
class _StringsEditorColorsZhHansCn extends _StringsEditorColorsEn {
	_StringsEditorColorsZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => '选色器';
	@override String customBrightnessHue({required Object b, required Object h}) => '定制 ${b} ${h}';
	@override String customHue({required Object h}) => '定制 ${h}';
	@override String get dark => '黑暗的';
	@override String get light => '光';
	@override String get black => '黑色';
	@override String get darkGrey => '深灰色';
	@override String get grey => '灰色';
	@override String get lightGrey => '浅灰色';
	@override String get white => '白色';
	@override String get red => '红色';
	@override String get green => '绿色';
	@override String get blue => '蓝色';
	@override String get yellow => '黄色';
	@override String get purple => '紫色';
	@override String get orange => '橙色';
	@override String get pastelRed => '浅红色';
	@override String get pastelOrange => '浅橙色';
	@override String get pastelYellow => '浅黄色';
	@override String get pastelGreen => '浅绿色';
	@override String get pastelCyan => '浅青色';
	@override String get pastelBlue => '浅蓝色';
	@override String get pastelPurple => '浅紫色';
	@override String get pastelPink => '浅粉色';
	@override String get cyan => '青色';
	@override String get pink => '粉色的';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsZhHansCn extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '图片选项';
	@override String get invertible => '反转颜色';
	@override String get download => '下载';
	@override String get setAsBackground => '设为背景';
	@override String get removeAsBackground => '作为背景移除';
	@override String get delete => '删除';
}

// Path: editor.selectionBar
class _StringsEditorSelectionBarZhHansCn extends _StringsEditorSelectionBarEn {
	_StringsEditorSelectionBarZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get delete => '删除';
	@override String get duplicate => '重复';
}

// Path: editor.menu
class _StringsEditorMenuZhHansCn extends _StringsEditorMenuEn {
	_StringsEditorMenuZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => '清除页面 ${page}/${totalPages}';
	@override String get clearAllPages => '清除全部页面';
	@override String get insertPage => '在下方插入页面';
	@override String get duplicatePage => '复制页面';
	@override String get deletePage => '删除页面';
	@override String get lineHeight => '行高';
	@override String get lineHeightDescription => '同时控制文本大小';
	@override String get backgroundImageFit => '背景图像拟合';
	@override String get backgroundPattern => '背景图案';
	@override String get import => '导入';
	@override late final _StringsEditorMenuBoxFitsZhHansCn boxFits = _StringsEditorMenuBoxFitsZhHansCn._(_root);
	@override late final _StringsEditorMenuBgPatternsZhHansCn bgPatterns = _StringsEditorMenuBgPatternsZhHansCn._(_root);
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatZhHansCn extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => '只读模式';
	@override String get title => '此笔记使用新版 Saber 编辑而成';
	@override String get subtitle => '编辑此笔记可能会导致某些信息丢失。您想忽略并编辑吗？';
	@override String get allowEditing => '允许编辑';
	@override String get cancel => '取消';
}

// Path: editor.quill
class _StringsEditorQuillZhHansCn extends _StringsEditorQuillEn {
	_StringsEditorQuillZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => '在这里输入...';
}

// Path: editor.hud
class _StringsEditorHudZhHansCn extends _StringsEditorHudEn {
	_StringsEditorHudZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => '解锁缩放';
	@override String get lockZoom => '锁定缩放';
	@override String get unlockSingleFingerPan => '启用单指平移';
	@override String get lockSingleFingerPan => '禁用单指平移';
	@override String get unlockAxisAlignedPan => '解锁水平或垂直平移';
	@override String get lockAxisAlignedPan => '锁定水平或垂直平移';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _StringsSettingsPrefDescriptionsHideFingerDrawingZhHansCn extends _StringsSettingsPrefDescriptionsHideFingerDrawingEn {
	_StringsSettingsPrefDescriptionsHideFingerDrawingZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get shown => '防止意外切换';
	@override String get fixedOn => '手指绘制固定为启用状态';
	@override String get fixedOff => '手指绘制固定为禁用状态';
}

// Path: editor.menu.boxFits
class _StringsEditorMenuBoxFitsZhHansCn extends _StringsEditorMenuBoxFitsEn {
	_StringsEditorMenuBoxFitsZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get fill => '拉伸';
	@override String get cover => '覆盖';
	@override String get contain => '包含';
}

// Path: editor.menu.bgPatterns
class _StringsEditorMenuBgPatternsZhHansCn extends _StringsEditorMenuBgPatternsEn {
	_StringsEditorMenuBgPatternsZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get none => '空白';
	@override String get college => 'College-ruled';
	@override String get collegeRtl => 'College-ruled（反转）';
	@override String get lined => '横线';
	@override String get grid => '网格';
	@override String get dots => '点';
	@override String get staffs => '五线谱';
	@override String get tablature => '绘画';
	@override String get cornell => 'Cornell';
}

// Path: <root>
class _StringsZhHantTw extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsZhHantTw.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.zhHantTw,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <zh-Hant-TW>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	@override late final _StringsZhHantTw _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeZhHantTw home = _StringsHomeZhHantTw._(_root);
	@override late final _StringsSettingsZhHantTw settings = _StringsSettingsZhHantTw._(_root);
	@override late final _StringsLoginZhHantTw login = _StringsLoginZhHantTw._(_root);
	@override late final _StringsProfileZhHantTw profile = _StringsProfileZhHantTw._(_root);
	@override late final _StringsAppInfoZhHantTw appInfo = _StringsAppInfoZhHantTw._(_root);
	@override late final _StringsUpdateZhHantTw update = _StringsUpdateZhHantTw._(_root);
	@override late final _StringsEditorZhHantTw editor = _StringsEditorZhHantTw._(_root);
}

// Path: home
class _StringsHomeZhHantTw extends _StringsHomeEn {
	_StringsHomeZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsZhHantTw tabs = _StringsHomeTabsZhHantTw._(_root);
	@override late final _StringsHomeTitlesZhHantTw titles = _StringsHomeTitlesZhHantTw._(_root);
	@override late final _StringsHomeTooltipsZhHantTw tooltips = _StringsHomeTooltipsZhHantTw._(_root);
	@override late final _StringsHomeCreateZhHantTw create = _StringsHomeCreateZhHantTw._(_root);
	@override String get welcome => '歡迎使用 Saber';
	@override String get invalidFormat => '「不支援您選擇的檔案，請選擇 .sbn、.sbn2 或 .pdf 檔案。」';
	@override String get noFiles => '未找到檔案';
	@override String get createNewNote => '點擊 + 按鈕新增一個筆記';
	@override String get backFolder => '返回上一個資料夾';
	@override late final _StringsHomeNewFolderZhHantTw newFolder = _StringsHomeNewFolderZhHantTw._(_root);
	@override late final _StringsHomeRenameNoteZhHantTw renameNote = _StringsHomeRenameNoteZhHantTw._(_root);
	@override late final _StringsHomeMoveNoteZhHantTw moveNote = _StringsHomeMoveNoteZhHantTw._(_root);
	@override String get deleteNote => '刪除筆記';
	@override late final _StringsHomeRenameFolderZhHantTw renameFolder = _StringsHomeRenameFolderZhHantTw._(_root);
	@override late final _StringsHomeDeleteFolderZhHantTw deleteFolder = _StringsHomeDeleteFolderZhHantTw._(_root);
}

// Path: settings
class _StringsSettingsZhHantTw extends _StringsSettingsEn {
	_StringsSettingsZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefCategoriesZhHantTw prefCategories = _StringsSettingsPrefCategoriesZhHantTw._(_root);
	@override late final _StringsSettingsPrefLabelsZhHantTw prefLabels = _StringsSettingsPrefLabelsZhHantTw._(_root);
	@override late final _StringsSettingsPrefDescriptionsZhHantTw prefDescriptions = _StringsSettingsPrefDescriptionsZhHantTw._(_root);
	@override late final _StringsSettingsThemeModesZhHantTw themeModes = _StringsSettingsThemeModesZhHantTw._(_root);
	@override late final _StringsSettingsLayoutSizesZhHantTw layoutSizes = _StringsSettingsLayoutSizesZhHantTw._(_root);
	@override late final _StringsSettingsAccentColorPickerZhHantTw accentColorPicker = _StringsSettingsAccentColorPickerZhHantTw._(_root);
	@override String get systemLanguage => '系統語言';
	@override List<String> get axisDirections => [
		'置頂',
		'靠右',
		'置底',
		'靠左',
	];
	@override late final _StringsSettingsResetZhHantTw reset = _StringsSettingsResetZhHantTw._(_root);
}

// Path: login
class _StringsLoginZhHantTw extends _StringsLoginEn {
	_StringsLoginZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '登入';
	@override late final _StringsLoginFeedbacksZhHantTw feedbacks = _StringsLoginFeedbacksZhHantTw._(_root);
	@override late final _StringsLoginFormZhHantTw form = _StringsLoginFormZhHantTw._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: '還沒有帳號？ '),
		linkToSignup('立即註冊'),
		const TextSpan(text: '！'),
	]);
	@override late final _StringsLoginStatusZhHantTw status = _StringsLoginStatusZhHantTw._(_root);
	@override List<dynamic> get faq => [
		_StringsLogin$faq$0i0$ZhHantTw._(_root),
		_StringsLogin$faq$0i1$ZhHantTw._(_root),
		_StringsLogin$faq$0i2$ZhHantTw._(_root),
		_StringsLogin$faq$0i3$ZhHantTw._(_root),
		_StringsLogin$faq$0i4$ZhHantTw._(_root),
	];
}

// Path: profile
class _StringsProfileZhHantTw extends _StringsProfileEn {
	_StringsProfileZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '我的個人資料';
	@override String get logout => '登出';
	@override late final _StringsProfileQuickLinksZhHantTw quickLinks = _StringsProfileQuickLinksZhHantTw._(_root);
	@override List<dynamic> get faq => [
		_StringsProfile$faq$0i0$ZhHantTw._(_root),
		_StringsProfile$faq$0i1$ZhHantTw._(_root),
		_StringsProfile$faq$0i2$ZhHantTw._(_root),
		_StringsProfile$faq$0i3$ZhHantTw._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoZhHantTw extends _StringsAppInfoEn {
	_StringsAppInfoZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  版權所有 © 2022-${buildYear}  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
	@override String get dirty => 'DIRTY';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => '點擊此處贊助我或購買更多儲存空間';
	@override String get licenseButton => '點擊此處查看更多許可證資訊';
	@override String get privacyPolicyButton => '點擊此處查看隱私權政策';
}

// Path: update
class _StringsUpdateZhHantTw extends _StringsUpdateEn {
	_StringsUpdateZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => '可用更新';
	@override String get updateAvailableDescription => '新版本的應用程式已推出，有了以下變化:';
	@override String get update => '更新';
}

// Path: editor
class _StringsEditorZhHantTw extends _StringsEditorEn {
	_StringsEditorZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarZhHantTw toolbar = _StringsEditorToolbarZhHantTw._(_root);
	@override late final _StringsEditorPensZhHantTw pens = _StringsEditorPensZhHantTw._(_root);
	@override late final _StringsEditorPenOptionsZhHantTw penOptions = _StringsEditorPenOptionsZhHantTw._(_root);
	@override late final _StringsEditorColorsZhHantTw colors = _StringsEditorColorsZhHantTw._(_root);
	@override late final _StringsEditorImageOptionsZhHantTw imageOptions = _StringsEditorImageOptionsZhHantTw._(_root);
	@override late final _StringsEditorSelectionBarZhHantTw selectionBar = _StringsEditorSelectionBarZhHantTw._(_root);
	@override late final _StringsEditorMenuZhHantTw menu = _StringsEditorMenuZhHantTw._(_root);
	@override late final _StringsEditorNewerFileFormatZhHantTw newerFileFormat = _StringsEditorNewerFileFormatZhHantTw._(_root);
	@override late final _StringsEditorQuillZhHantTw quill = _StringsEditorQuillZhHantTw._(_root);
	@override late final _StringsEditorHudZhHantTw hud = _StringsEditorHudZhHantTw._(_root);
	@override String get pages => '頁面';
	@override String get untitled => '無標題';
	@override String get needsToSaveBeforeExiting => '正在儲存您的變更...完成後您可以安全地退出編輯器';
}

// Path: home.tabs
class _StringsHomeTabsZhHantTw extends _StringsHomeTabsEn {
	_StringsHomeTabsZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get home => '首頁';
	@override String get browse => '全部筆記';
	@override String get whiteboard => '白板';
	@override String get settings => '設定';
}

// Path: home.titles
class _StringsHomeTitlesZhHantTw extends _StringsHomeTitlesEn {
	_StringsHomeTitlesZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get home => '最近筆記';
	@override String get browse => '瀏覽';
	@override String get whiteboard => '白板';
	@override String get settings => '設定';
}

// Path: home.tooltips
class _StringsHomeTooltipsZhHantTw extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新增筆記';
	@override String get showUpdateDialog => '顯示更新對話框';
}

// Path: home.create
class _StringsHomeCreateZhHantTw extends _StringsHomeCreateEn {
	_StringsHomeCreateZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新增筆記';
	@override String get importNote => '匯入筆記';
}

// Path: home.newFolder
class _StringsHomeNewFolderZhHantTw extends _StringsHomeNewFolderEn {
	_StringsHomeNewFolderZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get newFolder => '新建資料夾';
	@override String get folderName => '資料夾名稱';
	@override String get create => '創建';
	@override String get folderNameEmpty => '資料夾名稱不可為空';
	@override String get folderNameContainsSlash => '資料夾名稱不能包含斜槓';
	@override String get folderNameExists => '資料夾已經存在';
}

// Path: home.renameNote
class _StringsHomeRenameNoteZhHantTw extends _StringsHomeRenameNoteEn {
	_StringsHomeRenameNoteZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get renameNote => '重新命名筆記';
	@override String get noteName => '筆記名稱';
	@override String get rename => '重新命名';
	@override String get noteNameEmpty => '筆記名稱不可為空';
	@override String get noteNameContainsSlash => '筆記名稱不能包含斜槓';
	@override String get noteNameExists => '同名筆記已經存在';
}

// Path: home.moveNote
class _StringsHomeMoveNoteZhHantTw extends _StringsHomeMoveNoteEn {
	_StringsHomeMoveNoteZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get moveNote => '移動筆記';
	@override String moveName({required Object f}) => '移動 ${f}';
	@override String get move => '移動';
	@override String renamedTo({required Object newName}) => '筆記將重新命名為 ${newName}';
	@override String moveNotes({required Object n}) => '移動 ${n} 筆記';
	@override String get multipleRenamedTo => '以下註釋將被重新命名：';
	@override String numberRenamedTo({required Object n}) => '${n} 筆記將被重新命名以避免衝突';
}

// Path: home.renameFolder
class _StringsHomeRenameFolderZhHantTw extends _StringsHomeRenameFolderEn {
	_StringsHomeRenameFolderZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => '重新命名資料夾';
	@override String get folderName => '資料夾名稱';
	@override String get rename => '重新命名';
	@override String get folderNameEmpty => '資烙夾名稱不能為空';
	@override String get folderNameContainsSlash => '資料夾名稱不能包含斜槓';
	@override String get folderNameExists => '已存在同名的資料夾';
}

// Path: home.deleteFolder
class _StringsHomeDeleteFolderZhHantTw extends _StringsHomeDeleteFolderEn {
	_StringsHomeDeleteFolderZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => '刪除資料夾';
	@override String deleteName({required Object f}) => '刪除 ${f}';
	@override String get delete => '刪除';
	@override String get alsoDeleteContents => '同時刪除該文件夾內的所有筆記';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesZhHantTw extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get general => '一般';
	@override String get writing => '書寫';
	@override String get editor => '編輯器';
	@override String get advanced => '進階';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsZhHantTw extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get locale => '應用程式語言';
	@override String get appTheme => '應用程式主題';
	@override String get platform => '主題類型';
	@override String get layoutSize => '佈局大小';
	@override String get customAccentColor => '自訂主題色';
	@override String get hyperlegibleFont => '易讀字體';
	@override String get shouldCheckForUpdates => '自動檢查 Saber 更新';
	@override String get shouldAlwaysAlertForUpdates => '更快的更新';
	@override String get disableAds => '禁用廣告';
	@override String get changeAdsConsent => '修改廣告同意書';
	@override String get allowInsecureConnections => '允許不安全的連結';
	@override String get editorToolbarAlignment => '編輯器工具列的對齊方式';
	@override String get editorToolbarShowInFullscreen => '在全螢幕模式中顯示編輯器工具列';
	@override String get editorAutoInvert => '在深色模式下使用反色筆記背景';
	@override String get editorOpaqueBackgrounds => '不透明背景';
	@override String get preferGreyscale => '使用灰度顏色';
	@override String get maxImageSize => '最大圖片尺寸';
	@override String get autoClearWhiteboardOnExit => '退出應用程式後清除白板';
	@override String get disableEraserAfterUse => '自動禁用橡皮擦';
	@override String get hideFingerDrawingToggle => '隱藏手指繪圖切換開關';
	@override String get editorPromptRename => '提醒您重新命名新筆記';
	@override String get hideHomeBackgrounds => '隱藏主畫面上的背景';
	@override String get recentColorsDontSavePresets => '不要在最近的顏色中儲存預設顏色';
	@override String get printPageIndicators => '列印頁碼';
	@override String get autosaveDelay => '自動儲存延遲';
	@override String get recentColorsLength => '要儲存多少種最近的顏色';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsZhHantTw extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible 字體為低視力讀者提高易讀性';
	@override String get disableAds => '廣告有助於支持Saber的發展，但如果您不願意，可以禁用它';
	@override String get allowInsecureConnections => '（不推薦）允許Saber連結到具有自簽名/不受信任證書的伺服器';
	@override String get editorOpaqueBackgrounds => '去除背景圖片和PDF的透明度';
	@override String get preferGreyscale => '用於電子紙螢幕';
	@override String get autoClearWhiteboardOnExit => '它仍會同步到您的其他裝置';
	@override String get disableEraserAfterUse => '使用橡皮擦後自動切換回筆';
	@override String get maxImageSize => '大於此大小的圖片將被壓縮';
	@override late final _StringsSettingsPrefDescriptionsHideFingerDrawingZhHantTw hideFingerDrawing = _StringsSettingsPrefDescriptionsHideFingerDrawingZhHantTw._(_root);
	@override String get editorPromptRename => '您以後隨時可以重新命名筆記';
	@override String get hideHomeBackgrounds => '為了更乾淨的外觀';
	@override String get printPageIndicators => '在匯出中顯示頁碼';
	@override String get autosaveDelay => '自動儲存筆記之前等待多少時間';
	@override String get shouldAlwaysAlertForUpdates => '一旦有更新請告訴我';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesZhHantTw extends _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get system => '系統';
	@override String get light => '淺色';
	@override String get dark => '深色';
}

// Path: settings.layoutSizes
class _StringsSettingsLayoutSizesZhHantTw extends _StringsSettingsLayoutSizesEn {
	_StringsSettingsLayoutSizesZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get auto => '自動';
	@override String get phone => '手機';
	@override String get tablet => '平板';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerZhHantTw extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => '選取顏色';
}

// Path: settings.reset
class _StringsSettingsResetZhHantTw extends _StringsSettingsResetEn {
	_StringsSettingsResetZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '重設此設定?';
	@override String get button => '重設';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksZhHantTw extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get checkUsername => '請仔細檢查您的使用者名稱或電子郵件。';
	@override String get enterNcPassword => '請輸入您的 Nextcloud 密碼。';
	@override String get enterEncPassword => '請輸入您的加密密碼。';
	@override String get checkUrl => '請輸入有效連結。';
	@override String get ncLoginFailed => '登入失敗，請檢查您的詳細資訊和網路連接。';
	@override String ncUnsupportedFailure({required Object v, required Object s}) => '伺服器正在運行Nextcloud ${v}，但這個版本的Saber只支援Nextcloud ${s}。';
	@override String get encLoginFailed => '登入失敗，請檢查您的加密密碼。';
	@override String get loginSuccess => '登入成功！我們正在設定中，請稍後……';
}

// Path: login.form
class _StringsLoginFormZhHantTw extends _StringsLoginFormEn {
	_StringsLoginFormZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get useCustomServer => '我想要使用自訂 Nextcloud 伺服器';
	@override String get customServerUrl => '自訂伺服器連結';
	@override String get username => '使用者名稱或電子郵件';
	@override String get ncPassword => 'Nextcloud 密碼';
	@override String get encPassword => '加密密碼';
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: '登入即表示你同意 '),
		linkToPrivacyPolicy('隱私政策'),
		const TextSpan(text: '。'),
	]);
	@override String get login => '登入';
}

// Path: login.status
class _StringsLoginStatusZhHantTw extends _StringsLoginStatusEn {
	_StringsLoginStatusZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => '已使用 Nextcloud 登入';
	@override String get loggedOut => '已登出';
	@override String get tapToLogin => '點擊以使用 Nextcloud 登入';
}

// Path: login.faq.0
class _StringsLogin$faq$0i0$ZhHantTw extends _StringsLogin$faq$0i0$En {
	_StringsLogin$faq$0i0$ZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '什麼是 Nextcloud？';
	@override String get a => 'Nextcloud 是一個私人檔案同步伺服器。您可以使用預設的 Saber Nextcloud 伺服器或、使用第三方伺服器或自行託管您的伺服器以完全控制您的資料。';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$ZhHantTw extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$ZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '加密密碼是什麼？';
	@override String get a => '加密密碼用於在將資料傳送到伺服器之前對其進行加密。您在首次登入 Saber 時選擇它，它與您的 Nextcloud 帳戶/密碼無關。\n沒有您的加密密碼，任何人都無法訪問您在伺服器上的筆記。這也意味著，如果您忘記了加密密碼，您將無法訪問您的資料。';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$ZhHantTw extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$ZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '為什麼要使用兩個密碼？';
	@override String get a => 'Nextcloud 密碼用於訪問雲端。而加密密碼會在您的資料到達雲端之前對其進行「加密」。\n即使有人獲得了您 Nextcloud 帳號的訪問權限，您的筆記也將保持安全並使用單獨的密碼進行加密。這為您提供了第二層安全保護來保護您的資料。';
}

// Path: login.faq.3
class _StringsLogin$faq$0i3$ZhHantTw extends _StringsLogin$faq$0i3$En {
	_StringsLogin$faq$0i3$ZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '如果我使用2FA，我應該如何登入？';
	@override String get a => '您需要創建一個"應用程式密碼"，而不是一般的 Nextcloud 密碼。您可以在安全 > 裝置和會話 > 創建新應用密碼下的 Nextcloud 設定中執行此操作。您的加密密碼不受影響。';
}

// Path: login.faq.4
class _StringsLogin$faq$0i4$ZhHantTw extends _StringsLogin$faq$0i4$En {
	_StringsLogin$faq$0i4$ZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '我可以讓兩個密碼相同嗎？';
	@override String get a => '可以，但這樣做不太安全。由於您的 Nextcloud 密碼已傳送到伺服器，因此有權訪問伺服器的人將能夠解密您的筆記。只有在您信任伺服器所有者的情況下才使用相同的密碼。';
}

// Path: profile.quickLinks
class _StringsProfileQuickLinksZhHantTw extends _StringsProfileQuickLinksEn {
	_StringsProfileQuickLinksZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '快速連結';
	@override String get serverHomepage => '伺服器主頁';
	@override String get deleteAccount => '刪除帳戶';
}

// Path: profile.faq.0
class _StringsProfile$faq$0i0$ZhHantTw extends _StringsProfile$faq$0i0$En {
	_StringsProfile$faq$0i0$ZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '如果我登出了，我的筆記會不會不見？';
	@override String get a => '您的筆記將同時儲存您的裝置和伺服器上。直到您重新登入，它們才會被同步到伺服器上。在登出前，請確保同步工作已經完成，這樣您就不會丟失任何資料（在主畫面上可以看到同步進度）。';
}

// Path: profile.faq.1
class _StringsProfile$faq$0i1$ZhHantTw extends _StringsProfile$faq$0i1$En {
	_StringsProfile$faq$0i1$ZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '如何更改我的Nextcloud密碼？';
	@override String get a => '進入您的伺服器網站並登入，然後進入設定>安全>更改密碼。更改密碼後，您需要登出並重新登入到Saber。';
}

// Path: profile.faq.2
class _StringsProfile$faq$0i2$ZhHantTw extends _StringsProfile$faq$0i2$En {
	_StringsProfile$faq$0i2$ZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '如何更改我的加密密碼？';
	@override String get a => '1. 登出Saber，在登出前確保同步已經完成，這樣您就不會丟失任何資料（在主畫面上可以看到同步進度）。\n2. 進入您的伺服器網站並登入，刪除「Saber」資料夾，這將從伺服器上刪除您所有的筆記。\n3. 重新登入到Saber，您可以在登入時選擇一個新的加密密碼。\n4. 也不要忘記在您的其他裝置上登出並重新登入Saber。';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$ZhHantTw extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$ZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '如何刪除我的帳戶？';
	@override String get a => '點擊上面的「${_root.profile.quickLinks.deleteAccount}」按鈕，如果需要請登入。\n如果您使用的是官方Saber伺服器，您的帳戶將在一周的寬限期後被刪除，您可以在此期間由電子郵件聯繫我：adilhanney@disroot.org，以取消刪除。如果您使用的是第三方伺服器，則可能沒有刪除帳戶的選項，您需要查閱伺服器的隱私權政策以了解更多資訊。';
}

// Path: editor.toolbar
class _StringsEditorToolbarZhHantTw extends _StringsEditorToolbarEn {
	_StringsEditorToolbarZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => '切換顏色 (Ctrl C)';
	@override String get select => '選擇';
	@override String get toggleEraser => '切換橡皮擦 (Ctrl E)';
	@override String get photo => '照片';
	@override String get text => '文本';
	@override String get toggleFingerDrawing => '切換手寫 (Ctrl F)';
	@override String get undo => '復原';
	@override String get redo => '重做';
	@override String get export => '匯出 (Ctrl Shift S)';
	@override String get exportAs => '匯出為：';
	@override String get fullscreen => '切換到全螢幕 (F11)';
}

// Path: editor.pens
class _StringsEditorPensZhHantTw extends _StringsEditorPensEn {
	_StringsEditorPensZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => '鋼筆';
	@override String get ballpointPen => '原子筆';
	@override String get highlighter => '螢光筆';
	@override String get shapePen => '塑形筆';
	@override String get laserPointer => '雷射筆';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsZhHantTw extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get size => '粗細';
	@override String get sizeDragHint => '向左或向右拖動以更改大小';
}

// Path: editor.colors
class _StringsEditorColorsZhHantTw extends _StringsEditorColorsEn {
	_StringsEditorColorsZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => '顏色選擇器';
	@override String customBrightnessHue({required Object b, required Object h}) => '客製化 ${b} ${h}';
	@override String customHue({required Object h}) => '客製化 ${h}';
	@override String get dark => '黑暗的';
	@override String get light => '光';
	@override String get black => '黑色';
	@override String get darkGrey => '深灰色';
	@override String get grey => '灰色';
	@override String get lightGrey => '淺灰色';
	@override String get white => '白色';
	@override String get red => '紅色';
	@override String get green => '綠色';
	@override String get blue => '藍色';
	@override String get yellow => '黃色';
	@override String get purple => '紫色';
	@override String get orange => '橙色';
	@override String get pastelRed => '淡紅色';
	@override String get pastelOrange => '淡橙色';
	@override String get pastelYellow => '淡黃色';
	@override String get pastelGreen => '淡綠色';
	@override String get pastelCyan => '淡青色';
	@override String get pastelBlue => '淡藍色';
	@override String get pastelPurple => '淡紫色';
	@override String get pastelPink => '淡粉色';
	@override String get cyan => '青色';
	@override String get pink => '粉紅色的';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsZhHantTw extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '圖片選項';
	@override String get invertible => '反轉顏色';
	@override String get download => '下載';
	@override String get setAsBackground => '設為背景';
	@override String get removeAsBackground => '移除作為背景';
	@override String get delete => '刪除';
}

// Path: editor.selectionBar
class _StringsEditorSelectionBarZhHantTw extends _StringsEditorSelectionBarEn {
	_StringsEditorSelectionBarZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get delete => '刪除';
	@override String get duplicate => '複製';
}

// Path: editor.menu
class _StringsEditorMenuZhHantTw extends _StringsEditorMenuEn {
	_StringsEditorMenuZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => '清除頁面 ${page}/${totalPages}';
	@override String get clearAllPages => '清除所有頁面';
	@override String get insertPage => '插入以下頁面';
	@override String get duplicatePage => '複製頁面';
	@override String get deletePage => '刪除頁面';
	@override String get lineHeight => '行高';
	@override String get lineHeightDescription => '同時控制文字大小';
	@override String get backgroundImageFit => '適應背景圖片';
	@override String get backgroundPattern => '背景圖案';
	@override String get import => '匯入';
	@override late final _StringsEditorMenuBoxFitsZhHantTw boxFits = _StringsEditorMenuBoxFitsZhHantTw._(_root);
	@override late final _StringsEditorMenuBgPatternsZhHantTw bgPatterns = _StringsEditorMenuBgPatternsZhHantTw._(_root);
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatZhHantTw extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => '唯讀模式';
	@override String get title => '這篇筆記是使用較新版本的 Saber 編輯的';
	@override String get subtitle => '編輯此筆記可能會導致某些資訊遺失。 您想忽略它並編輯它嗎？';
	@override String get allowEditing => '允許編輯';
	@override String get cancel => '取消';
}

// Path: editor.quill
class _StringsEditorQuillZhHantTw extends _StringsEditorQuillEn {
	_StringsEditorQuillZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => '在這裡輸入一些內容...';
}

// Path: editor.hud
class _StringsEditorHudZhHantTw extends _StringsEditorHudEn {
	_StringsEditorHudZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => '解鎖縮放';
	@override String get lockZoom => '鎖定縮放';
	@override String get unlockSingleFingerPan => '啟用單指平移';
	@override String get lockSingleFingerPan => '禁用單指平移';
	@override String get unlockAxisAlignedPan => '解鎖水平或垂直平移';
	@override String get lockAxisAlignedPan => '鎖定水平或垂直平移';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _StringsSettingsPrefDescriptionsHideFingerDrawingZhHantTw extends _StringsSettingsPrefDescriptionsHideFingerDrawingEn {
	_StringsSettingsPrefDescriptionsHideFingerDrawingZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get shown => '防止意外切換';
	@override String get fixedOn => '手指繪圖固定為啟用';
	@override String get fixedOff => '手指繪圖固定為禁用';
}

// Path: editor.menu.boxFits
class _StringsEditorMenuBoxFitsZhHantTw extends _StringsEditorMenuBoxFitsEn {
	_StringsEditorMenuBoxFitsZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get fill => '拉伸';
	@override String get cover => '覆蓋';
	@override String get contain => '包含';
}

// Path: editor.menu.bgPatterns
class _StringsEditorMenuBgPatternsZhHantTw extends _StringsEditorMenuBgPatternsEn {
	_StringsEditorMenuBgPatternsZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get none => '空白';
	@override String get college => 'College-ruled';
	@override String get collegeRtl => 'College-ruled (反向)';
	@override String get lined => '橫線';
	@override String get grid => '網格';
	@override String get dots => '點';
	@override String get staffs => '五線譜';
	@override String get tablature => '指法譜';
	@override String get cornell => '康乃爾';
}
