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
class TranslationsZhHantTw extends Translations {
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
	@override late final _TranslationsCommonZhHantTw common = _TranslationsCommonZhHantTw._(_root);
	@override late final _TranslationsHomeZhHantTw home = _TranslationsHomeZhHantTw._(_root);
	@override late final _TranslationsSettingsZhHantTw settings = _TranslationsSettingsZhHantTw._(_root);
	@override late final _TranslationsLogsZhHantTw logs = _TranslationsLogsZhHantTw._(_root);
	@override late final _TranslationsLoginZhHantTw login = _TranslationsLoginZhHantTw._(_root);
	@override late final _TranslationsProfileZhHantTw profile = _TranslationsProfileZhHantTw._(_root);
	@override late final _TranslationsAppInfoZhHantTw appInfo = _TranslationsAppInfoZhHantTw._(_root);
	@override late final _TranslationsUpdateZhHantTw update = _TranslationsUpdateZhHantTw._(_root);
	@override late final _TranslationsEditorZhHantTw editor = _TranslationsEditorZhHantTw._(_root);
}

// Path: common
class _TranslationsCommonZhHantTw extends TranslationsCommonEn {
	_TranslationsCommonZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get done => '完成';
	@override String get continueBtn => '繼續';
	@override String get cancel => '取消';
}

// Path: home
class _TranslationsHomeZhHantTw extends TranslationsHomeEn {
	_TranslationsHomeZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsZhHantTw tabs = _TranslationsHomeTabsZhHantTw._(_root);
	@override late final _TranslationsHomeTitlesZhHantTw titles = _TranslationsHomeTitlesZhHantTw._(_root);
	@override late final _TranslationsHomeTooltipsZhHantTw tooltips = _TranslationsHomeTooltipsZhHantTw._(_root);
	@override late final _TranslationsHomeCreateZhHantTw create = _TranslationsHomeCreateZhHantTw._(_root);
	@override String get welcome => '歡迎使用 Saber';
	@override String get invalidFormat => '「不支援您選擇的檔案，請選擇 .sbn、.sbn2、.sba 或 .pdf 檔案。」';
	@override String get noFiles => '未找到檔案';
	@override String get noPreviewAvailable => '沒有預覽';
	@override String get createNewNote => '點擊 + 按鈕新增一個筆記';
	@override String get backFolder => '返回上一個資料夾';
	@override late final _TranslationsHomeNewFolderZhHantTw newFolder = _TranslationsHomeNewFolderZhHantTw._(_root);
	@override late final _TranslationsHomeRenameNoteZhHantTw renameNote = _TranslationsHomeRenameNoteZhHantTw._(_root);
	@override late final _TranslationsHomeMoveNoteZhHantTw moveNote = _TranslationsHomeMoveNoteZhHantTw._(_root);
	@override String get deleteNote => '刪除筆記';
	@override late final _TranslationsHomeRenameFolderZhHantTw renameFolder = _TranslationsHomeRenameFolderZhHantTw._(_root);
	@override late final _TranslationsHomeDeleteFolderZhHantTw deleteFolder = _TranslationsHomeDeleteFolderZhHantTw._(_root);
}

// Path: settings
class _TranslationsSettingsZhHantTw extends TranslationsSettingsEn {
	_TranslationsSettingsZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesZhHantTw prefCategories = _TranslationsSettingsPrefCategoriesZhHantTw._(_root);
	@override late final _TranslationsSettingsPrefLabelsZhHantTw prefLabels = _TranslationsSettingsPrefLabelsZhHantTw._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsZhHantTw prefDescriptions = _TranslationsSettingsPrefDescriptionsZhHantTw._(_root);
	@override late final _TranslationsSettingsThemeModesZhHantTw themeModes = _TranslationsSettingsThemeModesZhHantTw._(_root);
	@override late final _TranslationsSettingsLayoutSizesZhHantTw layoutSizes = _TranslationsSettingsLayoutSizesZhHantTw._(_root);
	@override late final _TranslationsSettingsAccentColorPickerZhHantTw accentColorPicker = _TranslationsSettingsAccentColorPickerZhHantTw._(_root);
	@override String get systemLanguage => '系統語言';
	@override List<String> get axisDirections => [
		'置頂',
		'靠右',
		'置底',
		'靠左',
	];
	@override late final _TranslationsSettingsResetZhHantTw reset = _TranslationsSettingsResetZhHantTw._(_root);
	@override String get resyncEverything => '全部重新同步';
	@override String get openDataDir => '開啟 Saber 資料夾';
	@override late final _TranslationsSettingsCustomDataDirZhHantTw customDataDir = _TranslationsSettingsCustomDataDirZhHantTw._(_root);
}

