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
class TranslationsZhHantTw extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhHantTw({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhHantTw,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <zh-Hant-TW>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsZhHantTw _root = this; // ignore: unused_field

	@override 
	TranslationsZhHantTw $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhHantTw(meta: meta ?? this.$meta);

	// Translations
	@override late final Translations$common$zh_Hant_TW common = Translations$common$zh_Hant_TW.internal(_root);
	@override late final Translations$home$zh_Hant_TW home = Translations$home$zh_Hant_TW.internal(_root);
	@override late final Translations$sentry$zh_Hant_TW sentry = Translations$sentry$zh_Hant_TW.internal(_root);
	@override late final Translations$settings$zh_Hant_TW settings = Translations$settings$zh_Hant_TW.internal(_root);
	@override late final Translations$logs$zh_Hant_TW logs = Translations$logs$zh_Hant_TW.internal(_root);
	@override late final Translations$login$zh_Hant_TW login = Translations$login$zh_Hant_TW.internal(_root);
	@override late final Translations$profile$zh_Hant_TW profile = Translations$profile$zh_Hant_TW.internal(_root);
	@override late final Translations$appInfo$zh_Hant_TW appInfo = Translations$appInfo$zh_Hant_TW.internal(_root);
	@override late final Translations$update$zh_Hant_TW update = Translations$update$zh_Hant_TW.internal(_root);
	@override late final Translations$editor$zh_Hant_TW editor = Translations$editor$zh_Hant_TW.internal(_root);
}

// Path: common
class Translations$common$zh_Hant_TW extends Translations$common$en {
	Translations$common$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get done => '完成';
	@override String get continueBtn => '繼續';
	@override String get cancel => '取消';
}

// Path: home
class Translations$home$zh_Hant_TW extends Translations$home$en {
	Translations$home$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override late final Translations$home$tabs$zh_Hant_TW tabs = Translations$home$tabs$zh_Hant_TW.internal(_root);
	@override late final Translations$home$titles$zh_Hant_TW titles = Translations$home$titles$zh_Hant_TW.internal(_root);
	@override late final Translations$home$tooltips$zh_Hant_TW tooltips = Translations$home$tooltips$zh_Hant_TW.internal(_root);
	@override late final Translations$home$create$zh_Hant_TW create = Translations$home$create$zh_Hant_TW.internal(_root);
	@override String get welcome => '歡迎使用 Saber';
	@override String get invalidFormat => '不支援您選取的檔案，請選擇 .sbn、.sbn2、.sba 或 .pdf 檔案。';
	@override String get noFiles => '未找到檔案';
	@override String get noPreviewAvailable => '無可用的預覽';
	@override String get createNewNote => '點擊 + 按鈕新增筆記';
	@override String get backFolder => '返回上一個資料夾';
	@override late final Translations$home$newFolder$zh_Hant_TW newFolder = Translations$home$newFolder$zh_Hant_TW.internal(_root);
	@override late final Translations$home$renameNote$zh_Hant_TW renameNote = Translations$home$renameNote$zh_Hant_TW.internal(_root);
	@override late final Translations$home$moveNote$zh_Hant_TW moveNote = Translations$home$moveNote$zh_Hant_TW.internal(_root);
	@override String get deleteNote => '刪除筆記';
	@override late final Translations$home$deleteNoteDialog$zh_Hant_TW deleteNoteDialog = Translations$home$deleteNoteDialog$zh_Hant_TW.internal(_root);
	@override late final Translations$home$renameFolder$zh_Hant_TW renameFolder = Translations$home$renameFolder$zh_Hant_TW.internal(_root);
	@override late final Translations$home$deleteFolder$zh_Hant_TW deleteFolder = Translations$home$deleteFolder$zh_Hant_TW.internal(_root);
	@override late final Translations$home$sort$zh_Hant_TW sort = Translations$home$sort$zh_Hant_TW.internal(_root);
	@override late final Translations$home$layout$zh_Hant_TW layout = Translations$home$layout$zh_Hant_TW.internal(_root);
}

// Path: sentry
class Translations$sentry$zh_Hant_TW extends Translations$sentry$en {
	Translations$sentry$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override late final Translations$sentry$consent$zh_Hant_TW consent = Translations$sentry$consent$zh_Hant_TW.internal(_root);
}

// Path: settings
class Translations$settings$zh_Hant_TW extends Translations$settings$en {
	Translations$settings$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override late final Translations$settings$prefCategories$zh_Hant_TW prefCategories = Translations$settings$prefCategories$zh_Hant_TW.internal(_root);
	@override late final Translations$settings$prefLabels$zh_Hant_TW prefLabels = Translations$settings$prefLabels$zh_Hant_TW.internal(_root);
	@override late final Translations$settings$prefDescriptions$zh_Hant_TW prefDescriptions = Translations$settings$prefDescriptions$zh_Hant_TW.internal(_root);
	@override late final Translations$settings$themeModes$zh_Hant_TW themeModes = Translations$settings$themeModes$zh_Hant_TW.internal(_root);
	@override late final Translations$settings$layoutSizes$zh_Hant_TW layoutSizes = Translations$settings$layoutSizes$zh_Hant_TW.internal(_root);
	@override late final Translations$settings$accentColorPicker$zh_Hant_TW accentColorPicker = Translations$settings$accentColorPicker$zh_Hant_TW.internal(_root);
	@override String get systemLanguage => '自動';
	@override List<String> get axisDirections => [
		'置頂',
		'靠右',
		'置底',
		'靠左',
	];
	@override late final Translations$settings$reset$zh_Hant_TW reset = Translations$settings$reset$zh_Hant_TW.internal(_root);
	@override String get resyncEverything => '全部重新同步';
	@override String get openDataDir => '開啟 Saber 資料夾';
	@override late final Translations$settings$customDataDir$zh_Hant_TW customDataDir = Translations$settings$customDataDir$zh_Hant_TW.internal(_root);
	@override String get autosaveDisabled => '永不';
	@override String get shapeRecognitionDisabled => '永不';
}

// Path: logs
class Translations$logs$zh_Hant_TW extends Translations$logs$en {
	Translations$logs$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get logs => '紀錄檔';
	@override String get viewLogs => '檢視紀錄檔';
	@override String get debuggingInfo => '紀錄檔包含對除錯與開發有用的資訊';
	@override String get noLogs => '此處沒有紀錄檔！';
	@override String get useTheApp => '當您使用此應用程式時，紀錄檔將顯示於此處';
}

// Path: login
class Translations$login$zh_Hant_TW extends Translations$login$en {
	Translations$login$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '登入';
	@override late final Translations$login$form$zh_Hant_TW form = Translations$login$form$zh_Hant_TW.internal(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: '還沒有帳號？ '),
		linkToSignup('立即註冊'),
		const TextSpan(text: '！'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: '不是你？ '),
		undoLogin('選擇另一個帳號'),
		const TextSpan(text: '。'),
	]);
	@override late final Translations$login$status$zh_Hant_TW status = Translations$login$status$zh_Hant_TW.internal(_root);
	@override late final Translations$login$ncLoginStep$zh_Hant_TW ncLoginStep = Translations$login$ncLoginStep$zh_Hant_TW.internal(_root);
	@override late final Translations$login$encLoginStep$zh_Hant_TW encLoginStep = Translations$login$encLoginStep$zh_Hant_TW.internal(_root);
}

