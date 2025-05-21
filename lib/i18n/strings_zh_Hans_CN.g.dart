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
class TranslationsZhHansCn extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhHansCn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhHansCn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <zh-Hans-CN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsZhHansCn _root = this; // ignore: unused_field

	@override 
	TranslationsZhHansCn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhHansCn(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonZhHansCn common = _TranslationsCommonZhHansCn._(_root);
	@override late final _TranslationsHomeZhHansCn home = _TranslationsHomeZhHansCn._(_root);
	@override late final _TranslationsSettingsZhHansCn settings = _TranslationsSettingsZhHansCn._(_root);
	@override late final _TranslationsLogsZhHansCn logs = _TranslationsLogsZhHansCn._(_root);
	@override late final _TranslationsLoginZhHansCn login = _TranslationsLoginZhHansCn._(_root);
	@override late final _TranslationsProfileZhHansCn profile = _TranslationsProfileZhHansCn._(_root);
	@override late final _TranslationsAppInfoZhHansCn appInfo = _TranslationsAppInfoZhHansCn._(_root);
	@override late final _TranslationsUpdateZhHansCn update = _TranslationsUpdateZhHansCn._(_root);
	@override late final _TranslationsEditorZhHansCn editor = _TranslationsEditorZhHansCn._(_root);
}

// Path: common
class _TranslationsCommonZhHansCn extends TranslationsCommonEn {
	_TranslationsCommonZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get done => '完成';
	@override String get continueBtn => '继续';
	@override String get cancel => '取消';
}

// Path: home
class _TranslationsHomeZhHansCn extends TranslationsHomeEn {
	_TranslationsHomeZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsZhHansCn tabs = _TranslationsHomeTabsZhHansCn._(_root);
	@override late final _TranslationsHomeTitlesZhHansCn titles = _TranslationsHomeTitlesZhHansCn._(_root);
	@override late final _TranslationsHomeTooltipsZhHansCn tooltips = _TranslationsHomeTooltipsZhHansCn._(_root);
	@override late final _TranslationsHomeCreateZhHansCn create = _TranslationsHomeCreateZhHansCn._(_root);
	@override String get welcome => '欢迎使用 Saber';
	@override String get invalidFormat => '不支持该文件。请选择 .sbn、.sbn2、.sba 或 .pdf 文件。';
	@override String get noFiles => '未找到文件';
	@override String get noPreviewAvailable => '没有预览';
	@override String get createNewNote => '点击 + 按钮新建一个笔记';
	@override String get backFolder => '回到上一个文件夹';
	@override late final _TranslationsHomeNewFolderZhHansCn newFolder = _TranslationsHomeNewFolderZhHansCn._(_root);
	@override late final _TranslationsHomeRenameNoteZhHansCn renameNote = _TranslationsHomeRenameNoteZhHansCn._(_root);
	@override late final _TranslationsHomeMoveNoteZhHansCn moveNote = _TranslationsHomeMoveNoteZhHansCn._(_root);
	@override String get deleteNote => '删除笔记';
	@override late final _TranslationsHomeRenameFolderZhHansCn renameFolder = _TranslationsHomeRenameFolderZhHansCn._(_root);
	@override late final _TranslationsHomeDeleteFolderZhHansCn deleteFolder = _TranslationsHomeDeleteFolderZhHansCn._(_root);
}

// Path: settings
class _TranslationsSettingsZhHansCn extends TranslationsSettingsEn {
	_TranslationsSettingsZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesZhHansCn prefCategories = _TranslationsSettingsPrefCategoriesZhHansCn._(_root);
	@override late final _TranslationsSettingsPrefLabelsZhHansCn prefLabels = _TranslationsSettingsPrefLabelsZhHansCn._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsZhHansCn prefDescriptions = _TranslationsSettingsPrefDescriptionsZhHansCn._(_root);
	@override late final _TranslationsSettingsThemeModesZhHansCn themeModes = _TranslationsSettingsThemeModesZhHansCn._(_root);
	@override late final _TranslationsSettingsLayoutSizesZhHansCn layoutSizes = _TranslationsSettingsLayoutSizesZhHansCn._(_root);
	@override late final _TranslationsSettingsAccentColorPickerZhHansCn accentColorPicker = _TranslationsSettingsAccentColorPickerZhHansCn._(_root);
	@override String get systemLanguage => '系统语言';
	@override List<String> get axisDirections => [
		'上',
		'右',
		'下',
		'左',
	];
	@override late final _TranslationsSettingsResetZhHansCn reset = _TranslationsSettingsResetZhHansCn._(_root);
	@override String get resyncEverything => '重新同步所有';
	@override String get openDataDir => '打开 Saber 文件夹';
	@override late final _TranslationsSettingsCustomDataDirZhHansCn customDataDir = _TranslationsSettingsCustomDataDirZhHansCn._(_root);
}

