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
	@override late final _TranslationsCommonVi common = _TranslationsCommonVi._(_root);
	@override late final _TranslationsHomeVi home = _TranslationsHomeVi._(_root);
	@override late final _TranslationsSentryVi sentry = _TranslationsSentryVi._(_root);
	@override late final _TranslationsSettingsVi settings = _TranslationsSettingsVi._(_root);
	@override late final _TranslationsLogsVi logs = _TranslationsLogsVi._(_root);
	@override late final _TranslationsLoginVi login = _TranslationsLoginVi._(_root);
	@override late final _TranslationsProfileVi profile = _TranslationsProfileVi._(_root);
	@override late final _TranslationsAppInfoVi appInfo = _TranslationsAppInfoVi._(_root);
	@override late final _TranslationsUpdateVi update = _TranslationsUpdateVi._(_root);
	@override late final _TranslationsEditorVi editor = _TranslationsEditorVi._(_root);
}

// Path: common
class _TranslationsCommonVi extends TranslationsCommonEn {
	_TranslationsCommonVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get done => 'Hoàn tất';
	@override String get continueBtn => 'Tiếp tục';
	@override String get cancel => 'Hủy';
}

// Path: home
class _TranslationsHomeVi extends TranslationsHomeEn {
	_TranslationsHomeVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsVi tabs = _TranslationsHomeTabsVi._(_root);
	@override late final _TranslationsHomeTitlesVi titles = _TranslationsHomeTitlesVi._(_root);
	@override late final _TranslationsHomeTooltipsVi tooltips = _TranslationsHomeTooltipsVi._(_root);
	@override late final _TranslationsHomeCreateVi create = _TranslationsHomeCreateVi._(_root);
	@override String get welcome => 'Chào mừng đến với Saber';
	@override String get invalidFormat => 'Định dạng tệp bạn đã chọn không được hỗ trợ. Chúng tôi hỗ trợ các định dạng sbn, sbn2, hoặc pdf.';
	@override String get noFiles => 'Không tìm thấy tệp';
	@override String get noPreviewAvailable => 'Không có bản xem trước';
	@override String get createNewNote => 'Ấn nút + để tạo ghi chú mới';
	@override String get backFolder => 'Quay về thư mục trước đó';
	@override late final _TranslationsHomeNewFolderVi newFolder = _TranslationsHomeNewFolderVi._(_root);
	@override late final _TranslationsHomeRenameNoteVi renameNote = _TranslationsHomeRenameNoteVi._(_root);
	@override late final _TranslationsHomeMoveNoteVi moveNote = _TranslationsHomeMoveNoteVi._(_root);
	@override String get deleteNote => 'Xóa ghi chú';
	@override late final _TranslationsHomeRenameFolderVi renameFolder = _TranslationsHomeRenameFolderVi._(_root);
	@override late final _TranslationsHomeDeleteFolderVi deleteFolder = _TranslationsHomeDeleteFolderVi._(_root);
}

// Path: sentry
class _TranslationsSentryVi extends TranslationsSentryEn {
	_TranslationsSentryVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSentryConsentVi consent = _TranslationsSentryConsentVi._(_root);
}

// Path: settings
class _TranslationsSettingsVi extends TranslationsSettingsEn {
	_TranslationsSettingsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesVi prefCategories = _TranslationsSettingsPrefCategoriesVi._(_root);
	@override late final _TranslationsSettingsPrefLabelsVi prefLabels = _TranslationsSettingsPrefLabelsVi._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsVi prefDescriptions = _TranslationsSettingsPrefDescriptionsVi._(_root);
	@override late final _TranslationsSettingsThemeModesVi themeModes = _TranslationsSettingsThemeModesVi._(_root);
	@override late final _TranslationsSettingsLayoutSizesVi layoutSizes = _TranslationsSettingsLayoutSizesVi._(_root);
	@override late final _TranslationsSettingsAccentColorPickerVi accentColorPicker = _TranslationsSettingsAccentColorPickerVi._(_root);
	@override String get systemLanguage => 'Tự động';
	@override List<String> get axisDirections => [
		'Trên',
		'Phải',
		'Dưới',
		'Trái',
	];
	@override late final _TranslationsSettingsResetVi reset = _TranslationsSettingsResetVi._(_root);
	@override String get resyncEverything => 'Đồng bộ tất cả';
	@override String get openDataDir => 'Mở thư mục Saber';
	@override late final _TranslationsSettingsCustomDataDirVi customDataDir = _TranslationsSettingsCustomDataDirVi._(_root);
	@override String get autosaveDisabled => 'Không bao giờ';
	@override String get shapeRecognitionDisabled => 'Không bao giờ';
}

