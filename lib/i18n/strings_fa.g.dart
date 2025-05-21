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
class TranslationsFa extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fa,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <fa>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsFa _root = this; // ignore: unused_field

	@override 
	TranslationsFa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFa(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonFa common = _TranslationsCommonFa._(_root);
	@override late final _TranslationsHomeFa home = _TranslationsHomeFa._(_root);
	@override late final _TranslationsSettingsFa settings = _TranslationsSettingsFa._(_root);
	@override late final _TranslationsLogsFa logs = _TranslationsLogsFa._(_root);
	@override late final _TranslationsLoginFa login = _TranslationsLoginFa._(_root);
	@override late final _TranslationsProfileFa profile = _TranslationsProfileFa._(_root);
	@override late final _TranslationsAppInfoFa appInfo = _TranslationsAppInfoFa._(_root);
	@override late final _TranslationsUpdateFa update = _TranslationsUpdateFa._(_root);
	@override late final _TranslationsEditorFa editor = _TranslationsEditorFa._(_root);
}

// Path: common
class _TranslationsCommonFa extends TranslationsCommonEn {
	_TranslationsCommonFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'لغو';
	@override String get done => 'انجام شده';
	@override String get continueBtn => 'ادامه هید';
}

// Path: home
class _TranslationsHomeFa extends TranslationsHomeEn {
	_TranslationsHomeFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsFa tabs = _TranslationsHomeTabsFa._(_root);
	@override late final _TranslationsHomeTitlesFa titles = _TranslationsHomeTitlesFa._(_root);
	@override late final _TranslationsHomeTooltipsFa tooltips = _TranslationsHomeTooltipsFa._(_root);
	@override late final _TranslationsHomeCreateFa create = _TranslationsHomeCreateFa._(_root);
	@override String get welcome => 'خوش آمدید';
	@override String get invalidFormat => 'فایلی که انتخاب کرده اید پشتیبانی نمی شود. لطفاً یک فایل sbn، sbn2، sba یا pdf را انتخاب کنید.';
	@override String get noFiles => 'فایلی پیدا نشد';
	@override String get noPreviewAvailable => 'پیش نمایش موجود نیست';
	@override String get createNewNote => 'برای ساخت یادداشت دکمه + را بزنید';
	@override String get backFolder => 'به پوشه قبلی برگردید';
	@override late final _TranslationsHomeNewFolderFa newFolder = _TranslationsHomeNewFolderFa._(_root);
	@override late final _TranslationsHomeRenameNoteFa renameNote = _TranslationsHomeRenameNoteFa._(_root);
	@override late final _TranslationsHomeMoveNoteFa moveNote = _TranslationsHomeMoveNoteFa._(_root);
	@override String get deleteNote => 'حذف یادداشت';
	@override late final _TranslationsHomeRenameFolderFa renameFolder = _TranslationsHomeRenameFolderFa._(_root);
	@override late final _TranslationsHomeDeleteFolderFa deleteFolder = _TranslationsHomeDeleteFolderFa._(_root);
}

// Path: settings
class _TranslationsSettingsFa extends TranslationsSettingsEn {
	_TranslationsSettingsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesFa prefCategories = _TranslationsSettingsPrefCategoriesFa._(_root);
	@override late final _TranslationsSettingsPrefLabelsFa prefLabels = _TranslationsSettingsPrefLabelsFa._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsFa prefDescriptions = _TranslationsSettingsPrefDescriptionsFa._(_root);
	@override late final _TranslationsSettingsThemeModesFa themeModes = _TranslationsSettingsThemeModesFa._(_root);
	@override late final _TranslationsSettingsLayoutSizesFa layoutSizes = _TranslationsSettingsLayoutSizesFa._(_root);
	@override late final _TranslationsSettingsAccentColorPickerFa accentColorPicker = _TranslationsSettingsAccentColorPickerFa._(_root);
	@override String get systemLanguage => 'زبان سیستم';
	@override List<String> get axisDirections => [
		'بالا',
		'راست',
		'پایین',
		'چپ',
	];
	@override late final _TranslationsSettingsResetFa reset = _TranslationsSettingsResetFa._(_root);
	@override late final _TranslationsSettingsCustomDataDirFa customDataDir = _TranslationsSettingsCustomDataDirFa._(_root);
	@override String get openDataDir => 'پوشه Saber را باز کنید';
	@override String get resyncEverything => 'همه چیز را دوباره همگام سازی کنید';
}

