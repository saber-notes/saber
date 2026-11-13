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
class TranslationsKo extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsKo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ko,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ko>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	late final TranslationsKo _root = this; // ignore: unused_field

	@override 
	TranslationsKo $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsKo(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$ko common = _Translations$common$ko._(_root);
	@override late final _Translations$home$ko home = _Translations$home$ko._(_root);
	@override late final _Translations$sentry$ko sentry = _Translations$sentry$ko._(_root);
	@override late final _Translations$settings$ko settings = _Translations$settings$ko._(_root);
	@override late final _Translations$logs$ko logs = _Translations$logs$ko._(_root);
	@override late final _Translations$login$ko login = _Translations$login$ko._(_root);
	@override late final _Translations$profile$ko profile = _Translations$profile$ko._(_root);
	@override late final _Translations$appInfo$ko appInfo = _Translations$appInfo$ko._(_root);
	@override late final _Translations$update$ko update = _Translations$update$ko._(_root);
	@override late final _Translations$editor$ko editor = _Translations$editor$ko._(_root);
}

// Path: common
class _Translations$common$ko extends Translations$common$en {
	_Translations$common$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get done => '완료됨';
	@override String get continueBtn => '계속하기';
	@override String get cancel => '취소';
}

// Path: home
class _Translations$home$ko extends Translations$home$en {
	_Translations$home$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$ko tabs = _Translations$home$tabs$ko._(_root);
	@override late final _Translations$home$titles$ko titles = _Translations$home$titles$ko._(_root);
	@override late final _Translations$home$tooltips$ko tooltips = _Translations$home$tooltips$ko._(_root);
	@override late final _Translations$home$create$ko create = _Translations$home$create$ko._(_root);
	@override late final _Translations$home$newFolder$ko newFolder = _Translations$home$newFolder$ko._(_root);
	@override late final _Translations$home$renameNote$ko renameNote = _Translations$home$renameNote$ko._(_root);
	@override late final _Translations$home$moveNote$ko moveNote = _Translations$home$moveNote$ko._(_root);
	@override late final _Translations$home$deleteNoteDialog$ko deleteNoteDialog = _Translations$home$deleteNoteDialog$ko._(_root);
	@override late final _Translations$home$renameFolder$ko renameFolder = _Translations$home$renameFolder$ko._(_root);
	@override late final _Translations$home$deleteFolder$ko deleteFolder = _Translations$home$deleteFolder$ko._(_root);
	@override late final _Translations$home$sort$ko sort = _Translations$home$sort$ko._(_root);
	@override late final _Translations$home$layout$ko layout = _Translations$home$layout$ko._(_root);
	@override String get welcome => 'Saber에 오신 것을 환영합니다';
	@override String get invalidFormat => '선택하신 파일은 지원되지 않습니다. sbn, sbn2, sba 또는 pdf 파일을 선택해 주세요.';
	@override String get noFiles => '파일을 찾을 수 없습니다';
	@override String get noPreviewAvailable => '미리보기 없음';
	@override String get createNewNote => '+ 버튼을 탭하여 새 메모를 만드세요';
	@override String get backFolder => '이전 폴더로 돌아가기';
	@override String get deleteNote => '메모 삭제';
}

// Path: sentry
class _Translations$sentry$ko extends Translations$sentry$en {
	_Translations$sentry$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$ko consent = _Translations$sentry$consent$ko._(_root);
}

// Path: settings
class _Translations$settings$ko extends Translations$settings$en {
	_Translations$settings$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$ko prefCategories = _Translations$settings$prefCategories$ko._(_root);
	@override late final _Translations$settings$prefLabels$ko prefLabels = _Translations$settings$prefLabels$ko._(_root);
	@override late final _Translations$settings$prefDescriptions$ko prefDescriptions = _Translations$settings$prefDescriptions$ko._(_root);
	@override late final _Translations$settings$themeModes$ko themeModes = _Translations$settings$themeModes$ko._(_root);
	@override late final _Translations$settings$layoutSizes$ko layoutSizes = _Translations$settings$layoutSizes$ko._(_root);
	@override late final _Translations$settings$accentColorPicker$ko accentColorPicker = _Translations$settings$accentColorPicker$ko._(_root);
	@override late final _Translations$settings$reset$ko reset = _Translations$settings$reset$ko._(_root);
	@override late final _Translations$settings$customDataDir$ko customDataDir = _Translations$settings$customDataDir$ko._(_root);
	@override String get systemLanguage => '자동';
	@override String get resyncEverything => '모든 것을 재동기화하세요';
	@override String get openDataDir => 'Saber 폴더 열기';
	@override String get autosaveDisabled => '절대 안 돼';
	@override String get shapeRecognitionDisabled => '절대 안 돼';
	@override List<String> get axisDirections => [
		'상단',
		'알겠습니다',
		'하단',
		'왼쪽',
	];
}

