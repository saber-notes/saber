/// Generated file. Do not edit.
///
/// Locales: 6
/// Strings: 390 (65 per locale)
///
/// Built on 2022-11-14 at 14:59 UTC

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
	zh(languageCode: 'zh', build: _StringsZh.build),
	zhTw(languageCode: 'zh', countryCode: 'TW', build: _StringsZhTw.build);

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
	LocaleSettings._() : super(locales: AppLocale.values, baseLocale: _baseLocale, utils: AppLocaleUtils.instance);

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
}

// Path: appInfo
class _StringsAppInfoEn {
	_StringsAppInfoEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get licenseNotice => 'Saber  Copyright (C) 2022  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
	String get debug => 'DEBUG';
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
	String get editorAutoInvert => 'Invert notes in dark mode';
	String get preferGreyscale => 'Prefer greyscale colors';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get hyperlegibleFont => 'Atkinson Hyperlegible increases legibility for readers with low vision';
	String get shouldCheckForUpdates => 'Not necessary if you\'ve installed Saber through ___';
	String get defaultAppStore => 'an app store or package manager';
	String get editorAutoInvert => 'Smartly darkens notes in dark mode';
	String get preferGreyscale => 'For e-ink displays';
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

// Path: editor.toolbar
class _StringsEditorToolbarEn {
	_StringsEditorToolbarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get fountainPen => 'Fountain pen';
	String get highlighter => 'Highlighter';
	String get toggleColors => 'Toggle colors (Ctrl C)';
	String get toggleEraser => 'Toggle eraser (Ctrl E)';
	String get photo => 'Photo';
	String get toggleFingerDrawing => 'Toggle finger drawing (Ctrl F)';
	String get undo => 'Undo';
	String get redo => 'Redo';
	String get export => 'Export (Ctrl Shift S)';
	String get exportAs => 'Export as:';
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
}

// Path: update
class _StringsUpdateDe extends _StringsUpdateEn {
	_StringsUpdateDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Aktualisierung verfügbar';
	@override String get updateAvailableDescription => 'Eine neue Version der Anwendung ist verfügbar.';
	@override String get dismiss => 'Ausblenden';
	@override String get update => 'Aktualisieren';
}

// Path: editor
class _StringsEditorDe extends _StringsEditorEn {
	_StringsEditorDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarDe toolbar = _StringsEditorToolbarDe._(_root);
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
	@override String get newNote => 'Neue Notiz';
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
	@override String get editorToolbarOnBottom => 'Editor-Werkzeugleiste am unteren Rand ausrichten';
	@override String get editorAutoInvert => 'Notizen im Dunkelmodus invertieren';
	@override String get preferGreyscale => 'Graustufen bevorzugen';
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

// Path: editor.toolbar
class _StringsEditorToolbarDe extends _StringsEditorToolbarEn {
	_StringsEditorToolbarDe._(_StringsDe root) : this._root = root, super._(root);

	@override final _StringsDe _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Füllfederhalter';
	@override String get toggleColors => 'Farben umschalten (Strg + C)';
	@override String get toggleEraser => 'Radierer umschalten (Strg + E)';
	@override String get photo => 'Foto';
	@override String get toggleFingerDrawing => 'Fingerzeichnen umschalten (Strg + F)';
	@override String get undo => 'Rückgängig';
	@override String get redo => 'Wiederholen';
	@override String get export => 'Exportieren (Strg + Shift + S)';
	@override String get exportAs => 'Exportieren als:';
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
}

// Path: appInfo
class _StringsAppInfoEs extends _StringsAppInfoEn {
	_StringsAppInfoEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get licenseNotice => 'Saber  Copyright (C) 2022  Adil Hanney\nEste programa no tiene ninguna garantía. Es un software libre, y se puede redistribuir bajo ciertas condiciones.';
	@override String get debug => 'DEBUG';
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
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsEs extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible aumenta la legibilidad para lectores con poca visión';
	@override String get shouldCheckForUpdates => 'No es necesario si instalaste Saber a través de una tienda de aplicaciones o un administrador de paquetes';
	@override String get editorAutoInvert => 'Oscurece inteligentemente las notas en el modo oscuro';
	@override String get preferGreyscale => 'Para pantallas con tinta electrónica';
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

// Path: editor.toolbar
class _StringsEditorToolbarEs extends _StringsEditorToolbarEn {
	_StringsEditorToolbarEs._(_StringsEs root) : this._root = root, super._(root);

