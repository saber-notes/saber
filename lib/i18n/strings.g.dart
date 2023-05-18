/// Generated file. Do not edit.
///
/// Locales: 14
/// Strings: 2206 (157 per locale)
///
/// Built on 2023-05-18 at 19:35 UTC

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
	hu(languageCode: 'hu', build: _StringsHu.build),
	it(languageCode: 'it', build: _StringsIt.build),
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
	late final _StringsEditorImageOptionsEn imageOptions = _StringsEditorImageOptionsEn._(_root);
	late final _StringsEditorMenuEn menu = _StringsEditorMenuEn._(_root);
	late final _StringsEditorNewerFileFormatEn newerFileFormat = _StringsEditorNewerFileFormatEn._(_root);
	late final _StringsEditorQuillEn quill = _StringsEditorQuillEn._(_root);
	late final _StringsEditorHudEn hud = _StringsEditorHudEn._(_root);
	String get pages => 'Pages';
	String get untitled => 'Untitled';
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
	String get shouldAlwaysAlertForUpdates => 'Tell me about updates as soon as they\'re available';
	String get editorToolbarAlignment => 'Alignment of the editor toolbar';
	String get editorToolbarShowInFullscreen => 'Show the editor toolbar in fullscreen mode';
	String get editorAutoInvert => 'Invert notes in dark mode';
	String get editorOpaqueBackgrounds => 'Opaque backgrounds';
	String get preferGreyscale => 'Prefer greyscale colors';
	String get editorStraightenLines => 'Press and hold to straighten a line';
	String get maxImageSize => 'Maximum image size';
	String get autoClearWhiteboardOnExit => 'Clear the whiteboard after you exit the app';
	String get editorPromptRename => 'Prompt you to rename new notes';
	String get hideHomeBackgrounds => 'Hide backgrounds on the home screen';
	String get dontSavePresetColors => 'Don\'t save preset colors in recent colors';
	String get printPageIndicators => 'Print page indicators';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get hyperlegibleFont => 'Atkinson Hyperlegible increases legibility for readers with low vision';
	String get editorAutoInvert => 'Smartly darkens notes in dark mode';
	String get editorOpaqueBackgrounds => 'Remove transparency from background images and PDFs';
	String get preferGreyscale => 'For e-ink displays';
	String get autoClearWhiteboardOnExit => 'It will still be synced to your other devices';
	String get maxImageSize => 'Images larger than this will be compressed';
	String get editorPromptRename => 'You can always rename notes later';
	String get hideHomeBackgrounds => 'For a cleaner look';
	String get printPageIndicators => 'Show page indicators in exports';
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
	String get a => 'The encryption password is used to encrypt your data before it is sent to the server. You choose it when you first login to Saber, and it\'s not related to your Nextcloud account/password.\n\nNo-one can access your notes on the server without your encryption password. This also means that if you forget your encryption password, you will lose access to your data.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$En._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get q => 'Why use two passwords?';
	String get a => 'The Nextcloud password is used to access the cloud. The encryption password "scrambles" your data before it ever reaches the cloud.\n\nEven if someone gains access to your Nextcloud account, your notes will remain safe and encrypted with a separate password. This provides you a second layer of security to protect your data.';
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
	String get a => '1. Log out of Saber. Make sure syncing is complete before logging out so you don\'t lose any data (see the sync progress on the home screen).\n\n2. Go to your server website and delete your \'Saber\' folder. This will delete all your notes from the server.\n\n3. Log back in to Saber. You can choose a new encryption password when logging in.\n\n4. Don\'t forget to log out and log back in to Saber on your other devices too.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$En._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get q => 'How can I delete my account?';
	String get a => 'Tap on the "${_root.profile.quickLinks.deleteAccount}" button above, and login if needed.\n\nIf you are using the official Saber server, your account will be deleted after a 1 week grace period. You can contact me at adilhanney@disroot.org during this period to cancel the deletion.\n\nIf you are using a third party server, there might not be an option to delete your account: you\'ll need to consult the server\'s privacy policy for more information.';
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
	String get removeAsBackground => 'Remove as background';
	String get delete => 'Delete';
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
	String get backgroundImage => 'Background image';
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
	String get unlockPan => 'Enable single-finger panning';
	String get lockPan => 'Disable single-finger panning';
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
	@override String get welcome => 'مرحباً بك في Saber';
	@override String get noFiles => 'لم يتم العثور على ملفات';
	@override String get createNewNote => 'اضغط على زر + لإنشاء ملاحظة جديدة';
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
	@override late final _StringsSettingsAccentColorPickerAr accentColorPicker = _StringsSettingsAccentColorPickerAr._(_root);
	@override late final _StringsSettingsStraightenDelayAr straightenDelay = _StringsSettingsStraightenDelayAr._(_root);
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
	@override String licenseNotice({required Object buildYear}) => 'Saber حقوق نشر (C) 2022-${buildYear}  Adil Hanney\nهذا البرنامج لا يأتي مع أي ضمان على الإطلاق. هذا برنامج مجاني، ونرحب بإعادة توزيعه في ظل ظروف معينة.';
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
	@override late final _StringsEditorImageOptionsAr imageOptions = _StringsEditorImageOptionsAr._(_root);
	@override late final _StringsEditorMenuAr menu = _StringsEditorMenuAr._(_root);
	@override late final _StringsEditorNewerFileFormatAr newerFileFormat = _StringsEditorNewerFileFormatAr._(_root);
	@override late final _StringsEditorQuillAr quill = _StringsEditorQuillAr._(_root);
	@override late final _StringsEditorHudAr hud = _StringsEditorHudAr._(_root);
	@override String get pages => 'صفحات';
	@override String get untitled => 'بدون عنوان';
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
	@override String get browse => 'جميع المحلاظات';
	@override String get whiteboard => 'السبورة';
	@override String get settings => 'الإعدادات';
}

// Path: home.tooltips
class _StringsHomeTooltipsAr extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'محلاظة جديدة';
	@override String get showUpdateDialog => 'إظهار مربع حوار التحديث';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesAr extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get general => 'عام';
	@override String get layout => 'تخطيط';
	@override String get writing => 'كتابة';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsAr extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get locale => 'لغة التطبيق';
	@override String get appTheme => 'مظهر التطبيث';
	@override String get platform => 'نوع المظهر';
	@override String get customAccentColor => 'لون التمييز المخصص';
	@override String get hyperlegibleFont => 'Hyperlegible خط';
	@override String get shouldCheckForUpdates => 'تحقق تلقائيًا من وجود تحديثات Saber';
	@override String get shouldAlwaysAlertForUpdates => 'أخبرني عن التحديثات بمجرد توفرها';
	@override String get editorToolbarAlignment => 'محاذاة شريط أدوات المحرر';
	@override String get editorToolbarShowInFullscreen => 'أظهر شريط أدوات المحرر في وضع ملء الشاشة';
	@override String get editorAutoInvert => 'اقلب الملاحظات في الوضع المظلم';
	@override String get editorOpaqueBackgrounds => 'خلفيات معتمة';
	@override String get preferGreyscale => 'تفضيل الألوان الرمادية';
	@override String get editorStraightenLines => 'اضغط مع الاستمرار لتصويب الخط';
	@override String get maxImageSize => 'الحجم الأقصى للصورة';
	@override String get autoClearWhiteboardOnExit => 'امسح السبورة بعد الخروج من التطبيق';
	@override String get editorPromptRename => 'مطالبتك بإعادة تسمية الملاحظات الجديدة';
	@override String get hideHomeBackgrounds => 'إخفاء الخلفيات على الشاشة الرئيسية';
	@override String get dontSavePresetColors => 'لا تحفظ الألوان المعينة مسبقًا كألوان حديثة';
	@override String get printPageIndicators => 'طباعة مؤشرات الصفحة';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsAr extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'يزيد Atkinson Hyperlegible من وضوح الرؤية للقراء الذين يعانون من ضعف في الرؤية';
	@override String get editorAutoInvert => 'يعمل على تعتيم الملاحظات بذكاء في الوضع المظلم';
	@override String get editorOpaqueBackgrounds => 'قم بإزالة الشفافية من صور الخلفية وملفات PDF';
	@override String get preferGreyscale => 'لشاشات الحبر الإلكتروني';
	@override String get autoClearWhiteboardOnExit => 'ستظل متزامنة مع أجهزتك الأخرى';
	@override String get maxImageSize => 'سيتم ضغط الصور الأكبر من هذا';
	@override String get editorPromptRename => 'يمكنك دائمًا إعادة تسمية الملاحظات لاحقًا';
	@override String get hideHomeBackgrounds => 'للحصول على مظهر أنظف';
	@override String get printPageIndicators => 'تظهر مؤشرات الصفحة في الصادرات';
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

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerAr extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'اختر لوناً';
}

// Path: settings.straightenDelay
class _StringsSettingsStraightenDelayAr extends _StringsSettingsStraightenDelayEn {
	_StringsSettingsStraightenDelayAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get off => 'مغلق';
	@override String get regular => 'عادي';
	@override String get slow => 'بطيء';
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
	@override String get a => 'تُستخدم كلمة مرور التشفير لتشفير بياناتك قبل إرسالها إلى الخادم. يمكنك اختيارها عند تسجيل الدخول لأول مرة إلى Saber ،وهي غير مرتبطة بحساب/كلمة مرور Nextcloud الخاصة بك.\n\nلا يمكن لأحد الوصول إلى ملاحظاتك على الخادم بدون كلمة مرور التشفير الخاصة بك. هذا يعني أيضًا أنك إذا نسيت كلمة مرور التشفير، فستفقد إمكانية الوصول إلى بياناتك.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Ar extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Ar._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'لماذا نستخدم كلمتين من كلمات المرور؟';
	@override String get a => 'يتم استخدام كلمة مرور Nextcloud للوصول إلى السحابة. كلمة مرور التشفير "تشويش " بياناتك قبل أن تصل إلى السحابة.\n\nحتى إذا تمكن شخص ما من الوصول إلى حسابك على Nextcloud ،فستظل ملاحظاتك آمنة ومشفرة بكلمة مرور منفصلة. يوفر لك هذا طبقة ثانية من الأمان لحماية بياناتك.';
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
	@override String get a => '1. تسجيل الخروج من Saber. تأكد من اكتمال المزامنة قبل تسجيل الخروج حتى لا تفقد أي بيانات (انظر تقدم المزامنة على الشاشة الرئيسية).\n\n2. اذهب إلى موقع الخادم الخاص بك واحذف مجلد "Saber" الخاص بك. سيؤدي هذا إلى حذف كافة ملاحظاتك من الخادم.\n\n3. قم بتسجيل الدخول مرة أخرى إلى Saber. يمكنك اختيار كلمة مرور تشفير جديدة عند تسجيل الدخول.\n\n4. لا تنس تسجيل الخروج وتسجيل الدخول مرة أخرى إلى Saber على أجهزتك الأخرى أيضًا.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$Ar extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$Ar._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'كيف يمكنني حذف حسابي؟';
	@override String get a => 'انتقل إلى موقع الخادم الخاص بك وقم بتسجيل الدخول. ثم انتقل إلى الإعدادات> حذف الحساب.\n\nإذا كنت تستخدم خادم Saber الرسمي، فسيتم حذف حسابك بعد فترة سماح مدتها أسبوع. يمكنك الاتصال بي على adilhanney@disroot.org خلال هذه الفترة لإلغاء الحذف.\n\nإذا كنت تستخدم خادم جهة خارجية، فقد لا يكون هناك خيار لحذف حسابك: ستحتاج إلى استشارة خصوصية الخادم سياسة لمزيد من المعلومات.';
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
}