// Path: profile
class Translations$profile$zh_Hant_TW extends Translations$profile$en {
	Translations$profile$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '我的個人檔案';
	@override String get logout => '登出';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => '您已使用 ${used}，共 ${total} (${percent}%)';
	@override String get connectedTo => '連線到';
	@override late final Translations$profile$quickLinks$zh_Hant_TW quickLinks = Translations$profile$quickLinks$zh_Hant_TW.internal(_root);
	@override String get faqTitle => '常見問題';
	@override List<dynamic> get faq => [
		Translations$profile$faq$0$zh_Hant_TW.internal(_root),
		Translations$profile$faq$1$zh_Hant_TW.internal(_root),
		Translations$profile$faq$2$zh_Hant_TW.internal(_root),
		Translations$profile$faq$3$zh_Hant_TW.internal(_root),
	];
}

// Path: appInfo
class Translations$appInfo$zh_Hant_TW extends Translations$appInfo$en {
	Translations$appInfo$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  版權所有 © 2022-${buildYear}  Adil Hanney\n本程式不提供任何形式的保證。這是一款自由軟體，您可在特定條件下自由轉散發。';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => '點擊此處贊助我或購買更多儲存空間';
	@override String get licenseButton => '點擊此處檢視更多授權條款資訊';
	@override String get privacyPolicyButton => '點擊此處檢視隱私權政策';
}

// Path: update
class Translations$update$zh_Hant_TW extends Translations$update$en {
	Translations$update$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => '可用更新';
	@override String get updateAvailableDescription => '新版本的應用程式已推出：';
	@override String get update => '更新';
	@override String get downloadNotAvailableYet => '您的平台尚無法下載。請稍後再回來檢視。';
}

