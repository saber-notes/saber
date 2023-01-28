/// Generated file. Do not edit.
///
/// Locales: 9
/// Strings: 1019 (113 per locale)
///
/// Built on 2023-01-28 at 10:56 UTC

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
	cs(languageCode: 'cs', build: _StringsCs.build),
	de(languageCode: 'de', build: _StringsDe.build),
	es(languageCode: 'es', build: _StringsEs.build),
	it(languageCode: 'it', build: _StringsIt.build),
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
	TranslationProvider({required super.child}) : super(
		initLocale: LocaleSettings.instance.currentLocale,
		initTranslations: LocaleSettings.instance.currentTranslations,
	);

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
	static AppLocale setLocale(AppLocale locale) => instance.setLocale(locale);
	static AppLocale setLocaleRaw(String rawLocale) => instance.setLocaleRaw(rawLocale);
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
	late final _StringsAppInfoEn appInfo = _StringsAppInfoEn._(_root);
	late final _StringsUpdateEn update = _StringsUpdateEn._(_root);
	late final _StringsEditorEn editor = _StringsEditorEn._(_root);
	late final _StringsSPenWarningEn sPenWarning = _StringsSPenWarningEn._(_root);
}

// Path: home
class _StringsHomeEn {
	_StringsHomeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsHomeTabsEn tabs = _StringsHomeTabsEn._(_root);
	late final _StringsHomeTitlesEn titles = _StringsHomeTitlesEn._(_root);
	late final _StringsHomeTooltipsEn tooltips = _StringsHomeTooltipsEn._(_root);
	String get backFolder => '(Back)';
	String get welcome => 'Welcome to Saber';
	String get noFiles => 'No files found';
	String get createNewNote => 'Tap the + button to create a new note';
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
	late final _StringsSettingsAccentColorPickerEn accentColorPicker = _StringsSettingsAccentColorPickerEn._(_root);
	late final _StringsSettingsStraightenDelayEn straightenDelay = _StringsSettingsStraightenDelayEn._(_root);
	String get systemLanguage => 'System language';
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
	];
	late final _StringsLoginInsecureStorageEn insecureStorage = _StringsLoginInsecureStorageEn._(_root);
}

// Path: appInfo
class _StringsAppInfoEn {
	_StringsAppInfoEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String licenseNotice({required Object buildYear}) => 'Saber  Copyright (C) 2022-${buildYear}  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
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
	String get updateAvailableDescription => 'A new version of the app is available.';
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
	late final _StringsEditorImageOptionsEn imageOptions = _StringsEditorImageOptionsEn._(_root);
	late final _StringsEditorMenuEn menu = _StringsEditorMenuEn._(_root);
	late final _StringsEditorNewerFileFormatEn newerFileFormat = _StringsEditorNewerFileFormatEn._(_root);
	late final _StringsEditorQuillEn quill = _StringsEditorQuillEn._(_root);
	late final _StringsEditorHudEn hud = _StringsEditorHudEn._(_root);
}

// Path: sPenWarning
class _StringsSPenWarningEn {
	_StringsSPenWarningEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'S Pen bug warning';
	String get description => 'If you are using an S Pen, you may experience a bug where the app will crash when trying to erase with the S Pen button. This is a bug in the Flutter framework, and the fix will likely be released within a month. In the meantime, please use the eraser button in the toolbar.';
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
	String get browse => 'All notes';
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

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get general => 'General';
	String get layout => 'Layout';
	String get writing => 'Writing';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get locale => 'App language';
	String get appTheme => 'App theme';
	String get platform => 'Theme type';
	String get customAccentColor => 'Custom accent color';
	String get hyperlegibleFont => 'Hyperlegible font';
	String get shouldCheckForUpdates => 'Automatically check for Saber updates';
	String get editorToolbarOnBottom => 'Align the editor toolbar to the bottom';
	String get editorToolbarShowInFullscreen => 'Show the editor toolbar in fullscreen mode';
	String get editorAutoInvert => 'Invert notes in dark mode';
	String get preferGreyscale => 'Prefer greyscale colors';
	String get editorStraightenLines => 'Press and hold to straighten a line';
	String get autoClearWhiteboardOnExit => 'Clear the whiteboard after you exit the app';
	String get editorPromptRename => 'Prompt you to rename new notes';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get hyperlegibleFont => 'Atkinson Hyperlegible increases legibility for readers with low vision';
	String get editorAutoInvert => 'Smartly darkens notes in dark mode';
	String get preferGreyscale => 'For e-ink displays';
	String get autoClearWhiteboardOnExit => 'It will still be synced to your other devices';
	String get editorPromptRename => 'You can always rename notes later';
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

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get pickAColor => 'Pick a color';
}

// Path: settings.straightenDelay
class _StringsSettingsStraightenDelayEn {
	_StringsSettingsStraightenDelayEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get off => 'Off';
	String get regular => 'Regular';
	String get slow => 'Slow';
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
	String get a => 'The encryption password is used to encrypt your data before it is sent to the server. It is not stored on the server, and is only used by Saber to encrypt and decrypt your data.\n\nNo-one can access your notes on the server without your encryption password. This also means that if you forget your encryption password, you will lose access to your data.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$En._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get q => 'Why use two passwords?';
	String get a => 'The Nextcloud password is used to access the cloud. The encryption password "scrambles" your data before it ever reaches the cloud.\n\nEven if someone gains access to your Nextcloud account, your notes will remain safe and encrypted with a separate password. This provides you a second layer of security to protect your data.';
}

// Path: login.insecureStorage
class _StringsLoginInsecureStorageEn {
	_StringsLoginInsecureStorageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Security warning';
	TextSpan description({required InlineSpanBuilder sponsorLink}) => TextSpan(children: [
		const TextSpan(text: 'Keychain Sharing does not work on macOS without a paid Apple Developer account. If you want to login, you\'ll need to choose between:\n1. Using insecure storage to save your login details. This isn\'t recommended, but it\'s your choice.\n2. Logging in each time you use the app.\n\nIf you\'d like to help me join the Apple Developer Program, you can '),
		sponsorLink('become a sponsor'),
		const TextSpan(text: '!'),
	]);
	String get loginTemporarily => 'Login temporarily';
	String get useInsecureStorage => 'Use insecure storage';
}

// Path: editor.toolbar
class _StringsEditorToolbarEn {
	_StringsEditorToolbarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get toggleColors => 'Toggle colors (Ctrl C)';
	String get toggleEraser => 'Toggle eraser (Ctrl E)';
	String get photo => 'Photo';
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
}

// Path: editor.penOptions
class _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get size => 'Size';
	String get sizeDragHint => 'Drag left or right to change the size';
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
	String get delete => 'Delete';
}

// Path: editor.menu
class _StringsEditorMenuEn {
	_StringsEditorMenuEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get clearPage => 'Clear page';
	String get clearAllPages => 'Clear all pages';
	String get lineHeight => 'Line height';
	String get lineHeightDescription => 'The size of each line';
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
	@override late final _StringsAppInfoCs appInfo = _StringsAppInfoCs._(_root);
	@override late final _StringsUpdateCs update = _StringsUpdateCs._(_root);
	@override late final _StringsEditorCs editor = _StringsEditorCs._(_root);
	@override late final _StringsSPenWarningCs sPenWarning = _StringsSPenWarningCs._(_root);
}

// Path: home
class _StringsHomeCs extends _StringsHomeEn {
	_StringsHomeCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsCs tabs = _StringsHomeTabsCs._(_root);
	@override late final _StringsHomeTitlesCs titles = _StringsHomeTitlesCs._(_root);
	@override late final _StringsHomeTooltipsCs tooltips = _StringsHomeTooltipsCs._(_root);
	@override String get backFolder => '(Zpět)';
	@override String get welcome => 'Vítejte v aplikaci Saber';
	@override String get noFiles => 'Žádné poznámky nebyly nalezeny';
	@override String get createNewNote => 'Pro přidání nové poznámky klepněte na tlačítko +';
}

// Path: settings
class _StringsSettingsCs extends _StringsSettingsEn {
	_StringsSettingsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefLabelsCs prefLabels = _StringsSettingsPrefLabelsCs._(_root);
	@override late final _StringsSettingsPrefDescriptionsCs prefDescriptions = _StringsSettingsPrefDescriptionsCs._(_root);
	@override late final _StringsSettingsThemeModesCs themeModes = _StringsSettingsThemeModesCs._(_root);
	@override late final _StringsSettingsAccentColorPickerCs accentColorPicker = _StringsSettingsAccentColorPickerCs._(_root);
	@override late final _StringsSettingsStraightenDelayCs straightenDelay = _StringsSettingsStraightenDelayCs._(_root);
	@override String get systemLanguage => 'Systémový jazyk';
	@override late final _StringsSettingsPrefCategoriesCs prefCategories = _StringsSettingsPrefCategoriesCs._(_root);
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
	];
	@override late final _StringsLoginInsecureStorageCs insecureStorage = _StringsLoginInsecureStorageCs._(_root);
}

// Path: appInfo
class _StringsAppInfoCs extends _StringsAppInfoEn {
	_StringsAppInfoCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright (C) 2022-${buildYear}  Adil Hanney\nTento program je poskytován bez jakékoliv záruky. Jedná se o software poskytovaný zdarma, který je možné šířit při splnění daných podmínek.';
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
	@override String get updateAvailableDescription => 'Je k dispozici nová verze aplikace.';
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
	@override late final _StringsEditorImageOptionsCs imageOptions = _StringsEditorImageOptionsCs._(_root);
	@override late final _StringsEditorMenuCs menu = _StringsEditorMenuCs._(_root);
	@override late final _StringsEditorNewerFileFormatCs newerFileFormat = _StringsEditorNewerFileFormatCs._(_root);
	@override late final _StringsEditorQuillCs quill = _StringsEditorQuillCs._(_root);
	@override late final _StringsEditorHudCs hud = _StringsEditorHudCs._(_root);
}