// Path: editor.penOptions
class _StringsEditorPenOptionsAr extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get size => 'حجم';
	@override String get sizeDragHint => 'اسحب لليسار أو لليمين لتغيير الحجم';
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

// Path: editor.menu
class _StringsEditorMenuAr extends _StringsEditorMenuEn {
	_StringsEditorMenuAr._(_StringsAr root) : this._root = root, super._(root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => '${page}/${totalPages} صفحة واضحة';
	@override String get clearAllPages => 'امسح كل الصفحات';
	@override String get insertPage => 'أدخل الصفحة أدناه';
	@override String get duplicatePage => 'تكرار الصفحة';
	@override String get deletePage => 'حذف الصفحة';
	@override String get lineHeight => 'ارتفاع خط';
	@override String get lineHeightDescription => 'يتحكم أيضًا في حجم النص';
	@override String get backgroundImage => 'الصورة الخلفية';
	@override String get backgroundPattern => 'نمط الخلفية';
	@override String get import => 'يستورد';
	@override late final _StringsEditorMenuBoxFitsAr boxFits = _StringsEditorMenuBoxFitsAr._(_root);
	@override late final _StringsEditorMenuBgPatternsAr bgPatterns = _StringsEditorMenuBgPatternsAr._(_root);
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
	@override String get unlockPan => 'تمكين التحريك بإصبع واحد';
	@override String get lockPan => 'تعطيل التحريك بإصبع واحد';
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
	@override String get welcome => 'Vítejte v aplikaci Saber';
	@override String get noFiles => 'Žádné poznámky nebyly nalezeny';
	@override String get createNewNote => 'Pro přidání nové poznámky klepněte na tlačítko +';
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
	@override late final _StringsSettingsAccentColorPickerCs accentColorPicker = _StringsSettingsAccentColorPickerCs._(_root);
	@override late final _StringsSettingsStraightenDelayCs straightenDelay = _StringsSettingsStraightenDelayCs._(_root);
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
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright (C) 2022-${buildYear}  Adil Hanney\nTento program je poskytován bez jakékoliv záruky. Jedná se o software poskytovaný zdarma, který je možné šířit při splnění určitých podmínek.';
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
	@override late final _StringsEditorImageOptionsCs imageOptions = _StringsEditorImageOptionsCs._(_root);
	@override late final _StringsEditorMenuCs menu = _StringsEditorMenuCs._(_root);
	@override late final _StringsEditorNewerFileFormatCs newerFileFormat = _StringsEditorNewerFileFormatCs._(_root);
	@override late final _StringsEditorQuillCs quill = _StringsEditorQuillCs._(_root);
	@override late final _StringsEditorHudCs hud = _StringsEditorHudCs._(_root);
	@override String get pages => 'Stránky';
	@override String get untitled => 'Nepojmenovaná poznámka';
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

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesCs extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get general => 'Obecné';
	@override String get layout => 'Uspořádání uživatelského rozhraní';
	@override String get writing => 'Psaní';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsCs extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Jazyk aplikace';
	@override String get appTheme => 'Barva motivu';
	@override String get platform => 'Motiv';
	@override String get customAccentColor => 'Vlastní barevný odstín';
	@override String get hyperlegibleFont => 'Lépe čitelný font';
	@override String get shouldCheckForUpdates => 'Automaticky kontrolovat dostupnost aktualizací aplikace Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Oznámit dostupnost aktualizací co nejdříve od jejich vydání';
	@override String get editorToolbarAlignment => 'Umístění nabídky editoru';
	@override String get editorToolbarShowInFullscreen => 'Zobrazovat nabídku editoru v režimu celé obrazovky';
	@override String get editorAutoInvert => 'V tmavém režimu invertovat poznámky';
	@override String get editorOpaqueBackgrounds => 'Neprůhledná pozadí';
	@override String get preferGreyscale => 'Preferovat černobílé barvy';
	@override String get editorStraightenLines => 'Pro kreslení rovné čáry stisknout a podržet';
	@override String get maxImageSize => 'Maximální velikost obrázku';
	@override String get autoClearWhiteboardOnExit => 'Smazat tabuli po opuštění aplikace';
	@override String get editorPromptRename => 'Vybízet k přejmenování nových poznámek';
	@override String get hideHomeBackgrounds => 'Skrýt pozadí poznámek na hlavní obrazovce';
	@override String get dontSavePresetColors => 'Mezi naposledy použité barvy neukládat přednastavené barvy';
	@override String get printPageIndicators => 'Tisknout čísla stránek';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsCs extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsCs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Font Atkinson Hyperlegible zvyšuje čitelnost pro čtenáře se slabým zrakem';
	@override String get editorAutoInvert => 'Inteligentně ztmaví poznámky ve tmavém motivu';
	@override String get editorOpaqueBackgrounds => 'Odstraní průhlednost z obrázků a PDF na pozadí';
	@override String get preferGreyscale => 'Pro elektronické čtečky knih s e-ink displejem';
	@override String get autoClearWhiteboardOnExit => 'Bude synchronizováno do dalších zařízení';
	@override String get maxImageSize => 'Na větší obrázky bude aplikována komprese';
	@override String get editorPromptRename => 'Poznámky můžete vždy přejmenovat i později';
	@override String get hideHomeBackgrounds => 'Pro čistější vzhled';
	@override String get printPageIndicators => 'V exportech budou zobrazena čísla stránek';
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
	@override String get a => 'Heslo pro šifrování je použito k zašifrování vašich dat před jejich odesláním na server. Zvolíte si ho při prvním přihlášení do aplikace Saber, není nijak vázáno na heslo k vašemu Nextcloud účtu nebo na účet samotný.\n\nBez jeho znalosti nemůže nikdo přistoupit k vašim poznámkám uloženým na serveru. To také znamená, že pokud ho zapomenete, ztratíte přístup ke svým datům.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Cs extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Cs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Proč používat dvě hesla?';
	@override String get a => 'Heslo k Nextcloud účtu se používá k přístupu do cloudu. Heslo pro šifrování "utají" vaše data ještě před tím, než se na cloud dostanou.\n\nI když by někdo získat přístup k vašemu Nextcloud účtu, vaše poznámky zůstanou v bezpečí zašifrované vlastním heslem. To vám poskytuje druhou vrstvu ochrany vašich dat.';
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
	@override String get a => '1. Odhlašte se z aplikace Saber. Před odhlášením se ujistěte, že byla dokončena synchronizace a nepřijdete o žádná data (průběh synchronizace uvidíte na domovské obrazovce).\n\n2. Přejděte na webovou stránku vašeho serveru a smažte složku \'Saber\'. Tím ze serveru odstraníte všechny poznámky.\n\n3. Opětovně se přihlašte do aplikace Saber. Při přihlašování můžete zvolit nové heslo pro šifrování.\n\n4. Nezapomeňte se z aplikace Saber odhlásit a opětovně se do ní přihlásit na ostatních zařízeních.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$Cs extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$Cs._(_StringsCs root) : this._root = root, super._(root);

	@override final _StringsCs _root; // ignore: unused_field

	// Translations
	@override String get q => 'Jak odstraním svůj účet?';
	@override String get a => 'Klepněte na tlačítko "${_root.profile.quickLinks.deleteAccount}" umístěné výše a přihlašte se, pokud to bude vyžadováno.\n\nPokud používáte výchozí server od aplikace Saber, bude váš účet odstraněn po uplynutí týdenní ochranné lhůty. Během této lhůty mě můžete kontaktovat pro odvolání zrušení účtu na adilhanney@disroot.org.\n\nPokud používáte server třetí strany, nemusí nabízet možnost odstranění účtu: pro více informací se bude třeba obrátit na zásady ochrany osobních údajů daného serveru.';
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
	@override String get invertible => 'Invertovat barvy podle motivu';
	@override String get download => 'Stáhnout';
	@override String get setAsBackground => 'Nastavit na pozadí';
	@override String get removeAsBackground => 'Odstranit obrázek z pozadí';
	@override String get delete => 'Odstranit';
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
	@override String get backgroundImage => 'Obrázek na pozadí';
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
	@override String get unlockPan => 'Zapnout posouvání jedním prsem';
	@override String get lockPan => 'Vypnout posouvání jedním prsem';
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
	@override String get welcome => 'Willkommen bei Saber';
	@override String get noFiles => 'Keine Dateien gefunden';
	@override String get createNewNote => 'Drücke die + Schaltfläche, um eine neue Notiz zu erstellen';
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
	@override late final _StringsSettingsAccentColorPickerDe accentColorPicker = _StringsSettingsAccentColorPickerDe._(_root);
	@override late final _StringsSettingsStraightenDelayDe straightenDelay = _StringsSettingsStraightenDelayDe._(_root);
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

// Path: appInfo
class _StringsAppInfoDe extends _StringsAppInfoEn {
	_StringsAppInfoDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright (C) 2022-${buildYear}  Adil Hanney\nDieses Programm kommt ohne jegliche Gewährleistung. Dies ist freie Software und du bist herzlich eingeladen, diese unter bestimmten Bedingungen weiterzuverteilen.';
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
	@override late final _StringsEditorImageOptionsDe imageOptions = _StringsEditorImageOptionsDe._(_root);
	@override late final _StringsEditorMenuDe menu = _StringsEditorMenuDe._(_root);
	@override late final _StringsEditorNewerFileFormatDe newerFileFormat = _StringsEditorNewerFileFormatDe._(_root);
	@override late final _StringsEditorQuillDe quill = _StringsEditorQuillDe._(_root);
	@override late final _StringsEditorHudDe hud = _StringsEditorHudDe._(_root);
	@override String get pages => 'Seiten';
	@override String get untitled => 'Unbenannt';
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

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesDe extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get general => 'Allgemein';
	@override String get layout => 'Aussehen';
	@override String get writing => 'Eingabe';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsDe extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Sprache';
	@override String get appTheme => 'Anwendungsthema';
	@override String get platform => 'Oberfläche';
	@override String get customAccentColor => 'Benutzerdefinierte Akzentfarbe';
	@override String get hyperlegibleFont => 'Hyperlesbare Schrift';
	@override String get shouldCheckForUpdates => 'Suche automatisch nach Saber-Aktualisierungen';
	@override String get shouldAlwaysAlertForUpdates => 'Benachrichtige mich, sobald eine neue Version verfügbar ist';
	@override String get editorToolbarAlignment => 'Position der Werkzeugleiste';
	@override String get editorToolbarShowInFullscreen => 'Zeige die Werkzeugleiste im Vollbild';
	@override String get editorAutoInvert => 'Notizen im Dunkelmodus invertieren';
	@override String get editorOpaqueBackgrounds => 'Undurchsichtige Hintergründe';
	@override String get preferGreyscale => 'Graustufen bevorzugen';
	@override String get editorStraightenLines => 'Drücke und halte für eine gerade Linie';
	@override String get maxImageSize => 'Maximale Bildgröße';
	@override String get autoClearWhiteboardOnExit => 'Lösche das Whiteboard nach Verlassen der Anwendung';
	@override String get editorPromptRename => 'Beim Erstellen von Notizen einen Namen erfragen';
	@override String get hideHomeBackgrounds => 'Hintergrund auf dem Startbildschirm verbergen';
	@override String get dontSavePresetColors => 'Farbvorlagen nicht in den zuletzt genutzten Farben speichern';
	@override String get printPageIndicators => 'Seitennummerierung drucken';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsDe extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible verbessert die Lesbarkeit für Menschen mit eingeschränkter Sicht';
	@override String get editorAutoInvert => 'Verdunkelt intelligent die Notizen im Dunkelmodus';
	@override String get editorOpaqueBackgrounds => 'Hintergrundbilder und PDFs undurchsichtig machen';
	@override String get preferGreyscale => 'Für E-Ink-Bildschirme';
	@override String get autoClearWhiteboardOnExit => 'Es wird dennoch mit deinen anderen Geräten synchronisiert';
	@override String get maxImageSize => 'Bilder, die größer sind, werden komprimiert';
	@override String get editorPromptRename => 'Notizen können immer auch später noch umbenannt werden';
	@override String get hideHomeBackgrounds => 'Für ein sauberes Aussehen';
	@override String get printPageIndicators => 'Seitennummerierung bei Export anzeigen';
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

// Path: settings.straightenDelay
class _StringsSettingsStraightenDelayDe extends _StringsSettingsStraightenDelayEn {
	_StringsSettingsStraightenDelayDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get off => 'Aus';
	@override String get regular => 'Normal';
	@override String get slow => 'Langsam';
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

// Path: login.faq.3
class _StringsLogin$faq$0i3$De extends _StringsLogin$faq$0i3$En {
	_StringsLogin$faq$0i3$De._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Wie melde ich mich an, wenn ich Zwei-Faktor-Authentifikation verwende?';
	@override String get a => 'Anstatt dein normales Nextcloud Password zu verwenden, musst du ein "App Password" erstellen. Das kannst du in den Nextcloud Einstellungen unter Sicherheit > Geräte & Sitzungen > Neues App-Passwort erstellen tun. Das betrifft dein Verschlüsselungspassword nicht.';
}

// Path: login.faq.4
class _StringsLogin$faq$0i4$De extends _StringsLogin$faq$0i4$En {
	_StringsLogin$faq$0i4$De._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Kann ich dasselbe Passwort für beide verwenden?';
	@override String get a => 'Ja, aber das ist nicht so sicher. Da dein Nextcloud Passwort an den Server übertragen wird, kann jemand mit Zugriff auf den Server deine Notizen entschlüsseln. Du solltest also nur dasselbe Password verwenden, wenn du der Person, die den Server besitzt, vertraust.';
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
	@override String get download => 'Herunterladen';
	@override String get setAsBackground => 'Als Hintergrund festlegen';
	@override String get removeAsBackground => 'Hintergrund entfernen';
	@override String get delete => 'Entfernen';
}

// Path: editor.menu
class _StringsEditorMenuDe extends _StringsEditorMenuEn {
	_StringsEditorMenuDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Seite löschen ${page}/${totalPages}';
	@override String get clearAllPages => 'Alle Seiten löschen';
	@override String get lineHeight => 'Zeilenhöhe';
	@override String get lineHeightDescription => 'Beeinflusst die Schriftgröße';
	@override String get backgroundImage => 'Hintergrundbild';
	@override String get backgroundPattern => 'Hintergrundmuster';
	@override String get import => 'Importieren';
	@override late final _StringsEditorMenuBoxFitsDe boxFits = _StringsEditorMenuBoxFitsDe._(_root);
	@override late final _StringsEditorMenuBgPatternsDe bgPatterns = _StringsEditorMenuBgPatternsDe._(_root);
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
	@override String get unlockPan => 'Verschieben mit einem Finger aktivieren';
	@override String get lockPan => 'Verschieben mit einem Finger deaktivieren';
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
	@override String get lined => 'Liniert';
	@override String get grid => 'Kariert';
	@override String get dots => 'Gepunktet';
	@override String get staffs => 'Notenpapier';
	@override String get cornell => 'Cornell-Stil';
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
}

// Path: home
class _StringsHomeEs extends _StringsHomeEn {
	_StringsHomeEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsEs tabs = _StringsHomeTabsEs._(_root);
	@override late final _StringsHomeTitlesEs titles = _StringsHomeTitlesEs._(_root);
	@override late final _StringsHomeTooltipsEs tooltips = _StringsHomeTooltipsEs._(_root);
	@override String get welcome => 'Te damos la bienvenida a Saber';
	@override String get noFiles => 'No se ha encontrado ninguna nota';
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
	@override String get update => 'Actualizar';
	@override String get updateAvailableDescription => 'Hay una nueva versión de la aplicación disponible. Novedades en esta versión:';
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
	@override String get pages => 'Páginas';
	@override String get untitled => 'Sin título';
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
	@override String get shouldAlwaysAlertForUpdates => 'Avísame sobre nuevas actualizaciones tan pronto como estén disponibles';
	@override String get editorToolbarAlignment => 'Alineación de la barra de herramientas del editor';
	@override String get editorToolbarShowInFullscreen => 'Mostrar la barra de herramientas del editor en el modo de pantalla completa';
	@override String get editorAutoInvert => 'Invertir notas en el modo oscuro';
	@override String get editorOpaqueBackgrounds => 'Fondos opacos';
	@override String get preferGreyscale => 'Preferir colores en escala de grises';
	@override String get editorStraightenLines => 'Mantener presionado para enderezar una línea';
	@override String get maxImageSize => 'Tamaño máximo de la imagen';
	@override String get autoClearWhiteboardOnExit => 'Borrar la pizarra después de salir de la aplicación';
	@override String get editorPromptRename => 'Solicitarte cambiar el nombre de nuevas notas';
	@override String get hideHomeBackgrounds => 'Ocultar fondos en la pantalla de inicio';
	@override String get dontSavePresetColors => 'No guardar colores preestablecidos en los colores recientes';
	@override String get printPageIndicators => 'Indicadores de página de impresión';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsEs extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible aumenta la legibilidad para lectores con poca visión';
	@override String get editorAutoInvert => 'Oscurece inteligentemente las notas en el modo oscuro';
	@override String get editorOpaqueBackgrounds => 'Elimina la transparencia de las imágenes de fondo y los archivos PDF';
	@override String get preferGreyscale => 'Para pantallas con tinta electrónica';
	@override String get autoClearWhiteboardOnExit => 'Aún se sincronizará con tus otros dispositivos';
	@override String get maxImageSize => 'Las imágenes más grandes que este valor serán comprimidas';
	@override String get editorPromptRename => 'Siempre puedes cambiar el nombre de las notas más tarde';
	@override String get hideHomeBackgrounds => 'Para una vista más limpia';
	@override String get printPageIndicators => 'Mostrar indicadores de página en las exportaciones';
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
	@override String get a => 'La contraseña de cifrado se utiliza para cifrar tus datos antes de enviarlos al servidor. La eliges cuando inicias sesión por primera vez en Saber, y no está relacionada con tu cuenta/contraseña de Nextcloud.\n\nNadie puede acceder a tus notas en el servidor sin tu contraseña de cifrado. Esto significa que si olvidas tu contraseña de cifrado, perderás el acceso a tus datos.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Es extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Es._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Por qué usar dos contraseñas?';
	@override String get a => 'La contraseña de Nextcloud se utiliza para acceder a la nube. La contraseña de encriptación "codifica" tus datos antes de que lleguen a la nube.\n\nIncluso si alguien obtiene acceso a tu cuenta de Nextcloud, tus notas permanecerán seguras y encriptadas con una contraseña separada. Esto te proporciona una segunda capa de seguridad para proteger tus datos.';
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
	@override String get setAsBackground => 'Usar como fondo';
	@override String get removeAsBackground => 'Eliminar como fondo';
	@override String get delete => 'Eliminar';
}

// Path: editor.menu
class _StringsEditorMenuEs extends _StringsEditorMenuEn {
	_StringsEditorMenuEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Borrar página ${page}/${totalPages}';
	@override String get clearAllPages => 'Borrar todas las páginas';
	@override String get lineHeight => 'Altura de la línea';
	@override String get lineHeightDescription => 'Controla también el tamaño del texto';
	@override String get backgroundImage => 'Imagen de fondo';
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
	@override String get unlockPan => 'Habilitar la panorámica con un solo dedo';
	@override String get lockPan => 'Deshabilitar la panorámica con un solo dedo';
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
	@override String get lined => 'Rayado';
	@override String get grid => 'Cuadrículado';
	@override String get dots => 'Punteado';
	@override String get staffs => 'Pentagrama';
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
	@override String get welcome => 'خوش آمدید';
	@override String get noFiles => 'فایلی پیدا نشد';
	@override String get createNewNote => 'برای ساخت یادداشت دکمه + را بزنید';
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
	@override late final _StringsSettingsAccentColorPickerFa accentColorPicker = _StringsSettingsAccentColorPickerFa._(_root);
	@override late final _StringsSettingsStraightenDelayFa straightenDelay = _StringsSettingsStraightenDelayFa._(_root);
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
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright (C) 2022-${buildYear}  Adil Hanney\nاین برنامه کاملاً بدون گارانتی ارائه می شود. این نرم‌افزار رایگان است و شما می‌توانید تحت شرایط خاصی آن را مجدداً توزیع کنید';
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
	@override late final _StringsEditorImageOptionsFa imageOptions = _StringsEditorImageOptionsFa._(_root);
	@override late final _StringsEditorMenuFa menu = _StringsEditorMenuFa._(_root);
	@override late final _StringsEditorNewerFileFormatFa newerFileFormat = _StringsEditorNewerFileFormatFa._(_root);
	@override late final _StringsEditorQuillFa quill = _StringsEditorQuillFa._(_root);
	@override late final _StringsEditorHudFa hud = _StringsEditorHudFa._(_root);
	@override String get pages => 'صفحات';
	@override String get untitled => 'بدون عنوان';
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
	@override String get browse => 'کل یادداشت ها';
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

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesFa extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get general => 'عمومی';
	@override String get layout => 'چیدمان';
	@override String get writing => 'نوشتن';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsFa extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get locale => 'زبان برنامه';
	@override String get appTheme => 'تم برنامه';
	@override String get platform => 'نوع تم';
	@override String get customAccentColor => 'رنگ سفارشی';
	@override String get hyperlegibleFont => 'فونت بیش از حد خوانا';
	@override String get shouldCheckForUpdates => 'به‌روزرسانی‌ برنامه را به‌طور خودکار بررسی کنید';
	@override String get shouldAlwaysAlertForUpdates => 'به محض اینکه به‌روزرسانی‌ها در دسترس هستند، به من بگویید';
	@override String get editorToolbarAlignment => 'تراز کردن نوار ابزار ویرایشگر';
	@override String get editorToolbarShowInFullscreen => 'نوار ابزار ویرایشگر را در حالت تمام صفحه نمایش دهید';
	@override String get editorAutoInvert => 'معکوس کردن رنگ یادداشت ها در حالت تاریک';
	@override String get editorOpaqueBackgrounds => 'پس زمینه مات';
	@override String get preferGreyscale => 'رنگ های خاکستری را در اولویت قرار دهید';
	@override String get editorStraightenLines => 'برای کشیدن خط صاف فشار دهید و نگه دارید';
	@override String get maxImageSize => 'حداکثر اندازه تصویر';
	@override String get autoClearWhiteboardOnExit => 'پس از خروج از برنامه، وایت برد پاک شود';
	@override String get editorPromptRename => 'از شما می خواهد که نام یادداشت های جدید را تغییر دهید';
	@override String get hideHomeBackgrounds => 'پس زمینه را در صفحه اصلی پنهان کنید';
	@override String get dontSavePresetColors => 'رنگ های از پیش تعیین شده را در رنگ های اخیر ذخیره نکنید';
	@override String get printPageIndicators => 'چاپ نشانگرهای صفحه';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsFa extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'خوانایی را برای خوانندگان کم بینا افزایش می دهد';
	@override String get editorAutoInvert => 'در حالت تاریک یادداشت‌ها را هوشمندانه تاریک می‌کند';
	@override String get editorOpaqueBackgrounds => 'حذف شفافیت از تصاویر پس زمینه و PDFها';
	@override String get preferGreyscale => 'برای نمایشگر های e-ink';
	@override String get autoClearWhiteboardOnExit => 'همچنان با دستگاه‌های دیگر شما همگام‌سازی می‌شود';
	@override String get maxImageSize => 'تصاویر بزرگتر از این فشرده خواهند شد';
	@override String get editorPromptRename => 'همیشه می توانید بعداً نام یادداشت ها را تغییر دهید';
	@override String get hideHomeBackgrounds => 'برای ظاهری تمیز تر';
	@override String get printPageIndicators => 'نمایش نشانگرهای صفحه در خروجی';
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

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerFa extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'یک رنگ انتخاب کنید';
}

// Path: settings.straightenDelay
class _StringsSettingsStraightenDelayFa extends _StringsSettingsStraightenDelayEn {
	_StringsSettingsStraightenDelayFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get off => 'خاموش';
	@override String get regular => 'منظم';
	@override String get slow => 'آهسته';
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
	@override String get encLoginFailed => 'ورود ناموفق بود، لطفا رمز عبور رمزگذاری خود را بررسی کنید';
	@override String get loginSuccess => 'با موفقیت وارد شدید لطفا تا راه اندازی صبر کنید ';
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
	@override String get a => '1. از Saber خارج شوید. قبل از خروج از سیستم مطمئن شوید که همگام‌سازی کامل شده است تا هیچ داده‌ای را از دست ندهید (پیشرفت همگام‌سازی را در صفحه اصلی ببینید).\n\n2. به وب سایت سرور خود بروید و پوشه \'Saber\' خود را حذف کنید. با این کار تمام یادداشت های شما از سرور حذف می شود.\n\n3. دوباره وارد سابر شوید. هنگام ورود به سیستم می‌توانید رمز رمزگذاری جدیدی انتخاب کنید.\n\n4. فراموش نکنید که از سیستم خارج شوید و در دستگاه های دیگر خود نیز دوباره وارد Saber شوید.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$Fa extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$Fa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get q => 'چگونه می توانم حساب کاربری خود را حذف کنم؟';
	@override String get a => 'روی دکمه "${_root.profile.quickLinks.deleteAccount}" در بالا ضربه بزنید و در صورت نیاز وارد شوید.\n\nاگر از سرور رسمی Saber استفاده می‌کنید، حساب شما پس از یک هفته مهلت حذف می‌شود. می‌توانید در این مدت با من در adilhanney@disroot.org تماس بگیرید تا حذف را لغو کنید.\n\nاگر از یک سرور شخص ثالث استفاده می‌کنید، ممکن است گزینه‌ای برای حذف حساب شما وجود نداشته باشد: باید با حفظ حریم خصوصی سرور مشورت کنید. سیاست برای اطلاعات بیشتر';
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
}

// Path: editor.penOptions
class _StringsEditorPenOptionsFa extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get size => 'اندازه';
	@override String get sizeDragHint => 'برای تغییر اندازه به چپ یا راست بکشید';
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

// Path: editor.menu
class _StringsEditorMenuFa extends _StringsEditorMenuEn {
	_StringsEditorMenuFa._(_StringsFa root) : this._root = root, super._(root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => '${page}/${totalPages} پاک کردن صفحه';
	@override String get clearAllPages => 'تمام صفحات را پاک کنید';
	@override String get insertPage => 'درج صفحه در زیر';
	@override String get duplicatePage => 'تکرار صفحه';
	@override String get deletePage => 'حذف صفحه';
	@override String get lineHeight => 'ارتفاع خط';
	@override String get lineHeightDescription => 'همچنین اندازه متن را کنترل می کند';
	@override String get backgroundImage => 'تصویر پس زمینه';
	@override String get backgroundPattern => 'الگوی پس زمینه';
	@override String get import => 'واردکردن';
	@override late final _StringsEditorMenuBoxFitsFa boxFits = _StringsEditorMenuBoxFitsFa._(_root);
	@override late final _StringsEditorMenuBgPatternsFa bgPatterns = _StringsEditorMenuBgPatternsFa._(_root);
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
	@override String get unlockPan => 'تحرک تک انگشتی را فعال کنید';
	@override String get lockPan => 'تحرک تک انگشتی را غیرفعال کنید';
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
	@override String get welcome => 'Bienvenue dans Saber';
	@override String get noFiles => 'Aucun fichier trouvé';
	@override String get createNewNote => 'Presser le bouton + pour créer une nouvelle note';
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
	@override late final _StringsSettingsAccentColorPickerFr accentColorPicker = _StringsSettingsAccentColorPickerFr._(_root);
	@override late final _StringsSettingsStraightenDelayFr straightenDelay = _StringsSettingsStraightenDelayFr._(_root);
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
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright (C) 2022-${buildYear}  Adil Hanney\nCe programme est livré sans aucune garantie. Il s\'agit d\'un logiciel libre, et vous pouvez le diffuser sous certaines conditions.';
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
	@override late final _StringsEditorImageOptionsFr imageOptions = _StringsEditorImageOptionsFr._(_root);
	@override late final _StringsEditorMenuFr menu = _StringsEditorMenuFr._(_root);
	@override late final _StringsEditorNewerFileFormatFr newerFileFormat = _StringsEditorNewerFileFormatFr._(_root);
	@override late final _StringsEditorQuillFr quill = _StringsEditorQuillFr._(_root);
	@override late final _StringsEditorHudFr hud = _StringsEditorHudFr._(_root);
	@override String get pages => 'Pages';
	@override String get untitled => 'Sans titre';
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
	@override String get browse => 'Toutes les notes';
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

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesFr extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get general => 'Général';
	@override String get layout => 'Disposition';
	@override String get writing => 'Tracé';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsFr extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Langue';
	@override String get appTheme => 'Thème de l\'application';
	@override String get platform => 'Type de thème';
	@override String get customAccentColor => 'Couleur d\'accentuation personnalisée';
	@override String get hyperlegibleFont => 'Fonte Hyperlegible';
	@override String get shouldCheckForUpdates => 'Rechercher automatiquement les mises à jour';
	@override String get shouldAlwaysAlertForUpdates => 'Me prévenir dès qu\'une mise à jour est disponible';
	@override String get editorToolbarAlignment => 'Position de la barre d\'outils';
	@override String get editorToolbarShowInFullscreen => 'Afficher la barre d\'outils en mode plein écran';
	@override String get editorAutoInvert => 'Inverser les couleurs en mode sombre';
	@override String get editorOpaqueBackgrounds => 'Fonds opaques';
	@override String get preferGreyscale => 'Préférer les nuances de gris';
	@override String get editorStraightenLines => 'Presser et maintenir le tracé pour obtenir une ligne droite';
	@override String get maxImageSize => 'Taille d\'image maximum';
	@override String get autoClearWhiteboardOnExit => 'Effacer le tableau blanc quand vous fermez l\'application';
	@override String get editorPromptRename => 'Vous rappeler de renommer les notes';
	@override String get hideHomeBackgrounds => 'Cacher le fond de la page d\'accueil';
	@override String get dontSavePresetColors => 'Ne pas conserver les couleurs pré-définies parmi les couleurs récentes';
	@override String get printPageIndicators => 'Imprimer les numéros de pages';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsFr extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'La fonte Atkinson Hyperlegible améliore la lisibilité pour les personnes malvoyantes';
	@override String get editorAutoInvert => 'Assombrit les notes de façon intelligente en mode sombre';
	@override String get editorOpaqueBackgrounds => 'Supprime la transparence du fond dans les images et les PDF';
	@override String get preferGreyscale => 'Pour les couleurs de stylos proposées';
	@override String get autoClearWhiteboardOnExit => 'Il restera synchronisé avec vos autres appareils';
	@override String get maxImageSize => 'Les images plus grandes seront compressées';
	@override String get editorPromptRename => 'Vous pourrez toujours les renommer plus tard';
	@override String get hideHomeBackgrounds => 'Pour une apparence plus sobre';
	@override String get printPageIndicators => 'Montrer les numéros de pages dans les exportations';
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

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerFr extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Choisir une couleur';
}

// Path: settings.straightenDelay
class _StringsSettingsStraightenDelayFr extends _StringsSettingsStraightenDelayEn {
	_StringsSettingsStraightenDelayFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get off => 'Desactivé';
	@override String get regular => 'Normal';
	@override String get slow => 'Lent';
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
	@override String get a => 'Le mot de passe de cryptage est utilisé pour crypter vos données avant qu\'elles ne soient envoyées au serveur. Vous le créez lors de votre première connexion à Saber, et il est indépendant de votre compte et de votre mot de passe sur Nextcloud.\n\nPersonne ne peut accéder à vos notes sur le serveur sans votre mot de passe de chiffrement. Cela implique aussi que si vous oubliez votre mot de passe de cryptage, vous perdrez l\'accès à vos données.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Fr extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Fr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Pourquoi utiliser deux mots de passe ?';
	@override String get a => 'Le mot de passe Nextcloud est utilisé pour accéder au nuage (cloud). Le mot de passe de cryptage "brouille" vos données avant même qu\'elles n\'atteignent le nuage.\n\nMême si quelqu\'un accède à votre compte Nextcloud, vos notes resteront sécurisées et cryptées avec un mot de passe distinct. Cela crée un deuxième niveau de sécurité pour protéger vos données.';
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
	@override String get a => '1. Déconnectez-vous de Saber. Assurez-vous que la synchronisation soit terminée avant de vous déconnecter afin de ne perdre aucune donnée (consultez la barre de progression sur l\'écran d\'accueil).\n\n2. Sur le site web du serveur supprimez votre dossier \'Saber\'. Cela supprimera toutes vos notes sur le serveur.\n\n3. Connectez-vous à nouveau dans Saber. Vous pourrez choisir un nouveau mot de passe de chiffrement à la connexion.\n\n4. N\'oubliez pas de vous déconnecter et vous re-connecter dans Saber sur votre poste également.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$Fr extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$Fr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Comment puis-je supprimer mon compte ?';
	@override String get a => 'Cliquez sur le button "${_root.profile.quickLinks.deleteAccount}" ci-dessus, et connectez-vous si nécessaire.\n\nSi vous utilisez le serveur Saber officiel, votre compte sera supprimé au bout d\'une semaine . Durant cette période, vous pourrez me contacter à adilhanney@disroot.org pour annuler la suppression.\n\nSi vous utilisez un autre serveur, il n\'est pas certain que vous puissiez supprimer votre compte dessus : il vous faudra consulter les règles de confidentialité du serveur pour plus d\'informations.';
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
}

// Path: editor.penOptions
class _StringsEditorPenOptionsFr extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsFr._(_StringsFr root) : this._root = root, super._(root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get size => 'Taille';
	@override String get sizeDragHint => 'Glisser vers la gauche ou la droite pour changer la taille';
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
	@override String get backgroundImage => 'Image de fond';
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
	@override String get unlockPan => 'Activer le défilement à un seul doigt';
	@override String get lockPan => 'Désactiver le défilement à un seul doigt';
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
	@override String get cornell => 'Cornell';
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
	@override String get welcome => 'Üdvözli a Saber';
	@override String get noFiles => 'Nem található ilyen fájl';
	@override String get createNewNote => 'Kattintson a + gombora egy új jegyzet létrehozásához';
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
	@override late final _StringsSettingsAccentColorPickerHu accentColorPicker = _StringsSettingsAccentColorPickerHu._(_root);
	@override late final _StringsSettingsStraightenDelayHu straightenDelay = _StringsSettingsStraightenDelayHu._(_root);
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
	];
}

// Path: appInfo
class _StringsAppInfoHu extends _StringsAppInfoEn {
	_StringsAppInfoHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber Copyright (C) 2022-${buildYear} Adil Hanney \nEz a program nem tartalmaz semmilyen garanciát. Ez egy szabad szoftver, és bizonyos feltételek mellett szabadon terjeszthető.';
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
	@override String get updateAvailableDescription => 'A szoftver egy új verziója elérhető';
	@override String get update => 'Frissítés';
}

// Path: editor
class _StringsEditorHu extends _StringsEditorEn {
	_StringsEditorHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarHu toolbar = _StringsEditorToolbarHu._(_root);
	@override late final _StringsEditorPensHu pens = _StringsEditorPensHu._(_root);
	@override late final _StringsEditorPenOptionsHu penOptions = _StringsEditorPenOptionsHu._(_root);
	@override late final _StringsEditorImageOptionsHu imageOptions = _StringsEditorImageOptionsHu._(_root);
	@override late final _StringsEditorMenuHu menu = _StringsEditorMenuHu._(_root);
	@override late final _StringsEditorNewerFileFormatHu newerFileFormat = _StringsEditorNewerFileFormatHu._(_root);
	@override late final _StringsEditorQuillHu quill = _StringsEditorQuillHu._(_root);
	@override late final _StringsEditorHudHu hud = _StringsEditorHudHu._(_root);
	@override String get pages => 'Oldalak';
	@override String get untitled => 'Névtelen';
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
	@override String get browse => 'Minden jegyzet';
	@override String get whiteboard => 'Whiteboard';
	@override String get settings => 'Beállítások';
}

// Path: home.tooltips
class _StringsHomeTooltipsHu extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Új jegyzet';
	@override String get showUpdateDialog => 'Frissítési párbeszédablak megjelenítése';
}

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesHu extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get general => 'Általános';
	@override String get layout => 'Elrendezés';
	@override String get writing => 'Írás';
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
	@override String get shouldAlwaysAlertForUpdates => 'Értesítsen a frissítésekről, amint azok elérhetővé válnak';
	@override String get editorToolbarAlignment => 'A szerkesztő eszköztár igazítása';
	@override String get editorToolbarShowInFullscreen => 'A szerkesztő eszköztár megjelenítése teljes képernyős módban';
	@override String get editorAutoInvert => 'Jegyzetek színének felcserélése sötét módban';
	@override String get editorOpaqueBackgrounds => 'Áttetsző hátterek';
	@override String get preferGreyscale => 'Szürkeárnyalatos színek előnyben részesítése';
	@override String get editorStraightenLines => 'Nyomja meg és tartsa lenyomva egy vonal kiegyenesítéséhez';
	@override String get maxImageSize => 'Maximális képméret';
	@override String get autoClearWhiteboardOnExit => 'A tábla törlése az alkalmazásból való kilépés után';
	@override String get editorPromptRename => 'Új jegyzetek átnevezésére való felszólítás';
	@override String get hideHomeBackgrounds => 'Hátterek elrejtése a kezdőképernyőn';
	@override String get dontSavePresetColors => 'Ne mentse az előre beállított színeket a legutóbbi színek között';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsHu extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Az Atkinson Hyperlegible növeli az olvashatóságot a gyengén látók számára';
	@override String get editorAutoInvert => 'Intelligens módon sötétíti a jegyzeteket sötét módban';
	@override String get editorOpaqueBackgrounds => 'Átlátszóság eltávolítása a háttérképről és a PDF-ekből';
	@override String get preferGreyscale => 'E-tinta kijelzőkhöz';
	@override String get autoClearWhiteboardOnExit => 'Továbbra is szinkronizálva lesz a többi eszközzel';
	@override String get maxImageSize => 'Az ennél nagyobb képek tömörítve lesznek';
	@override String get editorPromptRename => 'A jegyzeteket később bármikor átnevezheti';
	@override String get hideHomeBackgrounds => 'Egy letisztultabb megjelenítésért';
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

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerHu extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Szín kiválasztása';
}

// Path: settings.straightenDelay
class _StringsSettingsStraightenDelayHu extends _StringsSettingsStraightenDelayEn {
	_StringsSettingsStraightenDelayHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get off => 'Ki';
	@override String get regular => 'Normál';
	@override String get slow => 'Lassú';
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
	@override String get q => 'Mi az a Nextclound?';
	@override String get a => 'A Nextcloud többek között egy privát fájlszinkronizáló szerver. Használhatja a Saber Nextcloud alapértelmezett kiszolgálóját, használhat egy harmadik féltől származó kiszolgálót, vagy saját szerverét, hogy teljes körű felügyeletet biztosítson adatai felett.';
}

// Path: login.faq.1
class _StringsLogin$faq$0i1$Hu extends _StringsLogin$faq$0i1$En {
	_StringsLogin$faq$0i1$Hu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Mi az a titkosítási jelszó?';
	@override String get a => 'nki sem férhet hozzá a szerveren lévő jegyzetekhez. Ez azt is jelenti, hogy ha elfelejti a titkosítási jelszavát, elveszíti a hozzáférést az adataihoz.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Hu extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Hu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Miért használjon két jelszót?';
	@override String get a => 'A Nextcloud jelszóval lehet hozzáférni a felhőszolgáltatáshoz. A titkosítási jelszó " titkosítja" az adatait, mielőtt azok egyáltalán eljutnának a felhőbe. \n\nMég ha valaki hozzáférne is a Nextcloud-fiókjához, a jegyzetei biztonságban maradnak, és külön jelszóval titkosítva lesznek. Ez egy második biztonsági szintet biztosít adatai védelméhez.';
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
}

// Path: editor.penOptions
class _StringsEditorPenOptionsHu extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String get size => 'Méret';
	@override String get sizeDragHint => 'Húzza balra vagy jobbra a méret megváltoztatásához';
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
}

// Path: editor.menu
class _StringsEditorMenuHu extends _StringsEditorMenuEn {
	_StringsEditorMenuHu._(_StringsHu root) : this._root = root, super._(root);