	@override final _StringsEs _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Lápiz';
	@override String get highlighter => 'Resaltador';
	@override String get toggleColors => 'Cambiar colores (Ctrl C)';
	@override String get toggleEraser => 'Borrador (Ctrl E)';
	@override String get photo => 'Foto';
	@override String get toggleFingerDrawing => 'Dibujar con el dedo (Ctrl F)';
	@override String get undo => 'Deshacer';
	@override String get redo => 'Rehacer';
	@override String get export => 'Exportar (Ctrl Shift S)';
	@override String get exportAs => 'Exportar cómo:';
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
}

// Path: home.tabs
class _StringsHomeTabsIt extends _StringsHomeTabsEn {
	_StringsHomeTabsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Home';
	@override String get browse => 'Sfoglia';
	@override String get whiteboard => 'Whiteboard';
	@override String get settings => 'Impostazioni';
}

// Path: home.titles
class _StringsHomeTitlesIt extends _StringsHomeTitlesEn {
	_StringsHomeTitlesIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Note recenti';
	@override String get browse => 'Tutte le note';
	@override String get whiteboard => 'Whiteboard';
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

// Path: editor.toolbar
class _StringsEditorToolbarIt extends _StringsEditorToolbarEn {
	_StringsEditorToolbarIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Penna stilografica';
	@override String get highlighter => 'Evidenziatore';
	@override String get toggleColors => 'Attiva/disattiva i colori (Ctrl C)';
	@override String get toggleEraser => 'Attiva/disattiva gomma (Ctrl E)';
	@override String get photo => 'Foto';
	@override String get toggleFingerDrawing => 'Attiva/disattiva il disegno con il dito (Ctrl F)';
	@override String get undo => 'Annulla';
	@override String get redo => 'Rifai';
	@override String get export => 'Esporta (Ctrl Shift S)';
	@override String get exportAs => 'Esporta come:';
}

// Path: <root>
class _StringsZh extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsZh.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _StringsZh _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeZh home = _StringsHomeZh._(_root);
	@override late final _StringsSettingsZh settings = _StringsSettingsZh._(_root);
	@override late final _StringsLoginZh login = _StringsLoginZh._(_root);
	@override late final _StringsAppInfoZh appInfo = _StringsAppInfoZh._(_root);
	@override late final _StringsUpdateZh update = _StringsUpdateZh._(_root);
	@override late final _StringsEditorZh editor = _StringsEditorZh._(_root);
}

// Path: home
class _StringsHomeZh extends _StringsHomeEn {
	_StringsHomeZh._(_StringsZh root) : this._root = root, super._(root);

	@override final _StringsZh _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsZh tabs = _StringsHomeTabsZh._(_root);
	@override late final _StringsHomeTitlesZh titles = _StringsHomeTitlesZh._(_root);
	@override late final _StringsHomeTooltipsZh tooltips = _StringsHomeTooltipsZh._(_root);
	@override String get backFolder => '(返回)';
	@override String get welcome => '欢迎使用 Saber';
	@override String get noFiles => '未找到文件';
	@override String get createNewNote => '点击 + 按钮新建一个笔记';
}

// Path: settings
class _StringsSettingsZh extends _StringsSettingsEn {
	_StringsSettingsZh._(_StringsZh root) : this._root = root, super._(root);

	@override final _StringsZh _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefLabelsZh prefLabels = _StringsSettingsPrefLabelsZh._(_root);
	@override late final _StringsSettingsPrefDescriptionsZh prefDescriptions = _StringsSettingsPrefDescriptionsZh._(_root);
	@override late final _StringsSettingsThemeModesZh themeModes = _StringsSettingsThemeModesZh._(_root);
	@override late final _StringsSettingsAccentColorPickerZh accentColorPicker = _StringsSettingsAccentColorPickerZh._(_root);
}

// Path: login
class _StringsLoginZh extends _StringsLoginEn {
	_StringsLoginZh._(_StringsZh root) : this._root = root, super._(root);

	@override final _StringsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '登录';
	@override late final _StringsLoginFeedbacksZh feedbacks = _StringsLoginFeedbacksZh._(_root);
	@override late final _StringsLoginFormZh form = _StringsLoginFormZh._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: '还没有帐户？ '),
		linkToSignup('立即注册'),
		const TextSpan(text: '！'),
	]);
	@override late final _StringsLoginStatusZh status = _StringsLoginStatusZh._(_root);
}

// Path: appInfo
class _StringsAppInfoZh extends _StringsAppInfoEn {
	_StringsAppInfoZh._(_StringsZh root) : this._root = root, super._(root);

	@override final _StringsZh _root; // ignore: unused_field

	// Translations
	@override String get licenseNotice => 'Saber  版权所有 (C) 2022  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
	@override String get debug => 'DEBUG';
	@override String get licenseButton => '点击此处查看更多许可证信息';
	@override String get privacyPolicyButton => '点击此处查看隐私政策';
}

