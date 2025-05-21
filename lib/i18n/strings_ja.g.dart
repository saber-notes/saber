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
class TranslationsJa extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsJa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsJa _root = this; // ignore: unused_field

	@override 
	TranslationsJa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsJa(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonJa common = _TranslationsCommonJa._(_root);
	@override late final _TranslationsHomeJa home = _TranslationsHomeJa._(_root);
	@override late final _TranslationsSettingsJa settings = _TranslationsSettingsJa._(_root);
	@override late final _TranslationsLogsJa logs = _TranslationsLogsJa._(_root);
	@override late final _TranslationsLoginJa login = _TranslationsLoginJa._(_root);
	@override late final _TranslationsProfileJa profile = _TranslationsProfileJa._(_root);
	@override late final _TranslationsAppInfoJa appInfo = _TranslationsAppInfoJa._(_root);
	@override late final _TranslationsUpdateJa update = _TranslationsUpdateJa._(_root);
	@override late final _TranslationsEditorJa editor = _TranslationsEditorJa._(_root);
}

// Path: common
class _TranslationsCommonJa extends TranslationsCommonEn {
	_TranslationsCommonJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get cancel => '取消';
	@override String get done => '終わり';
	@override String get continueBtn => '続く';
}

// Path: home
class _TranslationsHomeJa extends TranslationsHomeEn {
	_TranslationsHomeJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsJa tabs = _TranslationsHomeTabsJa._(_root);
	@override late final _TranslationsHomeTitlesJa titles = _TranslationsHomeTitlesJa._(_root);
	@override late final _TranslationsHomeTooltipsJa tooltips = _TranslationsHomeTooltipsJa._(_root);
	@override late final _TranslationsHomeCreateJa create = _TranslationsHomeCreateJa._(_root);
	@override String get welcome => 'ようこそSaberへ';
	@override String get noFiles => 'ファイルが見つかりません';
	@override String get noPreviewAvailable => 'プレビューは利用できません';
	@override String get createNewNote => '+ボタンで新しくメモを作成';
	@override late final _TranslationsHomeNewFolderJa newFolder = _TranslationsHomeNewFolderJa._(_root);
	@override late final _TranslationsHomeRenameNoteJa renameNote = _TranslationsHomeRenameNoteJa._(_root);
	@override late final _TranslationsHomeMoveNoteJa moveNote = _TranslationsHomeMoveNoteJa._(_root);
	@override late final _TranslationsHomeRenameFolderJa renameFolder = _TranslationsHomeRenameFolderJa._(_root);
	@override late final _TranslationsHomeDeleteFolderJa deleteFolder = _TranslationsHomeDeleteFolderJa._(_root);
	@override String get backFolder => '前のフォルダーに戻ります';
	@override String get deleteNote => 'メモの削除';
	@override String get invalidFormat => '選択したファイルはサポートされていません。 .sbn、.sbn2、.sba、または .pdf ファイルを選択してください。';
}

// Path: settings
class _TranslationsSettingsJa extends TranslationsSettingsEn {
	_TranslationsSettingsJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesJa prefCategories = _TranslationsSettingsPrefCategoriesJa._(_root);
	@override late final _TranslationsSettingsPrefLabelsJa prefLabels = _TranslationsSettingsPrefLabelsJa._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsJa prefDescriptions = _TranslationsSettingsPrefDescriptionsJa._(_root);
	@override late final _TranslationsSettingsThemeModesJa themeModes = _TranslationsSettingsThemeModesJa._(_root);
	@override late final _TranslationsSettingsLayoutSizesJa layoutSizes = _TranslationsSettingsLayoutSizesJa._(_root);
	@override late final _TranslationsSettingsAccentColorPickerJa accentColorPicker = _TranslationsSettingsAccentColorPickerJa._(_root);
	@override String get systemLanguage => 'システムの言語';
	@override List<String> get axisDirections => [
		'上部',
		'右側',
		'下部',
		'左側',
	];
	@override late final _TranslationsSettingsResetJa reset = _TranslationsSettingsResetJa._(_root);
	@override late final _TranslationsSettingsCustomDataDirJa customDataDir = _TranslationsSettingsCustomDataDirJa._(_root);
	@override String get openDataDir => 'セイバーフォルダを開く';
	@override String get resyncEverything => 'すべてを再同期する';
}

