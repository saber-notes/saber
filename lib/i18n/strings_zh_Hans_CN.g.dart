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
class TranslationsZhHansCn extends Translations with BaseTranslations<AppLocale, Translations> {
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
	@override late final Translations$common$zh_Hans_CN common = Translations$common$zh_Hans_CN.internal(_root);
	@override late final Translations$home$zh_Hans_CN home = Translations$home$zh_Hans_CN.internal(_root);
	@override late final Translations$sentry$zh_Hans_CN sentry = Translations$sentry$zh_Hans_CN.internal(_root);
	@override late final Translations$settings$zh_Hans_CN settings = Translations$settings$zh_Hans_CN.internal(_root);
	@override late final Translations$logs$zh_Hans_CN logs = Translations$logs$zh_Hans_CN.internal(_root);
	@override late final Translations$login$zh_Hans_CN login = Translations$login$zh_Hans_CN.internal(_root);
	@override late final Translations$profile$zh_Hans_CN profile = Translations$profile$zh_Hans_CN.internal(_root);
	@override late final Translations$appInfo$zh_Hans_CN appInfo = Translations$appInfo$zh_Hans_CN.internal(_root);
	@override late final Translations$update$zh_Hans_CN update = Translations$update$zh_Hans_CN.internal(_root);
	@override late final Translations$editor$zh_Hans_CN editor = Translations$editor$zh_Hans_CN.internal(_root);
}

// Path: common
class Translations$common$zh_Hans_CN extends Translations$common$en {
	Translations$common$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get done => '完成';
	@override String get continueBtn => '继续';
	@override String get cancel => '取消';
}

// Path: home
class Translations$home$zh_Hans_CN extends Translations$home$en {
	Translations$home$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override late final Translations$home$tabs$zh_Hans_CN tabs = Translations$home$tabs$zh_Hans_CN.internal(_root);
	@override late final Translations$home$titles$zh_Hans_CN titles = Translations$home$titles$zh_Hans_CN.internal(_root);
	@override late final Translations$home$tooltips$zh_Hans_CN tooltips = Translations$home$tooltips$zh_Hans_CN.internal(_root);
	@override late final Translations$home$create$zh_Hans_CN create = Translations$home$create$zh_Hans_CN.internal(_root);
	@override String get welcome => '欢迎使用 Saber';
	@override String get invalidFormat => '不支持该文件。请选择 .sbn、.sbn2、.sba 或 .pdf 文件。';
	@override String get noFiles => '未找到文件';
	@override String get noPreviewAvailable => '无可用预览';
	@override String get createNewNote => '点击 + 按钮新建一个笔记';
	@override String get backFolder => '回到上一个文件夹';
	@override late final Translations$home$newFolder$zh_Hans_CN newFolder = Translations$home$newFolder$zh_Hans_CN.internal(_root);
	@override late final Translations$home$renameNote$zh_Hans_CN renameNote = Translations$home$renameNote$zh_Hans_CN.internal(_root);
	@override late final Translations$home$moveNote$zh_Hans_CN moveNote = Translations$home$moveNote$zh_Hans_CN.internal(_root);
	@override String get deleteNote => '删除笔记';
	@override late final Translations$home$deleteNoteDialog$zh_Hans_CN deleteNoteDialog = Translations$home$deleteNoteDialog$zh_Hans_CN.internal(_root);
	@override late final Translations$home$renameFolder$zh_Hans_CN renameFolder = Translations$home$renameFolder$zh_Hans_CN.internal(_root);
	@override late final Translations$home$deleteFolder$zh_Hans_CN deleteFolder = Translations$home$deleteFolder$zh_Hans_CN.internal(_root);
}

// Path: sentry
class Translations$sentry$zh_Hans_CN extends Translations$sentry$en {
	Translations$sentry$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override late final Translations$sentry$consent$zh_Hans_CN consent = Translations$sentry$consent$zh_Hans_CN.internal(_root);
}