// Path: logs
class _Translations$logs$ko extends Translations$logs$en {
	_Translations$logs$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get logs => '로그';
	@override String get viewLogs => '로그 보기';
	@override String get debuggingInfo => '로그에는 디버깅 및 개발에 유용한 정보가 포함되어 있습니다.';
	@override String get noLogs => '여기에 로그가 없습니다!';
	@override String get useTheApp => '앱을 사용함에 따라 여기에 로그가 표시됩니다.';
}

// Path: login
class _Translations$login$ko extends Translations$login$en {
	_Translations$login$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final _Translations$login$form$ko form = _Translations$login$form$ko._(_root);
	@override late final _Translations$login$status$ko status = _Translations$login$status$ko._(_root);
	@override late final _Translations$login$ncLoginStep$ko ncLoginStep = _Translations$login$ncLoginStep$ko._(_root);
	@override late final _Translations$login$encLoginStep$ko encLoginStep = _Translations$login$encLoginStep$ko._(_root);
	@override String get title => '로그인';
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: '아직 계정이 없으신가요? '),
		linkToSignup('지금 가입하세요'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: '당신이 아니라고요? '),
		undoLogin('다른 계정 선택'),
	]);
}

// Path: profile
class _Translations$profile$ko extends Translations$profile$en {
	_Translations$profile$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final _Translations$profile$quickLinks$ko quickLinks = _Translations$profile$quickLinks$ko._(_root);
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$ko._(_root),
		_Translations$profile$faq$1$ko._(_root),
		_Translations$profile$faq$2$ko._(_root),
		_Translations$profile$faq$3$ko._(_root),
	];
	@override String get title => '내 프로필';
	@override String get logout => '로그아웃';
	@override String quotaUsage({required Object total, required Object used, required Object percent}) => '${total} 중 ${used}(${percent}%)를 사용하고 있습니다';
	@override String quotaUsageUncapped({required Object used}) => '${used}를 사용하고 있습니다';
	@override String get connectedTo => '연결됨';
	@override String get faqTitle => '자주 묻는 질문';
}

// Path: appInfo
class _Translations$appInfo$ko extends Translations$appInfo$en {
	_Translations$appInfo$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber 저작권 © 2022-${buildYear} Adil Hanney\n본 프로그램은 어떠한 보증도 제공하지 않습니다. 본 소프트웨어는 자유롭게 배포할 수 있으며 특정 조건 하에 재배포가 가능합니다.';
	@override String get debug => '디버그';
	@override String get sponsorButton => '여기를 탭하여 저를 후원하거나 더 많은 저장 공간을 구매하세요';
	@override String get licenseButton => '여기를 탭하여 더 많은 라이선스 정보를 확인하세요';
	@override String get privacyPolicyButton => '개인정보 처리방침을 보려면 여기를 탭하세요';
}

// Path: update
class _Translations$update$ko extends Translations$update$en {
	_Translations$update$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => '업데이트 사용 가능';
	@override String get updateAvailableDescription => '새 버전의 앱이 출시되었습니다:';
	@override String get update => '업데이트';
	@override String get downloadNotAvailableYet => '귀하의 플랫폼용 다운로드가 아직 제공되지 않습니다. 잠시 후에 다시 확인해 주세요.';
}