// Path: editor
class Translations$editor$zh_Hant_TW extends Translations$editor$en {
	Translations$editor$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override late final Translations$editor$toolbar$zh_Hant_TW toolbar = Translations$editor$toolbar$zh_Hant_TW.internal(_root);
	@override late final Translations$editor$pens$zh_Hant_TW pens = Translations$editor$pens$zh_Hant_TW.internal(_root);
	@override late final Translations$editor$penOptions$zh_Hant_TW penOptions = Translations$editor$penOptions$zh_Hant_TW.internal(_root);
	@override late final Translations$editor$colors$zh_Hant_TW colors = Translations$editor$colors$zh_Hant_TW.internal(_root);
	@override late final Translations$editor$imageOptions$zh_Hant_TW imageOptions = Translations$editor$imageOptions$zh_Hant_TW.internal(_root);
	@override late final Translations$editor$selectionBar$zh_Hant_TW selectionBar = Translations$editor$selectionBar$zh_Hant_TW.internal(_root);
	@override late final Translations$editor$menu$zh_Hant_TW menu = Translations$editor$menu$zh_Hant_TW.internal(_root);
	@override late final Translations$editor$readOnlyBanner$zh_Hant_TW readOnlyBanner = Translations$editor$readOnlyBanner$zh_Hant_TW.internal(_root);
	@override late final Translations$editor$versionTooNew$zh_Hant_TW versionTooNew = Translations$editor$versionTooNew$zh_Hant_TW.internal(_root);
	@override late final Translations$editor$quill$zh_Hant_TW quill = Translations$editor$quill$zh_Hant_TW.internal(_root);
	@override late final Translations$editor$hud$zh_Hant_TW hud = Translations$editor$hud$zh_Hant_TW.internal(_root);
	@override String get pages => '頁面';
	@override String get untitled => '無標題';
	@override String get needsToSaveBeforeExiting => '正在儲存您的變更……完成後您可以安全地結束編輯器';
}

// Path: home.tabs
class Translations$home$tabs$zh_Hant_TW extends Translations$home$tabs$en {
	Translations$home$tabs$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get home => '首頁';
	@override String get browse => '全部筆記';
	@override String get whiteboard => '白板';
	@override String get settings => '設定';
}

// Path: home.titles
class Translations$home$titles$zh_Hant_TW extends Translations$home$titles$en {
	Translations$home$titles$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get home => '最近筆記';
	@override String get browse => '瀏覽';
	@override String get whiteboard => '白板';
	@override String get settings => '設定';
}

// Path: home.tooltips
class Translations$home$tooltips$zh_Hant_TW extends Translations$home$tooltips$en {
	Translations$home$tooltips$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新增筆記';
	@override String get showUpdateDialog => '顯示更新對話框';
	@override String get exportNote => '匯出筆記';
}

// Path: home.create
class Translations$home$create$zh_Hant_TW extends Translations$home$create$en {
	Translations$home$create$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新增筆記';
	@override String get importNote => '匯入筆記';
}

// Path: home.newFolder
class Translations$home$newFolder$zh_Hant_TW extends Translations$home$newFolder$en {
	Translations$home$newFolder$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get newFolder => '新建資料夾';
	@override String get folderName => '資料夾名稱';
	@override String get create => '建立';
	@override String get folderNameEmpty => '資料夾名稱不可為空';
	@override String get folderNameContainsSlash => '資料夾名稱不能包含斜線';
	@override String get folderNameExists => '資料夾已經存在';
}

// Path: home.renameNote
class Translations$home$renameNote$zh_Hant_TW extends Translations$home$renameNote$en {
	Translations$home$renameNote$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get renameNote => '重新命名筆記';
	@override String get noteName => '筆記名稱';
	@override String get rename => '重新命名';
	@override String get noteNameEmpty => '筆記名稱不可為空';
	@override String get noteNameExists => '同名筆記已經存在';
	@override String get noteNameForbiddenCharacters => '筆記名稱包含禁止使用的字元';
	@override String get noteNameReserved => '筆記名稱為系統保留字';
}

// Path: home.moveNote
class Translations$home$moveNote$zh_Hant_TW extends Translations$home$moveNote$en {
	Translations$home$moveNote$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get moveNote => '移動筆記';
	@override String moveNotes({required Object n}) => '移動 ${n} 份筆記';
	@override String moveName({required Object f}) => '移動 ${f}';
	@override String get move => '移動';
	@override String renamedTo({required Object newName}) => '筆記將重新命名為 ${newName}';
	@override String get multipleRenamedTo => '以下筆記將被重新命名：';
	@override String numberRenamedTo({required Object n}) => '將重新命名 ${n} 份筆記以避免衝突';
}

// Path: home.deleteNoteDialog
class Translations$home$deleteNoteDialog$zh_Hant_TW extends Translations$home$deleteNoteDialog$en {
	Translations$home$deleteNoteDialog$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String deleteNotes({required Object n}) => '刪除 ${n} 份筆記';
	@override String deleteName({required Object f}) => '刪除 ${f}';
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n,
		one: '永久刪除選定的筆記？',
		other: '永久刪除選定的筆記？',
	);
	@override String get delete => '刪除';
}