// Path: logs
class _TranslationsLogsZhHantTw extends TranslationsLogsEn {
	_TranslationsLogsZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get logs => '日誌';
	@override String get viewLogs => '查看日誌';
	@override String get debuggingInfo => '日誌包含對偵錯和開發有用的資訊';
	@override String get noLogs => '這裡沒有日誌！';
	@override String get logsAreTemporary => '日誌僅保留到您關閉應用程式為止';
}

// Path: login
class _TranslationsLoginZhHantTw extends TranslationsLoginEn {
	_TranslationsLoginZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '登入';
	@override late final _TranslationsLoginFormZhHantTw form = _TranslationsLoginFormZhHantTw._(_root);
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
	@override late final _TranslationsLoginStatusZhHantTw status = _TranslationsLoginStatusZhHantTw._(_root);
	@override late final _TranslationsLoginNcLoginStepZhHantTw ncLoginStep = _TranslationsLoginNcLoginStepZhHantTw._(_root);
	@override late final _TranslationsLoginEncLoginStepZhHantTw encLoginStep = _TranslationsLoginEncLoginStepZhHantTw._(_root);
}

// Path: profile
class _TranslationsProfileZhHantTw extends TranslationsProfileEn {
	_TranslationsProfileZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '我的個人資料';
	@override String get logout => '登出';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => '您已使用 ${used}，共 ${total} (${percent}%)';
	@override String get connectedTo => '連線到';
	@override late final _TranslationsProfileQuickLinksZhHantTw quickLinks = _TranslationsProfileQuickLinksZhHantTw._(_root);
	@override String get faqTitle => '常見問題';
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$ZhHantTw._(_root),
		_TranslationsProfile$faq$0i1$ZhHantTw._(_root),
		_TranslationsProfile$faq$0i2$ZhHantTw._(_root),
		_TranslationsProfile$faq$0i3$ZhHantTw._(_root),
	];
}

// Path: appInfo
class _TranslationsAppInfoZhHantTw extends TranslationsAppInfoEn {
	_TranslationsAppInfoZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  版權所有 © 2022-${buildYear}  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
	@override String get dirty => 'DIRTY';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => '點擊此處贊助我或購買更多儲存空間';
	@override String get licenseButton => '點擊此處查看更多許可證資訊';
	@override String get privacyPolicyButton => '點擊此處查看隱私權政策';
}

// Path: update
class _TranslationsUpdateZhHantTw extends TranslationsUpdateEn {
	_TranslationsUpdateZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => '可用更新';
	@override String get updateAvailableDescription => '新版本的應用程式已推出，有了以下變化:';
	@override String get update => '更新';
	@override String get downloadNotAvailableYet => '您的平台尚無法下載。請稍後回來查看。';
}

// Path: editor
class _TranslationsEditorZhHantTw extends TranslationsEditorEn {
	_TranslationsEditorZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarZhHantTw toolbar = _TranslationsEditorToolbarZhHantTw._(_root);
	@override late final _TranslationsEditorPensZhHantTw pens = _TranslationsEditorPensZhHantTw._(_root);
	@override late final _TranslationsEditorPenOptionsZhHantTw penOptions = _TranslationsEditorPenOptionsZhHantTw._(_root);
	@override late final _TranslationsEditorColorsZhHantTw colors = _TranslationsEditorColorsZhHantTw._(_root);
	@override late final _TranslationsEditorImageOptionsZhHantTw imageOptions = _TranslationsEditorImageOptionsZhHantTw._(_root);
	@override late final _TranslationsEditorSelectionBarZhHantTw selectionBar = _TranslationsEditorSelectionBarZhHantTw._(_root);
	@override late final _TranslationsEditorMenuZhHantTw menu = _TranslationsEditorMenuZhHantTw._(_root);
	@override late final _TranslationsEditorNewerFileFormatZhHantTw newerFileFormat = _TranslationsEditorNewerFileFormatZhHantTw._(_root);
	@override late final _TranslationsEditorQuillZhHantTw quill = _TranslationsEditorQuillZhHantTw._(_root);
	@override late final _TranslationsEditorHudZhHantTw hud = _TranslationsEditorHudZhHantTw._(_root);
	@override String get pages => '頁面';
	@override String get untitled => '無標題';
	@override String get needsToSaveBeforeExiting => '正在儲存您的變更...完成後您可以安全地退出編輯器';
}

