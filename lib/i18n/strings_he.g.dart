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
class TranslationsHe extends Translations with BaseTranslations<AppLocale, Translations> {
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
	@override late final _Translations$common$he common = _Translations$common$he._(_root);
	@override late final _Translations$home$he home = _Translations$home$he._(_root);
	@override late final _Translations$sentry$he sentry = _Translations$sentry$he._(_root);
	@override late final _Translations$settings$he settings = _Translations$settings$he._(_root);
	@override late final _Translations$logs$he logs = _Translations$logs$he._(_root);
	@override late final _Translations$login$he login = _Translations$login$he._(_root);
	@override late final _Translations$profile$he profile = _Translations$profile$he._(_root);
	@override late final _Translations$appInfo$he appInfo = _Translations$appInfo$he._(_root);
	@override late final _Translations$update$he update = _Translations$update$he._(_root);
	@override late final _Translations$editor$he editor = _Translations$editor$he._(_root);
}

// Path: common
class _Translations$common$he extends Translations$common$en {
	_Translations$common$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get done => 'סיום';
	@override String get continueBtn => 'המשך';
	@override String get cancel => 'ביטול';
}

// Path: home
class _Translations$home$he extends Translations$home$en {
	_Translations$home$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$he tabs = _Translations$home$tabs$he._(_root);
	@override late final _Translations$home$titles$he titles = _Translations$home$titles$he._(_root);
	@override late final _Translations$home$tooltips$he tooltips = _Translations$home$tooltips$he._(_root);
	@override late final _Translations$home$create$he create = _Translations$home$create$he._(_root);
	@override String get welcome => 'ברוך בואך אל Saber';
	@override String get invalidFormat => 'הקובץ שבחרת אינו נתמך. נא לבחור בקובץ sbn,‏ sbn2,‏ sba, או pdf.';
	@override String get noFiles => 'לא נמצאו קבצים';
	@override String get noPreviewAvailable => 'אין תצוגה מקדימה זמינה';
	@override String get createNewNote => 'יש להקיש על הכפתור „+” בשביל ליצור פתק חדש';
	@override String get backFolder => 'חזרה לתיקייה הקודמת';
	@override late final _Translations$home$newFolder$he newFolder = _Translations$home$newFolder$he._(_root);
	@override late final _Translations$home$renameNote$he renameNote = _Translations$home$renameNote$he._(_root);
	@override late final _Translations$home$moveNote$he moveNote = _Translations$home$moveNote$he._(_root);
	@override String get deleteNote => 'מחיקת פתק';
	@override late final _Translations$home$deleteNoteDialog$he deleteNoteDialog = _Translations$home$deleteNoteDialog$he._(_root);
	@override late final _Translations$home$renameFolder$he renameFolder = _Translations$home$renameFolder$he._(_root);
	@override late final _Translations$home$deleteFolder$he deleteFolder = _Translations$home$deleteFolder$he._(_root);
}

// Path: sentry
class _Translations$sentry$he extends Translations$sentry$en {
	_Translations$sentry$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$he consent = _Translations$sentry$consent$he._(_root);
}

// Path: settings
class _Translations$settings$he extends Translations$settings$en {
	_Translations$settings$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$he prefCategories = _Translations$settings$prefCategories$he._(_root);
	@override late final _Translations$settings$prefLabels$he prefLabels = _Translations$settings$prefLabels$he._(_root);
	@override late final _Translations$settings$prefDescriptions$he prefDescriptions = _Translations$settings$prefDescriptions$he._(_root);
	@override late final _Translations$settings$themeModes$he themeModes = _Translations$settings$themeModes$he._(_root);
	@override late final _Translations$settings$layoutSizes$he layoutSizes = _Translations$settings$layoutSizes$he._(_root);
	@override late final _Translations$settings$accentColorPicker$he accentColorPicker = _Translations$settings$accentColorPicker$he._(_root);
	@override String get systemLanguage => 'ברירת מחדל';
	@override List<String> get axisDirections => [
		'למעלה',
		'ימין',
		'למטה',
		'שמאל',
	];
	@override late final _Translations$settings$reset$he reset = _Translations$settings$reset$he._(_root);
	@override String get resyncEverything => 'סנכרון מחדש של הכול';
	@override String get openDataDir => 'פתיחת תיקיית Saber';
	@override late final _Translations$settings$customDataDir$he customDataDir = _Translations$settings$customDataDir$he._(_root);
	@override String get autosaveDisabled => 'אף פעם';
	@override String get shapeRecognitionDisabled => 'אף פעם';
}