// Path: sPenWarning
class _StringsSPenWarningCs extends _StringsSPenWarningEn {
	_StringsSPenWarningCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Varování ohledně chyby při používání S Pen';
	@override String get description => 'Při používání S Pen můžete narazit na chybu způsobující pád aplikace, která se projeví po pokusu mazat podržením tlačítka na S Pen. Jedná se o chybu ve frameworku Flutter, jejíž oprava bude vydána zhruba do měsíce. Prozatím prosím používejte tlačítko pro smazání umístěné v nástrojové liště.';
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
	@override String get browse => 'Všechny poznámky';
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

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsCs extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get appTheme => 'Barva motivu';
	@override String get customAccentColor => 'Vlastní barevný odstín';
	@override String get hyperlegibleFont => 'Lépe čitelný font';
	@override String get shouldCheckForUpdates => 'Automaticky kontrolovat dostupnost aktualizací aplikace Saber';
	@override String get editorToolbarOnBottom => 'Umístit nabídku editoru do spodní části';
	@override String get editorToolbarShowInFullscreen => 'Zobrazovat nabídku editoru v režimu celé obrazovky';
	@override String get editorAutoInvert => 'V tmavém režimu invertovat poznámky';
	@override String get preferGreyscale => 'Preferovat černobílé barvy';
	@override String get editorStraightenLines => 'Pro kreslení rovné čáry stisknout a podržet';
	@override String get autoClearWhiteboardOnExit => 'Smazat tabuli po opuštění aplikace';
	@override String get editorPromptRename => 'Vybízet k přejmenování nových poznámek';
	@override String get locale => 'Jazyk aplikace';
	@override String get platform => 'Motiv';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsCs extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Font Atkinson Hyperlegible zvyšuje čitelnost pro čtenáře se slabým zrakem';
	@override String get editorAutoInvert => 'Inteligentně ztmaví poznámky ve tmavém motivu';
	@override String get preferGreyscale => 'Pro elektronické čtečky knih s e-ink displejem';
	@override String get autoClearWhiteboardOnExit => 'Bude synchronizováno do dalších zařízení';
	@override String get editorPromptRename => 'Poznámky můžete vždy přejmenovat i později';
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

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerCs extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Vyberte barvu';
}

// Path: settings.straightenDelay
class _StringsSettingsStraightenDelayCs extends _StringsSettingsStraightenDelayEn {
	_StringsSettingsStraightenDelayCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get off => 'Vypnuto';
	@override String get regular => 'Standardně';
	@override String get slow => 'Dlouze';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesCs extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get general => 'Obecné';
	@override String get layout => 'Uspořádání uživatelského rozhraní';
	@override String get writing => 'Psaní';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksCs extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get checkUsername => 'Zkontrolujte prosím své uživatelské jméno a heslo.';
	@override String get enterNcPassword => 'Zadejte prosím své heslo k NextCloud účtu.';
	@override String get enterEncPassword => 'Zadejte prosím své heslo pro šifrování.';
	@override String get checkUrl => 'Zadejte prosím správnou URL adresu.';
	@override String get ncLoginFailed => 'Přihlašování selhalo, zkontrolujte prosím zadané údaje a připojení k internetu.';
	@override String get encLoginFailed => 'Přihlašování selhalo, zkontrolujte prosím své heslo pro šifrování.';
	@override String get loginSuccess => 'Přihlášení bylo úspěšné! Vyčkejte prosím, nastavíme vše potřebné...';
}

// Path: login.form
class _StringsLoginFormCs extends _StringsLoginFormEn {
	_StringsLoginFormCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get useCustomServer => 'Chci využít vlastní NextCloud server';
	@override String get customServerUrl => 'URL adresa vlastního NextCloud serveru';
	@override String get username => 'Přihlašovací jméno nebo e-mail';
	@override String get ncPassword => 'Heslo k NextCloud účtu';
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
	@override String get tapToLogin => 'Klepněte pro přihlášení pomocí NextCloud účtu';
}

// Path: login.faq.0
class _StringsLogin$faq$0i0$Cs extends _StringsLogin$faq$0i0$En {
	_StringsLogin$faq$0i0$Cs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Co je to NextCloud?';
	@override String get a => 'Nextcloud je mimo jiné osobní server pro synchronizaci souborů. Můžete používat výchozí NextCloud server poskytovaný aplikací Saber, použít server hostovaný třetí stranou nebo vlastní server pro plnou kontrolu nad svými daty.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$Cs extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$Cs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'K čemu je heslo pro šifrování?';
	@override String get a => 'Heslo pro šifrování je použito k zašifrování vašich dat před jejich odesláním na server. Není uloženo na serveru a je použito pouze aplikací Saber pro zašifrování a dešifrování dat.\n\nBez jeho znalosti nemůže nikdo přistoupit k vašim poznámkám uloženým na serveru. To také znamená, že pokud ho zapomenete, ztratíte přístup ke svým datům.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Cs extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Cs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Proč používat dvě hesla?';
	@override String get a => 'Heslo k NextCloud účtu se používá k přístupu do cloudu. Heslo pro šifrování "utají" vaše data ještě před tím, než se na cloud dostanou.\n\nI když by někdo získat přístup k vašemu NextCloud účtu, vaše poznámky zůstanou v bezpečí zašifrované vlastním heslem. To vám poskytuje druhou vrstvu ochrany vašich dat.';
}

// Path: login.insecureStorage
class _StringsLoginInsecureStorageCs extends _StringsLoginInsecureStorageEn {
	_StringsLoginInsecureStorageCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bezpečnostní upozornění';
	@override TextSpan description({required InlineSpanBuilder sponsorLink}) => TextSpan(children: [
		const TextSpan(text: 'Sdílení klíčenky na Macu nefunguje bez členství v placeném programu pro vývojáře od společnosti Apple. Pokud se chcete přihlásit, můžete využít jednu z následujících možností:\n1. Použít pro uložení přihlašovacích údajů nezabezpečené úložiště. Tuto možnost nedoporučuji, ale je to vaše volba.\n2. Přihlásit se pokaždé, když chcete aplikaci použít.\n\nPokud mi chceme pomoct s připojením se do programu pro vývojáře, můžete se '),
		sponsorLink('stát mým sponzorem'),
		const TextSpan(text: '!'),
	]);
	@override String get loginTemporarily => 'Přihlásit pouze dočasně';
	@override String get useInsecureStorage => 'Použít nezabezpečené úložiště';
}

// Path: editor.toolbar
class _StringsEditorToolbarCs extends _StringsEditorToolbarEn {
	_StringsEditorToolbarCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Přepnout barvy (Ctrl C)';
	@override String get toggleEraser => 'Přepnout gumu (Ctrl E)';
	@override String get photo => 'Obrázek';
	@override String get text => 'Text';
	@override String get toggleFingerDrawing => 'Přepnout kreslení prstem (Ctrl F)';
	@override String get undo => 'Zpět';
	@override String get redo => 'Obnovit';
	@override String get export => 'Exportovat (Ctrl Shift S)';
	@override String get exportAs => 'Exportovat jako:';
	@override String get fullscreen => 'Přepnout režim celé obrazovky (F11)';
}

// Path: editor.pens
class _StringsEditorPensCs extends _StringsEditorPensEn {
	_StringsEditorPensCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Plnící pero';
	@override String get ballpointPen => 'Kuličkové pero';
	@override String get highlighter => 'Zvýrazňovač';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsCs extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get size => 'Velikost';
	@override String get sizeDragHint => 'Posunem vlevo nebo vpravo změníte velikost';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsCs extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Možnosti obrázku';
	@override String get invertible => 'Invertování barev podle motivu';
	@override String get download => 'Stáhnout';
	@override String get delete => 'Odstranit';
}

// Path: editor.menu
class _StringsEditorMenuCs extends _StringsEditorMenuEn {
	_StringsEditorMenuCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get clearPage => 'Smazat obsah stránky';
	@override String get clearAllPages => 'Smazat všechny stránky';
	@override String get lineHeight => 'Výška řádku';
	@override String get lineHeightDescription => 'Velikost každého řádku';
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
	@override late final _StringsAppInfoDe appInfo = _StringsAppInfoDe._(_root);
	@override late final _StringsUpdateDe update = _StringsUpdateDe._(_root);
	@override late final _StringsEditorDe editor = _StringsEditorDe._(_root);
	@override late final _StringsSPenWarningDe sPenWarning = _StringsSPenWarningDe._(_root);
}

// Path: home
class _StringsHomeDe extends _StringsHomeEn {
	_StringsHomeDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsDe tabs = _StringsHomeTabsDe._(_root);
	@override late final _StringsHomeTitlesDe titles = _StringsHomeTitlesDe._(_root);
	@override late final _StringsHomeTooltipsDe tooltips = _StringsHomeTooltipsDe._(_root);
	@override String get backFolder => '(Zurück)';
	@override String get welcome => 'Willkommen bei Saber';
	@override String get noFiles => 'Keine Dateien gefunden';
	@override String get createNewNote => 'Drücke die + Schaltfläche, um eine neue Notiz zu erstellen';
}

// Path: settings
class _StringsSettingsDe extends _StringsSettingsEn {
	_StringsSettingsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefLabelsDe prefLabels = _StringsSettingsPrefLabelsDe._(_root);
	@override late final _StringsSettingsThemeModesDe themeModes = _StringsSettingsThemeModesDe._(_root);
	@override late final _StringsSettingsAccentColorPickerDe accentColorPicker = _StringsSettingsAccentColorPickerDe._(_root);
	@override late final _StringsSettingsPrefDescriptionsDe prefDescriptions = _StringsSettingsPrefDescriptionsDe._(_root);
	@override late final _StringsSettingsStraightenDelayDe straightenDelay = _StringsSettingsStraightenDelayDe._(_root);
	@override String get systemLanguage => 'Systemsprache';
	@override late final _StringsSettingsPrefCategoriesDe prefCategories = _StringsSettingsPrefCategoriesDe._(_root);
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
	];
	@override late final _StringsLoginInsecureStorageDe insecureStorage = _StringsLoginInsecureStorageDe._(_root);
}

// Path: appInfo
class _StringsAppInfoDe extends _StringsAppInfoEn {
	_StringsAppInfoDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright (C) 2022-${buildYear}  Adil Hanney\nDieses Programm kommt ohne jegliche Gewährleistung. Dies ist freie Software und du bist herzlich eingeladen, diese unter bestimmten Bedingungen weiterzuverteilen.';
	@override String get debug => 'DEBUG';
	@override String get licenseButton => 'Hier tippen, um weitere Lizenzinformationen anzuzeigen';
	@override String get privacyPolicyButton => 'Hier tippen, um die Datenschutzrichtlinie anzuzeigen';
	@override String get sponsorButton => 'Hier tippen, um mich zu unterstützen oder mehr Speicherplatz zu kaufen';
	@override String get dirty => 'TESTVERSION';
}