// Path: logs
class _TranslationsLogsFa extends TranslationsLogsEn {
	_TranslationsLogsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get logs => 'سیاههها';
	@override String get viewLogs => 'مشاهده سیاهههای مربوط';
	@override String get debuggingInfo => 'گزارش ها حاوی اطلاعات مفیدی برای اشکال زدایی و توسعه هستند';
	@override String get noLogs => 'اینجا هیچ گزارشی وجود ندارد!';
	@override String get logsAreTemporary => 'گزارش‌ها فقط تا زمانی که برنامه را ببندید نگهداری می‌شوند';
}

// Path: login
class _TranslationsLoginFa extends TranslationsLoginEn {
	_TranslationsLoginFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'وارد شدن';
	@override late final _TranslationsLoginFormFa form = _TranslationsLoginFormFa._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'حساب کاربری ندارید؟ '),
		linkToSignup('Sign up now'),
		const TextSpan(text: '!'),
	]);
	@override late final _TranslationsLoginStatusFa status = _TranslationsLoginStatusFa._(_root);
	@override late final _TranslationsLoginNcLoginStepFa ncLoginStep = _TranslationsLoginNcLoginStepFa._(_root);
	@override late final _TranslationsLoginEncLoginStepFa encLoginStep = _TranslationsLoginEncLoginStepFa._(_root);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		undoLogin('تو نه'),
	]);
}

// Path: profile
class _TranslationsProfileFa extends TranslationsProfileEn {
	_TranslationsProfileFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'پروفایل من';
	@override String get logout => 'خروج';
	@override late final _TranslationsProfileQuickLinksFa quickLinks = _TranslationsProfileQuickLinksFa._(_root);
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$Fa._(_root),
		_TranslationsProfile$faq$0i1$Fa._(_root),
		_TranslationsProfile$faq$0i2$Fa._(_root),
		_TranslationsProfile$faq$0i3$Fa._(_root),
	];
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'شما از ${used} از ${total} (${percent}%) استفاده می‌کنید';
	@override String get connectedTo => 'مرتبط با';
	@override String get faqTitle => 'سوالات متداول';
}

// Path: appInfo
class _TranslationsAppInfoFa extends TranslationsAppInfoEn {
	_TranslationsAppInfoFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nاین برنامه کاملاً بدون گارانتی ارائه می شود. این نرم‌افزار رایگان است و شما می‌توانید تحت شرایط خاصی آن را مجدداً توزیع کنید';
	@override String get dirty => 'دیرتی';
	@override String get debug => 'دیباگ';
	@override String get sponsorButton => 'برای حمایت مالی از من یا خرید فضای ذخیره بیشتر، اینجا ضربه بزنید';
	@override String get licenseButton => 'برای مشاهده اطلاعات بیشتر مجوز اینجا را ضربه بزنید';
	@override String get privacyPolicyButton => 'برای مشاهده سیاست حفظ حریم خصوصی اینجا را ضربه بزنید';
}

// Path: update
class _TranslationsUpdateFa extends TranslationsUpdateEn {
	_TranslationsUpdateFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'به‌روزرسانی‌ در دسترس است';
	@override String get updateAvailableDescription => 'نسخه جدیدی از برنامه با این تغییرات در دسترس است:';
	@override String get update => 'بروزرسانی';
	@override String get downloadNotAvailableYet => 'دانلود هنوز برای پلتفرم شما در دسترس نیست. لطفا به زودی دوباره بررسی کنید.';
}

// Path: editor
class _TranslationsEditorFa extends TranslationsEditorEn {
	_TranslationsEditorFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarFa toolbar = _TranslationsEditorToolbarFa._(_root);
	@override late final _TranslationsEditorPensFa pens = _TranslationsEditorPensFa._(_root);
	@override late final _TranslationsEditorPenOptionsFa penOptions = _TranslationsEditorPenOptionsFa._(_root);
	@override late final _TranslationsEditorColorsFa colors = _TranslationsEditorColorsFa._(_root);
	@override late final _TranslationsEditorImageOptionsFa imageOptions = _TranslationsEditorImageOptionsFa._(_root);
	@override late final _TranslationsEditorSelectionBarFa selectionBar = _TranslationsEditorSelectionBarFa._(_root);
	@override late final _TranslationsEditorMenuFa menu = _TranslationsEditorMenuFa._(_root);
	@override late final _TranslationsEditorNewerFileFormatFa newerFileFormat = _TranslationsEditorNewerFileFormatFa._(_root);
	@override late final _TranslationsEditorQuillFa quill = _TranslationsEditorQuillFa._(_root);
	@override late final _TranslationsEditorHudFa hud = _TranslationsEditorHudFa._(_root);
	@override String get pages => 'صفحات';
	@override String get untitled => 'بدون عنوان';
	@override String get needsToSaveBeforeExiting => 'در حال ذخیره تغییرات شما... می توانید با خیال راحت از ویرایشگر خارج شوید';
}

