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
class TranslationsAr extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonAr common = _TranslationsCommonAr._(_root);
	@override late final _TranslationsHomeAr home = _TranslationsHomeAr._(_root);
	@override late final _TranslationsSettingsAr settings = _TranslationsSettingsAr._(_root);
	@override late final _TranslationsLogsAr logs = _TranslationsLogsAr._(_root);
	@override late final _TranslationsLoginAr login = _TranslationsLoginAr._(_root);
	@override late final _TranslationsProfileAr profile = _TranslationsProfileAr._(_root);
	@override late final _TranslationsAppInfoAr appInfo = _TranslationsAppInfoAr._(_root);
	@override late final _TranslationsUpdateAr update = _TranslationsUpdateAr._(_root);
	@override late final _TranslationsEditorAr editor = _TranslationsEditorAr._(_root);
}

// Path: common
class _TranslationsCommonAr extends TranslationsCommonEn {
	_TranslationsCommonAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get done => 'تم';
	@override String get continueBtn => 'متابعة';
	@override String get cancel => 'إلغاء';
}

// Path: home
class _TranslationsHomeAr extends TranslationsHomeEn {
	_TranslationsHomeAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsAr tabs = _TranslationsHomeTabsAr._(_root);
	@override late final _TranslationsHomeTitlesAr titles = _TranslationsHomeTitlesAr._(_root);
	@override late final _TranslationsHomeTooltipsAr tooltips = _TranslationsHomeTooltipsAr._(_root);
	@override late final _TranslationsHomeCreateAr create = _TranslationsHomeCreateAr._(_root);
	@override String get welcome => 'مرحباً بك في Saber';
	@override String get invalidFormat => ' صيغة الملف الذي اخترته ليست مدعومة, الرجاء اختيار ملف  sbn او sbn2 او sba او pdf ';
	@override String get noFiles => 'لم يتم العثور على ملفات';
	@override String get noPreviewAvailable => 'لا معاينة متاحة';
	@override String get createNewNote => 'اضغط على زر + لإنشاء ملاحظة جديدة';
	@override String get backFolder => 'الرجوع الى المجلد السابق';
	@override late final _TranslationsHomeNewFolderAr newFolder = _TranslationsHomeNewFolderAr._(_root);
	@override late final _TranslationsHomeRenameNoteAr renameNote = _TranslationsHomeRenameNoteAr._(_root);
	@override late final _TranslationsHomeMoveNoteAr moveNote = _TranslationsHomeMoveNoteAr._(_root);
	@override String get deleteNote => 'حذف الملاحظة';
	@override late final _TranslationsHomeRenameFolderAr renameFolder = _TranslationsHomeRenameFolderAr._(_root);
	@override late final _TranslationsHomeDeleteFolderAr deleteFolder = _TranslationsHomeDeleteFolderAr._(_root);
}

// Path: settings
class _TranslationsSettingsAr extends TranslationsSettingsEn {
	_TranslationsSettingsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesAr prefCategories = _TranslationsSettingsPrefCategoriesAr._(_root);
	@override late final _TranslationsSettingsPrefLabelsAr prefLabels = _TranslationsSettingsPrefLabelsAr._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsAr prefDescriptions = _TranslationsSettingsPrefDescriptionsAr._(_root);
	@override late final _TranslationsSettingsThemeModesAr themeModes = _TranslationsSettingsThemeModesAr._(_root);
	@override late final _TranslationsSettingsLayoutSizesAr layoutSizes = _TranslationsSettingsLayoutSizesAr._(_root);
	@override late final _TranslationsSettingsAccentColorPickerAr accentColorPicker = _TranslationsSettingsAccentColorPickerAr._(_root);
	@override String get systemLanguage => 'لغة النظام';
	@override List<String> get axisDirections => [
		'أعلى',
		'يمين',
		'أسفل',
		'يسار',
	];
	@override late final _TranslationsSettingsResetAr reset = _TranslationsSettingsResetAr._(_root);
	@override String get resyncEverything => 'إعادة مزامنة كل شيء';
	@override String get openDataDir => 'Saber فتح مجلد';
	@override late final _TranslationsSettingsCustomDataDirAr customDataDir = _TranslationsSettingsCustomDataDirAr._(_root);
}

