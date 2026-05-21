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
class TranslationsUk extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsUk({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.uk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <uk>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsUk _root = this; // ignore: unused_field

	@override 
	TranslationsUk $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsUk(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonUk common = _TranslationsCommonUk._(_root);
	@override late final _TranslationsHomeUk home = _TranslationsHomeUk._(_root);
	@override late final _TranslationsSentryUk sentry = _TranslationsSentryUk._(_root);
	@override late final _TranslationsSettingsUk settings = _TranslationsSettingsUk._(_root);
	@override late final _TranslationsLogsUk logs = _TranslationsLogsUk._(_root);
	@override late final _TranslationsLoginUk login = _TranslationsLoginUk._(_root);
	@override late final _TranslationsProfileUk profile = _TranslationsProfileUk._(_root);
	@override late final _TranslationsAppInfoUk appInfo = _TranslationsAppInfoUk._(_root);
	@override late final _TranslationsUpdateUk update = _TranslationsUpdateUk._(_root);
	@override late final _TranslationsEditorUk editor = _TranslationsEditorUk._(_root);
}

// Path: common
class _TranslationsCommonUk extends TranslationsCommonEn {
	_TranslationsCommonUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get done => 'Готово';
	@override String get continueBtn => 'Продовжити';
	@override String get cancel => 'Скасувати';
}

// Path: home
class _TranslationsHomeUk extends TranslationsHomeEn {
	_TranslationsHomeUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsUk tabs = _TranslationsHomeTabsUk._(_root);
	@override late final _TranslationsHomeTitlesUk titles = _TranslationsHomeTitlesUk._(_root);
	@override late final _TranslationsHomeTooltipsUk tooltips = _TranslationsHomeTooltipsUk._(_root);
	@override late final _TranslationsHomeCreateUk create = _TranslationsHomeCreateUk._(_root);
	@override late final _TranslationsHomeNewFolderUk newFolder = _TranslationsHomeNewFolderUk._(_root);
	@override late final _TranslationsHomeRenameNoteUk renameNote = _TranslationsHomeRenameNoteUk._(_root);
	@override late final _TranslationsHomeMoveNoteUk moveNote = _TranslationsHomeMoveNoteUk._(_root);
	@override late final _TranslationsHomeDeleteNoteDialogUk deleteNoteDialog = _TranslationsHomeDeleteNoteDialogUk._(_root);
	@override late final _TranslationsHomeRenameFolderUk renameFolder = _TranslationsHomeRenameFolderUk._(_root);
	@override late final _TranslationsHomeDeleteFolderUk deleteFolder = _TranslationsHomeDeleteFolderUk._(_root);
	@override String get welcome => 'Ласкаво просимо до Saber';
	@override String get invalidFormat => 'Обраний файл не підтримується. Будь ласка, виберіть файл sbn, sbn2, sba або pdf.';
	@override String get noFiles => 'Не знайдено файлів';
	@override String get noPreviewAvailable => 'Немає попереднього перегляду';
	@override String get createNewNote => 'Натисніть кнопку + для створення нової нотатки';
	@override String get backFolder => 'Повернутися до попередньої папки';
	@override String get deleteNote => 'Видалити нотатку';
}

// Path: sentry
class _TranslationsSentryUk extends TranslationsSentryEn {
	_TranslationsSentryUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSentryConsentUk consent = _TranslationsSentryConsentUk._(_root);
}

// Path: settings
class _TranslationsSettingsUk extends TranslationsSettingsEn {
	_TranslationsSettingsUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesUk prefCategories = _TranslationsSettingsPrefCategoriesUk._(_root);
	@override late final _TranslationsSettingsPrefLabelsUk prefLabels = _TranslationsSettingsPrefLabelsUk._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsUk prefDescriptions = _TranslationsSettingsPrefDescriptionsUk._(_root);
	@override late final _TranslationsSettingsThemeModesUk themeModes = _TranslationsSettingsThemeModesUk._(_root);
	@override late final _TranslationsSettingsLayoutSizesUk layoutSizes = _TranslationsSettingsLayoutSizesUk._(_root);
	@override late final _TranslationsSettingsAccentColorPickerUk accentColorPicker = _TranslationsSettingsAccentColorPickerUk._(_root);
	@override late final _TranslationsSettingsResetUk reset = _TranslationsSettingsResetUk._(_root);
	@override late final _TranslationsSettingsCustomDataDirUk customDataDir = _TranslationsSettingsCustomDataDirUk._(_root);
	@override String get systemLanguage => 'Авто';
	@override String get resyncEverything => 'Пересинхронізувати все';
	@override String get openDataDir => 'Відкрити папку Saber';
	@override String get autosaveDisabled => 'Ніколи';
	@override String get shapeRecognitionDisabled => 'Ніколи';
	@override List<String> get axisDirections => [
		'Верх',
		'Так',
		'Низ',
		'Ліворуч',
	];
}

// Path: logs
class _TranslationsLogsUk extends TranslationsLogsEn {
	_TranslationsLogsUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Журнали';
	@override String get viewLogs => 'Переглянути журнали';
	@override String get debuggingInfo => 'Журнали містять інформацію, корисну для налагодження та розробки';
	@override String get noLogs => 'Тут немає журналів!';
	@override String get useTheApp => 'Журнали з\'являться тут, коли ви користуєтеся додатком';
}

// Path: login
class _TranslationsLoginUk extends TranslationsLoginEn {
	_TranslationsLoginUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsLoginFormUk form = _TranslationsLoginFormUk._(_root);
	@override late final _TranslationsLoginStatusUk status = _TranslationsLoginStatusUk._(_root);
	@override late final _TranslationsLoginNcLoginStepUk ncLoginStep = _TranslationsLoginNcLoginStepUk._(_root);
	@override late final _TranslationsLoginEncLoginStepUk encLoginStep = _TranslationsLoginEncLoginStepUk._(_root);
	@override String get title => 'Увійти';
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Тисні немає ще? '),
		linkToSignup('Зареєструватися зараз'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'Не ти? '),
		undoLogin('Вибрати інший обліковий запис'),
		const TextSpan(text: '.'),
	]);
}