// Path: home.tabs
class _TranslationsHomeTabsFa extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get home => 'خانه';
	@override String get browse => 'مرور کردن';
	@override String get whiteboard => 'وایت برد';
	@override String get settings => 'تنظیمات';
}

// Path: home.titles
class _TranslationsHomeTitlesFa extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get home => 'یادداشت های اخیر';
	@override String get browse => 'مرور کردن';
	@override String get whiteboard => 'وایت برد';
	@override String get settings => 'تنظیمات';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsFa extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'یادداشت جدید';
	@override String get showUpdateDialog => 'نمایش به روز رسانی';
	@override String get exportNote => 'صدور یادداشت';
}

// Path: home.create
class _TranslationsHomeCreateFa extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'یادداشت جدید';
	@override String get importNote => 'یادداشت وارد کنید';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderFa extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'پوشه جدید';
	@override String get folderName => 'نام پوشه';
	@override String get create => 'ايجاد كردن';
	@override String get folderNameEmpty => 'نام پوشه نمی تواند خالی باشد';
	@override String get folderNameContainsSlash => 'نام پوشه نمی تواند دارای اسلش باشد';
	@override String get folderNameExists => 'پوشه از قبل وجود دارد';
}

// Path: home.renameNote
class _TranslationsHomeRenameNoteFa extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'تغییر نام یادداشت';
	@override String get noteName => 'نام یادداشت';
	@override String get rename => 'تغییر نام دهید';
	@override String get noteNameEmpty => 'نام یادداشت نمی‌تواند خالی باشد';
	@override String get noteNameContainsSlash => 'نام یادداشت نمی‌تواند دارای اسلش باشد';
	@override String get noteNameExists => 'یادداشتی با این نام از قبل وجود دارد';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteFa extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'انتقال یادداشت';
	@override String moveNotes({required Object n}) => 'انتقال یادداشت ${n}';
	@override String moveName({required Object f}) => 'انتقال ${f}';
	@override String get move => 'انتقال';
	@override String renamedTo({required Object newName}) => 'یادداشت به ${newName} تغییر نام می یابد';
	@override String get multipleRenamedTo => 'یادداشت های زیر تغییر نام خواهند داد:';
	@override String numberRenamedTo({required Object n}) => '${n} یادداشت برای جلوگیری از تداخل نام تغییر خواهد کرد';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderFa extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'تغییر نام پوشه';
	@override String get folderName => 'نام پوشه';
	@override String get rename => 'تغییر نام';
	@override String get folderNameEmpty => 'نام پوشه نمی تواند خالی باشد';
	@override String get folderNameContainsSlash => 'نام پوشه نمی تواند دارای اسلش باشد';
	@override String get folderNameExists => 'پوشه ای با این نام از قبل وجود دارد';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderFa extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'پوشه را حذف کنید';
	@override String deleteName({required Object f}) => '${f} را حذف کنید';
	@override String get delete => 'حذف';
	@override String get alsoDeleteContents => 'همچنین تمام یادداشت های داخل این پوشه را حذف کنید';
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesFa extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get general => 'عمومی';
	@override String get writing => 'نوشتن';
	@override String get editor => 'ویرایشگر';
	@override String get performance => 'کارایی';
	@override String get advanced => 'پیشرفته';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsFa extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get locale => 'زبان برنامه';
	@override String get appTheme => 'تم برنامه';
	@override String get platform => 'نوع تم';
	@override String get layoutSize => 'نوع چیدمان';
	@override String get customAccentColor => 'رنگ سفارشی';
	@override String get hyperlegibleFont => 'فونت بیش از حد خوانا';
	@override String get shouldCheckForUpdates => 'به‌روزرسانی‌ برنامه را به‌طور خودکار بررسی کنید';
	@override String get shouldAlwaysAlertForUpdates => 'به روز رسانی سریع تر';
	@override String get allowInsecureConnections => 'به اتصالات ناامن اجازه دهید';
	@override String get editorToolbarAlignment => 'تراز کردن نوار ابزار ویرایشگر';
	@override String get editorToolbarShowInFullscreen => 'نوار ابزار ویرایشگر را در حالت تمام صفحه نمایش دهید';
	@override String get editorAutoInvert => 'معکوس کردن رنگ یادداشت ها در حالت تاریک';
	@override String get preferGreyscale => 'رنگ های خاکستری را در اولویت قرار دهید';
	@override String get maxImageSize => 'حداکثر اندازه تصویر';
	@override String get autoClearWhiteboardOnExit => 'پس از خروج از برنامه، وایت برد پاک شود';
	@override String get disableEraserAfterUse => 'پاک کن را به صورت خودکار غیرفعال کنید';
	@override String get hideFingerDrawingToggle => 'ضامن طراحی انگشت را پنهان کنید';
	@override String get editorPromptRename => 'از شما می خواهد که نام یادداشت های جدید را تغییر دهید';
	@override String get hideHomeBackgrounds => 'پس زمینه را در صفحه اصلی پنهان کنید';
	@override String get recentColorsDontSavePresets => 'رنگ های از پیش تعیین شده را در رنگ های اخیر ذخیره نکنید';
	@override String get recentColorsLength => 'چند رنگ اخیر برای ذخیره';
	@override String get printPageIndicators => 'چاپ نشانگرهای صفحه';
	@override String get autosaveDelay => 'تأخیر ذخیره خودکار';
	@override String get shapeRecognitionDelay => 'تاخیر در تشخیص شکل';
	@override String get simplifiedHomeLayout => 'چیدمان خانه ساده شده';
	@override String get pencilSoundSetting => 'جلوه صدای مداد';
	@override String get customDataDir => 'دایرکتوری داده های سفارشی';
	@override String get autoStraightenLines => 'صاف کردن خودکار خطوط';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsFa extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'خوانایی را برای خوانندگان کم بینا افزایش می دهد';
	@override String get allowInsecureConnections => '(توصیه نمی شود) به Saber اجازه دهید به سرورهایی با گواهینامه های خودامضا/غیر قابل اعتماد متصل شود';
	@override String get preferGreyscale => 'برای نمایشگر های e-ink';
	@override String get autoClearWhiteboardOnExit => 'همچنان با دستگاه‌های دیگر شما همگام‌سازی می‌شود';
	@override String get disableEraserAfterUse => 'پس از استفاده از پاک کن به صورت خودکار به خودکار برمی گردد';
	@override String get maxImageSize => 'تصاویر بزرگتر از این فشرده خواهند شد';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingFa hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingFa._(_root);
	@override String get editorPromptRename => 'همیشه می توانید بعداً نام یادداشت ها را تغییر دهید';
	@override String get hideHomeBackgrounds => 'برای ظاهری تمیز تر';
	@override String get printPageIndicators => 'نمایش نشانگرهای صفحه در خروجی';
	@override String get autosaveDelay => 'چه مدت باید قبل از ذخیره خودکار یادداشت صبر کرد';
	@override String get shapeRecognitionDelay => 'به روز رسانی پیشنمایش شکل چند وقت یکبار انجام شود';
	@override String get shouldAlwaysAlertForUpdates => 'به محض اینکه به‌روزرسانی‌ها در دسترس هستند، به من بگویید';
	@override late final _TranslationsSettingsPrefDescriptionsPencilSoundSettingFa pencilSoundSetting = _TranslationsSettingsPrefDescriptionsPencilSoundSettingFa._(_root);
	@override String get simplifiedHomeLayout => 'یک ارتفاع ثابت برای پیش نمایش هر یادداشت تنظیم می کند';
	@override String get autoStraightenLines => 'خطوط بلند را بدون استفاده از قلم شکل صاف می کند';
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesFa extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get system => 'سیستم';
	@override String get light => 'روشن';
	@override String get dark => 'تاریک';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesFa extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get auto => 'خودکار';
	@override String get phone => 'تلفن';
	@override String get tablet => 'تبلت';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerFa extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'یک رنگ انتخاب کنید';
}