// Path: settings
class Translations$settings$zh_Hans_CN extends Translations$settings$en {
	Translations$settings$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override late final Translations$settings$prefCategories$zh_Hans_CN prefCategories = Translations$settings$prefCategories$zh_Hans_CN.internal(_root);
	@override late final Translations$settings$prefLabels$zh_Hans_CN prefLabels = Translations$settings$prefLabels$zh_Hans_CN.internal(_root);
	@override late final Translations$settings$prefDescriptions$zh_Hans_CN prefDescriptions = Translations$settings$prefDescriptions$zh_Hans_CN.internal(_root);
	@override late final Translations$settings$themeModes$zh_Hans_CN themeModes = Translations$settings$themeModes$zh_Hans_CN.internal(_root);
	@override late final Translations$settings$layoutSizes$zh_Hans_CN layoutSizes = Translations$settings$layoutSizes$zh_Hans_CN.internal(_root);
	@override late final Translations$settings$accentColorPicker$zh_Hans_CN accentColorPicker = Translations$settings$accentColorPicker$zh_Hans_CN.internal(_root);
	@override String get systemLanguage => '系统语言';
	@override List<String> get axisDirections => [
		'上',
		'右',
		'下',
		'左',
	];
	@override late final Translations$settings$reset$zh_Hans_CN reset = Translations$settings$reset$zh_Hans_CN.internal(_root);
	@override String get resyncEverything => '重新同步所有';
	@override String get openDataDir => '打开 Saber 文件夹';
	@override late final Translations$settings$customDataDir$zh_Hans_CN customDataDir = Translations$settings$customDataDir$zh_Hans_CN.internal(_root);
	@override String get autosaveDisabled => '禁用';
	@override String get shapeRecognitionDisabled => '禁用';
}

// Path: logs
class Translations$logs$zh_Hans_CN extends Translations$logs$en {
	Translations$logs$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get logs => '日志';
	@override String get viewLogs => '查看日志';
	@override String get debuggingInfo => '日志包含用于调试和开发的信息';
	@override String get noLogs => '暂无日志！';
	@override String get useTheApp => '使用应用时日志将显示在此处';
}

// Path: login
class Translations$login$zh_Hans_CN extends Translations$login$en {
	Translations$login$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '登录';
	@override late final Translations$login$form$zh_Hans_CN form = Translations$login$form$zh_Hans_CN.internal(_root);
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
	@override late final Translations$login$status$zh_Hans_CN status = Translations$login$status$zh_Hans_CN.internal(_root);
	@override late final Translations$login$ncLoginStep$zh_Hans_CN ncLoginStep = Translations$login$ncLoginStep$zh_Hans_CN.internal(_root);
	@override late final Translations$login$encLoginStep$zh_Hans_CN encLoginStep = Translations$login$encLoginStep$zh_Hans_CN.internal(_root);
}

// Path: profile
class Translations$profile$zh_Hans_CN extends Translations$profile$en {
	Translations$profile$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '我的用户资料';
	@override String get logout => '注销';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => '您已使用 ${used}，共 ${total}（${percent}%）';
	@override String get connectedTo => '连接到';
	@override late final Translations$profile$quickLinks$zh_Hans_CN quickLinks = Translations$profile$quickLinks$zh_Hans_CN.internal(_root);
	@override String get faqTitle => '常见问题解答';
	@override List<dynamic> get faq => [
		Translations$profile$faq$0$zh_Hans_CN.internal(_root),
		Translations$profile$faq$1$zh_Hans_CN.internal(_root),
		Translations$profile$faq$2$zh_Hans_CN.internal(_root),
		Translations$profile$faq$3$zh_Hans_CN.internal(_root),
	];
}

// Path: appInfo
class Translations$appInfo$zh_Hans_CN extends Translations$appInfo$en {
	Translations$appInfo$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  版权所有 © 2022-${buildYear}  Adil Hanney\n本程序不附带任何担保。这是自由软件，您可以在特定条件下重新分发它。';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => '点击此处赞助我或购买更多存储空间';
	@override String get licenseButton => '点击此处查看更多许可证信息';
	@override String get privacyPolicyButton => '点击此处查看隐私政策';
}