// Path: editor
class _Translations$editor$ko extends Translations$editor$en {
	_Translations$editor$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$ko toolbar = _Translations$editor$toolbar$ko._(_root);
	@override late final _Translations$editor$pens$ko pens = _Translations$editor$pens$ko._(_root);
	@override late final _Translations$editor$penOptions$ko penOptions = _Translations$editor$penOptions$ko._(_root);
	@override late final _Translations$editor$colors$ko colors = _Translations$editor$colors$ko._(_root);
	@override late final _Translations$editor$imageOptions$ko imageOptions = _Translations$editor$imageOptions$ko._(_root);
	@override late final _Translations$editor$selectionBar$ko selectionBar = _Translations$editor$selectionBar$ko._(_root);
	@override late final _Translations$editor$menu$ko menu = _Translations$editor$menu$ko._(_root);
	@override late final _Translations$editor$photoPdfError$ko photoPdfError = _Translations$editor$photoPdfError$ko._(_root);
	@override late final _Translations$editor$readOnlyBanner$ko readOnlyBanner = _Translations$editor$readOnlyBanner$ko._(_root);
	@override late final _Translations$editor$versionTooNew$ko versionTooNew = _Translations$editor$versionTooNew$ko._(_root);
	@override late final _Translations$editor$quill$ko quill = _Translations$editor$quill$ko._(_root);
	@override late final _Translations$editor$hud$ko hud = _Translations$editor$hud$ko._(_root);
	@override String get pages => '페이지';
	@override String get untitled => '제목 없음';
	@override String get needsToSaveBeforeExiting => '변경 사항 저장 중입니다... 완료되면 편집기를 안전하게 종료할 수 있습니다.';
}

// Path: home.tabs
class _Translations$home$tabs$ko extends Translations$home$tabs$en {
	_Translations$home$tabs$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get home => '홈';
	@override String get browse => '둘러보기';
	@override String get whiteboard => '화이트보드';
	@override String get settings => '설정';
}

// Path: home.titles
class _Translations$home$titles$ko extends Translations$home$titles$en {
	_Translations$home$titles$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get home => '최근 메모';
	@override String get browse => '둘러보기';
	@override String get whiteboard => '화이트보드';
	@override String get settings => '설정';
}

// Path: home.tooltips
class _Translations$home$tooltips$ko extends Translations$home$tooltips$en {
	_Translations$home$tooltips$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get newNote => '새 메모';
	@override String get showUpdateDialog => '업데이트 대화 상자 표시';
	@override String get exportNote => '노트 내보내기';
}

// Path: home.create
class _Translations$home$create$ko extends Translations$home$create$en {
	_Translations$home$create$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get newNote => '새 메모';
	@override String get importNote => '가져오기 참고 사항';
}

// Path: home.newFolder
class _Translations$home$newFolder$ko extends Translations$home$newFolder$en {
	_Translations$home$newFolder$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get newFolder => '새 폴더';
	@override String get folderName => '폴더 이름';
	@override String get create => '만들기';
	@override String get folderNameEmpty => '폴더 이름은 비어 있을 수 없습니다';
	@override String get folderNameContainsSlash => '폴더 이름에 슬래시(/)를 포함할 수 없습니다.';
	@override String get folderNameExists => '폴더가 이미 존재합니다';
}

// Path: home.renameNote
class _Translations$home$renameNote$ko extends Translations$home$renameNote$en {
	_Translations$home$renameNote$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get renameNote => '노트 이름 변경';
	@override String get noteName => '노트 이름';
	@override String get rename => '이름 바꾸기';
	@override String get noteNameEmpty => '노트 이름은 비어 있을 수 없습니다';
	@override String get noteNameExists => '이 이름의 메모가 이미 존재합니다';
	@override String get noteNameForbiddenCharacters => '노트 이름에 금지된 문자가 포함되어 있습니다.';
	@override String get noteNameReserved => '노트 이름 예약됨';
}

// Path: home.moveNote
class _Translations$home$moveNote$ko extends Translations$home$moveNote$en {
	_Translations$home$moveNote$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get moveNote => '메모 이동';
	@override String moveNotes({required Object n}) => '${n}개의 노트를 이동하세요';
	@override String moveName({required Object f}) => '${f}\$ 이동';
	@override String get move => '이동';
	@override String renamedTo({required Object newName}) => '노트가 ${newName}으로 이름이 변경될 것입니다.';
	@override String get multipleRenamedTo => '다음 메모들은 이름이 변경될 것입니다:';
	@override String numberRenamedTo({required Object n}) => '${n} 노트는 충돌을 피하기 위해 이름이 변경될 것입니다.';
}

// Path: home.deleteNoteDialog
class _Translations$home$deleteNoteDialog$ko extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(n,
		one: '선택한 메모를 영구적으로 삭제하시겠습니까?',
		other: '선택한 메모를 영구적으로 삭제하시겠습니까?',
	);
	@override String deleteNotes({required Object n}) => '${n}개의 노트를 삭제하세요';
	@override String deleteName({required Object f}) => '${f} 삭제';
	@override String get delete => '삭제';
}

