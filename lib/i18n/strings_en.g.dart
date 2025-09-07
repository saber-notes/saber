///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  );

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsCommonEn common = TranslationsCommonEn.internal(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn.internal(_root);
	late final TranslationsSentryEn sentry = TranslationsSentryEn.internal(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn.internal(_root);
	late final TranslationsLogsEn logs = TranslationsLogsEn.internal(_root);
	late final TranslationsLoginEn login = TranslationsLoginEn.internal(_root);
	late final TranslationsProfileEn profile = TranslationsProfileEn.internal(_root);
	late final TranslationsAppInfoEn appInfo = TranslationsAppInfoEn.internal(_root);
	late final TranslationsUpdateEn update = TranslationsUpdateEn.internal(_root);
	late final TranslationsEditorEn editor = TranslationsEditorEn.internal(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Done'
	String get done => 'Done';

	/// en: 'Continue'
	String get continueBtn => 'Continue';

	/// en: 'Cancel'
	String get cancel => 'Cancel';
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsHomeTabsEn tabs = TranslationsHomeTabsEn.internal(_root);
	late final TranslationsHomeTitlesEn titles = TranslationsHomeTitlesEn.internal(_root);
	late final TranslationsHomeTooltipsEn tooltips = TranslationsHomeTooltipsEn.internal(_root);
	late final TranslationsHomeCreateEn create = TranslationsHomeCreateEn.internal(_root);

	/// en: 'Welcome to Saber'
	String get welcome => 'Welcome to Saber';

	/// en: 'The file you selected is not supported. Please select an sbn, sbn2, sba, or pdf file.'
	String get invalidFormat => 'The file you selected is not supported. Please select an sbn, sbn2, sba, or pdf file.';

	/// en: 'No files found'
	String get noFiles => 'No files found';

	/// en: 'No preview available'
	String get noPreviewAvailable => 'No preview available';

	/// en: 'Tap the + button to create a new note'
	String get createNewNote => 'Tap the + button to create a new note';

	/// en: 'Go back to the previous folder'
	String get backFolder => 'Go back to the previous folder';

	late final TranslationsHomeNewFolderEn newFolder = TranslationsHomeNewFolderEn.internal(_root);
	late final TranslationsHomeRenameNoteEn renameNote = TranslationsHomeRenameNoteEn.internal(_root);
	late final TranslationsHomeMoveNoteEn moveNote = TranslationsHomeMoveNoteEn.internal(_root);

	/// en: 'Delete note'
	String get deleteNote => 'Delete note';

	late final TranslationsHomeRenameFolderEn renameFolder = TranslationsHomeRenameFolderEn.internal(_root);
	late final TranslationsHomeDeleteFolderEn deleteFolder = TranslationsHomeDeleteFolderEn.internal(_root);
}

// Path: sentry
class TranslationsSentryEn {
	TranslationsSentryEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSentryConsentEn consent = TranslationsSentryConsentEn.internal(_root);
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSettingsPrefCategoriesEn prefCategories = TranslationsSettingsPrefCategoriesEn.internal(_root);
	late final TranslationsSettingsPrefLabelsEn prefLabels = TranslationsSettingsPrefLabelsEn.internal(_root);
	late final TranslationsSettingsPrefDescriptionsEn prefDescriptions = TranslationsSettingsPrefDescriptionsEn.internal(_root);
	late final TranslationsSettingsThemeModesEn themeModes = TranslationsSettingsThemeModesEn.internal(_root);
	late final TranslationsSettingsLayoutSizesEn layoutSizes = TranslationsSettingsLayoutSizesEn.internal(_root);
	late final TranslationsSettingsAccentColorPickerEn accentColorPicker = TranslationsSettingsAccentColorPickerEn.internal(_root);

	/// en: 'Auto'
	String get systemLanguage => 'Auto';

	List<String> get axisDirections => [
		'Top',
		'Right',
		'Bottom',
		'Left',
	];
	late final TranslationsSettingsResetEn reset = TranslationsSettingsResetEn.internal(_root);

	/// en: 'Resync everything'
	String get resyncEverything => 'Resync everything';

	/// en: 'Open Saber folder'
	String get openDataDir => 'Open Saber folder';

	late final TranslationsSettingsCustomDataDirEn customDataDir = TranslationsSettingsCustomDataDirEn.internal(_root);

	/// en: 'Never'
	String get autosaveDisabled => 'Never';

	/// en: 'Never'
	String get shapeRecognitionDisabled => 'Never';
}

// Path: logs
class TranslationsLogsEn {
	TranslationsLogsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Logs'
	String get logs => 'Logs';

	/// en: 'View logs'
	String get viewLogs => 'View logs';

	/// en: 'Logs contain information useful for debugging and development'
	String get debuggingInfo => 'Logs contain information useful for debugging and development';

	/// en: 'No logs here!'
	String get noLogs => 'No logs here!';

	/// en: 'Logs will appear here as you use the app'
	String get useTheApp => 'Logs will appear here as you use the app';
}

// Path: login
class TranslationsLoginEn {
	TranslationsLoginEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Login'
	String get title => 'Login';

	late final TranslationsLoginFormEn form = TranslationsLoginFormEn.internal(_root);

	/// en: 'Don't have an account yet? ${linkToSignup(Sign up now)}!'
	TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Don\'t have an account yet? '),
		linkToSignup('Sign up now'),
		const TextSpan(text: '!'),
	]);

	/// en: 'Not you? ${undoLogin(Choose another account)}.'
	TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'Not you? '),
		undoLogin('Choose another account'),
		const TextSpan(text: '.'),
	]);

	late final TranslationsLoginStatusEn status = TranslationsLoginStatusEn.internal(_root);
	late final TranslationsLoginNcLoginStepEn ncLoginStep = TranslationsLoginNcLoginStepEn.internal(_root);
	late final TranslationsLoginEncLoginStepEn encLoginStep = TranslationsLoginEncLoginStepEn.internal(_root);
}