// Path: logs
class _TranslationsLogsJa extends TranslationsLogsEn {
	_TranslationsLogsJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get logs => 'ログ';
	@override String get viewLogs => 'ログを表示';
	@override String get debuggingInfo => 'ログにはデバッグや開発に役立つ情報が含まれています';
	@override String get noLogs => 'ここにはログはありません!';
	@override String get logsAreTemporary => 'ログはアプリを閉じるまで保存されます';
}

// Path: login
class _TranslationsLoginJa extends TranslationsLoginEn {
	_TranslationsLoginJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ログイン';
	@override late final _TranslationsLoginFormJa form = _TranslationsLoginFormJa._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'まだアカウントをお持ちでないですか？ '),
		linkToSignup('今すぐ登録'),
		const TextSpan(text: '!'),
	]);
	@override late final _TranslationsLoginStatusJa status = _TranslationsLoginStatusJa._(_root);
	@override late final _TranslationsLoginNcLoginStepJa ncLoginStep = _TranslationsLoginNcLoginStepJa._(_root);
	@override late final _TranslationsLoginEncLoginStepJa encLoginStep = _TranslationsLoginEncLoginStepJa._(_root);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		undoLogin('あなたではありません'),
	]);
}

// Path: profile
class _TranslationsProfileJa extends TranslationsProfileEn {
	_TranslationsProfileJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'プロフィール';
	@override String get logout => 'ログアウト';
	@override late final _TranslationsProfileQuickLinksJa quickLinks = _TranslationsProfileQuickLinksJa._(_root);
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$Ja._(_root),
		_TranslationsProfile$faq$0i1$Ja._(_root),
		_TranslationsProfile$faq$0i2$Ja._(_root),
		_TranslationsProfile$faq$0i3$Ja._(_root),
	];
	@override String quotaUsage({required Object total, required Object percent, required Object used}) => '${total} (${percent}%) のうち ${used} を使用しています';
	@override String get connectedTo => 'に接続されています';
	@override String get faqTitle => 'よくある質問';
}

// Path: appInfo
class _TranslationsAppInfoJa extends TranslationsAppInfoEn {
	_TranslationsAppInfoJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nこのプログラムには一切の保証がありません。これはフリーソフトウェアであり、一定の条件下で再配布することを歓迎します。';
	@override String get dirty => 'DIRTY';
	@override String get debug => 'デバッグ';
	@override String get sponsorButton => '私のスポンサーになる、またはストレージを購入する際は、ここをタップしてください。';
	@override String get licenseButton => 'ライセンス情報を見るには、ここをタップして';
	@override String get privacyPolicyButton => 'プライバシーポリシーを見るには、ここをタップして';
}

// Path: update
class _TranslationsUpdateJa extends TranslationsUpdateEn {
	_TranslationsUpdateJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => '更新が可能です';
	@override String get updateAvailableDescription => '新バージョンのアプリがリリースされ、以下の変更があった：';
	@override String get update => '更新';
	@override String get downloadNotAvailableYet => 'お使いのプラットフォームではまだダウンロードできません。しばらくしてからもう一度ご確認ください。';
}

