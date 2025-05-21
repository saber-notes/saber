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
	String get done => 'Done';
	String get continueBtn => 'Continue';
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
	String get welcome => 'Welcome to Saber';
	String get invalidFormat => 'The file you selected is not supported. Please select an sbn, sbn2, sba, or pdf file.';
	String get noFiles => 'No files found';
	String get noPreviewAvailable => 'No preview available';
	String get createNewNote => 'Tap the + button to create a new note';
	String get backFolder => 'Go back to the previous folder';
	late final TranslationsHomeNewFolderEn newFolder = TranslationsHomeNewFolderEn.internal(_root);
	late final TranslationsHomeRenameNoteEn renameNote = TranslationsHomeRenameNoteEn.internal(_root);
	late final TranslationsHomeMoveNoteEn moveNote = TranslationsHomeMoveNoteEn.internal(_root);
	String get deleteNote => 'Delete note';
	late final TranslationsHomeRenameFolderEn renameFolder = TranslationsHomeRenameFolderEn.internal(_root);
	late final TranslationsHomeDeleteFolderEn deleteFolder = TranslationsHomeDeleteFolderEn.internal(_root);
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
	String get systemLanguage => 'Default';
	List<String> get axisDirections => [
		'Top',
		'Right',
		'Bottom',
		'Left',
	];
	late final TranslationsSettingsResetEn reset = TranslationsSettingsResetEn.internal(_root);
	String get resyncEverything => 'Resync everything';
	String get openDataDir => 'Open Saber folder';
	late final TranslationsSettingsCustomDataDirEn customDataDir = TranslationsSettingsCustomDataDirEn.internal(_root);
}

// Path: logs
class TranslationsLogsEn {
	TranslationsLogsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get logs => 'Logs';
	String get viewLogs => 'View logs';
	String get debuggingInfo => 'Logs contain information useful for debugging and development';
	String get noLogs => 'No logs here!';
	String get logsAreTemporary => 'Logs are only kept until you close the app';
}

// Path: login
class TranslationsLoginEn {
	TranslationsLoginEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Login';
	late final TranslationsLoginFormEn form = TranslationsLoginFormEn.internal(_root);
	TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Don\'t have an account yet? '),
		linkToSignup('Sign up now'),
		const TextSpan(text: '!'),
	]);
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
	String get title => 'My profile';
	String get logout => 'Log out';
	String quotaUsage({required Object used, required Object total, required Object percent}) => 'You\'re using ${used} of ${total} (${percent}%)';
	String get connectedTo => 'Connected to';
	late final TranslationsProfileQuickLinksEn quickLinks = TranslationsProfileQuickLinksEn.internal(_root);
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
	String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
	String get dirty => 'DIRTY';
	String get debug => 'DEBUG';
	String get sponsorButton => 'Tap here to sponsor me or buy more storage';
	String get licenseButton => 'Tap here to view more license information';
	String get privacyPolicyButton => 'Tap here to view the privacy policy';
}

// Path: update
class TranslationsUpdateEn {
	TranslationsUpdateEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get updateAvailable => 'Update available';
	String get updateAvailableDescription => 'A new version of the app is available:';
	String get update => 'Update';
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
	String get pages => 'Pages';
	String get untitled => 'Untitled';
	String get needsToSaveBeforeExiting => 'Saving your changes... You can safely exit the editor when it\'s done';
}

// Path: home.tabs
class TranslationsHomeTabsEn {
	TranslationsHomeTabsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get home => 'Home';
	String get browse => 'Browse';
	String get whiteboard => 'Whiteboard';
	String get settings => 'Settings';
}

// Path: home.titles
class TranslationsHomeTitlesEn {
	TranslationsHomeTitlesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get home => 'Recent notes';
	String get browse => 'Browse';
	String get whiteboard => 'Whiteboard';
	String get settings => 'Settings';
}

// Path: home.tooltips
class TranslationsHomeTooltipsEn {
	TranslationsHomeTooltipsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get newNote => 'New note';
	String get showUpdateDialog => 'Show update dialog';
	String get exportNote => 'Export note';
}