// Path: logs
class _TranslationsLogsZhHansCn extends TranslationsLogsEn {
	_TranslationsLogsZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get logs => '日志';
	@override String get viewLogs => '查看日志';
	@override String get debuggingInfo => '日志包含对调试和开发有用的信息';
	@override String get noLogs => '这里没有日志！';
	@override String get logsAreTemporary => '日志仅保留到您关闭应用程序为止';
}

// Path: login
class _TranslationsLoginZhHansCn extends TranslationsLoginEn {
	_TranslationsLoginZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '登录';
	@override late final _TranslationsLoginFormZhHansCn form = _TranslationsLoginFormZhHansCn._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: '还没有帐户？ '),
		linkToSignup('立即注册'),
		const TextSpan(text: '！'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: '不是您吗？'),
		undoLogin('Choose another account'),
		const TextSpan(text: '.'),
	]);
	@override late final _TranslationsLoginStatusZhHansCn status = _TranslationsLoginStatusZhHansCn._(_root);
	@override late final _TranslationsLoginNcLoginStepZhHansCn ncLoginStep = _TranslationsLoginNcLoginStepZhHansCn._(_root);
	@override late final _TranslationsLoginEncLoginStepZhHansCn encLoginStep = _TranslationsLoginEncLoginStepZhHansCn._(_root);
}

// Path: profile
class _TranslationsProfileZhHansCn extends TranslationsProfileEn {
	_TranslationsProfileZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '我的用户资料';
	@override String get logout => '注销';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => '您已使用 ${used}，共 ${total}（${percent}%）';
	@override String get connectedTo => '连接到';
	@override late final _TranslationsProfileQuickLinksZhHansCn quickLinks = _TranslationsProfileQuickLinksZhHansCn._(_root);
	@override String get faqTitle => '常见问题解答';
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$ZhHansCn._(_root),
		_TranslationsProfile$faq$0i1$ZhHansCn._(_root),
		_TranslationsProfile$faq$0i2$ZhHansCn._(_root),
		_TranslationsProfile$faq$0i3$ZhHansCn._(_root),
	];
}

// Path: appInfo
class _TranslationsAppInfoZhHansCn extends TranslationsAppInfoEn {
	_TranslationsAppInfoZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  版权所有 © 2022-${buildYear}  Adil Hanney\nThis program comes with absolutely no warranty. This is free software, and you are welcome to redistribute it under certain conditions.';
	@override String get dirty => 'DIRTY';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => '点击此处赞助我或购买更多存储空间';
	@override String get licenseButton => '点击此处查看更多许可证信息';
	@override String get privacyPolicyButton => '点击此处查看隐私政策';
}

// Path: update
class _TranslationsUpdateZhHansCn extends TranslationsUpdateEn {
	_TranslationsUpdateZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => '可用更新';
	@override String get updateAvailableDescription => '该应用的新版本可用，具有以下变更：';
	@override String get update => '更新';
	@override String get downloadNotAvailableYet => '该下载在您的平台暂不可用。请稍后重试。';
}

// Path: editor
class _TranslationsEditorZhHansCn extends TranslationsEditorEn {
	_TranslationsEditorZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarZhHansCn toolbar = _TranslationsEditorToolbarZhHansCn._(_root);
	@override late final _TranslationsEditorPensZhHansCn pens = _TranslationsEditorPensZhHansCn._(_root);
	@override late final _TranslationsEditorPenOptionsZhHansCn penOptions = _TranslationsEditorPenOptionsZhHansCn._(_root);
	@override late final _TranslationsEditorColorsZhHansCn colors = _TranslationsEditorColorsZhHansCn._(_root);
	@override late final _TranslationsEditorImageOptionsZhHansCn imageOptions = _TranslationsEditorImageOptionsZhHansCn._(_root);
	@override late final _TranslationsEditorSelectionBarZhHansCn selectionBar = _TranslationsEditorSelectionBarZhHansCn._(_root);
	@override late final _TranslationsEditorMenuZhHansCn menu = _TranslationsEditorMenuZhHansCn._(_root);
	@override late final _TranslationsEditorNewerFileFormatZhHansCn newerFileFormat = _TranslationsEditorNewerFileFormatZhHansCn._(_root);
	@override late final _TranslationsEditorQuillZhHansCn quill = _TranslationsEditorQuillZhHansCn._(_root);
	@override late final _TranslationsEditorHudZhHansCn hud = _TranslationsEditorHudZhHansCn._(_root);
	@override String get pages => '页面';
	@override String get untitled => '未命名';
	@override String get needsToSaveBeforeExiting => '正在保存您的更改。。。完成后您可以安全地退出编辑器';
}