// Path: update
class _StringsUpdateZh extends _StringsUpdateEn {
	_StringsUpdateZh._(_StringsZh root) : this._root = root, super._(root);

	@override final _StringsZh _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => '可用更新';
	@override String get updateAvailableDescription => '该应用程序的新版本可用。';
	@override String get dismiss => '忽略';
	@override String get update => '更新';
}

// Path: editor
class _StringsEditorZh extends _StringsEditorEn {
	_StringsEditorZh._(_StringsZh root) : this._root = root, super._(root);

	@override final _StringsZh _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarZh toolbar = _StringsEditorToolbarZh._(_root);
}

// Path: home.tabs
class _StringsHomeTabsZh extends _StringsHomeTabsEn {
	_StringsHomeTabsZh._(_StringsZh root) : this._root = root, super._(root);

	@override final _StringsZh _root; // ignore: unused_field

	// Translations
	@override String get home => '主页';
	@override String get browse => '全部笔记';
	@override String get whiteboard => '白板';
	@override String get settings => '设置';
}

// Path: home.titles
class _StringsHomeTitlesZh extends _StringsHomeTitlesEn {
	_StringsHomeTitlesZh._(_StringsZh root) : this._root = root, super._(root);

	@override final _StringsZh _root; // ignore: unused_field

	// Translations
	@override String get home => '最近笔记';
	@override String get browse => '全部笔记';
	@override String get whiteboard => '白板';
	@override String get settings => '设置';
}

// Path: home.tooltips
class _StringsHomeTooltipsZh extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsZh._(_StringsZh root) : this._root = root, super._(root);

	@override final _StringsZh _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新建笔记';
	@override String get showUpdateDialog => '显示更新对话框';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsZh extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsZh._(_StringsZh root) : this._root = root, super._(root);

	@override final _StringsZh _root; // ignore: unused_field

	// Translations
	@override String get appTheme => '应用主题';
	@override String get customAccentColor => '自定义主题色';
	@override String get hyperlegibleFont => '易读字体';
	@override String get shouldCheckForUpdates => '自动检查 Saber 更新';
	@override String get editorToolbarOnBottom => '将编辑工具栏与底部对齐';
	@override String get editorAutoInvert => '在深色模式下使用反色笔记背景';
	@override String get preferGreyscale => '使用灰度颜色';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsZh extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsZh._(_StringsZh root) : this._root = root, super._(root);

	@override final _StringsZh _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible 字体为低视力读者提高易读性';
	@override String get shouldCheckForUpdates => '如果您通过应用商店或软件包管理器安装了 Saber，则不需要';
	@override String get editorAutoInvert => '在深色模式下自动使用反色笔记背景';
	@override String get preferGreyscale => '用于电子墨水显示器';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesZh extends _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesZh._(_StringsZh root) : this._root = root, super._(root);

	@override final _StringsZh _root; // ignore: unused_field

	// Translations
	@override String get system => '系统';
	@override String get light => '浅色';
	@override String get dark => '深色';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerZh extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerZh._(_StringsZh root) : this._root = root, super._(root);

	@override final _StringsZh _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => '选取颜色';
	@override String get confirm => '确定';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksZh extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksZh._(_StringsZh root) : this._root = root, super._(root);

	@override final _StringsZh _root; // ignore: unused_field

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
class _StringsLoginFormZh extends _StringsLoginFormEn {
	_StringsLoginFormZh._(_StringsZh root) : this._root = root, super._(root);

	@override final _StringsZh _root; // ignore: unused_field

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
class _StringsLoginStatusZh extends _StringsLoginStatusEn {
	_StringsLoginStatusZh._(_StringsZh root) : this._root = root, super._(root);

	@override final _StringsZh _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => '已使用 Nextcloud 登录';
	@override String get loggedOut => '已注销';
	@override String get tapToLogin => '点击以使用 Nextcloud 登录';
}

// Path: editor.toolbar
class _StringsEditorToolbarZh extends _StringsEditorToolbarEn {
	_StringsEditorToolbarZh._(_StringsZh root) : this._root = root, super._(root);