// Path: profile
class _TranslationsProfileUk extends TranslationsProfileEn {
	_TranslationsProfileUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsProfileQuickLinksUk quickLinks = _TranslationsProfileQuickLinksUk._(_root);
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$Uk._(_root),
		_TranslationsProfile$faq$0i1$Uk._(_root),
		_TranslationsProfile$faq$0i2$Uk._(_root),
		_TranslationsProfile$faq$0i3$Uk._(_root),
	];
	@override String get title => 'Мій профіль';
	@override String get logout => 'Вийти';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Ви використовуєте ${used} з ${total} (${percent}%)';
	@override String get connectedTo => 'Підключено до';
	@override String get faqTitle => 'Часті запитання';
}

// Path: appInfo
class _TranslationsAppInfoUk extends TranslationsAppInfoEn {
	_TranslationsAppInfoUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber Авторські права © 2022-${buildYear} Adil Hanney\nЦя програма не має жодної гарантії. Це безкоштовне програмне забезпечення, і ви маєте право поширювати його за певних умов.';
	@override String get debug => 'ВІДЛАДКА';
	@override String get sponsorButton => 'Натисніть сюди, щоб мене спонсорувати або купити більше сховища';
	@override String get licenseButton => 'Натисніть сюди, щоб переглянути більше інформації про ліцензію';
	@override String get privacyPolicyButton => 'Натисніть сюди, щоб переглянути політику конфіденційності';
}

// Path: update
class _TranslationsUpdateUk extends TranslationsUpdateEn {
	_TranslationsUpdateUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Оновлено доступно';
	@override String get updateAvailableDescription => 'Доступна нова версія програми:';
	@override String get update => 'Оновлення';
	@override String get downloadNotAvailableYet => 'Завантаження ще недоступне для вашої платформи. Будь ласка, перевірте пізніше.';
}