// Path: profile
class TranslationsProfileEn {
	TranslationsProfileEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'My profile'
	String get title => 'My profile';

	/// en: 'Log out'
	String get logout => 'Log out';

	/// en: 'You're using $used of $total ($percent%)'
	String quotaUsage({required Object used, required Object total, required Object percent}) => 'You\'re using ${used} of ${total} (${percent}%)';

	/// en: 'Connected to'
	String get connectedTo => 'Connected to';

	late final TranslationsProfileQuickLinksEn quickLinks = TranslationsProfileQuickLinksEn.internal(_root);

	/// en: 'Frequently asked questions'
	String get faqTitle => 'Frequently asked questions';

	List<dynamic> get faq => [
		TranslationsProfile$faq$0i0$En.internal(_root),
		TranslationsProfile$faq$0i1$En.internal(_root),
		TranslationsProfile$faq$0i2$En.internal(_root),
		TranslationsProfile$faq$0i3$En.internal(_root),
	];
}

// Path: appInfo
class TranslationsAppInfoEn {
	TranslationsAppInfoEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Saber Copyright © 2022-$buildYear Adil Hanney This program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.'
	String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';

	/// en: 'DIRTY'
	String get dirty => 'DIRTY';

	/// en: 'DEBUG'
	String get debug => 'DEBUG';

	/// en: 'Tap here to sponsor me or buy more storage'
	String get sponsorButton => 'Tap here to sponsor me or buy more storage';

	/// en: 'Tap here to view more license information'
	String get licenseButton => 'Tap here to view more license information';

	/// en: 'Tap here to view the privacy policy'
	String get privacyPolicyButton => 'Tap here to view the privacy policy';
}

// Path: update
class TranslationsUpdateEn {
	TranslationsUpdateEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Update available'
	String get updateAvailable => 'Update available';

	/// en: 'A new version of the app is available:'
	String get updateAvailableDescription => 'A new version of the app is available:';

	/// en: 'Update'
	String get update => 'Update';

	/// en: 'The download isn't available yet for your platform. Please check back shortly.'
	String get downloadNotAvailableYet => 'The download isn\'t available yet for your platform. Please check back shortly.';
}

// Path: editor
class TranslationsEditorEn {
	TranslationsEditorEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsEditorToolbarEn toolbar = TranslationsEditorToolbarEn.internal(_root);
	late final TranslationsEditorPensEn pens = TranslationsEditorPensEn.internal(_root);
	late final TranslationsEditorPenOptionsEn penOptions = TranslationsEditorPenOptionsEn.internal(_root);
	late final TranslationsEditorColorsEn colors = TranslationsEditorColorsEn.internal(_root);
	late final TranslationsEditorImageOptionsEn imageOptions = TranslationsEditorImageOptionsEn.internal(_root);
	late final TranslationsEditorSelectionBarEn selectionBar = TranslationsEditorSelectionBarEn.internal(_root);
	late final TranslationsEditorMenuEn menu = TranslationsEditorMenuEn.internal(_root);
	late final TranslationsEditorNewerFileFormatEn newerFileFormat = TranslationsEditorNewerFileFormatEn.internal(_root);
	late final TranslationsEditorQuillEn quill = TranslationsEditorQuillEn.internal(_root);
	late final TranslationsEditorHudEn hud = TranslationsEditorHudEn.internal(_root);

	/// en: 'Pages'
	String get pages => 'Pages';

	/// en: 'Untitled'
	String get untitled => 'Untitled';

	/// en: 'Saving your changes... You can safely exit the editor when it's done'
	String get needsToSaveBeforeExiting => 'Saving your changes... You can safely exit the editor when it\'s done';
}

// Path: home.tabs
class TranslationsHomeTabsEn {
	TranslationsHomeTabsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Browse'
	String get browse => 'Browse';

	/// en: 'Whiteboard'
	String get whiteboard => 'Whiteboard';

	/// en: 'Settings'
	String get settings => 'Settings';
}

// Path: home.titles
class TranslationsHomeTitlesEn {
	TranslationsHomeTitlesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Recent notes'
	String get home => 'Recent notes';

	/// en: 'Browse'
	String get browse => 'Browse';

	/// en: 'Whiteboard'
	String get whiteboard => 'Whiteboard';

	/// en: 'Settings'
	String get settings => 'Settings';
}

// Path: home.tooltips
class TranslationsHomeTooltipsEn {
	TranslationsHomeTooltipsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'New note'
	String get newNote => 'New note';

	/// en: 'Show update dialog'
	String get showUpdateDialog => 'Show update dialog';

	/// en: 'Export note'
	String get exportNote => 'Export note';
}