// Path: home.tabs
class _TranslationsHomeTabsZhHantTw extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get home => '首頁';
	@override String get browse => '全部筆記';
	@override String get whiteboard => '白板';
	@override String get settings => '設定';
}

// Path: home.titles
class _TranslationsHomeTitlesZhHantTw extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get home => '最近筆記';
	@override String get browse => '瀏覽';
	@override String get whiteboard => '白板';
	@override String get settings => '設定';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsZhHantTw extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新增筆記';
	@override String get showUpdateDialog => '顯示更新對話框';
	@override String get exportNote => '匯出筆記';
}

// Path: home.create
class _TranslationsHomeCreateZhHantTw extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新增筆記';
	@override String get importNote => '匯入筆記';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderZhHantTw extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get newFolder => '新建資料夾';
	@override String get folderName => '資料夾名稱';
	@override String get create => '創建';
	@override String get folderNameEmpty => '資料夾名稱不可為空';
	@override String get folderNameContainsSlash => '資料夾名稱不能包含斜槓';
	@override String get folderNameExists => '資料夾已經存在';
}

// Path: home.renameNote
class _TranslationsHomeRenameNoteZhHantTw extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get renameNote => '重新命名筆記';
	@override String get noteName => '筆記名稱';
	@override String get rename => '重新命名';
	@override String get noteNameEmpty => '筆記名稱不可為空';
	@override String get noteNameContainsSlash => '筆記名稱不能包含斜槓';
	@override String get noteNameExists => '同名筆記已經存在';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteZhHantTw extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get moveNote => '移動筆記';
	@override String moveNotes({required Object n}) => '移動 ${n} 份筆記';
	@override String moveName({required Object f}) => '移動 ${f}';
	@override String get move => '移動';
	@override String renamedTo({required Object newName}) => '筆記將重新命名為 ${newName}';
	@override String get multipleRenamedTo => '「以下筆記將被重新命名：」"';
	@override String numberRenamedTo({required Object n}) => '${n} 份筆記將被重命名以避免衝突';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderZhHantTw extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => '重新命名資料夾';
	@override String get folderName => '資料夾名稱';
	@override String get rename => '重新命名';
	@override String get folderNameEmpty => '資烙夾名稱不能為空';
	@override String get folderNameContainsSlash => '資料夾名稱不能包含斜槓';
	@override String get folderNameExists => '已存在同名的資料夾';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderZhHantTw extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => '刪除資料夾';
	@override String deleteName({required Object f}) => '刪除 ${f}';
	@override String get delete => '刪除';
	@override String get alsoDeleteContents => '同時刪除該文件夾內的所有筆記';
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesZhHantTw extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get general => '一般';
	@override String get writing => '書寫';
	@override String get editor => '編輯器';
	@override String get performance => '效能';
	@override String get advanced => '進階';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsZhHantTw extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get locale => '應用程式語言';
	@override String get appTheme => '應用程式主題';
	@override String get platform => '主題類型';
	@override String get layoutSize => '佈局大小';
	@override String get customAccentColor => '自訂主題色';
	@override String get hyperlegibleFont => '易讀字體';
	@override String get shouldCheckForUpdates => '自動檢查 Saber 更新';
	@override String get shouldAlwaysAlertForUpdates => '更快的更新';
	@override String get allowInsecureConnections => '允許不安全的連結';
	@override String get editorToolbarAlignment => '編輯器工具列的對齊方式';
	@override String get editorToolbarShowInFullscreen => '在全螢幕模式中顯示編輯器工具列';
	@override String get editorAutoInvert => '在深色模式下使用反色筆記背景';
	@override String get preferGreyscale => '使用灰度顏色';
	@override String get maxImageSize => '最大圖片尺寸';
	@override String get autoClearWhiteboardOnExit => '退出應用程式後清除白板';
	@override String get disableEraserAfterUse => '自動禁用橡皮擦';
	@override String get hideFingerDrawingToggle => '隱藏手指繪圖切換開關';
	@override String get editorPromptRename => '提醒您重新命名新筆記';
	@override String get hideHomeBackgrounds => '隱藏主畫面上的背景';
	@override String get recentColorsDontSavePresets => '不要在最近的顏色中儲存預設顏色';
	@override String get recentColorsLength => '要儲存多少種最近的顏色';
	@override String get printPageIndicators => '列印頁碼';
	@override String get autosaveDelay => '自動儲存延遲';
	@override String get shapeRecognitionDelay => '形狀識別延遲';
	@override String get autoStraightenLines => '自動拉直線條';
	@override String get simplifiedHomeLayout => '簡化首頁佈局';
	@override String get customDataDir => '自訂 Saber 資料夾';
	@override String get pencilSoundSetting => '筆的音效';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsZhHantTw extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible 字體為低視力讀者提高易讀性';
	@override String get allowInsecureConnections => '（不推薦）允許Saber連結到具有自簽名/不受信任證書的伺服器';
	@override String get preferGreyscale => '用於電子紙螢幕';
	@override String get autoClearWhiteboardOnExit => '它仍會同步到您的其他裝置';
	@override String get disableEraserAfterUse => '使用橡皮擦後自動切換回筆';
	@override String get maxImageSize => '大於此大小的圖片將被壓縮';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingZhHantTw hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingZhHantTw._(_root);
	@override String get editorPromptRename => '您以後隨時可以重新命名筆記';
	@override String get hideHomeBackgrounds => '為了更乾淨的外觀';
	@override String get printPageIndicators => '在匯出中顯示頁碼';
	@override String get autosaveDelay => '自動儲存筆記之前等待多少時間';
	@override String get shapeRecognitionDelay => '多久更新一次形狀預覽';
	@override String get autoStraightenLines => '無需使用形狀筆即可拉直線條';
	@override String get simplifiedHomeLayout => '為每個筆記預覽設定固定高度';
	@override String get shouldAlwaysAlertForUpdates => '一旦有更新請告訴我';
	@override late final _TranslationsSettingsPrefDescriptionsPencilSoundSettingZhHantTw pencilSoundSetting = _TranslationsSettingsPrefDescriptionsPencilSoundSettingZhHantTw._(_root);
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesZhHantTw extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get system => '系統';
	@override String get light => '淺色';
	@override String get dark => '深色';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesZhHantTw extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get auto => '自動';
	@override String get phone => '手機';
	@override String get tablet => '平板';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerZhHantTw extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => '選取顏色';
}

