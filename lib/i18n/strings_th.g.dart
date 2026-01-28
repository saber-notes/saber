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
class TranslationsTh extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsTh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.th,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <th>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsTh _root = this; // ignore: unused_field

	@override 
	TranslationsTh $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTh(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonTh common = _TranslationsCommonTh._(_root);
	@override late final _TranslationsHomeTh home = _TranslationsHomeTh._(_root);
	@override late final _TranslationsSentryTh sentry = _TranslationsSentryTh._(_root);
	@override late final _TranslationsSettingsTh settings = _TranslationsSettingsTh._(_root);
	@override late final _TranslationsLogsTh logs = _TranslationsLogsTh._(_root);
	@override late final _TranslationsLoginTh login = _TranslationsLoginTh._(_root);
	@override late final _TranslationsProfileTh profile = _TranslationsProfileTh._(_root);
	@override late final _TranslationsAppInfoTh appInfo = _TranslationsAppInfoTh._(_root);
	@override late final _TranslationsUpdateTh update = _TranslationsUpdateTh._(_root);
	@override late final _TranslationsEditorTh editor = _TranslationsEditorTh._(_root);
}

// Path: common
class _TranslationsCommonTh extends TranslationsCommonEn {
	_TranslationsCommonTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get done => 'เสร็จ';
	@override String get continueBtn => 'ดำเนินการต่อ';
	@override String get cancel => 'ยกเลิก';
}

// Path: home
class _TranslationsHomeTh extends TranslationsHomeEn {
	_TranslationsHomeTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsTh tabs = _TranslationsHomeTabsTh._(_root);
	@override late final _TranslationsHomeTitlesTh titles = _TranslationsHomeTitlesTh._(_root);
	@override late final _TranslationsHomeTooltipsTh tooltips = _TranslationsHomeTooltipsTh._(_root);
	@override late final _TranslationsHomeCreateTh create = _TranslationsHomeCreateTh._(_root);
	@override String get welcome => 'ยินดีต้อนรับสู่เซเบอร์';
	@override String get invalidFormat => 'ไฟล์ที่คุณเลือกไม่รองรับ โปรดเลือกไฟล์ประเภท sbn, sbn2, sba หรือ pdf แทน';
	@override String get noFiles => 'ไม่พบไฟล์';
	@override String get noPreviewAvailable => 'ไม่มีภาพตัวอย่าง';
	@override String get createNewNote => 'แตะปุ่ม + เพื่อสร้างบันทึกใหม่';
	@override String get backFolder => 'กลับไปยังโฟลเดอร์ก่อนหน้า';
	@override late final _TranslationsHomeNewFolderTh newFolder = _TranslationsHomeNewFolderTh._(_root);
	@override late final _TranslationsHomeRenameNoteTh renameNote = _TranslationsHomeRenameNoteTh._(_root);
	@override late final _TranslationsHomeMoveNoteTh moveNote = _TranslationsHomeMoveNoteTh._(_root);
	@override String get deleteNote => 'ลบบันทึก';
	@override late final _TranslationsHomeRenameFolderTh renameFolder = _TranslationsHomeRenameFolderTh._(_root);
	@override late final _TranslationsHomeDeleteFolderTh deleteFolder = _TranslationsHomeDeleteFolderTh._(_root);
}

// Path: sentry
class _TranslationsSentryTh extends TranslationsSentryEn {
	_TranslationsSentryTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSentryConsentTh consent = _TranslationsSentryConsentTh._(_root);
}

// Path: settings
class _TranslationsSettingsTh extends TranslationsSettingsEn {
	_TranslationsSettingsTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesTh prefCategories = _TranslationsSettingsPrefCategoriesTh._(_root);
	@override late final _TranslationsSettingsPrefLabelsTh prefLabels = _TranslationsSettingsPrefLabelsTh._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsTh prefDescriptions = _TranslationsSettingsPrefDescriptionsTh._(_root);
	@override late final _TranslationsSettingsThemeModesTh themeModes = _TranslationsSettingsThemeModesTh._(_root);
	@override late final _TranslationsSettingsLayoutSizesTh layoutSizes = _TranslationsSettingsLayoutSizesTh._(_root);
	@override late final _TranslationsSettingsAccentColorPickerTh accentColorPicker = _TranslationsSettingsAccentColorPickerTh._(_root);
	@override String get systemLanguage => 'อัตโนมัติ';
	@override List<String> get axisDirections => [
		'บน',
		'ขวา',
		'ล่าง',
		'ซ้าย',
	];
	@override late final _TranslationsSettingsResetTh reset = _TranslationsSettingsResetTh._(_root);
	@override String get resyncEverything => 'ซิงค์ทุกอย่างใหม่';
	@override String get openDataDir => 'เปิดโฟลเดอร์ Saber';
	@override late final _TranslationsSettingsCustomDataDirTh customDataDir = _TranslationsSettingsCustomDataDirTh._(_root);
	@override String get autosaveDisabled => 'เคย';
	@override String get shapeRecognitionDisabled => 'เคย';
}