// Path: logs
class _TranslationsLogsAr extends TranslationsLogsEn {
	_TranslationsLogsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get logs => 'السجلات';
	@override String get viewLogs => 'عرض السجلات';
	@override String get debuggingInfo => 'تحتوي السجلات على معلومات مفيدة لتصحيح الأخطاء والتطوير';
	@override String get noLogs => 'لا يوجد سجلات هنا!';
	@override String get logsAreTemporary => 'يتم الاحتفاظ بالسجلات فقط حتى تقوم بإغلاق التطبيق';
}

// Path: login
class _TranslationsLoginAr extends TranslationsLoginEn {
	_TranslationsLoginAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'تسجيل الدخول';
	@override late final _TranslationsLoginFormAr form = _TranslationsLoginFormAr._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'لا تملك حسابا حتى الآن؟ '),
		linkToSignup('سجل حساباً الأن'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'ليس أنت؟ '),
		undoLogin('اختيار حساب آخر'),
		const TextSpan(text: '.'),
	]);
	@override late final _TranslationsLoginStatusAr status = _TranslationsLoginStatusAr._(_root);
	@override late final _TranslationsLoginNcLoginStepAr ncLoginStep = _TranslationsLoginNcLoginStepAr._(_root);
	@override late final _TranslationsLoginEncLoginStepAr encLoginStep = _TranslationsLoginEncLoginStepAr._(_root);
}

// Path: profile
class _TranslationsProfileAr extends TranslationsProfileEn {
	_TranslationsProfileAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'ملفي الشخصي';
	@override String get logout => 'تسجيل الخروج';
	@override String quotaUsage({required Object total, required Object percent, required Object used}) => ' ${total} (${percent}%) من ${used} أنت تستخدم ';
	@override String get connectedTo => 'متصل بـ';
	@override late final _TranslationsProfileQuickLinksAr quickLinks = _TranslationsProfileQuickLinksAr._(_root);
	@override String get faqTitle => 'الأسئلة الشائعة';
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$Ar._(_root),
		_TranslationsProfile$faq$0i1$Ar._(_root),
		_TranslationsProfile$faq$0i2$Ar._(_root),
		_TranslationsProfile$faq$0i3$Ar._(_root),
	];
}

// Path: appInfo
class _TranslationsAppInfoAr extends TranslationsAppInfoEn {
	_TranslationsAppInfoAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber حقوق نشر © 2022-${buildYear}  Adil Hanney\nهذا البرنامج لا يأتي مع أي ضمان على الإطلاق. هذا برنامج مجاني، ونرحب بإعادة توزيعه في ظل ظروف معينة.';
	@override String get dirty => 'قذر';
	@override String get debug => 'تصحيح أخطاء';
	@override String get sponsorButton => 'انقر هنا لتدعمني أو شراء المزيد من مساحة التخزين';
	@override String get licenseButton => 'انقر هنا لعرض المزيد من معلومات الترخيص';
	@override String get privacyPolicyButton => 'انقر هنا لعرض سياسة الخصوصية';
}

// Path: update
class _TranslationsUpdateAr extends TranslationsUpdateEn {
	_TranslationsUpdateAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'تحديث متاح';
	@override String get updateAvailableDescription => 'يتوفر إصدار جديد من التطبيق مع هذه التغييرات:';
	@override String get update => 'تحديث';
	@override String get downloadNotAvailableYet => 'التنزيل غير متاح بعد لمنصتك. يرجى التحقق قريبًا.';
}

// Path: editor
class _TranslationsEditorAr extends TranslationsEditorEn {
	_TranslationsEditorAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarAr toolbar = _TranslationsEditorToolbarAr._(_root);
	@override late final _TranslationsEditorPensAr pens = _TranslationsEditorPensAr._(_root);
	@override late final _TranslationsEditorPenOptionsAr penOptions = _TranslationsEditorPenOptionsAr._(_root);
	@override late final _TranslationsEditorColorsAr colors = _TranslationsEditorColorsAr._(_root);
	@override late final _TranslationsEditorImageOptionsAr imageOptions = _TranslationsEditorImageOptionsAr._(_root);
	@override late final _TranslationsEditorSelectionBarAr selectionBar = _TranslationsEditorSelectionBarAr._(_root);
	@override late final _TranslationsEditorMenuAr menu = _TranslationsEditorMenuAr._(_root);
	@override late final _TranslationsEditorNewerFileFormatAr newerFileFormat = _TranslationsEditorNewerFileFormatAr._(_root);
	@override late final _TranslationsEditorQuillAr quill = _TranslationsEditorQuillAr._(_root);
	@override late final _TranslationsEditorHudAr hud = _TranslationsEditorHudAr._(_root);
	@override String get pages => 'صفحات';
	@override String get untitled => 'بدون عنوان';
	@override String get needsToSaveBeforeExiting => 'حفظ التغييرات... يمكنك الخروج بأمان من المحرر عند الانتهاء';
}

