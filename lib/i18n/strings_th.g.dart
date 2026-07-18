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
	@override late final _Translations$common$th common = _Translations$common$th._(_root);
	@override late final _Translations$home$th home = _Translations$home$th._(_root);
	@override late final _Translations$sentry$th sentry = _Translations$sentry$th._(_root);
	@override late final _Translations$settings$th settings = _Translations$settings$th._(_root);
	@override late final _Translations$logs$th logs = _Translations$logs$th._(_root);
	@override late final _Translations$login$th login = _Translations$login$th._(_root);
	@override late final _Translations$profile$th profile = _Translations$profile$th._(_root);
	@override late final _Translations$appInfo$th appInfo = _Translations$appInfo$th._(_root);
	@override late final _Translations$update$th update = _Translations$update$th._(_root);
	@override late final _Translations$editor$th editor = _Translations$editor$th._(_root);
}

// Path: common
class _Translations$common$th extends Translations$common$en {
	_Translations$common$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get done => 'เสร็จ';
	@override String get continueBtn => 'ดำเนินการต่อ';
	@override String get cancel => 'ยกเลิก';
}

// Path: home
class _Translations$home$th extends Translations$home$en {
	_Translations$home$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$th tabs = _Translations$home$tabs$th._(_root);
	@override late final _Translations$home$titles$th titles = _Translations$home$titles$th._(_root);
	@override late final _Translations$home$tooltips$th tooltips = _Translations$home$tooltips$th._(_root);
	@override late final _Translations$home$create$th create = _Translations$home$create$th._(_root);
	@override String get welcome => 'ยินดีต้อนรับสู่เซเบอร์';
	@override String get invalidFormat => 'ไฟล์ที่คุณเลือกไม่รองรับ โปรดเลือกไฟล์ประเภท sbn, sbn2, sba หรือ pdf แทน';
	@override String get noFiles => 'ไม่พบไฟล์';
	@override String get noPreviewAvailable => 'ไม่มีภาพตัวอย่าง';
	@override String get createNewNote => 'แตะปุ่ม + เพื่อสร้างบันทึกใหม่';
	@override String get backFolder => 'กลับไปยังโฟลเดอร์ก่อนหน้า';
	@override late final _Translations$home$newFolder$th newFolder = _Translations$home$newFolder$th._(_root);
	@override late final _Translations$home$renameNote$th renameNote = _Translations$home$renameNote$th._(_root);
	@override late final _Translations$home$moveNote$th moveNote = _Translations$home$moveNote$th._(_root);
	@override String get deleteNote => 'ลบบันทึก';
	@override late final _Translations$home$deleteNoteDialog$th deleteNoteDialog = _Translations$home$deleteNoteDialog$th._(_root);
	@override late final _Translations$home$renameFolder$th renameFolder = _Translations$home$renameFolder$th._(_root);
	@override late final _Translations$home$deleteFolder$th deleteFolder = _Translations$home$deleteFolder$th._(_root);
}

// Path: sentry
class _Translations$sentry$th extends Translations$sentry$en {
	_Translations$sentry$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$th consent = _Translations$sentry$consent$th._(_root);
}

// Path: settings
class _Translations$settings$th extends Translations$settings$en {
	_Translations$settings$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$th prefCategories = _Translations$settings$prefCategories$th._(_root);
	@override late final _Translations$settings$prefLabels$th prefLabels = _Translations$settings$prefLabels$th._(_root);
	@override late final _Translations$settings$prefDescriptions$th prefDescriptions = _Translations$settings$prefDescriptions$th._(_root);
	@override late final _Translations$settings$themeModes$th themeModes = _Translations$settings$themeModes$th._(_root);
	@override late final _Translations$settings$layoutSizes$th layoutSizes = _Translations$settings$layoutSizes$th._(_root);
	@override late final _Translations$settings$accentColorPicker$th accentColorPicker = _Translations$settings$accentColorPicker$th._(_root);
	@override String get systemLanguage => 'อัตโนมัติ';
	@override List<String> get axisDirections => [
		'บน',
		'ขวา',
		'ล่าง',
		'ซ้าย',
	];
	@override late final _Translations$settings$reset$th reset = _Translations$settings$reset$th._(_root);
	@override String get resyncEverything => 'ซิงค์ทุกอย่างใหม่';
	@override String get openDataDir => 'เปิดโฟลเดอร์ Saber';
	@override late final _Translations$settings$customDataDir$th customDataDir = _Translations$settings$customDataDir$th._(_root);
	@override String get autosaveDisabled => 'เคย';
	@override String get shapeRecognitionDisabled => 'เคย';
}