	@override final _StringsZh _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => '钢笔';
	@override String get highlighter => '荧光笔';
	@override String get toggleColors => '切换颜色 (Ctrl C)';
	@override String get toggleEraser => '切换橡皮擦 (Ctrl E)';
	@override String get photo => '照片';
	@override String get toggleFingerDrawing => '切换手写 (Ctrl F)';
	@override String get undo => '撤销';
	@override String get redo => '重做';
	@override String get export => '导出 (Ctrl Shift S)';
	@override String get exportAs => '导出为：';
}

// Path: <root>
class _StringsZhTw extends _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsZhTw.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.zhTw,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-TW>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _StringsZhTw _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsHomeZhTw home = _StringsHomeZhTw._(_root);
	@override late final _StringsSettingsZhTw settings = _StringsSettingsZhTw._(_root);
	@override late final _StringsLoginZhTw login = _StringsLoginZhTw._(_root);
	@override late final _StringsAppInfoZhTw appInfo = _StringsAppInfoZhTw._(_root);
	@override late final _StringsUpdateZhTw update = _StringsUpdateZhTw._(_root);
	@override late final _StringsEditorZhTw editor = _StringsEditorZhTw._(_root);
}

// Path: home
class _StringsHomeZhTw extends _StringsHomeEn {
	_StringsHomeZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override late final _StringsHomeTabsZhTw tabs = _StringsHomeTabsZhTw._(_root);
	@override late final _StringsHomeTitlesZhTw titles = _StringsHomeTitlesZhTw._(_root);
	@override late final _StringsHomeTooltipsZhTw tooltips = _StringsHomeTooltipsZhTw._(_root);
	@override String get backFolder => '(返回)';
	@override String get welcome => '歡迎使用 Saber';
	@override String get noFiles => '未找到檔案';
	@override String get createNewNote => '點擊 + 按鈕新增一個筆記';
}

// Path: settings
class _StringsSettingsZhTw extends _StringsSettingsEn {
	_StringsSettingsZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override late final _StringsSettingsPrefLabelsZhTw prefLabels = _StringsSettingsPrefLabelsZhTw._(_root);
	@override late final _StringsSettingsPrefDescriptionsZhTw prefDescriptions = _StringsSettingsPrefDescriptionsZhTw._(_root);
	@override late final _StringsSettingsThemeModesZhTw themeModes = _StringsSettingsThemeModesZhTw._(_root);
	@override late final _StringsSettingsAccentColorPickerZhTw accentColorPicker = _StringsSettingsAccentColorPickerZhTw._(_root);
}

// Path: login
class _StringsLoginZhTw extends _StringsLoginEn {
	_StringsLoginZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '登入';
	@override late final _StringsLoginFeedbacksZhTw feedbacks = _StringsLoginFeedbacksZhTw._(_root);
	@override late final _StringsLoginFormZhTw form = _StringsLoginFormZhTw._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: '還沒有帳號？ '),
		linkToSignup('立即註冊'),
		const TextSpan(text: '！'),
	]);
	@override late final _StringsLoginStatusZhTw status = _StringsLoginStatusZhTw._(_root);
}

// Path: appInfo
class _StringsAppInfoZhTw extends _StringsAppInfoEn {
	_StringsAppInfoZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get licenseNotice => 'Saber  版權所有 (C) 2022  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
	@override String get debug => 'DEBUG';
	@override String get licenseButton => '點擊此處查看更多許可證資訊';
	@override String get privacyPolicyButton => '點擊此處查看隱私權政策';
}

// Path: update
class _StringsUpdateZhTw extends _StringsUpdateEn {
	_StringsUpdateZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => '可用更新';
	@override String get updateAvailableDescription => '該應用程式的新版本可用。';
	@override String get dismiss => '忽略';
	@override String get update => '更新';
}

// Path: editor
class _StringsEditorZhTw extends _StringsEditorEn {
	_StringsEditorZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override late final _StringsEditorToolbarZhTw toolbar = _StringsEditorToolbarZhTw._(_root);
}

// Path: home.tabs
class _StringsHomeTabsZhTw extends _StringsHomeTabsEn {
	_StringsHomeTabsZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get home => '首頁';
	@override String get browse => '全部筆記';
	@override String get whiteboard => '白板';
	@override String get settings => '設定';
}

// Path: home.titles
class _StringsHomeTitlesZhTw extends _StringsHomeTitlesEn {
	_StringsHomeTitlesZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get home => '最近筆記';
	@override String get browse => '全部筆記';
	@override String get whiteboard => '白板';
	@override String get settings => '設定';
}

// Path: home.tooltips
class _StringsHomeTooltipsZhTw extends _StringsHomeTooltipsEn {
	_StringsHomeTooltipsZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新增筆記';
	@override String get showUpdateDialog => '顯示更新對話框';
}

// Path: settings.prefLabels
class _StringsSettingsPrefLabelsZhTw extends _StringsSettingsPrefLabelsEn {
	_StringsSettingsPrefLabelsZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get appTheme => '應用程式主題';
	@override String get customAccentColor => '自訂主題色';
	@override String get hyperlegibleFont => '易讀字體';
	@override String get shouldCheckForUpdates => '自動檢查 Saber 更新';
	@override String get editorToolbarOnBottom => '將編輯工具列與底部對齊';
	@override String get editorAutoInvert => '在深色模式下使用反色筆記背景';
	@override String get preferGreyscale => '使用灰度顏色';
}

