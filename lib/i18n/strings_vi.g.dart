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
class TranslationsVi extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsVi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.vi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <vi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsVi _root = this; // ignore: unused_field

	@override 
	TranslationsVi $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsVi(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$vi common = _Translations$common$vi._(_root);
	@override late final _Translations$home$vi home = _Translations$home$vi._(_root);
	@override late final _Translations$sentry$vi sentry = _Translations$sentry$vi._(_root);
	@override late final _Translations$settings$vi settings = _Translations$settings$vi._(_root);
	@override late final _Translations$logs$vi logs = _Translations$logs$vi._(_root);
	@override late final _Translations$login$vi login = _Translations$login$vi._(_root);
	@override late final _Translations$profile$vi profile = _Translations$profile$vi._(_root);
	@override late final _Translations$appInfo$vi appInfo = _Translations$appInfo$vi._(_root);
	@override late final _Translations$update$vi update = _Translations$update$vi._(_root);
	@override late final _Translations$editor$vi editor = _Translations$editor$vi._(_root);
}

// Path: common
class _Translations$common$vi extends Translations$common$en {
	_Translations$common$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get done => 'Hoàn tất';
	@override String get continueBtn => 'Tiếp tục';
	@override String get cancel => 'Hủy';
}

// Path: home
class _Translations$home$vi extends Translations$home$en {
	_Translations$home$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$vi tabs = _Translations$home$tabs$vi._(_root);
	@override late final _Translations$home$titles$vi titles = _Translations$home$titles$vi._(_root);
	@override late final _Translations$home$tooltips$vi tooltips = _Translations$home$tooltips$vi._(_root);
	@override late final _Translations$home$create$vi create = _Translations$home$create$vi._(_root);
	@override String get welcome => 'Chào mừng đến với Saber';
	@override String get invalidFormat => 'Định dạng tệp bạn đã chọn không được hỗ trợ. Chúng tôi hỗ trợ các định dạng sbn, sbn2, hoặc pdf.';
	@override String get noFiles => 'Không tìm thấy tệp';
	@override String get noPreviewAvailable => 'Không có bản xem trước';
	@override String get createNewNote => 'Ấn nút + để tạo ghi chú mới';
	@override String get backFolder => 'Quay về thư mục trước đó';
	@override late final _Translations$home$newFolder$vi newFolder = _Translations$home$newFolder$vi._(_root);
	@override late final _Translations$home$renameNote$vi renameNote = _Translations$home$renameNote$vi._(_root);
	@override late final _Translations$home$moveNote$vi moveNote = _Translations$home$moveNote$vi._(_root);
	@override String get deleteNote => 'Xóa ghi chú';
	@override late final _Translations$home$deleteNoteDialog$vi deleteNoteDialog = _Translations$home$deleteNoteDialog$vi._(_root);
	@override late final _Translations$home$renameFolder$vi renameFolder = _Translations$home$renameFolder$vi._(_root);
	@override late final _Translations$home$deleteFolder$vi deleteFolder = _Translations$home$deleteFolder$vi._(_root);
}

// Path: sentry
class _Translations$sentry$vi extends Translations$sentry$en {
	_Translations$sentry$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$vi consent = _Translations$sentry$consent$vi._(_root);
}

// Path: settings
class _Translations$settings$vi extends Translations$settings$en {
	_Translations$settings$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$vi prefCategories = _Translations$settings$prefCategories$vi._(_root);
	@override late final _Translations$settings$prefLabels$vi prefLabels = _Translations$settings$prefLabels$vi._(_root);
	@override late final _Translations$settings$prefDescriptions$vi prefDescriptions = _Translations$settings$prefDescriptions$vi._(_root);
	@override late final _Translations$settings$themeModes$vi themeModes = _Translations$settings$themeModes$vi._(_root);
	@override late final _Translations$settings$layoutSizes$vi layoutSizes = _Translations$settings$layoutSizes$vi._(_root);
	@override late final _Translations$settings$accentColorPicker$vi accentColorPicker = _Translations$settings$accentColorPicker$vi._(_root);
	@override String get systemLanguage => 'Tự động';
	@override List<String> get axisDirections => [
		'Trên',
		'Phải',
		'Dưới',
		'Trái',
	];
	@override late final _Translations$settings$reset$vi reset = _Translations$settings$reset$vi._(_root);
	@override String get resyncEverything => 'Đồng bộ tất cả';
	@override String get openDataDir => 'Mở thư mục Saber';
	@override late final _Translations$settings$customDataDir$vi customDataDir = _Translations$settings$customDataDir$vi._(_root);
	@override String get autosaveDisabled => 'Không bao giờ';
	@override String get shapeRecognitionDisabled => 'Không bao giờ';
}