// Path: home.create
class TranslationsHomeCreateEn {
	TranslationsHomeCreateEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get newNote => 'New note';
	String get importNote => 'Import note';
}

// Path: home.newFolder
class TranslationsHomeNewFolderEn {
	TranslationsHomeNewFolderEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get newFolder => 'New folder';
	String get folderName => 'Folder name';
	String get create => 'Create';
	String get folderNameEmpty => 'Folder name can\'t be empty';
	String get folderNameContainsSlash => 'Folder name can\'t contain a slash';
	String get folderNameExists => 'Folder already exists';
}

// Path: home.renameNote
class TranslationsHomeRenameNoteEn {
	TranslationsHomeRenameNoteEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get renameNote => 'Rename note';
	String get noteName => 'Note name';
	String get rename => 'Rename';
	String get noteNameEmpty => 'Note name can\'t be empty';
	String get noteNameContainsSlash => 'Note name can\'t contain a slash';
	String get noteNameExists => 'A note with this name already exists';
}

// Path: home.moveNote
class TranslationsHomeMoveNoteEn {
	TranslationsHomeMoveNoteEn.internal(this._root);

	final Translations _root; // ignore: unused_field

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
class TranslationsHomeRenameFolderEn {
	TranslationsHomeRenameFolderEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get renameFolder => 'Rename folder';
	String get folderName => 'Folder name';
	String get rename => 'Rename';
	String get folderNameEmpty => 'Folder name can\'t be empty';
	String get folderNameContainsSlash => 'Folder name can\'t contain a slash';
	String get folderNameExists => 'A folder with this name already exists';
}

// Path: home.deleteFolder
class TranslationsHomeDeleteFolderEn {
	TranslationsHomeDeleteFolderEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get deleteFolder => 'Delete folder';
	String deleteName({required Object f}) => 'Delete ${f}';
	String get delete => 'Delete';
	String get alsoDeleteContents => 'Also delete all notes inside this folder';
}

// Path: settings.prefCategories
class TranslationsSettingsPrefCategoriesEn {
	TranslationsSettingsPrefCategoriesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get general => 'General';
	String get writing => 'Writing';
	String get editor => 'Editor';
	String get performance => 'Performance';
	String get advanced => 'Advanced';
}

// Path: settings.prefLabels
class TranslationsSettingsPrefLabelsEn {
	TranslationsSettingsPrefLabelsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get locale => 'App language';
	String get appTheme => 'App theme';
	String get platform => 'Theme type';
	String get layoutSize => 'Layout type';
	String get customAccentColor => 'Custom accent color';
	String get hyperlegibleFont => 'Atkinson Hyperlegible font';
	String get shouldCheckForUpdates => 'Check for Saber updates';
	String get shouldAlwaysAlertForUpdates => 'Faster updates';
	String get allowInsecureConnections => 'Allow insecure connections';
	String get editorToolbarAlignment => 'Toolbar position';
	String get editorToolbarShowInFullscreen => 'Show the toolbar in fullscreen mode';
	String get editorAutoInvert => 'Invert notes in dark mode';
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
	String get shapeRecognitionDelay => 'Shape recognition delay';
	String get autoStraightenLines => 'Auto straighten lines';
	String get simplifiedHomeLayout => 'Simplified home layout';
	String get customDataDir => 'Custom Saber folder';
	String get pencilSoundSetting => 'Pencil sound effect';
}

// Path: settings.prefDescriptions
class TranslationsSettingsPrefDescriptionsEn {
	TranslationsSettingsPrefDescriptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get hyperlegibleFont => 'Increases legibility for users with low vision';
	String get allowInsecureConnections => '(Not recommended) Allow Saber to connect to servers with self-signed/untrusted certificates';
	String get preferGreyscale => 'For e-ink displays';
	String get autoClearWhiteboardOnExit => 'Clears the whiteboard after you exit the app';
	String get disableEraserAfterUse => 'Automatically switches back to the pen after using the eraser';
	String get maxImageSize => 'Larger images will be compressed';
	late final TranslationsSettingsPrefDescriptionsHideFingerDrawingEn hideFingerDrawing = TranslationsSettingsPrefDescriptionsHideFingerDrawingEn.internal(_root);
	String get editorPromptRename => 'You can always rename notes later';
	String get hideHomeBackgrounds => 'For a cleaner look';
	String get printPageIndicators => 'Show page indicators in exports';
	String get autosaveDelay => 'How long to wait before auto-saving a note';
	String get shapeRecognitionDelay => 'How often to update the shape preview';
	String get autoStraightenLines => 'Straightens long lines without having to use the shape pen';
	String get simplifiedHomeLayout => 'Sets a fixed height for each note preview';
	String get shouldAlwaysAlertForUpdates => 'Tell me about updates as soon as they\'re available';
	late final TranslationsSettingsPrefDescriptionsPencilSoundSettingEn pencilSoundSetting = TranslationsSettingsPrefDescriptionsPencilSoundSettingEn.internal(_root);
}

// Path: settings.themeModes
class TranslationsSettingsThemeModesEn {
	TranslationsSettingsThemeModesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get system => 'System';
	String get light => 'Light';
	String get dark => 'Dark';
}

// Path: settings.layoutSizes
class TranslationsSettingsLayoutSizesEn {
	TranslationsSettingsLayoutSizesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get auto => 'Auto';
	String get phone => 'Phone';
	String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class TranslationsSettingsAccentColorPickerEn {
	TranslationsSettingsAccentColorPickerEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get pickAColor => 'Pick a color';
}

// Path: settings.reset
class TranslationsSettingsResetEn {
	TranslationsSettingsResetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Reset this setting?';
	String get button => 'Reset';
}

// Path: settings.customDataDir
class TranslationsSettingsCustomDataDirEn {
	TranslationsSettingsCustomDataDirEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get cancel => 'Cancel';
	String get select => 'Select';
	String get mustBeEmpty => 'Selected folder must be empty';
	String get mustBeDoneSyncing => 'Make sure syncing is complete before changing the folder';
}

// Path: login.form
class TranslationsLoginFormEn {
	TranslationsLoginFormEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
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
	String get loggedOut => 'Logged out';
	String get tapToLogin => 'Tap to log in with Nextcloud';
	String hi({required Object u}) => 'Hi, ${u}!';
	String get almostDone => 'Almost ready for syncing, tap to finish logging in';
	String get loggedIn => 'Logged in with Nextcloud';
}

// Path: login.ncLoginStep
class TranslationsLoginNcLoginStepEn {
	TranslationsLoginNcLoginStepEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get whereToStoreData => 'Choose where you want to store your data:';
	String get saberNcServer => 'Saber\'s Nextcloud server';
	String get otherNcServer => 'Other Nextcloud server';
	String get serverUrl => 'Server URL';
	String get loginWithSaber => 'Login with Saber';
	String get loginWithNextcloud => 'Login with Nextcloud';
	late final TranslationsLoginNcLoginStepLoginFlowEn loginFlow = TranslationsLoginNcLoginStepLoginFlowEn.internal(_root);
}

// Path: login.encLoginStep
class TranslationsLoginEncLoginStepEn {
	TranslationsLoginEncLoginStepEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get enterEncPassword => 'To protect your data, please enter your encryption password:';
	String get newToSaber => 'New to Saber? Just enter a new encryption password.';
	String get encPassword => 'Encryption password';
	String get encFaqTitle => 'Frequently asked questions';
	String get wrongEncPassword => 'Decryption failed with the provided password. Please try entering it again.';
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
	String get serverHomepage => 'Server homepage';
	String get deleteAccount => 'Delete account';
}

// Path: profile.faq.0
class TranslationsProfile$faq$0i0$En {
	TranslationsProfile$faq$0i0$En.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get q => 'Will I lose my notes if I log out?';
	String get a => 'No. Your notes will remain both on your device and on the server. They won\'t be synced with the server until you log back in. Make sure syncing is complete before logging out so you don\'t lose any data (see the sync progress on the home screen).';
}

// Path: profile.faq.1
class TranslationsProfile$faq$0i1$En {
	TranslationsProfile$faq$0i1$En.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get q => 'How do I change my Nextcloud password?';
	String get a => 'Go to your server website and log in. Then go to Settings > Security > Change password. You\'ll need to log out and log back in to Saber after changing your password.';
}

// Path: profile.faq.2
class TranslationsProfile$faq$0i2$En {
	TranslationsProfile$faq$0i2$En.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get q => 'How do I change my encryption password?';
	String get a => '0. Make sure syncing is complete (see the sync progress on the home screen).\n1. Log out of Saber.\n2. Go to your server website and delete your \'Saber\' folder. This will delete all your notes from the server.\n3. Log back in to Saber. You can choose a new encryption password when logging in.\n4. Don\'t forget to log out and log back in to Saber on your other devices too.';
}

// Path: profile.faq.3
class TranslationsProfile$faq$0i3$En {
	TranslationsProfile$faq$0i3$En.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get q => 'How can I delete my account?';
	String get a => 'Tap on the "${_root.profile.quickLinks.deleteAccount}" button above, and login if needed.\nIf you are using the official Saber server, your account will be deleted after a 1 week grace period. You can contact me at adilhanney@disroot.org during this period to cancel the deletion.\nIf you are using a third party server, there might not be an option to delete your account: you\'ll need to consult the server\'s privacy policy for more information.';
}

// Path: editor.toolbar
class TranslationsEditorToolbarEn {
	TranslationsEditorToolbarEn.internal(this._root);

