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
class TranslationsJa extends Translations with BaseTranslations<AppLocale, Translations> {
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
	@override late final _Translations$common$ja common = _Translations$common$ja._(_root);
	@override late final _Translations$home$ja home = _Translations$home$ja._(_root);
	@override late final _Translations$sentry$ja sentry = _Translations$sentry$ja._(_root);
	@override late final _Translations$settings$ja settings = _Translations$settings$ja._(_root);
	@override late final _Translations$logs$ja logs = _Translations$logs$ja._(_root);
	@override late final _Translations$login$ja login = _Translations$login$ja._(_root);
	@override late final _Translations$profile$ja profile = _Translations$profile$ja._(_root);
	@override late final _Translations$appInfo$ja appInfo = _Translations$appInfo$ja._(_root);
	@override late final _Translations$update$ja update = _Translations$update$ja._(_root);
	@override late final _Translations$editor$ja editor = _Translations$editor$ja._(_root);
}

// Path: common
class _Translations$common$ja extends Translations$common$en {
	_Translations$common$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get done => '完了';
	@override String get continueBtn => '続ける';
	@override String get cancel => '取消';
}

// Path: home
class _Translations$home$ja extends Translations$home$en {
	_Translations$home$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$ja tabs = _Translations$home$tabs$ja._(_root);
	@override late final _Translations$home$titles$ja titles = _Translations$home$titles$ja._(_root);
	@override late final _Translations$home$tooltips$ja tooltips = _Translations$home$tooltips$ja._(_root);
	@override late final _Translations$home$create$ja create = _Translations$home$create$ja._(_root);
	@override String get welcome => 'ようこそSaberへ';
	@override String get invalidFormat => '選択されたファイルはサポートされていません。sbn/sbn2 ファイルか、PDFファイルを選択してください。';
	@override String get noFiles => 'ファイルが見つかりません';
	@override String get noPreviewAvailable => 'プレビューがありません';
	@override String get createNewNote => '+ボタンで新しくメモを作成';
	@override String get backFolder => '前のフォルダに戻る';
	@override late final _Translations$home$newFolder$ja newFolder = _Translations$home$newFolder$ja._(_root);
	@override late final _Translations$home$renameNote$ja renameNote = _Translations$home$renameNote$ja._(_root);
	@override late final _Translations$home$moveNote$ja moveNote = _Translations$home$moveNote$ja._(_root);
	@override String get deleteNote => 'メモを削除';
	@override late final _Translations$home$deleteNoteDialog$ja deleteNoteDialog = _Translations$home$deleteNoteDialog$ja._(_root);
	@override late final _Translations$home$renameFolder$ja renameFolder = _Translations$home$renameFolder$ja._(_root);
	@override late final _Translations$home$deleteFolder$ja deleteFolder = _Translations$home$deleteFolder$ja._(_root);
}

// Path: sentry
class _Translations$sentry$ja extends Translations$sentry$en {
	_Translations$sentry$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$ja consent = _Translations$sentry$consent$ja._(_root);
}

// Path: settings
class _Translations$settings$ja extends Translations$settings$en {
	_Translations$settings$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$ja prefCategories = _Translations$settings$prefCategories$ja._(_root);
	@override late final _Translations$settings$prefLabels$ja prefLabels = _Translations$settings$prefLabels$ja._(_root);
	@override late final _Translations$settings$prefDescriptions$ja prefDescriptions = _Translations$settings$prefDescriptions$ja._(_root);
	@override late final _Translations$settings$themeModes$ja themeModes = _Translations$settings$themeModes$ja._(_root);
	@override late final _Translations$settings$layoutSizes$ja layoutSizes = _Translations$settings$layoutSizes$ja._(_root);
	@override late final _Translations$settings$accentColorPicker$ja accentColorPicker = _Translations$settings$accentColorPicker$ja._(_root);
	@override String get systemLanguage => 'システムの言語';
	@override List<String> get axisDirections => [
		'上部',
		'右側',
		'下部',
		'左側',
	];
	@override late final _Translations$settings$reset$ja reset = _Translations$settings$reset$ja._(_root);
	@override String get resyncEverything => 'すべてを同期する';
	@override String get openDataDir => 'Saber フォルダーを開く';
	@override late final _Translations$settings$customDataDir$ja customDataDir = _Translations$settings$customDataDir$ja._(_root);
	@override String get autosaveDisabled => '一度もない';
	@override String get shapeRecognitionDisabled => '一度もない';
}