// Path: logs
class _TranslationsLogsTh extends TranslationsLogsEn {
	_TranslationsLogsTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get logs => 'บันทึก';
	@override String get viewLogs => 'ดูบันทึก';
	@override String get debuggingInfo => 'ไฟล์บันทึกข้อมูลมีข้อมูลที่เป็นประโยชน์สำหรับการแก้ไขข้อผิดพลาดและพัฒนา';
	@override String get noLogs => 'ไม่มีบันทึกข้อมูลใดๆ ที่นี่!';
	@override String get useTheApp => 'บันทึกการใช้งานแอปจะปรากฏที่นี่ขณะที่คุณใช้งาน';
}

// Path: login
class _TranslationsLoginTh extends TranslationsLoginEn {
	_TranslationsLoginTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'เข้าสู่ระบบ';
	@override late final _TranslationsLoginFormTh form = _TranslationsLoginFormTh._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'ยังไม่มีบัญชีใช่ไหม? '),
		linkToSignup('สมัครตอนนี้'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'ไม่ใช่คุณใช่ไหม? '),
		undoLogin('เลือกบัญชีอื่น'),
	]);
	@override late final _TranslationsLoginStatusTh status = _TranslationsLoginStatusTh._(_root);
	@override late final _TranslationsLoginNcLoginStepTh ncLoginStep = _TranslationsLoginNcLoginStepTh._(_root);
	@override late final _TranslationsLoginEncLoginStepTh encLoginStep = _TranslationsLoginEncLoginStepTh._(_root);
}

// Path: profile
class _TranslationsProfileTh extends TranslationsProfileEn {
	_TranslationsProfileTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'โปรไฟล์ของฉัน';
	@override String get logout => 'ออกจากระบบ';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'คุณกำลังใช้ ${used} จาก ${total} (${percent}%)';
	@override String get connectedTo => 'เชื่อมต่อไปยัง';
	@override late final _TranslationsProfileQuickLinksTh quickLinks = _TranslationsProfileQuickLinksTh._(_root);
	@override String get faqTitle => 'คำถามที่พบบ่อย';
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$Th._(_root),
		_TranslationsProfile$faq$0i1$Th._(_root),
		_TranslationsProfile$faq$0i2$Th._(_root),
		_TranslationsProfile$faq$0i3$Th._(_root),
	];
}

// Path: appInfo
class _TranslationsAppInfoTh extends TranslationsAppInfoEn {
	_TranslationsAppInfoTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'สงวนลิขสิทธิ์ Saber © 2022-${buildYear} Adil Hanney\nโปรแกรมนี้ไม่มีการรับประกันใดๆ ทั้งสิ้น นี่คือซอฟต์แวร์ฟรี และคุณสามารถแจกจ่ายต่อได้ภายใต้เงื่อนไขบางประการ';
	@override String get debug => 'แก้ไขข้อผิดพลาด';
	@override String get sponsorButton => 'คลิกที่นี่เพื่อสนับสนุนฉัน หรือซื้อพื้นที่จัดเก็บเพิ่มเติม';
	@override String get licenseButton => 'คลิกที่นี่เพื่อดูข้อมูลใบอนุญาตเพิ่มเติม';
	@override String get privacyPolicyButton => 'แตะที่นี่เพื่อดูนโยบายความเป็นส่วนตัว';
}

// Path: update
class _TranslationsUpdateTh extends TranslationsUpdateEn {
	_TranslationsUpdateTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'มีอัปเดตแล้ว';
	@override String get updateAvailableDescription => 'แอปเวอร์ชันใหม่พร้อมใช้งานแล้ว:';
	@override String get update => 'อัปเดต';
	@override String get downloadNotAvailableYet => 'ไฟล์ดาวน์โหลดยังไม่พร้อมให้บริการสำหรับแพลตฟอร์มของคุณ โปรดตรวจสอบอีกครั้งในภายหลัง';
}

// Path: editor
class _TranslationsEditorTh extends TranslationsEditorEn {
	_TranslationsEditorTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarTh toolbar = _TranslationsEditorToolbarTh._(_root);
	@override late final _TranslationsEditorPensTh pens = _TranslationsEditorPensTh._(_root);
	@override late final _TranslationsEditorPenOptionsTh penOptions = _TranslationsEditorPenOptionsTh._(_root);
	@override late final _TranslationsEditorColorsTh colors = _TranslationsEditorColorsTh._(_root);
	@override late final _TranslationsEditorImageOptionsTh imageOptions = _TranslationsEditorImageOptionsTh._(_root);
	@override late final _TranslationsEditorSelectionBarTh selectionBar = _TranslationsEditorSelectionBarTh._(_root);
	@override late final _TranslationsEditorMenuTh menu = _TranslationsEditorMenuTh._(_root);
	@override late final _TranslationsEditorReadOnlyBannerTh readOnlyBanner = _TranslationsEditorReadOnlyBannerTh._(_root);
	@override late final _TranslationsEditorVersionTooNewTh versionTooNew = _TranslationsEditorVersionTooNewTh._(_root);
	@override late final _TranslationsEditorQuillTh quill = _TranslationsEditorQuillTh._(_root);
	@override late final _TranslationsEditorHudTh hud = _TranslationsEditorHudTh._(_root);
	@override String get pages => 'หน้า';
	@override String get untitled => 'ไม่มีชื่อ';
	@override String get needsToSaveBeforeExiting => 'กำลังบันทึกการเปลี่ยนแปลง... คุณสามารถออกจากโปรแกรมแก้ไขได้อย่างปลอดภัยเมื่อเสร็จสิ้น';
}