// Path: home.renameFolder
class Translations$home$renameFolder$zh_Hant_TW extends Translations$home$renameFolder$en {
	Translations$home$renameFolder$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => '重新命名資料夾';
	@override String get folderName => '資料夾名稱';
	@override String get rename => '重新命名';
	@override String get folderNameEmpty => '資烙夾名稱不能為空';
	@override String get folderNameContainsSlash => '資料夾名稱不能包含斜線';
	@override String get folderNameExists => '已存在同名的資料夾';
}

// Path: home.deleteFolder
class Translations$home$deleteFolder$zh_Hant_TW extends Translations$home$deleteFolder$en {
	Translations$home$deleteFolder$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => '刪除資料夾';
	@override String deleteName({required Object f}) => '刪除 ${f}';
	@override String get delete => '刪除';
	@override String get alsoDeleteContents => '同時刪除該文件夾內的所有筆記';
}

// Path: home.sort
class Translations$home$sort$zh_Hant_TW extends Translations$home$sort$en {
	Translations$home$sort$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get sortBy => '依...排序';
	@override String get nameAToZ => '姓名（A-Z）';
	@override String get nameZToA => '姓名 (依字母排序)';
	@override String get lastModifiedNewToOld => '編輯（最新優先）';
	@override String get lastModifiedOldToNew => '編輯（最舊的在前）';
}

// Path: home.layout
class Translations$home$layout$zh_Hant_TW extends Translations$home$layout$en {
	Translations$home$layout$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get layout => '佈局';
	@override String get masonryGrid => '砌磚網格';
	@override String get simpleGrid => '簡單的網格';
}

// Path: sentry.consent
class Translations$sentry$consent$zh_Hant_TW extends Translations$sentry$consent$en {
	Translations$sentry$consent$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '協助改善 Saber？';
	@override late final Translations$sentry$consent$description$zh_Hant_TW description = Translations$sentry$consent$description$zh_Hant_TW.internal(_root);
	@override late final Translations$sentry$consent$answers$zh_Hant_TW answers = Translations$sentry$consent$answers$zh_Hant_TW.internal(_root);
}

// Path: settings.prefCategories
class Translations$settings$prefCategories$zh_Hant_TW extends Translations$settings$prefCategories$en {
	Translations$settings$prefCategories$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get general => '一般';
	@override String get writing => '書寫';
	@override String get editor => '編輯器';
	@override String get performance => '效能';
	@override String get advanced => '進階';
}

// Path: settings.prefLabels
class Translations$settings$prefLabels$zh_Hant_TW extends Translations$settings$prefLabels$en {
	Translations$settings$prefLabels$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get locale => '應用程式語言';
	@override String get appTheme => '應用程式主題';
	@override String get platform => '主題類型';
	@override String get layoutSize => '佈局大小';
	@override String get customAccentColor => '自訂主題色';
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible 字型';
	@override String get shouldCheckForUpdates => '自動檢查 Saber 更新';
	@override String get shouldAlwaysAlertForUpdates => '更快的更新';
	@override String get allowInsecureConnections => '允許不安全連線';
	@override String get editorToolbarAlignment => '編輯器工具列的對齊方式';
	@override String get editorToolbarShowInFullscreen => '在全螢幕模式中顯示編輯器工具列';
	@override String get editorAutoInvert => '在深色模式下使用反轉色筆記背景';
	@override String get preferGreyscale => '使用灰階顏色';
	@override String get maxImageSize => '最大圖片尺寸';
	@override String get autoClearWhiteboardOnExit => '自動清除白板';
	@override String get disableEraserAfterUse => '自動停用橡皮擦';
	@override String get hideFingerDrawingToggle => '隱藏手指繪圖切換開關';
	@override String get autoDisableFingerDrawingWhenStylusDetected => '自動停用手指繪圖';
	@override String get editorPromptRename => '提醒您重新命名新筆記';
	@override String get recentColorsDontSavePresets => '不要在最近的顏色中儲存預設顏色';
	@override String get recentColorsLength => '要儲存多少種最近的顏色';
	@override String get printPageIndicators => '列印頁碼';
	@override String get autosave => '自動儲存';
	@override String get shapeRecognitionDelay => '形狀辨識延遲';
	@override String get autoStraightenLines => '自動拉直線條';
	@override String get customDataDir => '自訂 Saber 資料夾';
	@override String get sentry => '錯誤回報';
}