// Path: home.tabs
class _TranslationsHomeTabsZhHansCn extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get home => '主页';
	@override String get browse => '全部笔记';
	@override String get whiteboard => '白板';
	@override String get settings => '设置';
}

// Path: home.titles
class _TranslationsHomeTitlesZhHansCn extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get home => '最近笔记';
	@override String get browse => '浏览';
	@override String get whiteboard => '白板';
	@override String get settings => '设置';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsZhHansCn extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新建笔记';
	@override String get showUpdateDialog => '显示更新对话框';
	@override String get exportNote => '导出笔记';
}

// Path: home.create
class _TranslationsHomeCreateZhHansCn extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新建笔记';
	@override String get importNote => '导入笔记';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderZhHansCn extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get newFolder => '新建文件夹';
	@override String get folderName => '文件夹名称';
	@override String get create => '创建';
	@override String get folderNameEmpty => '文件夹名称不能为空';
	@override String get folderNameContainsSlash => '文件夹名称不能包含斜杠';
	@override String get folderNameExists => '文件夹已存在';
}

// Path: home.renameNote
class _TranslationsHomeRenameNoteZhHansCn extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get renameNote => '重命名笔记';
	@override String get noteName => '笔记名称';
	@override String get rename => '重命名';
	@override String get noteNameEmpty => '笔记名称不能为空';
	@override String get noteNameContainsSlash => '注意名称不能包含斜杠';
	@override String get noteNameExists => '此名称的笔记已经存在';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteZhHansCn extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get moveNote => '移动笔记';
	@override String moveNotes({required Object n}) => '移动 ${n} 个笔记';
	@override String moveName({required Object f}) => '移动 ${f}';
	@override String get move => '移动';
	@override String renamedTo({required Object newName}) => '笔记将重命名为 ${newName}';
	@override String get multipleRenamedTo => '以下笔记将被重命名：';
	@override String numberRenamedTo({required Object n}) => '${n} 个笔记将被重命名以避免冲突';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderZhHansCn extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => '重命名文件夹';
	@override String get folderName => '文件夹名称';
	@override String get rename => '重命名';
	@override String get folderNameEmpty => '文件夹不能为空';
	@override String get folderNameContainsSlash => '文件夹名称不能包含斜线';
	@override String get folderNameExists => '已存在该名称的文件夹';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderZhHansCn extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => '删除文件夹';
	@override String deleteName({required Object f}) => '删除 ${f}';
	@override String get delete => '删除';
	@override String get alsoDeleteContents => '同时删除此文件夹中的所有笔记';
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesZhHansCn extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get general => '通用';
	@override String get writing => '书写';
	@override String get editor => '编辑器';
	@override String get performance => '性能';
	@override String get advanced => '高级';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsZhHansCn extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get locale => '应用语言';
	@override String get appTheme => '应用主题';
	@override String get platform => '主题类型';
	@override String get layoutSize => '布局大小';
	@override String get customAccentColor => '自定义主题色';
	@override String get hyperlegibleFont => '易读字体';
	@override String get shouldCheckForUpdates => '自动检查 Saber 更新';
	@override String get shouldAlwaysAlertForUpdates => '更快的更新提醒';
	@override String get allowInsecureConnections => '允许不安全的连接';
	@override String get editorToolbarAlignment => '编辑工具栏对齐方式';
	@override String get editorToolbarShowInFullscreen => '在全屏模式中显示编辑菜单栏';
	@override String get editorAutoInvert => '在深色模式下使用反色笔记背景';
	@override String get preferGreyscale => '使用灰度颜色';
	@override String get maxImageSize => '最大图片大小';
	@override String get autoClearWhiteboardOnExit => '离开应用后清除白板';
	@override String get disableEraserAfterUse => '自动禁用橡皮擦';
	@override String get hideFingerDrawingToggle => '隐藏 切换手指绘制';
	@override String get editorPromptRename => '提示您重命名新笔记';
	@override String get hideHomeBackgrounds => '在主页隐藏背景';
	@override String get recentColorsDontSavePresets => '不在最近使用的颜色中保存预设颜色';
	@override String get recentColorsLength => '要存储多少种最近的颜色';
	@override String get printPageIndicators => '打印页码';
	@override String get autosaveDelay => '自动保存延迟';
	@override String get shapeRecognitionDelay => '形状识别延迟';
	@override String get autoStraightenLines => '自动拉直线';
	@override String get simplifiedHomeLayout => '简化主页布局';
	@override String get customDataDir => '自定义 Saber 文件夹';
	@override String get pencilSoundSetting => '铅笔音效';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsZhHansCn extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible 字体为低视力读者提高易读性';
	@override String get allowInsecureConnections => '（不推荐）允许 Saber 连接到具有自签名/不受信任证书的服务器';
	@override String get preferGreyscale => '用于电子墨水显示器';
	@override String get autoClearWhiteboardOnExit => '这将会同步到您的其他设备';
	@override String get disableEraserAfterUse => '使用橡皮擦后自动切换回笔';
	@override String get maxImageSize => '更大的图片将会被压缩';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingZhHansCn hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingZhHansCn._(_root);
	@override String get editorPromptRename => '您可以总是稍后重命名笔记';
	@override String get hideHomeBackgrounds => '更简洁的外观';
	@override String get printPageIndicators => '在导出中显示页码';
	@override String get autosaveDelay => '自动保存便笺需要等待的时间';
	@override String get shapeRecognitionDelay => '形状预览更新频率';
	@override String get autoStraightenLines => '拉直长线，无需使用形状笔';
	@override String get simplifiedHomeLayout => '为每个笔记预览设置固定高度';
	@override String get shouldAlwaysAlertForUpdates => '在更新可用时尽快告诉我';
	@override late final _TranslationsSettingsPrefDescriptionsPencilSoundSettingZhHansCn pencilSoundSetting = _TranslationsSettingsPrefDescriptionsPencilSoundSettingZhHansCn._(_root);
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesZhHansCn extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get system => '系统';
	@override String get light => '浅色';
	@override String get dark => '深色';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesZhHansCn extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get auto => '自动';
	@override String get phone => '手机';
	@override String get tablet => '平板';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerZhHansCn extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => '选取颜色';
}

