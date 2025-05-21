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
class TranslationsHe extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsHe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.he,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <he>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsHe _root = this; // ignore: unused_field

	@override 
	TranslationsHe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHe(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonHe common = _TranslationsCommonHe._(_root);
	@override late final _TranslationsHomeHe home = _TranslationsHomeHe._(_root);
	@override late final _TranslationsSettingsHe settings = _TranslationsSettingsHe._(_root);
	@override late final _TranslationsLogsHe logs = _TranslationsLogsHe._(_root);
	@override late final _TranslationsLoginHe login = _TranslationsLoginHe._(_root);
	@override late final _TranslationsProfileHe profile = _TranslationsProfileHe._(_root);
	@override late final _TranslationsAppInfoHe appInfo = _TranslationsAppInfoHe._(_root);
	@override late final _TranslationsUpdateHe update = _TranslationsUpdateHe._(_root);
	@override late final _TranslationsEditorHe editor = _TranslationsEditorHe._(_root);
}

// Path: common
class _TranslationsCommonHe extends TranslationsCommonEn {
	_TranslationsCommonHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'בטל';
	@override String get done => 'בוצע';
	@override String get continueBtn => 'לְהַמשִׁיך';
}

// Path: home
class _TranslationsHomeHe extends TranslationsHomeEn {
	_TranslationsHomeHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsHe tabs = _TranslationsHomeTabsHe._(_root);
	@override late final _TranslationsHomeTitlesHe titles = _TranslationsHomeTitlesHe._(_root);
	@override late final _TranslationsHomeTooltipsHe tooltips = _TranslationsHomeTooltipsHe._(_root);
	@override late final _TranslationsHomeCreateHe create = _TranslationsHomeCreateHe._(_root);
	@override String get welcome => 'ברוכים הבאים ל Saber';
	@override String get invalidFormat => 'הקובץ שבחרת אינו תומך. אנא בחר בקובץ .sbn\' .sbn2\' .sba או .pdf';
	@override String get noFiles => 'קבצים לא נמצאו';
	@override String get noPreviewAvailable => 'אין תצוגה מקדימה זמינה';
	@override String get createNewNote => 'הקש על הלחצן + כדי ליצור הערה חדשה';
	@override String get backFolder => 'חזור אחורה לתקייה הקודמת';
	@override late final _TranslationsHomeNewFolderHe newFolder = _TranslationsHomeNewFolderHe._(_root);
	@override late final _TranslationsHomeRenameNoteHe renameNote = _TranslationsHomeRenameNoteHe._(_root);
	@override late final _TranslationsHomeMoveNoteHe moveNote = _TranslationsHomeMoveNoteHe._(_root);
	@override String get deleteNote => 'מחק פתק';
	@override late final _TranslationsHomeRenameFolderHe renameFolder = _TranslationsHomeRenameFolderHe._(_root);
	@override late final _TranslationsHomeDeleteFolderHe deleteFolder = _TranslationsHomeDeleteFolderHe._(_root);
}

// Path: settings
class _TranslationsSettingsHe extends TranslationsSettingsEn {
	_TranslationsSettingsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesHe prefCategories = _TranslationsSettingsPrefCategoriesHe._(_root);
	@override late final _TranslationsSettingsPrefLabelsHe prefLabels = _TranslationsSettingsPrefLabelsHe._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsHe prefDescriptions = _TranslationsSettingsPrefDescriptionsHe._(_root);
	@override late final _TranslationsSettingsThemeModesHe themeModes = _TranslationsSettingsThemeModesHe._(_root);
	@override late final _TranslationsSettingsLayoutSizesHe layoutSizes = _TranslationsSettingsLayoutSizesHe._(_root);
	@override late final _TranslationsSettingsAccentColorPickerHe accentColorPicker = _TranslationsSettingsAccentColorPickerHe._(_root);
	@override String get systemLanguage => 'ברירת מחדל';
	@override List<String> get axisDirections => [
		'למעלה',
		'ימין',
		'למטה',
		'שמאל',
	];
	@override late final _TranslationsSettingsResetHe reset = _TranslationsSettingsResetHe._(_root);
	@override late final _TranslationsSettingsCustomDataDirHe customDataDir = _TranslationsSettingsCustomDataDirHe._(_root);
	@override String get openDataDir => 'פתח את תיקיית Saber';
	@override String get resyncEverything => 'סנכרן הכל מחדש';
}