// Path: home.create
class TranslationsHomeCreateEn {
	TranslationsHomeCreateEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'New note'
	String get newNote => 'New note';

	/// en: 'Import note'
	String get importNote => 'Import note';
}

// Path: home.newFolder
class TranslationsHomeNewFolderEn {
	TranslationsHomeNewFolderEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'New folder'
	String get newFolder => 'New folder';

	/// en: 'Folder name'
	String get folderName => 'Folder name';

	/// en: 'Create'
	String get create => 'Create';

	/// en: 'Folder name can't be empty'
	String get folderNameEmpty => 'Folder name can\'t be empty';

	/// en: 'Folder name can't contain a slash'
	String get folderNameContainsSlash => 'Folder name can\'t contain a slash';

	/// en: 'Folder already exists'
	String get folderNameExists => 'Folder already exists';
}

// Path: home.renameNote
class TranslationsHomeRenameNoteEn {
	TranslationsHomeRenameNoteEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Rename note'
	String get renameNote => 'Rename note';

	/// en: 'Note name'
	String get noteName => 'Note name';

	/// en: 'Rename'
	String get rename => 'Rename';

	/// en: 'Note name can't be empty'
	String get noteNameEmpty => 'Note name can\'t be empty';

	/// en: 'Note name can't contain a slash'
	String get noteNameContainsSlash => 'Note name can\'t contain a slash';

	/// en: 'A note with this name already exists'
	String get noteNameExists => 'A note with this name already exists';
}

// Path: home.moveNote
class TranslationsHomeMoveNoteEn {
	TranslationsHomeMoveNoteEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Move note'
	String get moveNote => 'Move note';

	/// en: 'Move $n notes'
	String moveNotes({required Object n}) => 'Move ${n} notes';

	/// en: 'Move $f'
	String moveName({required Object f}) => 'Move ${f}';

	/// en: 'Move'
	String get move => 'Move';

	/// en: 'Note will be renamed to $newName'
	String renamedTo({required Object newName}) => 'Note will be renamed to ${newName}';

	/// en: 'The following notes will be renamed:'
	String get multipleRenamedTo => 'The following notes will be renamed:';

	/// en: '$n notes will be renamed to avoid conflicts'
	String numberRenamedTo({required Object n}) => '${n} notes will be renamed to avoid conflicts';
}

// Path: home.renameFolder
class TranslationsHomeRenameFolderEn {
	TranslationsHomeRenameFolderEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Rename folder'
	String get renameFolder => 'Rename folder';

	/// en: 'Folder name'
	String get folderName => 'Folder name';

	/// en: 'Rename'
	String get rename => 'Rename';

	/// en: 'Folder name can't be empty'
	String get folderNameEmpty => 'Folder name can\'t be empty';

	/// en: 'Folder name can't contain a slash'
	String get folderNameContainsSlash => 'Folder name can\'t contain a slash';

	/// en: 'A folder with this name already exists'
	String get folderNameExists => 'A folder with this name already exists';
}

// Path: home.deleteFolder
class TranslationsHomeDeleteFolderEn {
	TranslationsHomeDeleteFolderEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete folder'
	String get deleteFolder => 'Delete folder';

	/// en: 'Delete $f'
	String deleteName({required Object f}) => 'Delete ${f}';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Also delete all notes inside this folder'
	String get alsoDeleteContents => 'Also delete all notes inside this folder';
}

// Path: sentry.consent
class TranslationsSentryConsentEn {
	TranslationsSentryConsentEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Help improve Saber?'
	String get title => 'Help improve Saber?';

	late final TranslationsSentryConsentDescriptionEn description = TranslationsSentryConsentDescriptionEn.internal(_root);
	late final TranslationsSentryConsentAnswersEn answers = TranslationsSentryConsentAnswersEn.internal(_root);
}

// Path: settings.prefCategories
class TranslationsSettingsPrefCategoriesEn {
	TranslationsSettingsPrefCategoriesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'General'
	String get general => 'General';

	/// en: 'Writing'
	String get writing => 'Writing';

	/// en: 'Editor'
	String get editor => 'Editor';

	/// en: 'Performance'
	String get performance => 'Performance';

	/// en: 'Advanced'
	String get advanced => 'Advanced';
}

// Path: settings.prefLabels
class TranslationsSettingsPrefLabelsEn {
	TranslationsSettingsPrefLabelsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Language'
	String get locale => 'Language';

	/// en: 'App theme'
	String get appTheme => 'App theme';

	/// en: 'Theme type'
	String get platform => 'Theme type';

	/// en: 'Layout type'
	String get layoutSize => 'Layout type';

	/// en: 'Custom accent color'
	String get customAccentColor => 'Custom accent color';

	/// en: 'Atkinson Hyperlegible font'
	String get hyperlegibleFont => 'Atkinson Hyperlegible font';

	/// en: 'Check for Saber updates'
	String get shouldCheckForUpdates => 'Check for Saber updates';

	/// en: 'Faster updates'
	String get shouldAlwaysAlertForUpdates => 'Faster updates';

	/// en: 'Allow insecure connections'
	String get allowInsecureConnections => 'Allow insecure connections';

	/// en: 'Toolbar position'
	String get editorToolbarAlignment => 'Toolbar position';

	/// en: 'Show the toolbar in fullscreen mode'
	String get editorToolbarShowInFullscreen => 'Show the toolbar in fullscreen mode';