// Path: editor
class _TranslationsEditorJa extends TranslationsEditorEn {
	_TranslationsEditorJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarJa toolbar = _TranslationsEditorToolbarJa._(_root);
	@override late final _TranslationsEditorPensJa pens = _TranslationsEditorPensJa._(_root);
	@override late final _TranslationsEditorPenOptionsJa penOptions = _TranslationsEditorPenOptionsJa._(_root);
	@override late final _TranslationsEditorColorsJa colors = _TranslationsEditorColorsJa._(_root);
	@override late final _TranslationsEditorImageOptionsJa imageOptions = _TranslationsEditorImageOptionsJa._(_root);
	@override late final _TranslationsEditorSelectionBarJa selectionBar = _TranslationsEditorSelectionBarJa._(_root);
	@override late final _TranslationsEditorMenuJa menu = _TranslationsEditorMenuJa._(_root);
	@override late final _TranslationsEditorNewerFileFormatJa newerFileFormat = _TranslationsEditorNewerFileFormatJa._(_root);
	@override late final _TranslationsEditorQuillJa quill = _TranslationsEditorQuillJa._(_root);
	@override late final _TranslationsEditorHudJa hud = _TranslationsEditorHudJa._(_root);
	@override String get pages => 'ページ';
	@override String get untitled => '無題';
	@override String get needsToSaveBeforeExiting => '変更を保存する... 編集が終わったら、エディターを安全に終了することができます。';
}

// Path: home.tabs
class _TranslationsHomeTabsJa extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get home => 'ホーム';
	@override String get browse => '閲覧';
	@override String get whiteboard => 'ホワイトボード';
	@override String get settings => '設定';
}

// Path: home.titles
class _TranslationsHomeTitlesJa extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get home => '最近のメモ';
	@override String get whiteboard => 'ホワイトボード';
	@override String get settings => '設定';
	@override String get browse => '閲覧';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsJa extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新しいメモ';
	@override String get showUpdateDialog => '更新ダイアログの表示';
	@override String get exportNote => 'エクスポートメモ';
}

// Path: home.create
class _TranslationsHomeCreateJa extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新しいメモ';
	@override String get importNote => 'インポートメモ';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderJa extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get newFolder => '新しいフォルダー';
	@override String get folderName => 'フォルダー名';
	@override String get create => '作成';
	@override String get folderNameEmpty => 'フォルダー名は空欄にすることはできません';
	@override String get folderNameContainsSlash => 'フォルダー名にはスラッシュを使用できません';
	@override String get folderNameExists => '同一のフォルダー名がすでに存在します';
}