// Path: logs
class _Translations$logs$he extends Translations$logs$en {
	_Translations$logs$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get logs => 'יומן';
	@override String get viewLogs => 'הצגת היומן';
	@override String get debuggingInfo => 'היומן מכיל מידע שימושי לניפוי שגיאות ולפיתוח';
	@override String get noLogs => 'אין כאן פלט יומן!';
	@override String get useTheApp => 'פלט היומן יופיע כאן ככל שייעשה ביישום יותר שימוש';
}

// Path: login
class _Translations$login$he extends Translations$login$en {
	_Translations$login$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'התחבר';
	@override late final _Translations$login$form$he form = _Translations$login$form$he._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'אין לך עוד משתמש '),
		linkToSignup('הירשם עכשיו'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'זה לא חשבונך? אפשר '),
		undoLogin('לבחור חשבון אחר'),
		const TextSpan(text: '.'),
	]);
	@override late final _Translations$login$status$he status = _Translations$login$status$he._(_root);
	@override late final _Translations$login$ncLoginStep$he ncLoginStep = _Translations$login$ncLoginStep$he._(_root);
	@override late final _Translations$login$encLoginStep$he encLoginStep = _Translations$login$encLoginStep$he._(_root);
}

// Path: profile
class _Translations$profile$he extends Translations$profile$en {
	_Translations$profile$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הפרופיל שלי';
	@override String get logout => 'התנתק';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'נעשה שימוש ב־${used} מתוך ${total} (‏${percent}‏%)';
	@override String get connectedTo => 'התחברת אל';
	@override late final _Translations$profile$quickLinks$he quickLinks = _Translations$profile$quickLinks$he._(_root);
	@override String get faqTitle => 'שאלות ותשובות';
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$he._(_root),
		_Translations$profile$faq$1$he._(_root),
		_Translations$profile$faq$2$he._(_root),
		_Translations$profile$faq$3$he._(_root),
	];
}

// Path: appInfo
class _Translations$appInfo$he extends Translations$appInfo$en {
	_Translations$appInfo$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  כל הזכויות שמורות © 2022-${buildYear}  עַאדִל האני\nתוכנית זו מגיעה ללא כל אחריות. זוהי תוכנה חופשית ואפשר להפיץ אותה מחדש בתנאים מסוימים.';
	@override String get debug => 'דִּיבָּג';
	@override String get sponsorButton => 'אפשר להקיש כאן כדי לתת לי חסות או לקנות שטח אחסון נוסף';
	@override String get licenseButton => 'אפשר להקיש כאן כדי להציג פרטי רישיון נוספים';
	@override String get privacyPolicyButton => 'אפשר להקיש כאן כדי להציג את מדיניות הפרטיות';
}

// Path: update
class _Translations$update$he extends Translations$update$en {
	_Translations$update$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'עדכון זמין';
	@override String get updateAvailableDescription => 'גרסה חדשה של היישום זמינה עם שינויים אלה:';
	@override String get update => 'עדכן';
	@override String get downloadNotAvailableYet => 'ההורדה עדיין אינה זמינה לפלטפורמה שלך. נא לבדוק שוב בעוד זמן קצר.';
}

// Path: editor
class _Translations$editor$he extends Translations$editor$en {
	_Translations$editor$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$he toolbar = _Translations$editor$toolbar$he._(_root);
	@override late final _Translations$editor$pens$he pens = _Translations$editor$pens$he._(_root);
	@override late final _Translations$editor$penOptions$he penOptions = _Translations$editor$penOptions$he._(_root);
	@override late final _Translations$editor$colors$he colors = _Translations$editor$colors$he._(_root);
	@override late final _Translations$editor$imageOptions$he imageOptions = _Translations$editor$imageOptions$he._(_root);
	@override late final _Translations$editor$selectionBar$he selectionBar = _Translations$editor$selectionBar$he._(_root);
	@override late final _Translations$editor$menu$he menu = _Translations$editor$menu$he._(_root);
	@override late final _Translations$editor$readOnlyBanner$he readOnlyBanner = _Translations$editor$readOnlyBanner$he._(_root);
	@override late final _Translations$editor$versionTooNew$he versionTooNew = _Translations$editor$versionTooNew$he._(_root);
	@override late final _Translations$editor$quill$he quill = _Translations$editor$quill$he._(_root);
	@override late final _Translations$editor$hud$he hud = _Translations$editor$hud$he._(_root);
	@override String get pages => 'עמודים';
	@override String get untitled => 'חסר כותרת';
	@override String get needsToSaveBeforeExiting => 'השינויים נשמרים... אפשר לצאת בבטחה מהעורך בעת סיום השמירה';
}