// Path: update
class _StringsUpdateDe extends _StringsUpdateEn {
	_StringsUpdateDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Aktualisierung verfügbar';
	@override String get updateAvailableDescription => 'Eine neue Version der Anwendung ist verfügbar.';
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
	@override late final _StringsEditorImageOptionsDe imageOptions = _StringsEditorImageOptionsDe._(_root);
	@override late final _StringsEditorMenuDe menu = _StringsEditorMenuDe._(_root);
	@override late final _StringsEditorNewerFileFormatDe newerFileFormat = _StringsEditorNewerFileFormatDe._(_root);
	@override late final _StringsEditorQuillDe quill = _StringsEditorQuillDe._(_root);
	@override late final _StringsEditorHudDe hud = _StringsEditorHudDe._(_root);
}

// Path: sPenWarning
class _StringsSPenWarningDe extends _StringsSPenWarningEn {
	_StringsSPenWarningDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'S Pen Problemwarnung';
	@override String get description => 'Wenn du einen S Pen verwendest, kann es sein, dass deine App abstürzt, wenn du versuchst, mit dem Radiergummi-Knopf zu radieren. Das ist ein Problem im Flutter Framework und wird vermutlich in einem Monat behoben sein. Bis dahin kannst du den Radiergummi-Knopf in der Werkzeugleiste nutzen.';
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
	@override String get browse => 'Alle Notizen';
	@override String get whiteboard => 'Whiteboard';
	@override String get settings => 'Einstellungen';
}

// Path: home.tooltips
class _StringsHomeTooltipsDe extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Notiz erstellen';
	@override String get showUpdateDialog => 'Aktualisierungsdialog anzeigen';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsDe extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get appTheme => 'Anwendungsthema';
	@override String get customAccentColor => 'Benutzerdefinierte Akzentfarbe';
	@override String get shouldCheckForUpdates => 'Suche automatisch nach Saber-Aktualisierungen';
	@override String get editorToolbarOnBottom => 'Werkzeugleiste am unteren Rand ausrichten';
	@override String get editorAutoInvert => 'Notizen im Dunkelmodus invertieren';
	@override String get preferGreyscale => 'Graustufen bevorzugen';
	@override String get hyperlegibleFont => 'Hyperlesbare Schrift';
	@override String get editorStraightenLines => 'Drücke und halte für eine gerade Linie';
	@override String get autoClearWhiteboardOnExit => 'Lösche das Whiteboard nach Verlassen der Andwendung';
	@override String get editorPromptRename => 'Beim Erstellen von Notizen einen Namen erfragen';
	@override String get locale => 'Sprache';
	@override String get editorToolbarShowInFullscreen => 'Zeige die Werkzeugleiste im Vollbild';
	@override String get platform => 'Oberfläche';
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

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerDe extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Wähle eine Farbe';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsDe extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible verbessert die Lesbarkeit für Menschen mit eingeschränkter Sicht';
	@override String get editorAutoInvert => 'Verdunkelt intelligent die Notizen im Dunkelmodus';
	@override String get preferGreyscale => 'Für E-Ink-Bildschirme';
	@override String get autoClearWhiteboardOnExit => 'Es wird dennoch mit deinen anderen Geräten synchronisiert';
	@override String get editorPromptRename => 'Notizen können immer auch später noch umbenannt werden';
}

// Path: settings.straightenDelay
class _StringsSettingsStraightenDelayDe extends _StringsSettingsStraightenDelayEn {
	_StringsSettingsStraightenDelayDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get off => 'Aus';
	@override String get regular => 'Normal';
	@override String get slow => 'Langsam';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesDe extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get general => 'Allgemein';
	@override String get layout => 'Aussehen';
	@override String get writing => 'Eingabe';
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
	@override String get loginSuccess => 'Anmeldung erfolgreich! Bitte warte, während wir alles einrichten...';
	@override String get encLoginFailed => 'Anmeldung fehlgeschlagen, bitte überprüfe dein Verschlüsselungspasswort.';
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
	@override String get a => 'Nextcloud ist unter andrem ein privater Dateisynchronisationsserver. Du kannst den Standard-Saber-Nextcloud-Server, einen Drittanbieter-, oder einen selbst-gehosteten Server verwenden, um volle Kontrolle über deine Daten zu behalten.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$De extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$De._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Was ist das Verchlüsselungspasswort?';
	@override String get a => 'Das Verschlüsselungspassort wird verwendet, um deine Daten zu verschlüsseln, bevor diese an den Server gesendet werden. Es wird nicht auf dem Server gespeichert und nur von Saber verwendet, um deine Daten zu ver- und entschlüsseln.\n\nNiemand kann ohne dieses Passwort auf deine Notizen auf dem Server zugreifen. Das bedeutet allerdings auch, dass du, wenn du dein Verschlüsselungspasswort vergisst, den Zugriff auf deine Daten verlierst.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$De extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$De._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Wieso zwei Passwörter?';
	@override String get a => 'Das Nextcloud-Passwort wird verwendet, um auf die Cloud zuzugreifen. Das Verschlüsselungspasswort "verwürfelt" deine Daten, bevor diese die Cloud erreichen.\n\nSelbst wenn jemand Zugriff zu deinem Nextcloud-Konto erlangt, bleiben deine Notizen sicher und verschlüsselt mit einem seperaten Passwort. Dies stellt eine zweite Sicherheitsebene zum Schutz deiner Daten dar.';
}

// Path: login.insecureStorage
class _StringsLoginInsecureStorageDe extends _StringsLoginInsecureStorageEn {
	_StringsLoginInsecureStorageDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sicherheitswarnung';
	@override TextSpan description({required InlineSpanBuilder sponsorLink}) => TextSpan(children: [
		const TextSpan(text: 'Das Teilen von Schlüsseln geht auf macOS nur mit einem bezahlten Apple Entwickleraccount. Wenn du dich anmelden willst, hast du zwei Möglichkeiten:\n1. Unsicheren Speicher verwenden, um deine Anmeldedaten zu speichern. Das ist zwar nicht empfohlen, aber deine Wahl.\n2. Dich jedes Mal erneut anmelden, wenn du die App nutzt.\n\nWenn du mir helfen willst, dem Apple Entwicklerprogramm beizutreten, kannst du '),
		sponsorLink('mich unterstützen'),
		const TextSpan(text: '!'),
	]);
	@override String get loginTemporarily => 'Vorübergehend anmelden';
	@override String get useInsecureStorage => 'Unsicheren Speicher verwenden';
}

// Path: editor.toolbar
class _StringsEditorToolbarDe extends _StringsEditorToolbarEn {
	_StringsEditorToolbarDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Farben umschalten (Strg + C)';
	@override String get toggleEraser => 'Radierer umschalten (Strg + E)';
	@override String get photo => 'Foto';
	@override String get toggleFingerDrawing => 'Fingerzeichnen umschalten (Strg + F)';
	@override String get undo => 'Rückgängig';
	@override String get redo => 'Wiederholen';
	@override String get export => 'Exportieren (Strg + Shift + S)';
	@override String get exportAs => 'Exportieren als:';
	@override String get text => 'Text';
	@override String get fullscreen => 'Vollbild umschalten (F11)';
}

// Path: editor.pens
class _StringsEditorPensDe extends _StringsEditorPensEn {
	_StringsEditorPensDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Füllfederhalter';
	@override String get highlighter => 'Textmarker';
	@override String get ballpointPen => 'Kugelschreiber';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsDe extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get size => 'Dicke';
	@override String get sizeDragHint => 'Nach links oder rechts ziehen, um die Größe zu ändern';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsDe extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bildoptionen';
	@override String get invertible => 'Invertierbar';
	@override String get delete => 'Entfernen';
	@override String get download => 'Herunterladen';
}

// Path: editor.menu
class _StringsEditorMenuDe extends _StringsEditorMenuEn {
	_StringsEditorMenuDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get clearPage => 'Seite löschen';
	@override String get clearAllPages => 'Alle Seiten löschen';
	@override String get lineHeight => 'Zeilenhöhe';
	@override String get lineHeightDescription => 'Die Höhe jeder Zeile';
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatDe extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Diese Notiz wurde mit einer neueren Version von Saber bearbeitet';
	@override String get cancel => 'Abbruch';
	@override String get readOnlyMode => 'Schreibgeschützter Modus';
	@override String get subtitle => 'Durch das Bearbeiten dieser Notiz können Daten verloren gehen. Möchtest du sie trotzdem bearbeiten?';
	@override String get allowEditing => 'Schreibschutz aufheben';
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
	@override late final _StringsAppInfoEs appInfo = _StringsAppInfoEs._(_root);
	@override late final _StringsUpdateEs update = _StringsUpdateEs._(_root);
	@override late final _StringsEditorEs editor = _StringsEditorEs._(_root);
	@override late final _StringsSPenWarningEs sPenWarning = _StringsSPenWarningEs._(_root);
}

// Path: home
class _StringsHomeEs extends _StringsHomeEn {
	_StringsHomeEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsEs tabs = _StringsHomeTabsEs._(_root);
	@override late final _StringsHomeTitlesEs titles = _StringsHomeTitlesEs._(_root);
	@override late final _StringsHomeTooltipsEs tooltips = _StringsHomeTooltipsEs._(_root);
	@override String get backFolder => '(Volver)';
	@override String get welcome => 'Te damos la bienvenida a Saber';
	@override String get noFiles => 'No se encontraron archivos';
	@override String get createNewNote => 'Presiona el botón + para crear una nueva nota';
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
	@override late final _StringsSettingsAccentColorPickerEs accentColorPicker = _StringsSettingsAccentColorPickerEs._(_root);
	@override late final _StringsSettingsStraightenDelayEs straightenDelay = _StringsSettingsStraightenDelayEs._(_root);
	@override String get systemLanguage => 'Idioma del sistema';
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
	];
}