// Path: settings.reset
class _TranslationsSettingsResetZhHansCn extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '重置此设置？';
	@override String get button => '重置';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirZhHansCn extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get cancel => '取消';
	@override String get select => '选择';
	@override String get mustBeEmpty => '所选文件夹必须为空';
	@override String get mustBeDoneSyncing => '更改文件夹前，请确保同步已完成';
}

// Path: login.form
class _TranslationsLoginFormZhHansCn extends TranslationsLoginFormEn {
	_TranslationsLoginFormZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: '登录即表示您同意 '),
		linkToPrivacyPolicy('隐私政策'),
		const TextSpan(text: '。'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusZhHansCn extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => '已注销';
	@override String get tapToLogin => '点击以使用 Nextcloud 登录';
	@override String hi({required Object u}) => '欢迎，${u}!';
	@override String get almostDone => '即将准备好同步，点击完成登录';
	@override String get loggedIn => '已使用 Nextcloud 登录';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepZhHansCn extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => '选择数据存储位置：';
	@override String get saberNcServer => 'Saber 的 Nextcloud 服务器';
	@override String get otherNcServer => '其他 Nextcloud 服务器';
	@override String get serverUrl => '服务器 URL';
	@override String get loginWithSaber => '使用 Saber 登录';
	@override String get loginWithNextcloud => '使用 Nextcloud 登录';
	@override late final _TranslationsLoginNcLoginStepLoginFlowZhHansCn loginFlow = _TranslationsLoginNcLoginStepLoginFlowZhHansCn._(_root);
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepZhHansCn extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => '为了保护您的数据，请输入您的加密密码：';
	@override String get newToSaber => 'Saber 新手？只需输入新的加密密码即可。';
	@override String get encPassword => '加密密码';
	@override String get encFaqTitle => '常见问题解答';
	@override String get wrongEncPassword => '使用提供的密码解密失败。请再次尝试输入。';
	@override String get connectionFailed => '连接到服务器时出错。请稍后重试。';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$ZhHansCn._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$ZhHansCn._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$ZhHansCn._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksZhHansCn extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => '服务器主页';
	@override String get deleteAccount => '删除帐户';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$ZhHansCn extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$ZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '如果我注销，我的笔记会丢失吗？';
	@override String get a => '不会。您的笔记将保留在您的设备和服务器上。在您重新登录之前，它们不会与服务器同步。请确保在注销前完成同步，以免丢失任何数据（请在主屏幕上查看同步进度）。';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$ZhHansCn extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$ZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '如何更改我的 Nextcloud 密码？';
	@override String get a => '转到您的服务器网站并登录。然后转到设置 > 安全 > 更改密码。更改密码后，您需要注销并重新登录 Saber。';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$ZhHansCn extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$ZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '如何更改我的加密密码？';
	@override String get a => '1.退出Saber。请确保在注销前完成同步，以免丢失任何数据（在主屏幕上查看同步进度）。\n2.转到您的服务器网站并删除您的“Saber”文件夹。这将从服务器中删除您的所有笔记。\n3.重新登录 Saber。您可以在登录时选择一个新的加密密码。\n4.不要忘记在您的其他设备上注销并重新登录 Saber。';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$ZhHansCn extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$ZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '如何删除我的帐户？';
	@override String get a => '点击上面的 "${_root.profile.quickLinks.deleteAccount}" 按钮，并在需要时登录。\n如果您使用的是官方 Saber 服务器，您的帐户将在 1 周的宽限期后被删除。在此期间，您可以通过 adilhanney@disroot.org 与我联系以取消删除。\n如果您使用的是第三方服务器，则可能没有删除帐户的选项：您需要咨询服务器的隐私政策以获取更多信息。';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarZhHansCn extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => '切换颜色 (Ctrl C)';
	@override String get select => '选择';
	@override String get toggleEraser => '切换橡皮擦 (Ctrl E)';
	@override String get photo => '照片';
	@override String get text => '文本';
	@override String get toggleFingerDrawing => '切换手写 (Ctrl F)';
	@override String get undo => '撤销';
	@override String get redo => '重做';
	@override String get export => '导出 (Ctrl Shift S)';
	@override String get exportAs => '导出为：';
	@override String get fullscreen => '切换全屏 (F11)';
}

