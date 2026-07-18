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
class TranslationsAr extends Translations with BaseTranslations<AppLocale, Translations> {
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
	@override late final _Translations$common$ar common = _Translations$common$ar._(_root);
	@override late final _Translations$home$ar home = _Translations$home$ar._(_root);
	@override late final _Translations$sentry$ar sentry = _Translations$sentry$ar._(_root);
	@override late final _Translations$settings$ar settings = _Translations$settings$ar._(_root);
	@override late final _Translations$logs$ar logs = _Translations$logs$ar._(_root);
	@override late final _Translations$login$ar login = _Translations$login$ar._(_root);
	@override late final _Translations$profile$ar profile = _Translations$profile$ar._(_root);
	@override late final _Translations$appInfo$ar appInfo = _Translations$appInfo$ar._(_root);
	@override late final _Translations$update$ar update = _Translations$update$ar._(_root);
	@override late final _Translations$editor$ar editor = _Translations$editor$ar._(_root);
}

// Path: common
class _Translations$common$ar extends Translations$common$en {
	_Translations$common$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get done => 'تم';
	@override String get continueBtn => 'متابعة';
	@override String get cancel => 'إلغاء';
}

// Path: home
class _Translations$home$ar extends Translations$home$en {
	_Translations$home$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$ar tabs = _Translations$home$tabs$ar._(_root);
	@override late final _Translations$home$titles$ar titles = _Translations$home$titles$ar._(_root);
	@override late final _Translations$home$tooltips$ar tooltips = _Translations$home$tooltips$ar._(_root);
	@override late final _Translations$home$create$ar create = _Translations$home$create$ar._(_root);
	@override String get welcome => 'مرحباً بك في Saber';
	@override String get invalidFormat => 'صيغة الملف الذي اخترته ليست مدعومة, الرجاء اختيار ملف  sbn او sbn2 او sba او pdf';
	@override String get noFiles => 'لم يتم العثور على ملفات';
	@override String get createNewNote => 'اضغط على زر + لإنشاء ملاحظة جديدة';
	@override String get backFolder => 'الرجوع الى المجلد السابق';
	@override late final _Translations$home$newFolder$ar newFolder = _Translations$home$newFolder$ar._(_root);
	@override late final _Translations$home$renameNote$ar renameNote = _Translations$home$renameNote$ar._(_root);
	@override late final _Translations$home$moveNote$ar moveNote = _Translations$home$moveNote$ar._(_root);
	@override String get deleteNote => 'حذف الملاحظة';
	@override late final _Translations$home$deleteNoteDialog$ar deleteNoteDialog = _Translations$home$deleteNoteDialog$ar._(_root);
	@override late final _Translations$home$renameFolder$ar renameFolder = _Translations$home$renameFolder$ar._(_root);
	@override late final _Translations$home$deleteFolder$ar deleteFolder = _Translations$home$deleteFolder$ar._(_root);
	@override String get noPreviewAvailable => 'لا معاينة متاحة';
}

// Path: sentry
class _Translations$sentry$ar extends Translations$sentry$en {
	_Translations$sentry$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$ar consent = _Translations$sentry$consent$ar._(_root);
}

// Path: settings
class _Translations$settings$ar extends Translations$settings$en {
	_Translations$settings$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$ar prefCategories = _Translations$settings$prefCategories$ar._(_root);
	@override late final _Translations$settings$prefLabels$ar prefLabels = _Translations$settings$prefLabels$ar._(_root);
	@override late final _Translations$settings$prefDescriptions$ar prefDescriptions = _Translations$settings$prefDescriptions$ar._(_root);
	@override late final _Translations$settings$themeModes$ar themeModes = _Translations$settings$themeModes$ar._(_root);
	@override late final _Translations$settings$layoutSizes$ar layoutSizes = _Translations$settings$layoutSizes$ar._(_root);
	@override late final _Translations$settings$accentColorPicker$ar accentColorPicker = _Translations$settings$accentColorPicker$ar._(_root);
	@override String get systemLanguage => 'لغة النظام';
	@override List<String> get axisDirections => [
		'أعلى',
		'يمين',
		'أسفل',
		'يسار',
	];
	@override late final _Translations$settings$reset$ar reset = _Translations$settings$reset$ar._(_root);
	@override String get resyncEverything => 'إعادة مزامنة كل شيء';
	@override String get openDataDir => 'Saber فتح مجلد';
	@override late final _Translations$settings$customDataDir$ar customDataDir = _Translations$settings$customDataDir$ar._(_root);
	@override String get autosaveDisabled => 'أبداً';
	@override String get shapeRecognitionDisabled => 'أبداً';
}

