/// Generated file. Do not edit.
///
/// Locales: 7
/// Strings: 700 (100 per locale)
///
/// Built on 2022-12-29 at 22:47 UTC

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
	de(languageCode: 'de', build: _StringsDe.build),
	es(languageCode: 'es', build: _StringsEs.build),
	it(languageCode: 'it', build: _StringsIt.build),
	ru(languageCode: 'ru', build: _StringsRu.build),
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
/// String b = t['someKey.anotherKey']; // Only for edge cases!
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
/// String b = t['someKey.anotherKey']; // Only for edge cases!
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
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
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
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	late final _StringsHomeEn home = _StringsHomeEn._(_root);
	late final _StringsSettingsEn settings = _StringsSettingsEn._(_root);
	late final _StringsLoginEn login = _StringsLoginEn._(_root);
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
	late final _StringsSettingsPrefLabelsEn prefLabels = _StringsSettingsPrefLabelsEn._(_root);
	late final _StringsSettingsPrefDescriptionsEn prefDescriptions = _StringsSettingsPrefDescriptionsEn._(_root);
	late final _StringsSettingsThemeModesEn themeModes = _StringsSettingsThemeModesEn._(_root);
	late final _StringsSettingsAccentColorPickerEn accentColorPicker = _StringsSettingsAccentColorPickerEn._(_root);
	late final _StringsSettingsStraightenDelayEn straightenDelay = _StringsSettingsStraightenDelayEn._(_root);
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
		_StringsLogin0i0En._(_root),
		_StringsLogin0i1En._(_root),
		_StringsLogin0i2En._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoEn {
	_StringsAppInfoEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get licenseNotice => 'Saber  Copyright (C) 2022  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
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
	String get dismiss => 'Dismiss';
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

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get appTheme => 'App theme';
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
	String get confirm => 'Confirm';
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
class _StringsLogin0i0En {
	_StringsLogin0i0En._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get q => 'What is Nextcloud?';
	String get a => 'Nextcloud is a private file sync server, among other things. You can use the default Saber Nextcloud server, use a third-party server, or self-host your own for full control of your data.';
}

// Path: login.faq.1
class _StringsLogin0i1En {
	_StringsLogin0i1En._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get q => 'What is the encryption password?';
	String get a => 'The encryption password is used to encrypt your data before it is sent to the server. It is not stored on the server, and is only used by Saber to encrypt and decrypt your data.\n\nNo-one can access your notes on the server without your encryption password. This also means that if you forget your encryption password, you will lose access to your data.';
}

// Path: login.faq.2
class _StringsLogin0i2En {
	_StringsLogin0i2En._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get q => 'Why use two passwords?';
	String get a => 'The Nextcloud password is used to access the cloud. The encryption password "scrambles" your data before it ever reaches the cloud.\n\nEven if someone gains access to your Nextcloud account, your notes will remain safe and encrypted with a separate password. This provides you a second layer of security to protect your data.';
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
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

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
		_StringsLogin0i0De._(_root),
		_StringsLogin0i1De._(_root),
		_StringsLogin0i2De._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoDe extends _StringsAppInfoEn {
	_StringsAppInfoDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get licenseNotice => 'Saber  Copyright (C) 2022  Adil Hanney\nDieses Programm kommt ohne jegliche Gewährleistung. Dies ist freie Software und du bist herzlich eingeladen, diese unter bestimmten Bedingungen weiterzuverteilen.';
	@override String get debug => 'DEBUG';
	@override String get licenseButton => 'Hier tippen, um weitere Lizenzinformationen anzuzeigen';
	@override String get privacyPolicyButton => 'Hier tippen, um die Datenschutzrichtlinie anzuzeigen';
	@override String get sponsorButton => 'Hier tippen, um mich zu unterstützen oder mehr Speicherplatz zu kaufen';
}

// Path: update
class _StringsUpdateDe extends _StringsUpdateEn {
	_StringsUpdateDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Aktualisierung verfügbar';
	@override String get updateAvailableDescription => 'Eine neue Version der Anwendung ist verfügbar.';
	@override String get dismiss => 'Verwerfen';
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
	@override String get confirm => 'Bestätigen';
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
class _StringsLogin0i0De extends _StringsLogin0i0En {
	_StringsLogin0i0De._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Was ist Nextcloud?';
	@override String get a => 'Nextcloud ist unter andrem ein privater Dateisynchronisationsserver. Du kannst den Standard-Saber-Nextcloud-Server, einen Drittanbieter-, oder einen selbst-gehosteten Server verwenden, um volle Kontrolle über deine Daten zu behalten.';
}

// Path: login.faq.1
class _StringsLogin0i1De extends _StringsLogin0i1En {
	_StringsLogin0i1De._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Was ist das Verchlüsselungspasswort?';
	@override String get a => 'Das Verschlüsselungspassort wird verwendet, um deine Daten zu verschlüsseln, bevor diese an den Server gesendet werden. Es wird nicht auf dem Server gespeichert und nur von Saber verwendet, um deine Daten zu ver- und entschlüsseln.\n\nNiemand kann ohne dieses Passwort auf deine Notizen auf dem Server zugreifen. Das bedeutet allerdings auch, dass du, wenn du dein Verschlüsselungspasswort vergisst, den Zugriff auf deine Daten verlierst.';
}

// Path: login.faq.2
class _StringsLogin0i2De extends _StringsLogin0i2En {
	_StringsLogin0i2De._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Wieso zwei Passwörter?';
	@override String get a => 'Das Nextcloud-Passwort wird verwendet, um auf die Cloud zuzugreifen. Das Verschlüsselungspasswort "verwürfelt" deine Daten, bevor diese die Cloud erreichen.\n\nSelbst wenn jemand Zugriff zu deinem Nextcloud-Konto erlangt, bleiben deine Notizen sicher und verschlüsselt mit einem seperaten Passwort. Dies stellt eine zweite Sicherheitsebene zum Schutz deiner Daten dar.';
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
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

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
	@override late final _StringsSettingsPrefLabelsEs prefLabels = _StringsSettingsPrefLabelsEs._(_root);
	@override late final _StringsSettingsPrefDescriptionsEs prefDescriptions = _StringsSettingsPrefDescriptionsEs._(_root);
	@override late final _StringsSettingsThemeModesEs themeModes = _StringsSettingsThemeModesEs._(_root);
	@override late final _StringsSettingsAccentColorPickerEs accentColorPicker = _StringsSettingsAccentColorPickerEs._(_root);
	@override late final _StringsSettingsStraightenDelayEs straightenDelay = _StringsSettingsStraightenDelayEs._(_root);
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
		_StringsLogin0i0Es._(_root),
		_StringsLogin0i1Es._(_root),
		_StringsLogin0i2Es._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoEs extends _StringsAppInfoEn {
	_StringsAppInfoEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get licenseNotice => 'Saber  Copyright (C) 2022  Adil Hanney\nEste programa no tiene ninguna garantía. Es un software libre, y se puede redistribuir bajo ciertas condiciones.';
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
	@override String get dismiss => 'Ignorar';
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

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsEs extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get appTheme => 'Tema de la aplicación';
	@override String get customAccentColor => 'Color de acento personalizado';
	@override String get hyperlegibleFont => 'Fuente hiperlegible';
	@override String get shouldCheckForUpdates => 'Buscar actualizaciones de Saber automáticamente';
	@override String get editorToolbarOnBottom => 'Alinear la barra de herramientas del editor en la parte inferior';
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
	@override String get confirm => 'Confirmar';
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
class _StringsLogin0i0Es extends _StringsLogin0i0En {
	_StringsLogin0i0Es._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Qué es Nextcloud?';
	@override String get a => 'Nextcloud es un servidor privado de sincronización de archivos, entre otras cosas. Puede usar el servidor Sabre Nextcloud predeterminado, usar un servidor de terceros o alojar el tuyo propio para tener un control total de tus datos.';
}

// Path: login.faq.1
class _StringsLogin0i1Es extends _StringsLogin0i1En {
	_StringsLogin0i1Es._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Qué es la contraseña de cifrado?';
	@override String get a => 'La contraseña de cifrado se utiliza para cifrar tus datos antes de enviarlos al servidor. No se almacenan en el servidor y solo Saber lo utiliza para cifrar y descifrar sus datos.\n\nNadie puede acceder a sus notas en el servidor sin tu contraseña de cifrado. Esto también significa que si olvidas tu contraseña de cifrado, perderás el acceso a tus datos.';
}

// Path: login.faq.2
class _StringsLogin0i2Es extends _StringsLogin0i2En {
	_StringsLogin0i2Es._(_StringsEs root) : this._root = root, super._(root);

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
	@override String get toggleFingerDrawing => 'Dibujar con el dedo (Ctrl F)';
	@override String get undo => 'Deshacer';
	@override String get redo => 'Rehacer';
	@override String get export => 'Exportar (Ctrl Shift S)';
	@override String get exportAs => 'Exportar cómo:';
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
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <it>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _StringsIt _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeIt home = _StringsHomeIt._(_root);
	@override late final _StringsSettingsIt settings = _StringsSettingsIt._(_root);
	@override late final _StringsLoginIt login = _StringsLoginIt._(_root);
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
		_StringsLogin0i0It._(_root),
		_StringsLogin0i1It._(_root),
		_StringsLogin0i2It._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoIt extends _StringsAppInfoEn {
	_StringsAppInfoIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get licenseNotice => 'Sabre Copyright (C) 2022 Adil Hanney\nQuesto programma non ha alcuna garanzia. Questo è un software libero e sei libero di ridistribuirlo a determinate condizioni.';
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
	@override String get dismiss => 'Abbandona';
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
	@override String get confirm => 'Conferma';
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

// Path: login.feedbacks
class _StringsLoginFeedbacksIt extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get checkUsername => 'Ricontrolla il tuo nome utente o e-mail.';
	@override String get enterNcPassword => 'Inserisci la tua password Nextcloud.';
	@override String get enterEncPassword => 'Inserisci la tua password di crittografata.';
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
class _StringsLogin0i0It extends _StringsLogin0i0En {
	_StringsLogin0i0It._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Cos\'è Nextcloud?';
	@override String get a => 'Nextcloud è, tra le altre cose, un server di sincronizzazione file privato. Puoi utilizzare il server Saber Nextcloud predefinito, utilizzare un server di terze parti o ospitare autonomamente il tuo per il pieno controllo dei tuoi dati.';
}

// Path: login.faq.1
class _StringsLogin0i1It extends _StringsLogin0i1En {
	_StringsLogin0i1It._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Cos\'è la password di crittografia?';
	@override String get a => 'La password di crittografia viene utilizzata per crittografare i dati prima che vengano inviati al server. Non è archiviato sul server e viene utilizzato solo da Sabre per crittografare e decrittografare i tuoi dati.\n\nNessuno può accedere alle tue note sul server senza la tua password di crittografia. Ciò significa anche che se dimentichi la password di crittografia, perderai l\'accesso ai tuoi dati.';
}

// Path: login.faq.2
class _StringsLogin0i2It extends _StringsLogin0i2En {
	_StringsLogin0i2It._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Perché usare due password?';
	@override String get a => 'La password Nextcloud viene utilizzata per accedere al cloud. La password di crittografia "codifica" i tuoi dati prima che raggiungano il cloud.\n\nAnche se qualcuno riesce ad accedere al tuo account Nextcloud, le tue note rimarranno al sicuro e crittografate con una password separata. Questo ti fornisce un secondo livello di sicurezza per proteggere i tuoi dati.';
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
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _StringsRu _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeRu home = _StringsHomeRu._(_root);
	@override late final _StringsSettingsRu settings = _StringsSettingsRu._(_root);
	@override late final _StringsLoginRu login = _StringsLoginRu._(_root);
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
	@override late final _StringsSettingsPrefLabelsRu prefLabels = _StringsSettingsPrefLabelsRu._(_root);
	@override late final _StringsSettingsPrefDescriptionsRu prefDescriptions = _StringsSettingsPrefDescriptionsRu._(_root);
	@override late final _StringsSettingsThemeModesRu themeModes = _StringsSettingsThemeModesRu._(_root);
	@override late final _StringsSettingsAccentColorPickerRu accentColorPicker = _StringsSettingsAccentColorPickerRu._(_root);
	@override late final _StringsSettingsStraightenDelayRu straightenDelay = _StringsSettingsStraightenDelayRu._(_root);
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
		_StringsLogin0i0Ru._(_root),
		_StringsLogin0i1Ru._(_root),
		_StringsLogin0i2Ru._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoRu extends _StringsAppInfoEn {
	_StringsAppInfoRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get licenseNotice => 'Saber  Copyright (C) 2022  Adil Hanney\nЭта программа поставляется без каких-либо гарантий. Это бесплатное программное обеспечение, и вы можете распространять его при определенных условиях.';
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
	@override String get dismiss => 'Отказаться';
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

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsRu extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsRu._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get appTheme => 'Тема оформления';
	@override String get customAccentColor => 'Свой цвет акцента';
	@override String get hyperlegibleFont => 'Гипер разборчивый шрифт';
	@override String get shouldCheckForUpdates => 'Автоматически проверять обновления Saber';
	@override String get editorToolbarOnBottom => 'Выровнять панель инструментов редактора по нижнему краю';
	@override String get editorToolbarShowInFullscreen => 'Show the editor toolbar in fullscreen mode';
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
	@override String get confirm => 'Подтвердить';
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
class _StringsLogin0i0Ru extends _StringsLogin0i0En {
	_StringsLogin0i0Ru._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Что такое Nextcloud?';
	@override String get a => 'Nextcloud — это частный сервер синхронизации файлов, помимо всего прочего. Вы можете использовать сервер Sabre Nextcloud по умолчанию, использовать сторонний сервер или самостоятельно разместить свой собственный для полного контроля над своими данными.';
}

// Path: login.faq.1
class _StringsLogin0i1Ru extends _StringsLogin0i1En {
	_StringsLogin0i1Ru._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Что такое пароль шифрования?';
	@override String get a => 'Пароль шифрования используется для шифрования ваших данных перед отправкой их на сервер. Он не хранится на сервере и используется Sabre только для шифрования и расшифровки ваших данных.\n\nНикто не может получить доступ к вашим заметкам на сервере без вашего пароля шифрования. Это также означает, что если вы забудете пароль для шифрования, вы потеряете доступ к своим данным.';
}

// Path: login.faq.2
class _StringsLogin0i2Ru extends _StringsLogin0i2En {
	_StringsLogin0i2Ru._(_StringsRu root) : this._root = root, super._(root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Зачем использовать два пароля?';
	@override String get a => 'Пароль Nextcloud используется для доступа к облаку. Пароль шифрования «шифрует» ваши данные еще до того, как они попадут в облако.\n\nДаже если кто-то получит доступ к вашей учетной записи Nextcloud, ваши заметки останутся в безопасности и будут зашифрованы с помощью отдельного пароля. Это обеспечивает вам второй уровень безопасности для защиты ваших данных.';
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
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-Hans-CN>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

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
		_StringsLogin0i0ZhHansCn._(_root),
		_StringsLogin0i1ZhHansCn._(_root),
		_StringsLogin0i2ZhHansCn._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoZhHansCn extends _StringsAppInfoEn {
	_StringsAppInfoZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get licenseNotice => 'Saber  版权所有 (C) 2022  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
	@override String get debug => 'DEBUG';
	@override String get licenseButton => '点击此处查看更多许可证信息';
	@override String get privacyPolicyButton => '点击此处查看隐私政策';
	@override String get sponsorButton => '点击此处赞助我或购买更多存储空间';
}

// Path: update
class _StringsUpdateZhHansCn extends _StringsUpdateEn {
	_StringsUpdateZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => '可用更新';
	@override String get updateAvailableDescription => '该应用程序的新版本可用。';
	@override String get dismiss => '忽略';
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
	@override String get confirm => '确定';
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
class _StringsLogin0i0ZhHansCn extends _StringsLogin0i0En {
	_StringsLogin0i0ZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nextcloud 是什么？';
	@override String get a => 'Nextcloud 是一个私人文件同步服务器。您可以使用默认的 Saber Nextcloud 服务器、使用第三方服务器或自行托管您自己的服务器以完全控制您的数据。';
}

// Path: login.faq.1
class _StringsLogin0i1ZhHansCn extends _StringsLogin0i1En {
	_StringsLogin0i1ZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

	@override final _StringsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '加密密码是什么？';
	@override String get a => '加密密码用于在将数据发送到服务器之前对其进行加密。它不存储在服务器上，仅供 Saber 用来加密和解密您的数据。\n\n没有您的加密密码，任何人都无法访问您在服务器上的笔记。这也意味着，如果您忘记了加密密码，您将无法访问您的数据。';
}

// Path: login.faq.2
class _StringsLogin0i2ZhHansCn extends _StringsLogin0i2En {
	_StringsLogin0i2ZhHansCn._(_StringsZhHansCn root) : this._root = root, super._(root);

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
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-Hant-TW>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _StringsZhHantTw _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeZhHantTw home = _StringsHomeZhHantTw._(_root);
	@override late final _StringsSettingsZhHantTw settings = _StringsSettingsZhHantTw._(_root);
	@override late final _StringsLoginZhHantTw login = _StringsLoginZhHantTw._(_root);
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
		_StringsLogin0i0ZhHantTw._(_root),
		_StringsLogin0i1ZhHantTw._(_root),
		_StringsLogin0i2ZhHantTw._(_root),
	];
}

// Path: appInfo
class _StringsAppInfoZhHantTw extends _StringsAppInfoEn {
	_StringsAppInfoZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get licenseNotice => 'Saber  版權所有 (C) 2022  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
	@override String get debug => 'DEBUG';
	@override String get licenseButton => '點擊此處查看更多許可證資訊';
	@override String get privacyPolicyButton => '點擊此處查看隱私權政策';
	@override String get sponsorButton => '點擊此處贊助我或購買更多儲存空間';
}

// Path: update
class _StringsUpdateZhHantTw extends _StringsUpdateEn {
	_StringsUpdateZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => '可用更新';
	@override String get updateAvailableDescription => '該應用程式的新版本可用。';
	@override String get dismiss => '忽略';
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
	@override String get confirm => '確定';
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
class _StringsLogin0i0ZhHantTw extends _StringsLogin0i0En {
	_StringsLogin0i0ZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '什麼是 Nextcloud？';
	@override String get a => 'Nextcloud 是一個私人檔案同步伺服器。 您可以使用預設的 Sabre Nextcloud 伺服器或、使用第三方伺服器或自行託管您的伺服器以完全控制您的資料。';
}

// Path: login.faq.1
class _StringsLogin0i1ZhHantTw extends _StringsLogin0i1En {
	_StringsLogin0i1ZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

	@override final _StringsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '加密密碼是什麼？';
	@override String get a => '加密密碼用於在將資料傳送到伺服器之前對其進行加密。 它不存儲在伺服器上，僅供 Saber 用來加密和解密您的資料。\n\n沒有您的加密密碼，任何人都無法訪問您儲存在伺服器上的筆記。 這也意味著，如果您忘記了加密密碼，您將無法訪問您的資料。';
}

// Path: login.faq.2
class _StringsLogin0i2ZhHantTw extends _StringsLogin0i2En {
	_StringsLogin0i2ZhHantTw._(_StringsZhHantTw root) : this._root = root, super._(root);

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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.tabs.home': return 'Home';
			case 'home.tabs.browse': return 'Browse';
			case 'home.tabs.whiteboard': return 'Whiteboard';
			case 'home.tabs.settings': return 'Settings';
			case 'home.titles.home': return 'Recent notes';
			case 'home.titles.browse': return 'All notes';
			case 'home.titles.whiteboard': return 'Whiteboard';
			case 'home.titles.settings': return 'Settings';
			case 'home.tooltips.newNote': return 'New note';
			case 'home.tooltips.showUpdateDialog': return 'Show update dialog';
			case 'home.backFolder': return '(Back)';
			case 'home.welcome': return 'Welcome to Saber';
			case 'home.noFiles': return 'No files found';
			case 'home.createNewNote': return 'Tap the + button to create a new note';
			case 'settings.prefLabels.appTheme': return 'App theme';
			case 'settings.prefLabels.customAccentColor': return 'Custom accent color';
			case 'settings.prefLabels.hyperlegibleFont': return 'Hyperlegible font';
			case 'settings.prefLabels.shouldCheckForUpdates': return 'Automatically check for Saber updates';
			case 'settings.prefLabels.editorToolbarOnBottom': return 'Align the editor toolbar to the bottom';
			case 'settings.prefLabels.editorToolbarShowInFullscreen': return 'Show the editor toolbar in fullscreen mode';
			case 'settings.prefLabels.editorAutoInvert': return 'Invert notes in dark mode';
			case 'settings.prefLabels.preferGreyscale': return 'Prefer greyscale colors';
			case 'settings.prefLabels.editorStraightenLines': return 'Press and hold to straighten a line';
			case 'settings.prefLabels.autoClearWhiteboardOnExit': return 'Clear the whiteboard after you exit the app';
			case 'settings.prefLabels.editorPromptRename': return 'Prompt you to rename new notes';
			case 'settings.prefDescriptions.hyperlegibleFont': return 'Atkinson Hyperlegible increases legibility for readers with low vision';
			case 'settings.prefDescriptions.editorAutoInvert': return 'Smartly darkens notes in dark mode';
			case 'settings.prefDescriptions.preferGreyscale': return 'For e-ink displays';
			case 'settings.prefDescriptions.autoClearWhiteboardOnExit': return 'It will still be synced to your other devices';
			case 'settings.prefDescriptions.editorPromptRename': return 'You can always rename notes later';
			case 'settings.themeModes.system': return 'System';
			case 'settings.themeModes.light': return 'Light';
			case 'settings.themeModes.dark': return 'Dark';
			case 'settings.accentColorPicker.pickAColor': return 'Pick a color';
			case 'settings.accentColorPicker.confirm': return 'Confirm';
			case 'settings.straightenDelay.off': return 'Off';
			case 'settings.straightenDelay.regular': return 'Regular';
			case 'settings.straightenDelay.slow': return 'Slow';
			case 'login.title': return 'Login';
			case 'login.feedbacks.checkUsername': return 'Please double check your username or email.';
			case 'login.feedbacks.enterNcPassword': return 'Please enter your Nextcloud password.';
			case 'login.feedbacks.enterEncPassword': return 'Please enter your encryption password.';
			case 'login.feedbacks.checkUrl': return 'Please enter a valid URL.';
			case 'login.feedbacks.ncLoginFailed': return 'Log in failed, please check your details and network connection.';
			case 'login.feedbacks.encLoginFailed': return 'Log in failed, please check your encryption password.';
			case 'login.feedbacks.loginSuccess': return 'Log in successful! Please wait while we set up...';
			case 'login.form.useCustomServer': return 'I want to use a custom Nextcloud server';
			case 'login.form.customServerUrl': return 'Custom server URL';
			case 'login.form.username': return 'Username or email';
			case 'login.form.ncPassword': return 'Nextcloud password';
			case 'login.form.encPassword': return 'Encryption password';
			case 'login.form.agreeToPrivacyPolicy': return ({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
				const TextSpan(text: 'By logging in, you agree to the '),
				linkToPrivacyPolicy('Privacy Policy'),
				const TextSpan(text: '.'),
			]);
			case 'login.form.login': return 'Log in';
			case 'login.signup': return ({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
				const TextSpan(text: 'Don\'t have an account yet? '),
				linkToSignup('Sign up now'),
				const TextSpan(text: '!'),
			]);
			case 'login.status.loggedIn': return 'Logged in with Nextcloud';
			case 'login.status.loggedOut': return 'Logged out';
			case 'login.status.tapToLogin': return 'Tap to log in with Nextcloud';
			case 'login.faq.0.q': return 'What is Nextcloud?';
			case 'login.faq.0.a': return 'Nextcloud is a private file sync server, among other things. You can use the default Saber Nextcloud server, use a third-party server, or self-host your own for full control of your data.';
			case 'login.faq.1.q': return 'What is the encryption password?';
			case 'login.faq.1.a': return 'The encryption password is used to encrypt your data before it is sent to the server. It is not stored on the server, and is only used by Saber to encrypt and decrypt your data.\n\nNo-one can access your notes on the server without your encryption password. This also means that if you forget your encryption password, you will lose access to your data.';
			case 'login.faq.2.q': return 'Why use two passwords?';
			case 'login.faq.2.a': return 'The Nextcloud password is used to access the cloud. The encryption password "scrambles" your data before it ever reaches the cloud.\n\nEven if someone gains access to your Nextcloud account, your notes will remain safe and encrypted with a separate password. This provides you a second layer of security to protect your data.';
			case 'appInfo.licenseNotice': return 'Saber  Copyright (C) 2022  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
			case 'appInfo.dirty': return 'DIRTY';
			case 'appInfo.debug': return 'DEBUG';
			case 'appInfo.sponsorButton': return 'Tap here to sponsor me or buy more storage';
			case 'appInfo.licenseButton': return 'Tap here to view more license information';
			case 'appInfo.privacyPolicyButton': return 'Tap here to view the privacy policy';
			case 'update.updateAvailable': return 'Update available';
			case 'update.updateAvailableDescription': return 'A new version of the app is available.';
			case 'update.dismiss': return 'Dismiss';
			case 'update.update': return 'Update';
			case 'editor.toolbar.toggleColors': return 'Toggle colors (Ctrl C)';
			case 'editor.toolbar.toggleEraser': return 'Toggle eraser (Ctrl E)';
			case 'editor.toolbar.photo': return 'Photo';
			case 'editor.toolbar.text': return 'Text';
			case 'editor.toolbar.toggleFingerDrawing': return 'Toggle finger drawing (Ctrl F)';
			case 'editor.toolbar.undo': return 'Undo';
			case 'editor.toolbar.redo': return 'Redo';
			case 'editor.toolbar.export': return 'Export (Ctrl Shift S)';
			case 'editor.toolbar.exportAs': return 'Export as:';
			case 'editor.toolbar.fullscreen': return 'Toggle fullscreen (F11)';
			case 'editor.pens.fountainPen': return 'Fountain pen';
			case 'editor.pens.ballpointPen': return 'Ballpoint pen';
			case 'editor.pens.highlighter': return 'Highlighter';
			case 'editor.penOptions.size': return 'Size';
			case 'editor.penOptions.sizeDragHint': return 'Drag left or right to change the size';
			case 'editor.imageOptions.title': return 'Image options';
			case 'editor.imageOptions.invertible': return 'Invertible';
			case 'editor.imageOptions.download': return 'Download';
			case 'editor.imageOptions.delete': return 'Delete';
			case 'editor.menu.clearPage': return 'Clear page';
			case 'editor.menu.clearAllPages': return 'Clear all pages';
			case 'editor.menu.lineHeight': return 'Line height';
			case 'editor.menu.lineHeightDescription': return 'The size of each line';
			case 'editor.newerFileFormat.readOnlyMode': return 'Read-only mode';
			case 'editor.newerFileFormat.title': return 'This note was edited using a newer version of Saber';
			case 'editor.newerFileFormat.subtitle': return 'Editing this note may result in some information being lost. Do you want to ignore this and edit it anyway?';
			case 'editor.newerFileFormat.allowEditing': return 'Allow editing';
			case 'editor.newerFileFormat.cancel': return 'Cancel';
			case 'editor.quill.typeSomething': return 'Type something here...';
			default: return null;
		}
	}
}

extension on _StringsDe {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.tabs.home': return 'Startseite';
			case 'home.tabs.browse': return 'Durchsuchen';
			case 'home.tabs.whiteboard': return 'Whiteboard';
			case 'home.tabs.settings': return 'Einstellungen';
			case 'home.titles.home': return 'Letzte Notizen';
			case 'home.titles.browse': return 'Alle Notizen';
			case 'home.titles.whiteboard': return 'Whiteboard';
			case 'home.titles.settings': return 'Einstellungen';
			case 'home.tooltips.newNote': return 'Notiz erstellen';
			case 'home.tooltips.showUpdateDialog': return 'Aktualisierungsdialog anzeigen';
			case 'home.backFolder': return '(Zurück)';
			case 'home.welcome': return 'Willkommen bei Saber';
			case 'home.noFiles': return 'Keine Dateien gefunden';
			case 'home.createNewNote': return 'Drücke die + Schaltfläche, um eine neue Notiz zu erstellen';
			case 'settings.prefLabels.appTheme': return 'Anwendungsthema';
			case 'settings.prefLabels.customAccentColor': return 'Benutzerdefinierte Akzentfarbe';
			case 'settings.prefLabels.shouldCheckForUpdates': return 'Suche automatisch nach Saber-Aktualisierungen';
			case 'settings.prefLabels.editorToolbarOnBottom': return 'Werkzeugleiste am unteren Rand ausrichten';
			case 'settings.prefLabels.editorAutoInvert': return 'Notizen im Dunkelmodus invertieren';
			case 'settings.prefLabels.preferGreyscale': return 'Graustufen bevorzugen';
			case 'settings.prefLabels.hyperlegibleFont': return 'Hyperlesbare Schrift';
			case 'settings.prefLabels.editorStraightenLines': return 'Drücke und halte für eine gerade Linie';
			case 'settings.prefLabels.autoClearWhiteboardOnExit': return 'Lösche das Whiteboard nach Verlassen der Andwendung';
			case 'settings.prefLabels.editorPromptRename': return 'Beim Erstellen von Notizen einen Namen erfragen';
			case 'settings.themeModes.system': return 'System';
			case 'settings.themeModes.light': return 'Hell';
			case 'settings.themeModes.dark': return 'Dunkel';
			case 'settings.accentColorPicker.pickAColor': return 'Wähle eine Farbe';
			case 'settings.accentColorPicker.confirm': return 'Bestätigen';
			case 'settings.prefDescriptions.hyperlegibleFont': return 'Atkinson Hyperlegible verbessert die Lesbarkeit für Menschen mit eingeschränkter Sicht';
			case 'settings.prefDescriptions.editorAutoInvert': return 'Verdunkelt intelligent die Notizen im Dunkelmodus';
			case 'settings.prefDescriptions.preferGreyscale': return 'Für E-Ink-Bildschirme';
			case 'settings.prefDescriptions.autoClearWhiteboardOnExit': return 'Es wird dennoch mit deinen anderen Geräten synchronisiert';
			case 'settings.prefDescriptions.editorPromptRename': return 'Notizen können immer auch später noch umbenannt werden';
			case 'settings.straightenDelay.off': return 'Aus';
			case 'settings.straightenDelay.regular': return 'Normal';
			case 'settings.straightenDelay.slow': return 'Langsam';
			case 'login.title': return 'Login';
			case 'login.feedbacks.checkUsername': return 'Bitte überprüfe deinen Benutzernamen oder deine E-Mail.';
			case 'login.feedbacks.enterNcPassword': return 'Bitte gib dein Nextcloud-Passwort ein.';
			case 'login.feedbacks.enterEncPassword': return 'Bitte gib dein Verschlüsselungspasswort ein.';
			case 'login.feedbacks.checkUrl': return 'Bitte gib eine gültige URL an.';
			case 'login.feedbacks.ncLoginFailed': return 'Anmeldung fehlgeschlagen, bitte überprüfe deine Angaben und deine Netzwerkverbindung.';
			case 'login.feedbacks.loginSuccess': return 'Anmeldung erfolgreich! Bitte warte, während wir alles einrichten...';
			case 'login.feedbacks.encLoginFailed': return 'Anmeldung fehlgeschlagen, bitte überprüfe dein Verschlüsselungspasswort.';
			case 'login.form.useCustomServer': return 'Ich möchte einen eigenen Nextcloud-Server verwenden';
			case 'login.form.customServerUrl': return 'Eigene Server-URL';
			case 'login.form.username': return 'Benutzername oder E-Mail';
			case 'login.form.ncPassword': return 'Nextcloud-Passwort';
			case 'login.form.encPassword': return 'Verschlüsselungspasswort';
			case 'login.form.agreeToPrivacyPolicy': return ({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
				const TextSpan(text: 'Indem du dich anmeldest, stimmst du der '),
				linkToPrivacyPolicy('Datenschutzrichtlinie'),
				const TextSpan(text: ' zu.'),
			]);
			case 'login.form.login': return 'Anmelden';
			case 'login.signup': return ({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
				const TextSpan(text: 'Du hast noch kein Konto? '),
				linkToSignup('Erstelle jetzt eins'),
				const TextSpan(text: '!'),
			]);
			case 'login.status.loggedIn': return 'Mit Nextcloud angemeldet';
			case 'login.status.loggedOut': return 'Nicht angemeldet';
			case 'login.status.tapToLogin': return 'Hier tippen, um dich mit Nextcloud anzumelden';
			case 'login.faq.0.q': return 'Was ist Nextcloud?';
			case 'login.faq.0.a': return 'Nextcloud ist unter andrem ein privater Dateisynchronisationsserver. Du kannst den Standard-Saber-Nextcloud-Server, einen Drittanbieter-, oder einen selbst-gehosteten Server verwenden, um volle Kontrolle über deine Daten zu behalten.';
			case 'login.faq.1.q': return 'Was ist das Verchlüsselungspasswort?';
			case 'login.faq.1.a': return 'Das Verschlüsselungspassort wird verwendet, um deine Daten zu verschlüsseln, bevor diese an den Server gesendet werden. Es wird nicht auf dem Server gespeichert und nur von Saber verwendet, um deine Daten zu ver- und entschlüsseln.\n\nNiemand kann ohne dieses Passwort auf deine Notizen auf dem Server zugreifen. Das bedeutet allerdings auch, dass du, wenn du dein Verschlüsselungspasswort vergisst, den Zugriff auf deine Daten verlierst.';
			case 'login.faq.2.q': return 'Wieso zwei Passwörter?';
			case 'login.faq.2.a': return 'Das Nextcloud-Passwort wird verwendet, um auf die Cloud zuzugreifen. Das Verschlüsselungspasswort "verwürfelt" deine Daten, bevor diese die Cloud erreichen.\n\nSelbst wenn jemand Zugriff zu deinem Nextcloud-Konto erlangt, bleiben deine Notizen sicher und verschlüsselt mit einem seperaten Passwort. Dies stellt eine zweite Sicherheitsebene zum Schutz deiner Daten dar.';
			case 'appInfo.licenseNotice': return 'Saber  Copyright (C) 2022  Adil Hanney\nDieses Programm kommt ohne jegliche Gewährleistung. Dies ist freie Software und du bist herzlich eingeladen, diese unter bestimmten Bedingungen weiterzuverteilen.';
			case 'appInfo.debug': return 'DEBUG';
			case 'appInfo.licenseButton': return 'Hier tippen, um weitere Lizenzinformationen anzuzeigen';
			case 'appInfo.privacyPolicyButton': return 'Hier tippen, um die Datenschutzrichtlinie anzuzeigen';
			case 'appInfo.sponsorButton': return 'Hier tippen, um mich zu unterstützen oder mehr Speicherplatz zu kaufen';
			case 'update.updateAvailable': return 'Aktualisierung verfügbar';
			case 'update.updateAvailableDescription': return 'Eine neue Version der Anwendung ist verfügbar.';
			case 'update.dismiss': return 'Verwerfen';
			case 'update.update': return 'Aktualisieren';
			case 'editor.toolbar.toggleColors': return 'Farben umschalten (Strg + C)';
			case 'editor.toolbar.toggleEraser': return 'Radierer umschalten (Strg + E)';
			case 'editor.toolbar.photo': return 'Foto';
			case 'editor.toolbar.toggleFingerDrawing': return 'Fingerzeichnen umschalten (Strg + F)';
			case 'editor.toolbar.undo': return 'Rückgängig';
			case 'editor.toolbar.redo': return 'Wiederholen';
			case 'editor.toolbar.export': return 'Exportieren (Strg + Shift + S)';
			case 'editor.toolbar.exportAs': return 'Exportieren als:';
			case 'editor.pens.fountainPen': return 'Füllfederhalter';
			case 'editor.pens.highlighter': return 'Textmarker';
			case 'editor.pens.ballpointPen': return 'Kugelschreiber';
			case 'editor.penOptions.size': return 'Dicke';
			case 'editor.penOptions.sizeDragHint': return 'Nach links oder rechts ziehen, um die Größe zu ändern';
			case 'editor.imageOptions.title': return 'Bildoptionen';
			case 'editor.imageOptions.invertible': return 'Invertierbar';
			case 'editor.imageOptions.delete': return 'Entfernen';
			case 'editor.imageOptions.download': return 'Herunterladen';
			case 'editor.menu.clearPage': return 'Seite löschen';
			case 'editor.menu.clearAllPages': return 'Alle Seiten löschen';
			case 'editor.menu.lineHeight': return 'Zeilenhöhe';
			case 'editor.menu.lineHeightDescription': return 'Die Höhe jeder Zeile';
			case 'editor.newerFileFormat.title': return 'Diese Notiz wurde mit einer neueren Version von Saber bearbeitet';
			case 'editor.newerFileFormat.cancel': return 'Abbruch';
			case 'editor.newerFileFormat.readOnlyMode': return 'Schreibgeschützter Modus';
			case 'editor.newerFileFormat.subtitle': return 'Durch das Bearbeiten dieser Notiz können Daten verloren gehen. Möchtest du sie trotzdem bearbeiten?';
			case 'editor.newerFileFormat.allowEditing': return 'Schreibschutz aufheben';
			default: return null;
		}
	}
}

extension on _StringsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.tabs.home': return 'Inicio';
			case 'home.tabs.browse': return 'Explorar';
			case 'home.tabs.whiteboard': return 'Pizarra';
			case 'home.tabs.settings': return 'Configuración';
			case 'home.titles.home': return 'Notas recientes';
			case 'home.titles.browse': return 'Todas las notas';
			case 'home.titles.whiteboard': return 'Pizarra';
			case 'home.titles.settings': return 'Configuración';
			case 'home.tooltips.newNote': return 'Crear nota';
			case 'home.tooltips.showUpdateDialog': return 'Mostrar cuadro de diálogo de actualizaciónes';
			case 'home.backFolder': return '(Volver)';
			case 'home.welcome': return 'Te damos la bienvenida a Saber';
			case 'home.noFiles': return 'No se encontraron archivos';
			case 'home.createNewNote': return 'Presiona el botón + para crear una nueva nota';
			case 'settings.prefLabels.appTheme': return 'Tema de la aplicación';
			case 'settings.prefLabels.customAccentColor': return 'Color de acento personalizado';
			case 'settings.prefLabels.hyperlegibleFont': return 'Fuente hiperlegible';
			case 'settings.prefLabels.shouldCheckForUpdates': return 'Buscar actualizaciones de Saber automáticamente';
			case 'settings.prefLabels.editorToolbarOnBottom': return 'Alinear la barra de herramientas del editor en la parte inferior';
			case 'settings.prefLabels.editorAutoInvert': return 'Invertir notas en el modo oscuro';
			case 'settings.prefLabels.preferGreyscale': return 'Preferir colores en escala de grises';
			case 'settings.prefLabels.editorStraightenLines': return 'Mantén presionado para enderezar una línea';
			case 'settings.prefLabels.autoClearWhiteboardOnExit': return 'Borrar la pizarra después de salir de la aplicación';
			case 'settings.prefLabels.editorPromptRename': return 'Solicitarte cambiar el nombre de nuevas notas';
			case 'settings.prefDescriptions.hyperlegibleFont': return 'Atkinson Hyperlegible aumenta la legibilidad para lectores con poca visión';
			case 'settings.prefDescriptions.editorAutoInvert': return 'Oscurece inteligentemente las notas en el modo oscuro';
			case 'settings.prefDescriptions.preferGreyscale': return 'Para pantallas con tinta electrónica';
			case 'settings.prefDescriptions.autoClearWhiteboardOnExit': return 'Aún se sincronizará con tus otros dispositivos';
			case 'settings.prefDescriptions.editorPromptRename': return 'Siempre puedes cambiar el nombre de las notas más tarde';
			case 'settings.themeModes.system': return 'Sistema';
			case 'settings.themeModes.light': return 'Claro';
			case 'settings.themeModes.dark': return 'Oscuro';
			case 'settings.accentColorPicker.pickAColor': return 'Elegir un color';
			case 'settings.accentColorPicker.confirm': return 'Confirmar';
			case 'settings.straightenDelay.off': return 'Apagado';
			case 'settings.straightenDelay.regular': return 'Regular';
			case 'settings.straightenDelay.slow': return 'Lento';
			case 'login.title': return 'Iniciar sesión';
			case 'login.feedbacks.checkUsername': return 'Por favor verifica tu nombre de usuario o correo electrónico.';
			case 'login.feedbacks.enterNcPassword': return 'Por favor ingresa tu contraseña de Nextcloud.';
			case 'login.feedbacks.enterEncPassword': return 'Por favor introduce tu contraseña de cifrado.';
			case 'login.feedbacks.checkUrl': return 'Por favor introduce una dirección URL válida.';
			case 'login.feedbacks.ncLoginFailed': return 'No se pudo iniciar sesión, por favor verifica tus datos y conexión a internet.';
			case 'login.feedbacks.loginSuccess': return '¡Inicio de sesión exitoso! Por favor espera mientras configuramos todo...';
			case 'login.feedbacks.encLoginFailed': return 'No se pudo iniciar sesión, por favor verifica tu contraseña de cifrado.';
			case 'login.form.useCustomServer': return 'Quiero utilizar un servidor de Nextcloud personalizado';
			case 'login.form.customServerUrl': return 'Dirección URL del servidor personalizada';
			case 'login.form.username': return 'Nombre de usuario o correo electrónico';
			case 'login.form.ncPassword': return 'Contraseña de Nextcloud';
			case 'login.form.encPassword': return 'Contraseña de cifrado';
			case 'login.form.agreeToPrivacyPolicy': return ({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
				const TextSpan(text: 'Al iniciar sesión, aceptas nuestra '),
				linkToPrivacyPolicy('Política de privacidad'),
				const TextSpan(text: '.'),
			]);
			case 'login.form.login': return 'Iniciar sesión';
			case 'login.signup': return ({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
				const TextSpan(text: '¿Aún no tienes una cuenta? '),
				linkToSignup('Regístrate ahora'),
			]);
			case 'login.status.loggedIn': return 'Sesión iniciada con Nextcloud';
			case 'login.status.loggedOut': return 'Desconectado';
			case 'login.status.tapToLogin': return 'Toca para iniciar sesión con Nextcloud';
			case 'login.faq.0.q': return '¿Qué es Nextcloud?';
			case 'login.faq.0.a': return 'Nextcloud es un servidor privado de sincronización de archivos, entre otras cosas. Puede usar el servidor Sabre Nextcloud predeterminado, usar un servidor de terceros o alojar el tuyo propio para tener un control total de tus datos.';
			case 'login.faq.1.q': return '¿Qué es la contraseña de cifrado?';
			case 'login.faq.1.a': return 'La contraseña de cifrado se utiliza para cifrar tus datos antes de enviarlos al servidor. No se almacenan en el servidor y solo Saber lo utiliza para cifrar y descifrar sus datos.\n\nNadie puede acceder a sus notas en el servidor sin tu contraseña de cifrado. Esto también significa que si olvidas tu contraseña de cifrado, perderás el acceso a tus datos.';
			case 'login.faq.2.q': return '¿Por qué usar dos contraseñas?';
			case 'login.faq.2.a': return 'La contraseña de Nextcloud se utiliza para acceder a la nube. La contraseña de encriptación "codifica" tus datos antes de que lleguen a la nube.\n\nIncluso si alguien obtiene acceso a tu cuenta de Nextcloud, tus notas permanecerán seguras y encriptadas con una contraseña separada. Esto te proporciona una segunda capa de seguridad para proteger tus datos.';
			case 'appInfo.licenseNotice': return 'Saber  Copyright (C) 2022  Adil Hanney\nEste programa no tiene ninguna garantía. Es un software libre, y se puede redistribuir bajo ciertas condiciones.';
			case 'appInfo.debug': return 'DEBUG';
			case 'appInfo.sponsorButton': return 'Toca aquí para patrocinarme o comprar más almacenamiento';
			case 'appInfo.licenseButton': return 'Toca aquí para ver más información sobre la licencia';
			case 'appInfo.privacyPolicyButton': return 'Toca aquí para ver nuestra política de privacidad';
			case 'update.updateAvailable': return 'Actualización disponible';
			case 'update.updateAvailableDescription': return 'Hay una nueva versión de la aplicación disponible.';
			case 'update.dismiss': return 'Ignorar';
			case 'update.update': return 'Actualizar';
			case 'editor.toolbar.toggleColors': return 'Cambiar colores (Ctrl C)';
			case 'editor.toolbar.toggleEraser': return 'Borrador (Ctrl E)';
			case 'editor.toolbar.photo': return 'Foto';
			case 'editor.toolbar.toggleFingerDrawing': return 'Dibujar con el dedo (Ctrl F)';
			case 'editor.toolbar.undo': return 'Deshacer';
			case 'editor.toolbar.redo': return 'Rehacer';
			case 'editor.toolbar.export': return 'Exportar (Ctrl Shift S)';
			case 'editor.toolbar.exportAs': return 'Exportar cómo:';
			case 'editor.pens.fountainPen': return 'Lápiz';
			case 'editor.pens.ballpointPen': return 'Bolígrafo';
			case 'editor.pens.highlighter': return 'Resaltador';
			case 'editor.penOptions.size': return 'Tamaño';
			case 'editor.penOptions.sizeDragHint': return 'Arrastra hacia la izquierda o hacia la derecha para cambiar el tamaño';
			case 'editor.imageOptions.title': return 'Opciones de imagen';
			case 'editor.imageOptions.invertible': return 'Invertible';
			case 'editor.imageOptions.delete': return 'Eliminar';
			case 'editor.menu.clearPage': return 'Borrar página';
			case 'editor.menu.clearAllPages': return 'Borrar todas las páginas';
			case 'editor.menu.lineHeight': return 'Altura de la línea';
			case 'editor.menu.lineHeightDescription': return 'El tamaño de cada línea';
			case 'editor.newerFileFormat.readOnlyMode': return 'Modo de solo lectura';
			case 'editor.newerFileFormat.title': return 'Esta nota fue editada usando una versión más reciente de Saber';
			case 'editor.newerFileFormat.subtitle': return 'La edición de esta nota puede resultar en la pérdida de cierta información. ¿Quieres ignorar esto y editarlo de todos modos?';
			case 'editor.newerFileFormat.allowEditing': return 'Editar';
			case 'editor.newerFileFormat.cancel': return 'Cancelar';
			default: return null;
		}
	}
}

extension on _StringsIt {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.tabs.home': return 'Home';
			case 'home.tabs.browse': return 'Sfoglia';
			case 'home.tabs.whiteboard': return 'Lavagna';
			case 'home.tabs.settings': return 'Impostazioni';
			case 'home.titles.home': return 'Note recenti';
			case 'home.titles.browse': return 'Tutte le note';
			case 'home.titles.whiteboard': return 'Lavagna';
			case 'home.titles.settings': return 'Impostazioni';
			case 'home.tooltips.newNote': return 'Nuova nota';
			case 'home.tooltips.showUpdateDialog': return 'Mostra finestra di aggiornamento';
			case 'home.backFolder': return '(Indietro)';
			case 'home.welcome': return 'Benvenuto su Saber';
			case 'home.noFiles': return 'Nessun file trovato';
			case 'home.createNewNote': return 'Tocca il pulsante + per creare una nuova nota';
			case 'settings.prefLabels.appTheme': return 'Tema dell\'app';
			case 'settings.prefLabels.customAccentColor': return 'Colore personalizzato';
			case 'settings.prefLabels.shouldCheckForUpdates': return 'Controlla automaticamente gli aggiornamenti di Saber';
			case 'settings.prefLabels.editorToolbarOnBottom': return 'Allinea la barra degli strumenti dell\'editor in basso';
			case 'settings.prefLabels.editorAutoInvert': return 'Inverti le note in modalità scura';
			case 'settings.prefLabels.preferGreyscale': return 'Preferisci i colori in scala di grigi';
			case 'settings.prefLabels.hyperlegibleFont': return 'Carattere iperleggibile';
			case 'settings.prefLabels.editorStraightenLines': return 'Tenere premuto per raddrizzare una linea';
			case 'settings.prefLabels.autoClearWhiteboardOnExit': return 'Svuota la lavagna dopo essere uscito dall\'app';
			case 'settings.prefLabels.editorPromptRename': return 'Richiede di rinominare nuove note';
			case 'settings.prefLabels.editorToolbarShowInFullscreen': return 'Mostra la barra degli strumenti dell\'editor in modalità a schermo intero';
			case 'settings.themeModes.system': return 'Sistema';
			case 'settings.themeModes.light': return 'Chiaro';
			case 'settings.themeModes.dark': return 'Scuro';
			case 'settings.accentColorPicker.pickAColor': return 'Scegli un colore';
			case 'settings.accentColorPicker.confirm': return 'Conferma';
			case 'settings.prefDescriptions.hyperlegibleFont': return 'Atkinson Hyperlegible aumenta la leggibilità per i lettori ipovedenti';
			case 'settings.prefDescriptions.editorAutoInvert': return 'Scurisce in modo intelligente le note in modalità scura';
			case 'settings.prefDescriptions.preferGreyscale': return 'Per display e-ink';
			case 'settings.prefDescriptions.autoClearWhiteboardOnExit': return 'Sarà comunque sincronizzato con gli altri tuoi dispositivi';
			case 'settings.prefDescriptions.editorPromptRename': return 'Puoi sempre rinominare le note in un secondo momento';
			case 'settings.straightenDelay.off': return 'Off';
			case 'settings.straightenDelay.regular': return 'Regolare';
			case 'settings.straightenDelay.slow': return 'Lento';
			case 'login.title': return 'Login';
			case 'login.feedbacks.checkUsername': return 'Ricontrolla il tuo nome utente o e-mail.';
			case 'login.feedbacks.enterNcPassword': return 'Inserisci la tua password Nextcloud.';
			case 'login.feedbacks.enterEncPassword': return 'Inserisci la tua password di crittografata.';
			case 'login.feedbacks.checkUrl': return 'Per favore, inserisci un URL valido.';
			case 'login.feedbacks.ncLoginFailed': return 'Accesso fallito, controlla i tuoi dati e la connessione di rete.';
			case 'login.feedbacks.loginSuccess': return 'Accesso riuscito! Si prega di attendere mentre configuriamo...';
			case 'login.feedbacks.encLoginFailed': return 'Accesso non riuscito, controllare la password di crittografia.';
			case 'login.form.useCustomServer': return 'Voglio utilizzare un server Nextcloud personalizzato';
			case 'login.form.customServerUrl': return 'URL del server personalizzato';
			case 'login.form.username': return 'Nome utente o email';
			case 'login.form.ncPassword': return 'Password nextcloud';
			case 'login.form.encPassword': return 'Password di crittografata';
			case 'login.form.agreeToPrivacyPolicy': return ({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
				const TextSpan(text: 'Effettuando l\'accesso, accetti la '),
				linkToPrivacyPolicy('Informativa sulla privacy'),
				const TextSpan(text: '.'),
			]);
			case 'login.form.login': return 'Log in';
			case 'login.signup': return ({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
				const TextSpan(text: 'Non hai ancora un account? '),
				linkToSignup('Registrati ora'),
				const TextSpan(text: '!'),
			]);
			case 'login.status.loggedIn': return 'Effettuato l\'accesso con Nextcloud';
			case 'login.status.loggedOut': return 'Disconnesso';
			case 'login.status.tapToLogin': return 'Tocca per accedere con Nextcloud';
			case 'login.faq.0.q': return 'Cos\'è Nextcloud?';
			case 'login.faq.0.a': return 'Nextcloud è, tra le altre cose, un server di sincronizzazione file privato. Puoi utilizzare il server Saber Nextcloud predefinito, utilizzare un server di terze parti o ospitare autonomamente il tuo per il pieno controllo dei tuoi dati.';
			case 'login.faq.1.q': return 'Cos\'è la password di crittografia?';
			case 'login.faq.1.a': return 'La password di crittografia viene utilizzata per crittografare i dati prima che vengano inviati al server. Non è archiviato sul server e viene utilizzato solo da Sabre per crittografare e decrittografare i tuoi dati.\n\nNessuno può accedere alle tue note sul server senza la tua password di crittografia. Ciò significa anche che se dimentichi la password di crittografia, perderai l\'accesso ai tuoi dati.';
			case 'login.faq.2.q': return 'Perché usare due password?';
			case 'login.faq.2.a': return 'La password Nextcloud viene utilizzata per accedere al cloud. La password di crittografia "codifica" i tuoi dati prima che raggiungano il cloud.\n\nAnche se qualcuno riesce ad accedere al tuo account Nextcloud, le tue note rimarranno al sicuro e crittografate con una password separata. Questo ti fornisce un secondo livello di sicurezza per proteggere i tuoi dati.';
			case 'appInfo.licenseNotice': return 'Sabre Copyright (C) 2022 Adil Hanney\nQuesto programma non ha alcuna garanzia. Questo è un software libero e sei libero di ridistribuirlo a determinate condizioni.';
			case 'appInfo.debug': return 'DEBUG';
			case 'appInfo.licenseButton': return 'Tocca qui per visualizzare ulteriori informazioni sulla licenza';
			case 'appInfo.privacyPolicyButton': return 'Tocca qui per visualizzare l\'informativa sulla privacy';
			case 'appInfo.sponsorButton': return 'Tocca qui per sponsorizzarmi o acquistare altro spazio di archiviazione';
			case 'appInfo.dirty': return 'GROSSOLANA';
			case 'update.updateAvailable': return 'Aggiornamento disponibile';
			case 'update.updateAvailableDescription': return 'È disponibile una nuova versione dell\'app.';
			case 'update.dismiss': return 'Abbandona';
			case 'update.update': return 'Aggiornamento';
			case 'editor.toolbar.toggleColors': return 'Attiva/disattiva i colori (Ctrl C)';
			case 'editor.toolbar.toggleEraser': return 'Attiva/disattiva gomma (Ctrl E)';
			case 'editor.toolbar.photo': return 'Foto';
			case 'editor.toolbar.toggleFingerDrawing': return 'Attiva/disattiva il disegno con il dito (Ctrl F)';
			case 'editor.toolbar.undo': return 'Annulla';
			case 'editor.toolbar.redo': return 'Rifai';
			case 'editor.toolbar.export': return 'Esporta (Ctrl Shift S)';
			case 'editor.toolbar.exportAs': return 'Esporta come:';
			case 'editor.toolbar.text': return 'Testo';
			case 'editor.toolbar.fullscreen': return 'Passa a schermo intero (F11)';
			case 'editor.pens.fountainPen': return 'Penna stilografica';
			case 'editor.pens.highlighter': return 'Evidenziatore';
			case 'editor.pens.ballpointPen': return 'Penna a sfera';
			case 'editor.penOptions.size': return 'Dimesione';
			case 'editor.penOptions.sizeDragHint': return 'Trascina a sinistra o a destra per modificare le dimensioni';
			case 'editor.imageOptions.title': return 'Opzioni immagine';
			case 'editor.imageOptions.invertible': return 'Invertibile';
			case 'editor.imageOptions.delete': return 'Cancella';
			case 'editor.imageOptions.download': return 'Download';
			case 'editor.menu.clearPage': return 'Pulisci pagina';
			case 'editor.menu.clearAllPages': return 'Pulisci tutte le pagine';
			case 'editor.menu.lineHeight': return 'Altezza della linea';
			case 'editor.menu.lineHeightDescription': return 'La dimensione di ogni riga';
			case 'editor.newerFileFormat.readOnlyMode': return 'Modalità di sola lettura';
			case 'editor.newerFileFormat.title': return 'Questa nota è stata modificata utilizzando una versione più recente di Saber';
			case 'editor.newerFileFormat.subtitle': return 'La modifica di questa nota potrebbe comportare la perdita di alcune informazioni. Vuoi ignorare e modificarla comunque?';
			case 'editor.newerFileFormat.allowEditing': return 'Consenti modifica';
			case 'editor.newerFileFormat.cancel': return 'Cancella';
			case 'editor.quill.typeSomething': return 'Scrivi qualcosa qui...';
			default: return null;
		}
	}
}

extension on _StringsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.tabs.home': return 'Домашняя';
			case 'home.tabs.browse': return 'Обзор';
			case 'home.tabs.whiteboard': return 'Чистый лист';
			case 'home.tabs.settings': return 'Настройки';
			case 'home.titles.home': return 'Недавние заметки';
			case 'home.titles.browse': return 'Все заметки';
			case 'home.titles.whiteboard': return 'Чистый лист';
			case 'home.titles.settings': return 'Настройки';
			case 'home.tooltips.newNote': return 'Новая заметка';
			case 'home.tooltips.showUpdateDialog': return 'Показывать диалог обновления';
			case 'home.backFolder': return '(Назад)';
			case 'home.welcome': return 'Приветствуем в Saber';
			case 'home.noFiles': return 'Файлов ещё нет';
			case 'home.createNewNote': return 'Нажмите кнопку «+» чтобы создать новую заметку';
			case 'settings.prefLabels.appTheme': return 'Тема оформления';
			case 'settings.prefLabels.customAccentColor': return 'Свой цвет акцента';
			case 'settings.prefLabels.hyperlegibleFont': return 'Гипер разборчивый шрифт';
			case 'settings.prefLabels.shouldCheckForUpdates': return 'Автоматически проверять обновления Saber';
			case 'settings.prefLabels.editorToolbarOnBottom': return 'Выровнять панель инструментов редактора по нижнему краю';
			case 'settings.prefLabels.editorToolbarShowInFullscreen': return 'Show the editor toolbar in fullscreen mode';
			case 'settings.prefLabels.editorAutoInvert': return 'Инвертировать заметки в тёмном режиме';
			case 'settings.prefLabels.preferGreyscale': return 'Предпочтение оттенкам серого';
			case 'settings.prefLabels.editorStraightenLines': return 'Нажать и удерживать, чтобы выпрямить линию';
			case 'settings.prefLabels.autoClearWhiteboardOnExit': return 'Очищать лист при выходе из приложения';
			case 'settings.prefLabels.editorPromptRename': return 'Предлагать переименовывать новые заметки';
			case 'settings.prefDescriptions.hyperlegibleFont': return 'Шрифт Atkinson Hyperlegible повышает разборчивость для читателей с плохим зрением';
			case 'settings.prefDescriptions.editorAutoInvert': return 'Интеллектуально затемнять заметки в тёмном режиме';
			case 'settings.prefDescriptions.preferGreyscale': return 'Для e-ink экранов';
			case 'settings.prefDescriptions.autoClearWhiteboardOnExit': return 'Это будет синхронизировано с другими вашими устройствами';
			case 'settings.prefDescriptions.editorPromptRename': return 'Вы всегда можете переименовать заметки позже';
			case 'settings.themeModes.system': return 'Системная';
			case 'settings.themeModes.light': return 'Светлая';
			case 'settings.themeModes.dark': return 'Тёмная';
			case 'settings.accentColorPicker.pickAColor': return 'Выбери цвет';
			case 'settings.accentColorPicker.confirm': return 'Подтвердить';
			case 'settings.straightenDelay.off': return 'Выкл.';
			case 'settings.straightenDelay.regular': return 'Обычно';
			case 'settings.straightenDelay.slow': return 'Долго';
			case 'login.title': return 'Авторизация';
			case 'login.feedbacks.checkUsername': return 'Дважды проверьте своё имя пользователя или адрес электронной почты.';
			case 'login.feedbacks.enterNcPassword': return 'Введите свой пароль Nextcloud.';
			case 'login.feedbacks.enterEncPassword': return 'Введите пароль шифрования.';
			case 'login.feedbacks.checkUrl': return 'Пожалуйста, введите корректный URL адрес.';
			case 'login.feedbacks.ncLoginFailed': return 'Ошибка входа. Проверьте свои данные и подключение к сети.';
			case 'login.feedbacks.encLoginFailed': return 'Не удалось войти. Проверьте пароль шифрования.';
			case 'login.feedbacks.loginSuccess': return 'Вход выполнен успешно! Пожалуйста подождите, пока мы настроим…';
			case 'login.form.useCustomServer': return 'Я буду использовать свой Nextcloud сервер';
			case 'login.form.customServerUrl': return 'Адрес Вашего сервера';
			case 'login.form.username': return 'Имя пользователя или e-mail';
			case 'login.form.ncPassword': return 'Пароль Nextcloud';
			case 'login.form.encPassword': return 'Пароль шифрования';
			case 'login.form.agreeToPrivacyPolicy': return ({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
				const TextSpan(text: 'Авторизуясь, вы соглашаетесь с '),
				linkToPrivacyPolicy('политикой конфиденциальности'),
				const TextSpan(text: '.'),
			]);
			case 'login.form.login': return 'Авторизоваться';
			case 'login.signup': return ({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
				const TextSpan(text: 'У вас нет учётной записи? '),
				linkToSignup('Зарегистрируйтесь сейчас'),
				const TextSpan(text: '!'),
			]);
			case 'login.status.loggedIn': return 'Авторизован в Nextcloud';
			case 'login.status.loggedOut': return 'Не авторизован';
			case 'login.status.tapToLogin': return 'Нажми для авторизации в Nextcloud';
			case 'login.faq.0.q': return 'Что такое Nextcloud?';
			case 'login.faq.0.a': return 'Nextcloud — это частный сервер синхронизации файлов, помимо всего прочего. Вы можете использовать сервер Sabre Nextcloud по умолчанию, использовать сторонний сервер или самостоятельно разместить свой собственный для полного контроля над своими данными.';
			case 'login.faq.1.q': return 'Что такое пароль шифрования?';
			case 'login.faq.1.a': return 'Пароль шифрования используется для шифрования ваших данных перед отправкой их на сервер. Он не хранится на сервере и используется Sabre только для шифрования и расшифровки ваших данных.\n\nНикто не может получить доступ к вашим заметкам на сервере без вашего пароля шифрования. Это также означает, что если вы забудете пароль для шифрования, вы потеряете доступ к своим данным.';
			case 'login.faq.2.q': return 'Зачем использовать два пароля?';
			case 'login.faq.2.a': return 'Пароль Nextcloud используется для доступа к облаку. Пароль шифрования «шифрует» ваши данные еще до того, как они попадут в облако.\n\nДаже если кто-то получит доступ к вашей учетной записи Nextcloud, ваши заметки останутся в безопасности и будут зашифрованы с помощью отдельного пароля. Это обеспечивает вам второй уровень безопасности для защиты ваших данных.';
			case 'appInfo.licenseNotice': return 'Saber  Copyright (C) 2022  Adil Hanney\nЭта программа поставляется без каких-либо гарантий. Это бесплатное программное обеспечение, и вы можете распространять его при определенных условиях.';
			case 'appInfo.debug': return 'ОТЛАДКА';
			case 'appInfo.sponsorButton': return 'Проспонсируйте меня или купите дополнительное пространство';
			case 'appInfo.licenseButton': return 'Просмотрите дополнительную информацию о лицензии';
			case 'appInfo.privacyPolicyButton': return 'Просмотр политики конфиденциальности';
			case 'update.updateAvailable': return 'Доступно обновление';
			case 'update.updateAvailableDescription': return 'Доступна новая версия приложения.';
			case 'update.dismiss': return 'Отказаться';
			case 'update.update': return 'Обновить';
			case 'editor.toolbar.toggleColors': return 'Выбор цвета (Ctrl C)';
			case 'editor.toolbar.toggleEraser': return 'Ластик (Ctrl E)';
			case 'editor.toolbar.photo': return 'Фото';
			case 'editor.toolbar.text': return 'Текст';
			case 'editor.toolbar.toggleFingerDrawing': return 'Рисование пальцем (Ctrl F)';
			case 'editor.toolbar.undo': return 'Отменить';
			case 'editor.toolbar.redo': return 'Вернуть';
			case 'editor.toolbar.export': return 'Экспорт (Ctrl Shift S)';
			case 'editor.toolbar.exportAs': return 'Сохранить как:';
			case 'editor.toolbar.fullscreen': return 'Полноэкранный режим (F11)';
			case 'editor.pens.fountainPen': return 'Перьевая ручка';
			case 'editor.pens.ballpointPen': return 'Шариковая ручка';
			case 'editor.pens.highlighter': return 'Маркер';
			case 'editor.penOptions.size': return 'Размер';
			case 'editor.penOptions.sizeDragHint': return 'Тяните влево или вправо, чтобы изменить размер';
			case 'editor.imageOptions.title': return 'Параметры изображения';
			case 'editor.imageOptions.invertible': return 'Инвертированное';
			case 'editor.imageOptions.download': return 'Сохранить';
			case 'editor.imageOptions.delete': return 'Удалить';
			case 'editor.menu.clearPage': return 'Очистить лист';
			case 'editor.menu.clearAllPages': return 'Очистить все листы';
			case 'editor.menu.lineHeight': return 'Высота строки';
			case 'editor.menu.lineHeightDescription': return 'Размер каждой строки';
			case 'editor.newerFileFormat.readOnlyMode': return 'Режим «Только чтение»';
			case 'editor.newerFileFormat.title': return 'Эта заметка была отредактирована в более новой версии Sabre.';
			case 'editor.newerFileFormat.subtitle': return 'Редактирование этой заметки может привести к потере некоторой информации. Вы хотите проигнорировать это и начать редактирование?';
			case 'editor.newerFileFormat.allowEditing': return 'Разрешить редактирование';
			case 'editor.newerFileFormat.cancel': return 'Отмена';
			case 'editor.quill.typeSomething': return 'Напишите что-нибудь здесь...';
			default: return null;
		}
	}
}