// Path: logs
class _Translations$logs$vi extends Translations$logs$en {
	_Translations$logs$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Nhật ký hoạt động';
	@override String get viewLogs => 'Xem nhật ký hoạt động';
	@override String get debuggingInfo => 'Nhật ký hoạt động chứa các thông tin cần thiết cho quá trình sửa lỗi và phát triển ứng dụng';
	@override String get noLogs => 'Không có nhật ký hoạt động!';
	@override String get useTheApp => 'Khi bạn sử dụng ứng dụng này, các tác vụ bạn thực hiện bạn sẽ được lưu lại ở đây';
}

// Path: login
class _Translations$login$vi extends Translations$login$en {
	_Translations$login$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Đăng nhập';
	@override late final _Translations$login$form$vi form = _Translations$login$form$vi._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Chưa có tài khoản? '),
		linkToSignup('Sign up now'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'Không phải bạn? '),
		undoLogin('Choose another account'),
		const TextSpan(text: '.'),
	]);
	@override late final _Translations$login$status$vi status = _Translations$login$status$vi._(_root);
	@override late final _Translations$login$ncLoginStep$vi ncLoginStep = _Translations$login$ncLoginStep$vi._(_root);
	@override late final _Translations$login$encLoginStep$vi encLoginStep = _Translations$login$encLoginStep$vi._(_root);
}

// Path: profile
class _Translations$profile$vi extends Translations$profile$en {
	_Translations$profile$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hồ sơ của tôi';
	@override String get logout => 'Đăng xuất';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Bạn đã sử dụng ${used} trên tổng số ${total} (${percent}%)';
	@override String get connectedTo => 'Kết nối tới';
	@override late final _Translations$profile$quickLinks$vi quickLinks = _Translations$profile$quickLinks$vi._(_root);
	@override String get faqTitle => 'Các câu hỏi thường gặp';
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$vi._(_root),
		_Translations$profile$faq$1$vi._(_root),
		_Translations$profile$faq$2$vi._(_root),
		_Translations$profile$faq$3$vi._(_root),
	];
}

// Path: appInfo
class _Translations$appInfo$vi extends Translations$appInfo$en {
	_Translations$appInfo$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nỨng dụng này không được bảo hành. Đây là phần mềm tự do, và bạn được chia sẻ lại nó theo các điều kiện nhất định.';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Nhấn vào đây để mua cho tôi một ly cà phê hoặc mua thêm dung lượng lưu trữ';
	@override String get licenseButton => 'Nhấn vào đây để xem thêm thông tin bản quyền';
	@override String get privacyPolicyButton => 'Nhấn vào đây để xem chính sách quyền riêng tư';
}

// Path: update
class _Translations$update$vi extends Translations$update$en {
	_Translations$update$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Các bản cập nhật có sẵn';
	@override String get updateAvailableDescription => 'Đã có phiên bản mới:';
	@override String get update => 'Cập nhật';
	@override String get downloadNotAvailableYet => 'Bản cập nhật hiện chưa có sẵn cho nền tảng của bạn. Vui lòng quay lại kiểm tra sau.';
}

// Path: editor
class _Translations$editor$vi extends Translations$editor$en {
	_Translations$editor$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$vi toolbar = _Translations$editor$toolbar$vi._(_root);
	@override late final _Translations$editor$pens$vi pens = _Translations$editor$pens$vi._(_root);
	@override late final _Translations$editor$penOptions$vi penOptions = _Translations$editor$penOptions$vi._(_root);
	@override late final _Translations$editor$colors$vi colors = _Translations$editor$colors$vi._(_root);
	@override late final _Translations$editor$imageOptions$vi imageOptions = _Translations$editor$imageOptions$vi._(_root);
	@override late final _Translations$editor$selectionBar$vi selectionBar = _Translations$editor$selectionBar$vi._(_root);
	@override late final _Translations$editor$menu$vi menu = _Translations$editor$menu$vi._(_root);
	@override late final _Translations$editor$readOnlyBanner$vi readOnlyBanner = _Translations$editor$readOnlyBanner$vi._(_root);
	@override late final _Translations$editor$versionTooNew$vi versionTooNew = _Translations$editor$versionTooNew$vi._(_root);
	@override late final _Translations$editor$quill$vi quill = _Translations$editor$quill$vi._(_root);
	@override late final _Translations$editor$hud$vi hud = _Translations$editor$hud$vi._(_root);
	@override String get pages => 'Trang';
	@override String get untitled => 'Chưa đặt tên';
	@override String get needsToSaveBeforeExiting => 'Đang lưu... Bạn có thể rời trình chỉnh sửa khi hoàn tất';
}