// Path: update
class Translations$update$zh_Hans_CN extends Translations$update$en {
	Translations$update$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => '可用更新';
	@override String get updateAvailableDescription => '该应用的新版本可用，具有以下变更：';
	@override String get update => '更新';
	@override String get downloadNotAvailableYet => '您的平台暂无可用的下载版本，请稍后再查看。';
}

// Path: editor
class Translations$editor$zh_Hans_CN extends Translations$editor$en {
	Translations$editor$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override late final Translations$editor$toolbar$zh_Hans_CN toolbar = Translations$editor$toolbar$zh_Hans_CN.internal(_root);
	@override late final Translations$editor$pens$zh_Hans_CN pens = Translations$editor$pens$zh_Hans_CN.internal(_root);
	@override late final Translations$editor$penOptions$zh_Hans_CN penOptions = Translations$editor$penOptions$zh_Hans_CN.internal(_root);
	@override late final Translations$editor$colors$zh_Hans_CN colors = Translations$editor$colors$zh_Hans_CN.internal(_root);
	@override late final Translations$editor$imageOptions$zh_Hans_CN imageOptions = Translations$editor$imageOptions$zh_Hans_CN.internal(_root);
	@override late final Translations$editor$selectionBar$zh_Hans_CN selectionBar = Translations$editor$selectionBar$zh_Hans_CN.internal(_root);
	@override late final Translations$editor$menu$zh_Hans_CN menu = Translations$editor$menu$zh_Hans_CN.internal(_root);
	@override late final Translations$editor$readOnlyBanner$zh_Hans_CN readOnlyBanner = Translations$editor$readOnlyBanner$zh_Hans_CN.internal(_root);
	@override late final Translations$editor$versionTooNew$zh_Hans_CN versionTooNew = Translations$editor$versionTooNew$zh_Hans_CN.internal(_root);
	@override late final Translations$editor$quill$zh_Hans_CN quill = Translations$editor$quill$zh_Hans_CN.internal(_root);
	@override late final Translations$editor$hud$zh_Hans_CN hud = Translations$editor$hud$zh_Hans_CN.internal(_root);
	@override String get pages => '页面';
	@override String get untitled => '未命名';
	@override String get needsToSaveBeforeExiting => '正在保存您的更改... 完成后您可以安全地退出编辑器';
}

// Path: home.tabs
class Translations$home$tabs$zh_Hans_CN extends Translations$home$tabs$en {
	Translations$home$tabs$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get home => '首页';
	@override String get browse => '全部笔记';
	@override String get whiteboard => '白板';
	@override String get settings => '设置';
}

// Path: home.titles
class Translations$home$titles$zh_Hans_CN extends Translations$home$titles$en {
	Translations$home$titles$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get home => '最近笔记';
	@override String get browse => '浏览';
	@override String get whiteboard => '白板';
	@override String get settings => '设置';
}

// Path: home.tooltips
class Translations$home$tooltips$zh_Hans_CN extends Translations$home$tooltips$en {
	Translations$home$tooltips$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新建笔记';
	@override String get showUpdateDialog => '显示更新对话框';
	@override String get exportNote => '导出笔记';
}

// Path: home.create
class Translations$home$create$zh_Hans_CN extends Translations$home$create$en {
	Translations$home$create$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新建笔记';
	@override String get importNote => '导入笔记';
}