// Path: settings.prefDescriptions
class Translations$settings$prefDescriptions$zh_Hant_TW extends Translations$settings$prefDescriptions$en {
	Translations$settings$prefDescriptions$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible 字型為低視力讀者提高易讀性';
	@override String get allowInsecureConnections => '（不推薦）允許 Saber 連線到有自行簽署/不受信任憑證的伺服器';
	@override String get preferGreyscale => '用於電子紙螢幕';
	@override String get autoClearWhiteboardOnExit => '在您結束應用程式後清除白板';
	@override String get disableEraserAfterUse => '使用橡皮擦後自動切換回筆';
	@override String get maxImageSize => '大於此大小的圖片將被壓縮';
	@override late final Translations$settings$prefDescriptions$hideFingerDrawing$zh_Hant_TW hideFingerDrawing = Translations$settings$prefDescriptions$hideFingerDrawing$zh_Hant_TW.internal(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => '偵測到觸控筆時自動停用手指繪圖';
	@override String get editorPromptRename => '您以後隨時可以重新命名筆記';
	@override String get printPageIndicators => '在匯出中顯示頁碼';
	@override String get autosave => '在短暫延遲後自動儲存，或永不儲存';
	@override String get shapeRecognitionDelay => '多久更新一次形狀預覽';
	@override String get autoStraightenLines => '不需要使用造型筆即可拉直線條';
	@override String get shouldAlwaysAlertForUpdates => '一旦有更新請告訴我';
	@override late final Translations$settings$prefDescriptions$sentry$zh_Hant_TW sentry = Translations$settings$prefDescriptions$sentry$zh_Hant_TW.internal(_root);
}

// Path: settings.themeModes
class Translations$settings$themeModes$zh_Hant_TW extends Translations$settings$themeModes$en {
	Translations$settings$themeModes$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get system => '系統';
	@override String get light => '淺色';
	@override String get dark => '深色';
}

// Path: settings.layoutSizes
class Translations$settings$layoutSizes$zh_Hant_TW extends Translations$settings$layoutSizes$en {
	Translations$settings$layoutSizes$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get auto => '自動';
	@override String get phone => '手機';
	@override String get tablet => '平板';
}

// Path: settings.accentColorPicker
class Translations$settings$accentColorPicker$zh_Hant_TW extends Translations$settings$accentColorPicker$en {
	Translations$settings$accentColorPicker$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => '選取顏色';
}

// Path: settings.reset
class Translations$settings$reset$zh_Hant_TW extends Translations$settings$reset$en {
	Translations$settings$reset$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '重設此設定？';
	@override String get button => '重設';
}

// Path: settings.customDataDir
class Translations$settings$customDataDir$zh_Hant_TW extends Translations$settings$customDataDir$en {
	Translations$settings$customDataDir$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get cancel => '取消';
	@override String get select => '選取';
	@override String get mustBeEmpty => '選取的資料夾必須是空的';
	@override String get mustBeDoneSyncing => '變更資料夾之前確保同步已完成';
	@override String get unsupported => '此功能目前僅適用於開發者，使用它可能會導致資料遺失。';
}

// Path: login.form
class Translations$login$form$zh_Hant_TW extends Translations$login$form$en {
	Translations$login$form$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: '登入即表示您同意 '),
		linkToPrivacyPolicy('隱私權政策'),
		const TextSpan(text: '。'),
	]);
}

// Path: login.status
class Translations$login$status$zh_Hant_TW extends Translations$login$status$en {
	Translations$login$status$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => '已登出';
	@override String get tapToLogin => '點擊以使用 Nextcloud 登入';
	@override String hi({required Object u}) => '嗨，${u}!';
	@override String get almostDone => '即將同步，點擊即可完成登入';
	@override String get loggedIn => '已使用 Nextcloud 登入';
}

// Path: login.ncLoginStep
class Translations$login$ncLoginStep$zh_Hant_TW extends Translations$login$ncLoginStep$en {
	Translations$login$ncLoginStep$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => '選擇您要儲存資料的位置：';
	@override String get saberNcServer => 'Saber 的 Nextcloud 伺服器';
	@override String get otherNcServer => '其他 Nextcloud 伺服器';
	@override String get serverUrl => '伺服器網址';
	@override String get loginWithSaber => '使用 Saber 登入';
	@override String get loginWithNextcloud => '使用 Nextcloud 登入';
	@override late final Translations$login$ncLoginStep$loginFlow$zh_Hant_TW loginFlow = Translations$login$ncLoginStep$loginFlow$zh_Hant_TW.internal(_root);
}