	/// en: 'Invert notes in dark mode'
	String get editorAutoInvert => 'Invert notes in dark mode';

	/// en: 'Prefer greyscale colors'
	String get preferGreyscale => 'Prefer greyscale colors';

	/// en: 'Maximum image size'
	String get maxImageSize => 'Maximum image size';

	/// en: 'Auto-clear the whiteboard'
	String get autoClearWhiteboardOnExit => 'Auto-clear the whiteboard';

	/// en: 'Auto-disable the eraser'
	String get disableEraserAfterUse => 'Auto-disable the eraser';

	/// en: 'Hide the finger drawing toggle'
	String get hideFingerDrawingToggle => 'Hide the finger drawing toggle';

	/// en: 'Prompt you to rename new notes'
	String get editorPromptRename => 'Prompt you to rename new notes';

	/// en: 'Hide backgrounds on the home screen'
	String get hideHomeBackgrounds => 'Hide backgrounds on the home screen';

	/// en: 'Don't save preset colors in recent colors'
	String get recentColorsDontSavePresets => 'Don\'t save preset colors in recent colors';

	/// en: 'How many recent colors to store'
	String get recentColorsLength => 'How many recent colors to store';

	/// en: 'Print page indicators'
	String get printPageIndicators => 'Print page indicators';

	/// en: 'Auto-save'
	String get autosave => 'Auto-save';

	/// en: 'Shape recognition delay'
	String get shapeRecognitionDelay => 'Shape recognition delay';

	/// en: 'Auto straighten lines'
	String get autoStraightenLines => 'Auto straighten lines';

	/// en: 'Simplified home layout'
	String get simplifiedHomeLayout => 'Simplified home layout';

	/// en: 'Custom Saber folder'
	String get customDataDir => 'Custom Saber folder';

	/// en: 'Pencil sound effect'
	String get pencilSoundSetting => 'Pencil sound effect';

	/// en: 'Error reporting'
	String get sentry => 'Error reporting';
}

// Path: settings.prefDescriptions
class TranslationsSettingsPrefDescriptionsEn {
	TranslationsSettingsPrefDescriptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Increases legibility for users with low vision'
	String get hyperlegibleFont => 'Increases legibility for users with low vision';

	/// en: '(Not recommended) Allow Saber to connect to servers with self-signed/untrusted certificates'
	String get allowInsecureConnections => '(Not recommended) Allow Saber to connect to servers with self-signed/untrusted certificates';

	/// en: 'For e-ink displays'
	String get preferGreyscale => 'For e-ink displays';

	/// en: 'Clears the whiteboard after you exit the app'
	String get autoClearWhiteboardOnExit => 'Clears the whiteboard after you exit the app';

	/// en: 'Automatically switches back to the pen after using the eraser'
	String get disableEraserAfterUse => 'Automatically switches back to the pen after using the eraser';

	/// en: 'Larger images will be compressed'
	String get maxImageSize => 'Larger images will be compressed';

	late final TranslationsSettingsPrefDescriptionsHideFingerDrawingEn hideFingerDrawing = TranslationsSettingsPrefDescriptionsHideFingerDrawingEn.internal(_root);

	/// en: 'You can always rename notes later'
	String get editorPromptRename => 'You can always rename notes later';

	/// en: 'For a cleaner look'
	String get hideHomeBackgrounds => 'For a cleaner look';

	/// en: 'Show page indicators in exports'
	String get printPageIndicators => 'Show page indicators in exports';

	/// en: 'Auto-save after a short delay, or never'
	String get autosave => 'Auto-save after a short delay, or never';

	/// en: 'How often to update the shape preview'
	String get shapeRecognitionDelay => 'How often to update the shape preview';

	/// en: 'Straightens long lines without having to use the shape pen'
	String get autoStraightenLines => 'Straightens long lines without having to use the shape pen';

	/// en: 'Sets a fixed height for each note preview'
	String get simplifiedHomeLayout => 'Sets a fixed height for each note preview';

	/// en: 'Tell me about updates as soon as they're available'
	String get shouldAlwaysAlertForUpdates => 'Tell me about updates as soon as they\'re available';

	late final TranslationsSettingsPrefDescriptionsPencilSoundSettingEn pencilSoundSetting = TranslationsSettingsPrefDescriptionsPencilSoundSettingEn.internal(_root);
	late final TranslationsSettingsPrefDescriptionsSentryEn sentry = TranslationsSettingsPrefDescriptionsSentryEn.internal(_root);
}

// Path: settings.themeModes
class TranslationsSettingsThemeModesEn {
	TranslationsSettingsThemeModesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'System'
	String get system => 'System';

	/// en: 'Light'
	String get light => 'Light';

	/// en: 'Dark'
	String get dark => 'Dark';
}

// Path: settings.layoutSizes
class TranslationsSettingsLayoutSizesEn {
	TranslationsSettingsLayoutSizesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Auto'
	String get auto => 'Auto';

	/// en: 'Phone'
	String get phone => 'Phone';

	/// en: 'Tablet'
	String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class TranslationsSettingsAccentColorPickerEn {
	TranslationsSettingsAccentColorPickerEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Pick a color'
	String get pickAColor => 'Pick a color';
}

// Path: settings.reset
class TranslationsSettingsResetEn {
	TranslationsSettingsResetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Reset this setting?'
	String get title => 'Reset this setting?';