// Path: settings.reset
class _TranslationsSettingsResetZhHantTw extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '重設此設定?';
	@override String get button => '重設';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirZhHantTw extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get cancel => '取消';
	@override String get select => '選擇';
	@override String get mustBeEmpty => '選擇的資料夾必須是空的';
	@override String get mustBeDoneSyncing => '更改資料夾之前確保同步已完成';
}

// Path: login.form
class _TranslationsLoginFormZhHantTw extends TranslationsLoginFormEn {
	_TranslationsLoginFormZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: '登入即表示你同意 '),
		linkToPrivacyPolicy('隱私政策'),
		const TextSpan(text: '。'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusZhHantTw extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => '已登出';
	@override String get tapToLogin => '點擊以使用 Nextcloud 登入';
	@override String hi({required Object u}) => '嗨，${u}!';
	@override String get almostDone => '即將同步，點擊即可完成登入';
	@override String get loggedIn => '已使用 Nextcloud 登入';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepZhHantTw extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => '選擇您要儲存資料的位置：';
	@override String get saberNcServer => 'Saber 的 Nextcloud 伺服器';
	@override String get otherNcServer => '其他 Nextcloud 伺服器';
	@override String get serverUrl => '伺服器網址';
	@override String get loginWithSaber => '使用 Saber 登入';
	@override String get loginWithNextcloud => '使用 Nextcloud 登入';
	@override late final _TranslationsLoginNcLoginStepLoginFlowZhHantTw loginFlow = _TranslationsLoginNcLoginStepLoginFlowZhHantTw._(_root);
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepZhHantTw extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => '為了保護您的資料，請輸入您的加密密碼：';
	@override String get newToSaber => '第一次使用 Saber？只需輸入新的加密密碼即可。';
	@override String get encPassword => '加密密碼';
	@override String get encFaqTitle => '常見問題';
	@override String get wrongEncPassword => '使用提供的密碼解密失敗。請嘗試再次輸入。';
	@override String get connectionFailed => '連線伺服器時出現問題。請稍後再試。';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$ZhHantTw._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$ZhHantTw._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$ZhHantTw._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksZhHantTw extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => '伺服器主頁';
	@override String get deleteAccount => '刪除帳戶';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$ZhHantTw extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$ZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '如果我登出了，我的筆記會不會不見？';
	@override String get a => '您的筆記將同時儲存您的裝置和伺服器上。直到您重新登入，它們才會被同步到伺服器上。在登出前，請確保同步工作已經完成，這樣您就不會丟失任何資料（在主畫面上可以看到同步進度）。';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$ZhHantTw extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$ZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '如何更改我的Nextcloud密碼？';
	@override String get a => '進入您的伺服器網站並登入，然後進入設定>安全>更改密碼。更改密碼後，您需要登出並重新登入到Saber。';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$ZhHantTw extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$ZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '如何更改我的加密密碼？';
	@override String get a => '1. 登出Saber，在登出前確保同步已經完成，這樣您就不會丟失任何資料（在主畫面上可以看到同步進度）。\n2. 進入您的伺服器網站並登入，刪除「Saber」資料夾，這將從伺服器上刪除您所有的筆記。\n3. 重新登入到Saber，您可以在登入時選擇一個新的加密密碼。\n4. 也不要忘記在您的其他裝置上登出並重新登入Saber。';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$ZhHantTw extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$ZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '如何刪除我的帳戶？';
	@override String get a => '點擊上面的「${_root.profile.quickLinks.deleteAccount}」按鈕，如果需要請登入。\n如果您使用的是官方Saber伺服器，您的帳戶將在一周的寬限期後被刪除，您可以在此期間由電子郵件聯繫我：adilhanney@disroot.org，以取消刪除。如果您使用的是第三方伺服器，則可能沒有刪除帳戶的選項，您需要查閱伺服器的隱私權政策以了解更多資訊。';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarZhHantTw extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => '切換顏色 (Ctrl C)';
	@override String get select => '選擇';
	@override String get toggleEraser => '切換橡皮擦 (Ctrl E)';
	@override String get photo => '照片';
	@override String get text => '文本';
	@override String get toggleFingerDrawing => '切換手寫 (Ctrl F)';
	@override String get undo => '復原';
	@override String get redo => '重做';
	@override String get export => '匯出 (Ctrl Shift S)';
	@override String get exportAs => '匯出為：';
	@override String get fullscreen => '切換到全螢幕 (F11)';
}