// Path: settings.prefDescriptions
class _StringsSettingsPrefDescriptionsZhTw extends _StringsSettingsPrefDescriptionsEn {
	_StringsSettingsPrefDescriptionsZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible 字體為低視力讀者提高易讀性';
	@override String get shouldCheckForUpdates => '如果您透過應用程式商店或軟體套件管理系統安裝了 Saber，則不需要';
	@override String get editorAutoInvert => '在深色模式下自動使用反色筆記背景';
	@override String get preferGreyscale => '用於電子紙螢幕';
}

// Path: settings.themeModes
class _StringsSettingsThemeModesZhTw extends _StringsSettingsThemeModesEn {
	_StringsSettingsThemeModesZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get system => '系統';
	@override String get light => '淺色';
	@override String get dark => '深色';
}

// Path: settings.accentColorPicker
class _StringsSettingsAccentColorPickerZhTw extends _StringsSettingsAccentColorPickerEn {
	_StringsSettingsAccentColorPickerZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => '選取顏色';
	@override String get confirm => '確定';
}

// Path: login.feedbacks
class _StringsLoginFeedbacksZhTw extends _StringsLoginFeedbacksEn {
	_StringsLoginFeedbacksZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

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
class _StringsLoginFormZhTw extends _StringsLoginFormEn {
	_StringsLoginFormZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

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
class _StringsLoginStatusZhTw extends _StringsLoginStatusEn {
	_StringsLoginStatusZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get loggedIn => '已使用 Nextcloud 登入';
	@override String get loggedOut => '已登出';
	@override String get tapToLogin => '點擊以使用 Nextcloud 登入';
}

// Path: editor.toolbar
class _StringsEditorToolbarZhTw extends _StringsEditorToolbarEn {
	_StringsEditorToolbarZhTw._(_StringsZhTw root) : this._root = root, super._(root);