// Path: home.renameFolder
class _Translations$home$renameFolder$ko extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => '폴더 이름 바꾸기';
	@override String get folderName => '폴더 이름';
	@override String get rename => '이름 바꾸기';
	@override String get folderNameEmpty => '폴더 이름은 비어 있을 수 없습니다';
	@override String get folderNameContainsSlash => '폴더 이름에는 슬래시(/)를 포함할 수 없습니다.';
	@override String get folderNameExists => '이 이름의 폴더가 이미 존재합니다';
}

// Path: home.deleteFolder
class _Translations$home$deleteFolder$ko extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => '폴더 삭제';
	@override String deleteName({required Object f}) => '${f} 삭제';
	@override String get delete => '삭제';
	@override String get alsoDeleteContents => '이 폴더 안의 모든 메모도 삭제해 주세요';
}

// Path: home.sort
class _Translations$home$sort$ko extends Translations$home$sort$en {
	_Translations$home$sort$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get sortBy => '정렬 기준';
	@override String get nameAToZ => '이름 (A-Z)';
	@override String get nameZToA => '이름 (가나다순)';
	@override String get lastModifiedNewToOld => '편집됨 (최신순)';
	@override String get lastModifiedOldToNew => '수정됨 (오래된 순)';
}

// Path: home.layout
class _Translations$home$layout$ko extends Translations$home$layout$en {
	_Translations$home$layout$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get layout => '레이아웃';
	@override String get masonryGrid => '메이슨리 그리드';
	@override String get simpleGrid => '간단한 그리드';
}

// Path: sentry.consent
class _Translations$sentry$consent$ko extends Translations$sentry$consent$en {
	_Translations$sentry$consent$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$description$ko description = _Translations$sentry$consent$description$ko._(_root);
	@override late final _Translations$sentry$consent$answers$ko answers = _Translations$sentry$consent$answers$ko._(_root);
	@override String get title => 'Saber를 개선하는 데 도움을 주세요?';
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$ko extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get general => '일반';
	@override String get writing => '글쓰기';
	@override String get editor => '편집기';
	@override String get performance => '성능';
	@override String get advanced => '고급';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$ko extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get locale => '언어';
	@override String get appTheme => '앱 테마';
	@override String get platform => '테마 유형';
	@override String get layoutSize => '레이아웃 유형';
	@override String get customAccentColor => '사용자 지정 강조 색상';
	@override String get hyperlegibleFont => '애트킨슨 하이퍼레지블 폰트';
	@override String get shouldCheckForUpdates => 'Saber 업데이트 확인하기';
	@override String get shouldAlwaysAlertForUpdates => '더 빠른 업데이트';
	@override String get allowInsecureConnections => '보안되지 않은 연결 허용';
	@override String get editorToolbarAlignment => '툴바 위치';
	@override String get editorToolbarShowInFullscreen => '툴바를 전체 화면 모드로 표시하세요';
	@override String get editorAutoInvert => '다크 모드에서 메모 반전하기';
	@override String get preferGreyscale => '회색조 색상을 선호합니다';
	@override String get maxImageSize => '최대 이미지 크기';
	@override String get autoClearWhiteboardOnExit => '화이트보드 자동 지우기';
	@override String get disableEraserAfterUse => '지우개 자동 비활성화';
	@override String get hideFingerDrawingToggle => '손가락 그리기 토글 숨기기';
	@override String get autoDisableFingerDrawingWhenStylusDetected => '손가락 드로잉 자동 비활성화';
	@override String get editorPromptRename => '새 메모 이름 바꾸기 요청';
	@override String get recentColorsDontSavePresets => '최근 색상에 프리셋 색상을 저장하지 마세요';
	@override String get recentColorsLength => '최근 색상을 몇 개 저장해야 하나요?';
	@override String get printPageIndicators => '페이지 표시 출력';
	@override String get autosave => '자동 저장';
	@override String get shapeRecognitionDelay => '모양 인식 지연';
	@override String get autoStraightenLines => '자동으로 선 펴기';
	@override String get customDataDir => '커스텀 세이버 폴더';
	@override String get sentry => '오류 보고';
}