// Path: home.tabs
class _Translations$home$tabs$vi extends Translations$home$tabs$en {
	_Translations$home$tabs$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get home => 'Trang chủ';
	@override String get browse => 'Duyệt tệp';
	@override String get whiteboard => 'Bảng vẽ tự do';
	@override String get settings => 'Cài đặt';
}

// Path: home.titles
class _Translations$home$titles$vi extends Translations$home$titles$en {
	_Translations$home$titles$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get home => 'Các ghi chú gần đây';
	@override String get browse => 'Duyệt';
	@override String get whiteboard => 'Bảng vẽ tự do';
	@override String get settings => 'Cài đặt';
}

// Path: home.tooltips
class _Translations$home$tooltips$vi extends Translations$home$tooltips$en {
	_Translations$home$tooltips$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Ghi chú mới';
	@override String get showUpdateDialog => 'Xem thông tin cập nhật';
	@override String get exportNote => 'Xuất tệp';
}

// Path: home.create
class _Translations$home$create$vi extends Translations$home$create$en {
	_Translations$home$create$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Ghi chú mới';
	@override String get importNote => 'Nhập tệp';
}

// Path: home.newFolder
class _Translations$home$newFolder$vi extends Translations$home$newFolder$en {
	_Translations$home$newFolder$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Tạo thư mục mới';
	@override String get folderName => 'Nhập tên thư mục';
	@override String get create => 'Tạo';
	@override String get folderNameEmpty => 'Không được bỏ trống tên thư mục';
	@override String get folderNameContainsSlash => 'Tên thư mục không được chứa kí tự /';
	@override String get folderNameExists => 'Tên thư mục đã tồn tại';
}

// Path: home.renameNote
class _Translations$home$renameNote$vi extends Translations$home$renameNote$en {
	_Translations$home$renameNote$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Đổi tên ghi chú';
	@override String get noteName => 'Nhập tên mới';
	@override String get rename => 'Đổi tên';
	@override String get noteNameEmpty => 'Không được bỏ trống tên ghi chú';
	@override String get noteNameExists => 'Đã tồn tại ghi chú có tên này';
	@override String get noteNameForbiddenCharacters => 'Tên ghi chú không được chứa các kí tự cấm';
	@override String get noteNameReserved => 'Tên này không khả dụng';
}

// Path: home.moveNote
class _Translations$home$moveNote$vi extends Translations$home$moveNote$en {
	_Translations$home$moveNote$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Di chuyển ghi chú';
	@override String moveNotes({required Object n}) => 'Di chuyển ${n} ghi chú';
	@override String moveName({required Object f}) => 'Di chuyển ${f}';
	@override String get move => 'Di chuyển';
	@override String renamedTo({required Object newName}) => 'Ghi chú sẽ được đổi tên thành ${newName}';
	@override String get multipleRenamedTo => 'Các ghi chú sau sẽ được đổi tên:';
	@override String numberRenamedTo({required Object n}) => 'Sẽ đổi tên ${n} ghi chú để tránh xung đột';
}

// Path: home.deleteNoteDialog
class _Translations$home$deleteNoteDialog$vi extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('vi'))(n,
		one: 'Xóa vĩnh viễn ghi chú đã chọn?',
		other: 'Xóa vĩnh viễn các ghi chú đã chọn?',
	);
	@override String deleteNotes({required Object n}) => 'Xóa ${n} ghi chú';
	@override String deleteName({required Object f}) => 'Xóa ${f}';
	@override String get delete => 'Xóa';
}

// Path: home.renameFolder
class _Translations$home$renameFolder$vi extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Đổi tên thư mục';
	@override String get folderName => 'Tên thư mục';
	@override String get rename => 'Đổi tên';
	@override String get folderNameEmpty => 'Không được bỏ trống tên thư mục';
	@override String get folderNameContainsSlash => 'Tên thư mục không được chứa kí tự /';
	@override String get folderNameExists => 'Đã tồn tại thư mục có tên này';
}