// Path: login.encLoginStep
class Translations$login$encLoginStep$zh_Hant_TW extends Translations$login$encLoginStep$en {
	Translations$login$encLoginStep$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => '為了保護您的資料，請輸入您的加密密碼：';
	@override String get newToSaber => '第一次使用 Saber？只需輸入新的加密密碼即可。';
	@override String get encPassword => '加密密碼';
	@override String get encFaqTitle => '常見問題';
	@override String get wrongEncPassword => '使用提供的密碼解密失敗。請嘗試再次輸入。';
	@override String get connectionFailed => '連線伺服器時出現問題。請稍後再試。';
	@override List<dynamic> get encFaq => [
		Translations$login$encLoginStep$encFaq$0$zh_Hant_TW.internal(_root),
		Translations$login$encLoginStep$encFaq$1$zh_Hant_TW.internal(_root),
		Translations$login$encLoginStep$encFaq$2$zh_Hant_TW.internal(_root),
	];
}

// Path: profile.quickLinks
class Translations$profile$quickLinks$zh_Hant_TW extends Translations$profile$quickLinks$en {
	Translations$profile$quickLinks$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => '伺服器首頁';
	@override String get deleteAccount => '刪除帳號';
}

// Path: profile.faq.0
class Translations$profile$faq$0$zh_Hant_TW extends Translations$profile$faq$0$en {
	Translations$profile$faq$0$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '如果我登出了，我的筆記會不會不見？';
	@override String get a => '您的筆記將同時儲存在您的裝置與伺服器上。直到您重新登入，它們才會被同步到伺服器上。在登出前，請確保同步工作已經完成，這樣您就不會遺失任何資料（在主畫面上可以看到同步進度）。';
}

// Path: profile.faq.1
class Translations$profile$faq$1$zh_Hant_TW extends Translations$profile$faq$1$en {
	Translations$profile$faq$1$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '如何變更我的 Nextcloud 密碼？';
	@override String get a => '進入您的伺服器網站並登入，然後進入「設定」→「安全」→「變更密碼」。更改密碼後，您必須登出並重新登入 Saber。';
}

// Path: profile.faq.2
class Translations$profile$faq$2$zh_Hant_TW extends Translations$profile$faq$2$en {
	Translations$profile$faq$2$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '如何變更我的加密密碼？';
	@override String get a => '0. 確定同步處理已完成（請參閱主畫面上的同步處理進度）。\n1. 登出 Saber，在登出前確保同步已經完成，這樣您就不會丟失任何資料（在主畫面上可以看到同步進度）。\n2. 進入您的伺服器網站並登入，刪除「Saber」資料夾，這將從伺服器上刪除您所有的筆記。\n3. 重新登入 Saber，您可以在登入時選擇一個新的加密密碼。\n4. 也不要忘記在您的其他裝置上登出並重新登入 Saber。';
}

// Path: profile.faq.3
class Translations$profile$faq$3$zh_Hant_TW extends Translations$profile$faq$3$en {
	Translations$profile$faq$3$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '如何刪除我的帳號？';
	@override String get a => '點選上面的「${_root.profile.quickLinks.deleteAccount}」按鈕，如果需要請登入。\n如果您使用的是官方 Saber 伺服器，您的帳戶將在一週的寬限期後被刪除，您可以在此期間用電子郵件聯絡我：adilhanney@disroot.org，以取消刪除。\n如果您使用的是第三方伺服器，則可能沒有刪除帳號的選項，您需要檢視伺服器的隱私權政策以了解更多資訊。';
}

// Path: editor.toolbar
class Translations$editor$toolbar$zh_Hant_TW extends Translations$editor$toolbar$en {
	Translations$editor$toolbar$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => '切換顏色 (Ctrl C)';
	@override String get select => '選取';
	@override String get toggleEraser => '切換橡皮擦 (Ctrl E)';
	@override String get photo => '影像';
	@override String get text => '文字';
	@override String get toggleFingerDrawing => '切換手指繪製 (Ctrl F)';
	@override String get undo => '復原';
	@override String get redo => '重做';
	@override String get export => '匯出 (Ctrl Shift S)';
	@override String get exportAs => '匯出為：';
	@override String get fullscreen => '切換全螢幕 (F11)';
}

// Path: editor.pens
class Translations$editor$pens$zh_Hant_TW extends Translations$editor$pens$en {
	Translations$editor$pens$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => '鋼筆';
	@override String get ballpointPen => '原子筆';
	@override String get highlighter => '螢光筆';
	@override String get pencil => '鉛筆';
	@override String get shapePen => '造型筆';
	@override String get laserPointer => '雷射筆';
}

// Path: editor.penOptions
class Translations$editor$penOptions$zh_Hant_TW extends Translations$editor$penOptions$en {
	Translations$editor$penOptions$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get size => '粗細';
}