	@override final _StringsHu _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Oldal törlése ${page}/${totalPages}';
	@override String get clearAllPages => 'Összes oldal törlése';
	@override String get lineHeight => 'Vonalmagasság';
	@override String get backgroundImage => 'Háttérkép';
	@override String get backgroundPattern => 'Háttérminta';
	@override String get import => 'Importálás';
	@override late final _StringsEditorMenuBoxFitsHu boxFits = _StringsEditorMenuBoxFitsHu._(_root);
	@override late final _StringsEditorMenuBgPatternsHu bgPatterns = _StringsEditorMenuBgPatternsHu._(_root);
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
	@override String get unlockPan => 'Egyujjas lapozás engedélyezése';
	@override String get lockPan => 'Egyujjas lapozás letiltása';
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
	@override String get welcome => 'Benvenuto su Saber';
	@override String get noFiles => 'Nessun file trovato';
	@override String get createNewNote => 'Tocca il pulsante + per creare una nuova nota';
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
	@override late final _StringsSettingsAccentColorPickerIt accentColorPicker = _StringsSettingsAccentColorPickerIt._(_root);
	@override late final _StringsSettingsStraightenDelayIt straightenDelay = _StringsSettingsStraightenDelayIt._(_root);
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
	@override String licenseNotice({required Object buildYear}) => 'Saber Copyright (C) 2022-${buildYear} Adil Hanney\nQuesto programma non ha alcuna garanzia. Questo è un software libero e sei libero di ridistribuirlo a determinate condizioni.';
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
	@override late final _StringsEditorImageOptionsIt imageOptions = _StringsEditorImageOptionsIt._(_root);
	@override late final _StringsEditorMenuIt menu = _StringsEditorMenuIt._(_root);
	@override late final _StringsEditorNewerFileFormatIt newerFileFormat = _StringsEditorNewerFileFormatIt._(_root);
	@override late final _StringsEditorQuillIt quill = _StringsEditorQuillIt._(_root);
	@override late final _StringsEditorHudIt hud = _StringsEditorHudIt._(_root);
	@override String get pages => 'Pagine';
	@override String get untitled => 'Senza titolo';
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

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesIt extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get general => 'Generale';
	@override String get layout => 'Layout';
	@override String get writing => 'Scrittura';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsIt extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Lingua app';
	@override String get appTheme => 'Tema dell\'app';
	@override String get platform => 'Tipo di tema';
	@override String get customAccentColor => 'Colore personalizzato';
	@override String get hyperlegibleFont => 'Carattere iperleggibile';
	@override String get shouldCheckForUpdates => 'Controlla automaticamente gli aggiornamenti di Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Segnalami aggiornamenti non appena sono disponibili';
	@override String get editorToolbarAlignment => 'Allineamento della barra degli strumenti dell\'editor';
	@override String get editorToolbarShowInFullscreen => 'Mostra la barra degli strumenti dell\'editor in modalità a schermo intero';
	@override String get editorAutoInvert => 'Inverti le note in modalità scura';
	@override String get editorOpaqueBackgrounds => 'Sfondi opachi';
	@override String get preferGreyscale => 'Preferisci i colori in scala di grigi';
	@override String get editorStraightenLines => 'Tenere premuto per raddrizzare una linea';
	@override String get maxImageSize => 'Dimensione massima dell\'immagine';
	@override String get autoClearWhiteboardOnExit => 'Svuota la lavagna dopo essere uscito dall\'app';
	@override String get editorPromptRename => 'Richiede di rinominare nuove note';
	@override String get hideHomeBackgrounds => 'Nascondi gli sfondi nella schermata iniziale';
	@override String get dontSavePresetColors => 'Non salvare i colori preimpostati nei colori recenti';
	@override String get printPageIndicators => 'Stampa indicatori di pagina';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsIt extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible aumenta la leggibilità per i lettori ipovedenti';
	@override String get editorAutoInvert => 'Scurisce in modo intelligente le note in modalità scura';
	@override String get editorOpaqueBackgrounds => 'Rimuovi la trasparenza dalle immagini di sfondo e dai PDF';
	@override String get preferGreyscale => 'Per display e-ink';
	@override String get autoClearWhiteboardOnExit => 'Sarà comunque sincronizzato con gli altri tuoi dispositivi';
	@override String get maxImageSize => 'Le immagini più grandi verranno compresse';
	@override String get editorPromptRename => 'Puoi sempre rinominare le note in un secondo momento';
	@override String get hideHomeBackgrounds => 'Per un aspetto più pulito';
	@override String get printPageIndicators => 'Mostra indicatori di pagina nelle esportazioni';
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

// Path: settings.straightenDelay
class _StringsSettingsStraightenDelayIt extends _StringsSettingsStraightenDelayEn {
	_StringsSettingsStraightenDelayIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get off => 'Off';
	@override String get regular => 'Regolare';
	@override String get slow => 'Lento';
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
	@override String get a => 'La password di crittografia viene utilizzata per crittografare i dati prima che vengano inviati al server. Lo scegli quando accedi per la prima volta a Saber e non è correlato al tuo account/password Nextcloud.\n\nNessuno può accedere alle tue note sul server senza la tua password di crittografia. Ciò significa anche che se dimentichi la password di crittografia, perderai l\'accesso ai tuoi dati.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$It extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$It._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Perché usare due password?';
	@override String get a => 'La password Nextcloud viene utilizzata per accedere al cloud. La password di crittografia "codifica" i tuoi dati prima che raggiungano il cloud.\n\nAnche se qualcuno riesce ad accedere al tuo account Nextcloud, le tue note rimarranno al sicuro e crittografate con una password separata. Questo ti fornisce un secondo livello di sicurezza per proteggere i tuoi dati.';
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
	@override String get a => '1. Disconnettersi da Saber. Assicurati che la sincronizzazione sia completa prima di uscire in modo da non perdere alcun dato (vedi l\'avanzamento della sincronizzazione nella schermata iniziale).\n\n2. Vai al sito Web del tuo server ed elimina la cartella "Saber". Questo eliminerà tutte le tue note dal server.\n\n3. Accedi nuovamente a Saber. Puoi scegliere una nuova password di crittografia quando accedi.\n\n4. Non dimenticare di disconnetterti e accedere nuovamente a Saber anche sugli altri tuoi dispositivi.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$It extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$It._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Come posso eliminare il mio account?';
	@override String get a => 'Tocca il pulsante "${_root.profile.quickLinks.deleteAccount}" in alto e, se necessario, accedi.\n\nSe stai utilizzando il server Saber ufficiale, il tuo account verrà eliminato dopo un periodo di tolleranza di 1 settimana. Puoi contattarmi all\'indirizzo adilhanney@disroot.org durante questo periodo per annullare l\'eliminazione.\n\nSe stai utilizzando un server di terze parti, potrebbe non esserci un\'opzione per eliminare il tuo account: dovrai consultare la politica sulla privacy del server per ulteriori informazioni.';
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
	@override String get download => 'Download';
	@override String get setAsBackground => 'Imposta come sfondo';
	@override String get removeAsBackground => 'Rimuovi come sfondo';
	@override String get delete => 'Cancella';
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
	@override String get backgroundImage => 'Immagine di sfondo';
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
	@override String get unlockPan => 'Attiva la panoramica con un solo dito';
	@override String get lockPan => 'Disabilita la panoramica con un solo dito';
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
	@override String get staffs => 'Personale';
	@override String get cornell => 'Metodo Cornell';
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
	@override String get welcome => 'Bem-vindo(a) ao Saber';
	@override String get noFiles => 'Nenhum arquivo encontrado';
	@override String get createNewNote => 'Toque no botão + para criar uma nova nota';
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
	@override late final _StringsSettingsAccentColorPickerPtBr accentColorPicker = _StringsSettingsAccentColorPickerPtBr._(_root);
	@override late final _StringsSettingsStraightenDelayPtBr straightenDelay = _StringsSettingsStraightenDelayPtBr._(_root);
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
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright (C) 2022-${buildYear}  Adil Hanney\nEste programa vem sem absolutamente nenhuma garantia. Este é um software livre e você pode redistribuí-lo sob certas condições.';
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
	@override late final _StringsEditorImageOptionsPtBr imageOptions = _StringsEditorImageOptionsPtBr._(_root);
	@override late final _StringsEditorMenuPtBr menu = _StringsEditorMenuPtBr._(_root);
	@override late final _StringsEditorNewerFileFormatPtBr newerFileFormat = _StringsEditorNewerFileFormatPtBr._(_root);
	@override late final _StringsEditorQuillPtBr quill = _StringsEditorQuillPtBr._(_root);
	@override late final _StringsEditorHudPtBr hud = _StringsEditorHudPtBr._(_root);
	@override String get pages => 'Páginas';
	@override String get untitled => 'Sem título';
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
	@override String get browse => 'Todas as notas';
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

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesPtBr extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get general => 'Geral';
	@override String get layout => 'Leiaute';
	@override String get writing => 'Escrita';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsPtBr extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Idioma do aplicativo';
	@override String get appTheme => 'Tema do aplicativo';
	@override String get platform => 'Tipo do tema';
	@override String get customAccentColor => 'Cor de destaque personalizada';
	@override String get hyperlegibleFont => 'Fonte hiperlegível';
	@override String get shouldCheckForUpdates => 'Verificar automaticamente as atualizações do Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Me informe sobre as atualizações assim que elas estiverem disponíveis';
	@override String get editorToolbarAlignment => 'Alinhamento da barra de ferramentas do editor';
	@override String get editorToolbarShowInFullscreen => 'Mostrar a barra de ferramentas do editor no modo de tela cheia';
	@override String get editorAutoInvert => 'Inverter as notas no modo escuro';
	@override String get editorOpaqueBackgrounds => 'Planos de fundo opacos';
	@override String get preferGreyscale => 'Preferir as cores em escala de cinza';
	@override String get editorStraightenLines => 'Pressione e segure para endireitar uma linha';
	@override String get maxImageSize => 'Tamanho máximo da imagem';
	@override String get autoClearWhiteboardOnExit => 'Limpar o quadro branco depois de sair do aplicativo';
	@override String get editorPromptRename => 'Solicitar que você renomeie novas notas';
	@override String get hideHomeBackgrounds => 'Ocultar planos de fundo na tela inicial';
	@override String get dontSavePresetColors => 'Não salvar as cores predefinidas nas cores recentes';
	@override String get printPageIndicators => 'Imprimir os indicadores de página';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsPtBr extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible aumenta a legibilidade para leitores com baixa visão';
	@override String get editorAutoInvert => 'Escurecer as notas de forma inteligente no modo escuro';
	@override String get editorOpaqueBackgrounds => 'Remover a transparência das imagens de plano de fundo e dos PDFs';
	@override String get preferGreyscale => 'Para telas e-ink';
	@override String get autoClearWhiteboardOnExit => 'Ainda será sincronizado com seus outros dispositivos';
	@override String get maxImageSize => 'Imagens maiores que isso serão compactadas';
	@override String get editorPromptRename => 'Você pode sempre renomear as notas mais tarde';
	@override String get hideHomeBackgrounds => 'Para uma aparência mais limpa';
	@override String get printPageIndicators => 'Mostrar os indicadores de página nas exportações';
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

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerPtBr extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Selecionar uma cor';
}

// Path: settings.straightenDelay
class _StringsSettingsStraightenDelayPtBr extends _StringsSettingsStraightenDelayEn {
	_StringsSettingsStraightenDelayPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get off => 'Desligado';
	@override String get regular => 'Normal';
	@override String get slow => 'Lento';
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
	@override String get a => 'A senha de criptografia é usada para criptografar os seus dados antes de eles serem enviados ao servidor. Você a escolhe quando faz login pela primeira vez no Saber, e ela não está relacionada à sua conta/senha do Nextcloud.\n\nNinguém pode acessar as suas notas no servidor sem a sua senha de criptografia. Isso também significa que, se você esquecer a sua senha de criptografia, perderá o acesso aos seus dados.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$PtBr extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$PtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Por que usar duas senhas?';
	@override String get a => 'A senha do Nextcloud é usada para acessar a nuvem. A senha de criptografia "embaralha" os seus dados antes que eles cheguem à nuvem.\n\nMesmo que alguém obtenha acesso à sua conta do Nextcloud, as suas notas permanecerão seguras e criptografadas com uma senha separada. Isso fornece uma segunda camada de segurança para proteger os seus dados.';
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
	@override String get a => '1. Saia da sua conta do Saber. Tenha certeza de que a sincronização foi finalizada antes de sair, de modo que você não perca nenhum dado (veja o progresso da sincronização na tela inicial).\n\n2. Vá para o website do seu servidor e apague a sua pasta do Saber. Isso apagará todas as suas notas do servidor.\n\n3. Faça login na sua conta do Saber. Você pode escolher uma nova senha de criptografia quando fizer login.\n\n4. Não se esqueça de sair e fazer login novamente no Saber em seus outros dispositivos também.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$PtBr extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$PtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Como eu posso apagar a minha conta?';
	@override String get a => 'Toque no "${_root.profile.quickLinks.deleteAccount}" botão acima, e faça login se necessário.\n\nSe você estiver usando o servidor oficial do Saber, a sua conta será apagada depois de um período de carência de uma semana. Você pode entrar em contato comigo em adilhanney@disroot.org durante esse período para cancelar a exclusão.\n\nSe você estiver usando um servidor de terceiros, pode ser que não haja uma opção de apagar a sua conta: você precisará consultar a política de privacidade do servidor para mais informações.';
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
}

// Path: editor.penOptions
class _StringsEditorPenOptionsPtBr extends _StringsEditorPenOptionsEn {
	_StringsEditorPenOptionsPtBr._(_StringsPtBr root) : this._root = root, super._(root);