// Path: settings.prefDescriptions
class _Translations$settings$prefDescriptions$ko extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$ko hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$ko._(_root);
	@override late final _Translations$settings$prefDescriptions$sentry$ko sentry = _Translations$settings$prefDescriptions$sentry$ko._(_root);
	@override String get hyperlegibleFont => '저시력 사용자를 위한 가독성 향상';
	@override String get allowInsecureConnections => '(권장하지 않음) Saber가 자체 서명된/신뢰할 수 없는 인증서가 있는 서버에 연결하도록 허용합니다.';
	@override String get preferGreyscale => '전자 잉크 디스플레이용으로';
	@override String get autoClearWhiteboardOnExit => '앱을 종료하면 화이트보드를 지웁니다.';
	@override String get disableEraserAfterUse => '지우개 사용 후 자동으로 펜으로 돌아갑니다.';
	@override String get maxImageSize => '더 큰 이미지는 압축됩니다';
	@override String get autoDisableFingerDrawingWhenStylusDetected => '스타일러스가 감지되면 손가락 드로잉을 끕니다.';
	@override String get editorPromptRename => '나중에 메모 이름을 언제든지 변경할 수 있습니다.';
	@override String get printPageIndicators => '내보내기에서 페이지 표시를 보여주세요';
	@override String get autosave => '짧은 지연 후 자동 저장 또는 영구적으로 비활성화';
	@override String get shapeRecognitionDelay => '셰이프 미리보기를 얼마나 자주 업데이트해야 하나요?';
	@override String get autoStraightenLines => '셰이프 펜을 사용하지 않고 긴 선을 곧게 만듭니다.';
	@override String get shouldAlwaysAlertForUpdates => '업데이트가 나오는 대로 알려주세요';
}

// Path: settings.themeModes
class _Translations$settings$themeModes$ko extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get system => '시스템';
	@override String get light => '빛';
	@override String get dark => '어두운';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$ko extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get auto => '자동';
	@override String get phone => '전화기';
	@override String get tablet => '태블릿';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$ko extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => '색깔을 고르세요';
}

// Path: settings.reset
class _Translations$settings$reset$ko extends Translations$settings$reset$en {
	_Translations$settings$reset$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '이 설정을 초기화하시겠습니까?';
	@override String get button => '재설정';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$ko extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get cancel => '취소';
	@override String get select => '선택';
	@override String get mustBeEmpty => '선택한 폴더는 비어 있어야 합니다';
	@override String get mustBeDoneSyncing => '폴더를 변경하기 전에 동기화가 완료되었는지 확인하세요.';
	@override String get unsupported => '이 기능은 현재 개발자 전용입니다. 사용 시 데이터 손실이 발생할 수 있습니다.';
}

// Path: login.form
class _Translations$login$form$ko extends Translations$login$form$en {
	_Translations$login$form$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: '로그인함으로써 귀하는 '),
		linkToPrivacyPolicy('개인정보 처리방침'),
		const TextSpan(text: '에 동의합니다.'),
	]);
}

// Path: login.status
class _Translations$login$status$ko extends Translations$login$status$en {
	_Translations$login$status$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => '로그아웃됨';
	@override String get tapToLogin => 'Nextcloud로 로그인하려면 탭하세요';
	@override String hi({required Object u}) => '안녕하세요, ${u}!';
	@override String get almostDone => '동기화 준비가 거의 완료되었습니다. 로그인하려면 탭하세요.';
	@override String get loggedIn => 'Nextcloud로 로그인했습니다';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$ko extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final _Translations$login$ncLoginStep$loginFlow$ko loginFlow = _Translations$login$ncLoginStep$loginFlow$ko._(_root);
	@override String get whereToStoreData => '데이터를 어디에 저장할지 선택하세요:';
	@override String get saberNcServer => 'Saber의 Nextcloud 서버';
	@override String get otherNcServer => '다른 Nextcloud 서버';
	@override String get serverUrl => '서버 URL';
	@override String get loginWithSaber => 'Saber로 로그인하기';
	@override String get loginWithNextcloud => 'Nextcloud로 로그인하기';
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$ko extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$ko._(_root),
		_Translations$login$encLoginStep$encFaq$1$ko._(_root),
		_Translations$login$encLoginStep$encFaq$2$ko._(_root),
	];
	@override String get enterEncPassword => '데이터를 보호하려면 암호화 비밀번호를 입력하십시오:';
	@override String get newToSaber => 'Saber를 처음 사용하시나요? 새 암호만 입력하세요.';
	@override String get encPassword => '암호화 비밀번호';
	@override String get encFaqTitle => '자주 묻는 질문';
	@override String get wrongEncPassword => '제공된 비밀번호로 복호화에 실패했습니다. 다시 입력해 주세요.';
	@override String get connectionFailed => '서버에 연결하는 중 문제가 발생했습니다. 나중에 다시 시도해 주세요.';
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$ko extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => '서버 홈페이지';
	@override String get deleteAccount => '계정 삭제';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$ko extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get q => '로그아웃하면 메모가 사라지나요?';
	@override String get a => '아니요. 메모는 기기와 서버 양쪽에 그대로 유지됩니다. 다시 로그인할 때까지 서버와 동기화되지 않습니다. 데이터 손실을 방지하려면 로그아웃하기 전에 동기화가 완료되었는지 확인하세요(홈 화면에서 동기화 진행 상황 확인).';
}