// Path: home.tabs
class _Translations$home$tabs$he extends Translations$home$tabs$en {
	_Translations$home$tabs$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get home => 'בית';
	@override String get browse => 'עיון';
	@override String get whiteboard => 'לוח מחיק';
	@override String get settings => 'הגדרות';
}

// Path: home.titles
class _Translations$home$titles$he extends Translations$home$titles$en {
	_Translations$home$titles$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get home => 'פתקים אחרונים';
	@override String get browse => 'עיון';
	@override String get whiteboard => 'לוח מחיק';
	@override String get settings => 'הגדרות';
}

// Path: home.tooltips
class _Translations$home$tooltips$he extends Translations$home$tooltips$en {
	_Translations$home$tooltips$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'פתק חדש';
	@override String get showUpdateDialog => 'הצגת חלונית עדכון';
	@override String get exportNote => 'ייצוא פתק';
}

// Path: home.create
class _Translations$home$create$he extends Translations$home$create$en {
	_Translations$home$create$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'פתק חדש';
	@override String get importNote => 'ייבוא פתק';
}

// Path: home.newFolder
class _Translations$home$newFolder$he extends Translations$home$newFolder$en {
	_Translations$home$newFolder$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'תיקייה חדשה';
	@override String get folderName => 'שם התיקייה';
	@override String get create => 'יצירה';
	@override String get folderNameEmpty => 'שם התיקייה אינו יכול להיות ריק';
	@override String get folderNameContainsSlash => 'שם התיקייה אינו יכול להכיל קו נטוי';
	@override String get folderNameExists => 'התיקייה כבר קיימת';
}

// Path: home.renameNote
class _Translations$home$renameNote$he extends Translations$home$renameNote$en {
	_Translations$home$renameNote$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'שינוי שם הפתק';
	@override String get noteName => 'שם הפתק';
	@override String get rename => 'שינוי שם';
	@override String get noteNameEmpty => 'שם הפתק אינו יכול להיות ריק';
	@override String get noteNameExists => 'כבר קיים פתק בשם זה';
	@override String get noteNameForbiddenCharacters => 'שם הפתק מכיל תווים אסורים';
	@override String get noteNameReserved => 'שם הפתק שמור';
}

// Path: home.moveNote
class _Translations$home$moveNote$he extends Translations$home$moveNote$en {
	_Translations$home$moveNote$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'העברת פתק';
	@override String moveNotes({required Object n}) => 'העברת ${n} פתקים';
	@override String moveName({required Object f}) => 'העברת ${f}';
	@override String get move => 'העברה';
	@override String renamedTo({required Object newName}) => 'שם הפתק ישתנה לשם ${newName}';
	@override String get multipleRenamedTo => 'ישתנה שמם של הפתקים הבאים:';
	@override String numberRenamedTo({required Object n}) => 'ישתנה שמם של ${n} פתקים בשביל להימנע מהתנגשויות';
}

// Path: home.deleteNoteDialog
class _Translations$home$deleteNoteDialog$he extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String deleteNotes({required Object n}) => 'מחיקת ${n} פתקים';
	@override String deleteName({required Object f}) => 'מחיקת ${f}';
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('he'))(n,
		one: 'למחוק את הפתק שנבחר לצמיתות?',
		other: 'למחוק את הפתקים שנבחרו לצמיתות?',
	);
	@override String get delete => 'מחיקה';
}