// Path: logs
class _Translations$logs$th extends Translations$logs$en {
	_Translations$logs$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get logs => 'บันทึก';
	@override String get viewLogs => 'ดูบันทึก';
	@override String get debuggingInfo => 'ไฟล์บันทึกข้อมูลมีข้อมูลที่เป็นประโยชน์สำหรับการแก้ไขข้อผิดพลาดและพัฒนา';
	@override String get noLogs => 'ไม่มีบันทึกข้อมูลใดๆ ที่นี่!';
	@override String get useTheApp => 'บันทึกการใช้งานแอปจะปรากฏที่นี่ขณะที่คุณใช้งาน';
}

// Path: login
class _Translations$login$th extends Translations$login$en {
	_Translations$login$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'เข้าสู่ระบบ';
	@override late final _Translations$login$form$th form = _Translations$login$form$th._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'ยังไม่มีบัญชีใช่ไหม? '),
		linkToSignup('สมัครตอนนี้'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'ไม่ใช่คุณใช่ไหม? '),
		undoLogin('เลือกบัญชีอื่น'),
	]);
	@override late final _Translations$login$status$th status = _Translations$login$status$th._(_root);
	@override late final _Translations$login$ncLoginStep$th ncLoginStep = _Translations$login$ncLoginStep$th._(_root);
	@override late final _Translations$login$encLoginStep$th encLoginStep = _Translations$login$encLoginStep$th._(_root);
}

// Path: profile
class _Translations$profile$th extends Translations$profile$en {
	_Translations$profile$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'โปรไฟล์ของฉัน';
	@override String get logout => 'ออกจากระบบ';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'คุณกำลังใช้ ${used} จาก ${total} (${percent}%)';
	@override String get connectedTo => 'เชื่อมต่อไปยัง';
	@override late final _Translations$profile$quickLinks$th quickLinks = _Translations$profile$quickLinks$th._(_root);
	@override String get faqTitle => 'คำถามที่พบบ่อย';
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$th._(_root),
		_Translations$profile$faq$1$th._(_root),
		_Translations$profile$faq$2$th._(_root),
		_Translations$profile$faq$3$th._(_root),
	];
}

// Path: appInfo
class _Translations$appInfo$th extends Translations$appInfo$en {
	_Translations$appInfo$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'สงวนลิขสิทธิ์ Saber © 2022-${buildYear} Adil Hanney\nโปรแกรมนี้ไม่มีการรับประกันใดๆ ทั้งสิ้น นี่คือซอฟต์แวร์ฟรี และคุณสามารถแจกจ่ายต่อได้ภายใต้เงื่อนไขบางประการ';
	@override String get debug => 'แก้ไขข้อผิดพลาด';
	@override String get sponsorButton => 'คลิกที่นี่เพื่อสนับสนุนฉัน หรือซื้อพื้นที่จัดเก็บเพิ่มเติม';
	@override String get licenseButton => 'คลิกที่นี่เพื่อดูข้อมูลใบอนุญาตเพิ่มเติม';
	@override String get privacyPolicyButton => 'แตะที่นี่เพื่อดูนโยบายความเป็นส่วนตัว';
}

// Path: update
class _Translations$update$th extends Translations$update$en {
	_Translations$update$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'มีอัปเดตแล้ว';
	@override String get updateAvailableDescription => 'แอปเวอร์ชันใหม่พร้อมใช้งานแล้ว:';
	@override String get update => 'อัปเดต';
	@override String get downloadNotAvailableYet => 'ไฟล์ดาวน์โหลดยังไม่พร้อมให้บริการสำหรับแพลตฟอร์มของคุณ โปรดตรวจสอบอีกครั้งในภายหลัง';
}