extension on _StringsZhHansCn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.tabs.home': return '主页';
			case 'home.tabs.browse': return '全部笔记';
			case 'home.tabs.whiteboard': return '白板';
			case 'home.tabs.settings': return '设置';
			case 'home.titles.home': return '最近笔记';
			case 'home.titles.browse': return '全部笔记';
			case 'home.titles.whiteboard': return '白板';
			case 'home.titles.settings': return '设置';
			case 'home.tooltips.newNote': return '新建笔记';
			case 'home.tooltips.showUpdateDialog': return '显示更新对话框';
			case 'home.backFolder': return '(返回)';
			case 'home.welcome': return '欢迎使用 Saber';
			case 'home.noFiles': return '未找到文件';
			case 'home.createNewNote': return '点击 + 按钮新建一个笔记';
			case 'settings.prefLabels.appTheme': return '应用主题';
			case 'settings.prefLabels.customAccentColor': return '自定义主题色';
			case 'settings.prefLabels.hyperlegibleFont': return '易读字体';
			case 'settings.prefLabels.shouldCheckForUpdates': return '自动检查 Saber 更新';
			case 'settings.prefLabels.editorToolbarOnBottom': return '将编辑工具栏与底部对齐';
			case 'settings.prefLabels.editorAutoInvert': return '在深色模式下使用反色笔记背景';
			case 'settings.prefLabels.preferGreyscale': return '使用灰度颜色';
			case 'settings.prefLabels.editorStraightenLines': return '按住拉直线段';
			case 'settings.prefLabels.autoClearWhiteboardOnExit': return '离开应用后清除白板';
			case 'settings.prefLabels.editorPromptRename': return '提示您重命名新笔记';
			case 'settings.prefLabels.editorToolbarShowInFullscreen': return '在全屏模式中显示编辑菜单栏';
			case 'settings.prefDescriptions.hyperlegibleFont': return 'Atkinson Hyperlegible 字体为低视力读者提高易读性';
			case 'settings.prefDescriptions.editorAutoInvert': return '在深色模式下自动使用反色笔记背景';
			case 'settings.prefDescriptions.preferGreyscale': return '用于电子墨水显示器';
			case 'settings.prefDescriptions.autoClearWhiteboardOnExit': return '这将会同步到您的其他设备';
			case 'settings.prefDescriptions.editorPromptRename': return '您可以总是稍后重命名笔记';
			case 'settings.themeModes.system': return '系统';
			case 'settings.themeModes.light': return '浅色';
			case 'settings.themeModes.dark': return '深色';
			case 'settings.accentColorPicker.pickAColor': return '选取颜色';
			case 'settings.accentColorPicker.confirm': return '确定';
			case 'settings.straightenDelay.off': return '关闭';
			case 'settings.straightenDelay.regular': return '常规';
			case 'settings.straightenDelay.slow': return '缓慢';
			case 'login.title': return '登录';
			case 'login.feedbacks.checkUsername': return '请仔细检查您的用户名或电子邮件。';
			case 'login.feedbacks.enterNcPassword': return '请输入您的 Nextcloud 密码。';
			case 'login.feedbacks.enterEncPassword': return '请输入您的加密密码。';
			case 'login.feedbacks.checkUrl': return '请输入有效链接。';
			case 'login.feedbacks.ncLoginFailed': return '登录失败，请检查您的详细信息和网络连接。';
			case 'login.feedbacks.loginSuccess': return '登录成功！我们正在设置中，请稍候……';
			case 'login.feedbacks.encLoginFailed': return '登录失败，请检查您的加密密码。';
			case 'login.form.useCustomServer': return '我想要使用自定义 Nextcloud 服务器';
			case 'login.form.customServerUrl': return '自定义服务器链接';
			case 'login.form.username': return '用户名或邮箱';
			case 'login.form.ncPassword': return 'Nextcloud 密码';
			case 'login.form.encPassword': return '加密密码';
			case 'login.form.agreeToPrivacyPolicy': return ({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
				const TextSpan(text: '登录即表示您同意 '),
				linkToPrivacyPolicy('隐私政策'),
				const TextSpan(text: '。'),
			]);
			case 'login.form.login': return '登录';
			case 'login.signup': return ({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
				const TextSpan(text: '还没有帐户？ '),
				linkToSignup('立即注册'),
				const TextSpan(text: '！'),
			]);
			case 'login.status.loggedIn': return '已使用 Nextcloud 登录';
			case 'login.status.loggedOut': return '已注销';
			case 'login.status.tapToLogin': return '点击以使用 Nextcloud 登录';
			case 'login.faq.0.q': return 'Nextcloud 是什么？';
			case 'login.faq.0.a': return 'Nextcloud 是一个私人文件同步服务器。您可以使用默认的 Saber Nextcloud 服务器、使用第三方服务器或自行托管您自己的服务器以完全控制您的数据。';
			case 'login.faq.1.q': return '加密密码是什么？';
			case 'login.faq.1.a': return '加密密码用于在将数据发送到服务器之前对其进行加密。它不存储在服务器上，仅供 Saber 用来加密和解密您的数据。\n\n没有您的加密密码，任何人都无法访问您在服务器上的笔记。这也意味着，如果您忘记了加密密码，您将无法访问您的数据。';
			case 'login.faq.2.q': return '为什么使用双重密码？';
			case 'login.faq.2.a': return 'Nextcloud 密码用于访问云端。加密密码会在您的数据到达云端之前对其进行“加密”。\n\n即使有人获得了您的 Nextcloud 帐户的访问权限，您的笔记也将保持安全并使用单独的密码进行加密。这为您提供了双重安全保护来保护您的数据。';
			case 'appInfo.licenseNotice': return 'Saber  版权所有 (C) 2022  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
			case 'appInfo.debug': return 'DEBUG';
			case 'appInfo.licenseButton': return '点击此处查看更多许可证信息';
			case 'appInfo.privacyPolicyButton': return '点击此处查看隐私政策';
			case 'appInfo.sponsorButton': return '点击此处赞助我或购买更多存储空间';
			case 'update.updateAvailable': return '可用更新';
			case 'update.updateAvailableDescription': return '该应用程序的新版本可用。';
			case 'update.dismiss': return '忽略';
			case 'update.update': return '更新';
			case 'editor.toolbar.toggleColors': return '切换颜色 (Ctrl C)';
			case 'editor.toolbar.toggleEraser': return '切换橡皮擦 (Ctrl E)';
			case 'editor.toolbar.photo': return '照片';
			case 'editor.toolbar.toggleFingerDrawing': return '切换手写 (Ctrl F)';
			case 'editor.toolbar.undo': return '撤销';
			case 'editor.toolbar.redo': return '重做';
			case 'editor.toolbar.export': return '导出 (Ctrl Shift S)';
			case 'editor.toolbar.exportAs': return '导出为：';
			case 'editor.toolbar.text': return '文本';
			case 'editor.toolbar.fullscreen': return '切换全屏 (F11)';
			case 'editor.pens.fountainPen': return '钢笔';
			case 'editor.pens.ballpointPen': return '圆珠笔';
			case 'editor.pens.highlighter': return '荧光笔';
			case 'editor.penOptions.size': return '粗细';
			case 'editor.penOptions.sizeDragHint': return '左右拖动更改粗细';
			case 'editor.imageOptions.title': return '图片选项';
			case 'editor.imageOptions.invertible': return '反转颜色';
			case 'editor.imageOptions.delete': return '删除';
			case 'editor.imageOptions.download': return '下载';
			case 'editor.menu.clearPage': return '清除页面';
			case 'editor.menu.clearAllPages': return '清除全部页面';
			case 'editor.menu.lineHeight': return '行高';
			case 'editor.menu.lineHeightDescription': return '每一行的高度';
			case 'editor.newerFileFormat.title': return '此笔记使用新版 Saber 编辑而成';
			case 'editor.newerFileFormat.cancel': return '取消';
			case 'editor.newerFileFormat.readOnlyMode': return '只读模式';
			case 'editor.newerFileFormat.subtitle': return '编辑此笔记可能会导致某些信息丢失。您想忽略并编辑吗？';
			case 'editor.newerFileFormat.allowEditing': return '允许编辑';
			case 'editor.quill.typeSomething': return '在这里输入...';
			default: return null;
		}
	}
}