// Path: editor.pens
class _TranslationsEditorPensZhHantTw extends TranslationsEditorPensEn {
	_TranslationsEditorPensZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => '鋼筆';
	@override String get ballpointPen => '原子筆';
	@override String get highlighter => '螢光筆';
	@override String get pencil => '鉛筆';
	@override String get shapePen => '塑形筆';
	@override String get laserPointer => '雷射筆';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsZhHantTw extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get size => '粗細';
}

// Path: editor.colors
class _TranslationsEditorColorsZhHantTw extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => '顏色選擇器';
	@override String customBrightnessHue({required Object b, required Object h}) => '自訂的 ${b} ${h}';
	@override String customHue({required Object h}) => '自訂的 ${h}';
	@override String get dark => '黑色';
	@override String get light => '白色';
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
class _TranslationsEditorImageOptionsZhHantTw extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get title => '圖片選項';
	@override String get invertible => '反轉顏色';
	@override String get download => '下載';
	@override String get setAsBackground => '設為背景';
	@override String get removeAsBackground => '移除作為背景';
	@override String get delete => '刪除';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarZhHantTw extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get delete => '刪除';
	@override String get duplicate => '複製';
}

// Path: editor.menu
class _TranslationsEditorMenuZhHantTw extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => '清除頁面 ${page}/${totalPages}';
	@override String get clearAllPages => '清除所有頁面';
	@override String get insertPage => '插入以下頁面';
	@override String get duplicatePage => '複製頁面';
	@override String get deletePage => '刪除頁面';
	@override String get lineHeight => '行高';
	@override String get lineHeightDescription => '同時控制輸入筆記的文字大小';
	@override String get backgroundImageFit => '適應背景圖片';
	@override String get backgroundPattern => '背景圖案';
	@override String get import => '匯入';
	@override String get watchServer => '監視伺服器的更新';
	@override String get watchServerReadOnly => '監視伺服器時無法進行編輯';
	@override late final _TranslationsEditorMenuBoxFitsZhHantTw boxFits = _TranslationsEditorMenuBoxFitsZhHantTw._(_root);
	@override late final _TranslationsEditorMenuBgPatternsZhHantTw bgPatterns = _TranslationsEditorMenuBgPatternsZhHantTw._(_root);
	@override String get lineThickness => '線厚度';
	@override String get lineThicknessDescription => '背景線厚度';
}