// Path: logs
class _TranslationsLogsHe extends TranslationsLogsEn {
	_TranslationsLogsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get logs => 'יומנים';
	@override String get viewLogs => 'הצג יומנים';
	@override String get debuggingInfo => 'יומנים מכילים מידע שימושי עבור איתור באגים ופיתוח';
	@override String get noLogs => 'אין כאן יומנים!';
	@override String get logsAreTemporary => 'יומנים נשמרים רק עד לסגירת האפליקציה';
}

// Path: login
class _TranslationsLoginHe extends TranslationsLoginEn {
	_TranslationsLoginHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'התחבר';
	@override late final _TranslationsLoginFormHe form = _TranslationsLoginFormHe._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'אין לך עוד משתמש '),
		linkToSignup('הירשם עכשיו'),
		const TextSpan(text: '!'),
	]);
	@override late final _TranslationsLoginStatusHe status = _TranslationsLoginStatusHe._(_root);
	@override late final _TranslationsLoginNcLoginStepHe ncLoginStep = _TranslationsLoginNcLoginStepHe._(_root);
	@override late final _TranslationsLoginEncLoginStepHe encLoginStep = _TranslationsLoginEncLoginStepHe._(_root);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		undoLogin('לא אתה'),
	]);
}

// Path: profile
class _TranslationsProfileHe extends TranslationsProfileEn {
	_TranslationsProfileHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הפרופיל שלי';
	@override String get logout => 'התנתק';
	@override late final _TranslationsProfileQuickLinksHe quickLinks = _TranslationsProfileQuickLinksHe._(_root);
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$He._(_root),
		_TranslationsProfile$faq$0i1$He._(_root),
		_TranslationsProfile$faq$0i2$He._(_root),
		_TranslationsProfile$faq$0i3$He._(_root),
	];
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'אתה משתמש ב-${used} של ${total} (${percent}%)';
	@override String get connectedTo => 'מחובר ל';
	@override String get faqTitle => 'שאלות נפוצות';
}

// Path: appInfo
class _TranslationsAppInfoHe extends TranslationsAppInfoEn {
	_TranslationsAppInfoHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nתוכנית זו מגיעה ללא כל אחריות. זוהי תוכנה חופשית ואתה מוזמן להפיץ אותו מחדש בתנאים מסוימים.';
	@override String get dirty => 'מלוכלך';
	@override String get debug => 'דִּיבָּג';
	@override String get sponsorButton => 'הקש כאן כדי לתת לי חסות או לקנות שטח אחסון נוסף';
	@override String get licenseButton => 'הקש כאן כדי להציג פרטי רישיון נוספים';
	@override String get privacyPolicyButton => 'הקש כאן כדי להציג את מדיניות הפרטיות';
}

// Path: update
class _TranslationsUpdateHe extends TranslationsUpdateEn {
	_TranslationsUpdateHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'עדכון זמין';
	@override String get updateAvailableDescription => 'גרסה חדשה של היישום זמינה עם שינויים אלה:';
	@override String get update => 'עדכן';
	@override String get downloadNotAvailableYet => 'ההורדה עדיין לא זמינה עבור הפלטפורמה שלך. אנא בדוק שוב בקרוב.';
}

// Path: editor
class _TranslationsEditorHe extends TranslationsEditorEn {
	_TranslationsEditorHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarHe toolbar = _TranslationsEditorToolbarHe._(_root);
	@override late final _TranslationsEditorPensHe pens = _TranslationsEditorPensHe._(_root);
	@override late final _TranslationsEditorPenOptionsHe penOptions = _TranslationsEditorPenOptionsHe._(_root);
	@override late final _TranslationsEditorColorsHe colors = _TranslationsEditorColorsHe._(_root);
	@override late final _TranslationsEditorImageOptionsHe imageOptions = _TranslationsEditorImageOptionsHe._(_root);
	@override late final _TranslationsEditorSelectionBarHe selectionBar = _TranslationsEditorSelectionBarHe._(_root);
	@override late final _TranslationsEditorMenuHe menu = _TranslationsEditorMenuHe._(_root);
	@override late final _TranslationsEditorNewerFileFormatHe newerFileFormat = _TranslationsEditorNewerFileFormatHe._(_root);
	@override late final _TranslationsEditorQuillHe quill = _TranslationsEditorQuillHe._(_root);
	@override late final _TranslationsEditorHudHe hud = _TranslationsEditorHudHe._(_root);
	@override String get pages => 'דפים';
	@override String get untitled => 'חסר כותרת';
	@override String get needsToSaveBeforeExiting => 'שמירת השינויים... אתה יכול לצאת בבטחה מהעורך בסיום';
}