// Path: editor
class _TranslationsEditorUk extends TranslationsEditorEn {
	_TranslationsEditorUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarUk toolbar = _TranslationsEditorToolbarUk._(_root);
	@override late final _TranslationsEditorPensUk pens = _TranslationsEditorPensUk._(_root);
	@override late final _TranslationsEditorPenOptionsUk penOptions = _TranslationsEditorPenOptionsUk._(_root);
	@override late final _TranslationsEditorColorsUk colors = _TranslationsEditorColorsUk._(_root);
	@override late final _TranslationsEditorImageOptionsUk imageOptions = _TranslationsEditorImageOptionsUk._(_root);
	@override late final _TranslationsEditorSelectionBarUk selectionBar = _TranslationsEditorSelectionBarUk._(_root);
	@override late final _TranslationsEditorMenuUk menu = _TranslationsEditorMenuUk._(_root);
	@override late final _TranslationsEditorReadOnlyBannerUk readOnlyBanner = _TranslationsEditorReadOnlyBannerUk._(_root);
	@override late final _TranslationsEditorVersionTooNewUk versionTooNew = _TranslationsEditorVersionTooNewUk._(_root);
	@override late final _TranslationsEditorQuillUk quill = _TranslationsEditorQuillUk._(_root);
	@override late final _TranslationsEditorHudUk hud = _TranslationsEditorHudUk._(_root);
	@override String get pages => 'Сторінки';
	@override String get untitled => 'Без назви';
	@override String get needsToSaveBeforeExiting => 'Збереження ваших змін... Ви можете безпечно вийти з редактора, коли він закінчиться';
}

// Path: home.tabs
class _TranslationsHomeTabsUk extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get home => 'Головна';
	@override String get browse => 'Переглянути';
	@override String get whiteboard => 'Біла дошка';
	@override String get settings => 'Налаштування';
}

// Path: home.titles
class _TranslationsHomeTitlesUk extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get home => 'Недавні нотатки';
	@override String get browse => 'Переглянути';
	@override String get whiteboard => 'Біла дошка';
	@override String get settings => 'Налаштування';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsUk extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get exportNote => 'Експортувати нотатку';
	@override String get newNote => 'Нотатка';
	@override String get showUpdateDialog => 'Показати діалогове вікно оновлення';
}

// Path: home.create
class _TranslationsHomeCreateUk extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Нотатка';
	@override String get importNote => 'Примітка імпорту';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderUk extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Нова папка';
	@override String get folderName => 'Назва папки';
	@override String get create => 'Створити';
	@override String get folderNameEmpty => 'Назва папки не може бути порожньою';
	@override String get folderNameContainsSlash => 'Ім\'я папки не може містити слеш';
	@override String get folderNameExists => 'Папка вже існує';
}

// Path: home.renameNote
class _TranslationsHomeRenameNoteUk extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Перейменувати нотатку';
	@override String get noteName => 'Примітка імені';
	@override String get rename => 'Перейменувати';
	@override String get noteNameEmpty => 'Ім\'я не може бути порожнім';
	@override String get noteNameExists => 'Примітка з цим ім\'ям вже існує';
	@override String get noteNameForbiddenCharacters => 'Ім\'я містить заборонені символи';
	@override String get noteNameReserved => 'Ім\'я зарезервовано';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteUk extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Перемістити нотатку';
	@override String moveNotes({required Object n}) => 'Перемістити ${n}\$ нотаток';
	@override String moveName({required Object f}) => 'Перемістити ${f}';
	@override String get move => 'Рухайся';
	@override String renamedTo({required Object newName}) => 'Нота буде перейменована на ${newName}';
	@override String get multipleRenamedTo => 'Наступні нотатки будуть перейменовані:';
	@override String numberRenamedTo({required Object n}) => '${n} нотаток будуть перейменовані для уникнення конфліктів';
}