// Path: home.tabs
class _TranslationsHomeTabsTh extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get home => 'หน้าแรก';
	@override String get browse => 'เรียกดู';
	@override String get whiteboard => 'ไวท์บอร์ด';
	@override String get settings => 'ตั้งค่า';
}

// Path: home.titles
class _TranslationsHomeTitlesTh extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get home => 'บันทึกล่าสุด';
	@override String get browse => 'เรียกดู';
	@override String get whiteboard => 'ไวท์บอร์ด';
	@override String get settings => 'ตั้งค่า';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsTh extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'บันทึกใหม่';
	@override String get showUpdateDialog => 'แสดงหน้าต่างอัปเดต';
	@override String get exportNote => 'หมายเหตุส่งออก';
}

// Path: home.create
class _TranslationsHomeCreateTh extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'บันทึกใหม่';
	@override String get importNote => 'นำเข้าบันทึก';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderTh extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'โฟลเดอร์ใหม่';
	@override String get folderName => 'ชื่อโฟลเดอร์';
	@override String get create => 'สร้าง';
	@override String get folderNameEmpty => 'ชื่อโฟลเดอร์ต้องไม่ว่างเปล่า';
	@override String get folderNameContainsSlash => 'ชื่อโฟลเดอร์ต้องไม่มีเครื่องหมายทับ (/)';
	@override String get folderNameExists => 'โฟลเดอร์มีอยู่แล้ว';
}

// Path: home.renameNote
class _TranslationsHomeRenameNoteTh extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'เปลี่ยนชื่อบันทึก';
	@override String get noteName => 'ชื่อบันทึก';
	@override String get rename => 'เปลี่ยนชื่อ';
	@override String get noteNameEmpty => 'ชื่อหมายเหตุต้องไม่ว่างเปล่า';
	@override String get noteNameExists => 'มีบันทึกชื่อนี้อยู่แล้ว';
	@override String get noteNameForbiddenCharacters => 'ชื่อบันทึกมีอักขระต้องห้าม';
	@override String get noteNameReserved => 'ชื่อถูกสงวนไว้';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteTh extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'ย้ายบันทึก';
	@override String moveNotes({required Object n}) => 'ย้ายบันทึก ${n}';
	@override String moveName({required Object f}) => 'ย้าย ${f}';
	@override String get move => 'ย้าย';
	@override String renamedTo({required Object newName}) => 'บันทึกจะถูกเปลี่ยนชื่อเป็น ${newName}';
	@override String get multipleRenamedTo => 'บันทึกต่อไปนี้จะถูกเปลี่ยนชื่อ:';
	@override String numberRenamedTo({required Object n}) => 'มีการเปลี่ยนชื่อเอกสารจำนวน ${n} เพื่อหลีกเลี่ยงความขัดแย้ง';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderTh extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'เปลี่ยนชื่อโฟลเดอร์';
	@override String get folderName => 'ชื่อโฟลเดอร์';
	@override String get rename => 'เปลี่ยนชื่อ';
	@override String get folderNameEmpty => 'ชื่อโฟลเดอร์ต้องไม่ว่างเปล่า';
	@override String get folderNameContainsSlash => 'ชื่อโฟลเดอร์ต้องไม่มีเครื่องหมายทับ (/)';
	@override String get folderNameExists => 'มีโฟลเดอร์ชื่อนี้อยู่แล้ว';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderTh extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'ลบโฟลเดอร์';
	@override String deleteName({required Object f}) => 'ลบ ${f}';
	@override String get delete => 'ลบ';
	@override String get alsoDeleteContents => 'ลบบันทึกทั้งหมดที่อยู่ในโฟลเดอร์นี้ด้วย';
}