// Path: home.deleteFolder
class _Translations$home$deleteFolder$vi extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Xóa thư mục';
	@override String deleteName({required Object f}) => 'Xóa ${f}';
	@override String get delete => 'Xóa';
	@override String get alsoDeleteContents => 'Các ghi chú bên trong thư mục này cũng sẽ bị xóa';
}

// Path: sentry.consent
class _Translations$sentry$consent$vi extends Translations$sentry$consent$en {
	_Translations$sentry$consent$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Đóng góp cho Saber?';
	@override late final _Translations$sentry$consent$description$vi description = _Translations$sentry$consent$description$vi._(_root);
	@override late final _Translations$sentry$consent$answers$vi answers = _Translations$sentry$consent$answers$vi._(_root);
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$vi extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get general => 'Cài đặt chung';
	@override String get writing => 'Các tính năng vẽ';
	@override String get editor => 'Các tính năng trình ghi chú';
	@override String get performance => 'Hiệu năng';
	@override String get advanced => 'Cài đặt nâng cao';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$vi extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Ngôn ngữ';
	@override String get appTheme => 'Chế độ Sáng/Tối';
	@override String get platform => 'Dạng hệ điều hành';
	@override String get layoutSize => 'Bố cục';
	@override String get customAccentColor => 'Màu chủ đạo';
	@override String get hyperlegibleFont => 'Trợ năng: Phông chữ Atkinson Hyperlegible';
	@override String get shouldCheckForUpdates => 'Kiểm tra phiên bản mới';
	@override String get shouldAlwaysAlertForUpdates => 'Cập nhật kịp thời';
	@override String get allowInsecureConnections => 'Cho phép các kết nối không an toàn';
	@override String get editorToolbarAlignment => 'Ví trị thanh công cụ';
	@override String get editorToolbarShowInFullscreen => 'Hiển thị thanh công cụ trong chế độ Toàn màn hình';
	@override String get editorAutoInvert => 'Đảo màu ghi chú trong chế độ tối';
	@override String get preferGreyscale => 'Tông màu xám';
	@override String get maxImageSize => 'Kích thước ảnh tối đa';
	@override String get autoClearWhiteboardOnExit => 'Tự động xóa bảng vẽ tự do';
	@override String get disableEraserAfterUse => 'Tự động tắt chế độ tẩy';
	@override String get hideFingerDrawingToggle => 'Tắt chế độ vẽ bằng tay';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Tự động tắt chế độ vẽ bằng tay';
	@override String get editorPromptRename => 'Nhắc tôi đổi tên ghi chú mới';
	@override String get recentColorsDontSavePresets => 'Tắt tự động lưu bảng màu mặc định vào lịch sử màu';
	@override String get recentColorsLength => 'Số lượng màu được lưu';
	@override String get printPageIndicators => 'Đánh số trang';
	@override String get autosave => 'Tự động lưu';
	@override String get shapeRecognitionDelay => 'Độ trễ khi nhận dạng vật thể';
	@override String get autoStraightenLines => 'Tự động nắn thẳng các đường kẻ';
	@override String get simplifiedHomeLayout => 'Đơn giản hóa giao diện';
	@override String get customDataDir => 'Đổi vị trí thư mục Saber';
	@override String get sentry => 'Báo cáo lỗi';
}

// Path: settings.prefDescriptions
class _Translations$settings$prefDescriptions$vi extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Tăng khả năng đọc cho người khiếm thị';
	@override String get allowInsecureConnections => '(Không khuyến nghị) Cho phép Saber kết nối với các máy chủ có chứng chỉ tự ký hoặc không đáng tin cậy';
	@override String get preferGreyscale => 'Dành cho màn hình e-ink';
	@override String get autoClearWhiteboardOnExit => 'Xóa bảng vẽ tự do sau khi bạn thoát ứng dụng';
	@override String get disableEraserAfterUse => 'Tự động sử dụng bút vẽ sau khi dùng tẩy';
	@override String get maxImageSize => 'Các hình ảnh lớn hơn sẽ bị nén lại';
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$vi hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$vi._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Tắt chế độ vẽ bằng ngón tay khi nhận diện được bút cảm ứng';
	@override String get editorPromptRename => 'Bạn có thể đổi tên ghi chú sau';
	@override String get printPageIndicators => 'Hiển thị chỉ số trang khi xuất tệp';
	@override String get autosave => 'Tự động lưu sau một khoảng thời gian ngắn hoặc không bao giờ';
	@override String get shapeRecognitionDelay => 'Tần suất cập nhật bản xem trước hình dạng';
	@override String get autoStraightenLines => 'Tự động nắn thẳng các đường kẻ dài mà không cần phải sử dụng bút vẽ hình chuyên dụng';
	@override String get simplifiedHomeLayout => 'Thiết lập chiều cao cố định cho mỗi bản xem trước ghi chú';
	@override String get shouldAlwaysAlertForUpdates => 'Thông báo cho tôi về các bản cập nhật mới khi chúng được phát hành';
	@override late final _Translations$settings$prefDescriptions$sentry$vi sentry = _Translations$settings$prefDescriptions$sentry$vi._(_root);
}