// Path: home.deleteNoteDialog
class _TranslationsHomeDeleteNoteDialogUk extends TranslationsHomeDeleteNoteDialogEn {
	_TranslationsHomeDeleteNoteDialogUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(n,
		one: 'Постійно видалити вибрану нотатку?',
		other: 'Постійно видалити вибрані нотатки?',
	);
	@override String deleteNotes({required Object n}) => 'Видалити ${n}\$ нотаток';
	@override String deleteName({required Object f}) => 'Видалити ${f}';
	@override String get delete => 'Видалити';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderUk extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Перейменувати папку';
	@override String get folderName => 'Назва папки';
	@override String get rename => 'Перейменувати';
	@override String get folderNameEmpty => 'Назва папки не може бути порожньою';
	@override String get folderNameContainsSlash => 'Ім\'я папки не може містити слеш';
	@override String get folderNameExists => 'Папка з цією назвою вже існує';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderUk extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Видалити папку';
	@override String deleteName({required Object f}) => 'Видалити ${f}';
	@override String get delete => 'Видалити';
	@override String get alsoDeleteContents => 'Також видаліть усі нотатки в цій папці';
}

// Path: sentry.consent
class _TranslationsSentryConsentUk extends TranslationsSentryConsentEn {
	_TranslationsSentryConsentUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSentryConsentDescriptionUk description = _TranslationsSentryConsentDescriptionUk._(_root);
	@override late final _TranslationsSentryConsentAnswersUk answers = _TranslationsSentryConsentAnswersUk._(_root);
	@override String get title => 'Допоможіть покращити Saber?';
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesUk extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get general => 'Загальне';
	@override String get writing => 'Писати';
	@override String get editor => 'Редактор';
	@override String get performance => 'Продуктивність';
	@override String get advanced => 'Розширений';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsUk extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Мова';
	@override String get appTheme => 'Тема програми';
	@override String get platform => 'Тип теми';
	@override String get layoutSize => 'Тип макета';
	@override String get customAccentColor => 'Кольоровий акцент';
	@override String get hyperlegibleFont => 'шрифт Atkinson Hyperlegible';
	@override String get shouldCheckForUpdates => 'Перевірити оновлення Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Швидші оновлення';
	@override String get allowInsecureConnections => 'Дозволити незахоплені з\'єднання';
	@override String get editorToolbarAlignment => 'Позиція панелі інструментів';
	@override String get editorToolbarShowInFullscreen => 'Покажіть панель інструментів у повноекранному режимі';
	@override String get editorAutoInvert => 'Інвертувати нотації у темному режимі';
	@override String get preferGreyscale => 'Переваблюйте відтінки сірого';
	@override String get maxImageSize => 'Максимальний розмір зображення';
	@override String get autoClearWhiteboardOnExit => 'Автоматично очистити дошку';
	@override String get disableEraserAfterUse => 'Автоматично вимкнути ластик';
	@override String get hideFingerDrawingToggle => 'Сховати перемикач малювання пальцем';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Автоматичне вимкнення малювання пальцем';
	@override String get editorPromptRename => 'Запит на перейменування нових нотаток';
	@override String get recentColorsDontSavePresets => 'Не зберігайте попередні кольори в нещодавніх кольорах';
	@override String get recentColorsLength => 'Скільки нещодавніх кольорів зберігати';
	@override String get printPageIndicators => 'Вивести індикатори сторінки';
	@override String get autosave => 'Автозбереження';
	@override String get shapeRecognitionDelay => 'Затримка розпізнавання форми';
	@override String get autoStraightenLines => 'Автоматично вирівнювати лінії';
	@override String get simplifiedHomeLayout => 'Спрощений план дому';
	@override String get customDataDir => 'Кастомна папка Saber';
	@override String get sentry => 'Повідомлення про помилку';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsUk extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingUk hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingUk._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsSentryUk sentry = _TranslationsSettingsPrefDescriptionsSentryUk._(_root);
	@override String get hyperlegibleFont => 'Покращує читабельність для користувачів з низьким зором';
	@override String get allowInsecureConnections => '(Не рекомендовано) Дозволити Saber підключатися до серверів з самопідписаними/недовіреними сертифікатами';
	@override String get preferGreyscale => 'Для е-чманітерів';
	@override String get autoClearWhiteboardOnExit => 'Очищує дошку після виходу з програми';
	@override String get disableEraserAfterUse => 'Автоматично повертається до ручки після використання гумки.';
	@override String get maxImageSize => 'Більші зображення будуть стиснуті';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Вимкнути малювання пальцем, коли виявлено стилус';
	@override String get editorPromptRename => 'Ви завжди можете перейменувати нотатки пізніше';
	@override String get printPageIndicators => 'Покажіть індикатори сторінок у експортах';
	@override String get autosave => 'Автозбереження після короткої затримки, або ніколи';
	@override String get shapeRecognitionDelay => 'Як часто оновлювати попередній перегляд форми?';
	@override String get autoStraightenLines => 'Вирівнює довгі лінії без необхідності використовувати штамп';
	@override String get simplifiedHomeLayout => 'Встановлює фіксовану висоту для попереднього перегляду кожної ноти';
	@override String get shouldAlwaysAlertForUpdates => 'Повідомляйте мені про оновлення, як тільки вони будуть доступні.';
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesUk extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get system => 'Система';
	@override String get light => 'Світло';
	@override String get dark => 'Темний';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesUk extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Авто';
	@override String get phone => 'Телефон';
	@override String get tablet => 'Планшет';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerUk extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Вибери колір';
}