// Path: home.renameNote
class _TranslationsHomeRenameNoteJa extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'メモのタイトルを変更';
	@override String get noteName => 'メモのタイトル';
	@override String get rename => '名称変更';
	@override String get noteNameEmpty => 'メモのタイトルは空欄にすることはできません';
	@override String get noteNameContainsSlash => 'メモのタイトルにはスラッシュを使用できません';
	@override String get noteNameExists => '同一のタイトルがすでに存在します';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteJa extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'メモを移動';
	@override String moveName({required Object f}) => '${f} を移動';
	@override String get move => '移動';
	@override String renamedTo({required Object newName}) => '${newName} に名称を変更した';
	@override String moveNotes({required Object n}) => '${n}のノートを移動する';
	@override String get multipleRenamedTo => '次のメモの名前が変更されます。';
	@override String numberRenamedTo({required Object n}) => '${n} のノートは、競合を避けるために名前を変更されます';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderJa extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get folderNameEmpty => 'フォルダー名を空にすることはできません';
	@override String get renameFolder => 'フォルダーの名前を変更する';
	@override String get folderName => 'フォルダ名';
	@override String get rename => '名前の変更';
	@override String get folderNameContainsSlash => 'フォルダ名はスラッシュを含まない';
	@override String get folderNameExists => 'この名前のフォルダーはすでに存在します';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderJa extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'フォルダの削除';
	@override String deleteName({required Object f}) => '${f}を削除';
	@override String get delete => '消去';
	@override String get alsoDeleteContents => 'このフォルダー内のすべてのメモも削除します';
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesJa extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get general => '一般';
	@override String get writing => '文章';
	@override String get editor => '編集';
	@override String get advanced => 'アドバンスド';
	@override String get performance => 'パフォーマンス';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsJa extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get locale => 'アプリの言語';
	@override String get appTheme => 'アプリのテーマ';
	@override String get platform => 'テーマの種類';
	@override String get layoutSize => 'レイアウトの種類';
	@override String get customAccentColor => 'オリジナルの色';
	@override String get hyperlegibleFont => 'Hyperlegible フォント';
	@override String get shouldCheckForUpdates => 'Saberの更新を自動的に確認する';
	@override String get allowInsecureConnections => '安全でない接続を許可する';
	@override String get editorToolbarAlignment => '編集ツールバーの位置調整';
	@override String get editorToolbarShowInFullscreen => 'フルスクリーンモードで編集ツールバーを表示する';
	@override String get editorAutoInvert => 'ダークモードでメモを反転';
	@override String get preferGreyscale => 'グレースケールを優先';
	@override String get maxImageSize => '最大画像サイズ';
	@override String get autoClearWhiteboardOnExit => 'アプリを終了したらホワイトボードを消去する';
	@override String get editorPromptRename => '新しいメモの名前を変更するよう促す';
	@override String get hideHomeBackgrounds => 'ホーム画面で背景を隠す';
	@override String get recentColorsDontSavePresets => '最近使用した色をプリセットに登録しない';
	@override String get printPageIndicators => '印刷ページのインジケーター';
	@override String get simplifiedHomeLayout => '簡素化されたホームレイアウト';
	@override String get pencilSoundSetting => '鉛筆の効果音';
	@override String get customDataDir => 'カスタムデータディレクトリ';
	@override String get autoStraightenLines => '線を自動直線化する';
	@override String get shapeRecognitionDelay => '形状認識の遅延';
	@override String get recentColorsLength => '最近使用した色を何色保存するか';
	@override String get autosaveDelay => '自動保存の遅延';
	@override String get hideFingerDrawingToggle => '指の描画トグルを非表示にする';
	@override String get shouldAlwaysAlertForUpdates => 'アップデートの高速化';
	@override String get disableEraserAfterUse => '消しゴムを自動的に無効にする';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsJa extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegibleは、弱視読者の読みやすさを向上させます。';
	@override String get allowInsecureConnections => '(非推奨) Saber が自己署名/信頼できない証明書を持つサーバーに接続できるようにする';
	@override String get preferGreyscale => 'e-inkディスプレイ用';
	@override String get autoClearWhiteboardOnExit => '他のデバイスと同期されます';
	@override String get maxImageSize => 'これより大きな画像は圧縮されます';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingJa hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingJa._(_root);
	@override String get editorPromptRename => 'メモの名前は後でいつでも変更できます';
	@override String get hideHomeBackgrounds => 'よりクリーンな外観に';
	@override String get printPageIndicators => 'エクスポートにページインジケーターを表示';
	@override late final _TranslationsSettingsPrefDescriptionsPencilSoundSettingJa pencilSoundSetting = _TranslationsSettingsPrefDescriptionsPencilSoundSettingJa._(_root);
	@override String get simplifiedHomeLayout => '各ノートのプレビューに固定の高さを設定します';
	@override String get autoStraightenLines => 'シェイプペンを使用せずに長い線をまっすぐにします。';
	@override String get shapeRecognitionDelay => '形状プレビューを更新する頻度';
	@override String get autosaveDelay => 'メモを自動保存するまでの待ち時間';
	@override String get disableEraserAfterUse => '消しゴムを使用した後は自動的にペンに戻ります';
	@override String get shouldAlwaysAlertForUpdates => 'アップデートが利用可能になり次第お知らせください';
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesJa extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get system => 'システム';
	@override String get light => 'ライト';
	@override String get dark => 'ダーク';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesJa extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get auto => '自動';
	@override String get phone => '電話';
	@override String get tablet => 'タブレット';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerJa extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => '色を選択する';
}