// Path: logs
class _Translations$logs$ar extends Translations$logs$en {
	_Translations$logs$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get useTheApp => 'ستظهر السجلات هنا أثناء استخدام التطبيق';
	@override String get logs => 'السجلات';
	@override String get viewLogs => 'عرض السجلات';
	@override String get debuggingInfo => 'تحتوي السجلات على معلومات مفيدة لتصحيح الأخطاء والتطوير';
	@override String get noLogs => 'لا يوجد سجلات هنا!';
}

// Path: login
class _Translations$login$ar extends Translations$login$en {
	_Translations$login$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'تسجيل الدخول';
	@override late final _Translations$login$form$ar form = _Translations$login$form$ar._(_root);
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
	@override late final _Translations$login$status$ar status = _Translations$login$status$ar._(_root);
	@override late final _Translations$login$ncLoginStep$ar ncLoginStep = _Translations$login$ncLoginStep$ar._(_root);
	@override late final _Translations$login$encLoginStep$ar encLoginStep = _Translations$login$encLoginStep$ar._(_root);
}

// Path: profile
class _Translations$profile$ar extends Translations$profile$en {
	_Translations$profile$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'ملفي الشخصي';
	@override String get logout => 'تسجيل الخروج';
	@override String quotaUsage({required Object total, required Object percent, required Object used}) => '${total} (${percent}%) من ${used} أنت تستخدم';
	@override String get connectedTo => 'متصل بـ';
	@override late final _Translations$profile$quickLinks$ar quickLinks = _Translations$profile$quickLinks$ar._(_root);
	@override String get faqTitle => 'الأسئلة الشائعة';
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$ar._(_root),
		_Translations$profile$faq$1$ar._(_root),
		_Translations$profile$faq$2$ar._(_root),
		_Translations$profile$faq$3$ar._(_root),
	];
}

// Path: appInfo
class _Translations$appInfo$ar extends Translations$appInfo$en {
	_Translations$appInfo$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber حقوق نشر © 2022-${buildYear}  Adil Hanney\nهذا البرنامج لا يأتي مع أي ضمان على الإطلاق. هذا برنامج مجاني، ونرحب بإعادة توزيعه في ظل ظروف معينة.';
	@override String get debug => 'تصحيح أخطاء';
	@override String get sponsorButton => 'انقر هنا لتدعمني أو شراء المزيد من مساحة التخزين';
	@override String get licenseButton => 'انقر هنا لعرض المزيد من معلومات الترخيص';
	@override String get privacyPolicyButton => 'انقر هنا لعرض سياسة الخصوصية';
}

// Path: update
class _Translations$update$ar extends Translations$update$en {
	_Translations$update$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'تحديث متاح';
	@override String get updateAvailableDescription => 'يتوفر إصدار جديد من التطبيق مع هذه التغييرات:';
	@override String get update => 'تحديث';
	@override String get downloadNotAvailableYet => 'التنزيل غير متاح بعد لمنصتك. يرجى التحقق قريبًا.';
}