// Path: home.tabs
class _TranslationsHomeTabsAr extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get home => 'الرئيسية';
	@override String get browse => 'تصفح';
	@override String get whiteboard => 'السبورة';
	@override String get settings => 'الإعدادات';
}

// Path: home.titles
class _TranslationsHomeTitlesAr extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get home => 'الملاحظات الأخيرة';
	@override String get browse => 'تصفح';
	@override String get whiteboard => 'السبورة';
	@override String get settings => 'الإعدادات';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsAr extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'محلاظة جديدة';
	@override String get showUpdateDialog => 'إظهار مربع حوار التحديث';
	@override String get exportNote => 'تصدير ملاحظة';
}

// Path: home.create
class _TranslationsHomeCreateAr extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'انشاء ملاحظة جديدة';
	@override String get importNote => 'استيراد ملاحظة';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderAr extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'مجلد جديد';
	@override String get folderName => 'إسم المجلد';
	@override String get create => 'إنشاء';
	@override String get folderNameEmpty => 'لا يمكن أن يكون اسم المجلد فارغًا';
	@override String get folderNameContainsSlash => 'لا يمكن أن يحتوي اسم المجلد على شرطة مائلة';
	@override String get folderNameExists => 'المجلد موجود بالفعل';
}

// Path: home.renameNote
class _TranslationsHomeRenameNoteAr extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'إعادة تسمية الملاحظة';
	@override String get noteName => 'اسم الملاحظة';
	@override String get rename => 'إعادة تسمية';
	@override String get noteNameEmpty => 'لا يمكن أن يكون اسم الملاحظة فارغًا';
	@override String get noteNameContainsSlash => 'لا يمكن أن يحتوي اسم الملاحظة على شرطة مائلة';
	@override String get noteNameExists => 'توجد بالفعل ملاحظة بهذا الاسم';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteAr extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'تحريك الملاحظة';
	@override String moveNotes({required Object n}) => 'ملاحظات ${n} نقل';
	@override String moveName({required Object f}) => '${f} نقل';
	@override String get move => 'تحريك';
	@override String renamedTo({required Object newName}) => 'ستتم إعادة تسمية الملاحظة إلى ${newName}';
	@override String get multipleRenamedTo => 'الملاحظات التالية سيتم اعادة تسميتها:';
	@override String numberRenamedTo({required Object n}) => 'ملاحظة سيتم اعادة تسميتها لتجنب تضارب تشابه الاسماء ${n}';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderAr extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'اعادة تسمية المجلد';
	@override String get folderName => 'اسم المجلد';
	@override String get rename => 'اعادة تسمية';
	@override String get folderNameEmpty => 'لا يمكن أن يكون اسم المجلد فارغًا';
	@override String get folderNameContainsSlash => 'لا يمكن أن يحتوي اسم المجلد على شرطة مائلة';
	@override String get folderNameExists => 'يوجد بالفعل مجلد بهذا الاسم';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderAr extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'حذف المجلد';
	@override String deleteName({required Object f}) => '${f} حذف';
	@override String get delete => 'حذف';
	@override String get alsoDeleteContents => 'حذف جميع الملاحظات داخل هذا المجلد أيضًا';
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesAr extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get general => 'عام';
	@override String get writing => 'كتابة';
	@override String get editor => 'المحرر';
	@override String get performance => 'الأداء';
	@override String get advanced => 'متقدم';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsAr extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get locale => 'لغة التطبيق';
	@override String get appTheme => 'مظهر التطبيق';
	@override String get platform => 'نوع المظهر';
	@override String get layoutSize => 'نوع التخطيط';
	@override String get customAccentColor => 'لون التمييز المخصص';
	@override String get hyperlegibleFont => 'Hyperlegible خط';
	@override String get shouldCheckForUpdates => 'تحقق تلقائيًا من وجود تحديثات Saber';
	@override String get shouldAlwaysAlertForUpdates => 'تحديثات أسرع';
	@override String get allowInsecureConnections => 'السماح بالاتصالات غير الآمنة';
	@override String get editorToolbarAlignment => 'محاذاة شريط أدوات المحرر';
	@override String get editorToolbarShowInFullscreen => 'أظهر شريط أدوات المحرر في وضع ملء الشاشة';
	@override String get editorAutoInvert => 'اقلب الملاحظات في الوضع المظلم';
	@override String get preferGreyscale => 'تفضيل الألوان الرمادية';
	@override String get maxImageSize => 'الحجم الأقصى للصورة';
	@override String get autoClearWhiteboardOnExit => 'امسح السبورة بعد الخروج من التطبيق';
	@override String get disableEraserAfterUse => 'تعطيل الممحاة تلقائيًا بعد الاستخدام';
	@override String get hideFingerDrawingToggle => 'إخفاء زر الرسم بالإصبع';
	@override String get editorPromptRename => 'مطالبتك بإعادة تسمية الملاحظات الجديدة';
	@override String get hideHomeBackgrounds => 'إخفاء الخلفيات على الشاشة الرئيسية';
	@override String get recentColorsDontSavePresets => 'لا تحفظ الألوان المعينة مسبقًا كألوان حديثة';
	@override String get recentColorsLength => 'كم عدد الألوان الحديثة التي يجب تخزينها';
	@override String get printPageIndicators => 'طباعة مؤشرات الصفحة';
	@override String get autosaveDelay => 'تأخير الحفظ التلقائي';
	@override String get shapeRecognitionDelay => 'تأخير التعرف على الأشكال';
	@override String get autoStraightenLines => 'استقامة الخطوط تلقائيًا';
	@override String get simplifiedHomeLayout => 'تخطيط الصفحة الرئيسية المبسط';
	@override String get customDataDir => 'مخصص Saber مجلد';
	@override String get pencilSoundSetting => 'تأثير صوت القلم';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsAr extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'يزيد Atkinson Hyperlegible من وضوح الرؤية للقراء الذين يعانون من ضعف في الرؤية';
	@override String get allowInsecureConnections => '(غير موصى به) بالاتصال بالخوادم بشهادات غير موثوقة/موقعة ذاتيًا Saber السماح لـ';
	@override String get preferGreyscale => 'لشاشات الحبر الإلكتروني';
	@override String get autoClearWhiteboardOnExit => 'ستظل متزامنة مع أجهزتك الأخرى';
	@override String get disableEraserAfterUse => 'التبديل تلقائيًا إلى القلم بعد استخدام الممحاة';
	@override String get maxImageSize => 'سيتم ضغط الصور الأكبر من هذا';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingAr hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingAr._(_root);
	@override String get editorPromptRename => 'يمكنك دائمًا إعادة تسمية الملاحظات لاحقًا';
	@override String get hideHomeBackgrounds => 'للحصول على مظهر أنظف';
	@override String get printPageIndicators => 'تظهر مؤشرات الصفحة في الصادرات';
	@override String get autosaveDelay => 'الوقت الذي يجب الانتظار قبل الحفظ التلقائي للملاحظة';
	@override String get shapeRecognitionDelay => 'عدد مرات تحديث معاينة الشكل';
	@override String get autoStraightenLines => 'استقامة الخطوط الطويلة بدون الحاجة لاستخدام قلم الشكل';
	@override String get simplifiedHomeLayout => 'تعيين ارتفاع ثابت لكل معاينة ملاحظة';
	@override String get shouldAlwaysAlertForUpdates => 'أبلغني عن التحديثات بمجرد توفرها';
	@override late final _TranslationsSettingsPrefDescriptionsPencilSoundSettingAr pencilSoundSetting = _TranslationsSettingsPrefDescriptionsPencilSoundSettingAr._(_root);
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesAr extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get system => 'النظام';
	@override String get light => 'ساطع';
	@override String get dark => 'داكن';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesAr extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get auto => 'آلي';
	@override String get phone => 'هاتف';
	@override String get tablet => 'لوحي';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerAr extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'اختر لوناً';
}