// Path: sentry.consent
class _TranslationsSentryConsentTh extends TranslationsSentryConsentEn {
	_TranslationsSentryConsentTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'ช่วยปรับปรุง Saber ได้ไหม?';
	@override late final _TranslationsSentryConsentDescriptionTh description = _TranslationsSentryConsentDescriptionTh._(_root);
	@override late final _TranslationsSentryConsentAnswersTh answers = _TranslationsSentryConsentAnswersTh._(_root);
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesTh extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get general => 'ทั่วไป';
	@override String get writing => 'กำลังเขียน';
	@override String get editor => 'ผู้เรียบเรียง';
	@override String get performance => 'ประสิทธิภาพ';
	@override String get advanced => 'ขั้นสูง';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsTh extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get locale => 'ภาษา';
	@override String get appTheme => 'ธีมแอป';
	@override String get platform => 'ประเภทธีม';
	@override String get layoutSize => 'ประเภทเค้าโครง';
	@override String get customAccentColor => 'กำหนดสีเน้นเอง';
	@override String get hyperlegibleFont => 'แบบอักษร Atkinson Hyperlegible';
	@override String get shouldCheckForUpdates => 'ตรวจสอบอัปเดต Saber';
	@override String get shouldAlwaysAlertForUpdates => 'อัปเดตเร็วขึ้น';
	@override String get allowInsecureConnections => 'อนุญาตเชื่อมต่อที่ไม่ปลอดภัย';
	@override String get editorToolbarAlignment => 'ตำแหน่งแถบเครื่องมือ';
	@override String get editorToolbarShowInFullscreen => 'แสดงแถบเครื่องมือในโหมดเต็มหน้าจอ';
	@override String get editorAutoInvert => 'กลับด้านโน้ตในโหมดมืด';
	@override String get preferGreyscale => 'ชอบสีเทามากกว่า';
	@override String get maxImageSize => 'ขนาดภาพสูงสุด';
	@override String get autoClearWhiteboardOnExit => 'ล้างกระดานไวท์บอร์ดอัตโนมัติ';
	@override String get disableEraserAfterUse => 'ปิดใช้งานยางลบโดยอัตโนมัติ';
	@override String get hideFingerDrawingToggle => 'ซ่อนตัวเลือกวาดด้วยนิ้ว';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'ปิดใช้งานวาดด้วยนิ้วโดยอัตโนมัติ';
	@override String get editorPromptRename => 'แจ้งเตือนให้คุณเปลี่ยนชื่อบันทึกใหม่';
	@override String get recentColorsDontSavePresets => 'อย่าบันทึกสีที่ตั้งไว้ล่วงหน้าในสีที่ใช้ล่าสุด';
	@override String get recentColorsLength => 'จัดเก็บสีใหม่ล่าสุดกี่สี';
	@override String get printPageIndicators => 'ตัวชี้การพิมพ์';
	@override String get autosave => 'บันทึกอัตโนมัติ';
	@override String get shapeRecognitionDelay => 'ล่าช้าในการจดจำรูปร่าง';
	@override String get autoStraightenLines => 'ปรับเส้นให้ตรงอัตโนมัติ';
	@override String get simplifiedHomeLayout => 'วางผังแบบเรียบง่าย';
	@override String get customDataDir => 'กำหนดโฟลเดอร์เอง';
	@override String get sentry => 'รายงานข้อผิดพลาด';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsTh extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'เพิ่มความชัดเจนในการอ่านสำหรับผู้ใช้ที่มีสายตาเลือนราง';
	@override String get allowInsecureConnections => '(ไม่แนะนำ) อนุญาตให้ Saber เชื่อมต่อกับเซิร์ฟเวอร์ที่มีใบรับรองด้วยตนเอง/ไม่น่าเชื่อถือ';
	@override String get preferGreyscale => 'สำหรับแสดงผลอี-อิงค์';
	@override String get autoClearWhiteboardOnExit => 'ล้างกระดานไวท์บอร์ดหลังจากที่คุณออกจากแอป';
	@override String get disableEraserAfterUse => 'สลับกลับไปใช้ปากกาโดยอัตโนมัติหลังจากใช้ยางลบเสร็จ';
	@override String get maxImageSize => 'บีบอัดรูปภาพขนาดใหญ่';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingTh hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingTh._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'ปิดการใช้งานวาดด้วยนิ้วเมื่อตรวจพบสไตลัส';
	@override String get editorPromptRename => 'คุณสามารถเปลี่ยนชื่อบันทึกได้ในภายหลังเสมอ';
	@override String get printPageIndicators => 'แสดงตัวชี้หน้าในไฟล์ส่งออก';
	@override String get autosave => 'บันทึกอัตโนมัติหลังจากหน่วงเวลาเล็กน้อย หรือไม่บันทึกเลยก็ได้';
	@override String get shapeRecognitionDelay => 'อัปเดตตัวอย่างรูปร่างบ่อยแค่ไหน';
	@override String get autoStraightenLines => 'ยืดเส้นยาวให้ตรงโดยไม่ต้องใช้ปากกาเขียนรูปทรง';
	@override String get simplifiedHomeLayout => 'กำหนดความสูงคงที่สำหรับการแสดงตัวอย่างโน้ตแต่ละรายการ';
	@override String get shouldAlwaysAlertForUpdates => 'แจ้งข้อมูลอัปเดตให้ฉันทราบทันทีที่มีข้อมูลเพิ่มเติม';
	@override late final _TranslationsSettingsPrefDescriptionsSentryTh sentry = _TranslationsSettingsPrefDescriptionsSentryTh._(_root);
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesTh extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get system => 'ระบบ';
	@override String get light => 'สว่าง';
	@override String get dark => 'มืด';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesTh extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get auto => 'อัตโนมัติ';
	@override String get phone => 'โทรศัพท์';
	@override String get tablet => 'แท็บเล็ต';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerTh extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'เลือกสี';
}