// Path: logs
class _Translations$logs$ja extends Translations$logs$en {
	_Translations$logs$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get logs => 'ログ';
	@override String get viewLogs => 'ログを表示';
	@override String get debuggingInfo => 'ログにはデバッグや開発に役立つ情報が含まれています';
	@override String get noLogs => 'ログはありません！';
	@override String get useTheApp => 'ログはアプリを使うと表示されます';
}

// Path: login
class _Translations$login$ja extends Translations$login$en {
	_Translations$login$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ログイン';
	@override late final _Translations$login$form$ja form = _Translations$login$form$ja._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'まだアカウントをお持ちでないですか？ '),
		linkToSignup('今すぐ登録'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'お問い合わせ '),
		undoLogin('別のアカウントを選択'),
		const TextSpan(text: '.'),
	]);
	@override late final _Translations$login$status$ja status = _Translations$login$status$ja._(_root);
	@override late final _Translations$login$ncLoginStep$ja ncLoginStep = _Translations$login$ncLoginStep$ja._(_root);
	@override late final _Translations$login$encLoginStep$ja encLoginStep = _Translations$login$encLoginStep$ja._(_root);
}

// Path: profile
class _Translations$profile$ja extends Translations$profile$en {
	_Translations$profile$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'プロフィール';
	@override String get logout => 'ログアウト';
	@override String quotaUsage({required Object total, required Object used, required Object percent}) => '${total} のうち、 ${used} (${percent}%) を使用しています。';
	@override String get connectedTo => '接続する';
	@override late final _Translations$profile$quickLinks$ja quickLinks = _Translations$profile$quickLinks$ja._(_root);
	@override String get faqTitle => 'よくある質問';
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$ja._(_root),
		_Translations$profile$faq$1$ja._(_root),
		_Translations$profile$faq$2$ja._(_root),
		_Translations$profile$faq$3$ja._(_root),
	];
}

// Path: appInfo
class _Translations$appInfo$ja extends Translations$appInfo$en {
	_Translations$appInfo$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nこのプログラムには一切の保証がありません。これはフリーソフトウェアであり、一定の条件下で再配布することを歓迎します。';
	@override String get debug => 'デバッグ';
	@override String get sponsorButton => '私のスポンサーになる、またはストレージを購入する際は、ここをタップしてください。';
	@override String get licenseButton => 'ライセンス情報を見るには、ここをタップして';
	@override String get privacyPolicyButton => 'プライバシーポリシーを見るには、ここをタップして';
}

// Path: update
class _Translations$update$ja extends Translations$update$en {
	_Translations$update$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => '更新が可能です';
	@override String get updateAvailableDescription => '新バージョンのアプリがリリースされ、以下の変更があった：';
	@override String get update => '更新';
	@override String get downloadNotAvailableYet => 'お使いのプラットフォームではまだダウンロードできません。しばらくしてからもう一度ご確認ください。';
}

// Path: editor
class _Translations$editor$ja extends Translations$editor$en {
	_Translations$editor$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$ja toolbar = _Translations$editor$toolbar$ja._(_root);
	@override late final _Translations$editor$pens$ja pens = _Translations$editor$pens$ja._(_root);
	@override late final _Translations$editor$penOptions$ja penOptions = _Translations$editor$penOptions$ja._(_root);
	@override late final _Translations$editor$colors$ja colors = _Translations$editor$colors$ja._(_root);
	@override late final _Translations$editor$imageOptions$ja imageOptions = _Translations$editor$imageOptions$ja._(_root);
	@override late final _Translations$editor$selectionBar$ja selectionBar = _Translations$editor$selectionBar$ja._(_root);
	@override late final _Translations$editor$menu$ja menu = _Translations$editor$menu$ja._(_root);
	@override late final _Translations$editor$readOnlyBanner$ja readOnlyBanner = _Translations$editor$readOnlyBanner$ja._(_root);
	@override late final _Translations$editor$versionTooNew$ja versionTooNew = _Translations$editor$versionTooNew$ja._(_root);
	@override late final _Translations$editor$quill$ja quill = _Translations$editor$quill$ja._(_root);
	@override late final _Translations$editor$hud$ja hud = _Translations$editor$hud$ja._(_root);
	@override String get pages => 'ページ';
	@override String get untitled => '無題';
	@override String get needsToSaveBeforeExiting => '変更を保存する... 編集が終わったら、エディターを安全に終了することができます。';
}