// Path: editor.colors
class Translations$editor$colors$zh_Hant_TW extends Translations$editor$colors$en {
	Translations$editor$colors$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => '顏色選擇器';
	@override String customBrightnessHue({required Object b, required Object h}) => '自訂的 ${b} ${h}';
	@override String customHue({required Object h}) => '自訂的 ${h}';
	@override String get dark => '深色';
	@override String get light => '淺色';
	@override String get black => '黑色';
	@override String get darkGrey => '深灰色';
	@override String get grey => '灰色';
	@override String get lightGrey => '淺灰色';
	@override String get white => '白色';
	@override String get red => '紅色';
	@override String get green => '綠色';
	@override String get cyan => '青色';
	@override String get blue => '藍色';
	@override String get yellow => '黃色';
	@override String get purple => '紫色';
	@override String get pink => '粉紅色';
	@override String get orange => '橙色';
	@override String get pastelRed => '淡紅色';
	@override String get pastelOrange => '淡橙色';
	@override String get pastelYellow => '淡黃色';
	@override String get pastelGreen => '淡綠色';
	@override String get pastelCyan => '淡青色';
	@override String get pastelBlue => '淡藍色';
	@override String get pastelPurple => '淡紫色';
	@override String get pastelPink => '淡粉色';
}

// Path: editor.imageOptions
class Translations$editor$imageOptions$zh_Hant_TW extends Translations$editor$imageOptions$en {
	Translations$editor$imageOptions$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '影像選項';
	@override String get invertible => '反轉顏色';
	@override String get download => '下載';
	@override String get setAsBackground => '設為背景';
	@override String get removeAsBackground => '移除作為背景';
	@override String get delete => '刪除';
}

// Path: editor.selectionBar
class Translations$editor$selectionBar$zh_Hant_TW extends Translations$editor$selectionBar$en {
	Translations$editor$selectionBar$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get delete => '刪除';
	@override String get duplicate => '再製';
}

// Path: editor.menu
class Translations$editor$menu$zh_Hant_TW extends Translations$editor$menu$en {
	Translations$editor$menu$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => '清除頁面 ${page}/${totalPages}';
	@override String get clearAllPages => '清除所有頁面';
	@override String get insertPage => '插入以下頁面';
	@override String get duplicatePage => '再製頁面';
	@override String get deletePage => '刪除頁面';
	@override String get lineHeight => '行高';
	@override String get lineHeightDescription => '同時控制輸入筆記的文字大小';
	@override String get lineThickness => '線條粗細';
	@override String get lineThicknessDescription => '背景線條粗細';
	@override String get backgroundImageFit => '背景影像調整';
	@override String get backgroundPattern => '背景圖案';
	@override String get import => '匯入';
	@override String get watchServer => '監視伺服器的更新';
	@override String get watchServerReadOnly => '監視伺服器時無法進行編輯';
	@override late final Translations$editor$menu$boxFits$zh_Hant_TW boxFits = Translations$editor$menu$boxFits$zh_Hant_TW.internal(_root);
	@override late final Translations$editor$menu$bgPatterns$zh_Hant_TW bgPatterns = Translations$editor$menu$bgPatterns$zh_Hant_TW.internal(_root);
}

// Path: editor.readOnlyBanner
class Translations$editor$readOnlyBanner$zh_Hant_TW extends Translations$editor$readOnlyBanner$en {
	Translations$editor$readOnlyBanner$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '唯讀模式';
	@override String get watchingServer => '目前正在監控伺服器上的更新，在此模式下已停用編輯功能。';
	@override String get corrupted => '無法載入筆記，檔案可能已損壞或仍在下載中。';
}

// Path: editor.versionTooNew
class Translations$editor$versionTooNew$zh_Hant_TW extends Translations$editor$versionTooNew$en {
	Translations$editor$versionTooNew$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '這篇筆記是使用較新版本的 Saber 編輯的';
	@override String get subtitle => '編輯此筆記可能會導致某些資訊遺失。您要忽略並編輯它嗎？';
	@override String get allowEditing => '允許編輯';
}

// Path: editor.quill
class Translations$editor$quill$zh_Hant_TW extends Translations$editor$quill$en {
	Translations$editor$quill$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => '請在此輸入內容……';
}

// Path: editor.hud
class Translations$editor$hud$zh_Hant_TW extends Translations$editor$hud$en {
	Translations$editor$hud$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => '解鎖縮放';
	@override String get lockZoom => '鎖定縮放';
	@override String get unlockSingleFingerPan => '啟用單指平移';
	@override String get lockSingleFingerPan => '停用單指平移';
	@override String get unlockAxisAlignedPan => '解鎖水平或垂直平移';
	@override String get lockAxisAlignedPan => '鎖定水平或垂直平移';
}