// Path: settings.reset
class _TranslationsSettingsResetTh extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'รีเซ็ตตั้งค่านี้หรือไม่?';
	@override String get button => 'รีเซ็ต';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirTh extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'ยกเลิก';
	@override String get select => 'เลือก';
	@override String get mustBeEmpty => 'โฟลเดอร์ที่เลือกต้องว่างเปล่า';
	@override String get mustBeDoneSyncing => 'ตรวจสอบให้แน่ใจว่าซิงค์เสร็จสมบูรณ์ก่อนที่จะเปลี่ยนโฟลเดอร์';
	@override String get unsupported => 'ฟีเจอร์นี้ใช้งานได้เฉพาะนักพัฒนาเท่านั้น การใช้งานอาจทำให้ข้อมูลสูญหายได้';
}

// Path: login.form
class _TranslationsLoginFormTh extends TranslationsLoginFormEn {
	_TranslationsLoginFormTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'เมื่อเข้าสู่ระบบ คุณยอมรับ '),
		linkToPrivacyPolicy('ข้อตกลงและเงื่อนไขของนโยบายความเป็นส่วนตัว '),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusTh extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'ออกจากระบบแล้ว';
	@override String get tapToLogin => 'แตะเพื่อเข้าสู่ระบบด้วย Nextcloud';
	@override String hi({required Object u}) => 'สวัสดี ${u}!';
	@override String get almostDone => 'พร้อมสำหรับการซิงค์แล้ว แตะเพื่อเข้าสู่ระบบให้เสร็จสมบูรณ์';
	@override String get loggedIn => 'เข้าสู่ระบบด้วย Nextcloud';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepTh extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'เลือกตำแหน่งที่ต้องการจัดเก็บข้อมูล:';
	@override String get saberNcServer => 'เซิร์ฟเวอร์ Nextcloud ของ Saber';
	@override String get otherNcServer => 'เซิร์ฟเวอร์ Nextcloud อื่นๆ';
	@override String get serverUrl => 'URL เซิร์ฟเวอร์';
	@override String get loginWithSaber => 'เข้าสู่ระบบด้วย Saber';
	@override String get loginWithNextcloud => 'เข้าสู่ระบบด้วย Nextcloud';
	@override late final _TranslationsLoginNcLoginStepLoginFlowTh loginFlow = _TranslationsLoginNcLoginStepLoginFlowTh._(_root);
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepTh extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'เพื่อปกป้องข้อมูลของคุณ โปรดป้อนรหัสผ่านเข้ารหัสของคุณ:';
	@override String get newToSaber => 'เพิ่งเคยใช้ Saber ใช่ไหม? เพียงแค่ป้อนรหัสผ่านเข้ารหัสใหม่';
	@override String get encPassword => 'เข้ารหัส รหัสผ่าน';
	@override String get encFaqTitle => 'คำถามที่พบบ่อย';
	@override String get wrongEncPassword => 'ถอดรหัสล้มเหลวด้วยรหัสผ่านที่ให้มา โปรดลองป้อนรหัสผ่านอีกครั้ง';
	@override String get connectionFailed => 'เกิดข้อผิดพลาดเชื่อมต่อกับเซิร์ฟเวอร์ โปรดลองใหม่อีกครั้งในภายหลัง';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$Th._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$Th._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$Th._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksTh extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'หน้าแรกของเซิร์ฟเวอร์';
	@override String get deleteAccount => 'ลบบัญชี';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$Th extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$Th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get q => 'ถ้าฉันออกจากระบบ ฉันจะเสียบันทึกของฉันไปไหม?';
	@override String get a => 'ไม่ ข้อมูลของคุณจะยังคงอยู่ทั้งในอุปกรณ์ของคุณและบนเซิร์ฟเวอร์ ข้อมูลจะไม่ถูกซิงค์กับเซิร์ฟเวอร์จนกว่าคุณจะเข้าสู่ระบบอีกครั้ง โปรดตรวจสอบให้แน่ใจว่าการซิงค์เสร็จสมบูรณ์ก่อนออกจากระบบ เพื่อป้องกันการสูญเสียข้อมูล (ดูความคืบหน้าการซิงค์บนหน้าจอหลัก)';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$Th extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$Th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get q => 'ฉันจะเปลี่ยนรหัสผ่าน Nextcloud ของฉันได้อย่างไร?';
	@override String get a => 'เข้าไปที่เว็บไซต์เซิร์ฟเวอร์ของคุณแล้วล็อกอิน จากนั้นไปที่ การตั้งค่า > ความปลอดภัย > เปลี่ยนรหัสผ่าน คุณจะต้องล็อกเอาต์แล้วล็อกอินกลับเข้าไปใน Saber อีกครั้งหลังจากเปลี่ยนรหัสผ่านเสร็จแล้ว';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$Th extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$Th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get q => 'ฉันจะเปลี่ยนรหัสผ่านเข้ารหัสได้อย่างไร?';
	@override String get a => '0. ตรวจสอบให้แน่ใจว่าการซิงค์เสร็จสมบูรณ์แล้ว (ดูความคืบหน้าการซิงค์บนหน้าจอหลัก)\n1. ออกจากระบบ Saber\n2. ไปที่เว็บไซต์เซิร์ฟเวอร์ของคุณและลบโฟลเดอร์ \'Saber\' การทำเช่นนี้จะลบโน้ตทั้งหมดของคุณออกจากเซิร์ฟเวอร์\n3. เข้าสู่ระบบ Saber อีกครั้ง คุณสามารถเลือกรหัสผ่านการเข้ารหัสใหม่ได้เมื่อเข้าสู่ระบบ\n4. อย่าลืมออกจากระบบและเข้าสู่ระบบ Saber บนอุปกรณ์อื่นๆ ของคุณ';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$Th extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$Th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get q => 'ฉันจะลบบัญชีของฉันได้อย่างไร?';
	@override String get a => 'แตะที่ปุ่ม "${_root.profile.quickLinks.deleteAccount}" ด้านบน แล้วล็อกอินหากจำเป็น\nหากคุณใช้เซิร์ฟเวอร์ Saber อย่างเป็นทางการ บัญชีของคุณจะถูกลบหลังจาก 1 สัปดาห์ คุณสามารถติดต่อได้ที่ adilhanney@disroot.org ในช่วงเวลานี้เพื่อยกเลิกการลบ\nหากคุณใช้เซิร์ฟเวอร์ของบุคคลที่สาม อาจไม่มีตัวเลือกในการลบบัญชีของคุณ คุณจะต้องตรวจสอบนโยบายความเป็นส่วนตัวของเซิร์ฟเวอร์เพื่อดูข้อมูลเพิ่มเติม';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarTh extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'สลับสี (Ctrl C)';
	@override String get select => 'เลือก';
	@override String get toggleEraser => 'สลับใช้งานยางลบ (Ctrl E)';
	@override String get photo => 'รูปภาพ';
	@override String get text => 'ข้อความ';
	@override String get toggleFingerDrawing => 'สลับวาดภาพด้วยนิ้ว (Ctrl F)';
	@override String get undo => 'เลิกทำ';
	@override String get redo => 'ทำซ้ำ';
	@override String get export => 'ส่งออก (Ctrl Shift S)';
	@override String get exportAs => 'ส่งออกเป็น:';
	@override String get fullscreen => 'สลับโหมดเต็มหน้าจอ (F11)';
}