// Path: logs
class _TranslationsLogsVi extends TranslationsLogsEn {
	_TranslationsLogsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Nhật ký hoạt động';
	@override String get viewLogs => 'Xem nhật ký hoạt động';
	@override String get debuggingInfo => 'Nhật ký hoạt động chứa các thông tin cần thiết cho quá trình sửa lỗi và phát triển ứng dụng';
	@override String get noLogs => 'Không có nhật ký hoạt động!';
	@override String get useTheApp => 'Khi bạn sử dụng ứng dụng này, các tác vụ bạn thực hiện bạn sẽ được lưu lại ở đây';
}

// Path: login
class _TranslationsLoginVi extends TranslationsLoginEn {
	_TranslationsLoginVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Đăng nhập';
	@override late final _TranslationsLoginFormVi form = _TranslationsLoginFormVi._(_root);
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
	@override late final _TranslationsLoginStatusVi status = _TranslationsLoginStatusVi._(_root);
	@override late final _TranslationsLoginNcLoginStepVi ncLoginStep = _TranslationsLoginNcLoginStepVi._(_root);
	@override late final _TranslationsLoginEncLoginStepVi encLoginStep = _TranslationsLoginEncLoginStepVi._(_root);
}

// Path: profile
class _TranslationsProfileVi extends TranslationsProfileEn {
	_TranslationsProfileVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hồ sơ của tôi';
	@override String get logout => 'Đăng xuất';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Bạn đã sử dụng ${used} trên tổng số ${total} (${percent}%)';
	@override String get connectedTo => 'Kết nối tới';
	@override late final _TranslationsProfileQuickLinksVi quickLinks = _TranslationsProfileQuickLinksVi._(_root);
	@override String get faqTitle => 'Các câu hỏi thường gặp';
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$Vi._(_root),
		_TranslationsProfile$faq$0i1$Vi._(_root),
		_TranslationsProfile$faq$0i2$Vi._(_root),
		_TranslationsProfile$faq$0i3$Vi._(_root),
	];
}

// Path: appInfo
class _TranslationsAppInfoVi extends TranslationsAppInfoEn {
	_TranslationsAppInfoVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nỨng dụng này không được bảo hành. Đây là phần mềm tự do, và bạn được chia sẻ lại nó theo các điều kiện nhất định.';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Nhấn vào đây để mua cho tôi một ly cà phê hoặc mua thêm dung lượng lưu trữ';
	@override String get licenseButton => 'Nhấn vào đây để xem thêm thông tin bản quyền';
	@override String get privacyPolicyButton => 'Nhấn vào đây để xem chính sách quyền riêng tư';
}

// Path: update
class _TranslationsUpdateVi extends TranslationsUpdateEn {
	_TranslationsUpdateVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Các bản cập nhật có sẵn';
	@override String get updateAvailableDescription => 'Đã có phiên bản mới:';
	@override String get update => 'Cập nhật';
	@override String get downloadNotAvailableYet => 'Bản cập nhật hiện chưa có sẵn cho nền tảng của bạn. Vui lòng quay lại kiểm tra sau.';
}