	@override final _StringsZhTw _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => '鋼筆';
	@override String get highlighter => '螢光筆';
	@override String get toggleColors => '切換顏色 (Ctrl C)';
	@override String get toggleEraser => '切換橡皮擦 (Ctrl E)';
	@override String get photo => '照片';
	@override String get toggleFingerDrawing => '切換手寫 (Ctrl F)';
	@override String get undo => '復原';
	@override String get redo => '重做';
	@override String get export => '匯出 (Ctrl Shift S)';
	@override String get exportAs => '匯出為：';
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
			case 'settings.prefLabels.editorAutoInvert': return 'Invert notes in dark mode';
			case 'settings.prefLabels.preferGreyscale': return 'Prefer greyscale colors';
			case 'settings.prefDescriptions.hyperlegibleFont': return 'Atkinson Hyperlegible increases legibility for readers with low vision';
			case 'settings.prefDescriptions.shouldCheckForUpdates': return 'Not necessary if you\'ve installed Saber through ___';
			case 'settings.prefDescriptions.defaultAppStore': return 'an app store or package manager';
			case 'settings.prefDescriptions.editorAutoInvert': return 'Smartly darkens notes in dark mode';
			case 'settings.prefDescriptions.preferGreyscale': return 'For e-ink displays';
			case 'settings.themeModes.system': return 'System';
			case 'settings.themeModes.light': return 'Light';
			case 'settings.themeModes.dark': return 'Dark';
			case 'settings.accentColorPicker.pickAColor': return 'Pick a color';
			case 'settings.accentColorPicker.confirm': return 'Confirm';
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
			case 'appInfo.licenseNotice': return 'Saber  Copyright (C) 2022  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
			case 'appInfo.debug': return 'DEBUG';
			case 'appInfo.licenseButton': return 'Tap here to view more license information';
			case 'appInfo.privacyPolicyButton': return 'Tap here to view the privacy policy';
			case 'update.updateAvailable': return 'Update available';
			case 'update.updateAvailableDescription': return 'A new version of the app is available.';
			case 'update.dismiss': return 'Dismiss';
			case 'update.update': return 'Update';
			case 'editor.toolbar.fountainPen': return 'Fountain pen';
			case 'editor.toolbar.highlighter': return 'Highlighter';
			case 'editor.toolbar.toggleColors': return 'Toggle colors (Ctrl C)';
			case 'editor.toolbar.toggleEraser': return 'Toggle eraser (Ctrl E)';
			case 'editor.toolbar.photo': return 'Photo';
			case 'editor.toolbar.toggleFingerDrawing': return 'Toggle finger drawing (Ctrl F)';
			case 'editor.toolbar.undo': return 'Undo';
			case 'editor.toolbar.redo': return 'Redo';
			case 'editor.toolbar.export': return 'Export (Ctrl Shift S)';
			case 'editor.toolbar.exportAs': return 'Export as:';
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
			case 'home.tooltips.newNote': return 'Neue Notiz';
			case 'home.tooltips.showUpdateDialog': return 'Aktualisierungsdialog anzeigen';
			case 'home.backFolder': return '(Zurück)';
			case 'home.welcome': return 'Willkommen bei Saber';
			case 'home.noFiles': return 'Keine Dateien gefunden';
			case 'home.createNewNote': return 'Drücke die + Schaltfläche, um eine neue Notiz zu erstellen';
			case 'settings.prefLabels.appTheme': return 'Anwendungsthema';
			case 'settings.prefLabels.customAccentColor': return 'Benutzerdefinierte Akzentfarbe';
			case 'settings.prefLabels.shouldCheckForUpdates': return 'Suche automatisch nach Saber-Aktualisierungen';
			case 'settings.prefLabels.editorToolbarOnBottom': return 'Editor-Werkzeugleiste am unteren Rand ausrichten';
			case 'settings.prefLabels.editorAutoInvert': return 'Notizen im Dunkelmodus invertieren';
			case 'settings.prefLabels.preferGreyscale': return 'Graustufen bevorzugen';
			case 'settings.themeModes.system': return 'System';
			case 'settings.themeModes.light': return 'Hell';
			case 'settings.themeModes.dark': return 'Dunkel';
			case 'settings.accentColorPicker.pickAColor': return 'Wähle eine Farbe';
			case 'settings.accentColorPicker.confirm': return 'Bestätigen';
			case 'login.title': return 'Login';
			case 'login.feedbacks.checkUsername': return 'Bitte überprüfe deinen Benutzernamen oder deine E-Mail.';
			case 'login.feedbacks.enterNcPassword': return 'Bitte gib dein Nextcloud-Passwort ein.';
			case 'login.feedbacks.enterEncPassword': return 'Bitte gib dein Verschlüsselungspasswort ein.';
			case 'login.feedbacks.checkUrl': return 'Bitte gib eine gültige URL an.';
			case 'login.feedbacks.ncLoginFailed': return 'Anmeldung fehlgeschlagen, bitte überprüfe deine Angaben und deine Netzwerkverbindung.';
			case 'login.feedbacks.loginSuccess': return 'Anmeldung erfolgreich! Bitte warte, während wir alles einrichten...';
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
			case 'appInfo.licenseNotice': return 'Saber  Copyright (C) 2022  Adil Hanney\nDieses Programm kommt ohne jegliche Gewährleistung. Dies ist freie Software und du bist herzlich eingeladen, diese unter bestimmten Bedingungen weiterzuverteilen.';
			case 'appInfo.debug': return 'DEBUG';
			case 'appInfo.licenseButton': return 'Hier tippen, um weitere Lizenzinformationen anzuzeigen';
			case 'appInfo.privacyPolicyButton': return 'Hier tippen, um die Datenschutzrichtlinie anzuzeigen';
			case 'update.updateAvailable': return 'Aktualisierung verfügbar';
			case 'update.updateAvailableDescription': return 'Eine neue Version der Anwendung ist verfügbar.';
			case 'update.dismiss': return 'Ausblenden';
			case 'update.update': return 'Aktualisieren';
			case 'editor.toolbar.fountainPen': return 'Füllfederhalter';
			case 'editor.toolbar.toggleColors': return 'Farben umschalten (Strg + C)';
			case 'editor.toolbar.toggleEraser': return 'Radierer umschalten (Strg + E)';
			case 'editor.toolbar.photo': return 'Foto';
			case 'editor.toolbar.toggleFingerDrawing': return 'Fingerzeichnen umschalten (Strg + F)';
			case 'editor.toolbar.undo': return 'Rückgängig';
			case 'editor.toolbar.redo': return 'Wiederholen';
			case 'editor.toolbar.export': return 'Exportieren (Strg + Shift + S)';
			case 'editor.toolbar.exportAs': return 'Exportieren als:';
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
			case 'settings.prefDescriptions.hyperlegibleFont': return 'Atkinson Hyperlegible aumenta la legibilidad para lectores con poca visión';
			case 'settings.prefDescriptions.shouldCheckForUpdates': return 'No es necesario si instalaste Saber a través de una tienda de aplicaciones o un administrador de paquetes';
			case 'settings.prefDescriptions.editorAutoInvert': return 'Oscurece inteligentemente las notas en el modo oscuro';
			case 'settings.prefDescriptions.preferGreyscale': return 'Para pantallas con tinta electrónica';
			case 'settings.themeModes.system': return 'Sistema';
			case 'settings.themeModes.light': return 'Claro';
			case 'settings.themeModes.dark': return 'Oscuro';
			case 'settings.accentColorPicker.pickAColor': return 'Elegir un color';
			case 'settings.accentColorPicker.confirm': return 'Confirmar';
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
			case 'appInfo.licenseNotice': return 'Saber  Copyright (C) 2022  Adil Hanney\nEste programa no tiene ninguna garantía. Es un software libre, y se puede redistribuir bajo ciertas condiciones.';
			case 'appInfo.debug': return 'DEBUG';
			case 'appInfo.licenseButton': return 'Toca aquí para ver más información sobre la licencia';
			case 'appInfo.privacyPolicyButton': return 'Toca aquí para ver nuestra política de privacidad';
			case 'update.updateAvailable': return 'Actualización disponible';
			case 'update.updateAvailableDescription': return 'Hay una nueva versión de la aplicación disponible.';
			case 'update.dismiss': return 'Ignorar';
			case 'update.update': return 'Actualizar';
			case 'editor.toolbar.fountainPen': return 'Lápiz';
			case 'editor.toolbar.highlighter': return 'Resaltador';
			case 'editor.toolbar.toggleColors': return 'Cambiar colores (Ctrl C)';
			case 'editor.toolbar.toggleEraser': return 'Borrador (Ctrl E)';
			case 'editor.toolbar.photo': return 'Foto';
			case 'editor.toolbar.toggleFingerDrawing': return 'Dibujar con el dedo (Ctrl F)';
			case 'editor.toolbar.undo': return 'Deshacer';
			case 'editor.toolbar.redo': return 'Rehacer';
			case 'editor.toolbar.export': return 'Exportar (Ctrl Shift S)';
			case 'editor.toolbar.exportAs': return 'Exportar cómo:';
			default: return null;
		}
	}
}