// Path: editor.pens
class _TranslationsEditorPensZhHansCn extends TranslationsEditorPensEn {
	_TranslationsEditorPensZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => '钢笔';
	@override String get ballpointPen => '圆珠笔';
	@override String get highlighter => '荧光笔';
	@override String get pencil => '铅笔';
	@override String get shapePen => '形状笔';
	@override String get laserPointer => '激光笔';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsZhHansCn extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get size => '粗细';
}

// Path: editor.colors
class _TranslationsEditorColorsZhHansCn extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => '选色器';
	@override String customBrightnessHue({required Object b, required Object h}) => '自定义 ${b} ${h}';
	@override String customHue({required Object h}) => '自定义 ${h}';
	@override String get dark => '暗色';
	@override String get light => '亮色';
	@override String get black => '黑色';
	@override String get darkGrey => '深灰色';
	@override String get grey => '灰色';
	@override String get lightGrey => '浅灰色';
	@override String get white => '白色';
	@override String get red => '红色';
	@override String get green => '绿色';
	@override String get cyan => '青色';
	@override String get blue => '蓝色';
	@override String get yellow => '黄色';
	@override String get purple => '紫色';
	@override String get pink => '粉色';
	@override String get orange => '橙色';
	@override String get pastelRed => '浅红色';
	@override String get pastelOrange => '浅橙色';
	@override String get pastelYellow => '浅黄色';
	@override String get pastelGreen => '浅绿色';
	@override String get pastelCyan => '浅青色';
	@override String get pastelBlue => '浅蓝色';
	@override String get pastelPurple => '浅紫色';
	@override String get pastelPink => '浅粉色';
}

// Path: editor.imageOptions
class _TranslationsEditorImageOptionsZhHansCn extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '图片选项';
	@override String get invertible => '反转颜色';
	@override String get download => '下载';
	@override String get setAsBackground => '设为背景';
	@override String get removeAsBackground => '作为背景移除';
	@override String get delete => '删除';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarZhHansCn extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get delete => '删除';
	@override String get duplicate => '重复';
}