// Path: settings.reset
class _TranslationsSettingsResetJa extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'この設定をリセットしますか？';
	@override String get button => 'リセット';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirJa extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'キャンセル';
	@override String get select => '選択する';
	@override String get mustBeEmpty => '選択したディレクトリは空である必要があります';
	@override String get mustBeDoneSyncing => 'ディレクトリを変更する前に同期が完了していることを確認してください';
}

// Path: login.form
class _TranslationsLoginFormJa extends TranslationsLoginFormEn {
	_TranslationsLoginFormJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'ログインすることにより、'),
		linkToPrivacyPolicy('プライベートポリシー'),
		const TextSpan(text: 'に同意したものとみなされます。'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusJa extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'ログアウト';
	@override String get tapToLogin => 'タップしてNextcloudにログイン';
	@override String get loggedIn => 'Nextcloudでログイン';
	@override String hi({required Object u}) => 'こんにちは、${u}!';
	@override String get almostDone => '同期の準備がほぼ完了しました。タップしてログインを完了してください';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepJa extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsLoginNcLoginStepLoginFlowJa loginFlow = _TranslationsLoginNcLoginStepLoginFlowJa._(_root);
	@override String get whereToStoreData => 'データを保存する場所を選択します:';
	@override String get saberNcServer => 'Saber の Nextcloud サーバー';
	@override String get otherNcServer => '他のNextcloudサーバー';
	@override String get serverUrl => 'サーバーURL';
	@override String get loginWithSaber => 'セイバーでログイン';
	@override String get loginWithNextcloud => 'Nextcloudでログイン';
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepJa extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'データを保護するには、暗号化パスワードを入力してください:';
	@override String get newToSaber => 'セイバー初心者';
	@override String get encPassword => '暗号化パスワード';
	@override String get encFaqTitle => 'よくある質問';
	@override String get wrongEncPassword => '指定されたパスワードでは復号化に失敗しました。もう一度入力してみてください。';
	@override String get connectionFailed => 'サーバーへの接続中に問題が発生しました。後でもう一度試してください。';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$Ja._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$Ja._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$Ja._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksJa extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'サーバーホームページ';
	@override String get deleteAccount => 'アカウントの削除';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$Ja extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$Ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get q => 'ログアウトするとメモが消えてしまいますか？';
	@override String get a => 'いいえ。メモはデバイスとサーバーの両方に残ります。ログインし直すまで、サーバーとは同期されません。データを失わないように、ログアウトする前に同期が完了したことを確認してください（ホーム画面の同期進行状況をご覧ください）。';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$Ja extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$Ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nextcloudのパスワードを変更する方法を教えてください';
	@override String get a => 'サーバーのウェブサイトにアクセスし、ログインします。「設定」>「セキュリティ」>「パスワードの変更」を選択します。パスワード変更後は、Saberからログアウトし、再度ログインする必要があります。';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$Ja extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$Ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get q => '暗号化パスワードの変更方法を教えてください。';
	@override String get a => '1. Saberからログアウトする。データが失われないように、ログアウトする前に同期が完了していることを確認してください（ホーム画面で同期の進行状況を確認できます）。\n2. サーバーのウェブサイトにアクセスし、「Saber」フォルダを削除してください。これにより、サーバーからすべてのメモが削除されます。\n3. セーバーに再ログインする。ログイン時に新しい暗号化パスワードを選択できます。\n4. 他のデバイスでもログアウトしてログインし直すことをお忘れなく。';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$Ja extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$Ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get q => 'アカウントを削除するにはどうすればよいですか？';
	@override String get a => '上部の"${_root.profile.quickLinks.deleteAccount}"ボタンをタップし、必要であればログインしてください。Saber公式サーバーを利用している場合、1週間の猶予期間の後にアカウントが削除されます。この期間中であれば、adilhanney@disroot.orgまでご連絡いただければ、削除を取り消すことが可能です。サードパーティのサーバーをご利用の場合、アカウントを削除するオプションがない場合があります。詳細については、ご利用のサーバープライバシーポリシーをご確認ください。';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarJa extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => '色の切り替え (Ctrl C)';
	@override String get select => '選択';
	@override String get toggleEraser => '消しゴムに切り替え (Ctrl E)';
	@override String get photo => '画像';
	@override String get text => 'テキスト';
	@override String get toggleFingerDrawing => '指での描画に切り替え (Ctrl F)';
	@override String get undo => '元に戻す';
	@override String get redo => 'やり直す';
	@override String get export => 'エクスポート (Ctrl Shift S)';
	@override String get exportAs => '次にエキスポート:';
	@override String get fullscreen => 'フルスクリーンに切り替え (F11)';
}