// Path: editor
class _Translations$editor$ar extends Translations$editor$en {
	_Translations$editor$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$ar toolbar = _Translations$editor$toolbar$ar._(_root);
	@override late final _Translations$editor$pens$ar pens = _Translations$editor$pens$ar._(_root);
	@override late final _Translations$editor$penOptions$ar penOptions = _Translations$editor$penOptions$ar._(_root);
	@override late final _Translations$editor$colors$ar colors = _Translations$editor$colors$ar._(_root);
	@override late final _Translations$editor$imageOptions$ar imageOptions = _Translations$editor$imageOptions$ar._(_root);
	@override late final _Translations$editor$selectionBar$ar selectionBar = _Translations$editor$selectionBar$ar._(_root);
	@override late final _Translations$editor$menu$ar menu = _Translations$editor$menu$ar._(_root);
	@override late final _Translations$editor$readOnlyBanner$ar readOnlyBanner = _Translations$editor$readOnlyBanner$ar._(_root);
	@override late final _Translations$editor$versionTooNew$ar versionTooNew = _Translations$editor$versionTooNew$ar._(_root);
	@override late final _Translations$editor$quill$ar quill = _Translations$editor$quill$ar._(_root);
	@override late final _Translations$editor$hud$ar hud = _Translations$editor$hud$ar._(_root);
	@override String get pages => 'صفحات';
	@override String get untitled => 'بدون عنوان';
	@override String get needsToSaveBeforeExiting => 'حفظ التغييرات... يمكنك الخروج بأمان من المحرر عند الانتهاء';
}

// Path: home.tabs
class _Translations$home$tabs$ar extends Translations$home$tabs$en {
	_Translations$home$tabs$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get home => 'الرئيسية';
	@override String get browse => 'تصفح';
	@override String get whiteboard => 'السبورة';
	@override String get settings => 'الإعدادات';
}

// Path: home.titles
class _Translations$home$titles$ar extends Translations$home$titles$en {
	_Translations$home$titles$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get home => 'الملاحظات الأخيرة';
	@override String get browse => 'تصفح';
	@override String get whiteboard => 'السبورة';
	@override String get settings => 'الإعدادات';
}

// Path: home.tooltips
class _Translations$home$tooltips$ar extends Translations$home$tooltips$en {
	_Translations$home$tooltips$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'محلاظة جديدة';
	@override String get showUpdateDialog => 'إظهار مربع حوار التحديث';
	@override String get exportNote => 'تصدير ملاحظة';
}

// Path: home.create
class _Translations$home$create$ar extends Translations$home$create$en {
	_Translations$home$create$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'انشاء ملاحظة جديدة';
	@override String get importNote => 'استيراد ملاحظة';
}

// Path: home.newFolder
class _Translations$home$newFolder$ar extends Translations$home$newFolder$en {
	_Translations$home$newFolder$ar._(TranslationsAr root) : this._root = root, super.internal(root);

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
class _Translations$home$renameNote$ar extends Translations$home$renameNote$en {
	_Translations$home$renameNote$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'إعادة تسمية الملاحظة';
	@override String get noteName => 'اسم الملاحظة';
	@override String get rename => 'إعادة تسمية';
	@override String get noteNameEmpty => 'لا يمكن أن يكون اسم الملاحظة فارغًا';
	@override String get noteNameExists => 'توجد بالفعل ملاحظة بهذا الاسم';
	@override String get noteNameForbiddenCharacters => 'يحتوي اسم الملاحظة على أحرف محظورة';
	@override String get noteNameReserved => 'اسم الملاحظة محجوز';
}

// Path: home.moveNote
class _Translations$home$moveNote$ar extends Translations$home$moveNote$en {
	_Translations$home$moveNote$ar._(TranslationsAr root) : this._root = root, super.internal(root);

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

// Path: home.deleteNoteDialog
class _Translations$home$deleteNoteDialog$ar extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ar'))(n,
		one: 'حذف الملاحظة المحددة بشكل دائم؟',
		other: 'حذف الملاحظات المحددة بشكل دائم؟',
	);
	@override String deleteNotes({required Object n}) => 'احذف ${n} ملاحظة';
	@override String deleteName({required Object f}) => 'احذف ${f}';
	@override String get delete => 'حذف';
}

// Path: home.renameFolder
class _Translations$home$renameFolder$ar extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$ar._(TranslationsAr root) : this._root = root, super.internal(root);

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
class _Translations$home$deleteFolder$ar extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'حذف المجلد';
	@override String deleteName({required Object f}) => '${f} حذف';
	@override String get delete => 'حذف';
	@override String get alsoDeleteContents => 'حذف جميع الملاحظات داخل هذا المجلد أيضًا';
}