// Path: appInfo
class _StringsAppInfoEs extends _StringsAppInfoEn {
	_StringsAppInfoEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright (C) 2022-${buildYear}  Adil Hanney\nEste programa no tiene ninguna garantía. Es un software libre, y se puede redistribuir bajo ciertas condiciones.';
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
	@override String get updateAvailableDescription => 'Hay una nueva versión de la aplicación disponible.';
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
	@override late final _StringsEditorImageOptionsEs imageOptions = _StringsEditorImageOptionsEs._(_root);
	@override late final _StringsEditorMenuEs menu = _StringsEditorMenuEs._(_root);
	@override late final _StringsEditorNewerFileFormatEs newerFileFormat = _StringsEditorNewerFileFormatEs._(_root);
	@override late final _StringsEditorQuillEs quill = _StringsEditorQuillEs._(_root);
	@override late final _StringsEditorHudEs hud = _StringsEditorHudEs._(_root);
}

// Path: sPenWarning
class _StringsSPenWarningEs extends _StringsSPenWarningEn {
	_StringsSPenWarningEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aviso de error del S Pen';
	@override String get description => 'Si utilizas un S Pen, es posible que la aplicación se bloquee al intentar borrar con el botón del S Pen. Se trata de un error de Flutter, y la solución se publicará probablemente dentro de un mes. Mientras tanto, utiliza el botón de borrar de la barra de herramientas.';
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
	@override String get browse => 'Todas las notas';
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

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesEs extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get general => 'General';
	@override String get layout => 'Diseño';
	@override String get writing => 'Escritura';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsEs extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Idioma de la aplicación';
	@override String get appTheme => 'Tema de la aplicación';
	@override String get platform => 'Tipo de tema';
	@override String get customAccentColor => 'Color de acento personalizado';
	@override String get hyperlegibleFont => 'Fuente hiperlegible';
	@override String get shouldCheckForUpdates => 'Buscar actualizaciones de Saber automáticamente';
	@override String get editorToolbarOnBottom => 'Alinear la barra de herramientas del editor en la parte inferior';
	@override String get editorToolbarShowInFullscreen => 'Mostrar la barra de herramientas del editor en el modo de pantalla completa';
	@override String get editorAutoInvert => 'Invertir notas en el modo oscuro';
	@override String get preferGreyscale => 'Preferir colores en escala de grises';
	@override String get editorStraightenLines => 'Mantén presionado para enderezar una línea';
	@override String get autoClearWhiteboardOnExit => 'Borrar la pizarra después de salir de la aplicación';
	@override String get editorPromptRename => 'Solicitarte cambiar el nombre de nuevas notas';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsEs extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible aumenta la legibilidad para lectores con poca visión';
	@override String get editorAutoInvert => 'Oscurece inteligentemente las notas en el modo oscuro';
	@override String get preferGreyscale => 'Para pantallas con tinta electrónica';
	@override String get autoClearWhiteboardOnExit => 'Aún se sincronizará con tus otros dispositivos';
	@override String get editorPromptRename => 'Siempre puedes cambiar el nombre de las notas más tarde';
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

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerEs extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Elegir un color';
}

// Path: settings.straightenDelay
class _StringsSettingsStraightenDelayEs extends _StringsSettingsStraightenDelayEn {
	_StringsSettingsStraightenDelayEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get off => 'Apagado';
	@override String get regular => 'Regular';
	@override String get slow => 'Lento';
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
	@override String get loginSuccess => '¡Inicio de sesión exitoso! Por favor espera mientras configuramos todo...';
	@override String get encLoginFailed => 'No se pudo iniciar sesión, por favor verifica tu contraseña de cifrado.';
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
	@override String get a => 'Nextcloud es un servidor privado de sincronización de archivos, entre otras cosas. Puede usar el servidor Sabre Nextcloud predeterminado, usar un servidor de terceros o alojar el tuyo propio para tener un control total de tus datos.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$Es extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$Es._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Qué es la contraseña de cifrado?';
	@override String get a => 'La contraseña de cifrado se utiliza para cifrar tus datos antes de enviarlos al servidor. No se almacenan en el servidor y solo Saber lo utiliza para cifrar y descifrar sus datos.\n\nNadie puede acceder a sus notas en el servidor sin tu contraseña de cifrado. Esto también significa que si olvidas tu contraseña de cifrado, perderás el acceso a tus datos.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Es extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Es._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Por qué usar dos contraseñas?';
	@override String get a => 'La contraseña de Nextcloud se utiliza para acceder a la nube. La contraseña de encriptación "codifica" tus datos antes de que lleguen a la nube.\n\nIncluso si alguien obtiene acceso a tu cuenta de Nextcloud, tus notas permanecerán seguras y encriptadas con una contraseña separada. Esto te proporciona una segunda capa de seguridad para proteger tus datos.';
}

// Path: editor.toolbar
class _StringsEditorToolbarEs extends _StringsEditorToolbarEn {
	_StringsEditorToolbarEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Cambiar colores (Ctrl C)';
	@override String get toggleEraser => 'Borrador (Ctrl E)';
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
}

// Path: editor.penOptions
class _StringsEditorPenOptionsEs extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get size => 'Tamaño';
	@override String get sizeDragHint => 'Arrastra hacia la izquierda o hacia la derecha para cambiar el tamaño';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsEs extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opciones de imagen';
	@override String get invertible => 'Invertible';
	@override String get download => 'Descargar';
	@override String get delete => 'Eliminar';
}

// Path: editor.menu
class _StringsEditorMenuEs extends _StringsEditorMenuEn {
	_StringsEditorMenuEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get clearPage => 'Borrar página';
	@override String get clearAllPages => 'Borrar todas las páginas';
	@override String get lineHeight => 'Altura de la línea';
	@override String get lineHeightDescription => 'El tamaño de cada línea';
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
	@override late final _StringsAppInfoIt appInfo = _StringsAppInfoIt._(_root);
	@override late final _StringsUpdateIt update = _StringsUpdateIt._(_root);
	@override late final _StringsEditorIt editor = _StringsEditorIt._(_root);
	@override late final _StringsSPenWarningIt sPenWarning = _StringsSPenWarningIt._(_root);
}

// Path: home
class _StringsHomeIt extends _StringsHomeEn {
	_StringsHomeIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsIt tabs = _StringsHomeTabsIt._(_root);
	@override late final _StringsHomeTitlesIt titles = _StringsHomeTitlesIt._(_root);
	@override late final _StringsHomeTooltipsIt tooltips = _StringsHomeTooltipsIt._(_root);
	@override String get backFolder => '(Indietro)';
	@override String get welcome => 'Benvenuto su Saber';
	@override String get noFiles => 'Nessun file trovato';
	@override String get createNewNote => 'Tocca il pulsante + per creare una nuova nota';
}

// Path: settings
class _StringsSettingsIt extends _StringsSettingsEn {
	_StringsSettingsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefLabelsIt prefLabels = _StringsSettingsPrefLabelsIt._(_root);
	@override late final _StringsSettingsThemeModesIt themeModes = _StringsSettingsThemeModesIt._(_root);
	@override late final _StringsSettingsAccentColorPickerIt accentColorPicker = _StringsSettingsAccentColorPickerIt._(_root);
	@override late final _StringsSettingsPrefDescriptionsIt prefDescriptions = _StringsSettingsPrefDescriptionsIt._(_root);
	@override late final _StringsSettingsStraightenDelayIt straightenDelay = _StringsSettingsStraightenDelayIt._(_root);
	@override String get systemLanguage => 'Lingua del sistema';
	@override late final _StringsSettingsPrefCategoriesIt prefCategories = _StringsSettingsPrefCategoriesIt._(_root);
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
	];
	@override late final _StringsLoginInsecureStorageIt insecureStorage = _StringsLoginInsecureStorageIt._(_root);
}

// Path: appInfo
class _StringsAppInfoIt extends _StringsAppInfoEn {
	_StringsAppInfoIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Sabre Copyright (C) 2022-${buildYear} Adil Hanney\nQuesto programma non ha alcuna garanzia. Questo è un software libero e sei libero di ridistribuirlo a determinate condizioni.';
	@override String get debug => 'DEBUG';
	@override String get licenseButton => 'Tocca qui per visualizzare ulteriori informazioni sulla licenza';
	@override String get privacyPolicyButton => 'Tocca qui per visualizzare l\'informativa sulla privacy';
	@override String get sponsorButton => 'Tocca qui per sponsorizzarmi o acquistare altro spazio di archiviazione';
	@override String get dirty => 'GROSSOLANA';
}

// Path: update
class _StringsUpdateIt extends _StringsUpdateEn {
	_StringsUpdateIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Aggiornamento disponibile';
	@override String get updateAvailableDescription => 'È disponibile una nuova versione dell\'app.';
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
	@override late final _StringsEditorImageOptionsIt imageOptions = _StringsEditorImageOptionsIt._(_root);
	@override late final _StringsEditorMenuIt menu = _StringsEditorMenuIt._(_root);
	@override late final _StringsEditorNewerFileFormatIt newerFileFormat = _StringsEditorNewerFileFormatIt._(_root);
	@override late final _StringsEditorQuillIt quill = _StringsEditorQuillIt._(_root);
	@override late final _StringsEditorHudIt hud = _StringsEditorHudIt._(_root);
}