// Path: home.newFolder
class Translations$home$newFolder$zh_Hans_CN extends Translations$home$newFolder$en {
	Translations$home$newFolder$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

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
class Translations$home$renameNote$zh_Hans_CN extends Translations$home$renameNote$en {
	Translations$home$renameNote$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get renameNote => '重命名笔记';
	@override String get noteName => '笔记名称';
	@override String get rename => '重命名';
	@override String get noteNameEmpty => '笔记名称不能为空';
	@override String get noteNameExists => '此名称的笔记已经存在';
	@override String get noteNameForbiddenCharacters => '笔记名称包含禁止使用的字符';
	@override String get noteNameReserved => '保留了笔记名';
}

// Path: home.moveNote
class Translations$home$moveNote$zh_Hans_CN extends Translations$home$moveNote$en {
	Translations$home$moveNote$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

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

// Path: home.deleteNoteDialog
class Translations$home$deleteNoteDialog$zh_Hans_CN extends Translations$home$deleteNoteDialog$en {
	Translations$home$deleteNoteDialog$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String deleteNotes({required Object n}) => '删除 ${n} 个笔记';
	@override String deleteName({required Object f}) => '删除 ${f}';
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n,
		one: '是否永久删除所选笔记？',
		other: '是否永久删除所选笔记？',
	);
	@override String get delete => '删除';
}

// Path: home.renameFolder
class Translations$home$renameFolder$zh_Hans_CN extends Translations$home$renameFolder$en {
	Translations$home$renameFolder$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

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
class Translations$home$deleteFolder$zh_Hans_CN extends Translations$home$deleteFolder$en {
	Translations$home$deleteFolder$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => '删除文件夹';
	@override String deleteName({required Object f}) => '删除 ${f}';
	@override String get delete => '删除';
	@override String get alsoDeleteContents => '同时删除此文件夹中的所有笔记';
}

// Path: sentry.consent
class Translations$sentry$consent$zh_Hans_CN extends Translations$sentry$consent$en {
	Translations$sentry$consent$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '帮助改进 Saber？';
	@override late final Translations$sentry$consent$description$zh_Hans_CN description = Translations$sentry$consent$description$zh_Hans_CN.internal(_root);
	@override late final Translations$sentry$consent$answers$zh_Hans_CN answers = Translations$sentry$consent$answers$zh_Hans_CN.internal(_root);
}

// Path: settings.prefCategories
class Translations$settings$prefCategories$zh_Hans_CN extends Translations$settings$prefCategories$en {
	Translations$settings$prefCategories$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get general => '通用';
	@override String get writing => '书写';
	@override String get editor => '编辑器';
	@override String get performance => '性能';
	@override String get advanced => '高级';
}

// Path: settings.prefLabels
class Translations$settings$prefLabels$zh_Hans_CN extends Translations$settings$prefLabels$en {
	Translations$settings$prefLabels$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

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
	@override String get hideFingerDrawingToggle => '隐藏 切换手指绘图';
	@override String get autoDisableFingerDrawingWhenStylusDetected => '自动禁用手指绘图';
	@override String get editorPromptRename => '提示您重命名新笔记';
	@override String get recentColorsDontSavePresets => '不在最近使用的颜色中保存预设颜色';
	@override String get recentColorsLength => '要存储多少种最近的颜色';
	@override String get printPageIndicators => '打印页码';
	@override String get autosave => '自动保存';
	@override String get shapeRecognitionDelay => '形状识别延迟';
	@override String get autoStraightenLines => '自动拉直线';
	@override String get simplifiedHomeLayout => '简化主页布局';
	@override String get customDataDir => '自定义 Saber 文件夹';
	@override String get sentry => '错误报告';
}

// Path: settings.prefDescriptions
class Translations$settings$prefDescriptions$zh_Hans_CN extends Translations$settings$prefDescriptions$en {
	Translations$settings$prefDescriptions$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible 字体为低视力读者提高易读性';
	@override String get allowInsecureConnections => '（不推荐）允许 Saber 连接到具有自签名/不受信任证书的服务器';
	@override String get preferGreyscale => '用于电子墨水显示器';
	@override String get autoClearWhiteboardOnExit => '这将会同步到您的其他设备';
	@override String get disableEraserAfterUse => '使用橡皮擦后自动切换回笔';
	@override String get maxImageSize => '更大的图片将会被压缩';
	@override late final Translations$settings$prefDescriptions$hideFingerDrawing$zh_Hans_CN hideFingerDrawing = Translations$settings$prefDescriptions$hideFingerDrawing$zh_Hans_CN.internal(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => '当检测到手写笔时关闭手指绘图';
	@override String get editorPromptRename => '您可以总是稍后重命名笔记';
	@override String get printPageIndicators => '在导出中显示页码';
	@override String get autosave => '短暂延迟后自动保存，或永不保存';
	@override String get shapeRecognitionDelay => '形状预览更新频率';
	@override String get autoStraightenLines => '拉直长线，无需使用形状笔';
	@override String get simplifiedHomeLayout => '为每个笔记预览设置固定高度';
	@override String get shouldAlwaysAlertForUpdates => '在更新可用时尽快告诉我';
	@override late final Translations$settings$prefDescriptions$sentry$zh_Hans_CN sentry = Translations$settings$prefDescriptions$sentry$zh_Hans_CN.internal(_root);
}

// Path: settings.themeModes
class Translations$settings$themeModes$zh_Hans_CN extends Translations$settings$themeModes$en {
	Translations$settings$themeModes$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get system => '系统';
	@override String get light => '浅色';
	@override String get dark => '深色';
}

// Path: settings.layoutSizes
class Translations$settings$layoutSizes$zh_Hans_CN extends Translations$settings$layoutSizes$en {
	Translations$settings$layoutSizes$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get auto => '自动';
	@override String get phone => '手机';
	@override String get tablet => '平板';
}

// Path: settings.accentColorPicker
class Translations$settings$accentColorPicker$zh_Hans_CN extends Translations$settings$accentColorPicker$en {
	Translations$settings$accentColorPicker$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => '选取颜色';
}

// Path: settings.reset
class Translations$settings$reset$zh_Hans_CN extends Translations$settings$reset$en {
	Translations$settings$reset$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '重置此设置？';
	@override String get button => '重置';
}

// Path: settings.customDataDir
class Translations$settings$customDataDir$zh_Hans_CN extends Translations$settings$customDataDir$en {
	Translations$settings$customDataDir$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get cancel => '取消';
	@override String get select => '选择';
	@override String get mustBeEmpty => '所选文件夹必须为空';
	@override String get mustBeDoneSyncing => '更改文件夹前，请确保同步已完成';
	@override String get unsupported => '此功能目前仅限开发者使用，可能导致数据丢失。';
}

// Path: login.form
class Translations$login$form$zh_Hans_CN extends Translations$login$form$en {
	Translations$login$form$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: '登录即表示您同意 '),
		linkToPrivacyPolicy('隐私政策'),
		const TextSpan(text: '。'),
	]);
}