// Path: settings.reset
class _TranslationsSettingsResetAr extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'إعادة تعيين هذا الإعداد؟';
	@override String get button => 'إعادة تعيين';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirAr extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'إلغاء';
	@override String get select => 'تحديد';
	@override String get mustBeEmpty => 'يجب أن يكون المجلد المحدد فارغًا';
	@override String get mustBeDoneSyncing => 'تأكد من اكتمال المزامنة قبل تغيير المجلد';
}

// Path: login.form
class _TranslationsLoginFormAr extends TranslationsLoginFormEn {
	_TranslationsLoginFormAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'بتسجيل الدخول، فإنك توافق على '),
		linkToPrivacyPolicy('سياسة الخصوصية'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusAr extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'تسجيل الخروج';
	@override String get tapToLogin => 'انقر لتسجيل الدخول باستخدام Nextcloud';
	@override String hi({required Object u}) => '!${u}،مرحبًا';
	@override String get almostDone => 'على وشك الانتهاء من المزامنة، اضغط لإنهاء تسجيل الدخول';
	@override String get loggedIn => 'تم تسجيل الدخول باستخدام Nextcloud';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepAr extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'اختر المكان الذي تريد تخزين بياناتك فيه:';
	@override String get saberNcServer => 'Nextcloud الى Saber خادم';
	@override String get otherNcServer => 'اخر Nextcloud خادم';
	@override String get serverUrl => 'عنوان الخادم';
	@override String get loginWithSaber => 'Saber تسجيل الدخول باستخدام';
	@override String get loginWithNextcloud => 'Nextcloud تسجيل الدخول باستخدام';
	@override late final _TranslationsLoginNcLoginStepLoginFlowAr loginFlow = _TranslationsLoginNcLoginStepLoginFlowAr._(_root);
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepAr extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'لحماية بياناتك، يرجى إدخال كلمة مرور التشفير:';
	@override String get newToSaber => '؟ فقط أدخل كلمة مرور تشفير جديدةSaber جديد على';
	@override String get encPassword => 'كلمة مرور التشفير';
	@override String get encFaqTitle => 'الأسئلة الشائعة';
	@override String get wrongEncPassword => 'فشل فك التشفير باستخدام كلمة المرور المقدمة. يرجى المحاولة مرة أخرى.';
	@override String get connectionFailed => 'حدث خطأ ما أثناء الاتصال بالخادم. يرجى المحاولة لاحقًا.';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$Ar._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$Ar._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$Ar._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksAr extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'الصفحة الرئيسية للخادم';
	@override String get deleteAccount => 'حذف الحساب';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$Ar extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$Ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'هل سأفقد ملاحظاتي إذا قمت بتسجيل الخروج؟';
	@override String get a => 'لا. ستظل ملاحظاتك على كل من جهازك وعلى الخادم. لن تتم مزامنتها مع الخادم حتى تقوم بتسجيل الدخول مرة أخرى. تأكد من اكتمال المزامنة قبل تسجيل الخروج حتى لا تفقد أي بيانات (انظر تقدم المزامنة على الشاشة الرئيسية).';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$Ar extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$Ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'كيف يمكنني تغيير كلمة المرور الخاصة بي على Nextcloud؟';
	@override String get a => 'انتقل إلى موقع الخادم الخاص بك وقم بتسجيل الدخول. ثم انتقل إلى الإعدادات > الأمان > تغيير كلمة المرور. ستحتاج إلى تسجيل الخروج وتسجيل الدخول مرة أخرى إلى Saber بعد تغيير كلمة المرور الخاصة بك.';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$Ar extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$Ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'كيف يمكنني تغيير كلمة مرور التشفير الخاصة بي؟';
	@override String get a => '1. تسجيل الخروج من Saber. تأكد من اكتمال المزامنة قبل تسجيل الخروج حتى لا تفقد أي بيانات (انظر تقدم المزامنة على الشاشة الرئيسية).\n2. اذهب إلى موقع الخادم الخاص بك واحذف مجلد "Saber" الخاص بك. سيؤدي هذا إلى حذف كافة ملاحظاتك من الخادم.\n3. قم بتسجيل الدخول مرة أخرى إلى Saber. يمكنك اختيار كلمة مرور تشفير جديدة عند تسجيل الدخول.\n4. لا تنس تسجيل الخروج وتسجيل الدخول مرة أخرى إلى Saber على أجهزتك الأخرى أيضًا.';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$Ar extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$Ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'كيف يمكنني حذف حسابي؟';
	@override String get a => 'انتقل إلى موقع الخادم الخاص بك وقم بتسجيل الدخول. ثم انتقل إلى الإعدادات> حذف الحساب.\nإذا كنت تستخدم خادم Saber الرسمي، فسيتم حذف حسابك بعد فترة سماح مدتها أسبوع. يمكنك الاتصال بي على adilhanney@disroot.org خلال هذه الفترة لإلغاء الحذف.\nإذا كنت تستخدم خادم جهة خارجية، فقد لا يكون هناك خيار لحذف حسابك: ستحتاج إلى استشارة خصوصية الخادم سياسة لمزيد من المعلومات.';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarAr extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

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
class _TranslationsEditorPensAr extends TranslationsEditorPensEn {
	_TranslationsEditorPensAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'قلم حبر';
	@override String get ballpointPen => 'قلم برأس كروي';
	@override String get highlighter => 'هايلايتر';
	@override String get pencil => 'قلم رصاص';
	@override String get shapePen => 'قلم الأشكال';
	@override String get laserPointer => 'مؤشر الليزر';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsAr extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get size => 'حجم';
}

// Path: editor.colors
class _TranslationsEditorColorsAr extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'أداة انتقاء اللون';
	@override String customBrightnessHue({required Object h, required Object b}) => '${h} ${b}  مخصص';
	@override String customHue({required Object h}) => '${h} مخصص';
	@override String get dark => 'داكن';
	@override String get light => 'فاتح';
	@override String get black => 'أسود';
	@override String get darkGrey => 'الرمادي الداكن';
	@override String get grey => 'رمادي';
	@override String get lightGrey => 'رمادي فاتح';
	@override String get white => 'أبيض';
	@override String get red => 'أحمر';
	@override String get green => 'أخضر';
	@override String get cyan => 'سماوي';
	@override String get blue => 'أزرق';
	@override String get yellow => 'أصفر';
	@override String get purple => 'أرجواني';
	@override String get pink => 'وردي';
	@override String get orange => 'برتقالي';
	@override String get pastelRed => 'باستيل أحمر';
	@override String get pastelOrange => 'برتقال باستيل';
	@override String get pastelYellow => 'باستيل أصفر';
	@override String get pastelGreen => 'الباستيل الأخضر';
	@override String get pastelCyan => 'باستيل سماوي';
	@override String get pastelBlue => 'الباستيل الأزرق';
	@override String get pastelPurple => 'الباستيل الأرجواني';
	@override String get pastelPink => 'الباستيل الوردي';
}