// Path: home.tabs
class _Translations$home$tabs$ja extends Translations$home$tabs$en {
	_Translations$home$tabs$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get home => 'ホーム';
	@override String get browse => '閲覧';
	@override String get whiteboard => 'ホワイトボード';
	@override String get settings => '設定';
}

// Path: home.titles
class _Translations$home$titles$ja extends Translations$home$titles$en {
	_Translations$home$titles$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get home => '最近のメモ';
	@override String get browse => '閲覧';
	@override String get whiteboard => 'ホワイトボード';
	@override String get settings => '設定';
}

// Path: home.tooltips
class _Translations$home$tooltips$ja extends Translations$home$tooltips$en {
	_Translations$home$tooltips$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新しいメモ';
	@override String get showUpdateDialog => '更新ダイアログの表示';
	@override String get exportNote => 'メモを書き出す';
}

// Path: home.create
class _Translations$home$create$ja extends Translations$home$create$en {
	_Translations$home$create$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get newNote => '新しいノート';
	@override String get importNote => 'ノートをインポートする';
}

// Path: home.newFolder
class _Translations$home$newFolder$ja extends Translations$home$newFolder$en {
	_Translations$home$newFolder$ja._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _Translations$home$renameNote$ja extends Translations$home$renameNote$en {
	_Translations$home$renameNote$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'メモのタイトルを変更';
	@override String get noteName => 'メモのタイトル';
	@override String get rename => '名称変更';
	@override String get noteNameEmpty => 'メモのタイトルは空欄にすることはできません';
	@override String get noteNameExists => '同一のタイトルがすでに存在します';
	@override String get noteNameForbiddenCharacters => '名前に使えない文字が含まれています';
	@override String get noteNameReserved => '名前は予約済みです';
}

// Path: home.moveNote
class _Translations$home$moveNote$ja extends Translations$home$moveNote$en {
	_Translations$home$moveNote$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'メモを移動';
	@override String moveNotes({required Object n}) => '${n}のノートを移動する';
	@override String moveName({required Object f}) => '${f} を移動';
	@override String get move => '移動';
	@override String renamedTo({required Object newName}) => '${newName} に名称を変更した';
	@override String get multipleRenamedTo => 'そのメモの名前が次のものに変更されます:';
	@override String numberRenamedTo({required Object n}) => '${n} のノートは、競合を避けるために名前を変更されます';
}

// Path: home.deleteNoteDialog
class _Translations$home$deleteNoteDialog$ja extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String deleteNotes({required Object n}) => '${n}のメモを削除';
	@override String deleteName({required Object f}) => '${f}を削除';
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(n,
		one: '選択されたメモを完全に削除しますか？',
		other: '選択されたメモを完全に削除しますか？',
	);
	@override String get delete => '削除';
}

// Path: home.renameFolder
class _Translations$home$renameFolder$ja extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'フォルダ名を変更';
	@override String get folderName => 'フォルダ名';
	@override String get rename => '名称変更';
	@override String get folderNameEmpty => 'フォルダー名を空欄にすることはできません';
	@override String get folderNameContainsSlash => 'フォルダー名にはスラッシュを使用できません';
	@override String get folderNameExists => 'この名前のフォルダーは既に存在します';
}

// Path: home.deleteFolder
class _Translations$home$deleteFolder$ja extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'フォルダを削除';
	@override String deleteName({required Object f}) => '${f}を削除';
	@override String get delete => '削除';
	@override String get alsoDeleteContents => 'フォルダ内のメモも全て削除する';
}