// Path: sPenWarning
class _StringsSPenWarningIt extends _StringsSPenWarningEn {
	_StringsSPenWarningIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Avviso di bug S Pen';
	@override String get description => 'Se utilizzi una S Pen, potresti riscontrare un bug in cui l\'app si arresta in modo anomalo quando tenti di cancellare con il pulsante S Pen. Questo è un bug nel framework Flutter e la correzione verrà probabilmente rilasciata entro un mese. Nel frattempo, utilizza il pulsante della gomma nella barra degli strumenti.';
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
	@override String get browse => 'Tutte le note';
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

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsIt extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get appTheme => 'Tema dell\'app';
	@override String get customAccentColor => 'Colore personalizzato';
	@override String get shouldCheckForUpdates => 'Controlla automaticamente gli aggiornamenti di Saber';
	@override String get editorToolbarOnBottom => 'Allinea la barra degli strumenti dell\'editor in basso';
	@override String get editorAutoInvert => 'Inverti le note in modalità scura';
	@override String get preferGreyscale => 'Preferisci i colori in scala di grigi';
	@override String get hyperlegibleFont => 'Carattere iperleggibile';
	@override String get editorStraightenLines => 'Tenere premuto per raddrizzare una linea';
	@override String get autoClearWhiteboardOnExit => 'Svuota la lavagna dopo essere uscito dall\'app';
	@override String get editorPromptRename => 'Richiede di rinominare nuove note';
	@override String get editorToolbarShowInFullscreen => 'Mostra la barra degli strumenti dell\'editor in modalità a schermo intero';
	@override String get locale => 'Lingua app';
	@override String get platform => 'Tipo di tema';
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

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerIt extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Scegli un colore';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsIt extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible aumenta la leggibilità per i lettori ipovedenti';
	@override String get editorAutoInvert => 'Scurisce in modo intelligente le note in modalità scura';
	@override String get preferGreyscale => 'Per display e-ink';
	@override String get autoClearWhiteboardOnExit => 'Sarà comunque sincronizzato con gli altri tuoi dispositivi';
	@override String get editorPromptRename => 'Puoi sempre rinominare le note in un secondo momento';
}

// Path: settings.straightenDelay
class _StringsSettingsStraightenDelayIt extends _StringsSettingsStraightenDelayEn {
	_StringsSettingsStraightenDelayIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get off => 'Off';
	@override String get regular => 'Regolare';
	@override String get slow => 'Lento';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesIt extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get general => 'Generale';
	@override String get layout => 'Layout';
	@override String get writing => 'Scrittura';
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
	@override String get loginSuccess => 'Accesso riuscito! Si prega di attendere mentre configuriamo...';
	@override String get encLoginFailed => 'Accesso non riuscito, controllare la password di crittografia.';
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
	@override String get q => 'Cos\'è Nextcloud?';
	@override String get a => 'Nextcloud è, tra le altre cose, un server di sincronizzazione file privato. Puoi utilizzare il server Saber Nextcloud predefinito, utilizzare un server di terze parti o ospitare autonomamente il tuo per il pieno controllo dei tuoi dati.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$It extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$It._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Cos\'è la password di crittografia?';
	@override String get a => 'La password di crittografia viene utilizzata per crittografare i dati prima che vengano inviati al server. Non è archiviato sul server e viene utilizzato solo da Sabre per crittografare e decrittografare i tuoi dati.\n\nNessuno può accedere alle tue note sul server senza la tua password di crittografia. Ciò significa anche che se dimentichi la password di crittografia, perderai l\'accesso ai tuoi dati.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$It extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$It._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Perché usare due password?';
	@override String get a => 'La password Nextcloud viene utilizzata per accedere al cloud. La password di crittografia "codifica" i tuoi dati prima che raggiungano il cloud.\n\nAnche se qualcuno riesce ad accedere al tuo account Nextcloud, le tue note rimarranno al sicuro e crittografate con una password separata. Questo ti fornisce un secondo livello di sicurezza per proteggere i tuoi dati.';
}

// Path: login.insecureStorage
class _StringsLoginInsecureStorageIt extends _StringsLoginInsecureStorageEn {
	_StringsLoginInsecureStorageIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Avviso di sicurezza';
	@override TextSpan description({required InlineSpanBuilder sponsorLink}) => TextSpan(children: [
		const TextSpan(text: 'La condivisione del portachiavi non funziona su macOS senza un account sviluppatore Apple a pagamento. Se vuoi accedere, dovrai scegliere tra:\n1. Utilizzo di un archivio non sicuro per salvare i dati di accesso. Questo non è raccomandato, ma è una tua scelta.\n2. Accedi ogni volta che utilizzi l\'app.\n\nSe desideri aiutarmi a partecipare all\'Apple Developer Program, puoi '),
		sponsorLink('diventa uno sponsor'),
		const TextSpan(text: '!'),
	]);
	@override String get loginTemporarily => 'Accesso temporaneo';
	@override String get useInsecureStorage => 'Utilizzare archiviazione non sicura';
}

// Path: editor.toolbar
class _StringsEditorToolbarIt extends _StringsEditorToolbarEn {
	_StringsEditorToolbarIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Attiva/disattiva i colori (Ctrl C)';
	@override String get toggleEraser => 'Attiva/disattiva gomma (Ctrl E)';
	@override String get photo => 'Foto';
	@override String get toggleFingerDrawing => 'Attiva/disattiva il disegno con il dito (Ctrl F)';
	@override String get undo => 'Annulla';
	@override String get redo => 'Rifai';
	@override String get export => 'Esporta (Ctrl Shift S)';
	@override String get exportAs => 'Esporta come:';
	@override String get text => 'Testo';
	@override String get fullscreen => 'Passa a schermo intero (F11)';
}

// Path: editor.pens
class _StringsEditorPensIt extends _StringsEditorPensEn {
	_StringsEditorPensIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Penna stilografica';
	@override String get highlighter => 'Evidenziatore';
	@override String get ballpointPen => 'Penna a sfera';
}

// Path: editor.penOptions
class _StringsEditorPenOptionsIt extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get size => 'Dimesione';
	@override String get sizeDragHint => 'Trascina a sinistra o a destra per modificare le dimensioni';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsIt extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opzioni immagine';
	@override String get invertible => 'Invertibile';
	@override String get delete => 'Cancella';
	@override String get download => 'Download';
}

// Path: editor.menu
class _StringsEditorMenuIt extends _StringsEditorMenuEn {
	_StringsEditorMenuIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get clearPage => 'Pulisci pagina';
	@override String get clearAllPages => 'Pulisci tutte le pagine';
	@override String get lineHeight => 'Altezza della linea';
	@override String get lineHeightDescription => 'La dimensione di ogni riga';
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
	@override late final _StringsAppInfoRu appInfo = _StringsAppInfoRu._(_root);
	@override late final _StringsUpdateRu update = _StringsUpdateRu._(_root);
	@override late final _StringsEditorRu editor = _StringsEditorRu._(_root);
	@override late final _StringsSPenWarningRu sPenWarning = _StringsSPenWarningRu._(_root);
}

// Path: home
class _StringsHomeRu extends _StringsHomeEn {
	_StringsHomeRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsRu tabs = _StringsHomeTabsRu._(_root);
	@override late final _StringsHomeTitlesRu titles = _StringsHomeTitlesRu._(_root);
	@override late final _StringsHomeTooltipsRu tooltips = _StringsHomeTooltipsRu._(_root);
	@override String get backFolder => '(Назад)';
	@override String get welcome => 'Приветствуем в Saber';
	@override String get noFiles => 'Файлов ещё нет';
	@override String get createNewNote => 'Нажмите кнопку «+» чтобы создать новую заметку';
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
	@override late final _StringsSettingsAccentColorPickerRu accentColorPicker = _StringsSettingsAccentColorPickerRu._(_root);
	@override late final _StringsSettingsStraightenDelayRu straightenDelay = _StringsSettingsStraightenDelayRu._(_root);
	@override String get systemLanguage => 'System language';
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
	];
	@override late final _StringsLoginInsecureStorageRu insecureStorage = _StringsLoginInsecureStorageRu._(_root);
}

// Path: appInfo
class _StringsAppInfoRu extends _StringsAppInfoEn {
	_StringsAppInfoRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright (C) 2022-${buildYear}  Adil Hanney\nЭта программа поставляется без каких-либо гарантий. Это бесплатное программное обеспечение, и вы можете распространять его при определенных условиях.';
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
	@override String get updateAvailableDescription => 'Доступна новая версия приложения.';
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
	@override late final _StringsEditorImageOptionsRu imageOptions = _StringsEditorImageOptionsRu._(_root);
	@override late final _StringsEditorMenuRu menu = _StringsEditorMenuRu._(_root);
	@override late final _StringsEditorNewerFileFormatRu newerFileFormat = _StringsEditorNewerFileFormatRu._(_root);
	@override late final _StringsEditorQuillRu quill = _StringsEditorQuillRu._(_root);
	@override late final _StringsEditorHudRu hud = _StringsEditorHudRu._(_root);
}

// Path: sPenWarning
class _StringsSPenWarningRu extends _StringsSPenWarningEn {
	_StringsSPenWarningRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Предупреждение для S Pen';
	@override String get description => 'Если вы используете S Pen, то можете получить ошибку, из-за которой приложение даст сбой при попытке стереть с помощью кнопки S Pen. Это ошибка в рамках Flutter и исправление, вероятно, будет выпущено в течение месяца. В то же время, пожалуйста, используйте кнопку «Ластик» на панели инструментов.';
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
	@override String get browse => 'Все заметки';
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

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesRu extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get general => 'Общие';
	@override String get layout => 'Макет';
	@override String get writing => 'Письмо';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsRu extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Язык приложения';
	@override String get appTheme => 'Тема оформления';
	@override String get platform => 'Тип темы';
	@override String get customAccentColor => 'Свой цвет акцента';
	@override String get hyperlegibleFont => 'Гипер разборчивый шрифт';
	@override String get shouldCheckForUpdates => 'Автоматически проверять обновления Saber';
	@override String get editorToolbarOnBottom => 'Выровнять панель инструментов редактора по нижнему краю';
	@override String get editorToolbarShowInFullscreen => 'Показывать инструменты в полноэкранном режиме';
	@override String get editorAutoInvert => 'Инвертировать заметки в тёмном режиме';
	@override String get preferGreyscale => 'Предпочтение оттенкам серого';
	@override String get editorStraightenLines => 'Нажать и удерживать, чтобы выпрямить линию';
	@override String get autoClearWhiteboardOnExit => 'Очищать лист при выходе из приложения';
	@override String get editorPromptRename => 'Предлагать переименовывать новые заметки';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsRu extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Шрифт Atkinson Hyperlegible повышает разборчивость для читателей с плохим зрением';
	@override String get editorAutoInvert => 'Интеллектуально затемнять заметки в тёмном режиме';
	@override String get preferGreyscale => 'Для e-ink экранов';
	@override String get autoClearWhiteboardOnExit => 'Это будет синхронизировано с другими вашими устройствами';
	@override String get editorPromptRename => 'Вы всегда можете переименовать заметки позже';
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

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerRu extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Выбери цвет';
}