// Path: editor
class _Translations$editor$th extends Translations$editor$en {
	_Translations$editor$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$th toolbar = _Translations$editor$toolbar$th._(_root);
	@override late final _Translations$editor$pens$th pens = _Translations$editor$pens$th._(_root);
	@override late final _Translations$editor$penOptions$th penOptions = _Translations$editor$penOptions$th._(_root);
	@override late final _Translations$editor$colors$th colors = _Translations$editor$colors$th._(_root);
	@override late final _Translations$editor$imageOptions$th imageOptions = _Translations$editor$imageOptions$th._(_root);
	@override late final _Translations$editor$selectionBar$th selectionBar = _Translations$editor$selectionBar$th._(_root);
	@override late final _Translations$editor$menu$th menu = _Translations$editor$menu$th._(_root);
	@override late final _Translations$editor$readOnlyBanner$th readOnlyBanner = _Translations$editor$readOnlyBanner$th._(_root);
	@override late final _Translations$editor$versionTooNew$th versionTooNew = _Translations$editor$versionTooNew$th._(_root);
	@override late final _Translations$editor$quill$th quill = _Translations$editor$quill$th._(_root);
	@override late final _Translations$editor$hud$th hud = _Translations$editor$hud$th._(_root);
	@override String get pages => 'หน้า';
	@override String get untitled => 'ไม่มีชื่อ';
	@override String get needsToSaveBeforeExiting => 'กำลังบันทึกการเปลี่ยนแปลง... คุณสามารถออกจากโปรแกรมแก้ไขได้อย่างปลอดภัยเมื่อเสร็จสิ้น';
}

// Path: home.tabs
class _Translations$home$tabs$th extends Translations$home$tabs$en {
	_Translations$home$tabs$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get home => 'หน้าแรก';
	@override String get browse => 'เรียกดู';
	@override String get whiteboard => 'ไวท์บอร์ด';
	@override String get settings => 'ตั้งค่า';
}

// Path: home.titles
class _Translations$home$titles$th extends Translations$home$titles$en {
	_Translations$home$titles$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get home => 'บันทึกล่าสุด';
	@override String get browse => 'เรียกดู';
	@override String get whiteboard => 'ไวท์บอร์ด';
	@override String get settings => 'ตั้งค่า';
}

// Path: home.tooltips
class _Translations$home$tooltips$th extends Translations$home$tooltips$en {
	_Translations$home$tooltips$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'บันทึกใหม่';
	@override String get showUpdateDialog => 'แสดงหน้าต่างอัปเดต';
	@override String get exportNote => 'หมายเหตุส่งออก';
}

// Path: home.create
class _Translations$home$create$th extends Translations$home$create$en {
	_Translations$home$create$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'บันทึกใหม่';
	@override String get importNote => 'นำเข้าบันทึก';
}