// Path: editor.imageOptions
class _TranslationsEditorImageOptionsAr extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'خيارات الصورة';
	@override String get invertible => 'قابل للعكس';
	@override String get download => 'تحميل';
	@override String get setAsBackground => 'تعيين كخلفية';
	@override String get removeAsBackground => 'إزالة كخلفية';
	@override String get delete => 'حذف';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarAr extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get delete => 'حذف';
	@override String get duplicate => 'تكرار';
}

// Path: editor.menu
class _TranslationsEditorMenuAr extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'تنظيف الصفحة ${page}/${totalPages}';
	@override String get clearAllPages => 'امسح كل الصفحات';
	@override String get insertPage => 'أدخل الصفحة أدناه';
	@override String get duplicatePage => 'تكرار الصفحة';
	@override String get deletePage => 'حذف الصفحة';
	@override String get lineHeight => 'ارتفاع خط';
	@override String get lineHeightDescription => 'يتحكم أيضًا في حجم النص للملاحظات المكتوبة';
	@override String get backgroundImageFit => 'تناسب صورة الخلفية';
	@override String get backgroundPattern => 'نمط الخلفية';
	@override String get import => 'يستورد';
	@override String get watchServer => 'راقب التحديثات على الخادم';
	@override String get watchServerReadOnly => 'تم تعطيل التحرير أثناء مراقبة الخادم';
	@override late final _TranslationsEditorMenuBoxFitsAr boxFits = _TranslationsEditorMenuBoxFitsAr._(_root);
	@override late final _TranslationsEditorMenuBgPatternsAr bgPatterns = _TranslationsEditorMenuBgPatternsAr._(_root);
	@override String get lineThickness => 'سمك الخط';
	@override String get lineThicknessDescription => 'سماكة خط الخلفية';
}