// Path: editor.pens
class _TranslationsEditorPensJa extends TranslationsEditorPensEn {
	_TranslationsEditorPensJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => '万年筆';
	@override String get ballpointPen => 'ボールペン';
	@override String get highlighter => '蛍光ペン';
	@override String get laserPointer => 'レーザーポインター';
	@override String get pencil => '鉛筆';
	@override String get shapePen => 'シェイプペン';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsJa extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get size => 'サイズ';
}

// Path: editor.colors
class _TranslationsEditorColorsJa extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'カラーピッカー';
	@override String get black => '黒';
	@override String get darkGrey => '濃い灰色';
	@override String get grey => '灰色';
	@override String get lightGrey => '明るい灰色';
	@override String get white => '白色';
	@override String get red => '赤色';
	@override String get green => '緑色';
	@override String get blue => '青色';
	@override String get yellow => '黄色';
	@override String get purple => '紫色';
	@override String get orange => '橙色';
	@override String get pastelRed => 'パステル・赤';
	@override String get pastelOrange => 'パステル・橙色';
	@override String get pastelYellow => 'パステル・黄色';
	@override String get pastelGreen => 'パステル・緑色';
	@override String get pastelCyan => 'パステル・青緑色';
	@override String get pastelBlue => 'パステル・青色';
	@override String get pastelPurple => 'パステル・紫色';
	@override String get pastelPink => 'パステル・桃色';
	@override String customBrightnessHue({required Object b, required Object h}) => 'カスタム ${b} ${h}';
	@override String customHue({required Object h}) => 'カスタム ${h}';
	@override String get dark => '暗い';
	@override String get light => 'ライト';
	@override String get cyan => 'シアン';
	@override String get pink => 'ピンク';
}

// Path: editor.imageOptions
class _TranslationsEditorImageOptionsJa extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '画像オプション';
	@override String get invertible => '不可逆';
	@override String get download => 'ダウンロード';
	@override String get setAsBackground => '背景に設定';
	@override String get removeAsBackground => '背景として削除';
	@override String get delete => '削除';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarJa extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get delete => '削除';
	@override String get duplicate => '重複';
}

// Path: editor.menu
class _TranslationsEditorMenuJa extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'ページを削除 ${page}/${totalPages}';
	@override String get clearAllPages => 'すべてのページを消去する';
	@override String get insertPage => '以下のページを挿入';
	@override String get duplicatePage => '重複したページ';
	@override String get deletePage => 'ページの削除';
	@override String get lineHeight => '行の高さ';
	@override String get backgroundPattern => '背景パターン';
	@override String get import => 'インポート';
	@override late final _TranslationsEditorMenuBoxFitsJa boxFits = _TranslationsEditorMenuBoxFitsJa._(_root);
	@override late final _TranslationsEditorMenuBgPatternsJa bgPatterns = _TranslationsEditorMenuBgPatternsJa._(_root);
	@override String get lineThickness => '線の厚さ';
	@override String get lineThicknessDescription => '背景線の厚さ';
	@override String get watchServer => 'サーバー上の更新を監視する';
	@override String get watchServerReadOnly => 'サーバー監視中は編集できません';
	@override String get lineHeightDescription => '入力されたメモのテキスト サイズも制御します';
	@override String get backgroundImageFit => '背景画像';
}