// Path: home.tabs
class _TranslationsHomeTabsHe extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get home => 'בית';
	@override String get browse => 'דפדף';
	@override String get whiteboard => 'לוח לבן';
	@override String get settings => 'הגדרות';
}

// Path: home.titles
class _TranslationsHomeTitlesHe extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get home => 'פתקים אחרונים';
	@override String get browse => 'דפדף';
	@override String get whiteboard => 'לוח לבן';
	@override String get settings => 'הגדרות';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsHe extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'פתק חדש';
	@override String get showUpdateDialog => 'תיבת הדו-שיח הצג עדכון';
	@override String get exportNote => 'ייצא הערה';
}

// Path: home.create
class _TranslationsHomeCreateHe extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'פתק חדש';
	@override String get importNote => 'יבא פתק';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderHe extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'תקייה חדשה';
	@override String get folderName => 'שם התקייה';
	@override String get create => 'צור';
	@override String get folderNameEmpty => 'שם התקייה לא יכול להיות ריק';
	@override String get folderNameContainsSlash => 'שם התקייה לא יכול להכיל לוכסן';
	@override String get folderNameExists => 'תקייה כבר קיימת';
}

// Path: home.renameNote
class _TranslationsHomeRenameNoteHe extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'שנה את שם הפתק';
	@override String get noteName => 'שם הפתק';
	@override String get rename => 'שנה שם';
	@override String get noteNameEmpty => 'שם הערה לא יכול להיות ריק';
	@override String get noteNameContainsSlash => 'שם הערה לא יכול להכיל קו נטוי';
	@override String get noteNameExists => 'הערה בשם זה כבר קיימת';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteHe extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

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
class _TranslationsHomeRenameFolderHe extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'שנה את שם התקייה';
	@override String get folderName => 'שם התקייה';
	@override String get rename => 'שנה שם';
	@override String get folderNameEmpty => 'שם התקייה לא יכול להיות ריק';
	@override String get folderNameContainsSlash => 'שם התקייה לא יכול להכיל לוכסן';
	@override String get folderNameExists => 'תקייה כבר קיימת';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderHe extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'מחק תקייה';
	@override String deleteName({required Object f}) => 'מחק ${f}';
	@override String get delete => 'מחק';
	@override String get alsoDeleteContents => 'גם תמחק את כל הפתקים בתקייה זו';
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesHe extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get general => 'כללי';
	@override String get writing => 'כתיבה';
	@override String get editor => 'עורך';
	@override String get advanced => 'מתקדם';
	@override String get performance => 'ביצועים';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsHe extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get locale => 'שפת התוכנה';
	@override String get appTheme => 'ערכת הנושא של האפליקציה';
	@override String get platform => 'סוג ערכת הנושא';
	@override String get layoutSize => 'סוג פריסה';
	@override String get customAccentColor => 'צבע הדגשה מותאם אישית';
	@override String get hyperlegibleFont => 'גופן Atkinson Hyperreadible';
	@override String get shouldCheckForUpdates => 'בדוק אם קיימים עדכוני Saber';
	@override String get shouldAlwaysAlertForUpdates => 'עדכונים מהירים יותר';
	@override String get allowInsecureConnections => 'אפשר חיבורים לא מאובטחים';
	@override String get editorToolbarAlignment => 'מיקום סרגל הכלים';
	@override String get editorToolbarShowInFullscreen => 'הצג את סרגל הכלים במצב מסך מלא';
	@override String get editorAutoInvert => 'הפוך הערות במצב כהה';
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
	@override String get simplifiedHomeLayout => 'פריסת בית פשוטה';
	@override String get pencilSoundSetting => 'אפקט צליל עיפרון';
	@override String get customDataDir => 'ספריית נתונים מותאמת אישית';
	@override String get autoStraightenLines => 'יישור קווים אוטומטית';
	@override String get shapeRecognitionDelay => 'עיכוב זיהוי צורות';
	@override String get recentColorsLength => 'כמה צבעים אחרונים לאחסן';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsHe extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'מגביר את הקריאות למשתמשים עם ראייה לקויה';
	@override String get allowInsecureConnections => '(לא מומלץ) אפשר לסבר להתחבר לשרתים עם אישורים חתומים/לא מהימנים';
	@override String get preferGreyscale => 'עבור תצוגות דיו אלקטרוני';
	@override String get autoClearWhiteboardOnExit => 'מנקה את לוח הציור לאחר היציאה מהאפליקציה';
	@override String get disableEraserAfterUse => 'מעבר אוטומטי חזרה לעט לאחר שימוש במחק';
	@override String get maxImageSize => 'תמונות גדולות יותר יידחסו';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingHe hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingHe._(_root);
	@override String get editorPromptRename => 'תמיד תוכל לשנות את שם הפתקים מאוחר יותר';
	@override String get hideHomeBackgrounds => 'למראה נקי יותר';
	@override String get printPageIndicators => 'הצג מחווני עמודים בייצוא';
	@override String get autosaveDelay => 'כמה זמן לחכות לפני שמירת הערה אוטומטית';
	@override String get shouldAlwaysAlertForUpdates => 'ספר לי על עדכונים ברגע שהם יהיו זמינים';
	@override late final _TranslationsSettingsPrefDescriptionsPencilSoundSettingHe pencilSoundSetting = _TranslationsSettingsPrefDescriptionsPencilSoundSettingHe._(_root);
	@override String get simplifiedHomeLayout => 'מגדיר גובה קבוע עבור כל תצוגה מקדימה של הערה';
	@override String get autoStraightenLines => 'מיישר קווים ארוכים ללא צורך להשתמש בעט הצורה';
	@override String get shapeRecognitionDelay => 'באיזו תדירות לעדכן את התצוגה המקדימה של הצורה';
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesHe extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get system => 'מערכת';
	@override String get light => 'בהיר';
	@override String get dark => 'כהה';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesHe extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get auto => 'אוטומטי';
	@override String get phone => 'טלפון';
	@override String get tablet => 'טאבלט';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerHe extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'בחר צבע';
}