// Path: settings.straightenDelay
class _StringsSettingsStraightenDelayRu extends _StringsSettingsStraightenDelayEn {
	_StringsSettingsStraightenDelayRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get off => 'Выкл.';
	@override String get regular => 'Обычно';
	@override String get slow => 'Долго';
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
	@override String get a => 'Nextcloud — это частный сервер синхронизации файлов, помимо всего прочего. Вы можете использовать сервер Sabre Nextcloud по умолчанию, использовать сторонний сервер или самостоятельно разместить свой собственный для полного контроля над своими данными.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$Ru extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$Ru._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Что такое пароль шифрования?';
	@override String get a => 'Пароль шифрования используется для шифрования ваших данных перед отправкой их на сервер. Он не хранится на сервере и используется Sabre только для шифрования и расшифровки ваших данных.\n\nНикто не может получить доступ к вашим заметкам на сервере без вашего пароля шифрования. Это также означает, что если вы забудете пароль для шифрования, вы потеряете доступ к своим данным.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Ru extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Ru._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Зачем использовать два пароля?';
	@override String get a => 'Пароль Nextcloud используется для доступа к облаку. Пароль шифрования «шифрует» ваши данные еще до того, как они попадут в облако.\n\nДаже если кто-то получит доступ к вашей учетной записи Nextcloud, ваши заметки останутся в безопасности и будут зашифрованы с помощью отдельного пароля. Это обеспечивает вам второй уровень безопасности для защиты ваших данных.';
}

// Path: login.insecureStorage
class _StringsLoginInsecureStorageRu extends _StringsLoginInsecureStorageEn {
	_StringsLoginInsecureStorageRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Предупреждение безопасности';
	@override TextSpan description({required InlineSpanBuilder sponsorLink}) => TextSpan(children: [
		const TextSpan(text: 'Общий доступ к связке ключей не работает в macOS без платной учетной записи разработчика Apple. Если вы хотите войти в систему, вам нужно выбрать между:\n1. Использовать небезопасное хранилище для сохранения данных входа. Это не рекомендуется, но это ваш выбор.\n2. Входить в систему каждый раз, когда вы используете приложение.\n\nЕсли вы хотите помочь мне присоединиться к программе разработчиков Apple, вы можете '),
		sponsorLink('стать спонсором'),
		const TextSpan(text: '!'),
	]);
	@override String get loginTemporarily => 'Временный вход';
	@override String get useInsecureStorage => 'Использовать небезопасное хранилище';
}

// Path: editor.toolbar
class _StringsEditorToolbarRu extends _StringsEditorToolbarEn {
	_StringsEditorToolbarRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Выбор цвета (Ctrl C)';
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
}

// Path: editor.penOptions
class _StringsEditorPenOptionsRu extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get size => 'Размер';
	@override String get sizeDragHint => 'Тяните влево или вправо, чтобы изменить размер';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsRu extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Параметры изображения';
	@override String get invertible => 'Инвертированное';
	@override String get download => 'Сохранить';
	@override String get delete => 'Удалить';
}

// Path: editor.menu
class _StringsEditorMenuRu extends _StringsEditorMenuEn {
	_StringsEditorMenuRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get clearPage => 'Очистить лист';
	@override String get clearAllPages => 'Очистить все листы';
	@override String get lineHeight => 'Высота строки';
	@override String get lineHeightDescription => 'Размер каждой строки';
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatRu extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Режим «Только чтение»';
	@override String get title => 'Эта заметка была отредактирована в более новой версии Sabre.';
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
	@override late final _StringsAppInfoTr appInfo = _StringsAppInfoTr._(_root);
	@override late final _StringsUpdateTr update = _StringsUpdateTr._(_root);
	@override late final _StringsEditorTr editor = _StringsEditorTr._(_root);
	@override late final _StringsSPenWarningTr sPenWarning = _StringsSPenWarningTr._(_root);
}

// Path: home
class _StringsHomeTr extends _StringsHomeEn {
	_StringsHomeTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsTr tabs = _StringsHomeTabsTr._(_root);
	@override late final _StringsHomeTitlesTr titles = _StringsHomeTitlesTr._(_root);
	@override late final _StringsHomeTooltipsTr tooltips = _StringsHomeTooltipsTr._(_root);
	@override String get backFolder => '(Back)';
	@override String get welcome => 'Saber\'a hoş geldiniz';
	@override String get noFiles => 'Dosya yok';
	@override String get createNewNote => 'Yeni bir not oluşturmak için + butonuna tıklayınız';
}

// Path: settings
class _StringsSettingsTr extends _StringsSettingsEn {
	_StringsSettingsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefLabelsTr prefLabels = _StringsSettingsPrefLabelsTr._(_root);
	@override late final _StringsSettingsPrefDescriptionsTr prefDescriptions = _StringsSettingsPrefDescriptionsTr._(_root);
	@override late final _StringsSettingsThemeModesTr themeModes = _StringsSettingsThemeModesTr._(_root);
	@override late final _StringsSettingsAccentColorPickerTr accentColorPicker = _StringsSettingsAccentColorPickerTr._(_root);
	@override late final _StringsSettingsStraightenDelayTr straightenDelay = _StringsSettingsStraightenDelayTr._(_root);
	@override String get systemLanguage => 'Sistem dili';
	@override late final _StringsSettingsPrefCategoriesTr prefCategories = _StringsSettingsPrefCategoriesTr._(_root);
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
	];
	@override late final _StringsLoginInsecureStorageTr insecureStorage = _StringsLoginInsecureStorageTr._(_root);
}

// Path: appInfo
class _StringsAppInfoTr extends _StringsAppInfoEn {
	_StringsAppInfoTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright (C) 2022-${buildYear}  Adil Hanney\nBu program hiçbir şeyi garanti etmez ve güvence vermez.\nBu program özgür (free) bir yazılımdır ve belli koşullar sağlandığında yeniden dağıtıma müsaittir.';
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
	@override String get updateAvailableDescription => 'Uygulamanın yeni bir versiyonu mevcut.';
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
	@override late final _StringsEditorImageOptionsTr imageOptions = _StringsEditorImageOptionsTr._(_root);
	@override late final _StringsEditorMenuTr menu = _StringsEditorMenuTr._(_root);
	@override late final _StringsEditorNewerFileFormatTr newerFileFormat = _StringsEditorNewerFileFormatTr._(_root);
	@override late final _StringsEditorQuillTr quill = _StringsEditorQuillTr._(_root);
	@override late final _StringsEditorHudTr hud = _StringsEditorHudTr._(_root);
}

// Path: sPenWarning
class _StringsSPenWarningTr extends _StringsSPenWarningEn {
	_StringsSPenWarningTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'S Pen hata uyarısı';
	@override String get description => 'S Pen kullanıcıları, yazıları silmek için S Pen butonunu kullandıklarında uygulamanın çökmesine neden olan bir hata ile karşılaşıyorlar. Bu hata Flutter framework\'ten kaynaklanmakta ve çözümü muhtemelen bir ay içerisinde yayınlanacak. Bu sırada, lütfen araç kutusundaki silgiyi kullanın.';
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
	@override String get browse => 'Tüm notlar';
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

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsTr extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get appTheme => 'Uygulama teması';
	@override String get customAccentColor => 'Farklı ana renk';
	@override String get hyperlegibleFont => 'Hyperlegible font';
	@override String get shouldCheckForUpdates => 'Otomatik olarak Saber güncellemelerini kontrol et';
	@override String get editorToolbarOnBottom => 'Editör araç kutusunu aşağıya yerleştir';
	@override String get editorToolbarShowInFullscreen => 'Editör araç kutusunu tam ekranda göster';
	@override String get editorAutoInvert => 'Karanlık temada notların rengini tersine çevir';
	@override String get preferGreyscale => 'Gri tonlamayı tercih et';
	@override String get editorStraightenLines => 'Bir çizgiyi düzleştirmek için basılı tut';
	@override String get autoClearWhiteboardOnExit => 'Uygulamadan çıkıldığında beyaz tahtayı temizle';
	@override String get editorPromptRename => 'Notları yeniden adlandırmak için uyar';
	@override String get locale => 'Uygulama dili';
	@override String get platform => 'Tema tipi';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsTr extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible, görme sorunu yaşayanların okumasını kolaylaştıran bir fonttur';
	@override String get editorAutoInvert => 'Karanlık modda notların rengini değiştirir';
	@override String get preferGreyscale => 'E-mürekkep ekranlar için';
	@override String get autoClearWhiteboardOnExit => 'Diğer cihazlarınıza senkronize edilmeye devam edecek';
	@override String get editorPromptRename => 'Notlarınızı daha sonra da yeniden adlandırabilirsiniz';
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

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerTr extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Bir renk seçin';
}

// Path: settings.straightenDelay
class _StringsSettingsStraightenDelayTr extends _StringsSettingsStraightenDelayEn {
	_StringsSettingsStraightenDelayTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get off => 'Kapalı';
	@override String get regular => 'Normal';
	@override String get slow => 'Yavaş';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesTr extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get general => 'Genel';
	@override String get layout => 'Yerleşim';
	@override String get writing => 'Yazım';
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
	@override String get a => 'Şifreleme parolası, verilerinizin sunucuya yollanmadan önce şifrelenmesinde kullanılıyor. Bu parola sunucuda saklanmıyor, yalnızca Saber tarafından verilerinizin şifrelenmesi ve şifresinin çözülmesinde kullanılıyor.\n\nŞifreleme parolanız olmadan sunucudaki notlarınıza kimse erişemez. Dolayısıyla eğer şifreleme parolanızı unutursanız verilerinize erişimi de kaybedersiniz.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Tr extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Tr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Neden iki şifre kullanılıyor?';
	@override String get a => 'Nextcloud parolası bulut sunucuya erişmek için kullanılıyor. Şifreleme parolası, verilerinizin bulut sunucuya yollanmadan önce "karmaşıklaştırılması"nı sağlıyor.\n\nHerhangi birisi Nextcloud hesabınıza erişebilseydi bile, farklı bir şifreleme parolası kullandığınız için notlarınızı okuyamazdı. Böylece verilerinizin korunması için ikinci bir katman oluşuyor.';
}