// Path: home.newFolder
class _Translations$home$newFolder$th extends Translations$home$newFolder$en {
	_Translations$home$newFolder$th._(TranslationsTh root) : this._root = root, super.internal(root);

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
class _Translations$home$renameNote$th extends Translations$home$renameNote$en {
	_Translations$home$renameNote$th._(TranslationsTh root) : this._root = root, super.internal(root);

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
class _Translations$home$moveNote$th extends Translations$home$moveNote$en {
	_Translations$home$moveNote$th._(TranslationsTh root) : this._root = root, super.internal(root);

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

// Path: home.deleteNoteDialog
class _Translations$home$deleteNoteDialog$th extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(n,
		one: 'ลบโน้ตที่เลือกอย่างถาวร?',
		other: 'ลบโน้ตที่เลือกอย่างถาวร?',
	);
	@override String deleteNotes({required Object n}) => 'ลบโน้ต ${n}';
	@override String deleteName({required Object f}) => 'Xóa ${f}';
	@override String get delete => 'ลบ';
}

// Path: home.renameFolder
class _Translations$home$renameFolder$th extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$th._(TranslationsTh root) : this._root = root, super.internal(root);

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
class _Translations$home$deleteFolder$th extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'ลบโฟลเดอร์';
	@override String deleteName({required Object f}) => 'ลบ ${f}';
	@override String get delete => 'ลบ';
	@override String get alsoDeleteContents => 'ลบบันทึกทั้งหมดที่อยู่ในโฟลเดอร์นี้ด้วย';
}

// Path: sentry.consent
class _Translations$sentry$consent$th extends Translations$sentry$consent$en {
	_Translations$sentry$consent$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'ช่วยปรับปรุง Saber ได้ไหม?';
	@override late final _Translations$sentry$consent$description$th description = _Translations$sentry$consent$description$th._(_root);
	@override late final _Translations$sentry$consent$answers$th answers = _Translations$sentry$consent$answers$th._(_root);
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$th extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get general => 'ทั่วไป';
	@override String get writing => 'กำลังเขียน';
	@override String get editor => 'ผู้เรียบเรียง';
	@override String get performance => 'ประสิทธิภาพ';
	@override String get advanced => 'ขั้นสูง';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$th extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$th._(TranslationsTh root) : this._root = root, super.internal(root);

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
class _Translations$settings$prefDescriptions$th extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'เพิ่มความชัดเจนในการอ่านสำหรับผู้ใช้ที่มีสายตาเลือนราง';
	@override String get allowInsecureConnections => '(ไม่แนะนำ) อนุญาตให้ Saber เชื่อมต่อกับเซิร์ฟเวอร์ที่มีใบรับรองด้วยตนเอง/ไม่น่าเชื่อถือ';
	@override String get preferGreyscale => 'สำหรับแสดงผลอี-อิงค์';
	@override String get autoClearWhiteboardOnExit => 'ล้างกระดานไวท์บอร์ดหลังจากที่คุณออกจากแอป';
	@override String get disableEraserAfterUse => 'สลับกลับไปใช้ปากกาโดยอัตโนมัติหลังจากใช้ยางลบเสร็จ';
	@override String get maxImageSize => 'บีบอัดรูปภาพขนาดใหญ่';
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$th hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$th._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'ปิดการใช้งานวาดด้วยนิ้วเมื่อตรวจพบสไตลัส';
	@override String get editorPromptRename => 'คุณสามารถเปลี่ยนชื่อบันทึกได้ในภายหลังเสมอ';
	@override String get printPageIndicators => 'แสดงตัวชี้หน้าในไฟล์ส่งออก';
	@override String get autosave => 'บันทึกอัตโนมัติหลังจากหน่วงเวลาเล็กน้อย หรือไม่บันทึกเลยก็ได้';
	@override String get shapeRecognitionDelay => 'อัปเดตตัวอย่างรูปร่างบ่อยแค่ไหน';
	@override String get autoStraightenLines => 'ยืดเส้นยาวให้ตรงโดยไม่ต้องใช้ปากกาเขียนรูปทรง';
	@override String get simplifiedHomeLayout => 'กำหนดความสูงคงที่สำหรับการแสดงตัวอย่างโน้ตแต่ละรายการ';
	@override String get shouldAlwaysAlertForUpdates => 'แจ้งข้อมูลอัปเดตให้ฉันทราบทันทีที่มีข้อมูลเพิ่มเติม';
	@override late final _Translations$settings$prefDescriptions$sentry$th sentry = _Translations$settings$prefDescriptions$sentry$th._(_root);
}

// Path: settings.themeModes
class _Translations$settings$themeModes$th extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get system => 'ระบบ';
	@override String get light => 'สว่าง';
	@override String get dark => 'มืด';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$th extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get auto => 'อัตโนมัติ';
	@override String get phone => 'โทรศัพท์';
	@override String get tablet => 'แท็บเล็ต';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$th extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'เลือกสี';
}

// Path: settings.reset
class _Translations$settings$reset$th extends Translations$settings$reset$en {
	_Translations$settings$reset$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'รีเซ็ตตั้งค่านี้หรือไม่?';
	@override String get button => 'รีเซ็ต';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$th extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'ยกเลิก';
	@override String get select => 'เลือก';
	@override String get mustBeEmpty => 'โฟลเดอร์ที่เลือกต้องว่างเปล่า';
	@override String get mustBeDoneSyncing => 'ตรวจสอบให้แน่ใจว่าซิงค์เสร็จสมบูรณ์ก่อนที่จะเปลี่ยนโฟลเดอร์';
	@override String get unsupported => 'ฟีเจอร์นี้ใช้งานได้เฉพาะนักพัฒนาเท่านั้น การใช้งานอาจทำให้ข้อมูลสูญหายได้';
}