// Path: settings.reset
class _TranslationsSettingsResetHe extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'אפס הגדרה זו?';
	@override String get button => 'אפס';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirHe extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'לְבַטֵל';
	@override String get select => 'בחר';
	@override String get mustBeEmpty => 'הספרייה שנבחרה חייבת להיות ריקה';
	@override String get mustBeDoneSyncing => 'ודא שהסנכרון הושלם לפני שינוי הספרייה';
}

// Path: login.form
class _TranslationsLoginFormHe extends TranslationsLoginFormEn {
	_TranslationsLoginFormHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'על ידי התחברות, אתה מסכים ל '),
		linkToPrivacyPolicy('מדיניות הפרטיות'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusHe extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'מנותק';
	@override String get tapToLogin => 'לחץ כדי להתחבר עם NextCloud';
	@override String get loggedIn => 'מחובר עם NextCloud';
	@override String hi({required Object u}) => 'היי, ${u}!';
	@override String get almostDone => 'כמעט מוכן לסנכרון, הקש כדי לסיים את הכניסה';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepHe extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsLoginNcLoginStepLoginFlowHe loginFlow = _TranslationsLoginNcLoginStepLoginFlowHe._(_root);
	@override String get whereToStoreData => 'בחר היכן ברצונך לאחסן את הנתונים שלך:';
	@override String get saberNcServer => 'שרת Nextcloud של סייבר';
	@override String get otherNcServer => 'שרת Nextcloud אחר';
	@override String get serverUrl => 'כתובת האתר של השרת';
	@override String get loginWithSaber => 'התחבר עם Saber';
	@override String get loginWithNextcloud => 'התחבר עם Nextcloud';
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepHe extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'כדי להגן על הנתונים שלך, אנא הזן את סיסמת ההצפנה שלך:';
	@override String get newToSaber => 'חדש בסבר';
	@override String get encPassword => 'סיסמת הצפנה';
	@override String get encFaqTitle => 'שאלות נפוצות';
	@override String get wrongEncPassword => 'הפענוח נכשל עם הסיסמה שסופקה. אנא נסה להזין אותו שוב.';
	@override String get connectionFailed => 'משהו השתבש בחיבור לשרת. בבקשה נסה שוב מאוחר יותר.';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$He._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$He._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$He._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksHe extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'דף הבית של השרת';
	@override String get deleteAccount => 'מחק משתמש';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$He extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$He._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'אני אאבד את הפתקים שלי אם אני אתנתק?';
	@override String get a => 'לא. ההערות שלך יישארו גם במכשיר וגם בשרת. הם לא יסונכרנו עם השרת עד שתתחבר חזרה. ודא שהסנכרון הושלם לפני היציאה כדי שלא תאבד נתונים (ראה את התקדמות הסנכרון במסך הבית).';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$He extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$He._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'איך אני משנה את סיסמאת ה NextCloud שלי';
	@override String get a => 'עבור לאתר השרת שלך והתחבר. לאחר מכן עבור אל הגדרות > אבטחה > שנה סיסמה. תצטרך להתנתק ולהיכנס שוב ל-Saber לאחר שינוי הסיסמה שלך.';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$He extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$He._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'איך אני משנה את הסיסמא המוצפנת שלי?';
	@override String get a => '0. ודא שהסנכרון הושלם (ראה את התקדמות הסנכרון במסך הבית).\n1. התנתק מ Saber.\n2. עבור אל אתר האינטרנט של השרת שלך ומחק את התיקיה \'Saber\' שלך. פעולה זו תמחק את כל ההערות שלך מהשרת.\n3. היכנס שוב ל-Saber. אתה יכול לבחור סיסמת הצפנה חדשה בעת הכניסה.\n4. אל תשכח להתנתק ולהתחבר שוב ל-Saber גם במכשירים האחרים שלך.';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$He extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$He._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'איך אני יכול למחוק את החשבון שלי?';
	@override String get a => 'הקש על הלחצן "${_root.profile.quickLinks.deleteAccount}" למעלה, והיכנס במידת הצורך.\n אם אתה משתמש בשרת Saber הרשמי, החשבון שלך יימחק לאחר תקופת חסד של שבוע. ניתן ליצור איתי קשר בכתובת adilhanney@disroot.org במהלך תקופה זו כדי לבטל את המחיקה.\n אם אתה משתמש בשרת של צד שלישי, ייתכן שלא תהיה אפשרות למחוק את חשבונך: תצטרך לעיין במדיניות הפרטיות של השרת לקבלת מידע נוסף.';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarHe extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

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
class _TranslationsEditorPensHe extends TranslationsEditorPensEn {
	_TranslationsEditorPensHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'עט נובע';
	@override String get ballpointPen => 'עט כדורי';
	@override String get highlighter => 'מרקר';
	@override String get laserPointer => 'סמן לייזר';
	@override String get pencil => 'עִפָּרוֹן';
	@override String get shapePen => 'עט צורה';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsHe extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get size => 'גודל';
}

// Path: editor.colors
class _TranslationsEditorColorsHe extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'בורר צבעים';
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
	@override String customBrightnessHue({required Object b, required Object h}) => 'מותאם אישית ${b} ${h}';
	@override String customHue({required Object h}) => 'מותאם אישית ${h}';
	@override String get dark => 'אפל';
	@override String get light => 'אוֹר';
	@override String get cyan => 'טורקיז';
	@override String get pink => 'וָרוֹד';
}