// Path: editor.pens
class _TranslationsEditorPensTh extends TranslationsEditorPensEn {
	_TranslationsEditorPensTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'ปากกาหมึกซึม';
	@override String get ballpointPen => 'ปากกาลูกลื่น';
	@override String get highlighter => 'ปากกาไฮไลท์';
	@override String get pencil => 'ดินสอ';
	@override String get shapePen => 'ปากการูปทรงต่างๆ';
	@override String get laserPointer => 'เลเซอร์พอยเตอร์';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsTh extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get size => 'ขนาด';
}

// Path: editor.colors
class _TranslationsEditorColorsTh extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'ตัวเลือกสี';
	@override String customBrightnessHue({required Object b, required Object h}) => 'กำหนดเอง ${b} ${h}';
	@override String customHue({required Object h}) => 'กำหนดเอง ${h}';
	@override String get dark => 'มืด';
	@override String get light => 'สว่าง';
	@override String get black => 'สีดำ';
	@override String get darkGrey => 'สีเทาเข้ม';
	@override String get grey => 'สีเทา';
	@override String get lightGrey => 'สีเทาอ่อน';
	@override String get white => 'สีขาว';
	@override String get red => 'สีแดง';
	@override String get green => 'สีเขียว';
	@override String get cyan => 'สีฟ้าอมเขียว';
	@override String get blue => 'สีน้ำเงิน';
	@override String get yellow => 'สีเหลือง';
	@override String get purple => 'สีม่วง';
	@override String get pink => 'สีชมพู';
	@override String get orange => 'สีส้ม';
	@override String get pastelRed => 'สีแดงพาสเทล';
	@override String get pastelOrange => 'สีส้มพาสเทล';
	@override String get pastelYellow => 'สีเหลืองพาสเทล';
	@override String get pastelGreen => 'สีเขียวพาสเทล';
	@override String get pastelCyan => 'สีฟ้าพาสเทล';
	@override String get pastelBlue => 'สีฟ้าพาสเทล';
	@override String get pastelPurple => 'สีม่วงพาสเทล';
	@override String get pastelPink => 'สีชมพูพาสเทล';
}