// Path: sentry.consent
class _Translations$sentry$consent$ja extends Translations$sentry$consent$en {
	_Translations$sentry$consent$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Saver アプリの改善を助けますか？';
	@override late final _Translations$sentry$consent$description$ja description = _Translations$sentry$consent$description$ja._(_root);
	@override late final _Translations$sentry$consent$answers$ja answers = _Translations$sentry$consent$answers$ja._(_root);
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$ja extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get general => '一般';
	@override String get writing => '文章';
	@override String get editor => '編集';
	@override String get performance => 'パフォーマンス';
	@override String get advanced => 'アドバンスド';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$ja extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get locale => 'アプリの言語';
	@override String get appTheme => 'アプリのテーマ';
	@override String get platform => 'テーマの種類';
	@override String get layoutSize => 'レイアウトの種類';
	@override String get customAccentColor => 'オリジナルの色';
	@override String get hyperlegibleFont => 'Hyperlegible フォント';
	@override String get shouldCheckForUpdates => 'Saberの更新を自動的に確認する';
	@override String get shouldAlwaysAlertForUpdates => 'より速いアップデート';
	@override String get allowInsecureConnections => '安全でない接続を許可する';
	@override String get editorToolbarAlignment => '編集ツールバーの位置調整';
	@override String get editorToolbarShowInFullscreen => 'フルスクリーンモードで編集ツールバーを表示する';
	@override String get editorAutoInvert => 'ダークモードでメモを反転';
	@override String get preferGreyscale => 'グレースケールを優先';
	@override String get maxImageSize => '最大画像サイズ';
	@override String get autoClearWhiteboardOnExit => 'アプリを終了したらホワイトボードを消去する';
	@override String get disableEraserAfterUse => '消しゴムの自動無効化';
	@override String get editorPromptRename => '新しいメモの名前を変更するよう促す';
	@override String get recentColorsDontSavePresets => '最近使用した色をプリセットに登録しない';
	@override String get recentColorsLength => '最近使用した色を記憶する数';
	@override String get printPageIndicators => '印刷ページのインジケーター';
	@override String get autosave => '自動保存';
	@override String get shapeRecognitionDelay => '形状認識遅延';
	@override String get autoStraightenLines => '自動で線分を直す';
	@override String get sentry => 'エラー報告';
	@override String get autoDisableFingerDrawingWhenStylusDetected => '指の描画を自動的に無効にする';
	@override String get customDataDir => 'カスタムデータディレクトリ';
	@override String get hideFingerDrawingToggle => '指の描画トグルを非表示にする';
}

// Path: settings.prefDescriptions
class _Translations$settings$prefDescriptions$ja extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegibleは、弱視読者の読みやすさを向上させます。';
	@override String get allowInsecureConnections => '(非推奨) Saber が自己署名/信頼できない証明書を持つサーバーに接続できるようにする';
	@override String get preferGreyscale => 'e-inkディスプレイ用';
	@override String get autoClearWhiteboardOnExit => '他のデバイスと同期されます';
	@override String get disableEraserAfterUse => '消しゴムの使用後、自動的にペンに戻す';
	@override String get maxImageSize => 'これより大きな画像は圧縮されます';
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$ja hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$ja._(_root);
	@override String get editorPromptRename => 'メモの名前は後でいつでも変更できます';
	@override String get printPageIndicators => 'エクスポートにページインジケーターを表示';
	@override String get autosave => '短い遅延のあとに自動保存するか';
	@override String get shapeRecognitionDelay => '形のプレビューを更新する頻度';
	@override String get autoStraightenLines => 'シェイプペンを使わずに長い線真っすぐにする';
	@override String get shouldAlwaysAlertForUpdates => '更新が利用可能になったらすぐに教えてください';
	@override late final _Translations$settings$prefDescriptions$sentry$ja sentry = _Translations$settings$prefDescriptions$sentry$ja._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'スタイラスが検出されたときに指の描画をオフにする';
}