	/// en: 'Reset'
	String get button => 'Reset';
}

// Path: settings.customDataDir
class TranslationsSettingsCustomDataDirEn {
	TranslationsSettingsCustomDataDirEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Select'
	String get select => 'Select';

	/// en: 'Selected folder must be empty'
	String get mustBeEmpty => 'Selected folder must be empty';

	/// en: 'Make sure syncing is complete before changing the folder'
	String get mustBeDoneSyncing => 'Make sure syncing is complete before changing the folder';

	/// en: 'This feature is currently only for developers. Using it will likely result in data loss.'
	String get unsupported => 'This feature is currently only for developers. Using it will likely result in data loss.';
}

// Path: login.form
class TranslationsLoginFormEn {
	TranslationsLoginFormEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'By logging in, you agree to the ${linkToPrivacyPolicy(Privacy Policy)}.'
	TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'By logging in, you agree to the '),
		linkToPrivacyPolicy('Privacy Policy'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class TranslationsLoginStatusEn {
	TranslationsLoginStatusEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Logged out'
	String get loggedOut => 'Logged out';

	/// en: 'Tap to log in with Nextcloud'
	String get tapToLogin => 'Tap to log in with Nextcloud';

	/// en: 'Hi, $u!'
	String hi({required Object u}) => 'Hi, ${u}!';

	/// en: 'Almost ready for syncing, tap to finish logging in'
	String get almostDone => 'Almost ready for syncing, tap to finish logging in';

	/// en: 'Logged in with Nextcloud'
	String get loggedIn => 'Logged in with Nextcloud';
}

// Path: login.ncLoginStep
class TranslationsLoginNcLoginStepEn {
	TranslationsLoginNcLoginStepEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Choose where you want to store your data:'
	String get whereToStoreData => 'Choose where you want to store your data:';

	/// en: 'Saber's Nextcloud server'
	String get saberNcServer => 'Saber\'s Nextcloud server';

	/// en: 'Other Nextcloud server'
	String get otherNcServer => 'Other Nextcloud server';

	/// en: 'Server URL'
	String get serverUrl => 'Server URL';

	/// en: 'Login with Saber'
	String get loginWithSaber => 'Login with Saber';

	/// en: 'Login with Nextcloud'
	String get loginWithNextcloud => 'Login with Nextcloud';

	late final TranslationsLoginNcLoginStepLoginFlowEn loginFlow = TranslationsLoginNcLoginStepLoginFlowEn.internal(_root);
}

// Path: login.encLoginStep
class TranslationsLoginEncLoginStepEn {
	TranslationsLoginEncLoginStepEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'To protect your data, please enter your encryption password:'
	String get enterEncPassword => 'To protect your data, please enter your encryption password:';

	/// en: 'New to Saber? Just enter a new encryption password.'
	String get newToSaber => 'New to Saber? Just enter a new encryption password.';

	/// en: 'Encryption password'
	String get encPassword => 'Encryption password';

	/// en: 'Frequently asked questions'
	String get encFaqTitle => 'Frequently asked questions';

	/// en: 'Decryption failed with the provided password. Please try entering it again.'
	String get wrongEncPassword => 'Decryption failed with the provided password. Please try entering it again.';

	/// en: 'Something went wrong connecting to the server. Please try again later.'
	String get connectionFailed => 'Something went wrong connecting to the server. Please try again later.';

	List<dynamic> get encFaq => [
		TranslationsLoginEncLoginStep$encFaq$0i0$En.internal(_root),
		TranslationsLoginEncLoginStep$encFaq$0i1$En.internal(_root),
		TranslationsLoginEncLoginStep$encFaq$0i2$En.internal(_root),
	];
}

// Path: profile.quickLinks
class TranslationsProfileQuickLinksEn {
	TranslationsProfileQuickLinksEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Server homepage'
	String get serverHomepage => 'Server homepage';

	/// en: 'Delete account'
	String get deleteAccount => 'Delete account';
}

// Path: profile.faq.0
class TranslationsProfile$faq$0i0$En {
	TranslationsProfile$faq$0i0$En.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Will I lose my notes if I log out?'
	String get q => 'Will I lose my notes if I log out?';

	/// en: 'No. Your notes will remain both on your device and on the server. They won't be synced with the server until you log back in. Make sure syncing is complete before logging out so you don't lose any data (see the sync progress on the home screen).'
	String get a => 'No. Your notes will remain both on your device and on the server. They won\'t be synced with the server until you log back in. Make sure syncing is complete before logging out so you don\'t lose any data (see the sync progress on the home screen).';
}

// Path: profile.faq.1
class TranslationsProfile$faq$0i1$En {
	TranslationsProfile$faq$0i1$En.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How do I change my Nextcloud password?'
	String get q => 'How do I change my Nextcloud password?';

	/// en: 'Go to your server website and log in. Then go to Settings > Security > Change password. You'll need to log out and log back in to Saber after changing your password.'
	String get a => 'Go to your server website and log in. Then go to Settings > Security > Change password. You\'ll need to log out and log back in to Saber after changing your password.';
}

// Path: profile.faq.2
class TranslationsProfile$faq$0i2$En {
	TranslationsProfile$faq$0i2$En.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How do I change my encryption password?'
	String get q => 'How do I change my encryption password?';

	/// en: '0. Make sure syncing is complete (see the sync progress on the home screen). 1. Log out of Saber. 2. Go to your server website and delete your 'Saber' folder. This will delete all your notes from the server. 3. Log back in to Saber. You can choose a new encryption password when logging in. 4. Don't forget to log out and log back in to Saber on your other devices too.'
	String get a => '0. Make sure syncing is complete (see the sync progress on the home screen).\n1. Log out of Saber.\n2. Go to your server website and delete your \'Saber\' folder. This will delete all your notes from the server.\n3. Log back in to Saber. You can choose a new encryption password when logging in.\n4. Don\'t forget to log out and log back in to Saber on your other devices too.';
}

// Path: profile.faq.3
class TranslationsProfile$faq$0i3$En {
	TranslationsProfile$faq$0i3$En.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How can I delete my account?'
	String get q => 'How can I delete my account?';

	/// en: 'Tap on the "Delete account" button above, and login if needed. If you are using the official Saber server, your account will be deleted after a 1 week grace period. You can contact me at adilhanney@disroot.org during this period to cancel the deletion. If you are using a third party server, there might not be an option to delete your account: you'll need to consult the server's privacy policy for more information.'
	String get a => 'Tap on the "${_root.profile.quickLinks.deleteAccount}" button above, and login if needed.\nIf you are using the official Saber server, your account will be deleted after a 1 week grace period. You can contact me at adilhanney@disroot.org during this period to cancel the deletion.\nIf you are using a third party server, there might not be an option to delete your account: you\'ll need to consult the server\'s privacy policy for more information.';
}

// Path: editor.toolbar
class TranslationsEditorToolbarEn {
	TranslationsEditorToolbarEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Toggle colors (Ctrl C)'
	String get toggleColors => 'Toggle colors (Ctrl C)';

	/// en: 'Select'
	String get select => 'Select';

	/// en: 'Toggle eraser (Ctrl E)'
	String get toggleEraser => 'Toggle eraser (Ctrl E)';

	/// en: 'Images'
	String get photo => 'Images';

	/// en: 'Text'
	String get text => 'Text';

	/// en: 'Toggle finger drawing (Ctrl F)'
	String get toggleFingerDrawing => 'Toggle finger drawing (Ctrl F)';

	/// en: 'Undo'
	String get undo => 'Undo';

	/// en: 'Redo'
	String get redo => 'Redo';

	/// en: 'Export (Ctrl Shift S)'
	String get export => 'Export (Ctrl Shift S)';

	/// en: 'Export as:'
	String get exportAs => 'Export as:';

	/// en: 'Toggle fullscreen (F11)'
	String get fullscreen => 'Toggle fullscreen (F11)';
}

// Path: editor.pens
class TranslationsEditorPensEn {
	TranslationsEditorPensEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Fountain pen'
	String get fountainPen => 'Fountain pen';

	/// en: 'Ballpoint pen'
	String get ballpointPen => 'Ballpoint pen';

	/// en: 'Highlighter'
	String get highlighter => 'Highlighter';

	/// en: 'Pencil'
	String get pencil => 'Pencil';

	/// en: 'Shape pen'
	String get shapePen => 'Shape pen';

	/// en: 'Laser pointer'
	String get laserPointer => 'Laser pointer';
}

// Path: editor.penOptions
class TranslationsEditorPenOptionsEn {
	TranslationsEditorPenOptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Size'
	String get size => 'Size';
}

// Path: editor.colors
class TranslationsEditorColorsEn {
	TranslationsEditorColorsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Color picker'
	String get colorPicker => 'Color picker';

	/// en: 'Custom $b $h'
	String customBrightnessHue({required Object b, required Object h}) => 'Custom ${b} ${h}';

	/// en: 'Custom $h'
	String customHue({required Object h}) => 'Custom ${h}';

	/// en: 'dark'
	String get dark => 'dark';

	/// en: 'light'
	String get light => 'light';

	/// en: 'Black'
	String get black => 'Black';

	/// en: 'Dark grey'
	String get darkGrey => 'Dark grey';

	/// en: 'Grey'
	String get grey => 'Grey';

	/// en: 'Light grey'
	String get lightGrey => 'Light grey';

	/// en: 'White'
	String get white => 'White';

	/// en: 'Red'
	String get red => 'Red';

	/// en: 'Green'
	String get green => 'Green';

	/// en: 'Cyan'
	String get cyan => 'Cyan';

	/// en: 'Blue'
	String get blue => 'Blue';

	/// en: 'Yellow'
	String get yellow => 'Yellow';

	/// en: 'Purple'
	String get purple => 'Purple';

	/// en: 'Pink'
	String get pink => 'Pink';

	/// en: 'Orange'
	String get orange => 'Orange';

	/// en: 'Pastel red'
	String get pastelRed => 'Pastel red';

	/// en: 'Pastel orange'
	String get pastelOrange => 'Pastel orange';

	/// en: 'Pastel yellow'
	String get pastelYellow => 'Pastel yellow';

	/// en: 'Pastel green'
	String get pastelGreen => 'Pastel green';

	/// en: 'Pastel cyan'
	String get pastelCyan => 'Pastel cyan';

	/// en: 'Pastel blue'
	String get pastelBlue => 'Pastel blue';

	/// en: 'Pastel purple'
	String get pastelPurple => 'Pastel purple';

	/// en: 'Pastel pink'
	String get pastelPink => 'Pastel pink';
}

// Path: editor.imageOptions
class TranslationsEditorImageOptionsEn {
	TranslationsEditorImageOptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Image options'
	String get title => 'Image options';

	/// en: 'Invertible'
	String get invertible => 'Invertible';

	/// en: 'Download'
	String get download => 'Download';

	/// en: 'Set as background'
	String get setAsBackground => 'Set as background';

	/// en: 'Remove as background'
	String get removeAsBackground => 'Remove as background';

	/// en: 'Delete'
	String get delete => 'Delete';
}

// Path: editor.selectionBar
class TranslationsEditorSelectionBarEn {
	TranslationsEditorSelectionBarEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Duplicate'
	String get duplicate => 'Duplicate';
}

// Path: editor.menu
class TranslationsEditorMenuEn {
	TranslationsEditorMenuEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Clear page $page/$totalPages'
	String clearPage({required Object page, required Object totalPages}) => 'Clear page ${page}/${totalPages}';

	/// en: 'Clear all pages'
	String get clearAllPages => 'Clear all pages';

	/// en: 'Insert page below'
	String get insertPage => 'Insert page below';

	/// en: 'Duplicate page'
	String get duplicatePage => 'Duplicate page';

	/// en: 'Delete page'
	String get deletePage => 'Delete page';

	/// en: 'Line height'
	String get lineHeight => 'Line height';

	/// en: 'Also controls the text size for typed notes'
	String get lineHeightDescription => 'Also controls the text size for typed notes';

	/// en: 'Line thickness'
	String get lineThickness => 'Line thickness';

	/// en: 'Background line thickness'
	String get lineThicknessDescription => 'Background line thickness';

	/// en: 'Background image fit'
	String get backgroundImageFit => 'Background image fit';

	/// en: 'Background pattern'
	String get backgroundPattern => 'Background pattern';

	/// en: 'Import'
	String get import => 'Import';

	/// en: 'Watch for updates on the server'
	String get watchServer => 'Watch for updates on the server';

	/// en: 'Editing is disabled while watching the server'
	String get watchServerReadOnly => 'Editing is disabled while watching the server';

	late final TranslationsEditorMenuBoxFitsEn boxFits = TranslationsEditorMenuBoxFitsEn.internal(_root);
	late final TranslationsEditorMenuBgPatternsEn bgPatterns = TranslationsEditorMenuBgPatternsEn.internal(_root);
}

// Path: editor.newerFileFormat
class TranslationsEditorNewerFileFormatEn {
	TranslationsEditorNewerFileFormatEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Read-only mode'
	String get readOnlyMode => 'Read-only mode';

	/// en: 'This note was edited using a newer version of Saber'
	String get title => 'This note was edited using a newer version of Saber';

	/// en: 'Editing this note may result in some information being lost. Do you want to ignore this and edit it anyway?'
	String get subtitle => 'Editing this note may result in some information being lost. Do you want to ignore this and edit it anyway?';

	/// en: 'Allow editing'
	String get allowEditing => 'Allow editing';
}

// Path: editor.quill
class TranslationsEditorQuillEn {
	TranslationsEditorQuillEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Type something here...'
	String get typeSomething => 'Type something here...';
}

// Path: editor.hud
class TranslationsEditorHudEn {
	TranslationsEditorHudEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unlock zoom'
	String get unlockZoom => 'Unlock zoom';

	/// en: 'Lock zoom'
	String get lockZoom => 'Lock zoom';

	/// en: 'Enable single-finger panning'
	String get unlockSingleFingerPan => 'Enable single-finger panning';

	/// en: 'Disable single-finger panning'
	String get lockSingleFingerPan => 'Disable single-finger panning';

	/// en: 'Unlock panning to horizontal or vertical'
	String get unlockAxisAlignedPan => 'Unlock panning to horizontal or vertical';

	/// en: 'Lock panning to horizontal or vertical'
	String get lockAxisAlignedPan => 'Lock panning to horizontal or vertical';
}

// Path: sentry.consent.description
class TranslationsSentryConsentDescriptionEn {
	TranslationsSentryConsentDescriptionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Would you like to automatically report unexpected errors? This helps me identify and fix issues faster.'
	String get question => 'Would you like to automatically report unexpected errors? This helps me identify and fix issues faster.';

	/// en: 'The reports may contain information about the error and your device. I've made every effort to filter out personal data but some may remain.'
	String get scope => 'The reports may contain information about the error and your device. I\'ve made every effort to filter out personal data but some may remain.';

	/// en: 'If you grant consent, error reporting will be enabled after you restart the app.'
	String get currentlyOff => 'If you grant consent, error reporting will be enabled after you restart the app.';

	/// en: 'If you revoke consent, please restart the app to disable error reporting.'
	String get currentlyOn => 'If you revoke consent, please restart the app to disable error reporting.';

	/// en: 'Learn more in the ${link(privacy policy)}.'
	TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Learn more in the '),
		link('privacy policy'),
		const TextSpan(text: '.'),
	]);
}