// Path: login.form
class _Translations$login$form$th extends Translations$login$form$en {
	_Translations$login$form$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'เมื่อเข้าสู่ระบบ คุณยอมรับ '),
		linkToPrivacyPolicy('ข้อตกลงและเงื่อนไขของนโยบายความเป็นส่วนตัว '),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _Translations$login$status$th extends Translations$login$status$en {
	_Translations$login$status$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'ออกจากระบบแล้ว';
	@override String get tapToLogin => 'แตะเพื่อเข้าสู่ระบบด้วย Nextcloud';
	@override String hi({required Object u}) => 'สวัสดี ${u}!';
	@override String get almostDone => 'พร้อมสำหรับการซิงค์แล้ว แตะเพื่อเข้าสู่ระบบให้เสร็จสมบูรณ์';
	@override String get loggedIn => 'เข้าสู่ระบบด้วย Nextcloud';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$th extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'เลือกตำแหน่งที่ต้องการจัดเก็บข้อมูล:';
	@override String get saberNcServer => 'เซิร์ฟเวอร์ Nextcloud ของ Saber';
	@override String get otherNcServer => 'เซิร์ฟเวอร์ Nextcloud อื่นๆ';
	@override String get serverUrl => 'URL เซิร์ฟเวอร์';
	@override String get loginWithSaber => 'เข้าสู่ระบบด้วย Saber';
	@override String get loginWithNextcloud => 'เข้าสู่ระบบด้วย Nextcloud';
	@override late final _Translations$login$ncLoginStep$loginFlow$th loginFlow = _Translations$login$ncLoginStep$loginFlow$th._(_root);
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$th extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'เพื่อปกป้องข้อมูลของคุณ โปรดป้อนรหัสผ่านเข้ารหัสของคุณ:';
	@override String get newToSaber => 'เพิ่งเคยใช้ Saber ใช่ไหม? เพียงแค่ป้อนรหัสผ่านเข้ารหัสใหม่';
	@override String get encPassword => 'เข้ารหัส รหัสผ่าน';
	@override String get encFaqTitle => 'คำถามที่พบบ่อย';
	@override String get wrongEncPassword => 'ถอดรหัสล้มเหลวด้วยรหัสผ่านที่ให้มา โปรดลองป้อนรหัสผ่านอีกครั้ง';
	@override String get connectionFailed => 'เกิดข้อผิดพลาดเชื่อมต่อกับเซิร์ฟเวอร์ โปรดลองใหม่อีกครั้งในภายหลัง';
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$th._(_root),
		_Translations$login$encLoginStep$encFaq$1$th._(_root),
		_Translations$login$encLoginStep$encFaq$2$th._(_root),
	];
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$th extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'หน้าแรกของเซิร์ฟเวอร์';
	@override String get deleteAccount => 'ลบบัญชี';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$th extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get q => 'ถ้าฉันออกจากระบบ ฉันจะเสียบันทึกของฉันไปไหม?';
	@override String get a => 'ไม่ ข้อมูลของคุณจะยังคงอยู่ทั้งในอุปกรณ์ของคุณและบนเซิร์ฟเวอร์ ข้อมูลจะไม่ถูกซิงค์กับเซิร์ฟเวอร์จนกว่าคุณจะเข้าสู่ระบบอีกครั้ง โปรดตรวจสอบให้แน่ใจว่าการซิงค์เสร็จสมบูรณ์ก่อนออกจากระบบ เพื่อป้องกันการสูญเสียข้อมูล (ดูความคืบหน้าการซิงค์บนหน้าจอหลัก)';
}

// Path: profile.faq.1
class _Translations$profile$faq$1$th extends Translations$profile$faq$1$en {
	_Translations$profile$faq$1$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get q => 'ฉันจะเปลี่ยนรหัสผ่าน Nextcloud ของฉันได้อย่างไร?';
	@override String get a => 'เข้าไปที่เว็บไซต์เซิร์ฟเวอร์ของคุณแล้วล็อกอิน จากนั้นไปที่ การตั้งค่า > ความปลอดภัย > เปลี่ยนรหัสผ่าน คุณจะต้องล็อกเอาต์แล้วล็อกอินกลับเข้าไปใน Saber อีกครั้งหลังจากเปลี่ยนรหัสผ่านเสร็จแล้ว';
}