// Path: profile.faq.1
class _Translations$profile$faq$1$ko extends Translations$profile$faq$1$en {
	_Translations$profile$faq$1$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nextcloud 비밀번호를 어떻게 변경하나요?';
	@override String get a => '서버 웹사이트로 이동하여 로그인하세요. 그런 다음 설정(Settings) > 보안(Security) > 비밀번호 변경(Change password)으로 이동합니다. 비밀번호를 변경한 후 Saber에서 로그아웃했다가 다시 로그인해야 합니다.';
}

// Path: profile.faq.2
class _Translations$profile$faq$2$ko extends Translations$profile$faq$2$en {
	_Translations$profile$faq$2$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get q => '암호화 비밀번호를 변경하려면 어떻게 해야 하나요?';
	@override String get a => '0. 동기화가 완료되었는지 확인하세요 (홈 화면에서 동기화 진행 상황을 확인하세요).\n1. Saber에서 로그아웃합니다.\n2. 서버 웹사이트로 이동하여 \'Saber\' 폴더를 삭제합니다. 이렇게 하면 서버의 모든 메모가 삭제됩니다.\n3. Saber에 다시 로그인합니다. 로그인할 때 새 암호화를 선택할 수 있습니다.\n4. 다른 기기에서도 Saber에서 로그아웃했다가 다시 로그인하는 것을 잊지 마세요.';
}

// Path: profile.faq.3
class _Translations$profile$faq$3$ko extends Translations$profile$faq$3$en {
	_Translations$profile$faq$3$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get q => '계정을 삭제하려면 어떻게 해야 하나요?';
	@override String get a => '위의 "${_root.profile.quickLinks.deleteAccount}" 버튼을 탭하고 필요한 경우 로그인하세요.\n공식 Saber 서버를 사용 중인 경우, 1주일의 유예 기간이 지난 후 계정이 삭제됩니다. 이 기간 동안 adilhanney@disroot.org로 연락하여 삭제를 취소할 수 있습니다.\n제3자 서버를 사용하는 경우 계정을 삭제하는 옵션이 없을 수도 있습니다. 자세한 내용은 해당 서버의 개인정보 처리방침을 참조해야 합니다.';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$ko extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => '색상 토글 (Ctrl C)';
	@override String get select => '선택';
	@override String get toggleEraser => '지우개 토글 (Ctrl E)';
	@override String get photo => '이미지';
	@override String get text => '텍스트';
	@override String get toggleFingerDrawing => '손가락 그리기 토글(Ctrl F)';
	@override String get undo => '실행 취소';
	@override String get redo => '다시 하기';
	@override String get export => '내보내기 (Ctrl Shift S)';
	@override String get exportAs => '내보내기 형식:';
	@override String get fullscreen => '전체 화면 토글(F11)';
}

// Path: editor.pens
class _Translations$editor$pens$ko extends Translations$editor$pens$en {
	_Translations$editor$pens$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => '만년필';
	@override String get ballpointPen => '볼펜';
	@override String get highlighter => '하이라이터';
	@override String get pencil => '연필';
	@override String get shapePen => '쉐이프 펜';
	@override String get laserPointer => '레이저 포인터';
}

// Path: editor.penOptions
class _Translations$editor$penOptions$ko extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get size => '크기';
}