// Path: editor
class _TranslationsEditorVi extends TranslationsEditorEn {
	_TranslationsEditorVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarVi toolbar = _TranslationsEditorToolbarVi._(_root);
	@override late final _TranslationsEditorPensVi pens = _TranslationsEditorPensVi._(_root);
	@override late final _TranslationsEditorPenOptionsVi penOptions = _TranslationsEditorPenOptionsVi._(_root);
	@override late final _TranslationsEditorColorsVi colors = _TranslationsEditorColorsVi._(_root);
	@override late final _TranslationsEditorImageOptionsVi imageOptions = _TranslationsEditorImageOptionsVi._(_root);
	@override late final _TranslationsEditorSelectionBarVi selectionBar = _TranslationsEditorSelectionBarVi._(_root);
	@override late final _TranslationsEditorMenuVi menu = _TranslationsEditorMenuVi._(_root);
	@override late final _TranslationsEditorReadOnlyBannerVi readOnlyBanner = _TranslationsEditorReadOnlyBannerVi._(_root);
	@override late final _TranslationsEditorVersionTooNewVi versionTooNew = _TranslationsEditorVersionTooNewVi._(_root);
	@override late final _TranslationsEditorQuillVi quill = _TranslationsEditorQuillVi._(_root);
	@override late final _TranslationsEditorHudVi hud = _TranslationsEditorHudVi._(_root);
	@override String get pages => 'Trang';
	@override String get untitled => 'Chưa đặt tên';
	@override String get needsToSaveBeforeExiting => 'Đang lưu... Bạn có thể rời trình chỉnh sửa khi hoàn tất';
}

// Path: home.tabs
class _TranslationsHomeTabsVi extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get home => 'Trang chủ';
	@override String get browse => 'Duyệt tệp';
	@override String get whiteboard => 'Bảng vẽ tự do';
	@override String get settings => 'Cài đặt';
}

// Path: home.titles
class _TranslationsHomeTitlesVi extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get home => 'Các ghi chú gần đây';
	@override String get browse => 'Duyệt';
	@override String get whiteboard => 'Bảng vẽ tự do';
	@override String get settings => 'Cài đặt';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsVi extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Ghi chú mới';
	@override String get showUpdateDialog => 'Xem thông tin cập nhật';
	@override String get exportNote => 'Xuất tệp';
}

// Path: home.create
class _TranslationsHomeCreateVi extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Ghi chú mới';
	@override String get importNote => 'Nhập tệp';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderVi extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderVi._(TranslationsVi root) : this._root = root, super.internal(root);

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
class _TranslationsHomeRenameNoteVi extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteVi._(TranslationsVi root) : this._root = root, super.internal(root);

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
class _TranslationsHomeMoveNoteVi extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteVi._(TranslationsVi root) : this._root = root, super.internal(root);

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

// Path: home.renameFolder
class _TranslationsHomeRenameFolderVi extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderVi._(TranslationsVi root) : this._root = root, super.internal(root);

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
class _TranslationsHomeDeleteFolderVi extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Xóa thư mục';
	@override String deleteName({required Object f}) => 'Xóa ${f}';
	@override String get delete => 'Xóa';
	@override String get alsoDeleteContents => 'Các ghi chú bên trong thư mục này cũng sẽ bị xóa';
}

// Path: sentry.consent
class _TranslationsSentryConsentVi extends TranslationsSentryConsentEn {
	_TranslationsSentryConsentVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Đóng góp cho Saber?';
	@override late final _TranslationsSentryConsentDescriptionVi description = _TranslationsSentryConsentDescriptionVi._(_root);
	@override late final _TranslationsSentryConsentAnswersVi answers = _TranslationsSentryConsentAnswersVi._(_root);
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesVi extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get general => 'Cài đặt chung';
	@override String get writing => 'Các tính năng vẽ';
	@override String get editor => 'Các tính năng trình ghi chú';
	@override String get performance => 'Hiệu năng';
	@override String get advanced => 'Cài đặt nâng cao';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsVi extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsVi._(TranslationsVi root) : this._root = root, super.internal(root);

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
class _TranslationsSettingsPrefDescriptionsVi extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Tăng khả năng đọc cho người khiếm thị';
	@override String get allowInsecureConnections => '(Không khuyến nghị) Cho phép Saber kết nối với các máy chủ có chứng chỉ tự ký hoặc không đáng tin cậy';
	@override String get preferGreyscale => 'Dành cho màn hình e-ink';
	@override String get autoClearWhiteboardOnExit => 'Xóa bảng vẽ tự do sau khi bạn thoát ứng dụng';
	@override String get disableEraserAfterUse => 'Tự động sử dụng bút vẽ sau khi dùng tẩy';
	@override String get maxImageSize => 'Các hình ảnh lớn hơn sẽ bị nén lại';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingVi hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingVi._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Tắt chế độ vẽ bằng ngón tay khi nhận diện được bút cảm ứng';
	@override String get editorPromptRename => 'Bạn có thể đổi tên ghi chú sau';
	@override String get printPageIndicators => 'Hiển thị chỉ số trang khi xuất tệp';
	@override String get autosave => 'Tự động lưu sau một khoảng thời gian ngắn hoặc không bao giờ';
	@override String get shapeRecognitionDelay => 'Tần suất cập nhật bản xem trước hình dạng';
	@override String get autoStraightenLines => 'Tự động nắn thẳng các đường kẻ dài mà không cần phải sử dụng bút vẽ hình chuyên dụng';
	@override String get simplifiedHomeLayout => 'Thiết lập chiều cao cố định cho mỗi bản xem trước ghi chú';
	@override String get shouldAlwaysAlertForUpdates => 'Thông báo cho tôi về các bản cập nhật mới khi chúng được phát hành';
	@override late final _TranslationsSettingsPrefDescriptionsSentryVi sentry = _TranslationsSettingsPrefDescriptionsSentryVi._(_root);
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesVi extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get system => 'Hệ thống';
	@override String get light => 'Chế độ sáng';
	@override String get dark => 'Chế độ Tối';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesVi extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Tuân theo hệ thống';
	@override String get phone => 'Bố cục điện thoại';
	@override String get tablet => 'Bố cục máy tính bảng';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerVi extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Chọn một màu';
}