// Path: profile.faq.2
class _Translations$profile$faq$2$th extends Translations$profile$faq$2$en {
	_Translations$profile$faq$2$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get q => 'ฉันจะเปลี่ยนรหัสผ่านเข้ารหัสได้อย่างไร?';
	@override String get a => '0. ตรวจสอบให้แน่ใจว่าการซิงค์เสร็จสมบูรณ์แล้ว (ดูความคืบหน้าการซิงค์บนหน้าจอหลัก)\n1. ออกจากระบบ Saber\n2. ไปที่เว็บไซต์เซิร์ฟเวอร์ของคุณและลบโฟลเดอร์ \'Saber\' การทำเช่นนี้จะลบโน้ตทั้งหมดของคุณออกจากเซิร์ฟเวอร์\n3. เข้าสู่ระบบ Saber อีกครั้ง คุณสามารถเลือกรหัสผ่านการเข้ารหัสใหม่ได้เมื่อเข้าสู่ระบบ\n4. อย่าลืมออกจากระบบและเข้าสู่ระบบ Saber บนอุปกรณ์อื่นๆ ของคุณ';
}

// Path: profile.faq.3
class _Translations$profile$faq$3$th extends Translations$profile$faq$3$en {
	_Translations$profile$faq$3$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get q => 'ฉันจะลบบัญชีของฉันได้อย่างไร?';
	@override String get a => 'แตะที่ปุ่ม "${_root.profile.quickLinks.deleteAccount}" ด้านบน แล้วล็อกอินหากจำเป็น\nหากคุณใช้เซิร์ฟเวอร์ Saber อย่างเป็นทางการ บัญชีของคุณจะถูกลบหลังจาก 1 สัปดาห์ คุณสามารถติดต่อได้ที่ adilhanney@disroot.org ในช่วงเวลานี้เพื่อยกเลิกการลบ\nหากคุณใช้เซิร์ฟเวอร์ของบุคคลที่สาม อาจไม่มีตัวเลือกในการลบบัญชีของคุณ คุณจะต้องตรวจสอบนโยบายความเป็นส่วนตัวของเซิร์ฟเวอร์เพื่อดูข้อมูลเพิ่มเติม';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$th extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$th._(TranslationsTh root) : this._root = root, super.internal(root);

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
class _Translations$editor$pens$th extends Translations$editor$pens$en {
	_Translations$editor$pens$th._(TranslationsTh root) : this._root = root, super.internal(root);

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
class _Translations$editor$penOptions$th extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get size => 'ขนาด';
}

// Path: editor.colors
class _Translations$editor$colors$th extends Translations$editor$colors$en {
	_Translations$editor$colors$th._(TranslationsTh root) : this._root = root, super.internal(root);

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
class _Translations$editor$imageOptions$th extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$th._(TranslationsTh root) : this._root = root, super.internal(root);

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
class _Translations$editor$selectionBar$th extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get delete => 'ลบ';
	@override String get duplicate => 'ทำซ้ำ';
}

// Path: editor.menu
class _Translations$editor$menu$th extends Translations$editor$menu$en {
	_Translations$editor$menu$th._(TranslationsTh root) : this._root = root, super.internal(root);

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
	@override late final _Translations$editor$menu$boxFits$th boxFits = _Translations$editor$menu$boxFits$th._(_root);
	@override late final _Translations$editor$menu$bgPatterns$th bgPatterns = _Translations$editor$menu$bgPatterns$th._(_root);
}

// Path: editor.readOnlyBanner
class _Translations$editor$readOnlyBanner$th extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'โหมดอ่านอย่างเดียว';
	@override String get corrupted => 'โหลดบันทึกไม่สำเร็จ อาจเสียหายหรือยังคงถูกดาวน์โหลดอยู่';
	@override String get watchingServer => 'คุณกำลังรับชมการอัปเดตบนเซิร์ฟเวอร์ การแก้ไขถูกปิดใช้งานในโหมดนี้';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$th extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get title => 'บันทึกนี้ได้รับการแก้ไขโดยใช้ Saber เวอร์ชันใหม่กว่า';
	@override String get subtitle => 'การแก้ไขบันทึกนี้อาจทำให้ข้อมูลบางส่วนสูญหาย คุณต้องการเพิกเฉยต่อคำเตือนนี้และแก้ไขต่อไปหรือไม่?';
	@override String get allowEditing => 'อนุญาตให้แก้ไข';
}