// Path: sentry.consent
class _Translations$sentry$consent$ar extends Translations$sentry$consent$en {
	_Translations$sentry$consent$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$description$ar description = _Translations$sentry$consent$description$ar._(_root);
	@override late final _Translations$sentry$consent$answers$ar answers = _Translations$sentry$consent$answers$ar._(_root);
	@override String get title => 'تساعد في تحسين صابر؟';
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$ar extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get general => 'عام';
	@override String get writing => 'كتابة';
	@override String get editor => 'المحرر';
	@override String get performance => 'الأداء';
	@override String get advanced => 'متقدم';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$ar extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$ar._(TranslationsAr root) : this._root = root, super.internal(root);

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
	@override String get recentColorsDontSavePresets => 'لا تحفظ الألوان المعينة مسبقًا كألوان حديثة';
	@override String get recentColorsLength => 'كم عدد الألوان الحديثة التي يجب تخزينها';
	@override String get printPageIndicators => 'طباعة مؤشرات الصفحة';
	@override String get shapeRecognitionDelay => 'تأخير التعرف على الأشكال';
	@override String get autoStraightenLines => 'استقامة الخطوط تلقائيًا';
	@override String get simplifiedHomeLayout => 'تخطيط الصفحة الرئيسية المبسط';
	@override String get customDataDir => 'مخصص Saber مجلد';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'التعطيل التلقائي لرسم الإصبع';
	@override String get sentry => 'الإبلاغ خطأ';
	@override String get autosave => 'تلقائي';
}

// Path: settings.prefDescriptions
class _Translations$settings$prefDescriptions$ar extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'يزيد Atkinson Hyperlegible من وضوح الرؤية للقراء الذين يعانون من ضعف في الرؤية';
	@override String get allowInsecureConnections => '(غير موصى به) بالاتصال بالخوادم بشهادات غير موثوقة/موقعة ذاتيًا Saber السماح لـ';
	@override String get preferGreyscale => 'لشاشات الحبر الإلكتروني';
	@override String get autoClearWhiteboardOnExit => 'ستظل متزامنة مع أجهزتك الأخرى';
	@override String get disableEraserAfterUse => 'التبديل تلقائيًا إلى القلم بعد استخدام الممحاة';
	@override String get maxImageSize => 'سيتم ضغط الصور الأكبر من هذا';
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$ar hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$ar._(_root);
	@override String get editorPromptRename => 'يمكنك دائمًا إعادة تسمية الملاحظات لاحقًا';
	@override String get printPageIndicators => 'تظهر مؤشرات الصفحة في الصادرات';
	@override String get shapeRecognitionDelay => 'عدد مرات تحديث معاينة الشكل';
	@override String get autoStraightenLines => 'استقامة الخطوط الطويلة بدون الحاجة لاستخدام قلم الشكل';
	@override String get simplifiedHomeLayout => 'تعيين ارتفاع ثابت لكل معاينة ملاحظة';
	@override String get shouldAlwaysAlertForUpdates => 'أبلغني عن التحديثات بمجرد توفرها';
	@override late final _Translations$settings$prefDescriptions$sentry$ar sentry = _Translations$settings$prefDescriptions$sentry$ar._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'قم بإيقاف تشغيل الرسم بالإصبع عند اكتشاف القلم';
	@override String get autosave => 'تلقائي بعد تأخير قصير ، أو أبدا';
}

// Path: settings.themeModes
class _Translations$settings$themeModes$ar extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get system => 'النظام';
	@override String get light => 'ساطع';
	@override String get dark => 'داكن';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$ar extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get auto => 'آلي';
	@override String get phone => 'هاتف';
	@override String get tablet => 'لوحي';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$ar extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'اختر لوناً';
}

// Path: settings.reset
class _Translations$settings$reset$ar extends Translations$settings$reset$en {
	_Translations$settings$reset$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'إعادة تعيين هذا الإعداد؟';
	@override String get button => 'إعادة تعيين';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$ar extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'إلغاء';
	@override String get select => 'تحديد';
	@override String get mustBeEmpty => 'يجب أن يكون المجلد المحدد فارغًا';
	@override String get mustBeDoneSyncing => 'تأكد من اكتمال المزامنة قبل تغيير المجلد';
	@override String get unsupported => 'هذه الميزة حاليا فقط للمطورين. من المحتمل أن يؤدي استخدامه إلى فقدان البيانات.';
}