// Path: settings.reset
class _TranslationsSettingsResetUk extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Скинути налаштування?';
	@override String get button => 'Скинути';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirUk extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Скасувати';
	@override String get select => 'Виберіть';
	@override String get mustBeEmpty => 'Обрана папка має бути порожньою';
	@override String get mustBeDoneSyncing => 'Переконайтеся, що синхронізація завершена перед зміною папки';
	@override String get unsupported => 'Ця функція наразі доступна лише розробникам. Використання її може призвести до втрати даних.';
}

// Path: login.form
class _TranslationsLoginFormUk extends TranslationsLoginFormEn {
	_TranslationsLoginFormUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Увійшовши в систему, ви погоджуєтеся з '),
		linkToPrivacyPolicy('Політика конфіденційності'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusUk extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Вийшов з системи';
	@override String get tapToLogin => 'Натисніть для входу через Nextcloud';
	@override String hi({required Object u}) => 'Привіт, ${u}!';
	@override String get almostDone => 'Майже готово до синхронізації, натисніть, щоб завершити вхід';
	@override String get loggedIn => 'Увійшов через Nextcloud';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepUk extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsLoginNcLoginStepLoginFlowUk loginFlow = _TranslationsLoginNcLoginStepLoginFlowUk._(_root);
	@override String get whereToStoreData => 'Оберіть, де ви хочете зберігати ваші дані:';
	@override String get saberNcServer => 'Сервер Nextcloud Saber';
	@override String get otherNcServer => 'Інший сервер Nextcloud';
	@override String get serverUrl => 'URL сервера';
	@override String get loginWithSaber => 'Увійти через Saber';
	@override String get loginWithNextcloud => 'Увійти через Nextcloud';
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepUk extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$Uk._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$Uk._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$Uk._(_root),
	];
	@override String get enterEncPassword => 'Для захисту ваших даних, будь ласка, введіть ваш пароль шифрування:';
	@override String get newToSaber => 'Нова у Saber? Просто введіть новий пароль шифрування.';
	@override String get encPassword => 'Пароль шифрування';
	@override String get encFaqTitle => 'Часті запитання';
	@override String get wrongEncPassword => 'Дешифрування не вдалося з наданим паролем. Будь ласка, спробуйте ввести його ще раз.';
	@override String get connectionFailed => 'Щось пішло не так при підключенні до сервера. Будь ласка, спробуйте пізніше.';
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksUk extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Головна сторінка сервера';
	@override String get deleteAccount => 'Видалити обліковий запис';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$Uk extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$Uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get q => 'Чи втрачу я свої нотатки, якщо вийду з системи?';
	@override String get a => 'Ваші нотатки залишаться як на вашому пристрої, так і на сервері. Вони не будуть синхронізовані з сервером доти, доки ви не увійдете знову. Переконайтеся, що синхронізація завершена перед виходом (подивіться на прогрес синхронізації на головному екрані), щоб не втратити жодних даних.';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$Uk extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$Uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get q => 'Як змінити пароль у Nextcloud?';
	@override String get a => 'Перейдіть на вебсайт вашого сервера та увійдіть. Потім перейдіть до Налаштування > Безпека > Змінити пароль. Вам потрібно буде вийти та увійти назад до Saber після зміни пароля.';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$Uk extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$Uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get q => 'Як змінити пароль шифрування?';
	@override String get a => '0. Переконайтеся, що синхронізація завершена (подивіться на прогрес синхронізації на головному екрані).\n1. Вийдіть з облікового запису Saber.\n2. Перейдіть на вебсайт вашого сервера та видаліть папку \'Saber\'. Це видалить усі ваші нотатки з сервера.\n3. Увійдіть назад у Saber. Ви можете вибрати новий пароль шифрування при вході.\n4. Не забудьте вийти та увійти назад у Saber на інших пристроях також.';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$Uk extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$Uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get q => 'Як я можу видалити свій обліковий запис?';
	@override String get a => 'Натисніть на кнопку "${_root.profile.quickLinks.deleteAccount}" вище та увійдіть у систему, якщо потрібно.\nЯкщо ви використовуєте офіційний сервер Saber, ваш обліковий запис буде видалено після 1 тижневого періоду графіка. Ви можете зв\'язатися зі мною за адресою adilhanney@disroot.org протягом цього періоду, щоб скасувати видалення.\nЯкщо ви використовуєте сторонній сервер, у вас може не бути опції видалення вашого облікового запису: вам потрібно буде ознайомитися з політикою конфіденційності сервера для отримання додаткової інформації.';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarUk extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Переключити кольори (Ctrl C)';
	@override String get select => 'Виберіть';
	@override String get toggleEraser => 'Перемкнути ластик (Ctrl E)';
	@override String get photo => 'Зображення';
	@override String get text => 'Текст';
	@override String get toggleFingerDrawing => 'Перемикання малювання пальцем (Ctrl F)';
	@override String get undo => 'Скасувати';
	@override String get redo => 'Переробити';
	@override String get export => 'Експорт (Ctrl Shift S)';
	@override String get exportAs => 'Експортувати як:';
	@override String get fullscreen => 'Переключити повное екрану (F11)';
}