// Path: settings.themeModes
class _Translations$settings$themeModes$ja extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get system => 'システム';
	@override String get light => 'ライト';
	@override String get dark => 'ダーク';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$ja extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get auto => '自動';
	@override String get phone => '電話';
	@override String get tablet => 'タブレット';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$ja extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => '色を選択する';
}

// Path: settings.reset
class _Translations$settings$reset$ja extends Translations$settings$reset$en {
	_Translations$settings$reset$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'この設定をリセットしますか？';
	@override String get button => 'リセット';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$ja extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get cancel => '取消';
	@override String get select => '選択';
	@override String get mustBeEmpty => '選択するフォルダは空でなければなりません';
	@override String get mustBeDoneSyncing => 'フォルダを変更する前に、同期が完了していることを確認してください';
	@override String get unsupported => 'この機能は現在、開発者向けです。 これにより、データが失われる可能性があります.';
}

// Path: login.form
class _Translations$login$form$ja extends Translations$login$form$en {
	_Translations$login$form$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'ログインすることにより、'),
		linkToPrivacyPolicy('プライベートポリシー'),
		const TextSpan(text: 'に同意したものとみなされます。'),
	]);
}

// Path: login.status
class _Translations$login$status$ja extends Translations$login$status$en {
	_Translations$login$status$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'ログアウト';
	@override String get tapToLogin => 'タップしてNextcloudにログイン';
	@override String hi({required Object u}) => 'こんにちは、${u}!';
	@override String get almostDone => '同期の準備がほぼ完了しました。タップしてログインを完了してください。';
	@override String get loggedIn => 'Nextcloudでログイン';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$ja extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'データを保存する場所を選択してください:';
	@override String get saberNcServer => 'Saber の Nextcloud サーバー';
	@override String get otherNcServer => 'その他のNextcloudサーバー';
	@override String get serverUrl => 'サーバーのURL';
	@override String get loginWithSaber => 'Saber にログイン';
	@override String get loginWithNextcloud => 'Nextcloudでログイン';
	@override late final _Translations$login$ncLoginStep$loginFlow$ja loginFlow = _Translations$login$ncLoginStep$loginFlow$ja._(_root);
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$ja extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'データを保護するために、暗号化パスワードを入力してください:';
	@override String get newToSaber => 'Saber は初めてですか？新しい暗号化パスワードを入力するだけです。';
	@override String get encPassword => '暗号化パスワード';
	@override String get encFaqTitle => 'よくある質問';
	@override String get wrongEncPassword => '入力されたパスワードでは、復号に失敗しました。 もう一度入力してください。';
	@override String get connectionFailed => 'サーバ接続時に問題が発生しました。後でもう一度お試しください.';
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$ja._(_root),
		_Translations$login$encLoginStep$encFaq$1$ja._(_root),
		_Translations$login$encLoginStep$encFaq$2$ja._(_root),
	];
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$ja extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'サーバーホームページ';
	@override String get deleteAccount => 'アカウントの削除';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$ja extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get q => 'ログアウトするとメモが消えてしまいますか？';
	@override String get a => 'いいえ。メモはデバイスとサーバーの両方に残ります。ログインし直すまで、サーバーとは同期されません。データを失わないように、ログアウトする前に同期が完了したことを確認してください（ホーム画面の同期進行状況をご覧ください）。';
}

// Path: profile.faq.1
class _Translations$profile$faq$1$ja extends Translations$profile$faq$1$en {
	_Translations$profile$faq$1$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nextcloudのパスワードを変更する方法を教えてください';
	@override String get a => 'サーバーのウェブサイトにアクセスし、ログインします。「設定」>「セキュリティ」>「パスワードの変更」を選択します。パスワード変更後は、Saberからログアウトし、再度ログインする必要があります。';
}

// Path: profile.faq.2
class _Translations$profile$faq$2$ja extends Translations$profile$faq$2$en {
	_Translations$profile$faq$2$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get q => '暗号化パスワードの変更方法を教えてください。';
	@override String get a => '1. Saberからログアウトする。データが失われないように、ログアウトする前に同期が完了していることを確認してください（ホーム画面で同期の進行状況を確認できます）。\n2. サーバーのウェブサイトにアクセスし、「Saber」フォルダを削除してください。これにより、サーバーからすべてのメモが削除されます。\n3. セーバーに再ログインする。ログイン時に新しい暗号化パスワードを選択できます。\n4. 他のデバイスでもログアウトしてログインし直すことをお忘れなく。';
}