// Path: home.renameFolder
class _Translations$home$renameFolder$he extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'שינוי שם התיקייה';
	@override String get folderName => 'שם התיקייה';
	@override String get rename => 'שינוי שם';
	@override String get folderNameEmpty => 'שם התיקייה אינו יכול להיות ריק';
	@override String get folderNameContainsSlash => 'שם התיקייה אינו יכול להכיל קו נטוי';
	@override String get folderNameExists => 'כבר קיימת תיקייה בשם זה';
}

// Path: home.deleteFolder
class _Translations$home$deleteFolder$he extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'מחיקת תיקייה';
	@override String deleteName({required Object f}) => 'מחיקת ${f}';
	@override String get delete => 'מחיקה';
	@override String get alsoDeleteContents => 'מחיקה גם של כל הפתקים בתיקייה זו';
}

// Path: sentry.consent
class _Translations$sentry$consent$he extends Translations$sentry$consent$en {
	_Translations$sentry$consent$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'האם לעזור בשיפור Saber?';
	@override late final _Translations$sentry$consent$description$he description = _Translations$sentry$consent$description$he._(_root);
	@override late final _Translations$sentry$consent$answers$he answers = _Translations$sentry$consent$answers$he._(_root);
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$he extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get general => 'הגדרות כלליות';
	@override String get writing => 'כתיבה';
	@override String get editor => 'מצב עריכה';
	@override String get performance => 'ביצועים';
	@override String get advanced => 'הגדרות מתקדמות';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$he extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get locale => 'שפת התוכנה';
	@override String get appTheme => 'ערכת הנושא של האפליקציה';
	@override String get platform => 'סוג ערכת הנושא';
	@override String get layoutSize => 'סוג פריסה';
	@override String get customAccentColor => 'צבע הדגשה מותאם אישית';
	@override String get hyperlegibleFont => 'גופן Atkinson Hyperreadible';
	@override String get shouldCheckForUpdates => 'לבדוק אם יש עדכונים ל־Saber';
	@override String get shouldAlwaysAlertForUpdates => 'עדכונים מהירים יותר';
	@override String get allowInsecureConnections => 'לאפשר חיבורים לא מאובטחים';
	@override String get editorToolbarAlignment => 'מיקום סרגל הכלים';
	@override String get editorToolbarShowInFullscreen => 'הצגת סרגל הכלים במצב מסך מלא';
	@override String get editorAutoInvert => 'היפוך צבעי הפתקים במצב כהה';
	@override String get preferGreyscale => 'העדפת גוונים אפורים';
	@override String get maxImageSize => 'גודל תמונה מרבי';
	@override String get autoClearWhiteboardOnExit => 'נקה אוטומטית את הלוח הלבן';
	@override String get disableEraserAfterUse => 'השבת אוטומטית את המחק';
	@override String get hideFingerDrawingToggle => 'הסתרת מתג הציור עם האצבע';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'השבתה אוטומטית של הציור עם האצבע';
	@override String get editorPromptRename => 'חלונית לבקשת שינוי שם לפתקים חדשים';
	@override String get recentColorsDontSavePresets => 'לא לשמור צבעי מערך בצבעים אחרונים';
	@override String get recentColorsLength => 'כמה צבעים אחרונים לשמור';
	@override String get printPageIndicators => 'הדפסת מספורי עמודים';
	@override String get autosave => 'שמירה אוטומטית';
	@override String get shapeRecognitionDelay => 'השהיה לפני זיהוי צורות';
	@override String get autoStraightenLines => 'יישור קווים אוטומטי';
	@override String get simplifiedHomeLayout => 'פריסת עמוד בית פשוטה';
	@override String get customDataDir => 'תיקייה מותאמת אישית ל־Saber';
	@override String get sentry => 'דיווח על שגיאות';
}