// Path: sentry.consent.answers
class TranslationsSentryConsentAnswersEn {
	TranslationsSentryConsentAnswersEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Yes'
	String get yes => 'Yes';

	/// en: 'No'
	String get no => 'No';

	/// en: 'Ask me later'
	String get later => 'Ask me later';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	TranslationsSettingsPrefDescriptionsHideFingerDrawingEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Prevents accidental toggling'
	String get shown => 'Prevents accidental toggling';

	/// en: 'Finger drawing is fixed as enabled'
	String get fixedOn => 'Finger drawing is fixed as enabled';

	/// en: 'Finger drawing is fixed as disabled'
	String get fixedOff => 'Finger drawing is fixed as disabled';
}

// Path: settings.prefDescriptions.pencilSoundSetting
class TranslationsSettingsPrefDescriptionsPencilSoundSettingEn {
	TranslationsSettingsPrefDescriptionsPencilSoundSettingEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No sound'
	String get off => 'No sound';

	/// en: 'Enabled (unless in silent mode)'
	String get onButNotInSilentMode => 'Enabled (unless in silent mode)';

	/// en: 'Enabled (even in silent mode)'
	String get onAlways => 'Enabled (even in silent mode)';
}

// Path: settings.prefDescriptions.sentry
class TranslationsSettingsPrefDescriptionsSentryEn {
	TranslationsSettingsPrefDescriptionsSentryEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Active'
	String get active => 'Active';