// Path: profile.faq.3
class _Translations$profile$faq$3$ja extends Translations$profile$faq$3$en {
	_Translations$profile$faq$3$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get q => 'アカウントを削除するにはどうすればよいですか？';
	@override String get a => '上部の"${_root.profile.quickLinks.deleteAccount}"ボタンをタップし、必要であればログインしてください。Saber公式サーバーを利用している場合、1週間の猶予期間の後にアカウントが削除されます。この期間中であれば、adilhanney@disroot.orgまでご連絡いただければ、削除を取り消すことが可能です。サードパーティのサーバーをご利用の場合、アカウントを削除するオプションがない場合があります。詳細については、ご利用のサーバープライバシーポリシーをご確認ください。';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$ja extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$ja._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _Translations$editor$pens$ja extends Translations$editor$pens$en {
	_Translations$editor$pens$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => '万年筆';
	@override String get ballpointPen => 'ボールペン';
	@override String get highlighter => '蛍光ペン';
	@override String get pencil => '鉛筆';
	@override String get shapePen => 'シェープペン';
	@override String get laserPointer => 'レーザーポインター';
}

// Path: editor.penOptions
class _Translations$editor$penOptions$ja extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get size => 'サイズ';
}

// Path: editor.colors
class _Translations$editor$colors$ja extends Translations$editor$colors$en {
	_Translations$editor$colors$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'カラーピッカー';
	@override String customBrightnessHue({required Object b, required Object h}) => 'カスタム ${b} ${h}';
	@override String customHue({required Object h}) => 'カスタム ${h}';
	@override String get dark => 'ダークテーマ';
	@override String get light => 'ライトテーマ';
	@override String get black => '黒';
	@override String get darkGrey => '濃い灰色';
	@override String get grey => '灰色';
	@override String get lightGrey => '明るい灰色';
	@override String get white => '白色';
	@override String get red => '赤色';
	@override String get green => '緑色';
	@override String get cyan => 'シアン';
	@override String get blue => '青色';
	@override String get yellow => '黄色';
	@override String get purple => '紫色';
	@override String get pink => 'ピンク';
	@override String get orange => '橙色';
	@override String get pastelRed => 'パステル・赤';
	@override String get pastelOrange => 'パステル・橙色';
	@override String get pastelYellow => 'パステル・黄色';
	@override String get pastelGreen => 'パステル・緑色';
	@override String get pastelCyan => 'パステル・青緑色';
	@override String get pastelBlue => 'パステル・青色';
	@override String get pastelPurple => 'パステル・紫色';
	@override String get pastelPink => 'パステル・桃色';
}

// Path: editor.imageOptions
class _Translations$editor$imageOptions$ja extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$ja._(TranslationsJa root) : this._root = root, super.internal(root);

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
class _Translations$editor$selectionBar$ja extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get delete => '削除';
	@override String get duplicate => '複製';
}

// Path: editor.menu
class _Translations$editor$menu$ja extends Translations$editor$menu$en {
	_Translations$editor$menu$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'ページを削除 ${page}/${totalPages}';
	@override String get clearAllPages => 'すべてのページを消去する';
	@override String get insertPage => '以下のページを挿入';
	@override String get duplicatePage => '重複したページ';
	@override String get deletePage => 'ページの削除';
	@override String get lineHeight => '行の高さ';
	@override String get lineHeightDescription => '手書きメモのテキストサイズを調整することもできます';
	@override String get lineThickness => '線の太さ';
	@override String get lineThicknessDescription => '背景の線の太さ';
	@override String get backgroundPattern => '背景パターン';
	@override String get import => 'インポート';
	@override String get watchServer => 'サーバのアップデートを見る';
	@override String get watchServerReadOnly => 'サーバーに接続できないときは、編集できません';
	@override late final _Translations$editor$menu$boxFits$ja boxFits = _Translations$editor$menu$boxFits$ja._(_root);
	@override late final _Translations$editor$menu$bgPatterns$ja bgPatterns = _Translations$editor$menu$bgPatterns$ja._(_root);
	@override String get backgroundImageFit => '背景画像';
}