// Path: settings.reset
class _TranslationsSettingsResetVi extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Quay về cài đặt mặc định?';
	@override String get button => 'Quay về';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirVi extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Hủy';
	@override String get select => 'Chọn';
	@override String get mustBeEmpty => 'Thư mục được chọn phải là thư mục trống';
	@override String get mustBeDoneSyncing => 'Hãy đảm bảo quá trình đồng bộ đã hoàn tất trước khi thay đổi thư mục';
	@override String get unsupported => 'Tính năng hiện chỉ khả dụng cho nhà phát triển phần mềm. Dùng nó có thể dẫn đến mất mát dữ liệu.';
}

// Path: login.form
class _TranslationsLoginFormVi extends TranslationsLoginFormEn {
	_TranslationsLoginFormVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Bằng việc đăng nhập, bạn đồng ý với '),
		linkToPrivacyPolicy('Privacy Policy'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusVi extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Đăng xuất';
	@override String get tapToLogin => 'Ấn để đăng nhập bằng Nextcloud';
	@override String hi({required Object u}) => 'Xin chào, ${u}!';
	@override String get almostDone => 'Sắp xong rồi, chạm vào màn hình để hoàn tất đăng nhập';
	@override String get loggedIn => 'Đã đăng nhập bằng Nextcloud';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepVi extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'Chọn nơi lưu trữ dữ liệu của bạn:';
	@override String get saberNcServer => 'Máy chủ Nextcloud của Saber';
	@override String get otherNcServer => 'Các máy chủ Nextcloud khác';
	@override String get serverUrl => 'Đường dẫn máy chủ';
	@override String get loginWithSaber => 'Đăng nhập bằng Saber';
	@override String get loginWithNextcloud => 'Đăng nhập bằng Nextcloud';
	@override late final _TranslationsLoginNcLoginStepLoginFlowVi loginFlow = _TranslationsLoginNcLoginStepLoginFlowVi._(_root);
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepVi extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Để bảo vệ dữ liệu của bạn, hãy nhập mật khẩu bạn muốn sử dụng để mã hóa chúng:';
	@override String get newToSaber => 'Người mới tới? Bạn chỉ cần nhập một mật khẩu mã hóa mới.';
	@override String get encPassword => 'Mật khẩu mã hóa';
	@override String get encFaqTitle => 'Các câu hỏi thường gặp';
	@override String get wrongEncPassword => 'Không thể giải mã với khóa mã hóa được cung cấp. Hãy nhập lại.';
	@override String get connectionFailed => 'Đã xảy ra lỗi khi kết nối đến máy chủ. Vui lòng thử lại sau.';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$Vi._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$Vi._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$Vi._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksVi extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Trang chủ';
	@override String get deleteAccount => 'Xóa tài khoản';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$Vi extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$Vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get q => 'Tôi có bị mất ghi chú nếu đăng xuất không?';
	@override String get a => 'Không. Ghi chú của bạn vẫn sẽ được lưu trên cả thiết bị và máy chủ. Tuy nhiên, chúng sẽ không được đồng bộ hóa với máy chủ cho đến khi bạn đăng nhập lại. Hãy đảm bảo quá trình đồng bộ đã hoàn tất trước khi đăng xuất để không bị mất dữ liệu (bạn có thể xem tiến trình đồng bộ tại màn hình chính).';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$Vi extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$Vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get q => 'Làm sao để thay đổi mật khẩu Nextcloud?';
	@override String get a => 'Truy cập vào trang web máy chủ của bạn và đăng nhập. Sau đó, đi tới Cài đặt > Bảo mật > Thay đổi mật khẩu. Bạn sẽ cần phải đăng xuất và đăng nhập lại vào Saber sau khi thay đổi mật khẩu.';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$Vi extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$Vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get q => 'Làm sao để thay đổi mật khẩu mã hóa?';
	@override String get a => '0. Hãy đảm bảo quá trình đồng bộ đã hoàn tất (kiểm tra tiến trình đồng bộ tại màn hình chính).\n1. Đăng xuất khỏi Saber.\n2. Truy cập vào trang web máy chủ của bạn và xóa thư mục \'Saber\'. Thao tác này sẽ xóa tất cả ghi chú của bạn khỏi máy chủ.\n3. Đăng nhập lại vào Saber. Bạn có thể chọn một mật khẩu mã hóa mới khi đăng nhập.\n4. Đừng quên đăng xuất và đăng nhập lại vào Saber trên các thiết bị khác của bạn nữa nhé.';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$Vi extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$Vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get q => 'Làm sao để xóa tài khoản của tôi?';
	@override String get a => 'Nhấn vào "${_root.profile.quickLinks.deleteAccount}" ở trên và đăng nhập nếu được yêu cầu.\nNếu bạn đang sử dụng máy chủ chính thức của Saber, tài khoản của bạn sẽ được xóa sau thời gian chờ 1 tuần. Trong khoảng thời gian này, bạn có thể liên hệ với tôi qua địa chỉ adilhanney@disroot.org để hủy yêu cầu xóa.\nNếu bạn đang sử dụng máy chủ của bên thứ ba, có thể sẽ không có tùy chọn xóa tài khoản: bạn sẽ cần tham khảo chính sách quyền riêng tư của máy chủ đó để biết thêm thông tin.';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarVi extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarVi._(TranslationsVi root) : this._root = root, super.internal(root);

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
class _TranslationsEditorPensVi extends TranslationsEditorPensEn {
	_TranslationsEditorPensVi._(TranslationsVi root) : this._root = root, super.internal(root);

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
class _TranslationsEditorPenOptionsVi extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get size => 'Kích thước';
}

// Path: editor.colors
class _TranslationsEditorColorsVi extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsVi._(TranslationsVi root) : this._root = root, super.internal(root);

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
class _TranslationsEditorImageOptionsVi extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsVi._(TranslationsVi root) : this._root = root, super.internal(root);

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
class _TranslationsEditorSelectionBarVi extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Xóa';
	@override String get duplicate => 'Nhân bản';
}

// Path: editor.menu
class _TranslationsEditorMenuVi extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuVi._(TranslationsVi root) : this._root = root, super.internal(root);

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
	@override late final _TranslationsEditorMenuBoxFitsVi boxFits = _TranslationsEditorMenuBoxFitsVi._(_root);
	@override late final _TranslationsEditorMenuBgPatternsVi bgPatterns = _TranslationsEditorMenuBgPatternsVi._(_root);
}