// Path: sentry.consent.description
class Translations$sentry$consent$description$zh_Hant_TW extends Translations$sentry$consent$description$en {
	Translations$sentry$consent$description$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get question => '您想自動回報意外錯誤嗎？這可以協助我更快地辨識與解決問題。';
	@override String get scope => '報告可能包含有關錯誤與您的裝置資訊。我已經盡一切努力過濾了個人資料，但有些可能仍會保留。';
	@override String get currentlyOff => '若您同意，則重新啟動應用程式後將啟用錯誤回報。';
	@override String get currentlyOn => '如果您撤銷同意，請重新啟動該應用程式以停用錯誤回報。';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: '在 '),
		link('privacy policy'),
		const TextSpan(text: ' 中取得更多資訊。'),
	]);
}

// Path: sentry.consent.answers
class Translations$sentry$consent$answers$zh_Hant_TW extends Translations$sentry$consent$answers$en {
	Translations$sentry$consent$answers$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get yes => '同意';
	@override String get no => '不同意';
	@override String get later => '稍後再說';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class Translations$settings$prefDescriptions$hideFingerDrawing$zh_Hant_TW extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	Translations$settings$prefDescriptions$hideFingerDrawing$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get shown => '防止意外切換';
	@override String get fixedOn => '手指繪圖固定為啟用';
	@override String get fixedOff => '手指繪圖固定為停用';
}

// Path: settings.prefDescriptions.sentry
class Translations$settings$prefDescriptions$sentry$zh_Hant_TW extends Translations$settings$prefDescriptions$sentry$en {
	Translations$settings$prefDescriptions$sentry$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get active => '啟用';
	@override String get inactive => '停用';
	@override String get activeUntilRestart => '啟用直到您重新啟動應用程式';
	@override String get inactiveUntilRestart => '停用直到您重新啟動應用程式';
}

// Path: login.ncLoginStep.loginFlow
class Translations$login$ncLoginStep$loginFlow$zh_Hant_TW extends Translations$login$ncLoginStep$loginFlow$en {
	Translations$login$ncLoginStep$loginFlow$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => '請授權 Saber 存取您的 Nextcloud 帳號';
	@override String get followPrompts => '請依照 Nextcloud 介面的提示進行操作';
	@override String get browserDidntOpen => '登入頁面打不開？點擊這裡';
}

// Path: login.encLoginStep.encFaq.0
class Translations$login$encLoginStep$encFaq$0$zh_Hant_TW extends Translations$login$encLoginStep$encFaq$0$en {
	Translations$login$encLoginStep$encFaq$0$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '什麼是加密密碼？為什麼要使用兩個密碼？';
	@override String get a => 'Nextcloud 密碼用於存取雲端。加密密碼會在資料到達雲端之前加密您的資料。\n即使有其他人存取您的 Nextcloud 帳號，您的筆記也將保持安全並使用單獨的密碼進行加密。這為您提供了第二層安全保護來保護您的資料。\n如果沒有加密密碼，任何人都無法存取伺服器上的筆記，但這也意味著如果您忘記加密密碼，您將無法存取您的資料。';
}

// Path: login.encLoginStep.encFaq.1
class Translations$login$encLoginStep$encFaq$1$zh_Hant_TW extends Translations$login$encLoginStep$encFaq$1$en {
	Translations$login$encLoginStep$encFaq$1$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '我還沒設定加密密碼。該去哪裡取得呢？';
	@override String get a => '選擇一個新的加密密碼並在上方輸入。\nSaber 將自動根據該密碼產生您的加密金鑰。';
}

// Path: login.encLoginStep.encFaq.2
class Translations$login$encLoginStep$encFaq$2$zh_Hant_TW extends Translations$login$encLoginStep$encFaq$2$en {
	Translations$login$encLoginStep$encFaq$2$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '我可以使用與 Nextcloud 帳號相同的密碼嗎？';
	@override String get a => '可以，但請記住如果伺服器管理員或其他人獲得了您的 Nextcloud 帳號的存取權限，他們將更容易存取您的筆記。';
}

// Path: editor.menu.boxFits
class Translations$editor$menu$boxFits$zh_Hant_TW extends Translations$editor$menu$boxFits$en {
	Translations$editor$menu$boxFits$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get fill => '拉伸';
	@override String get cover => '覆蓋';
	@override String get contain => '包含';
}

// Path: editor.menu.bgPatterns
class Translations$editor$menu$bgPatterns$zh_Hant_TW extends Translations$editor$menu$bgPatterns$en {
	Translations$editor$menu$bgPatterns$zh_Hant_TW.internal(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get none => '空白';
	@override String get college => 'College-ruled';
	@override String get collegeRtl => 'College-ruled（反向）';
	@override String get lined => '橫線';
	@override String get grid => '網格';
	@override String get dots => '點';
	@override String get staffs => '五線譜';
	@override String get tablature => '指法譜';
	@override String get cornell => '康乃爾';
}