// Path: settings.prefDescriptions
class _Translations$settings$prefDescriptions$he extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'מגביר את הקריאות למשתמשים עם ראייה לקויה';
	@override String get allowInsecureConnections => '(לא מומלץ) לאפשר ל־Saber להתחבר לשרתים עם חתימה עצמית או תעודות שאינן מהימנות';
	@override String get preferGreyscale => 'עבור תצוגות דיו אלקטרוני';
	@override String get autoClearWhiteboardOnExit => 'מנקה את לוח הציור לאחר היציאה מהאפליקציה';
	@override String get disableEraserAfterUse => 'מעבר אוטומטי חזרה לעט לאחר שימוש במחק';
	@override String get maxImageSize => 'תמונות גדולות יותר יידחסו';
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$he hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$he._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'כיבוי הציור עם האצבע כאשר מזוהה חיבור של עט';
	@override String get editorPromptRename => 'תמיד תוכל לשנות את שם הפתקים מאוחר יותר';
	@override String get printPageIndicators => 'הצגת מספורי עמודים בקבצים מיוצאים';
	@override String get autosave => 'שמירה אוטומטית לאחר פרק זמן קצר, או אף פעם';
	@override String get shapeRecognitionDelay => 'כל כמה זמן לעדכן את התצוגה המקדימה של הצורות';
	@override String get autoStraightenLines => 'מיישר קווים ארוכים ללא צורך להשתמש בעט הצורות';
	@override String get simplifiedHomeLayout => 'קביעת גובה קבוע לתצוגה המקדימה של כל פתק';
	@override String get shouldAlwaysAlertForUpdates => 'ספר לי על עדכונים ברגע שהם יהיו זמינים';
	@override late final _Translations$settings$prefDescriptions$sentry$he sentry = _Translations$settings$prefDescriptions$sentry$he._(_root);
}

// Path: settings.themeModes
class _Translations$settings$themeModes$he extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get system => 'מערכת';
	@override String get light => 'בהיר';
	@override String get dark => 'כהה';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$he extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get auto => 'אוטומטי';
	@override String get phone => 'טלפון';
	@override String get tablet => 'טאבלט';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$he extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'בחר צבע';
}

// Path: settings.reset
class _Translations$settings$reset$he extends Translations$settings$reset$en {
	_Translations$settings$reset$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'אפס הגדרה זו?';
	@override String get button => 'אפס';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$he extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'ביטול';
	@override String get select => 'בחירה';
	@override String get mustBeEmpty => 'על התיקייה שנבחרה להיות ריקה';
	@override String get mustBeDoneSyncing => 'יש לוודא שהסנכרון הושלם לפני שמשנים את התיקייה';
	@override String get unsupported => 'תכונה זו מיועדת כרגע רק למפתחים. השימוש בה יגרום ככל הנראה אובדן נתונים.';
}

// Path: login.form
class _Translations$login$form$he extends Translations$login$form$en {
	_Translations$login$form$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'ההתחברות מבטאת את הסכמתך ל'),
		linkToPrivacyPolicy('מדיניות הפרטיות'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _Translations$login$status$he extends Translations$login$status$en {
	_Translations$login$status$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'מנותק';
	@override String get tapToLogin => 'יש ללחוץ כדי להיכנס עם Nextcloud';
	@override String hi({required Object u}) => 'אהלן, ${u}!';
	@override String get almostDone => 'הסנכרון כמעט מוכן, יש ללחוץ בשביל להשלים את ההתחברות';
	@override String get loggedIn => 'נכנסת עם Nextcloud';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$he extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'נא לבחור היכן ברצונך לאחסן את הנתונים:';
	@override String get saberNcServer => 'שרת ה־Nextcloud של Saber';
	@override String get otherNcServer => 'שרת Nextcloud אחר';
	@override String get serverUrl => 'כתובת שרת';
	@override String get loginWithSaber => 'התחברות עם Saber';
	@override String get loginWithNextcloud => 'התחברות עם Nextcloud';
	@override late final _Translations$login$ncLoginStep$loginFlow$he loginFlow = _Translations$login$ncLoginStep$loginFlow$he._(_root);
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$he extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'לצורך הגנה על הנתונים שלך, נא להקליד את סיסמת ההצפנה שלך:';
	@override String get newToSaber => 'פעם ראשונה ב־Saber? אפשר פשוט להקליד סיסמת הצפנה חדשה.';
	@override String get encPassword => 'סיסמת הצפנה';
	@override String get encFaqTitle => 'שאלות ותשובות';
	@override String get wrongEncPassword => 'פענוח ההצפנה עם הסיסמה שסופקה נכשל. נא לנסות להקליד אותה שוב.';
	@override String get connectionFailed => 'משהו השתבש בעת ההתחברות לשרת. נא לנסות שוב מאוחר יותר.';
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$he._(_root),
		_Translations$login$encLoginStep$encFaq$1$he._(_root),
		_Translations$login$encLoginStep$encFaq$2$he._(_root),
	];
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$he extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'עמוד הבית של השרת';
	@override String get deleteAccount => 'מחק משתמש';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$he extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'אני אאבד את הפתקים שלי אם אני אתנתק?';
	@override String get a => 'לא. ההערות שלך יישארו גם במכשיר וגם בשרת. הם לא יסונכרנו עם השרת עד שתתחבר חזרה. ודא שהסנכרון הושלם לפני היציאה כדי שלא תאבד נתונים (ראה את התקדמות הסנכרון במסך הבית).';
}