extension on _StringsIt {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.tabs.home': return 'Home';
			case 'home.tabs.browse': return 'Sfoglia';
			case 'home.tabs.whiteboard': return 'Whiteboard';
			case 'home.tabs.settings': return 'Impostazioni';
			case 'home.titles.home': return 'Note recenti';
			case 'home.titles.browse': return 'Tutte le note';
			case 'home.titles.whiteboard': return 'Whiteboard';
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
			case 'settings.themeModes.system': return 'Sistema';
			case 'settings.themeModes.light': return 'Chiaro';
			case 'settings.themeModes.dark': return 'Scuro';
			case 'settings.accentColorPicker.pickAColor': return 'Scegli un colore';
			case 'settings.accentColorPicker.confirm': return 'Conferma';
			case 'login.title': return 'Login';
			case 'login.feedbacks.checkUsername': return 'Ricontrolla il tuo nome utente o e-mail.';
			case 'login.feedbacks.enterNcPassword': return 'Inserisci la tua password Nextcloud.';
			case 'login.feedbacks.enterEncPassword': return 'Inserisci la tua password di crittografata.';
			case 'login.feedbacks.checkUrl': return 'Per favore, inserisci un URL valido.';
			case 'login.feedbacks.ncLoginFailed': return 'Accesso fallito, controlla i tuoi dati e la connessione di rete.';
			case 'login.feedbacks.loginSuccess': return 'Accesso riuscito! Si prega di attendere mentre configuriamo...';
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
			case 'appInfo.licenseNotice': return 'Sabre Copyright (C) 2022 Adil Hanney\nQuesto programma non ha alcuna garanzia. Questo è un software libero e sei libero di ridistribuirlo a determinate condizioni.';
			case 'appInfo.debug': return 'DEBUG';
			case 'appInfo.licenseButton': return 'Tocca qui per visualizzare ulteriori informazioni sulla licenza';
			case 'appInfo.privacyPolicyButton': return 'Tocca qui per visualizzare l\'informativa sulla privacy';
			case 'update.updateAvailable': return 'Aggiornamento disponibile';
			case 'update.updateAvailableDescription': return 'È disponibile una nuova versione dell\'app.';
			case 'update.dismiss': return 'Abbandona';
			case 'update.update': return 'Aggiornamento';
			case 'editor.toolbar.fountainPen': return 'Penna stilografica';
			case 'editor.toolbar.highlighter': return 'Evidenziatore';
			case 'editor.toolbar.toggleColors': return 'Attiva/disattiva i colori (Ctrl C)';
			case 'editor.toolbar.toggleEraser': return 'Attiva/disattiva gomma (Ctrl E)';
			case 'editor.toolbar.photo': return 'Foto';
			case 'editor.toolbar.toggleFingerDrawing': return 'Attiva/disattiva il disegno con il dito (Ctrl F)';
			case 'editor.toolbar.undo': return 'Annulla';
			case 'editor.toolbar.redo': return 'Rifai';
			case 'editor.toolbar.export': return 'Esporta (Ctrl Shift S)';
			case 'editor.toolbar.exportAs': return 'Esporta come:';
			default: return null;
		}
	}
}