// Path: settings.reset
class _TranslationsSettingsResetFa extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'این تنظیمات را بازنشانی می کنید؟';
	@override String get button => 'بازنشانی';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirFa extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'لغو کنید';
	@override String get select => 'انتخاب کنید';
	@override String get mustBeEmpty => 'دایرکتوری انتخاب شده باید خالی باشد';
	@override String get mustBeDoneSyncing => 'قبل از تغییر دایرکتوری مطمئن شوید که همگام سازی کامل شده است';
}

// Path: login.form
class _TranslationsLoginFormFa extends TranslationsLoginFormEn {
	_TranslationsLoginFormFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'با ورود به سیستم، با قوانین موافقت خواهد شد '),
		linkToPrivacyPolicy('Privacy Policy'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusFa extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'خروج';
	@override String get tapToLogin => 'برای ورود با Nextcloud ضربه بزنید';
	@override String get loggedIn => 'وارد شدن با Nextcloud';
	@override String hi({required Object u}) => 'سلام، ${u}!';
	@override String get almostDone => 'تقریباً برای همگام‌سازی آماده است، برای پایان ورود به سیستم ضربه بزنید';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepFa extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsLoginNcLoginStepLoginFlowFa loginFlow = _TranslationsLoginNcLoginStepLoginFlowFa._(_root);
	@override String get whereToStoreData => 'محل ذخیره داده های خود را انتخاب کنید:';
	@override String get saberNcServer => 'سرور Nextcloud Saber';
	@override String get otherNcServer => 'سرور Nextcloud دیگر';
	@override String get serverUrl => 'آدرس سرور';
	@override String get loginWithSaber => 'با صابر وارد شوید';
	@override String get loginWithNextcloud => 'با Nextcloud وارد شوید';
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepFa extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'برای محافظت از داده های خود، لطفا رمز رمزگذاری خود را وارد کنید:';
	@override String get newToSaber => 'تازه وارد صابر';
	@override String get encPassword => 'رمز رمزگذاری';
	@override String get encFaqTitle => 'سوالات متداول';
	@override String get wrongEncPassword => 'رمزگشایی با رمز عبور ارائه شده انجام نشد. لطفاً دوباره آن را وارد کنید.';
	@override String get connectionFailed => 'هنگام اتصال به سرور مشکلی پیش آمد. لطفاً بعداً دوباره امتحان کنید.';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$Fa._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$Fa._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$Fa._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksFa extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'صفحه اصلی سرور';
	@override String get deleteAccount => 'حذف حساب';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$Fa extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$Fa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get q => 'ایا اگر خارج شوم یادداشت هایم را از دست خواهم داد؟';
	@override String get a => 'خیر. یادداشت‌های شما هم روی دستگاه و هم روی سرور باقی می‌مانند. تا زمانی که دوباره وارد سیستم نشوید با سرور همگام‌سازی نمی‌شوند. قبل از خروج از سیستم مطمئن شوید که همگام‌سازی کامل شده است تا هیچ داده‌ای را از دست ندهید (پیشرفت همگام‌سازی را در صفحه اصلی ببینید).';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$Fa extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$Fa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get q => 'چگونه رمز عبور Nextcloud خود را تغییر دهم؟';
	@override String get a => 'به وب سایت سرور خود بروید و وارد شوید. سپس به تنظیمات > امنیت > تغییر رمز عبور بروید. پس از تغییر رمز عبور، باید از سیستم خارج شوید و دوباره وارد Saber شوید.';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$Fa extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$Fa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get q => 'چگونه رمز رمزگذاری خود را تغییر دهم؟';
	@override String get a => '1. از Saber خارج شوید. قبل از خروج از سیستم مطمئن شوید که همگام‌سازی کامل شده است تا هیچ داده‌ای را از دست ندهید (پیشرفت همگام‌سازی را در صفحه اصلی ببینید).\n2. به وب سایت سرور خود بروید و پوشه \'Saber\' خود را حذف کنید. با این کار تمام یادداشت های شما از سرور حذف می شود.\n3. دوباره وارد سابر شوید. هنگام ورود به سیستم می‌توانید رمز رمزگذاری جدیدی انتخاب کنید.\n4. فراموش نکنید که از سیستم خارج شوید و در دستگاه های دیگر خود نیز دوباره وارد Saber شوید.';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$Fa extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$Fa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get q => 'چگونه می توانم حساب کاربری خود را حذف کنم؟';
	@override String get a => 'روی دکمه "${_root.profile.quickLinks.deleteAccount}" در بالا ضربه بزنید و در صورت نیاز وارد شوید.\nاگر از سرور رسمی Saber استفاده می‌کنید، حساب شما پس از یک هفته مهلت حذف می‌شود. می‌توانید در این مدت با من در adilhanney@disroot.org تماس بگیرید تا حذف را لغو کنید.\nاگر از یک سرور شخص ثالث استفاده می‌کنید، ممکن است گزینه‌ای برای حذف حساب شما وجود نداشته باشد: باید با حفظ حریم خصوصی سرور مشورت کنید. سیاست برای اطلاعات بیشتر';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarFa extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

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
class _TranslationsEditorPensFa extends TranslationsEditorPensEn {
	_TranslationsEditorPensFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'خودنویس';
	@override String get ballpointPen => 'خودکار';
	@override String get highlighter => 'هایلایتر';
	@override String get pencil => 'مداد';
	@override String get shapePen => 'شکل قلم';
	@override String get laserPointer => 'اشاره گر لیزری';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsFa extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get size => 'اندازه';
}

// Path: editor.colors
class _TranslationsEditorColorsFa extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'انتخاب کننده رنگ';
	@override String customBrightnessHue({required Object b, required Object h}) => 'شخصی سازی ${b} ${h}';
	@override String customHue({required Object h}) => 'شخصی سازی ${h}';
	@override String get dark => 'تاریک';
	@override String get light => 'روشن';
	@override String get black => 'مشکی';
	@override String get darkGrey => 'خاکستری تیره';
	@override String get grey => 'خاکستری';
	@override String get lightGrey => 'خاکستری روشن';
	@override String get white => 'سفید';
	@override String get red => 'قرمز';
	@override String get green => 'سبز';
	@override String get cyan => 'فیروزه ای';
	@override String get blue => 'آبی';
	@override String get yellow => 'زرد';
	@override String get purple => 'بنفش';
	@override String get pink => 'صورتی';
	@override String get orange => 'نارنجی';
	@override String get pastelRed => 'قرمز پاستلی';
	@override String get pastelOrange => 'نارنجی پاستلی';
	@override String get pastelYellow => 'زرد پاستلی';
	@override String get pastelGreen => 'سبز پاستلی';
	@override String get pastelCyan => 'فیروزه ای پاستلی';
	@override String get pastelBlue => 'آبی پاستلی';
	@override String get pastelPurple => 'بنفش پاستلی';
	@override String get pastelPink => 'صورتی پاستلی';
}