// Path: login.status
class Translations$login$status$zh_Hans_CN extends Translations$login$status$en {
	Translations$login$status$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => '已注销';
	@override String get tapToLogin => '点击以使用 Nextcloud 登录';
	@override String hi({required Object u}) => '欢迎，${u}!';
	@override String get almostDone => '即将准备好同步，点击完成登录';
	@override String get loggedIn => '已使用 Nextcloud 登录';
}

// Path: login.ncLoginStep
class Translations$login$ncLoginStep$zh_Hans_CN extends Translations$login$ncLoginStep$en {
	Translations$login$ncLoginStep$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => '选择数据存储位置：';
	@override String get saberNcServer => 'Saber 的 Nextcloud 服务器';
	@override String get otherNcServer => '其他 Nextcloud 服务器';
	@override String get serverUrl => '服务器 URL';
	@override String get loginWithSaber => '使用 Saber 登录';
	@override String get loginWithNextcloud => '使用 Nextcloud 登录';
	@override late final Translations$login$ncLoginStep$loginFlow$zh_Hans_CN loginFlow = Translations$login$ncLoginStep$loginFlow$zh_Hans_CN.internal(_root);
}

// Path: login.encLoginStep
class Translations$login$encLoginStep$zh_Hans_CN extends Translations$login$encLoginStep$en {
	Translations$login$encLoginStep$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => '为了保护您的数据，请输入您的加密密码：';
	@override String get newToSaber => 'Saber 新手？只需输入新的加密密码即可。';
	@override String get encPassword => '加密密码';
	@override String get encFaqTitle => '常见问题解答';
	@override String get wrongEncPassword => '使用提供的密码解密失败。请再次尝试输入。';
	@override String get connectionFailed => '连接到服务器时出错。请稍后重试。';
	@override List<dynamic> get encFaq => [
		Translations$login$encLoginStep$encFaq$0$zh_Hans_CN.internal(_root),
		Translations$login$encLoginStep$encFaq$1$zh_Hans_CN.internal(_root),
		Translations$login$encLoginStep$encFaq$2$zh_Hans_CN.internal(_root),
	];
}