// Path: editor.colors
class _Translations$editor$colors$ko extends Translations$editor$colors$en {
	_Translations$editor$colors$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => '색상 선택기';
	@override String customBrightnessHue({required Object b, required Object h}) => '사용자 정의 ${b} ${h}';
	@override String customHue({required Object h}) => '사용자 지정 ${h}';
	@override String get dark => '어두운';
	@override String get light => '빛';
	@override String get black => '검은색';
	@override String get darkGrey => '짙은 회색';
	@override String get grey => '회색';
	@override String get lightGrey => '밝은 회색';
	@override String get white => '흰색';
	@override String get red => '빨간색';
	@override String get green => '녹색';
	@override String get cyan => '시안';
	@override String get blue => '파란색';
	@override String get yellow => '노란색';
	@override String get purple => '보라색';
	@override String get pink => '분홍색';
	@override String get orange => '주황색';
	@override String get pastelRed => '파스텔 레드';
	@override String get pastelOrange => '파스텔 오렌지';
	@override String get pastelYellow => '파스텔 옐로우';
	@override String get pastelGreen => '파스텔 그린';
	@override String get pastelCyan => '파스텔 시안';
	@override String get pastelBlue => '파스텔 블루';
	@override String get pastelPurple => '파스텔 퍼플';
	@override String get pastelPink => '파스텔 핑크';
}

// Path: editor.imageOptions
class _Translations$editor$imageOptions$ko extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '이미지 옵션';
	@override String get invertible => '가역적인';
	@override String get download => '다운로드';
	@override String get setAsBackground => '배경으로 설정하기';
	@override String get removeAsBackground => '배경에서 제거';
	@override String get delete => '삭제';
}

// Path: editor.selectionBar
class _Translations$editor$selectionBar$ko extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get delete => '삭제';
	@override String get duplicate => '복제';
}

// Path: editor.menu
class _Translations$editor$menu$ko extends Translations$editor$menu$en {
	_Translations$editor$menu$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$menu$boxFits$ko boxFits = _Translations$editor$menu$boxFits$ko._(_root);
	@override late final _Translations$editor$menu$bgPatterns$ko bgPatterns = _Translations$editor$menu$bgPatterns$ko._(_root);
	@override String clearPage({required Object page, required Object totalPages}) => '${page}/${totalPages} 페이지 지우기';
	@override String get clearAllPages => '모든 페이지 지우기';
	@override String get insertPage => '페이지 아래에 삽입';
	@override String get duplicatePage => '중복 페이지';
	@override String get deletePage => '페이지 삭제';
	@override String get lineHeight => '줄 높이';
	@override String get lineHeightDescription => '입력된 메모의 글자 크기도 제어합니다.';
	@override String get lineThickness => '선 두께';
	@override String get lineThicknessDescription => '배경 선 두께';
	@override String get backgroundImageFit => '배경 이미지 맞춤';
	@override String get backgroundPattern => '배경 패턴';
	@override String get import => '가져오기';
	@override String get watchServer => '서버 업데이트를 확인하세요';
	@override String get watchServerReadOnly => '서버를 시청하는 동안 편집이 비활성화됩니다.';
}

// Path: editor.photoPdfError
class _Translations$editor$photoPdfError$ko extends Translations$editor$photoPdfError$en {
	_Translations$editor$photoPdfError$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '오류';
	@override String get message => 'PDF 파일은 이미지로 추가할 수 없습니다. 해당 기능은 "${_root.editor.menu.import} > PDF"를 사용하세요.';
}

// Path: editor.readOnlyBanner
class _Translations$editor$readOnlyBanner$ko extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '읽기 전용 모드';
	@override String get watchingServer => '현재 서버의 업데이트를 확인 중입니다. 이 모드에서는 편집이 비활성화되어 있습니다.';
	@override String get corrupted => '노드를 불러오는 데 실패했습니다. 손상되었거나 아직 다운로드 중일 수 있습니다.';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$ko extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '이 메모는 더 새로운 버전의 Saber를 사용하여 편집되었습니다.';
	@override String get subtitle => '이 노트를 편집하면 일부 정보가 손실될 수 있습니다. 계속하고 싶으신가요?';
	@override String get allowEditing => '편집 허용';
}

// Path: editor.quill
class _Translations$editor$quill$ko extends Translations$editor$quill$en {
	_Translations$editor$quill$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => '여기에 무언가를 입력하세요…';
}