// Path: editor.newerFileFormat
class _TranslationsEditorNewerFileFormatJa extends TranslationsEditorNewerFileFormatEn {
	_TranslationsEditorNewerFileFormatJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => '読み取り専用モード';
	@override String get title => 'このメモは新しいバージョンのSaberを使用して編集されたものです';
	@override String get subtitle => 'このメモを編集すると、いくつかの情報が失われる可能性があります。これを無視して編集しますか？';
	@override String get allowEditing => '編集を許可する';
}

// Path: editor.quill
class _TranslationsEditorQuillJa extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'ここに何かを入力してください...';
}

// Path: editor.hud
class _TranslationsEditorHudJa extends TranslationsEditorHudEn {
	_TranslationsEditorHudJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'ズームの解除';
	@override String get lockZoom => 'ズームを固定する';
	@override String get unlockSingleFingerPan => '一本指でのパン操作を有効にする';
	@override String get lockSingleFingerPan => '一本指でのパン操作を無効にする';
	@override String get unlockAxisAlignedPan => '水平または垂直へのパンロックを解除';
	@override String get lockAxisAlignedPan => 'パンニングを水平または垂直にロックする';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingJa extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get fixedOn => '指の描画が有効に固定される';
	@override String get shown => '偶発的な切り替えを防止します';
	@override String get fixedOff => '指の描画が無効に固定される';
}

// Path: settings.prefDescriptions.pencilSoundSetting
class _TranslationsSettingsPrefDescriptionsPencilSoundSettingJa extends TranslationsSettingsPrefDescriptionsPencilSoundSettingEn {
	_TranslationsSettingsPrefDescriptionsPencilSoundSettingJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get off => '無音';
	@override String get onButNotInSilentMode => '有効 (サイレントモードでない場合)';
	@override String get onAlways => '有効（サイレントモードでも）';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowJa extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Saber に Nextcloud アカウントへのアクセスを許可してください';
	@override String get followPrompts => 'ブラウザの指示に従ってください。';
	@override String get browserDidntOpen => 'ブラウザが開きませんでした';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$Ja extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$Ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get q => '暗号化パスワードは何ですか？';
	@override String get a => '暗号化パスワードは、サーバーに送信する前にデータを暗号化するために使用されます。Saberに最初にログインする際に選択するもので、Nextcloudのアカウントやパスワードとは関係ありません。\n暗号化パスワードがなければ、誰もサーバー上のメモにアクセスすることはできません。また、暗号化パスワードを忘れると、データにアクセスすることができなくなります。';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$Ja extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$Ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get q => 'なぜ2つのパスワードを使うのですか？';
	@override String get a => 'Nextcloudのパスワードはクラウドに接続するために使用されます。暗号化パスワードを用いてデータがクラウドに届く前にデータを "暗号化" します。\nそのため、たとえ誰かがあなたのNextcloudアカウントにアクセスしたとしても、メモは別のパスワードで暗号化されている状態になります。これにより、Saberのデーターは2重に保護されます。';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$Ja extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$Ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get q => '両方に同じパスワードを使用できますか？';
	@override String get a => '可能ですが、そうすれば安全性が低下します。Nextcloudのパスワードはサーバーに送信されるため、サーバーにアクセスできる人はメモを解読することができます。サーバーの所有者を信頼できる場合にのみ、同じパスワードを使用してください。';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsJa extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get fill => '貼る';
	@override String get cover => 'カバー';
	@override String get contain => 'コンテイン';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsJa extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsJa._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get none => '空白';
	@override String get college => '罫線';
	@override String get collegeRtl => '罫線 (反転)';
	@override String get lined => '線';
	@override String get grid => '格子';
	@override String get dots => '点';
	@override String get staffs => 'スタッフ';
	@override String get cornell => '角';
	@override String get tablature => 'タベルチュア';
}