// Path: editor.quill
class _Translations$editor$quill$th extends Translations$editor$quill$en {
	_Translations$editor$quill$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'พิมพ์ข้อความตรงนี้...';
}

// Path: editor.hud
class _Translations$editor$hud$th extends Translations$editor$hud$en {
	_Translations$editor$hud$th._(TranslationsTh root) : this._root = root, super.internal(root);

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
class _Translations$sentry$consent$description$th extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$th._(TranslationsTh root) : this._root = root, super.internal(root);

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
class _Translations$sentry$consent$answers$th extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get yes => 'ใช่';
	@override String get no => 'ไม่';
	@override String get later => 'ถามในภายหลัง';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$th extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get shown => 'ป้องกันสลับโดยไม่ตั้งใจ';
	@override String get fixedOn => 'วาดด้วยนิ้วถูกตั้งค่าเปิดใช้งาน';
	@override String get fixedOff => 'วาดด้วยนิ้วถูกตั้งค่าเป็นปิดใช้งาน';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$th extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get active => 'ใช้งาน';
	@override String get inactive => 'ไม่ใช้งาน';
	@override String get activeUntilRestart => 'ใช้งานได้จนกว่าคุณจะรีสตาร์ทแอป';
	@override String get inactiveUntilRestart => 'ไม่ทำงานจนกว่าคุณจะรีสตาร์ทแอป';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$th extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'โปรดอนุญาตให้ Saber เข้าถึงบัญชี Nextcloud ของคุณ';
	@override String get followPrompts => 'โปรดทำตามคำแนะนำในหน้าจอ Nextcloud';
	@override String get browserDidntOpen => 'หน้าเข้าสู่ระบบไม่เปิดใช่ไหม? คลิกที่นี่';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$th extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get q => 'รหัสผ่านสำหรับเข้ารหัสคืออะไร? ทำไมต้องใช้รหัสผ่านสองชุด?';
	@override String get a => 'รหัสผ่าน Nextcloud ใช้สำหรับเข้าถึงระบบคลาวด์ รหัสผ่านจะ "เข้ารหัส" ข้อมูลของคุณก่อนที่จะส่งไปยังระบบคลาวด์ แม้ว่าจะมีผู้อื่นเข้าถึงบัญชี Nextcloud ของคุณได้\nบันทึกของคุณจะยังปลอดภัยและได้รับการเข้ารหัสด้วยรหัสผ่านแยกต่างหาก ซึ่งเป็นการเพิ่มความปลอดภัยอีกชั้นเพื่อปกป้องข้อมูลของคุณ\nไม่มีใครสามารถเข้าถึงบันทึกของคุณบนเซิร์ฟเวอร์ได้หากไม่มีรหัสผ่านเข้ารหัส หมายความว่าหากคุณลืมรหัสผ่านการเข้ารหัส คุณจะเสียสิทธิ์ในการเข้าถึงข้อมูลของคุณเช่นกัน';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$th extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get q => 'ฉันยังไม่ได้ตั้งรหัสผ่านสำหรับการเข้ารหัส ฉันจะหารหัสผ่านได้จากที่ไหน?';
	@override String get a => 'เลือกรหัสผ่านเข้ารหัสใหม่และป้อนลงในช่องด้านบน Saber\nจะสร้างคีย์เข้ารหัสของคุณจากรหัสผ่านนี้โดยอัตโนมัติ';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$th extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get q => 'ฉันสามารถใช้รหัสผ่านเดียวกับบัญชี Nextcloud ของฉันได้หรือไม่?';
	@override String get a => 'ใช่ แต่โปรดจำไว้ว่า หากผู้ดูแลระบบเซิร์ฟเวอร์หรือบุคคลอื่นสามารถเข้าถึงบันทึกของคุณได้ง่ายขึ้น พวกเขาก็อาจเข้าถึงบัญชี Nextcloud ของคุณได้';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$th extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$th._(TranslationsTh root) : this._root = root, super.internal(root);

	final TranslationsTh _root; // ignore: unused_field

	// Translations
	@override String get fill => 'ยืด';
	@override String get cover => 'ปิดบัง';
	@override String get contain => 'บรรจุ';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$th extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$th._(TranslationsTh root) : this._root = root, super.internal(root);

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