// Path: editor.imageOptions
class _TranslationsEditorImageOptionsHe extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'אפשרויות תמונה';
	@override String get invertible => 'הפיך';
	@override String get download => 'הורד';
	@override String get setAsBackground => 'הגדר כרקע';
	@override String get removeAsBackground => 'הסר כרקע';
	@override String get delete => 'מחק';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarHe extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get delete => 'מחק';
	@override String get duplicate => 'שכפל';
}

// Path: editor.menu
class _TranslationsEditorMenuHe extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'נקה דף ${page}/${totalPages}';
	@override String get clearAllPages => 'נקה את כל הדפים';
	@override String get insertPage => 'הכנס דף מלמטה';
	@override String get duplicatePage => 'שכפל דף';
	@override String get deletePage => 'מחק דף';
	@override String get lineHeight => 'גובה הקו';
	@override String get backgroundImageFit => 'התאמת תמונת רקע';
	@override String get backgroundPattern => 'תבנית רקע';
	@override String get import => 'יבוא';
	@override late final _TranslationsEditorMenuBoxFitsHe boxFits = _TranslationsEditorMenuBoxFitsHe._(_root);
	@override late final _TranslationsEditorMenuBgPatternsHe bgPatterns = _TranslationsEditorMenuBgPatternsHe._(_root);
	@override String get lineThickness => 'עובי קו';
	@override String get lineThicknessDescription => 'עובי קו רקע';
	@override String get watchServer => 'שימו לב לעדכונים בשרת';
	@override String get watchServerReadOnly => 'העריכה מושבתת בזמן צפייה בשרת';
	@override String get lineHeightDescription => 'שולט גם בגודל הטקסט עבור הערות מוקלדות';
}