	/// en: 'Inactive'
	String get inactive => 'Inactive';

	/// en: 'Active until you restart the app'
	String get activeUntilRestart => 'Active until you restart the app';

	/// en: 'Inactive until you restart the app'
	String get inactiveUntilRestart => 'Inactive until you restart the app';
}

// Path: login.ncLoginStep.loginFlow
class TranslationsLoginNcLoginStepLoginFlowEn {
	TranslationsLoginNcLoginStepLoginFlowEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please authorize Saber to access your Nextcloud account'
	String get pleaseAuthorize => 'Please authorize Saber to access your Nextcloud account';

	/// en: 'Please follow the prompts in the Nextcloud interface'
	String get followPrompts => 'Please follow the prompts in the Nextcloud interface';

	/// en: 'Login page didn't open? Click here'
	String get browserDidntOpen => 'Login page didn\'t open? Click here';
}

// Path: login.encLoginStep.encFaq.0
class TranslationsLoginEncLoginStep$encFaq$0i0$En {
	TranslationsLoginEncLoginStep$encFaq$0i0$En.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'What is an encryption password? Why use two passwords?'
	String get q => 'What is an encryption password? Why use two passwords?';

	/// en: 'The Nextcloud password is used to access the cloud. The encryption password "scrambles" your data before it ever reaches the cloud. Even if someone gains access to your Nextcloud account, your notes will remain safe and encrypted with a separate password. This provides you a second layer of security to protect your data. No-one can access your notes on the server without your encryption password, but this also means that if you forget your encryption password, you will lose access to your data.'
	String get a => 'The Nextcloud password is used to access the cloud. The encryption password "scrambles" your data before it ever reaches the cloud.\nEven if someone gains access to your Nextcloud account, your notes will remain safe and encrypted with a separate password. This provides you a second layer of security to protect your data.\nNo-one can access your notes on the server without your encryption password, but this also means that if you forget your encryption password, you will lose access to your data.';
}