// Path: login.form
class _Translations$login$form$ar extends Translations$login$form$en {
	_Translations$login$form$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'بتسجيل الدخول، فإنك توافق على '),
		linkToPrivacyPolicy('سياسة الخصوصية'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _Translations$login$status$ar extends Translations$login$status$en {
	_Translations$login$status$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'تسجيل الخروج';
	@override String get tapToLogin => 'انقر لتسجيل الدخول باستخدام Nextcloud';
	@override String hi({required Object u}) => '!${u}،مرحبًا';
	@override String get almostDone => 'على وشك الانتهاء من المزامنة، اضغط لإنهاء تسجيل الدخول';
	@override String get loggedIn => 'تم تسجيل الدخول باستخدام Nextcloud';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$ar extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'اختر المكان الذي تريد تخزين بياناتك فيه:';
	@override String get saberNcServer => 'Nextcloud الى Saber خادم';
	@override String get otherNcServer => 'اخر Nextcloud خادم';
	@override String get serverUrl => 'عنوان الخادم';
	@override String get loginWithSaber => 'Saber تسجيل الدخول باستخدام';
	@override String get loginWithNextcloud => 'Nextcloud تسجيل الدخول باستخدام';
	@override late final _Translations$login$ncLoginStep$loginFlow$ar loginFlow = _Translations$login$ncLoginStep$loginFlow$ar._(_root);
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$ar extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'لحماية بياناتك، يرجى إدخال كلمة مرور التشفير:';
	@override String get newToSaber => '؟ فقط أدخل كلمة مرور تشفير جديدةSaber جديد على';
	@override String get encPassword => 'كلمة مرور التشفير';
	@override String get encFaqTitle => 'الأسئلة الشائعة';
	@override String get wrongEncPassword => 'فشل فك التشفير باستخدام كلمة المرور المقدمة. يرجى المحاولة مرة أخرى.';
	@override String get connectionFailed => 'حدث خطأ ما أثناء الاتصال بالخادم. يرجى المحاولة لاحقًا.';
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$ar._(_root),
		_Translations$login$encLoginStep$encFaq$1$ar._(_root),
		_Translations$login$encLoginStep$encFaq$2$ar._(_root),
	];
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$ar extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'الصفحة الرئيسية للخادم';
	@override String get deleteAccount => 'حذف الحساب';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$ar extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'هل سأفقد ملاحظاتي إذا قمت بتسجيل الخروج؟';
	@override String get a => 'لا. ستظل ملاحظاتك على كل من جهازك وعلى الخادم. لن تتم مزامنتها مع الخادم حتى تقوم بتسجيل الدخول مرة أخرى. تأكد من اكتمال المزامنة قبل تسجيل الخروج حتى لا تفقد أي بيانات (انظر تقدم المزامنة على الشاشة الرئيسية).';
}

// Path: profile.faq.1
class _Translations$profile$faq$1$ar extends Translations$profile$faq$1$en {
	_Translations$profile$faq$1$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'كيف يمكنني تغيير كلمة المرور الخاصة بي على Nextcloud؟';
	@override String get a => 'انتقل إلى موقع الخادم الخاص بك وقم بتسجيل الدخول. ثم انتقل إلى الإعدادات > الأمان > تغيير كلمة المرور. ستحتاج إلى تسجيل الخروج وتسجيل الدخول مرة أخرى إلى Saber بعد تغيير كلمة المرور الخاصة بك.';
}