// Path: editor.imageOptions
class _TranslationsEditorImageOptionsTh extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'ตัวเลือกรูปภาพ';
	@override String get invertible => 'กลับด้านได้';
	@override String get download => 'ดาวน์โหลด';
	@override String get setAsBackground => 'ตั้งเป็นภาพพื้นหลัง';
	@override String get removeAsBackground => 'ลบออกจากพื้นหลัง';
	@override String get delete => 'ลบ';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarTh extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get delete => 'ลบ';
	@override String get duplicate => 'ทำซ้ำ';
}

// Path: editor.menu
class _TranslationsEditorMenuTh extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'เคลียร์ ${page}/${totalPages}';
	@override String get clearAllPages => 'เคลียร์ข้อมูลทุกหน้า';
	@override String get insertPage => 'แทรกหน้าด้านล่าง';
	@override String get duplicatePage => 'ทำซ้ำหน้า';
	@override String get deletePage => 'ลบหน้า';
	@override String get lineHeight => 'ความสูงเส้น';
	@override String get lineHeightDescription => 'นอกจากนี้ควบคุมขนาดตัวอักษรสำหรับบันทึกที่พิมพ์ด้วย';
	@override String get lineThickness => 'ความหนาเส้น';
	@override String get lineThicknessDescription => 'ความหนาเส้นพื้นหลัง';
	@override String get backgroundImageFit => 'ภาพพื้นหลังพอดี';
	@override String get backgroundPattern => 'ลวดลายพื้นหลัง';
	@override String get import => 'นำเข้า';
	@override String get watchServer => 'คอยตรวจสอบการอัปเดตบนเซิร์ฟเวอร์';
	@override String get watchServerReadOnly => 'การแก้ไขจะถูกปิดใช้งานในขณะที่กำลังเฝ้าดูเซิร์ฟเวอร์';
	@override late final _TranslationsEditorMenuBoxFitsTh boxFits = _TranslationsEditorMenuBoxFitsTh._(_root);
	@override late final _TranslationsEditorMenuBgPatternsTh bgPatterns = _TranslationsEditorMenuBgPatternsTh._(_root);
}

// Path: editor.readOnlyBanner
class _TranslationsEditorReadOnlyBannerTh extends TranslationsEditorReadOnlyBannerEn {
	_TranslationsEditorReadOnlyBannerTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'โหมดอ่านอย่างเดียว';
	@override String get corrupted => 'โหลดบันทึกไม่สำเร็จ อาจเสียหายหรือยังคงถูกดาวน์โหลดอยู่';
	@override String get watchingServer => 'คุณกำลังรับชมการอัปเดตบนเซิร์ฟเวอร์ การแก้ไขถูกปิดใช้งานในโหมดนี้';
}

// Path: editor.versionTooNew
class _TranslationsEditorVersionTooNewTh extends TranslationsEditorVersionTooNewEn {
	_TranslationsEditorVersionTooNewTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'บันทึกนี้ได้รับการแก้ไขโดยใช้ Saber เวอร์ชันใหม่กว่า';
	@override String get subtitle => 'การแก้ไขบันทึกนี้อาจทำให้ข้อมูลบางส่วนสูญหาย คุณต้องการเพิกเฉยต่อคำเตือนนี้และแก้ไขต่อไปหรือไม่?';
	@override String get allowEditing => 'อนุญาตให้แก้ไข';
}

// Path: editor.quill
class _TranslationsEditorQuillTh extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'พิมพ์ข้อความตรงนี้...';
}

// Path: editor.hud
class _TranslationsEditorHudTh extends TranslationsEditorHudEn {
	_TranslationsEditorHudTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'ปลดล็อกการซูม';
	@override String get lockZoom => 'ล็อคการซูม';
	@override String get unlockSingleFingerPan => 'เปิดใช้งานการเลื่อนด้วยนิ้วเดียว';
	@override String get lockSingleFingerPan => 'ปิดใช้งานการเลื่อนด้วยนิ้วเดียว';
	@override String get unlockAxisAlignedPan => 'ปลดล็อกการแพนกล้องเป็นแนวนอนหรือแนวตั้ง';
	@override String get lockAxisAlignedPan => 'ล็อกการแพนกล้องให้เป็นแนวนอนหรือแนวตั้ง';
}

// Path: sentry.consent.description
class _TranslationsSentryConsentDescriptionTh extends TranslationsSentryConsentDescriptionEn {
	_TranslationsSentryConsentDescriptionTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get question => 'ต้องการให้รายงานข้อผิดพลาดที่ไม่คาดคิดโดยอัตโนมัติหรือไม่? วิธีนี้ช่วยให้ฉันระบุและแก้ไขปัญหาได้เร็วขึ้น';
	@override String get scope => 'รายงานอาจมีข้อมูลเกี่ยวกับข้อผิดพลาดและอุปกรณ์ของคุณ เราพยายามอย่างเต็มที่ในการกรองข้อมูลส่วนบุคคลออก แต่ข้อมูลบางส่วนอาจยังคงหลงเหลืออยู่';
	@override String get currentlyOff => 'หากคุณอนุญาต ระบบจะเปิดใช้งานรายงานข้อผิดพลาดหลังจากที่คุณเปิดโปรแกรมใหม่';
	@override String get currentlyOn => 'หากคุณเพิกถอนความยินยอม โปรดรีสตาร์ทแอปเพื่อปิดใช้งานรายงานข้อผิดพลาด';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'เรียนรู้เพิ่มเติมได้ในนโยบายความเป็นส่วนตัว '),
		link('privacy policy'),
	]);
}