// Path: editor.hud
class _Translations$editor$hud$ko extends Translations$editor$hud$en {
	_Translations$editor$hud$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => '줌 잠금 해제';
	@override String get lockZoom => '줌 잠금';
	@override String get unlockSingleFingerPan => '단일 손가락 패닝 활성화';
	@override String get lockSingleFingerPan => '단일 손가락 팬 비활성화';
	@override String get unlockAxisAlignedPan => '패닝을 수평 또는 수직으로 잠금 해제하세요';
	@override String get lockAxisAlignedPan => '패닝을 수평 또는 수직으로 잠그기';
}

// Path: sentry.consent.description
class _Translations$sentry$consent$description$ko extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get question => '예상치 못한 오류를 자동으로 보고하시겠습니까? 이렇게 하면 제가 문제를 더 빨리 식별하고 수정하는 데 도움이 됩니다.';
	@override String get scope => '보고서에는 오류 및 장치에 대한 정보가 포함될 수 있습니다. 개인 데이터를 필터링하기 위해 최선을 다했지만 일부는 남아 있을 수 있습니다.';
	@override String get currentlyOff => '동의하시면 앱을 다시 시작한 후 오류 보고가 활성화됩니다.';
	@override String get currentlyOn => '동의를 철회하시면 오류 보고를 비활성화하려면 앱을 다시 시작해 주세요.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		link('개인정보 처리방침'),
		const TextSpan(text: '에서 더 알아보기.'),
	]);
}

// Path: sentry.consent.answers
class _Translations$sentry$consent$answers$ko extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get yes => '네';
	@override String get no => '아니요';
	@override String get later => '나중에 물어보세요';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$ko extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get shown => '실수로 토글되는 것을 방지합니다';
	@override String get fixedOn => '손가락 그리기(Finger drawing)는 활성화된 상태로 고정됩니다.';
	@override String get fixedOff => '손가락 그리기 기능은 비활성화로 고정됨';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$ko extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get active => '활성';
	@override String get inactive => '비활성';
	@override String get activeUntilRestart => '앱을 다시 시작할 때까지 활성 상태입니다.';
	@override String get inactiveUntilRestart => '앱을 다시 시작할 때까지 비활성 상태입니다';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$ko extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Saber에게 귀하의 Nextcloud 계정에 액세스할 수 있는 권한을 부여해 주세요.';
	@override String get followPrompts => 'Nextcloud 인터페이스의 프롬프트를 따르세요';
	@override String get browserDidntOpen => '로그인 페이지가 열리지 않았나요? 여기를 클릭하세요';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$ko extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get q => '암호화 비밀번호란 무엇인가요? 왜 두 개의 비밀번호를 사용해야 하나요?';
	@override String get a => 'Nextcloud 비밀번호는 클라우드에 접속하는 데 사용됩니다. 암호화 비밀번호는 데이터가 클라우드에 도달하기 전에 데이터를 "난독화"합니다.\n누군가가 Nextcloud 계정에 접근하더라도 별도의 비밀번호로 메모가 안전하게 암호화되어 보호됩니다. 이는 데이터를 보호하기 위한 두 번째 보안 계층을 제공합니다.\n암호화 비밀번호 없이는 서버에서 누구도 귀하의 메모에 접근할 수 없지만, 이는 또한 암호화 비밀번호를 잊어버리면 데이터에 액세스할 수 없다는 것을 의미합니다.';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$ko extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get q => '아직 암호화 비밀번호를 설정하지 않았습니다. 어디서 받을 수 있나요?';
	@override String get a => '새로운 암호화 비밀번호를 선택하고 위에 입력하세요.\nSaber가 이 비밀번호로부터 암호화 키를 자동으로 생성할 것입니다.';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$ko extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nextcloud 계정과 동일한 비밀번호를 사용할 수 있나요?';
	@override String get a => '네, 하지만 서버 관리자나 다른 사람이 귀하의 Nextcloud 계정에 접근할 경우 귀하의 메모에 접근하기가 더 쉬울 수 있다는 점을 염두에 두시기 바랍니다.';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$ko extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get fill => '스트레칭';
	@override String get cover => '커버';
	@override String get contain => '포함하다';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$ko extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$ko._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get none => '빈칸';
	@override String get college => '줄이 있는';
	@override String get collegeRtl => '줄이 있는 용지 (역방향)';
	@override String get lined => '줄을 친';
	@override String get grid => '그리드';
	@override String get dots => '점들';
	@override String get staffs => '직원들';
	@override String get tablature => '타브 악보';
	@override String get cornell => '코넬';
}