// Path: profile.quickLinks
class Translations$profile$quickLinks$zh_Hans_CN extends Translations$profile$quickLinks$en {
	Translations$profile$quickLinks$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => '服务器主页';
	@override String get deleteAccount => '删除帐户';
}

// Path: profile.faq.0
class Translations$profile$faq$0$zh_Hans_CN extends Translations$profile$faq$0$en {
	Translations$profile$faq$0$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '如果我注销，我的笔记会丢失吗？';
	@override String get a => '不会。您的笔记将保留在您的设备和服务器上。在您重新登录之前，它们不会与服务器同步。请确保在注销前完成同步，以免丢失任何数据（请在主屏幕上查看同步进度）。';
}

// Path: profile.faq.1
class Translations$profile$faq$1$zh_Hans_CN extends Translations$profile$faq$1$en {
	Translations$profile$faq$1$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '如何更改我的 Nextcloud 密码？';
	@override String get a => '转到您的服务器网站并登录。然后转到设置 > 安全 > 更改密码。更改密码后，您需要注销并重新登录 Saber。';
}

// Path: profile.faq.2
class Translations$profile$faq$2$zh_Hans_CN extends Translations$profile$faq$2$en {
	Translations$profile$faq$2$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '如何更改我的加密密码？';
	@override String get a => '0. 请确保在注销前完成同步，以免丢失任何数据（在主屏幕上查看同步进度）。\n1.退出 Saber 登录。\n2.转到您的服务器网站并删除您的“Saber”文件夹。这将从服务器中删除您的所有笔记。\n3.重新登录 Saber。您可以在登录时选择一个新的加密密码。\n4.不要忘记在您的其他设备上注销并重新登录 Saber。';
}

// Path: profile.faq.3
class Translations$profile$faq$3$zh_Hans_CN extends Translations$profile$faq$3$en {
	Translations$profile$faq$3$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '如何删除我的帐户？';
	@override String get a => '点击上面的 "${_root.profile.quickLinks.deleteAccount}" 按钮，并在需要时登录。\n如果您使用的是官方 Saber 服务器，您的帐户将在 1 周的宽限期后被删除。在此期间，您可以通过 adilhanney@disroot.org 与我联系以取消删除。\n如果您使用的是第三方服务器，则可能没有删除帐户的选项：您需要咨询服务器的隐私政策以获取更多信息。';
}

// Path: editor.toolbar
class Translations$editor$toolbar$zh_Hans_CN extends Translations$editor$toolbar$en {
	Translations$editor$toolbar$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => '切换颜色 (Ctrl C)';
	@override String get select => '选择';
	@override String get toggleEraser => '切换橡皮擦 (Ctrl E)';
	@override String get photo => '照片';
	@override String get text => '文本';
	@override String get toggleFingerDrawing => '切换手指绘图 (Ctrl F)';
	@override String get undo => '撤销';
	@override String get redo => '重做';
	@override String get export => '导出 (Ctrl Shift S)';
	@override String get exportAs => '导出为：';
	@override String get fullscreen => '切换全屏 (F11)';
}