// Path: login.insecureStorage
class _StringsLoginInsecureStorageTr extends _StringsLoginInsecureStorageEn {
	_StringsLoginInsecureStorageTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Güvenlik uyarısı';
	@override TextSpan description({required InlineSpanBuilder sponsorLink}) => TextSpan(children: [
		const TextSpan(text: 'macOS\'ta Güvenlik Anahtarlığı (Keychain) Paylaşımı ücretli bir Apple Geliştirici hesabı olmadan çalışmıyor. Eğer giriş yapmak isterseniz bunlardan birini seçiniz:\n1. Giriş bilgilerini kaydetmek için güvenli olmayan depolamayı kullan. Bu önerilmez ancak seçim sizin.\n2. Her seferinde yeniden giriş yap.\n\nApple Geliştirici Programına katılmama yardım etmek isterseniz, uygulamayı '),
		sponsorLink('sponsorlayabilirsiniz'),
		const TextSpan(text: '!'),
	]);
	@override String get loginTemporarily => 'Geçici olarak giriş yap';
	@override String get useInsecureStorage => 'Güvenli olmayan depolamayı kullan';
}

// Path: editor.toolbar
class _StringsEditorToolbarTr extends _StringsEditorToolbarEn {
	_StringsEditorToolbarTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Renklere geç (Ctrl C)';
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
}

// Path: editor.penOptions
class _StringsEditorPenOptionsTr extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get size => 'Boyut';
	@override String get sizeDragHint => 'Boyutu değiştirmek için sağa veya sola kaydır';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsTr extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Görüntü ayarları';
	@override String get invertible => '(Rengi) Tersine çevrilebilir';
	@override String get download => 'İndir';
	@override String get delete => 'Sil';
}

// Path: editor.menu
class _StringsEditorMenuTr extends _StringsEditorMenuEn {
	_StringsEditorMenuTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get clearPage => 'Sayfayı temizle';
	@override String get clearAllPages => 'Tüm sayfaları temizle';
	@override String get lineHeight => 'Satır aralığı';
	@override String get lineHeightDescription => 'Her bir satırın boyutu';
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
	@override late final _StringsAppInfoZhHansCn appInfo = _StringsAppInfoZhHansCn._(_root);
	@override late final _StringsUpdateZhHansCn update = _StringsUpdateZhHansCn._(_root);
	@override late final _StringsEditorZhHansCn editor = _StringsEditorZhHansCn._(_root);
	@override late final _StringsSPenWarningZhHansCn sPenWarning = _StringsSPenWarningZhHansCn._(_root);
}

// Path: home
class _StringsHomeZhHansCn extends _StringsHomeEn {
	_StringsHomeZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsZhHansCn tabs = _StringsHomeTabsZhHansCn._(_root);
	@override late final _StringsHomeTitlesZhHansCn titles = _StringsHomeTitlesZhHansCn._(_root);
	@override late final _StringsHomeTooltipsZhHansCn tooltips = _StringsHomeTooltipsZhHansCn._(_root);
	@override String get backFolder => '(返回)';
	@override String get welcome => '欢迎使用 Saber';
	@override String get noFiles => '未找到文件';
	@override String get createNewNote => '点击 + 按钮新建一个笔记';
}

// Path: settings
class _StringsSettingsZhHansCn extends _StringsSettingsEn {
	_StringsSettingsZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefLabelsZhHansCn prefLabels = _StringsSettingsPrefLabelsZhHansCn._(_root);
	@override late final _StringsSettingsPrefDescriptionsZhHansCn prefDescriptions = _StringsSettingsPrefDescriptionsZhHansCn._(_root);
	@override late final _StringsSettingsThemeModesZhHansCn themeModes = _StringsSettingsThemeModesZhHansCn._(_root);
	@override late final _StringsSettingsAccentColorPickerZhHansCn accentColorPicker = _StringsSettingsAccentColorPickerZhHansCn._(_root);
	@override late final _StringsSettingsStraightenDelayZhHansCn straightenDelay = _StringsSettingsStraightenDelayZhHansCn._(_root);
	@override String get systemLanguage => '系统语言';
	@override late final _StringsSettingsPrefCategoriesZhHansCn prefCategories = _StringsSettingsPrefCategoriesZhHansCn._(_root);
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
	];
	@override late final _StringsLoginInsecureStorageZhHansCn insecureStorage = _StringsLoginInsecureStorageZhHansCn._(_root);
}

// Path: appInfo
class _StringsAppInfoZhHansCn extends _StringsAppInfoEn {
	_StringsAppInfoZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  版权所有 (C) 2022-${buildYear}  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
	@override String get debug => 'DEBUG';
	@override String get licenseButton => '点击此处查看更多许可证信息';
	@override String get privacyPolicyButton => '点击此处查看隐私政策';
	@override String get sponsorButton => '点击此处赞助我或购买更多存储空间';
	@override String get dirty => 'DIRTY';
}

// Path: update
class _StringsUpdateZhHansCn extends _StringsUpdateEn {
	_StringsUpdateZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => '可用更新';
	@override String get updateAvailableDescription => '该应用程序的新版本可用。';
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
	@override late final _StringsEditorImageOptionsZhHansCn imageOptions = _StringsEditorImageOptionsZhHansCn._(_root);
	@override late final _StringsEditorMenuZhHansCn menu = _StringsEditorMenuZhHansCn._(_root);
	@override late final _StringsEditorNewerFileFormatZhHansCn newerFileFormat = _StringsEditorNewerFileFormatZhHansCn._(_root);
	@override late final _StringsEditorQuillZhHansCn quill = _StringsEditorQuillZhHansCn._(_root);
	@override late final _StringsEditorHudZhHansCn hud = _StringsEditorHudZhHansCn._(_root);
}

// Path: sPenWarning
class _StringsSPenWarningZhHansCn extends _StringsSPenWarningEn {
	_StringsSPenWarningZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => 'S Pen 错误警告';
	@override String get description => '如果您使用的是 S Pen，您可能会遇到一个错误，即在尝试使用 S Pen 按钮进行擦除时应用会崩溃。这是 Flutter 框架中的一个错误，修复可能会在一个月内发布。同时，请使用工具栏中的橡皮擦按钮。';
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
	@override String get browse => '全部笔记';
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

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsZhHansCn extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get appTheme => '应用主题';
	@override String get customAccentColor => '自定义主题色';
	@override String get hyperlegibleFont => '易读字体';
	@override String get shouldCheckForUpdates => '自动检查 Saber 更新';
	@override String get editorToolbarOnBottom => '将编辑工具栏与底部对齐';
	@override String get editorAutoInvert => '在深色模式下使用反色笔记背景';
	@override String get preferGreyscale => '使用灰度颜色';
	@override String get editorStraightenLines => '按住拉直线段';
	@override String get autoClearWhiteboardOnExit => '离开应用后清除白板';
	@override String get editorPromptRename => '提示您重命名新笔记';
	@override String get editorToolbarShowInFullscreen => '在全屏模式中显示编辑菜单栏';
	@override String get locale => '应用语言';
	@override String get platform => '主题类型';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsZhHansCn extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible 字体为低视力读者提高易读性';
	@override String get editorAutoInvert => '在深色模式下自动使用反色笔记背景';
	@override String get preferGreyscale => '用于电子墨水显示器';
	@override String get autoClearWhiteboardOnExit => '这将会同步到您的其他设备';
	@override String get editorPromptRename => '您可以总是稍后重命名笔记';
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

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerZhHansCn extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => '选取颜色';
}

// Path: settings.straightenDelay
class _StringsSettingsStraightenDelayZhHansCn extends _StringsSettingsStraightenDelayEn {
	_StringsSettingsStraightenDelayZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get off => '关闭';
	@override String get regular => '常规';
	@override String get slow => '缓慢';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesZhHansCn extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get general => '通用';
	@override String get layout => '布局';
	@override String get writing => '书写';
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
	@override String get loginSuccess => '登录成功！我们正在设置中，请稍候……';
	@override String get encLoginFailed => '登录失败，请检查您的加密密码。';
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
	@override String get a => 'Nextcloud 是一个私人文件同步服务器。您可以使用默认的 Saber Nextcloud 服务器、使用第三方服务器或自行托管您自己的服务器以完全控制您的数据。';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$ZhHansCn extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$ZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '加密密码是什么？';
	@override String get a => '加密密码用于在将数据发送到服务器之前对其进行加密。它不存储在服务器上，仅供 Saber 用来加密和解密您的数据。\n\n没有您的加密密码，任何人都无法访问您在服务器上的笔记。这也意味着，如果您忘记了加密密码，您将无法访问您的数据。';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$ZhHansCn extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$ZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '为什么使用双重密码？';
	@override String get a => 'Nextcloud 密码用于访问云端。加密密码会在您的数据到达云端之前对其进行“加密”。\n\n即使有人获得了您的 Nextcloud 帐户的访问权限，您的笔记也将保持安全并使用单独的密码进行加密。这为您提供了双重安全保护来保护您的数据。';
}

// Path: login.insecureStorage
class _StringsLoginInsecureStorageZhHansCn extends _StringsLoginInsecureStorageEn {
	_StringsLoginInsecureStorageZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '安全警告';
	@override TextSpan description({required InlineSpanBuilder sponsorLink}) => TextSpan(children: [
		const TextSpan(text: '如果没有付费的 Apple Developer 帐户，钥匙串共享将无法在 macOS 上运行。如果您想登录，您需要在以下选项之间进行选择：\n1.使用不安全存储来保存您的登录详细信息。不推荐这样做，但自行选择。\n2.每次使用该应用时都要登录。\n\n如果您想帮助我加入 Apple Developer Program，您可以 '),
		sponsorLink('成为赞助者'),
		const TextSpan(text: '！'),
	]);
	@override String get loginTemporarily => '临时登录';
	@override String get useInsecureStorage => '使用不安全存储';
}