// Path: editor.imageOptions
class _TranslationsEditorImageOptionsFa extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'گزینه های تصویر';
	@override String get invertible => 'معکوس پذیر';
	@override String get download => 'دانلود';
	@override String get setAsBackground => 'قرار دادن به عنوان تصویر زمینه';
	@override String get removeAsBackground => 'حذف از پس زمینه';
	@override String get delete => 'حذف';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarFa extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get delete => 'حذف';
	@override String get duplicate => 'تکراری';
}

// Path: editor.menu
class _TranslationsEditorMenuFa extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'صفحه ${page}/${totalPages} را پاک کنید';
	@override String get clearAllPages => 'تمام صفحات را پاک کنید';
	@override String get insertPage => 'درج صفحه در زیر';
	@override String get duplicatePage => 'تکرار صفحه';
	@override String get deletePage => 'حذف صفحه';
	@override String get lineHeight => 'ارتفاع خط';
	@override String get backgroundImageFit => 'مناسب تصویر پس زمینه';
	@override String get backgroundPattern => 'الگوی پس زمینه';
	@override String get import => 'واردکردن';
	@override late final _TranslationsEditorMenuBoxFitsFa boxFits = _TranslationsEditorMenuBoxFitsFa._(_root);
	@override late final _TranslationsEditorMenuBgPatternsFa bgPatterns = _TranslationsEditorMenuBgPatternsFa._(_root);
	@override String get lineThickness => 'ضخامت خط';
	@override String get lineThicknessDescription => 'ضخامت خط پس زمینه';
	@override String get watchServer => 'مراقب به روز رسانی ها در سرور باشید';
	@override String get watchServerReadOnly => 'هنگام تماشای سرور، ویرایش غیرفعال است';
	@override String get lineHeightDescription => 'همچنین اندازه متن را برای یادداشت های تایپ شده کنترل می کند';
}