// Path: sentry.consent.answers
class _TranslationsSentryConsentAnswersTh extends TranslationsSentryConsentAnswersEn {
	_TranslationsSentryConsentAnswersTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get yes => 'ใช่';
	@override String get no => 'ไม่';
	@override String get later => 'ถามในภายหลัง';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingTh extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get shown => 'ป้องกันสลับโดยไม่ตั้งใจ';
	@override String get fixedOn => 'วาดด้วยนิ้วถูกตั้งค่าเปิดใช้งาน';
	@override String get fixedOff => 'วาดด้วยนิ้วถูกตั้งค่าเป็นปิดใช้งาน';
}

// Path: settings.prefDescriptions.sentry
class _TranslationsSettingsPrefDescriptionsSentryTh extends TranslationsSettingsPrefDescriptionsSentryEn {
	_TranslationsSettingsPrefDescriptionsSentryTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get active => 'ใช้งาน';
	@override String get inactive => 'ไม่ใช้งาน';
	@override String get activeUntilRestart => 'ใช้งานได้จนกว่าคุณจะรีสตาร์ทแอป';
	@override String get inactiveUntilRestart => 'ไม่ทำงานจนกว่าคุณจะรีสตาร์ทแอป';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowTh extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'โปรดอนุญาตให้ Saber เข้าถึงบัญชี Nextcloud ของคุณ';
	@override String get followPrompts => 'โปรดทำตามคำแนะนำในหน้าจอ Nextcloud';
	@override String get browserDidntOpen => 'หน้าเข้าสู่ระบบไม่เปิดใช่ไหม? คลิกที่นี่';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$Th extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$Th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get q => 'รหัสผ่านสำหรับเข้ารหัสคืออะไร? ทำไมต้องใช้รหัสผ่านสองชุด?';
	@override String get a => 'รหัสผ่าน Nextcloud ใช้สำหรับเข้าถึงระบบคลาวด์ รหัสผ่านจะ "เข้ารหัส" ข้อมูลของคุณก่อนที่จะส่งไปยังระบบคลาวด์ แม้ว่าจะมีผู้อื่นเข้าถึงบัญชี Nextcloud ของคุณได้\nบันทึกของคุณจะยังปลอดภัยและได้รับการเข้ารหัสด้วยรหัสผ่านแยกต่างหาก ซึ่งเป็นการเพิ่มความปลอดภัยอีกชั้นเพื่อปกป้องข้อมูลของคุณ\nไม่มีใครสามารถเข้าถึงบันทึกของคุณบนเซิร์ฟเวอร์ได้หากไม่มีรหัสผ่านเข้ารหัส หมายความว่าหากคุณลืมรหัสผ่านการเข้ารหัส คุณจะเสียสิทธิ์ในการเข้าถึงข้อมูลของคุณเช่นกัน';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$Th extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$Th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get q => 'ฉันยังไม่ได้ตั้งรหัสผ่านสำหรับการเข้ารหัส ฉันจะหารหัสผ่านได้จากที่ไหน?';
	@override String get a => 'เลือกรหัสผ่านเข้ารหัสใหม่และป้อนลงในช่องด้านบน Saber\nจะสร้างคีย์เข้ารหัสของคุณจากรหัสผ่านนี้โดยอัตโนมัติ';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$Th extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$Th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get q => 'ฉันสามารถใช้รหัสผ่านเดียวกับบัญชี Nextcloud ของฉันได้หรือไม่?';
	@override String get a => 'ใช่ แต่โปรดจำไว้ว่า หากผู้ดูแลระบบเซิร์ฟเวอร์หรือบุคคลอื่นสามารถเข้าถึงบันทึกของคุณได้ง่ายขึ้น พวกเขาก็อาจเข้าถึงบัญชี Nextcloud ของคุณได้';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsTh extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get fill => 'ยืด';
	@override String get cover => 'ปิดบัง';
	@override String get contain => 'บรรจุ';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsTh extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsTh._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get none => 'ว่างเปล่า';
	@override String get college => 'เส้นบรรทัด';
	@override String get collegeRtl => 'เส้นบรรทัด (ด้านหลัง)';
	@override String get lined => 'เส้น';
	@override String get grid => 'ตาราง';
	@override String get dots => 'จุด';
	@override String get staffs => 'พนักงาน';
	@override String get tablature => 'แท็บลาเจอร์';
	@override String get cornell => 'คอร์เนลล์';
}