// Path: editor.toolbar
class _StringsEditorToolbarZhHansCn extends _StringsEditorToolbarEn {
	_StringsEditorToolbarZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => '切换颜色 (Ctrl C)';
	@override String get toggleEraser => '切换橡皮擦 (Ctrl E)';
	@override String get photo => '照片';
	@override String get toggleFingerDrawing => '切换手写 (Ctrl F)';
	@override String get undo => '撤销';
	@override String get redo => '重做';
	@override String get export => '导出 (Ctrl Shift S)';
	@override String get exportAs => '导出为：';
	@override String get text => '文本';
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
}

// Path: editor.penOptions
class _StringsEditorPenOptionsZhHansCn extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get size => '粗细';
	@override String get sizeDragHint => '左右拖动更改粗细';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsZhHansCn extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '图片选项';
	@override String get invertible => '反转颜色';
	@override String get delete => '删除';
	@override String get download => '下载';
}

// Path: editor.menu
class _StringsEditorMenuZhHansCn extends _StringsEditorMenuEn {
	_StringsEditorMenuZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get clearPage => '清除页面';
	@override String get clearAllPages => '清除全部页面';
	@override String get lineHeight => '行高';
	@override String get lineHeightDescription => '每一行的高度';
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatZhHansCn extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '此笔记使用新版 Saber 编辑而成';
	@override String get cancel => '取消';
	@override String get readOnlyMode => '只读模式';
	@override String get subtitle => '编辑此笔记可能会导致某些信息丢失。您想忽略并编辑吗？';
	@override String get allowEditing => '允许编辑';
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
	@override late final _StringsAppInfoZhHantTw appInfo = _StringsAppInfoZhHantTw._(_root);
	@override late final _StringsUpdateZhHantTw update = _StringsUpdateZhHantTw._(_root);
	@override late final _StringsEditorZhHantTw editor = _StringsEditorZhHantTw._(_root);
	@override late final _StringsSPenWarningZhHantTw sPenWarning = _StringsSPenWarningZhHantTw._(_root);
}

// Path: home
class _StringsHomeZhHantTw extends _StringsHomeEn {
	_StringsHomeZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsZhHantTw tabs = _StringsHomeTabsZhHantTw._(_root);
	@override late final _StringsHomeTitlesZhHantTw titles = _StringsHomeTitlesZhHantTw._(_root);
	@override late final _StringsHomeTooltipsZhHantTw tooltips = _StringsHomeTooltipsZhHantTw._(_root);
	@override String get backFolder => '(返回)';
	@override String get welcome => '歡迎使用 Saber';
	@override String get noFiles => '未找到檔案';
	@override String get createNewNote => '點擊 + 按鈕新增一個筆記';
}

// Path: settings
class _StringsSettingsZhHantTw extends _StringsSettingsEn {
	_StringsSettingsZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefLabelsZhHantTw prefLabels = _StringsSettingsPrefLabelsZhHantTw._(_root);
	@override late final _StringsSettingsPrefDescriptionsZhHantTw prefDescriptions = _StringsSettingsPrefDescriptionsZhHantTw._(_root);
	@override late final _StringsSettingsThemeModesZhHantTw themeModes = _StringsSettingsThemeModesZhHantTw._(_root);
	@override late final _StringsSettingsAccentColorPickerZhHantTw accentColorPicker = _StringsSettingsAccentColorPickerZhHantTw._(_root);
	@override late final _StringsSettingsStraightenDelayZhHantTw straightenDelay = _StringsSettingsStraightenDelayZhHantTw._(_root);
	@override String get systemLanguage => '系統語言';
	@override late final _StringsSettingsPrefCategoriesZhHantTw prefCategories = _StringsSettingsPrefCategoriesZhHantTw._(_root);
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
	];
}

// Path: appInfo
class _StringsAppInfoZhHantTw extends _StringsAppInfoEn {
	_StringsAppInfoZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  版權所有 (C) 2022-${buildYear}  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
	@override String get debug => 'DEBUG';
	@override String get licenseButton => '點擊此處查看更多許可證資訊';
	@override String get privacyPolicyButton => '點擊此處查看隱私權政策';
	@override String get sponsorButton => '點擊此處贊助我或購買更多儲存空間';
	@override String get dirty => 'DIRTY';
}

// Path: update
class _StringsUpdateZhHantTw extends _StringsUpdateEn {
	_StringsUpdateZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => '可用更新';
	@override String get updateAvailableDescription => '該應用程式的新版本可用。';
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
	@override late final _StringsEditorImageOptionsZhHantTw imageOptions = _StringsEditorImageOptionsZhHantTw._(_root);
	@override late final _StringsEditorMenuZhHantTw menu = _StringsEditorMenuZhHantTw._(_root);
	@override late final _StringsEditorNewerFileFormatZhHantTw newerFileFormat = _StringsEditorNewerFileFormatZhHantTw._(_root);
	@override late final _StringsEditorQuillZhHantTw quill = _StringsEditorQuillZhHantTw._(_root);
	@override late final _StringsEditorHudZhHantTw hud = _StringsEditorHudZhHantTw._(_root);
}

// Path: sPenWarning
class _StringsSPenWarningZhHantTw extends _StringsSPenWarningEn {
	_StringsSPenWarningZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => 'S Pen 錯誤警告';
	@override String get description => '如果您使用的是 S Pen，您可能會遇到一個錯誤，即在嘗試使用 S Pen 按鈕進行擦除時應用程式會崩潰。這是 Flutter 框架中的一個錯誤，修復可能會在一個月內發布。同時，請使用工具欄中的橡皮擦按鈕。';
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
	@override String get browse => '全部筆記';
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

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsZhHantTw extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get appTheme => '應用程式主題';
	@override String get customAccentColor => '自訂主題色';
	@override String get hyperlegibleFont => '易讀字體';
	@override String get shouldCheckForUpdates => '自動檢查 Saber 更新';
	@override String get editorToolbarOnBottom => '將編輯工具列與底部對齊';
	@override String get editorAutoInvert => '在深色模式下使用反色筆記背景';
	@override String get preferGreyscale => '使用灰度顏色';
	@override String get editorStraightenLines => '按住拉直線條';
	@override String get autoClearWhiteboardOnExit => '退出應用程式後清除白板';
	@override String get editorPromptRename => '提醒您重新命名新筆記';
	@override String get editorToolbarShowInFullscreen => '在全螢幕模式中顯示編輯器工具列';
	@override String get locale => '應用程式語言';
	@override String get platform => '主題類型';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsZhHantTw extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible 字體為低視力讀者提高易讀性';
	@override String get editorAutoInvert => '在深色模式下自動使用反色筆記背景';
	@override String get preferGreyscale => '用於電子紙螢幕';
	@override String get autoClearWhiteboardOnExit => '它仍會同步到您的其他裝置';
	@override String get editorPromptRename => '您以後隨時可以重新命名筆記';
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

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerZhHantTw extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => '選取顏色';
}

// Path: settings.straightenDelay
class _StringsSettingsStraightenDelayZhHantTw extends _StringsSettingsStraightenDelayEn {
	_StringsSettingsStraightenDelayZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get off => '關閉';
	@override String get regular => '正常';
	@override String get slow => '緩慢';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesZhHantTw extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get general => '一般';
	@override String get layout => '佈局';
	@override String get writing => '書寫';
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
	@override String get loginSuccess => '登入成功！我們正在設定中，請稍後……';
	@override String get encLoginFailed => '登入失敗，請檢查您的加密密碼。';
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
	@override String get a => 'Nextcloud 是一個私人檔案同步伺服器。 您可以使用預設的 Sabre Nextcloud 伺服器或、使用第三方伺服器或自行託管您的伺服器以完全控制您的資料。';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$ZhHantTw extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$ZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '加密密碼是什麼？';
	@override String get a => '加密密碼用於在將資料傳送到伺服器之前對其進行加密。 它不存儲在伺服器上，僅供 Saber 用來加密和解密您的資料。\n\n沒有您的加密密碼，任何人都無法訪問您儲存在伺服器上的筆記。 這也意味著，如果您忘記了加密密碼，您將無法訪問您的資料。';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$ZhHantTw extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$ZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '為什麼要使用兩個密碼？';
	@override String get a => 'Nextcloud 密碼用於訪問雲端。 而加密密碼會在您的資料到達雲端之前對其進行「加密」。\n\n即使有人獲得了您 Nextcloud 帳號的訪問權限，您的筆記也將保持安全並使用單獨的密碼進行加密。 這為您提供了第二層安全保護來保護您的資料。';
}

// Path: editor.toolbar
class _StringsEditorToolbarZhHantTw extends _StringsEditorToolbarEn {
	_StringsEditorToolbarZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => '切換顏色 (Ctrl C)';
	@override String get toggleEraser => '切換橡皮擦 (Ctrl E)';
	@override String get photo => '照片';
	@override String get toggleFingerDrawing => '切換手寫 (Ctrl F)';
	@override String get undo => '復原';
	@override String get redo => '重做';
	@override String get export => '匯出 (Ctrl Shift S)';
	@override String get exportAs => '匯出為：';
	@override String get text => '文本';
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
}

// Path: editor.penOptions
class _StringsEditorPenOptionsZhHantTw extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get size => '粗細';
	@override String get sizeDragHint => '向左或向右拖動以更改大小';
}

// Path: editor.imageOptions
class _StringsEditorImageOptionsZhHantTw extends _StringsEditorImageOptionsEn {
	_StringsEditorImageOptionsZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '圖片選項';
	@override String get invertible => '反轉顏色';
	@override String get delete => '刪除';
	@override String get download => '下載';
}

// Path: editor.menu
class _StringsEditorMenuZhHantTw extends _StringsEditorMenuEn {
	_StringsEditorMenuZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get clearPage => '清除頁面';
	@override String get clearAllPages => '清除所有頁面';
	@override String get lineHeight => '行高';
	@override String get lineHeightDescription => '每行的高度';
}

// Path: editor.newerFileFormat
class _StringsEditorNewerFileFormatZhHantTw extends _StringsEditorNewerFileFormatEn {
	_StringsEditorNewerFileFormatZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '這篇筆記是使用較新版本的 Saber 編輯的';
	@override String get cancel => '取消';
	@override String get readOnlyMode => '唯讀模式';
	@override String get subtitle => '編輯此筆記可能會導致某些資訊遺失。 您想忽略它並編輯它嗎？';
	@override String get allowEditing => '允許編輯';
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
}