// Path: editor.pens
class Translations$editor$pens$zh_Hans_CN extends Translations$editor$pens$en {
	Translations$editor$pens$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

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
class Translations$editor$penOptions$zh_Hans_CN extends Translations$editor$penOptions$en {
	Translations$editor$penOptions$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get size => '粗细';
}

// Path: editor.colors
class Translations$editor$colors$zh_Hans_CN extends Translations$editor$colors$en {
	Translations$editor$colors$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

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
class Translations$editor$imageOptions$zh_Hans_CN extends Translations$editor$imageOptions$en {
	Translations$editor$imageOptions$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

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
class Translations$editor$selectionBar$zh_Hans_CN extends Translations$editor$selectionBar$en {
	Translations$editor$selectionBar$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get delete => '删除';
	@override String get duplicate => '复制';
}

// Path: editor.menu
class Translations$editor$menu$zh_Hans_CN extends Translations$editor$menu$en {
	Translations$editor$menu$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => '清除页面 ${page}/${totalPages}';
	@override String get clearAllPages => '清除全部页面';
	@override String get insertPage => '在下方插入页面';
	@override String get duplicatePage => '复制页面';
	@override String get deletePage => '删除页面';
	@override String get lineHeight => '行高';
	@override String get lineHeightDescription => '同时控制已输入的笔记的文本大小';
	@override String get lineThickness => '线条粗细';
	@override String get lineThicknessDescription => '背景线条粗细';
	@override String get backgroundImageFit => '背景图像拟合';
	@override String get backgroundPattern => '背景图案';
	@override String get import => '导入';
	@override String get watchServer => '监视服务器上的更新';
	@override String get watchServerReadOnly => '监视服务器时禁用编辑';
	@override late final Translations$editor$menu$boxFits$zh_Hans_CN boxFits = Translations$editor$menu$boxFits$zh_Hans_CN.internal(_root);
	@override late final Translations$editor$menu$bgPatterns$zh_Hans_CN bgPatterns = Translations$editor$menu$bgPatterns$zh_Hans_CN.internal(_root);
}

// Path: editor.readOnlyBanner
class Translations$editor$readOnlyBanner$zh_Hans_CN extends Translations$editor$readOnlyBanner$en {
	Translations$editor$readOnlyBanner$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '只读模式';
	@override String get watchingServer => '当前正在监视服务器的更新，此模式下编辑功能已禁用。';
	@override String get corrupted => '无法加载笔记。它可能已损坏或仍在下载中。';
}

// Path: editor.versionTooNew
class Translations$editor$versionTooNew$zh_Hans_CN extends Translations$editor$versionTooNew$en {
	Translations$editor$versionTooNew$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get title => '此笔记使用新版 Saber 编辑而成';
	@override String get subtitle => '编辑此笔记可能会导致某些信息丢失。您想忽略并编辑吗？';
	@override String get allowEditing => '允许编辑';
}

// Path: editor.quill
class Translations$editor$quill$zh_Hans_CN extends Translations$editor$quill$en {
	Translations$editor$quill$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => '在这里输入...';
}

// Path: editor.hud
class Translations$editor$hud$zh_Hans_CN extends Translations$editor$hud$en {
	Translations$editor$hud$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => '解锁缩放';
	@override String get lockZoom => '锁定缩放';
	@override String get unlockSingleFingerPan => '启用单指平移';
	@override String get lockSingleFingerPan => '禁用单指平移';
	@override String get unlockAxisAlignedPan => '解锁水平或垂直平移';
	@override String get lockAxisAlignedPan => '锁定水平或垂直平移';
}

// Path: sentry.consent.description
class Translations$sentry$consent$description$zh_Hans_CN extends Translations$sentry$consent$description$en {
	Translations$sentry$consent$description$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get question => '您是否希望自动报告意外错误？这有助于我更快地发现和修复问题。';
	@override String get scope => '报告可能包含有关错误和设备的信息。我已尽力过滤个人数据，但仍可能残留部分信息。';
	@override String get currentlyOff => '若同意启用，重启应用后错误报告功能将激活。';
	@override String get currentlyOn => '若撤销同意，请重启应用以禁用错误报告功能。';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: '详见'),
		link('隐私政策'),
		const TextSpan(text: '。'),
	]);
}