// Path: editor.newerFileFormat
class _TranslationsEditorNewerFileFormatFa extends TranslationsEditorNewerFileFormatEn {
	_TranslationsEditorNewerFileFormatFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'حالت فقط خواندنی';
	@override String get title => 'این یادداشت با استفاده از نسخه جدیدتر برنامه ویرایش شده است';
	@override String get subtitle => 'ویرایش این یادداشت ممکن است منجر به از بین رفتن برخی از اطلاعات شود. آیا می خواهید این را نادیده بگیرید و به هر حال آن را ویرایش کنید؟';
	@override String get allowEditing => 'اجازه ویرایش';
}

// Path: editor.quill
class _TranslationsEditorQuillFa extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'اینجا چیزی تایپ کنید...';
}

// Path: editor.hud
class _TranslationsEditorHudFa extends TranslationsEditorHudEn {
	_TranslationsEditorHudFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'قفل زوم را باز کنید';
	@override String get lockZoom => 'قفل زوم';
	@override String get unlockSingleFingerPan => 'تحرک تک انگشتی را فعال کنید';
	@override String get lockSingleFingerPan => 'تحرک تک انگشتی را غیرفعال کنید';
	@override String get unlockAxisAlignedPan => 'باز کردن قفل حرکت به حالت افقی یا عمودی';
	@override String get lockAxisAlignedPan => 'پانینگ را به صورت افقی یا عمودی قفل کنید';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingFa extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get shown => 'از جابجایی تصادفی جلوگیری می کند';
	@override String get fixedOn => 'طراحی با انگشت به صورت فعال ثابت شده است';
	@override String get fixedOff => 'طراحی با انگشت به عنوان غیرفعال ثابت است';
}