// Path: profile.faq.1
class _Translations$profile$faq$1$he extends Translations$profile$faq$1$en {
	_Translations$profile$faq$1$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'איך לשנות את הסיסמה שלי ל־Nextcloud?';
	@override String get a => 'עבור לאתר השרת שלך והתחבר. לאחר מכן עבור אל הגדרות > אבטחה > שנה סיסמה. תצטרך להתנתק ולהיכנס שוב ל-Saber לאחר שינוי הסיסמה שלך.';
}

// Path: profile.faq.2
class _Translations$profile$faq$2$he extends Translations$profile$faq$2$en {
	_Translations$profile$faq$2$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'איך אני משנה את הסיסמא המוצפנת שלי?';
	@override String get a => '0. לוודא שהסנכרון הושלם (ניתן לראות את התקדמות הסנכרון במסך הבית).\n1. להתנתק מ־Saber.\n2. לעבור לאתר האינטרנט של השרת ולמחוק את תיקיית ‚Saber’ שלך. פעולה זו תמחק את כל הפתקים שלך מהשרת.\n3. להתחבר שוב אל Saber. אפשר לבחור סיסמת הצפנה חדשה בעת הכניסה.\n4. לא לשכוח להתנתק ולהתחבר שוב אל Saber גם במכשירים האחרים שלך.';
}

// Path: profile.faq.3
class _Translations$profile$faq$3$he extends Translations$profile$faq$3$en {
	_Translations$profile$faq$3$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'איך אני יכול למחוק את החשבון שלי?';
	@override String get a => 'יש להקיש על הכפתור „${_root.profile.quickLinks.deleteAccount}” ולהתחבר במידת הצורך.\nאם משתמשים בשרת הרשמי של Saber, החשבון שיוצרים יימחק לאחר תקופת חסד של שבוע. אפשר ליצור איתי קשר בכתובת adilhanney@disroot.org במהלך תקופה זו כדי לבטל את המחיקה.\nאם משתמשים בשרת צד שלישי, ייתכן שאין אפשרות למחוק את החשבון: יש לעיין במדיניות הפרטיות של השרת למידע נוסף.';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$he extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'החלפת מצב צבע (Ctrl C)';
	@override String get select => 'בחר';
	@override String get toggleEraser => 'הפעלת/כיבוי מחק (Ctrl E)';
	@override String get photo => 'תמונות';
	@override String get text => 'טקסט';
	@override String get toggleFingerDrawing => 'הפעלת/כיבוי ציור עם האצבע (Ctrl F)';
	@override String get undo => 'ביטול פעולה';
	@override String get redo => 'ביצוע מחדש';
	@override String get export => 'יצא (Ctrl Shift S)';
	@override String get exportAs => 'יצא כ:';
	@override String get fullscreen => 'הפעלת/כיבוי מצב מסך מלא (F11)';
}

// Path: editor.pens
class _Translations$editor$pens$he extends Translations$editor$pens$en {
	_Translations$editor$pens$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'עט נובע';
	@override String get ballpointPen => 'עט כדורי';
	@override String get highlighter => 'מדגוש';
	@override String get pencil => 'עיפרון';
	@override String get shapePen => 'עט צורות';
	@override String get laserPointer => 'סמן לייזר';
}

// Path: editor.penOptions
class _Translations$editor$penOptions$he extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get size => 'גודל';
}