// Path: profile.faq.2
class _Translations$profile$faq$2$ar extends Translations$profile$faq$2$en {
	_Translations$profile$faq$2$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'كيف يمكنني تغيير كلمة مرور التشفير الخاصة بي؟';
	@override String get a => '1. تسجيل الخروج من Saber. تأكد من اكتمال المزامنة قبل تسجيل الخروج حتى لا تفقد أي بيانات (انظر تقدم المزامنة على الشاشة الرئيسية).\n2. اذهب إلى موقع الخادم الخاص بك واحذف مجلد "Saber" الخاص بك. سيؤدي هذا إلى حذف كافة ملاحظاتك من الخادم.\n3. قم بتسجيل الدخول مرة أخرى إلى Saber. يمكنك اختيار كلمة مرور تشفير جديدة عند تسجيل الدخول.\n4. لا تنس تسجيل الخروج وتسجيل الدخول مرة أخرى إلى Saber على أجهزتك الأخرى أيضًا.';
}

// Path: profile.faq.3
class _Translations$profile$faq$3$ar extends Translations$profile$faq$3$en {
	_Translations$profile$faq$3$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'كيف يمكنني حذف حسابي؟';
	@override String get a => 'انتقل إلى موقع الخادم الخاص بك وقم بتسجيل الدخول. ثم انتقل إلى الإعدادات> حذف الحساب.\nإذا كنت تستخدم خادم Saber الرسمي، فسيتم حذف حسابك بعد فترة سماح مدتها أسبوع. يمكنك الاتصال بي على adilhanney@disroot.org خلال هذه الفترة لإلغاء الحذف.\nإذا كنت تستخدم خادم جهة خارجية، فقد لا يكون هناك خيار لحذف حسابك: ستحتاج إلى استشارة خصوصية الخادم سياسة لمزيد من المعلومات.';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$ar extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$ar._(TranslationsAr root) : this._root = root, super.internal(root);

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
class _Translations$editor$pens$ar extends Translations$editor$pens$en {
	_Translations$editor$pens$ar._(TranslationsAr root) : this._root = root, super.internal(root);

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
class _Translations$editor$penOptions$ar extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get size => 'حجم';
}

// Path: editor.colors
class _Translations$editor$colors$ar extends Translations$editor$colors$en {
	_Translations$editor$colors$ar._(TranslationsAr root) : this._root = root, super.internal(root);

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
class _Translations$editor$imageOptions$ar extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$ar._(TranslationsAr root) : this._root = root, super.internal(root);

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
class _Translations$editor$selectionBar$ar extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get delete => 'حذف';
	@override String get duplicate => 'تكرار';
}

// Path: editor.menu
class _Translations$editor$menu$ar extends Translations$editor$menu$en {
	_Translations$editor$menu$ar._(TranslationsAr root) : this._root = root, super.internal(root);

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
	@override late final _Translations$editor$menu$boxFits$ar boxFits = _Translations$editor$menu$boxFits$ar._(_root);
	@override late final _Translations$editor$menu$bgPatterns$ar bgPatterns = _Translations$editor$menu$bgPatterns$ar._(_root);
	@override String get lineThickness => 'سمك الخط';
	@override String get lineThicknessDescription => 'سماكة خط الخلفية';
}

// Path: editor.readOnlyBanner
class _Translations$editor$readOnlyBanner$ar extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'وضع القراءة فقط';
	@override String get watchingServer => 'أنت حاليًا تراقب التحديثات على الخادم. تم تعطيل التحرير في هذا الوضع.';
	@override String get corrupted => 'فشل تحميل الملاحظة. ربما يكون تالفًا أو لا يزال قيد التنزيل.';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$ar extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'تم تحرير هذه الملاحظة باستخدام إصدار أحدث من Saber';
	@override String get subtitle => 'قد يؤدي تحرير هذه الملاحظة إلى ضياع بعض المعلومات. هل تريد تجاهل هذا وتعديله على أي حال؟';
	@override String get allowEditing => 'السماح بالتعديل';
}

// Path: editor.quill
class _Translations$editor$quill$ar extends Translations$editor$quill$en {
	_Translations$editor$quill$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'اكتب شيئًا هنا...';
}

// Path: editor.hud
class _Translations$editor$hud$ar extends Translations$editor$hud$en {
	_Translations$editor$hud$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'إلغاء قفل التكبير';
	@override String get lockZoom => 'قفل التكبير';
	@override String get unlockSingleFingerPan => 'تمكين التحريك بإصبع واحد';
	@override String get lockSingleFingerPan => 'تعطيل التحريك بإصبع واحد';
	@override String get unlockAxisAlignedPan => 'إلغاء قفل التحريك إلى أفقي أو عمودي';
	@override String get lockAxisAlignedPan => 'قفل التحريك إلى أفقي أو رأسي';
}