// Path: settings.prefDescriptions.pencilSoundSetting
class _TranslationsSettingsPrefDescriptionsPencilSoundSettingFa extends TranslationsSettingsPrefDescriptionsPencilSoundSettingEn {
	_TranslationsSettingsPrefDescriptionsPencilSoundSettingFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get onAlways => 'فعال (حتی در حالت بی صدا)';
	@override String get off => 'بدون صدا';
	@override String get onButNotInSilentMode => 'فعال (مگر در حالت بی صدا)';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowFa extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'لطفاً به Saber اجازه دسترسی به حساب Nextcloud شما را بدهید';
	@override String get followPrompts => 'لطفاً دستورات موجود در مرورگر خود را دنبال کنید.';
	@override String get browserDidntOpen => 'مرورگر باز نشد';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$Fa extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$Fa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get q => 'رمز عبور رمزنگاری چیست؟';
	@override String get a => 'رمز عبور رمزگذاری برای رمزگذاری داده های شما قبل از ارسال به سرور استفاده می شود.';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$Fa extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$Fa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get q => 'چرا از دو رمز عبور استفاده میشود؟';
	@override String get a => 'رمز عبور Nextcloud برای دسترسی به ابر استفاده می شود و رمزعبور دوم برای رمزنگاری استفاده میشود';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$Fa extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$Fa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get q => 'آیا می توانم از یک رمز عبور برای هر دو استفاده کنم؟';
	@override String get a => 'بله، اما انجام این کار امنیت کمتری دارد. از آنجایی که رمز عبور Nextcloud شما به سرور ارسال می شود، شخصی که به سرور دسترسی دارد می تواند یادداشت های شما را رمزگشایی کند. فقط در صورتی از همان رمز عبور استفاده کنید که به مالک سرور اعتماد دارید.';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsFa extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get fill => 'کش آمدن';
	@override String get cover => 'پوشش دادن';
	@override String get contain => 'محتوی';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsFa extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get none => 'جای خالی';
	@override String get college => 'قوانین کالج';
	@override String get collegeRtl => 'تحت حاکمیت دانشگاهی (معکوس)';
	@override String get lined => 'خط کشی شده';
	@override String get grid => 'توری';
	@override String get dots => 'نقطه ای';
	@override String get staffs => 'کارکنان';
	@override String get tablature => 'جدول بندی';
	@override String get cornell => 'کرنل';
}