// Path: editor.menu
class _TranslationsEditorMenuZhHansCn extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => '清除页面 ${page}/${totalPages}';
	@override String get clearAllPages => '清除全部页面';
	@override String get insertPage => '在下方插入页面';
	@override String get duplicatePage => '复制页面';
	@override String get deletePage => '删除页面';
	@override String get lineHeight => '行高';
	@override String get lineHeightDescription => '还控制已输入的笔记的文本大小';
	@override String get backgroundImageFit => '背景图像拟合';
	@override String get backgroundPattern => '背景图案';
	@override String get import => '导入';
	@override String get watchServer => '监视服务器上的更新';
	@override String get watchServerReadOnly => '监视服务器时禁用编辑';
	@override late final _TranslationsEditorMenuBoxFitsZhHansCn boxFits = _TranslationsEditorMenuBoxFitsZhHansCn._(_root);
	@override late final _TranslationsEditorMenuBgPatternsZhHansCn bgPatterns = _TranslationsEditorMenuBgPatternsZhHansCn._(_root);
	@override String get lineThickness => '线厚度';
	@override String get lineThicknessDescription => '背景线厚度';
}

// Path: editor.newerFileFormat
class _TranslationsEditorNewerFileFormatZhHansCn extends TranslationsEditorNewerFileFormatEn {
	_TranslationsEditorNewerFileFormatZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => '只读模式';
	@override String get title => '此笔记使用新版 Saber 编辑而成';
	@override String get subtitle => '编辑此笔记可能会导致某些信息丢失。您想忽略并编辑吗？';
	@override String get allowEditing => '允许编辑';
}

// Path: editor.quill
class _TranslationsEditorQuillZhHansCn extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => '在这里输入...';
}

// Path: editor.hud
class _TranslationsEditorHudZhHansCn extends TranslationsEditorHudEn {
	_TranslationsEditorHudZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => '解锁缩放';
	@override String get lockZoom => '锁定缩放';
	@override String get unlockSingleFingerPan => '启用单指平移';
	@override String get lockSingleFingerPan => '禁用单指平移';
	@override String get unlockAxisAlignedPan => '解锁水平或垂直平移';
	@override String get lockAxisAlignedPan => '锁定水平或垂直平移';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingZhHansCn extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get shown => '防止意外切换';
	@override String get fixedOn => '手指绘制固定为启用状态';
	@override String get fixedOff => '手指绘制固定为禁用状态';
}

// Path: settings.prefDescriptions.pencilSoundSetting
class _TranslationsSettingsPrefDescriptionsPencilSoundSettingZhHansCn extends TranslationsSettingsPrefDescriptionsPencilSoundSettingEn {
	_TranslationsSettingsPrefDescriptionsPencilSoundSettingZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get off => '没有音效';
	@override String get onButNotInSilentMode => '启用（除非在静音模式下）';
	@override String get onAlways => '启用（即使在静音模式下）';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowZhHansCn extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => '请授权 Saber 访问您的 Nextcloud 帐户';
	@override String get followPrompts => '请按照 Nextcloud 界面中的提示操作';
	@override String get browserDidntOpen => '登录页面没有打开？点击这里';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$ZhHansCn extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$ZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '什么是加密密码？为什么要使用两个密码？';
	@override String get a => 'Nextcloud 密码用于访问云。加密密码会在您的数据到达云之前对其进行“加扰”。\n即使有人获得了您的 Nextcloud 帐户的访问权限，您的笔记也将保持安全并使用单独的密码进行加密。这为您提供了第二层安全保护，以保护您的数据。\n没有您的加密密码，任何人都无法访问您在服务器上的笔记，但这也意味着如果您忘记了加密密码，您将无法访问您的数据。';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$ZhHansCn extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$ZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '我还没有设置加密密码。我在哪里可以买到它？';
	@override String get a => '选择新的加密密码并在上面输入。\nSaber 将从此密码自动生成您的加密密钥。';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$ZhHansCn extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$ZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '我可以使用与我的 Nextcloud 帐户相同的密码吗？';
	@override String get a => '是的，但请记住，如果服务器管理员或其他人可以访问您的 Nextcloud 帐户，他们将更容易访问您的笔记。';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsZhHansCn extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get fill => '拉伸';
	@override String get cover => '覆盖';
	@override String get contain => '包含';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsZhHansCn extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsZhHansCn._(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get none => '空白';
	@override String get college => 'College-ruled';
	@override String get collegeRtl => 'College-ruled（反转）';
	@override String get lined => '横线';
	@override String get grid => '网格';
	@override String get dots => '点';
	@override String get staffs => '五线谱';
	@override String get tablature => '绘画';
	@override String get cornell => 'Cornell';
}