// Path: editor.newerFileFormat
class _TranslationsEditorNewerFileFormatAr extends TranslationsEditorNewerFileFormatEn {
	_TranslationsEditorNewerFileFormatAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'وضع القراءة فقط';
	@override String get title => 'تم تحرير هذه الملاحظة باستخدام إصدار أحدث من Saber';
	@override String get subtitle => 'قد يؤدي تحرير هذه الملاحظة إلى ضياع بعض المعلومات. هل تريد تجاهل هذا وتعديله على أي حال؟';
	@override String get allowEditing => 'السماح بالتعديل';
}

// Path: editor.quill
class _TranslationsEditorQuillAr extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'اكتب شيئًا هنا...';
}

// Path: editor.hud
class _TranslationsEditorHudAr extends TranslationsEditorHudEn {
	_TranslationsEditorHudAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'إلغاء قفل التكبير';
	@override String get lockZoom => 'قفل التكبير';
	@override String get unlockSingleFingerPan => 'تمكين التحريك بإصبع واحد';
	@override String get lockSingleFingerPan => 'تعطيل التحريك بإصبع واحد';
	@override String get unlockAxisAlignedPan => 'إلغاء قفل التحريك إلى أفقي أو عمودي';
	@override String get lockAxisAlignedPan => 'قفل التحريك إلى أفقي أو رأسي';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingAr extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get shown => 'يمنع التبديل العرضي';
	@override String get fixedOn => 'تم تفعيل الرسم بالإصبع';
	@override String get fixedOff => 'تم تعطيل الرسم بالإصبع';
}