// Path: settings.themeModes
class _Translations$settings$themeModes$vi extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get system => 'Hệ thống';
	@override String get light => 'Chế độ sáng';
	@override String get dark => 'Chế độ Tối';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$vi extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Tuân theo hệ thống';
	@override String get phone => 'Bố cục điện thoại';
	@override String get tablet => 'Bố cục máy tính bảng';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$vi extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Chọn một màu';
}

// Path: settings.reset
class _Translations$settings$reset$vi extends Translations$settings$reset$en {
	_Translations$settings$reset$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quay về cài đặt mặc định?';
	@override String get button => 'Quay về';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$vi extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Hủy';
	@override String get select => 'Chọn';
	@override String get mustBeEmpty => 'Thư mục được chọn phải là thư mục trống';
	@override String get mustBeDoneSyncing => 'Hãy đảm bảo quá trình đồng bộ đã hoàn tất trước khi thay đổi thư mục';
	@override String get unsupported => 'Tính năng hiện chỉ khả dụng cho nhà phát triển phần mềm. Dùng nó có thể dẫn đến mất mát dữ liệu.';
}

// Path: login.form
class _Translations$login$form$vi extends Translations$login$form$en {
	_Translations$login$form$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Bằng việc đăng nhập, bạn đồng ý với '),
		linkToPrivacyPolicy('Privacy Policy'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _Translations$login$status$vi extends Translations$login$status$en {
	_Translations$login$status$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Đăng xuất';
	@override String get tapToLogin => 'Ấn để đăng nhập bằng Nextcloud';
	@override String hi({required Object u}) => 'Xin chào, ${u}!';
	@override String get almostDone => 'Sắp xong rồi, chạm vào màn hình để hoàn tất đăng nhập';
	@override String get loggedIn => 'Đã đăng nhập bằng Nextcloud';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$vi extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'Chọn nơi lưu trữ dữ liệu của bạn:';
	@override String get saberNcServer => 'Máy chủ Nextcloud của Saber';
	@override String get otherNcServer => 'Các máy chủ Nextcloud khác';
	@override String get serverUrl => 'Đường dẫn máy chủ';
	@override String get loginWithSaber => 'Đăng nhập bằng Saber';
	@override String get loginWithNextcloud => 'Đăng nhập bằng Nextcloud';
	@override late final _Translations$login$ncLoginStep$loginFlow$vi loginFlow = _Translations$login$ncLoginStep$loginFlow$vi._(_root);
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$vi extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Để bảo vệ dữ liệu của bạn, hãy nhập mật khẩu bạn muốn sử dụng để mã hóa chúng:';
	@override String get newToSaber => 'Người mới tới? Bạn chỉ cần nhập một mật khẩu mã hóa mới.';
	@override String get encPassword => 'Mật khẩu mã hóa';
	@override String get encFaqTitle => 'Các câu hỏi thường gặp';
	@override String get wrongEncPassword => 'Không thể giải mã với khóa mã hóa được cung cấp. Hãy nhập lại.';
	@override String get connectionFailed => 'Đã xảy ra lỗi khi kết nối đến máy chủ. Vui lòng thử lại sau.';
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$vi._(_root),
		_Translations$login$encLoginStep$encFaq$1$vi._(_root),
		_Translations$login$encLoginStep$encFaq$2$vi._(_root),
	];
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$vi extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Trang chủ';
	@override String get deleteAccount => 'Xóa tài khoản';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$vi extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get q => 'Tôi có bị mất ghi chú nếu đăng xuất không?';
	@override String get a => 'Không. Ghi chú của bạn vẫn sẽ được lưu trên cả thiết bị và máy chủ. Tuy nhiên, chúng sẽ không được đồng bộ hóa với máy chủ cho đến khi bạn đăng nhập lại. Hãy đảm bảo quá trình đồng bộ đã hoàn tất trước khi đăng xuất để không bị mất dữ liệu (bạn có thể xem tiến trình đồng bộ tại màn hình chính).';
}

// Path: profile.faq.1
class _Translations$profile$faq$1$vi extends Translations$profile$faq$1$en {
	_Translations$profile$faq$1$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get q => 'Làm sao để thay đổi mật khẩu Nextcloud?';
	@override String get a => 'Truy cập vào trang web máy chủ của bạn và đăng nhập. Sau đó, đi tới Cài đặt > Bảo mật > Thay đổi mật khẩu. Bạn sẽ cần phải đăng xuất và đăng nhập lại vào Saber sau khi thay đổi mật khẩu.';
}

// Path: profile.faq.2
class _Translations$profile$faq$2$vi extends Translations$profile$faq$2$en {
	_Translations$profile$faq$2$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get q => 'Làm sao để thay đổi mật khẩu mã hóa?';
	@override String get a => '0. Hãy đảm bảo quá trình đồng bộ đã hoàn tất (kiểm tra tiến trình đồng bộ tại màn hình chính).\n1. Đăng xuất khỏi Saber.\n2. Truy cập vào trang web máy chủ của bạn và xóa thư mục \'Saber\'. Thao tác này sẽ xóa tất cả ghi chú của bạn khỏi máy chủ.\n3. Đăng nhập lại vào Saber. Bạn có thể chọn một mật khẩu mã hóa mới khi đăng nhập.\n4. Đừng quên đăng xuất và đăng nhập lại vào Saber trên các thiết bị khác của bạn nữa nhé.';
}

// Path: profile.faq.3
class _Translations$profile$faq$3$vi extends Translations$profile$faq$3$en {
	_Translations$profile$faq$3$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get q => 'Làm sao để xóa tài khoản của tôi?';
	@override String get a => 'Nhấn vào "${_root.profile.quickLinks.deleteAccount}" ở trên và đăng nhập nếu được yêu cầu.\nNếu bạn đang sử dụng máy chủ chính thức của Saber, tài khoản của bạn sẽ được xóa sau thời gian chờ 1 tuần. Trong khoảng thời gian này, bạn có thể liên hệ với tôi qua địa chỉ adilhanney@disroot.org để hủy yêu cầu xóa.\nNếu bạn đang sử dụng máy chủ của bên thứ ba, có thể sẽ không có tùy chọn xóa tài khoản: bạn sẽ cần tham khảo chính sách quyền riêng tư của máy chủ đó để biết thêm thông tin.';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$vi extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Bật/Tắt màu sắc (Ctrl C)';
	@override String get select => 'Chọn';
	@override String get toggleEraser => 'Bật/Tắt tẩy (Ctrl E)';
	@override String get photo => 'Ảnh';
	@override String get text => 'Văn bản';
	@override String get toggleFingerDrawing => 'Bật/Tắt vẽ bằng ngón tay (Ctrl F)';
	@override String get undo => 'Hoàn tác';
	@override String get redo => 'Làm lại';
	@override String get export => 'Xuất tệp (Ctrl Shift S)';
	@override String get exportAs => 'Xuất tệp dưới dạng:';
	@override String get fullscreen => 'Toàn màn hình (F11)';
}

// Path: editor.pens
class _Translations$editor$pens$vi extends Translations$editor$pens$en {
	_Translations$editor$pens$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Bút máy';
	@override String get ballpointPen => 'Bút bi';
	@override String get highlighter => 'Bút dạ quang';
	@override String get pencil => 'Bút chì';
	@override String get shapePen => 'Bút vẽ hình học';
	@override String get laserPointer => 'Bút chỉ laser';
}

// Path: editor.penOptions
class _Translations$editor$penOptions$vi extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get size => 'Kích thước';
}