// Path: editor.readOnlyBanner
class _TranslationsEditorReadOnlyBannerVi extends TranslationsEditorReadOnlyBannerEn {
	_TranslationsEditorReadOnlyBannerVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chỉ đọc';
	@override String get watchingServer => 'Đang theo dõi cập nhật từ máy chủ. Không thể chỉnh sửa lúc này.';
	@override String get corrupted => 'Không thể tải ghi chú. Tệp có thể bị lỗi hoặc vẫn đang được tải xuống.';
}

// Path: editor.versionTooNew
class _TranslationsEditorVersionTooNewVi extends TranslationsEditorVersionTooNewEn {
	_TranslationsEditorVersionTooNewVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ghi chú này đã được chỉnh sửa bằng phiên bản Saber mới hơn';
	@override String get subtitle => 'Chỉnh sửa có thể làm mất dữ liệu. Bạn vẫn muốn tiếp tục?';
	@override String get allowEditing => 'Cho phép chỉnh sửa';
}

// Path: editor.quill
class _TranslationsEditorQuillVi extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Nhập gì đó...';
}

// Path: editor.hud
class _TranslationsEditorHudVi extends TranslationsEditorHudEn {
	_TranslationsEditorHudVi._(TranslationsVi root) : this._root = root, super.internal(root);

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
class _TranslationsSentryConsentDescriptionVi extends TranslationsSentryConsentDescriptionEn {
	_TranslationsSentryConsentDescriptionVi._(TranslationsVi root) : this._root = root, super.internal(root);

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
class _TranslationsSentryConsentAnswersVi extends TranslationsSentryConsentAnswersEn {
	_TranslationsSentryConsentAnswersVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Có';
	@override String get no => 'Không';
	@override String get later => 'Hỏi lại tôi sau';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingVi extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Ngăn chặn việc vô tình bật/tắt';
	@override String get fixedOn => 'Tính năng vẽ bằng ngón tay luôn được tự động bật';
	@override String get fixedOff => 'Tính năng vẽ bằng ngón tay luôn được tự động tắt';
}

// Path: settings.prefDescriptions.sentry
class _TranslationsSettingsPrefDescriptionsSentryVi extends TranslationsSettingsPrefDescriptionsSentryEn {
	_TranslationsSettingsPrefDescriptionsSentryVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get active => 'Đang bật';
	@override String get inactive => 'Đang tắt';
	@override String get activeUntilRestart => 'Tính năng này sẽ được bật cho đến khi bạn khởi động lại ứng dụng';
	@override String get inactiveUntilRestart => 'Tính năng này sẽ được tắt cho đến khi bạn khởi động lại ứng dụng';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowVi extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Vui lòng cho phép Saber truy cập vào tài khoản Nextcloud của bạn';
	@override String get followPrompts => 'Vui lòng làm theo các hướng dẫn trên giao diện Nextcloud';
	@override String get browserDidntOpen => 'Trang đăng nhập không xuất hiện? Hãy ấn vào đây';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$Vi extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$Vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get q => 'Mật khẩu mã hóa là gì? Tại sao lại phải dùng hai mật khẩu?';
	@override String get a => 'Mật khẩu Nextcloud được dùng để truy cập vào lưu trữ đám mây. Còn mật khẩu mã hóa sẽ "trộn lẫn" dữ liệu của bạn trước khi chúng được gửi lên đám mây đó.\nNgay cả khi có ai đó đột nhập được vào tài khoản Nextcloud, các ghi chú của bạn vẫn sẽ an toàn vì đã được mã hóa bằng một mật khẩu riêng biệt. Điều này tạo ra một lớp bảo mật thứ hai để bảo vệ dữ liệu của bạn.\nKhông ai có thể xem ghi chú trên máy chủ nếu không có mật khẩu mã hóa. Tuy nhiên, điều này cũng đồng nghĩa với việc nếu bạn quên mật khẩu mã hóa, bạn sẽ mất quyền truy cập vào dữ liệu của chính mình.';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$Vi extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$Vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get q => 'Tôi chưa thiết lập mật khẩu mã hóa. Tôi có thể tạo nó ở đâu?';
	@override String get a => 'Hãy chọn một mật khẩu mã hóa mới và nhập vào ô bên trên.\nSaber sẽ tự động tạo các khóa mã hóa cho bạn từ mật khẩu này.';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$Vi extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$Vi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get q => 'Tôi có thể dùng cùng một mật khẩu với tài khoản Nextcloud không?';
	@override String get a => 'Được, nhưng hãy lưu ý rằng quản trị viên hoặc bất kỳ ai khác sẽ dễ dàng truy cập vào ghi chú của bạn hơn nếu họ chiếm được quyền truy cập vào tài khoản Nextcloud.';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsVi extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Dãn';
	@override String get cover => 'Phủ';
	@override String get contain => 'Chứa';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsVi extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsVi._(TranslationsVi root) : this._root = root, super.internal(root);

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