// Path: settings.prefDescriptions.pencilSoundSetting
class _TranslationsSettingsPrefDescriptionsPencilSoundSettingAr extends TranslationsSettingsPrefDescriptionsPencilSoundSettingEn {
	_TranslationsSettingsPrefDescriptionsPencilSoundSettingAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get off => 'بدون صوت';
	@override String get onButNotInSilentMode => 'مفعل (ما لم يكن في وضع الصامت)';
	@override String get onAlways => 'مفعل (حتى في وضع الصامت)';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowAr extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'الخاص بك Nextcloud للوصول إلى حساب Saber الرجاء تفويض';
	@override String get followPrompts => 'Nextcloud الرجاء اتباع الإرشادات في واجهة';
	@override String get browserDidntOpen => 'لم تفتح صفحة تسجيل الدخول؟ اضغط هنا';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$Ar extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$Ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'ما هي كلمة مرور التشفير؟ لماذا استخدام كلمتي مرور؟';
	@override String get a => 'تُستخدم للوصول إلى السحابة. بينما كلمة مرور التشفير "تشفر" بياناتك قبل وصولها إلى السحابة  Nextcloud كلمة مرور .\nالخاص بك، ستظل ملاحظاتك آمنة ومشفرة بكلمة مرور منفصلة. هذا يوفر لك طبقة ثانية من الأمان لحماية بياناتك Nextcloud حتى إذا تمكن شخص ما من الوصول إلى حساب .\nلا يمكن لأحد الوصول إلى ملاحظاتك على الخادم بدون كلمة مرور التشفير الخاصة بك، ولكن هذا يعني أيضًا أنه إذا نسيت كلمة مرور التشفير، ستفقد الوصول إلى بياناتك.';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$Ar extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$Ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'لم أقم بتعيين كلمة مرور تشفير حتى الآن. من أين أحصل عليها؟';
	@override String get a => 'اختر كلمة مرور تشفير جديدة وأدخلها أعلاه.\nبإنشاء مفاتيح التشفير الخاصة بك تلقائيًا من هذه الكلمة Saber سيقوم .';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$Ar extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$Ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'الخاص بي؟ Nextcloud هل يمكنني استخدام نفس كلمة المرور لحساب';
	@override String get a => 'الخاص بك Nextcloud نعم، ولكن ضع في اعتبارك أنه سيكون من الأسهل على مدير الخادم أو أي شخص آخر الوصول إلى ملاحظاتك إذا تمكن من الوصول إلى حساب.';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsAr extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get fill => 'تمتد';
	@override String get cover => 'غطاء';
	@override String get contain => 'يحتوي';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsAr extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get none => 'فارغ';
	@override String get college => 'كلية تحكم';
	@override String get collegeRtl => 'محكوم الكلية (عكسي)';
	@override String get lined => 'مبطن';
	@override String get grid => 'شبكة';
	@override String get dots => 'نقاط';
	@override String get staffs => 'موظفون';
	@override String get tablature => 'لوحة';
	@override String get cornell => 'كورنيل';
}