// Path: editor.colors
class _Translations$editor$colors$vi extends Translations$editor$colors$en {
	_Translations$editor$colors$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Chọn màu';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Tùy chỉnh ${b} ${h}';
	@override String customHue({required Object h}) => 'Tùy chỉnh ${h}';
	@override String get dark => 'tối';
	@override String get light => 'sáng';
	@override String get black => 'Đen';
	@override String get darkGrey => 'Xám đen';
	@override String get grey => 'Xám';
	@override String get lightGrey => 'Xám nhạt';
	@override String get white => 'Trắng';
	@override String get red => 'Đỏ';
	@override String get green => 'Xanh lá';
	@override String get cyan => 'Xanh lơ';
	@override String get blue => 'Xanh da trời';
	@override String get yellow => 'Vàng';
	@override String get purple => 'Tím';
	@override String get pink => 'Hồng';
	@override String get orange => 'Cam';
	@override String get pastelRed => 'Đỏ pastel';
	@override String get pastelOrange => 'Cam pastel';
	@override String get pastelYellow => 'Vàng pastel';
	@override String get pastelGreen => 'Xanh lá pastel';
	@override String get pastelCyan => 'Xanh lơ pastel';
	@override String get pastelBlue => 'Xanh da trời pastel';
	@override String get pastelPurple => 'Tím pastel';
	@override String get pastelPink => 'Hồng pastel';
}