	final Translations _root; // ignore: unused_field

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
class TranslationsEditorPensEn {
	TranslationsEditorPensEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get fountainPen => 'Fountain pen';
	String get ballpointPen => 'Ballpoint pen';
	String get highlighter => 'Highlighter';
	String get pencil => 'Pencil';
	String get shapePen => 'Shape pen';
	String get laserPointer => 'Laser pointer';
}

// Path: editor.penOptions
class TranslationsEditorPenOptionsEn {
	TranslationsEditorPenOptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get size => 'Size';
}

// Path: editor.colors
class TranslationsEditorColorsEn {
	TranslationsEditorColorsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

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
class TranslationsEditorImageOptionsEn {
	TranslationsEditorImageOptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Image options';
	String get invertible => 'Invertible';
	String get download => 'Download';
	String get setAsBackground => 'Set as background';
	String get removeAsBackground => 'Remove as background';
	String get delete => 'Delete';
}

// Path: editor.selectionBar
class TranslationsEditorSelectionBarEn {
	TranslationsEditorSelectionBarEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get delete => 'Delete';
	String get duplicate => 'Duplicate';
}

// Path: editor.menu
class TranslationsEditorMenuEn {
	TranslationsEditorMenuEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String clearPage({required Object page, required Object totalPages}) => 'Clear page ${page}/${totalPages}';
	String get clearAllPages => 'Clear all pages';
	String get insertPage => 'Insert page below';
	String get duplicatePage => 'Duplicate page';
	String get deletePage => 'Delete page';
	String get lineHeight => 'Line height';
	String get lineHeightDescription => 'Also controls the text size for typed notes';
	String get lineThickness => 'Line thickness';
	String get lineThicknessDescription => 'Background line thickness';
	String get backgroundImageFit => 'Background image fit';
	String get backgroundPattern => 'Background pattern';
	String get import => 'Import';
	String get watchServer => 'Watch for updates on the server';
	String get watchServerReadOnly => 'Editing is disabled while watching the server';
	late final TranslationsEditorMenuBoxFitsEn boxFits = TranslationsEditorMenuBoxFitsEn.internal(_root);
	late final TranslationsEditorMenuBgPatternsEn bgPatterns = TranslationsEditorMenuBgPatternsEn.internal(_root);
}

// Path: editor.newerFileFormat
class TranslationsEditorNewerFileFormatEn {
	TranslationsEditorNewerFileFormatEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get readOnlyMode => 'Read-only mode';
	String get title => 'This note was edited using a newer version of Saber';
	String get subtitle => 'Editing this note may result in some information being lost. Do you want to ignore this and edit it anyway?';
	String get allowEditing => 'Allow editing';
}

// Path: editor.quill
class TranslationsEditorQuillEn {
	TranslationsEditorQuillEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get typeSomething => 'Type something here...';
}

// Path: editor.hud
class TranslationsEditorHudEn {
	TranslationsEditorHudEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get unlockZoom => 'Unlock zoom';
	String get lockZoom => 'Lock zoom';
	String get unlockSingleFingerPan => 'Enable single-finger panning';
	String get lockSingleFingerPan => 'Disable single-finger panning';
	String get unlockAxisAlignedPan => 'Unlock panning to horizontal or vertical';
	String get lockAxisAlignedPan => 'Lock panning to horizontal or vertical';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	TranslationsSettingsPrefDescriptionsHideFingerDrawingEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get shown => 'Prevents accidental toggling';
	String get fixedOn => 'Finger drawing is fixed as enabled';
	String get fixedOff => 'Finger drawing is fixed as disabled';
}

// Path: settings.prefDescriptions.pencilSoundSetting
class TranslationsSettingsPrefDescriptionsPencilSoundSettingEn {
	TranslationsSettingsPrefDescriptionsPencilSoundSettingEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get off => 'No sound';
	String get onButNotInSilentMode => 'Enabled (unless in silent mode)';
	String get onAlways => 'Enabled (even in silent mode)';
}

// Path: login.ncLoginStep.loginFlow
class TranslationsLoginNcLoginStepLoginFlowEn {
	TranslationsLoginNcLoginStepLoginFlowEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get pleaseAuthorize => 'Please authorize Saber to access your Nextcloud account';
	String get followPrompts => 'Please follow the prompts in the Nextcloud interface';
	String get browserDidntOpen => 'Login page didn\'t open? Click here';
}

// Path: login.encLoginStep.encFaq.0
class TranslationsLoginEncLoginStep$encFaq$0i0$En {
	TranslationsLoginEncLoginStep$encFaq$0i0$En.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get q => 'What is an encryption password? Why use two passwords?';
	String get a => 'The Nextcloud password is used to access the cloud. The encryption password "scrambles" your data before it ever reaches the cloud.\nEven if someone gains access to your Nextcloud account, your notes will remain safe and encrypted with a separate password. This provides you a second layer of security to protect your data.\nNo-one can access your notes on the server without your encryption password, but this also means that if you forget your encryption password, you will lose access to your data.';
}

// Path: login.encLoginStep.encFaq.1
class TranslationsLoginEncLoginStep$encFaq$0i1$En {
	TranslationsLoginEncLoginStep$encFaq$0i1$En.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get q => 'I haven\'t set an encryption password yet. Where do I get it?';
	String get a => 'Choose a new encryption password and enter it above.\nSaber will generate your encryption keys from this password automatically.';
}

// Path: login.encLoginStep.encFaq.2
class TranslationsLoginEncLoginStep$encFaq$0i2$En {
	TranslationsLoginEncLoginStep$encFaq$0i2$En.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get q => 'Can I use the same password as my Nextcloud account?';
	String get a => 'Yes, but keep in mind that it would be easier for the server administrator or someone else to access your notes if they gain access to your Nextcloud account.';
}

// Path: editor.menu.boxFits
class TranslationsEditorMenuBoxFitsEn {
	TranslationsEditorMenuBoxFitsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get fill => 'Stretch';
	String get cover => 'Cover';
	String get contain => 'Contain';
}

// Path: editor.menu.bgPatterns
class TranslationsEditorMenuBgPatternsEn {
	TranslationsEditorMenuBgPatternsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

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