// Path: editor.colors
class _Translations$editor$colors$he extends Translations$editor$colors$en {
	_Translations$editor$colors$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'בורר צבעים';
	@override String customBrightnessHue({required Object b, required Object h}) => 'בהתאמה אישית ${b} ${h}';
	@override String customHue({required Object h}) => 'בהתאמה אישית ${h}';
	@override String get dark => 'כהה';
	@override String get light => 'בהיר';
	@override String get black => 'שחור';
	@override String get darkGrey => 'עפור ככה';
	@override String get grey => 'עפור';
	@override String get lightGrey => 'עפור בהיר';
	@override String get white => 'לבן';
	@override String get red => 'אדום';
	@override String get green => 'ירוק';
	@override String get cyan => 'ציאן';
	@override String get blue => 'כחול';
	@override String get yellow => 'צהוב';
	@override String get purple => 'סגול';
	@override String get pink => 'ורוד';
	@override String get orange => 'כתום';
	@override String get pastelRed => 'אדום פסטל';
	@override String get pastelOrange => 'כתום פסטל';
	@override String get pastelYellow => 'צהוב פסטל';
	@override String get pastelGreen => 'ירוק פסטל';
	@override String get pastelCyan => 'תכלת פסטל';
	@override String get pastelBlue => 'כחול פסטל';
	@override String get pastelPurple => 'סגול פסטל';
	@override String get pastelPink => 'ורוד פסטל';
}

// Path: editor.imageOptions
class _Translations$editor$imageOptions$he extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$he._(TranslationsHe root) : this._root = root, super.internal(root);

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
class _Translations$editor$selectionBar$he extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get delete => 'מחיקה';
	@override String get duplicate => 'שכפול';
}

// Path: editor.menu
class _Translations$editor$menu$he extends Translations$editor$menu$en {
	_Translations$editor$menu$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'ניקוי העמוד ${page}/${totalPages}';
	@override String get clearAllPages => 'ניקוי כל העמודים';
	@override String get insertPage => 'הוספת עמוד למטה';
	@override String get duplicatePage => 'שכפול עמוד';
	@override String get deletePage => 'מחיקת עמוד';
	@override String get lineHeight => 'גובה הקו';
	@override String get lineHeightDescription => 'משפיע גם על גודל הטקסט בפתקים שבהם הוקלד מלל';
	@override String get lineThickness => 'עובי קו';
	@override String get lineThicknessDescription => 'עובי קו רקע';
	@override String get backgroundImageFit => 'התאמת תמונת רקע';
	@override String get backgroundPattern => 'תבנית רקע';
	@override String get import => 'יבוא';
	@override String get watchServer => 'מעקב אחר עדכונים בשרת';
	@override String get watchServerReadOnly => 'העריכה מושתת בעת מעקב אחר השרת';
	@override late final _Translations$editor$menu$boxFits$he boxFits = _Translations$editor$menu$boxFits$he._(_root);
	@override late final _Translations$editor$menu$bgPatterns$he bgPatterns = _Translations$editor$menu$bgPatterns$he._(_root);
}

// Path: editor.readOnlyBanner
class _Translations$editor$readOnlyBanner$he extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'מצב צפייה בלבד';
	@override String get watchingServer => 'כרגע מתבצע מעקב אחר עדכונים בשרת. העריכה מושבתת במצב זה.';
	@override String get corrupted => 'טעינת הפתק נכשלה. ייתכן שהוא פגום או שהורדתו עדיין לא הסתיימה.';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$he extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הערה זו נערכה באמצעות גרסה חדשה יותר של Saber';
	@override String get subtitle => 'עריכת פתק זה עלולה לגרום לאיבוד מידע מסוים. להתעלם ולערוך בכל זאת?';
	@override String get allowEditing => 'אפשר עריכה';
}

// Path: editor.quill
class _Translations$editor$quill$he extends Translations$editor$quill$en {
	_Translations$editor$quill$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'אפשר להקליד כאן משהו...';
}

// Path: editor.hud
class _Translations$editor$hud$he extends Translations$editor$hud$en {
	_Translations$editor$hud$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'בטל נעילת זום';
	@override String get lockZoom => 'נעיל זום';
	@override String get unlockSingleFingerPan => 'הפיכת גלילה רציפה באצבע אחת לזמינה';
	@override String get lockSingleFingerPan => 'הפיכת גלילה רציפה באצבע אחת ללא זמינה';
	@override String get unlockAxisAlignedPan => 'ביטול נעילה של גלילה רציפה לאופקית או אנכית';
	@override String get lockAxisAlignedPan => 'נעילת גלילה רציפה לאופקית או אנכית';
}