// Path: editor.imageOptions
class _Translations$editor$imageOptions$vi extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Các tùy chọn ảnh';
	@override String get invertible => 'Cho phép đảo màu';
	@override String get download => 'Tải xuống';
	@override String get setAsBackground => 'Đặt làm hình nền';
	@override String get removeAsBackground => 'Gỡ bỏ hình nền';
	@override String get delete => 'Xóa';
}

// Path: editor.selectionBar
class _Translations$editor$selectionBar$vi extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Xóa';
	@override String get duplicate => 'Nhân bản';
}

// Path: editor.menu
class _Translations$editor$menu$vi extends Translations$editor$menu$en {
	_Translations$editor$menu$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Xóa sạch trang ${page}/${totalPages}';
	@override String get clearAllPages => 'Xóa sạch tất cả các trang';
	@override String get insertPage => 'Chèn trang phía dưới';
	@override String get duplicatePage => 'Nhân bản trang';
	@override String get deletePage => 'Xóa trang';
	@override String get lineHeight => 'Độ giãn dòng';
	@override String get lineHeightDescription => 'Đồng thời thay đổi kích thước và độ giãn dòng của văn bản';
	@override String get lineThickness => 'Độ dày nét';
	@override String get lineThicknessDescription => 'Độ dày nét kẻ';
	@override String get backgroundImageFit => 'Khớp hình nền';
	@override String get backgroundPattern => 'Họa tiết nền';
	@override String get import => 'Nhập tệp';
	@override String get watchServer => 'Theo dõi cập nhật từ máy chủ';
	@override String get watchServerReadOnly => 'Không thể chỉnh sửa khi đang cập nhật từ máy chủ';
	@override late final _Translations$editor$menu$boxFits$vi boxFits = _Translations$editor$menu$boxFits$vi._(_root);
	@override late final _Translations$editor$menu$bgPatterns$vi bgPatterns = _Translations$editor$menu$bgPatterns$vi._(_root);
}

// Path: editor.readOnlyBanner
class _Translations$editor$readOnlyBanner$vi extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chỉ đọc';
	@override String get watchingServer => 'Đang theo dõi cập nhật từ máy chủ. Không thể chỉnh sửa lúc này.';
	@override String get corrupted => 'Không thể tải ghi chú. Tệp có thể bị lỗi hoặc vẫn đang được tải xuống.';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$vi extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ghi chú này đã được chỉnh sửa bằng phiên bản Saber mới hơn';
	@override String get subtitle => 'Chỉnh sửa có thể làm mất dữ liệu. Bạn vẫn muốn tiếp tục?';
	@override String get allowEditing => 'Cho phép chỉnh sửa';
}

// Path: editor.quill
class _Translations$editor$quill$vi extends Translations$editor$quill$en {
	_Translations$editor$quill$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Nhập gì đó...';
}

// Path: editor.hud
class _Translations$editor$hud$vi extends Translations$editor$hud$en {
	_Translations$editor$hud$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Cho phép thu/phóng';
	@override String get lockZoom => 'Khóa thu/phóng';
	@override String get unlockSingleFingerPan => 'Bật di chuyển một ngón';
	@override String get lockSingleFingerPan => 'Tắt di chuyển một ngón';
	@override String get unlockAxisAlignedPan => 'Cho phép kéo trang tự do';
	@override String get lockAxisAlignedPan => 'Khóa di chuyển theo trục';
}