extension on _StringsZhHantTw {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.tabs.home': return '首頁';
			case 'home.tabs.browse': return '全部筆記';
			case 'home.tabs.whiteboard': return '白板';
			case 'home.tabs.settings': return '設定';
			case 'home.titles.home': return '最近筆記';
			case 'home.titles.browse': return '全部筆記';
			case 'home.titles.whiteboard': return '白板';
			case 'home.titles.settings': return '設定';
			case 'home.tooltips.newNote': return '新增筆記';
			case 'home.tooltips.showUpdateDialog': return '顯示更新對話框';
			case 'home.backFolder': return '(返回)';
			case 'home.welcome': return '歡迎使用 Saber';
			case 'home.noFiles': return '未找到檔案';
			case 'home.createNewNote': return '點擊 + 按鈕新增一個筆記';
			case 'settings.prefLabels.appTheme': return '應用程式主題';
			case 'settings.prefLabels.customAccentColor': return '自訂主題色';
			case 'settings.prefLabels.hyperlegibleFont': return '易讀字體';
			case 'settings.prefLabels.shouldCheckForUpdates': return '自動檢查 Saber 更新';
			case 'settings.prefLabels.editorToolbarOnBottom': return '將編輯工具列與底部對齊';
			case 'settings.prefLabels.editorAutoInvert': return '在深色模式下使用反色筆記背景';
			case 'settings.prefLabels.preferGreyscale': return '使用灰度顏色';
			case 'settings.prefLabels.editorStraightenLines': return '按住拉直線條';
			case 'settings.prefLabels.autoClearWhiteboardOnExit': return '退出應用程式後清除白板';
			case 'settings.prefLabels.editorPromptRename': return '提醒您重新命名新筆記';
			case 'settings.prefLabels.editorToolbarShowInFullscreen': return '在全螢幕模式中顯示編輯器工具列';
			case 'settings.prefDescriptions.hyperlegibleFont': return 'Atkinson Hyperlegible 字體為低視力讀者提高易讀性';
			case 'settings.prefDescriptions.editorAutoInvert': return '在深色模式下自動使用反色筆記背景';
			case 'settings.prefDescriptions.preferGreyscale': return '用於電子紙螢幕';
			case 'settings.prefDescriptions.autoClearWhiteboardOnExit': return '它仍會同步到您的其他裝置';
			case 'settings.prefDescriptions.editorPromptRename': return '您以後隨時可以重新命名筆記';
			case 'settings.themeModes.system': return '系統';
			case 'settings.themeModes.light': return '淺色';
			case 'settings.themeModes.dark': return '深色';
			case 'settings.accentColorPicker.pickAColor': return '選取顏色';
			case 'settings.accentColorPicker.confirm': return '確定';
			case 'settings.straightenDelay.off': return '關閉';
			case 'settings.straightenDelay.regular': return '正常';
			case 'settings.straightenDelay.slow': return '緩慢';
			case 'login.title': return '登入';
			case 'login.feedbacks.checkUsername': return '請仔細檢查您的使用者名稱或電子郵件。';
			case 'login.feedbacks.enterNcPassword': return '請輸入您的 Nextcloud 密碼。';
			case 'login.feedbacks.enterEncPassword': return '請輸入您的加密密碼。';
			case 'login.feedbacks.checkUrl': return '請輸入有效連結。';
			case 'login.feedbacks.ncLoginFailed': return '登入失敗，請檢查您的詳細資訊和網路連接。';
			case 'login.feedbacks.loginSuccess': return '登入成功！我們正在設定中，請稍後……';
			case 'login.feedbacks.encLoginFailed': return '登入失敗，請檢查您的加密密碼。';
			case 'login.form.useCustomServer': return '我想要使用自訂 Nextcloud 伺服器';
			case 'login.form.customServerUrl': return '自訂伺服器連結';
			case 'login.form.username': return '使用者名稱或電子郵件';
			case 'login.form.ncPassword': return 'Nextcloud 密碼';
			case 'login.form.encPassword': return '加密密碼';
			case 'login.form.agreeToPrivacyPolicy': return ({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
				const TextSpan(text: '登入即表示你同意 '),
				linkToPrivacyPolicy('隱私政策'),
				const TextSpan(text: '。'),
			]);
			case 'login.form.login': return '登入';
			case 'login.signup': return ({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
				const TextSpan(text: '還沒有帳號？ '),
				linkToSignup('立即註冊'),
				const TextSpan(text: '！'),
			]);
			case 'login.status.loggedIn': return '已使用 Nextcloud 登入';
			case 'login.status.loggedOut': return '已登出';
			case 'login.status.tapToLogin': return '點擊以使用 Nextcloud 登入';
			case 'login.faq.0.q': return '什麼是 Nextcloud？';
			case 'login.faq.0.a': return 'Nextcloud 是一個私人檔案同步伺服器。 您可以使用預設的 Sabre Nextcloud 伺服器或、使用第三方伺服器或自行託管您的伺服器以完全控制您的資料。';
			case 'login.faq.1.q': return '加密密碼是什麼？';
			case 'login.faq.1.a': return '加密密碼用於在將資料傳送到伺服器之前對其進行加密。 它不存儲在伺服器上，僅供 Saber 用來加密和解密您的資料。\n\n沒有您的加密密碼，任何人都無法訪問您儲存在伺服器上的筆記。 這也意味著，如果您忘記了加密密碼，您將無法訪問您的資料。';
			case 'login.faq.2.q': return '為什麼要使用兩個密碼？';
			case 'login.faq.2.a': return 'Nextcloud 密碼用於訪問雲端。 而加密密碼會在您的資料到達雲端之前對其進行「加密」。\n\n即使有人獲得了您 Nextcloud 帳號的訪問權限，您的筆記也將保持安全並使用單獨的密碼進行加密。 這為您提供了第二層安全保護來保護您的資料。';
			case 'appInfo.licenseNotice': return 'Saber  版權所有 (C) 2022  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
			case 'appInfo.debug': return 'DEBUG';
			case 'appInfo.licenseButton': return '點擊此處查看更多許可證資訊';
			case 'appInfo.privacyPolicyButton': return '點擊此處查看隱私權政策';
			case 'appInfo.sponsorButton': return '點擊此處贊助我或購買更多儲存空間';
			case 'update.updateAvailable': return '可用更新';
			case 'update.updateAvailableDescription': return '該應用程式的新版本可用。';
			case 'update.dismiss': return '忽略';
			case 'update.update': return '更新';
			case 'editor.toolbar.toggleColors': return '切換顏色 (Ctrl C)';
			case 'editor.toolbar.toggleEraser': return '切換橡皮擦 (Ctrl E)';
			case 'editor.toolbar.photo': return '照片';
			case 'editor.toolbar.toggleFingerDrawing': return '切換手寫 (Ctrl F)';
			case 'editor.toolbar.undo': return '復原';
			case 'editor.toolbar.redo': return '重做';
			case 'editor.toolbar.export': return '匯出 (Ctrl Shift S)';
			case 'editor.toolbar.exportAs': return '匯出為：';
			case 'editor.toolbar.text': return '文本';
			case 'editor.toolbar.fullscreen': return '切換到全螢幕 (F11)';
			case 'editor.pens.fountainPen': return '鋼筆';
			case 'editor.pens.ballpointPen': return '原子筆';
			case 'editor.pens.highlighter': return '螢光筆';
			case 'editor.penOptions.size': return '粗細';
			case 'editor.penOptions.sizeDragHint': return '向左或向右拖動以更改大小';
			case 'editor.imageOptions.title': return '圖片選項';
			case 'editor.imageOptions.invertible': return '反轉顏色';
			case 'editor.imageOptions.delete': return '刪除';
			case 'editor.imageOptions.download': return '下載';
			case 'editor.menu.clearPage': return '清除頁面';
			case 'editor.menu.clearAllPages': return '清除所有頁面';
			case 'editor.menu.lineHeight': return '行高';
			case 'editor.menu.lineHeightDescription': return '每行的高度';
			case 'editor.newerFileFormat.title': return '這篇筆記是使用較新版本的 Saber 編輯的';
			case 'editor.newerFileFormat.cancel': return '取消';
			case 'editor.newerFileFormat.readOnlyMode': return '唯讀模式';
			case 'editor.newerFileFormat.subtitle': return '編輯此筆記可能會導致某些資訊遺失。 您想忽略它並編輯它嗎？';
			case 'editor.newerFileFormat.allowEditing': return '允許編輯';
			case 'editor.quill.typeSomething': return '在這裡輸入一些內容...';
			default: return null;
		}
	}
}