// Path: sentry.consent.description
class _Translations$sentry$consent$description$he extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get question => 'האם ברצונך לדווח אוטומטית על שגיאות לא צפויות? זה יעזור לי לזהות ולתקן בעיות יותר מהר.';
	@override String get scope => 'הדיווחים עשויים להכיל מידע על השגיאה ועל מכשירך. עשיתי כל מאמץ על מנת לסנן החוצה נתונים אישיים, אבל ייתכן כי חלק יישארו בדיווח.';
	@override String get currentlyOff => 'אם הסכמתך תוענק, הדיווח על השגיאות יופעל בעת פתיחת היישום מחדש.';
	@override String get currentlyOn => 'אם הסכמתך תישלל, נא לפתוח מחדש את היישום בשביל להשבית את הדיווח על השגיאות.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'מידע נוסף ניתן למצוא ב'),
		link('מדיניות הפרטיות'),
		const TextSpan(text: '.'),
	]);
}

// Path: sentry.consent.answers
class _Translations$sentry$consent$answers$he extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get yes => 'כן';
	@override String get no => 'לא';
	@override String get later => 'ברצוני להישאל מאוחר יותר';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$he extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get shown => 'מונע החלפת מצב בשוגג';
	@override String get fixedOn => 'הציור עם האצבע זמין באופן קבוע';
	@override String get fixedOff => 'הציור עם האצבע מושבת באופן קבוע';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$he extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get active => 'פעיל';
	@override String get inactive => 'לא פעיל';
	@override String get activeUntilRestart => 'פעיל עד לפתיחת היישום מחדש';
	@override String get inactiveUntilRestart => 'לא פעיל עד לפתיחת היישום מחדש';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$he extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'נא לתת ל־Saber הרשאה לגשת לחשבון Nextcloud שלך';
	@override String get followPrompts => 'נא לעקוב אחר ההוראות הבאות בממשק של Nextcloud';
	@override String get browserDidntOpen => 'עמוד ההתחברות לא נפתח? נא ללחוץ כאן';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$he extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'מהי סיסמת הצפנה? מדוע להשתמש בשתי סיסמאות?';
	@override String get a => 'הסיסמה ל־Nextcloud משמשת לגישה לענן. סיסמת ההצפנה „מבלגנת” את הנתונים שלך ביישום לפני שהם מגיעים לענן.\nאפילו אם מישהו משיג גישה לחשבון ה־Nextcloud שלך, הפתקים שלך יישארו בטוחים ומוצפנים עם סיסמה נפרדת. דבר זה מעניק לך שכבת אבטחה שנייה להגנה על הנתונים שלך.\nללא סיסמת ההצפנה שלך, לאף אחד לא תהיה גישה לפתקים שלך בשרת, אך זה גם אומר שאם סיסמת ההצפנה שלך תישכח, לא תהיה לך יותר גישה לנתונים.';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$he extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'עדיין לא הגדרתי סיסמת הצפנה? היכן מקבלים אחת?';
	@override String get a => 'נא לבחור סיסמת הצפנה חדשה ולהקליד אותה למעלה.\n‏Saber ייצור את מפתחות ההצפנה שלך באופן אוטומטי מסיסמה זו.';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$he extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get q => 'האם אפשר להשתמש באותה סיסמה כמו לחשבון Nextcloud שלי?';
	@override String get a => 'כן, אך יש לקחת בחשבון שיהיה יותר קל למנהלי השרת או לאנשים אחרים לגשת לפתקים שלך אם הם משיגים גישה לחשבונך ב־Nextcloud.';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$he extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get fill => 'מתיחה';
	@override String get cover => 'כיסוי';
	@override String get contain => 'מכיל';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$he extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$he._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get none => 'ריק';
	@override String get college => 'שורות עם קו בצד שמאל';
	@override String get collegeRtl => 'שורות עם קו בצד ימין';
	@override String get lined => 'שורות';
	@override String get grid => 'משבצות';
	@override String get dots => 'נקודות';
	@override String get staffs => 'תווים';
	@override String get tablature => 'טבלטורה (מספורי תווים מוזיקליים)';
	@override String get cornell => 'קורנל';
}