// Path: editor.newerFileFormat
class _TranslationsEditorNewerFileFormatHe extends TranslationsEditorNewerFileFormatEn {
	_TranslationsEditorNewerFileFormatHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'מצב צפייה בלבד';
	@override String get title => 'הערה זו נערכה באמצעות גרסה חדשה יותר של Saber';
	@override String get subtitle => 'עריכת פתק זה עלולה לגרום לאיבוד מידע מסוים. האם אתה רוצה להתאלם מזה בכל מקרה?';
	@override String get allowEditing => 'אפשר עריכה';
}

// Path: editor.quill
class _TranslationsEditorQuillHe extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'תכתוב משהו פה...';
}

// Path: editor.hud
class _TranslationsEditorHudHe extends TranslationsEditorHudEn {
	_TranslationsEditorHudHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'בטל נעילת זום';
	@override String get lockZoom => 'נעיל זום';
	@override String get unlockSingleFingerPan => 'הפיכת גלילה רציפה באצבע אחת לזמינה';
	@override String get lockSingleFingerPan => 'הפיכת גלילה רציפה באצבע אחת ללא זמינה';
	@override String get unlockAxisAlignedPan => 'ביטול נעילה של גלילה רציפה לאופקית או אנכית';
	@override String get lockAxisAlignedPan => 'נעילת גלילה רציפה לאופקית או אנכית';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingHe extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get shown => 'מונע החלפת מצב בשוגג';
	@override String get fixedOn => 'ציור אצבע קבוע כזמין';
	@override String get fixedOff => 'ציור אצבע קבוע כלא זמין';
}

// Path: settings.prefDescriptions.pencilSoundSetting
class _TranslationsSettingsPrefDescriptionsPencilSoundSettingHe extends TranslationsSettingsPrefDescriptionsPencilSoundSettingEn {
	_TranslationsSettingsPrefDescriptionsPencilSoundSettingHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get onButNotInSilentMode => 'מופעל (אלא אם כן במצב שקט)';
	@override String get off => 'אין קול';
	@override String get onAlways => 'מופעל (אפילו במצב שקט)';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowHe extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'אנא אשר לסבר לגשת לחשבון Nextcloud שלך';
	@override String get followPrompts => 'אנא עקוב אחר ההנחיות בדפדפן שלך.';
	@override String get browserDidntOpen => 'הדפדפן לא נפתח';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$He extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$He._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'מהי הסיסמא המוצפנת?';
	@override String get a => 'סיסמת ההצפנה משמשת להצפנת הנתונים שלך לפני שליחתם לשרת. אתה בוחר את זה כשאתה נכנס לראשונה ל-Saber, וזה לא קשור לחשבון/סיסמת Nextcloud שלך.\nאף אחד לא יכול לגשת להערות שלך בשרת ללא סיסמת ההצפנה שלך. זה גם אומר שאם תשכח את סיסמת ההצפנה שלך, תאבד את הגישה לנתונים שלך.';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$He extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$He._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'למה להשתמש בשתי סיסמאות?';
	@override String get a => 'סיסמת Nextcloud משמשת לגישה לענן. סיסמת ההצפנה "מערבלת" את הנתונים שלך לפני שהם מגיעים לענן.\nגם אם מישהו יקבל גישה לחשבון Nextcloud שלך, ההערות שלך יישארו בטוחות ומוצפנות עם סיסמה נפרדת. זה מספק לך שכבה שנייה של אבטחה כדי להגן על הנתונים שלך.';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$He extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$He._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'Can I use the same password for both?';
	@override String get a => 'כן, אבל זה פחות מאובטח. מכיוון שסיסמת Nextcloud שלך נשלחת לשרת, מישהו עם גישה לשרת יוכל לפענח את ההערות שלך. השתמש באותה סיסמה רק אם אתה סומך על בעל השרת.';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsHe extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get fill => 'מתיחה';
	@override String get cover => 'כיסוי';
	@override String get contain => 'מכיל';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsHe extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

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