// Path: login.encLoginStep.encFaq.1
class TranslationsLoginEncLoginStep$encFaq$0i1$En {
	TranslationsLoginEncLoginStep$encFaq$0i1$En.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'I haven't set an encryption password yet. Where do I get it?'
	String get q => 'I haven\'t set an encryption password yet. Where do I get it?';

	/// en: 'Choose a new encryption password and enter it above. Saber will generate your encryption keys from this password automatically.'
	String get a => 'Choose a new encryption password and enter it above.\nSaber will generate your encryption keys from this password automatically.';
}

// Path: login.encLoginStep.encFaq.2
class TranslationsLoginEncLoginStep$encFaq$0i2$En {
	TranslationsLoginEncLoginStep$encFaq$0i2$En.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Can I use the same password as my Nextcloud account?'
	String get q => 'Can I use the same password as my Nextcloud account?';

	/// en: 'Yes, but keep in mind that it would be easier for the server administrator or someone else to access your notes if they gain access to your Nextcloud account.'
	String get a => 'Yes, but keep in mind that it would be easier for the server administrator or someone else to access your notes if they gain access to your Nextcloud account.';
}

// Path: editor.menu.boxFits
class TranslationsEditorMenuBoxFitsEn {
	TranslationsEditorMenuBoxFitsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Stretch'
	String get fill => 'Stretch';

	/// en: 'Cover'
	String get cover => 'Cover';

	/// en: 'Contain'
	String get contain => 'Contain';
}

// Path: editor.menu.bgPatterns
class TranslationsEditorMenuBgPatternsEn {
	TranslationsEditorMenuBgPatternsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Blank'
	String get none => 'Blank';

	/// en: 'College-ruled'
	String get college => 'College-ruled';

	/// en: 'College-ruled (Reverse)'
	String get collegeRtl => 'College-ruled (Reverse)';

	/// en: 'Lined'
	String get lined => 'Lined';

	/// en: 'Grid'
	String get grid => 'Grid';

	/// en: 'Dots'
	String get dots => 'Dots';

	/// en: 'Staffs'
	String get staffs => 'Staffs';

	/// en: 'Tablature'
	String get tablature => 'Tablature';

	/// en: 'Cornell'
	String get cornell => 'Cornell';
}