// Path: editor.newerFileFormat
class _TranslationsEditorNewerFileFormatZhHantTw extends TranslationsEditorNewerFileFormatEn {
	_TranslationsEditorNewerFileFormatZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => '唯讀模式';
	@override String get title => '這篇筆記是使用較新版本的 Saber 編輯的';
	@override String get subtitle => '編輯此筆記可能會導致某些資訊遺失。 您想忽略它並編輯它嗎？';
	@override String get allowEditing => '允許編輯';
}

// Path: editor.quill
class _TranslationsEditorQuillZhHantTw extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => '在這裡輸入一些內容...';
}

// Path: editor.hud
class _TranslationsEditorHudZhHantTw extends TranslationsEditorHudEn {
	_TranslationsEditorHudZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => '解鎖縮放';
	@override String get lockZoom => '鎖定縮放';
	@override String get unlockSingleFingerPan => '啟用單指平移';
	@override String get lockSingleFingerPan => '禁用單指平移';
	@override String get unlockAxisAlignedPan => '解鎖水平或垂直平移';
	@override String get lockAxisAlignedPan => '鎖定水平或垂直平移';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingZhHantTw extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get shown => '防止意外切換';
	@override String get fixedOn => '手指繪圖固定為啟用';
	@override String get fixedOff => '手指繪圖固定為禁用';
}

// Path: settings.prefDescriptions.pencilSoundSetting
class _TranslationsSettingsPrefDescriptionsPencilSoundSettingZhHantTw extends TranslationsSettingsPrefDescriptionsPencilSoundSettingEn {
	_TranslationsSettingsPrefDescriptionsPencilSoundSettingZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get off => '關閉';
	@override String get onButNotInSilentMode => '已啟用（除非處於靜音模式）';
	@override String get onAlways => '已啟用（即使在靜音模式下）';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowZhHantTw extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => '請授權 Saber 存取您的 Nextcloud 帳號';
	@override String get followPrompts => '請依照 Nextcloud 介面的提示進行操作';
	@override String get browserDidntOpen => '登入頁面打不開？點擊這裡';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$ZhHantTw extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$ZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '什麼是加密密碼？為什麼要使用兩個密碼？';
	@override String get a => 'Nextcloud 密碼用於存取雲端。加密密碼會在資料到達雲端之前混亂您的資料。\n即使有人訪問您的 Nextcloud 帳號，您的筆記也將保持安全並使用單獨的密碼進行加密。這為您提供了第二層安全保護來保護您的資料。\n如果沒有加密密碼，任何人都無法存取伺服器上的筆記，但這也意味著如果您忘記加密密碼，您將無法存取您的資料。';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$ZhHantTw extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$ZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '我還沒有設定加密密碼。我在哪裡可以得到它？';
	@override String get a => '選擇一個新的加密密碼並在上面輸入。\nSaber 將自動根據該密碼產生您的加密金鑰。';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$ZhHantTw extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$ZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get q => '我可以使用與 Nextcloud 帳號相同的密碼嗎？';
	@override String get a => '可以，但請記住如果伺服器管理員或其他人獲得了您的 Nextcloud 帳號的存取權限，他們將更容易存取您的筆記。';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsZhHantTw extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get fill => '拉伸';
	@override String get cover => '覆蓋';
	@override String get contain => '包含';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsZhHantTw extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsZhHantTw._(TranslationsZhHantTw root) : this._root = root, super.internal(root);

	final TranslationsZhHantTw _root; // ignore: unused_field

	// Translations
	@override String get none => '空白';
	@override String get college => 'College-ruled';
	@override String get collegeRtl => 'College-ruled (反向)';
	@override String get lined => '橫線';
	@override String get grid => '網格';
	@override String get dots => '點';
	@override String get staffs => '五線譜';
	@override String get tablature => '指法譜';
	@override String get cornell => '康乃爾';
}