	@override final _StringsPtBr _root; // ignore: unused_field

	// Translations
	@override String get size => 'Tamanho';
	@override String get sizeDragHint => 'Arraste para a esquerda ou para a direita para alterar o tamanho';
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
	@override String get backgroundImage => 'Imagem de plano de fundo';
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
	@override String get unlockPan => 'Ativar rolagem com um dedo';
	@override String get lockPan => 'Desativar rolagem com um dedo';
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
	@override late final _StringsEditorImageOptionsRu imageOptions = _StringsEditorImageOptionsRu._(_root);
	@override late final _StringsEditorMenuRu menu = _StringsEditorMenuRu._(_root);
	@override late final _StringsEditorNewerFileFormatRu newerFileFormat = _StringsEditorNewerFileFormatRu._(_root);
	@override late final _StringsEditorQuillRu quill = _StringsEditorQuillRu._(_root);
	@override late final _StringsEditorHudRu hud = _StringsEditorHudRu._(_root);
	@override String get pages => 'Листы';
	@override String get untitled => 'Без названия';
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
	@override String get shouldAlwaysAlertForUpdates => 'Сообщать об обновлениях, как только они станут доступны';
	@override String get editorToolbarAlignment => 'Панель инструментов редактора';
	@override String get editorToolbarShowInFullscreen => 'Показывать инструменты в полноэкранном режиме';
	@override String get editorAutoInvert => 'Инвертировать заметки в тёмном режиме';
	@override String get editorOpaqueBackgrounds => 'Непрозрачные фоны';
	@override String get preferGreyscale => 'Предпочтение оттенкам серого';
	@override String get editorStraightenLines => 'Нажать и удерживать, чтобы выпрямить линию';
	@override String get maxImageSize => 'Макс. размер изображения';
	@override String get autoClearWhiteboardOnExit => 'Очищать лист при выходе из приложения';
	@override String get editorPromptRename => 'Предлагать переименовывать новые заметки';
	@override String get hideHomeBackgrounds => 'Скрыть фон на главном экране';
	@override String get dontSavePresetColors => 'Не сохранять предустановленные цвета в последних цветах';
	@override String get printPageIndicators => 'Печатать номера страниц';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsRu extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Шрифт Atkinson Hyperlegible повышает разборчивость для читателей с плохим зрением';
	@override String get editorAutoInvert => 'Интеллектуально затемнять заметки в тёмном режиме';
	@override String get editorOpaqueBackgrounds => 'Удалить прозрачность фоновых изображений и PDF-файлов';
	@override String get preferGreyscale => 'Для e-ink экранов';
	@override String get autoClearWhiteboardOnExit => 'Это будет синхронизировано с другими вашими устройствами';
	@override String get maxImageSize => 'Большие изображения будут сжаты';
	@override String get editorPromptRename => 'Вы всегда можете переименовать заметки позже';
	@override String get hideHomeBackgrounds => 'Для чистого вида';
	@override String get printPageIndicators => 'Показывать номера страниц при экспорте';
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
	@override String get a => 'Пароль шифрования используется для шифрования ваших данных перед их отправкой на сервер. Вы выбираете его при первом входе в Saber, и он не связан с вашей учетной записью/паролем Nextcloud.\n\nНикто не сможет получить доступ к вашим заметкам на сервере без вашего пароля шифрования. Это также означает, что если вы забудете пароль для шифрования, вы потеряете доступ к своим данным.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Ru extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Ru._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Зачем использовать два пароля?';
	@override String get a => 'Пароль Nextcloud используется для доступа к облаку. Пароль шифрования «шифрует» ваши данные еще до того, как они попадут в облако.\n\nДаже если кто-то получит доступ к вашей учетной записи Nextcloud, ваши заметки останутся в безопасности и будут зашифрованы с помощью отдельного пароля. Это обеспечивает вам второй уровень безопасности для защиты ваших данных.';
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
	@override String get a => '1. Выйдите из Saber. Перед выходом убедитесь, что синхронизация завершена, чтобы не потерять данные (см. синхронизацию на главном экране).\n\n2. Перейдите на веб-сайт своего сервера и удалите папку «Saber». Это приведет к удалению всех ваших заметок с сервера.\n\n3. Снова войдите в Saber. Вы можете создать новый пароль шифрования при входе в систему.\n\n4. Не забудьте выйти и снова войти в Saber на других своих устройствах.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$Ru extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$Ru._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Как я могу удалить свою учётную запись?';
	@override String get a => 'Нажмите кнопку "${_root.profile.quickLinks.deleteAccount}" выше и войдите в систему, если необходимо.\n\nЕсли вы используете официальный сервер Saber, ваша учётная запись будет удалена по истечении 1-недельного льготного периода. Вы можете связаться со мной по адресу adilhanney@disroot.org в течение этого периода, чтобы отменить удаление.\n\nЕсли вы используете сторонний сервер, то у вас может не быть возможности удалить свою учётную запись. Вам нужно будет ознакомиться с политикой конфиденциальности сервера, для получения дополнительной информации.';
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
	@override String get invertible => 'Инвертировать';
	@override String get download => 'Сохранить';
	@override String get setAsBackground => 'Сделать фоном';
	@override String get removeAsBackground => 'Удалить фон';
	@override String get delete => 'Удалить';
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
	@override String get backgroundImage => 'Фоновое изображение';
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
	@override String get unlockPan => 'Разрешить панораму одним пальцем';
	@override String get lockPan => 'Запретить панораму одним пальцем';
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
	@override String get welcome => 'Saber\'a hoş geldiniz';
	@override String get noFiles => 'Dosya yok';
	@override String get createNewNote => 'Yeni bir not oluşturmak için + butonuna tıklayınız';
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
	@override late final _StringsSettingsAccentColorPickerTr accentColorPicker = _StringsSettingsAccentColorPickerTr._(_root);
	@override late final _StringsSettingsStraightenDelayTr straightenDelay = _StringsSettingsStraightenDelayTr._(_root);
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
	@override late final _StringsEditorImageOptionsTr imageOptions = _StringsEditorImageOptionsTr._(_root);
	@override late final _StringsEditorMenuTr menu = _StringsEditorMenuTr._(_root);
	@override late final _StringsEditorNewerFileFormatTr newerFileFormat = _StringsEditorNewerFileFormatTr._(_root);
	@override late final _StringsEditorQuillTr quill = _StringsEditorQuillTr._(_root);
	@override late final _StringsEditorHudTr hud = _StringsEditorHudTr._(_root);
	@override String get pages => 'Sayfalar';
	@override String get untitled => 'İsimsiz';
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

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesTr extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get general => 'Genel';
	@override String get layout => 'Yerleşim';
	@override String get writing => 'Yazım';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsTr extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Uygulama dili';
	@override String get appTheme => 'Uygulama teması';
	@override String get platform => 'Tema tipi';
	@override String get customAccentColor => 'Farklı ana renk';
	@override String get hyperlegibleFont => 'Hyperlegible font';
	@override String get shouldCheckForUpdates => 'Otomatik olarak Saber güncellemelerini kontrol et';
	@override String get shouldAlwaysAlertForUpdates => 'Bir güncelleme mevcut olduğunda uyar';
	@override String get editorToolbarAlignment => 'Editör araç çubuğunun yerleşimi';
	@override String get editorToolbarShowInFullscreen => 'Editör araç kutusunu tam ekranda göster';
	@override String get editorAutoInvert => 'Karanlık temada notların rengini tersine çevir';
	@override String get editorOpaqueBackgrounds => 'Opak arkaplan';
	@override String get preferGreyscale => 'Gri tonlamayı tercih et';
	@override String get editorStraightenLines => 'Bir çizgiyi düzleştirmek için basılı tut';
	@override String get maxImageSize => 'Maksimum görsel boyutu';
	@override String get autoClearWhiteboardOnExit => 'Uygulamadan çıkıldığında beyaz tahtayı temizle';
	@override String get editorPromptRename => 'Notları yeniden adlandırmak için uyar';
	@override String get hideHomeBackgrounds => 'Ana ekranda arkaplanları gizle';
	@override String get dontSavePresetColors => 'Ön tanımlı renkleri son kullanılanlara kaydetme';
	@override String get printPageIndicators => 'Sayfa belirteçlerini yazdır';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsTr extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible, görme sorunu yaşayanların okumasını kolaylaştıran bir fonttur';
	@override String get editorAutoInvert => 'Karanlık modda notların rengini değiştirir';
	@override String get editorOpaqueBackgrounds => 'PDF\'ler ve arkaplan resimlerinden transparanlığı kaldırır';
	@override String get preferGreyscale => 'E-mürekkep ekranlar için';
	@override String get autoClearWhiteboardOnExit => 'Diğer cihazlarınıza senkronize edilmeye devam edecek';
	@override String get maxImageSize => 'Bundan daha büyük görseller sıkıştırılacak';
	@override String get editorPromptRename => 'Notlarınızı daha sonra da yeniden adlandırabilirsiniz';
	@override String get hideHomeBackgrounds => 'Daha sade bir görüntü için';
	@override String get printPageIndicators => 'Çıktılarda sayfa belirteçlerini göster';
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
	@override String get a => 'Şifreleme parolası, verilerinizin sunucuya yollanmadan önce şifrelenmesinde kullanılıyor. Saber\'a ilk defa giriş yaptığınızda bu parolayı ayarlayabilirsiniz ve bu parola Nextcloud hesabınız/parolanız ile alakalı değildir.\n\nŞifreleme parolanız olmadan sunucudaki notlarınıza kimse erişemez. Dolayısıyla eğer şifreleme parolanızı unutursanız verilerinize erişimi de kaybedersiniz.';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$Tr extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$Tr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Neden iki şifre kullanılıyor?';
	@override String get a => 'Nextcloud parolası bulut sunucuya erişmek için kullanılıyor. Şifreleme parolası, verilerinizin bulut sunucuya yollanmadan önce "karmaşıklaştırılması"nı sağlıyor.\n\nHerhangi birisi Nextcloud hesabınıza erişebilseydi bile, farklı bir şifreleme parolası kullandığınız için notlarınızı okuyamazdı. Böylece verilerinizin korunması için ikinci bir katman oluşuyor.';
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

// Path: profile.faq.0
class _StringsProfile$faq$0i0$Tr extends _StringsProfile$faq$0i0$En {
	_StringsProfile$faq$0i0$Tr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Çıkış yaparsam notlarımı kaybedecek miyim?';
	@override String get a => 'Hayır. Notlarınız hem cihazınızda hem de sunucuda saklanacak. Siz tekrar giriş yapıncaya dek sunucu ile senkronize edilmeyecekler. Çıkış yapmadan önce notların tamamının senkronize edildiğinden emin olun, yoksa veri kaybı yaşanabilir (senkronizasyon aşamasını ana ekranda görebilirsiniz).';
}

// Path: profile.faq.1
class _StringsProfile$faq$0i1$Tr extends _StringsProfile$faq$0i1$En {
	_StringsProfile$faq$0i1$Tr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nextcloud parolamı nasıl değiştireceğim?';
	@override String get a => 'Sunucunun websitesine gidip giriş yapın. Sonrasında Ayarlar > Güvenlik > Parolayı değiştir aşamalarını takip edin. Parolanızı değiştirdikten sonra Saber\'dan çıkış yapıp tekrar giriş yapmanız gerekecek.';
}

// Path: profile.faq.2
class _StringsProfile$faq$0i2$Tr extends _StringsProfile$faq$0i2$En {
	_StringsProfile$faq$0i2$Tr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Şifreleme parolamı nasıl değiştireceğim?';
	@override String get a => '1. Saber\'dan çıkış yapın. Çıkış yapmadan önce notların tamamının senkronize edildiğinden emin olun, yoksa veri kaybı yaşanabilir (senkronizasyon aşamasını ana ekranda görebilirsiniz).\n\n2. Sunucu websitesine gidin ve \'Saber\' klasörünü silin. Bu aşama ile sunucuda tutulan notlarınızın tamamı silinecek.\n\n3. Saber\'a tekrar giriş yapın. Giriş yaparken yeni bir şifreleme parolası belirleyebileceksiniz.\n\n4. Oturum açtığınız başka cihazlar varsa onlarda da Saber\'dan çıkış yapıp tekrar giriş yapmayı unutmayın.';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$Tr extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$Tr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Hesabımı nasıl sileceğim?';
	@override String get a => 'Sunucunun websitesine gidip giriş yapın. Sonrasında Ayarlar > Hesabı sil aşamalarını takip edin.\n\nEğer resmi Saber sunucusunu kullanıyorsanız hesabınız 1 haftalık bekleme süresinden sonra silinecektir. Bana adilhanney@disroot.org adresinden ulaşarak silme işlemini iptal edebilirsiniz.\n\nEğer üçüncü parti bir sunucu kullanıyorsanız hesabınızı silmeniz mümkün olmayabilir, daha fazla bilgi edinmek için ilgili sunucunun gizlilik politikasını incelemelisiniz.';
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
	@override String get setAsBackground => 'Arkaplan olarak ayarla';
	@override String get removeAsBackground => 'Arkaplanı kaldır';
	@override String get delete => 'Sil';
}

// Path: editor.menu
class _StringsEditorMenuTr extends _StringsEditorMenuEn {
	_StringsEditorMenuTr._(_StringsTr root) : this._root = root, super._(root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Sayfayı temizle ${page}/${totalPages}';
	@override String get clearAllPages => 'Tüm sayfaları temizle';
	@override String get lineHeight => 'Satır aralığı';
	@override String get lineHeightDescription => 'Metnin boyutunu da kontrol eder';
	@override String get backgroundImage => 'Arkaplan görseli';
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
	@override String get unlockPan => 'Tek parmakla kaydırma kilidini aç';
	@override String get lockPan => 'Tek parmakla kaydırmayı kilitle';
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
	@override String get welcome => '欢迎使用 Saber';
	@override String get noFiles => '未找到文件';
	@override String get createNewNote => '点击 + 按钮新建一个笔记';
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
	@override late final _StringsSettingsAccentColorPickerZhHansCn accentColorPicker = _StringsSettingsAccentColorPickerZhHansCn._(_root);
	@override late final _StringsSettingsStraightenDelayZhHansCn straightenDelay = _StringsSettingsStraightenDelayZhHansCn._(_root);
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
	];
}

// Path: appInfo
class _StringsAppInfoZhHansCn extends _StringsAppInfoEn {
	_StringsAppInfoZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  版权所有 (C) 2022-${buildYear}  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
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
	@override String get pages => '页面';
	@override String get untitled => '未命名';
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

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesZhHansCn extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get general => '通用';
	@override String get layout => '布局';
	@override String get writing => '书写';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsZhHansCn extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get locale => '应用语言';
	@override String get appTheme => '应用主题';
	@override String get platform => '主题类型';
	@override String get customAccentColor => '自定义主题色';
	@override String get hyperlegibleFont => '易读字体';
	@override String get shouldCheckForUpdates => '自动检查 Saber 更新';
	@override String get shouldAlwaysAlertForUpdates => '有可用更新时立即通知我';
	@override String get editorToolbarAlignment => '编辑工具栏对齐方式';
	@override String get editorToolbarShowInFullscreen => '在全屏模式中显示编辑菜单栏';
	@override String get editorAutoInvert => '在深色模式下使用反色笔记背景';
	@override String get editorOpaqueBackgrounds => '不透明背景';
	@override String get preferGreyscale => '使用灰度颜色';
	@override String get editorStraightenLines => '按住拉直线段';
	@override String get maxImageSize => '最大图片大小';
	@override String get autoClearWhiteboardOnExit => '离开应用后清除白板';
	@override String get editorPromptRename => '提示您重命名新笔记';
	@override String get hideHomeBackgrounds => '在主页隐藏背景';
	@override String get dontSavePresetColors => '不在最近使用的颜色中保存预设颜色';
	@override String get printPageIndicators => '打印页码';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsZhHansCn extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible 字体为低视力读者提高易读性';
	@override String get editorAutoInvert => '在深色模式下自动使用反色笔记背景';
	@override String get editorOpaqueBackgrounds => '移除背景图像和 PDF 的透明度';
	@override String get preferGreyscale => '用于电子墨水显示器';
	@override String get autoClearWhiteboardOnExit => '这将会同步到您的其他设备';
	@override String get maxImageSize => '更大的图片将会被压缩';
	@override String get editorPromptRename => '您可以总是稍后重命名笔记';
	@override String get hideHomeBackgrounds => '更简洁的外观';
	@override String get printPageIndicators => '在导出中显示页码';
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
	@override String get download => '下载';
	@override String get setAsBackground => '设为背景';
	@override String get delete => '删除';
}

// Path: editor.menu
class _StringsEditorMenuZhHansCn extends _StringsEditorMenuEn {
	_StringsEditorMenuZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => '清除页面 ${page}/${totalPages}';
	@override String get clearAllPages => '清除全部页面';
	@override String get lineHeight => '行高';
	@override String get lineHeightDescription => '同时控制文本大小';
	@override String get backgroundImage => '背景图片';
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
	@override String get unlockPan => '启用单指平移';
	@override String get lockPan => '禁用单指平移';
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
	@override String get lined => '横线';
	@override String get grid => '网格';
	@override String get dots => '点';
	@override String get staffs => '五线谱';
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
	@override String get welcome => '歡迎使用 Saber';
	@override String get noFiles => '未找到檔案';
	@override String get createNewNote => '點擊 + 按鈕新增一個筆記';
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
	@override late final _StringsSettingsAccentColorPickerZhHantTw accentColorPicker = _StringsSettingsAccentColorPickerZhHantTw._(_root);
	@override late final _StringsSettingsStraightenDelayZhHantTw straightenDelay = _StringsSettingsStraightenDelayZhHantTw._(_root);
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
	@override String licenseNotice({required Object buildYear}) => 'Saber  版權所有 (C) 2022-${buildYear}  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
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
	@override late final _StringsEditorImageOptionsZhHantTw imageOptions = _StringsEditorImageOptionsZhHantTw._(_root);
	@override late final _StringsEditorMenuZhHantTw menu = _StringsEditorMenuZhHantTw._(_root);
	@override late final _StringsEditorNewerFileFormatZhHantTw newerFileFormat = _StringsEditorNewerFileFormatZhHantTw._(_root);
	@override late final _StringsEditorQuillZhHantTw quill = _StringsEditorQuillZhHantTw._(_root);
	@override late final _StringsEditorHudZhHantTw hud = _StringsEditorHudZhHantTw._(_root);
	@override String get pages => '頁面';
	@override String get untitled => '無標題';
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

// Path: settings.prefCategories
class _StringsSettingsPrefCategoriesZhHantTw extends _StringsSettingsPrefCategoriesEn {
	_StringsSettingsPrefCategoriesZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get general => '一般';
	@override String get layout => '佈局';
	@override String get writing => '書寫';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsZhHantTw extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get locale => '應用程式語言';
	@override String get appTheme => '應用程式主題';
	@override String get platform => '主題類型';
	@override String get customAccentColor => '自訂主題色';
	@override String get hyperlegibleFont => '易讀字體';
	@override String get shouldCheckForUpdates => '自動檢查 Saber 更新';
	@override String get shouldAlwaysAlertForUpdates => '一有更新就告訴我';
	@override String get editorToolbarAlignment => '編輯器工具列的對齊方式';
	@override String get editorToolbarShowInFullscreen => '在全螢幕模式中顯示編輯器工具列';
	@override String get editorAutoInvert => '在深色模式下使用反色筆記背景';
	@override String get editorOpaqueBackgrounds => '不透明背景';
	@override String get preferGreyscale => '使用灰度顏色';
	@override String get editorStraightenLines => '按住拉直線條';
	@override String get maxImageSize => '最大圖片尺寸';
	@override String get autoClearWhiteboardOnExit => '退出應用程式後清除白板';
	@override String get editorPromptRename => '提醒您重新命名新筆記';
	@override String get hideHomeBackgrounds => '隱藏主畫面上的背景';
	@override String get dontSavePresetColors => '不要在最近的顏色中儲存預設顏色';
	@override String get printPageIndicators => '列印頁碼';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsZhHantTw extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible 字體為低視力讀者提高易讀性';
	@override String get editorAutoInvert => '在深色模式下自動使用反色筆記背景';
	@override String get editorOpaqueBackgrounds => '去除背景圖片和PDF的透明度';
	@override String get preferGreyscale => '用於電子紙螢幕';
	@override String get autoClearWhiteboardOnExit => '它仍會同步到您的其他裝置';
	@override String get maxImageSize => '大於此大小的圖片將被壓縮';
	@override String get editorPromptRename => '您以後隨時可以重新命名筆記';
	@override String get hideHomeBackgrounds => '為了更乾淨的外觀';
	@override String get printPageIndicators => '在匯出中顯示頁碼';
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
	@override String get a => '加密密碼用於在將資料傳送到伺服器之前對其進行加密。您在首次登入 Saber 時選擇它，它與您的 Nextcloud 帳戶/密碼無關。\n\n沒有您的加密密碼，任何人都無法訪問您在伺服器上的筆記。這也意味著，如果您忘記了加密密碼，您將無法訪問您的資料。';
}

// Path: login.faq.2
class _StringsLogin$faq$0i2$ZhHantTw extends _StringsLogin$faq$0i2$En {
	_StringsLogin$faq$0i2$ZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '為什麼要使用兩個密碼？';
	@override String get a => 'Nextcloud 密碼用於訪問雲端。而加密密碼會在您的資料到達雲端之前對其進行「加密」。\n\n即使有人獲得了您 Nextcloud 帳號的訪問權限，您的筆記也將保持安全並使用單獨的密碼進行加密。這為您提供了第二層安全保護來保護您的資料。';
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
	@override String get a => '1. 登出Saber，在登出前確保同步已經完成，這樣您就不會丟失任何資料（在主畫面上可以看到同步進度）。\n\n2. 進入您的伺服器網站並登入，刪除「Saber」資料夾，這將從伺服器上刪除您所有的筆記。\n\n3. 重新登入到Saber，您可以在登入時選擇一個新的加密密碼。\n\n4. 也不要忘記在您的其他裝置上登出並重新登入Saber。';
}

// Path: profile.faq.3
class _StringsProfile$faq$0i3$ZhHantTw extends _StringsProfile$faq$0i3$En {
	_StringsProfile$faq$0i3$ZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '如何刪除我的帳戶？';
	@override String get a => '點擊上面的「${_root.profile.quickLinks.deleteAccount}」按鈕，如果需要請登入。\n\n如果您使用的是官方Saber伺服器，您的帳戶將在一周的寬限期後被刪除，您可以在此期間由電子郵件聯繫我：adilhanney@disroot.org，以取消刪除。如果您使用的是第三方伺服器，則可能沒有刪除帳戶的選項，您需要查閱伺服器的隱私權政策以了解更多資訊。';
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
	@override String get download => '下載';
	@override String get setAsBackground => '設為背景';
	@override String get removeAsBackground => '移除作為背景';
	@override String get delete => '刪除';
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
	@override String get backgroundImage => '背景圖片';
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
	@override String get unlockPan => '啟用單指平移';
	@override String get lockPan => '禁用單指平移';
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
	@override String get cornell => '康乃爾';
}