// Path: editor.pens
class _TranslationsEditorPensUk extends TranslationsEditorPensEn {
	_TranslationsEditorPensUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Перчинковий ручка';
	@override String get ballpointPen => 'Ручка-боргер';
	@override String get highlighter => 'Підсвічувач';
	@override String get pencil => 'Олівець';
	@override String get shapePen => 'Форма ручки';
	@override String get laserPointer => 'Лазерна указка';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsUk extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get size => 'Розмір';
}

// Path: editor.colors
class _TranslationsEditorColorsUk extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Вибір кольору';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Спеціальні ${b} ${h}';
	@override String customHue({required Object h}) => 'Спеціальний ${h}';
	@override String get dark => 'темно';
	@override String get light => 'світло';
	@override String get black => 'Чорний';
	@override String get darkGrey => 'Темно-сірий';
	@override String get grey => 'Сірий';
	@override String get lightGrey => 'Світло-сірий';
	@override String get white => 'Білий';
	@override String get red => 'Червоний';
	@override String get green => 'Зелений';
	@override String get cyan => 'Циан';
	@override String get blue => 'Синій';
	@override String get yellow => 'Жовтий';
	@override String get purple => 'пурпуровий';
	@override String get pink => 'Рожевий';
	@override String get orange => 'Помаранчевий';
	@override String get pastelRed => 'пастельно-червоний';
	@override String get pastelOrange => 'пастерова помаранчева';
	@override String get pastelYellow => 'Пастельно-жовтий';
	@override String get pastelGreen => 'пастельно-зелений';
	@override String get pastelCyan => 'Пастельно-блакитний';
	@override String get pastelBlue => 'блакитний пастель';
	@override String get pastelPurple => 'пастельно-фіолетовий';
	@override String get pastelPink => 'Пастельно рожевий';
}