extension on _StringsZh {
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
			case 'settings.prefDescriptions.hyperlegibleFont': return 'Atkinson Hyperlegible 字体为低视力读者提高易读性';
			case 'settings.prefDescriptions.shouldCheckForUpdates': return '如果您通过应用商店或软件包管理器安装了 Saber，则不需要';
			case 'settings.prefDescriptions.editorAutoInvert': return '在深色模式下自动使用反色笔记背景';
			case 'settings.prefDescriptions.preferGreyscale': return '用于电子墨水显示器';
			case 'settings.themeModes.system': return '系统';
			case 'settings.themeModes.light': return '浅色';
			case 'settings.themeModes.dark': return '深色';
			case 'settings.accentColorPicker.pickAColor': return '选取颜色';
			case 'settings.accentColorPicker.confirm': return '确定';
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
			case 'appInfo.licenseNotice': return 'Saber  版权所有 (C) 2022  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
			case 'appInfo.debug': return 'DEBUG';
			case 'appInfo.licenseButton': return '点击此处查看更多许可证信息';
			case 'appInfo.privacyPolicyButton': return '点击此处查看隐私政策';
			case 'update.updateAvailable': return '可用更新';
			case 'update.updateAvailableDescription': return '该应用程序的新版本可用。';
			case 'update.dismiss': return '忽略';
			case 'update.update': return '更新';
			case 'editor.toolbar.fountainPen': return '钢笔';
			case 'editor.toolbar.highlighter': return '荧光笔';
			case 'editor.toolbar.toggleColors': return '切换颜色 (Ctrl C)';
			case 'editor.toolbar.toggleEraser': return '切换橡皮擦 (Ctrl E)';
			case 'editor.toolbar.photo': return '照片';
			case 'editor.toolbar.toggleFingerDrawing': return '切换手写 (Ctrl F)';
			case 'editor.toolbar.undo': return '撤销';
			case 'editor.toolbar.redo': return '重做';
			case 'editor.toolbar.export': return '导出 (Ctrl Shift S)';
			case 'editor.toolbar.exportAs': return '导出为：';
			default: return null;
		}
	}
}

extension on _StringsZhTw {
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
			case 'settings.prefDescriptions.hyperlegibleFont': return 'Atkinson Hyperlegible 字體為低視力讀者提高易讀性';
			case 'settings.prefDescriptions.shouldCheckForUpdates': return '如果您透過應用程式商店或軟體套件管理系統安裝了 Saber，則不需要';
			case 'settings.prefDescriptions.editorAutoInvert': return '在深色模式下自動使用反色筆記背景';
			case 'settings.prefDescriptions.preferGreyscale': return '用於電子紙螢幕';
			case 'settings.themeModes.system': return '系統';
			case 'settings.themeModes.light': return '淺色';
			case 'settings.themeModes.dark': return '深色';
			case 'settings.accentColorPicker.pickAColor': return '選取顏色';
			case 'settings.accentColorPicker.confirm': return '確定';
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
			case 'appInfo.licenseNotice': return 'Saber  版權所有 (C) 2022  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
			case 'appInfo.debug': return 'DEBUG';
			case 'appInfo.licenseButton': return '點擊此處查看更多許可證資訊';
			case 'appInfo.privacyPolicyButton': return '點擊此處查看隱私權政策';
			case 'update.updateAvailable': return '可用更新';
			case 'update.updateAvailableDescription': return '該應用程式的新版本可用。';
			case 'update.dismiss': return '忽略';
			case 'update.update': return '更新';
			case 'editor.toolbar.fountainPen': return '鋼筆';
			case 'editor.toolbar.highlighter': return '螢光筆';
			case 'editor.toolbar.toggleColors': return '切換顏色 (Ctrl C)';
			case 'editor.toolbar.toggleEraser': return '切換橡皮擦 (Ctrl E)';
			case 'editor.toolbar.photo': return '照片';
			case 'editor.toolbar.toggleFingerDrawing': return '切換手寫 (Ctrl F)';
			case 'editor.toolbar.undo': return '復原';
			case 'editor.toolbar.redo': return '重做';
			case 'editor.toolbar.export': return '匯出 (Ctrl Shift S)';
			case 'editor.toolbar.exportAs': return '匯出為：';
			default: return null;
		}
	}
}