// Path: sentry.consent.description
class _Translations$sentry$consent$description$ar extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get question => 'هل ترغب في الإبلاغ تلقائيًا عن أخطاء غير متوقعة؟ هذا يساعدني على تحديد وإصلاح المشكلات بشكل أسرع.';
	@override String get scope => 'قد تحتوي التقارير على معلومات حول الخطأ وجهازك. لقد بذلت كل جهد ممكن لتصفية البيانات الشخصية ولكن قد يبقى البعض.';
	@override String get currentlyOff => 'إذا منحت موافقة ، فسيتم تمكين الإبلاغ عن الخطأ بعد إعادة تشغيل التطبيق.';
	@override String get currentlyOn => 'إذا قمت بإلغاء الموافقة ، يرجى إعادة تشغيل التطبيق لتعطيل الإبلاغ عن الخطأ.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'تعرف على المزيد في '),
		link('سياسة الخصوصية'),
		const TextSpan(text: '.'),
	]);
}

// Path: sentry.consent.answers
class _Translations$sentry$consent$answers$ar extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get yes => 'نعم';
	@override String get no => 'لا';
	@override String get later => 'اسألني لاحقًا';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$ar extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get shown => 'يمنع التبديل العرضي';
	@override String get fixedOn => 'تم تفعيل الرسم بالإصبع';
	@override String get fixedOff => 'تم تعطيل الرسم بالإصبع';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$ar extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get active => 'نشيط';
	@override String get inactive => 'غير نشط';
	@override String get activeUntilRestart => 'نشط حتى تقوم بإعادة تشغيل التطبيق';
	@override String get inactiveUntilRestart => 'غير نشط حتى تقوم بإعادة تشغيل التطبيق';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$ar extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'الخاص بك Nextcloud للوصول إلى حساب Saber الرجاء تفويض';
	@override String get followPrompts => 'Nextcloud الرجاء اتباع الإرشادات في واجهة';
	@override String get browserDidntOpen => 'لم تفتح صفحة تسجيل الدخول؟ اضغط هنا';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$ar extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'ما هي كلمة مرور التشفير؟ لماذا استخدام كلمتي مرور؟';
	@override String get a => 'تُستخدم للوصول إلى السحابة. بينما كلمة مرور التشفير "تشفر" بياناتك قبل وصولها إلى السحابة  Nextcloud كلمة مرور .\nالخاص بك، ستظل ملاحظاتك آمنة ومشفرة بكلمة مرور منفصلة. هذا يوفر لك طبقة ثانية من الأمان لحماية بياناتك Nextcloud حتى إذا تمكن شخص ما من الوصول إلى حساب .\nلا يمكن لأحد الوصول إلى ملاحظاتك على الخادم بدون كلمة مرور التشفير الخاصة بك، ولكن هذا يعني أيضًا أنه إذا نسيت كلمة مرور التشفير، ستفقد الوصول إلى بياناتك.';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$ar extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'لم أقم بتعيين كلمة مرور تشفير حتى الآن. من أين أحصل عليها؟';
	@override String get a => 'اختر كلمة مرور تشفير جديدة وأدخلها أعلاه.\nبإنشاء مفاتيح التشفير الخاصة بك تلقائيًا من هذه الكلمة Saber سيقوم .';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$ar extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get q => 'الخاص بي؟ Nextcloud هل يمكنني استخدام نفس كلمة المرور لحساب';
	@override String get a => 'الخاص بك Nextcloud نعم، ولكن ضع في اعتبارك أنه سيكون من الأسهل على مدير الخادم أو أي شخص آخر الوصول إلى ملاحظاتك إذا تمكن من الوصول إلى حساب.';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$ar extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$ar._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get fill => 'تمتد';
	@override String get cover => 'غطاء';
	@override String get contain => 'يحتوي';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$ar extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$ar._(TranslationsAr root) : this._root = root, super.internal(root);

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