// Path: editor.imageOptions
class _TranslationsEditorImageOptionsUk extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Варіанти зображень';
	@override String get invertible => 'Обернений';
	@override String get download => 'Завантажити';
	@override String get setAsBackground => 'Встановити як фон';
	@override String get removeAsBackground => 'Видалити як фон';
	@override String get delete => 'Видалити';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarUk extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Видалити';
	@override String get duplicate => 'Дублікат';
}

// Path: editor.menu
class _TranslationsEditorMenuUk extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorMenuBoxFitsUk boxFits = _TranslationsEditorMenuBoxFitsUk._(_root);
	@override late final _TranslationsEditorMenuBgPatternsUk bgPatterns = _TranslationsEditorMenuBgPatternsUk._(_root);
	@override String clearPage({required Object page, required Object totalPages}) => 'Очистити сторінку ${page}/${totalPages}';
	@override String get clearAllPages => 'Очистити всі сторінки';
	@override String get insertPage => 'Вставити сторінку нижче';
	@override String get duplicatePage => 'Дублююча сторінка';
	@override String get deletePage => 'Видалити сторінку';
	@override String get lineHeight => 'Висота рядка';
	@override String get lineHeightDescription => 'Також контролює розмір тексту для набраних нотаток';
	@override String get lineThickness => 'Товщина лінії';
	@override String get lineThicknessDescription => 'товщина фонового рядка';
	@override String get backgroundImageFit => 'Фон зображення підходить';
	@override String get backgroundPattern => 'Фонова візерунок';
	@override String get import => 'Імпорт';
	@override String get watchServer => 'Слідкуйте за оновленнями на сервері';
	@override String get watchServerReadOnly => 'Редагування вимкнено під час перегляду сервера';
}

// Path: editor.readOnlyBanner
class _TranslationsEditorReadOnlyBannerUk extends TranslationsEditorReadOnlyBannerEn {
	_TranslationsEditorReadOnlyBannerUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Режим лише читання';
	@override String get watchingServer => 'Ви наразі стежите за оновленнями на сервері. Редагування вимкнено в цьому режимі.';
	@override String get corrupted => 'Не вдалося завантажити нотатку. Вона може бути пошкоджена або все ще завантажується.';
}

// Path: editor.versionTooNew
class _TranslationsEditorVersionTooNewUk extends TranslationsEditorVersionTooNewEn {
	_TranslationsEditorVersionTooNewUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ця нота була відредагована за допомогою новішої версії Saber';
	@override String get subtitle => 'Редагування цієї нотатки може призвести до втрати деякої інформації. Ви хочете проігнорувати це та редагувати все одно?';
	@override String get allowEditing => 'Дозволити редагування';
}

// Path: editor.quill
class _TranslationsEditorQuillUk extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Напишіть щось тут...';
}

// Path: editor.hud
class _TranslationsEditorHudUk extends TranslationsEditorHudEn {
	_TranslationsEditorHudUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Розблокувати зум';
	@override String get lockZoom => 'Заблокувати зум';
	@override String get unlockSingleFingerPan => 'Увімкнути панораму одним пальцем';
	@override String get lockSingleFingerPan => 'Вимкнути панораму одним пальцем';
	@override String get unlockAxisAlignedPan => 'Розблокувати панораму на горизонтальну або вертикальну';
	@override String get lockAxisAlignedPan => 'Блокувати панораму на горизонтальну або вертикальну';
}