// Path: sentry.consent.answers
class Translations$sentry$consent$answers$zh_Hans_CN extends Translations$sentry$consent$answers$en {
	Translations$sentry$consent$answers$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get yes => '同意';
	@override String get no => '拒绝';
	@override String get later => '稍后询问';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class Translations$settings$prefDescriptions$hideFingerDrawing$zh_Hans_CN extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	Translations$settings$prefDescriptions$hideFingerDrawing$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get shown => '防止意外切换';
	@override String get fixedOn => '手指绘图固定为启用状态';
	@override String get fixedOff => '手指绘图固定为禁用状态';
}

// Path: settings.prefDescriptions.sentry
class Translations$settings$prefDescriptions$sentry$zh_Hans_CN extends Translations$settings$prefDescriptions$sentry$en {
	Translations$settings$prefDescriptions$sentry$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get active => '已启用';
	@override String get inactive => '已禁用';
	@override String get activeUntilRestart => '重启前保持启用';
	@override String get inactiveUntilRestart => '重启前保持禁用';
}

// Path: login.ncLoginStep.loginFlow
class Translations$login$ncLoginStep$loginFlow$zh_Hans_CN extends Translations$login$ncLoginStep$loginFlow$en {
	Translations$login$ncLoginStep$loginFlow$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => '请授权 Saber 访问您的 Nextcloud 帐户';
	@override String get followPrompts => '请按照 Nextcloud 界面中的提示操作';
	@override String get browserDidntOpen => '登录页面没有打开？点击这里';
}

// Path: login.encLoginStep.encFaq.0
class Translations$login$encLoginStep$encFaq$0$zh_Hans_CN extends Translations$login$encLoginStep$encFaq$0$en {
	Translations$login$encLoginStep$encFaq$0$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '什么是加密密码？为什么要使用两个密码？';
	@override String get a => 'Nextcloud 密码用于访问云。加密密码会在您的数据到达云之前对其进行“加扰”。\n即使有人获得了您的 Nextcloud 帐户的访问权限，您的笔记也将保持安全并使用单独的密码进行加密。这为您提供了第二层安全保护，以保护您的数据。\n没有您的加密密码，任何人都无法访问您在服务器上的笔记，但这也意味着如果您忘记了加密密码，您将无法访问您的数据。';
}

// Path: login.encLoginStep.encFaq.1
class Translations$login$encLoginStep$encFaq$1$zh_Hans_CN extends Translations$login$encLoginStep$encFaq$1$en {
	Translations$login$encLoginStep$encFaq$1$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '我还没有设置加密密码。我在哪里可以买到它？';
	@override String get a => '选择新的加密密码并在上面输入。\nSaber 将从此密码自动生成您的加密密钥。';
}

// Path: login.encLoginStep.encFaq.2
class Translations$login$encLoginStep$encFaq$2$zh_Hans_CN extends Translations$login$encLoginStep$encFaq$2$en {
	Translations$login$encLoginStep$encFaq$2$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get q => '我可以使用与我的 Nextcloud 帐户相同的密码吗？';
	@override String get a => '是的，但请记住，如果服务器管理员或其他人可以访问您的 Nextcloud 帐户，他们将更容易访问您的笔记。';
}

// Path: editor.menu.boxFits
class Translations$editor$menu$boxFits$zh_Hans_CN extends Translations$editor$menu$boxFits$en {
	Translations$editor$menu$boxFits$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

	final TranslationsZhHansCn _root; // ignore: unused_field

	// Translations
	@override String get fill => '拉伸';
	@override String get cover => '覆盖';
	@override String get contain => '包含';
}

// Path: editor.menu.bgPatterns
class Translations$editor$menu$bgPatterns$zh_Hans_CN extends Translations$editor$menu$bgPatterns$en {
	Translations$editor$menu$bgPatterns$zh_Hans_CN.internal(TranslationsZhHansCn root) : this._root = root, super.internal(root);

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
	@override String get cornell => '康奈尔';
}