// Path: editor.readOnlyBanner
class _Translations$editor$readOnlyBanner$ja extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '読み取り専用モード';
	@override String get watchingServer => '現在、サーバーの更新を待っています。 このモードで編集が無効になっています.';
	@override String get corrupted => 'メモの読み込みに失敗しました。メモが破損しているか、ダウンロード中である可能性があります。';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$ja extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'このメモは新しいバージョンのSaberを使用して編集されたものです';
	@override String get subtitle => 'このメモを編集すると、いくつかの情報が失われる可能性があります。これを無視して編集しますか？';
	@override String get allowEditing => '編集を許可する';
}

// Path: editor.quill
class _Translations$editor$quill$ja extends Translations$editor$quill$en {
	_Translations$editor$quill$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'ここに何かを入力してください...';
}

// Path: editor.hud
class _Translations$editor$hud$ja extends Translations$editor$hud$en {
	_Translations$editor$hud$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'ズームの解除';
	@override String get lockZoom => 'ズームを固定する';
	@override String get unlockSingleFingerPan => '一本指でのパン操作を有効にする';
	@override String get lockSingleFingerPan => '一本指でのパン操作を無効にする';
	@override String get unlockAxisAlignedPan => '水平または垂直へのパンロックを解除';
	@override String get lockAxisAlignedPan => 'パンニングを水平または垂直にロックする';
}

// Path: sentry.consent.description
class _Translations$sentry$consent$description$ja extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get question => '予期せぬエラーを自動的に報告しますか？問題の早期解決を助けます。';
	@override String get scope => 'レポートには、エラーとデバイスに関する情報が含まれている場合があります。 個人データをフィルタアウトするために、すべての努力をしましたが、一部残っている可能性があります。';
	@override String get currentlyOff => '同意すると、アプリの再起動後にエラーのレポートが有効になります。';
	@override String get currentlyOn => '同意を取り消す場合は、アプリを再起動することでエラーレポートが無効になります。';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		link('プライバシーポリシー'),
		const TextSpan(text: 'で詳細を確認してください。'),
	]);
}

// Path: sentry.consent.answers
class _Translations$sentry$consent$answers$ja extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get yes => 'はい';
	@override String get no => 'いいえ';
	@override String get later => 'あとで回答する';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$ja extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get shown => '誤ったトグルを防ぐ';
	@override String get fixedOn => '指の描画が有効に固定される';
	@override String get fixedOff => '指の描画が無効に固定される';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$ja extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get active => '有効';
	@override String get inactive => '無効';
	@override String get activeUntilRestart => 'アプリを再起動するまで有効';
	@override String get inactiveUntilRestart => 'アプリを再起動するまでの無効';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$ja extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Saber に登録して、あなたのNextcloudアカウントにアクセスしてください';
	@override String get followPrompts => 'Nextcloud のプロンプトに従ってください';
	@override String get browserDidntOpen => 'ログインページが開かなかった場合はここをクリック';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$ja extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get q => '暗号化パスワードとは何ですか？なぜ2つのパスワードを使用するのですか？';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$ja extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get q => '暗号化パスワードは未設定です。 どこで設定できますか？';
	@override String get a => '両方に新しい暗号化パスワードを入力してください。\nSaber は自動で新しい暗号化キーを生成します。';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$ja extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nextcloud アカウントと同じパスワードを使うことはできますか?';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$ja extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get fill => '貼る';
	@override String get cover => 'カバー';
	@override String get contain => 'コンテイン';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$ja extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$ja._(TranslationsJa root) : this._root = root, super.internal(root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get none => '空白';
	@override String get college => '罫線';
	@override String get collegeRtl => '罫線 (反転)';
	@override String get lined => '線';
	@override String get grid => '格子';
	@override String get dots => '点';
	@override String get staffs => 'スタッフ';
	@override String get tablature => 'タブ譜';
	@override String get cornell => '角';
}