// Path: sentry.consent.description
class _TranslationsSentryConsentDescriptionUk extends TranslationsSentryConsentDescriptionEn {
	_TranslationsSentryConsentDescriptionUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get question => 'Чи бажаєте ви автоматично повідомляти про несподівані помилки? Це допомагає мені швидше виявляти та виправляти проблеми.';
	@override String get scope => 'Звіти можуть містити інформацію про помилку та ваше пристрій. Я доклав усіх зусиль, щоб відфільтрувати особисті дані, але деякі можуть залишитися.';
	@override String get currentlyOff => 'Якщо ви надасте згоду, звіт про помилки буде увімкнено після перезапуску програми.';
	@override String get currentlyOn => 'Якщо ви відкликаєте згоду, будь ласка, перезапустіть додаток, щоб вимкнути повідомлення про помилки.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Дізнатися більше у '),
		link('політику конфіденційності'),
		const TextSpan(text: '.'),
	]);
}

// Path: sentry.consent.answers
class _TranslationsSentryConsentAnswersUk extends TranslationsSentryConsentAnswersEn {
	_TranslationsSentryConsentAnswersUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Так';
	@override String get no => 'Ні';
	@override String get later => 'Запитайте мене пізніше';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingUk extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Запобігає випадковому перемиканню';
	@override String get fixedOn => 'Малювання пальців встановлено як увімкнене';
	@override String get fixedOff => 'Малювання пальців закріплено як вимкнене';
}

// Path: settings.prefDescriptions.sentry
class _TranslationsSettingsPrefDescriptionsSentryUk extends TranslationsSettingsPrefDescriptionsSentryEn {
	_TranslationsSettingsPrefDescriptionsSentryUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get active => 'Активний';
	@override String get inactive => 'Неактивний';
	@override String get activeUntilRestart => 'Активно до перезапуску програми';
	@override String get inactiveUntilRestart => 'Неактивно до перезапуску програми';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowUk extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Будь ласка, авторизуйте Saber для доступу до вашого облікового запису Nextcloud';
	@override String get followPrompts => 'Будь ласка, дотримуйтесь інструкцій у інтерфейсі Nextcloud';
	@override String get browserDidntOpen => 'Сторінка входу не відкрилася? Натисніть сюди';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$Uk extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$Uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get q => 'Що таке пароль шифрування? Чому використовувати два паролі?';
	@override String get a => 'Пароль Nextcloud використовується для доступу до хмари. Пароль шифрування "scrambles" заплутує ваші дані ще до того, як вони потраплять у хмару.\nНавіть якщо хтось отримає доступ до вашого облікового запису Nextcloud, ваші нотатки залишаться в безпеці та зашифровані окремим паролем. Це забезпечує вам другий рівень безпеки для захисту ваших даних.\nНіхто не може отримати доступ до ваших нотаток на сервері без вашого пароля шифрування, але це також означає, що якщо ви забудете свій пароль шифрування, ви втратите доступ до ваших даних.';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$Uk extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$Uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get q => 'Я ще не встановлював пароль шифрування. Де я його отримаю?';
	@override String get a => 'Оберіть новий пароль шифрування та введіть його вище.\nSaber автоматично згенерує ваші ключі шифрування з цього пароля.';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$Uk extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$Uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get q => 'Чи можу я використовувати той самий пароль для свого облікового запису Nextcloud?';
	@override String get a => 'Так, але пам\'ятайте, що буде легше для адміністратора сервера або когось іншого отримати доступ до ваших нотаток, якщо вони отримають доступ до вашого облікового запису Nextcloud.';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsUk extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Розтягнути';
	@override String get cover => 'Покриття';
	@override String get contain => 'Містити';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsUk extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get none => 'Порожньо';
	@override String get college => 'школа з лініями';
	@override String get collegeRtl => 'Школьне правило (Зворотне)';
	@override String get lined => 'Лінія';
	@override String get grid => 'Сітка';
	@override String get dots => 'Крапки';
	@override String get staffs => 'Співробітники';
	@override String get tablature => 'Табулатура';
	@override String get cornell => 'Корнелл';
}