// Path: sentry.consent.description
class _Translations$sentry$consent$description$vi extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get question => 'Bạn có muốn ứng dụng tự động báo cáo lỗi cho chúng tôi? Điều này sẽ giúp chúng tôi xác định và đưa ra các bản vá kịp thời.';
	@override String get scope => 'Báo cáo này có thể chứa các thông tin về thiết bị của bạn và lỗi gặp phải. Chúng tôi đã cố gắng để lọc đi thông tin cá nhân, nhưng vẫn có thể còn sót một số thông tin.';
	@override String get currentlyOff => 'Nếu bạn đồng ý, tính năng báo cáo lỗi sẽ được kích hoạt sau khi bạn khởi động lại ứng dụng.';
	@override String get currentlyOn => 'Nếu bạn từ chối, vui lòng khởi động lại ứng dụng để vô hiệu hóa tính năng báo cáo lỗi.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Tìm hiểu thêm ở '),
		link('privacy policy'),
		const TextSpan(text: '.'),
	]);
}

// Path: sentry.consent.answers
class _Translations$sentry$consent$answers$vi extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Có';
	@override String get no => 'Không';
	@override String get later => 'Hỏi lại tôi sau';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$vi extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Ngăn chặn việc vô tình bật/tắt';
	@override String get fixedOn => 'Tính năng vẽ bằng ngón tay luôn được tự động bật';
	@override String get fixedOff => 'Tính năng vẽ bằng ngón tay luôn được tự động tắt';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$vi extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get active => 'Đang bật';
	@override String get inactive => 'Đang tắt';
	@override String get activeUntilRestart => 'Tính năng này sẽ được bật cho đến khi bạn khởi động lại ứng dụng';
	@override String get inactiveUntilRestart => 'Tính năng này sẽ được tắt cho đến khi bạn khởi động lại ứng dụng';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$vi extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Vui lòng cho phép Saber truy cập vào tài khoản Nextcloud của bạn';
	@override String get followPrompts => 'Vui lòng làm theo các hướng dẫn trên giao diện Nextcloud';
	@override String get browserDidntOpen => 'Trang đăng nhập không xuất hiện? Hãy ấn vào đây';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$vi extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get q => 'Mật khẩu mã hóa là gì? Tại sao lại phải dùng hai mật khẩu?';
	@override String get a => 'Mật khẩu Nextcloud được dùng để truy cập vào lưu trữ đám mây. Còn mật khẩu mã hóa sẽ "trộn lẫn" dữ liệu của bạn trước khi chúng được gửi lên đám mây đó.\nNgay cả khi có ai đó đột nhập được vào tài khoản Nextcloud, các ghi chú của bạn vẫn sẽ an toàn vì đã được mã hóa bằng một mật khẩu riêng biệt. Điều này tạo ra một lớp bảo mật thứ hai để bảo vệ dữ liệu của bạn.\nKhông ai có thể xem ghi chú trên máy chủ nếu không có mật khẩu mã hóa. Tuy nhiên, điều này cũng đồng nghĩa với việc nếu bạn quên mật khẩu mã hóa, bạn sẽ mất quyền truy cập vào dữ liệu của chính mình.';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$vi extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get q => 'Tôi chưa thiết lập mật khẩu mã hóa. Tôi có thể tạo nó ở đâu?';
	@override String get a => 'Hãy chọn một mật khẩu mã hóa mới và nhập vào ô bên trên.\nSaber sẽ tự động tạo các khóa mã hóa cho bạn từ mật khẩu này.';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$vi extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get q => 'Tôi có thể dùng cùng một mật khẩu với tài khoản Nextcloud không?';
	@override String get a => 'Được, nhưng hãy lưu ý rằng quản trị viên hoặc bất kỳ ai khác sẽ dễ dàng truy cập vào ghi chú của bạn hơn nếu họ chiếm được quyền truy cập vào tài khoản Nextcloud.';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$vi extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Dãn';
	@override String get cover => 'Phủ';
	@override String get contain => 'Chứa';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$vi extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get none => 'Trống';
	@override String get college => 'Dòng kẻ hẹp';
	@override String get collegeRtl => 'Dòng kẻ hẹp (Đảo ngược)';
	@override String get lined => 'Dòng kẻ ngang';
	@override String get grid => 'Ô vuông';
	@override String get dots => 'Chấm tròn';
	@override String get staffs => 'Kẻ khuông nhạc';
	@override String get tablature => 'Kẻ Tab';
	@override String get cornell => 'Ghi chép Cornell';
}
