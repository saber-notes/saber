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
	@override late final _Translations$common$uk common = _Translations$common$uk._(_root);
	@override late final _Translations$home$uk home = _Translations$home$uk._(_root);
	@override late final _Translations$sentry$uk sentry = _Translations$sentry$uk._(_root);
	@override late final _Translations$settings$uk settings = _Translations$settings$uk._(_root);
	@override late final _Translations$logs$uk logs = _Translations$logs$uk._(_root);
	@override late final _Translations$login$uk login = _Translations$login$uk._(_root);
	@override late final _Translations$profile$uk profile = _Translations$profile$uk._(_root);
	@override late final _Translations$appInfo$uk appInfo = _Translations$appInfo$uk._(_root);
	@override late final _Translations$update$uk update = _Translations$update$uk._(_root);
	@override late final _Translations$editor$uk editor = _Translations$editor$uk._(_root);
}

// Path: common
class _Translations$common$uk extends Translations$common$en {
	_Translations$common$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get done => 'Готово';
	@override String get continueBtn => 'Продовжити';
	@override String get cancel => 'Скасувати';
}

// Path: home
class _Translations$home$uk extends Translations$home$en {
	_Translations$home$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$uk tabs = _Translations$home$tabs$uk._(_root);
	@override late final _Translations$home$titles$uk titles = _Translations$home$titles$uk._(_root);
	@override late final _Translations$home$tooltips$uk tooltips = _Translations$home$tooltips$uk._(_root);
	@override late final _Translations$home$create$uk create = _Translations$home$create$uk._(_root);
	@override late final _Translations$home$newFolder$uk newFolder = _Translations$home$newFolder$uk._(_root);
	@override late final _Translations$home$renameNote$uk renameNote = _Translations$home$renameNote$uk._(_root);
	@override late final _Translations$home$moveNote$uk moveNote = _Translations$home$moveNote$uk._(_root);
	@override late final _Translations$home$deleteNoteDialog$uk deleteNoteDialog = _Translations$home$deleteNoteDialog$uk._(_root);
	@override late final _Translations$home$renameFolder$uk renameFolder = _Translations$home$renameFolder$uk._(_root);
	@override late final _Translations$home$deleteFolder$uk deleteFolder = _Translations$home$deleteFolder$uk._(_root);
	@override late final _Translations$home$sort$uk sort = _Translations$home$sort$uk._(_root);
	@override late final _Translations$home$layout$uk layout = _Translations$home$layout$uk._(_root);
	@override String get welcome => 'Ласкаво просимо до Saber';
	@override String get invalidFormat => 'Обраний файл не підтримується. Будь ласка, виберіть файл sbn, sbn2, sba або pdf.';
	@override String get noFiles => 'Не знайдено файлів';
	@override String get noPreviewAvailable => 'Немає попереднього перегляду';
	@override String get createNewNote => 'Натисніть кнопку + для створення нової нотатки';
	@override String get backFolder => 'Повернутися до попередньої папки';
	@override String get deleteNote => 'Видалити нотатку';
}

// Path: sentry
class _Translations$sentry$uk extends Translations$sentry$en {
	_Translations$sentry$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$uk consent = _Translations$sentry$consent$uk._(_root);
}

// Path: settings
class _Translations$settings$uk extends Translations$settings$en {
	_Translations$settings$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$uk prefCategories = _Translations$settings$prefCategories$uk._(_root);
	@override late final _Translations$settings$prefLabels$uk prefLabels = _Translations$settings$prefLabels$uk._(_root);
	@override late final _Translations$settings$prefDescriptions$uk prefDescriptions = _Translations$settings$prefDescriptions$uk._(_root);
	@override late final _Translations$settings$themeModes$uk themeModes = _Translations$settings$themeModes$uk._(_root);
	@override late final _Translations$settings$layoutSizes$uk layoutSizes = _Translations$settings$layoutSizes$uk._(_root);
	@override late final _Translations$settings$accentColorPicker$uk accentColorPicker = _Translations$settings$accentColorPicker$uk._(_root);
	@override late final _Translations$settings$reset$uk reset = _Translations$settings$reset$uk._(_root);
	@override late final _Translations$settings$customDataDir$uk customDataDir = _Translations$settings$customDataDir$uk._(_root);
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
class _Translations$logs$uk extends Translations$logs$en {
	_Translations$logs$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Журнали';
	@override String get viewLogs => 'Переглянути журнали';
	@override String get debuggingInfo => 'Журнали містять інформацію, корисну для налагодження та розробки';
	@override String get noLogs => 'Тут немає журналів!';
	@override String get useTheApp => 'Журнали з\'являться тут, коли ви користуєтеся додатком';
}

// Path: login
class _Translations$login$uk extends Translations$login$en {
	_Translations$login$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _Translations$login$form$uk form = _Translations$login$form$uk._(_root);
	@override late final _Translations$login$status$uk status = _Translations$login$status$uk._(_root);
	@override late final _Translations$login$ncLoginStep$uk ncLoginStep = _Translations$login$ncLoginStep$uk._(_root);
	@override late final _Translations$login$encLoginStep$uk encLoginStep = _Translations$login$encLoginStep$uk._(_root);
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
class _Translations$profile$uk extends Translations$profile$en {
	_Translations$profile$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _Translations$profile$quickLinks$uk quickLinks = _Translations$profile$quickLinks$uk._(_root);
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$uk._(_root),
		_Translations$profile$faq$1$uk._(_root),
		_Translations$profile$faq$2$uk._(_root),
		_Translations$profile$faq$3$uk._(_root),
	];
	@override String get title => 'Мій профіль';
	@override String get logout => 'Вийти';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Ви використовуєте ${used} з ${total} (${percent}%)';
	@override String get connectedTo => 'Підключено до';
	@override String get faqTitle => 'Часті запитання';
}

// Path: appInfo
class _Translations$appInfo$uk extends Translations$appInfo$en {
	_Translations$appInfo$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber Авторські права © 2022-${buildYear} Adil Hanney\nЦя програма не має жодної гарантії. Це безкоштовне програмне забезпечення, і ви маєте право поширювати його за певних умов.';
	@override String get debug => 'ВІДЛАДКА';
	@override String get sponsorButton => 'Натисніть сюди, щоб мене спонсорувати або купити більше сховища';
	@override String get licenseButton => 'Натисніть сюди, щоб переглянути більше інформації про ліцензію';
	@override String get privacyPolicyButton => 'Натисніть сюди, щоб переглянути політику конфіденційності';
}

// Path: update
class _Translations$update$uk extends Translations$update$en {
	_Translations$update$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Оновлено доступно';
	@override String get updateAvailableDescription => 'Доступна нова версія програми:';
	@override String get update => 'Оновлення';
	@override String get downloadNotAvailableYet => 'Завантаження ще недоступне для вашої платформи. Будь ласка, перевірте пізніше.';
}

// Path: editor
class _Translations$editor$uk extends Translations$editor$en {
	_Translations$editor$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$uk toolbar = _Translations$editor$toolbar$uk._(_root);
	@override late final _Translations$editor$pens$uk pens = _Translations$editor$pens$uk._(_root);
	@override late final _Translations$editor$penOptions$uk penOptions = _Translations$editor$penOptions$uk._(_root);
	@override late final _Translations$editor$colors$uk colors = _Translations$editor$colors$uk._(_root);
	@override late final _Translations$editor$imageOptions$uk imageOptions = _Translations$editor$imageOptions$uk._(_root);
	@override late final _Translations$editor$selectionBar$uk selectionBar = _Translations$editor$selectionBar$uk._(_root);
	@override late final _Translations$editor$menu$uk menu = _Translations$editor$menu$uk._(_root);
	@override late final _Translations$editor$readOnlyBanner$uk readOnlyBanner = _Translations$editor$readOnlyBanner$uk._(_root);
	@override late final _Translations$editor$versionTooNew$uk versionTooNew = _Translations$editor$versionTooNew$uk._(_root);
	@override late final _Translations$editor$quill$uk quill = _Translations$editor$quill$uk._(_root);
	@override late final _Translations$editor$hud$uk hud = _Translations$editor$hud$uk._(_root);
	@override String get pages => 'Сторінки';
	@override String get untitled => 'Без назви';
	@override String get needsToSaveBeforeExiting => 'Збереження ваших змін... Ви можете безпечно вийти з редактора, коли він закінчиться';
}

// Path: home.tabs
class _Translations$home$tabs$uk extends Translations$home$tabs$en {
	_Translations$home$tabs$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get home => 'Головна';
	@override String get browse => 'Переглянути';
	@override String get whiteboard => 'Біла дошка';
	@override String get settings => 'Налаштування';
}

// Path: home.titles
class _Translations$home$titles$uk extends Translations$home$titles$en {
	_Translations$home$titles$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get home => 'Недавні нотатки';
	@override String get browse => 'Переглянути';
	@override String get whiteboard => 'Біла дошка';
	@override String get settings => 'Налаштування';
}

// Path: home.tooltips
class _Translations$home$tooltips$uk extends Translations$home$tooltips$en {
	_Translations$home$tooltips$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get exportNote => 'Експортувати нотатку';
	@override String get newNote => 'Нотатка';
	@override String get showUpdateDialog => 'Показати діалогове вікно оновлення';
}

// Path: home.create
class _Translations$home$create$uk extends Translations$home$create$en {
	_Translations$home$create$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Нотатка';
	@override String get importNote => 'Примітка імпорту';
}

// Path: home.newFolder
class _Translations$home$newFolder$uk extends Translations$home$newFolder$en {
	_Translations$home$newFolder$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$home$renameNote$uk extends Translations$home$renameNote$en {
	_Translations$home$renameNote$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$home$moveNote$uk extends Translations$home$moveNote$en {
	_Translations$home$moveNote$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$home$deleteNoteDialog$uk extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$home$renameFolder$uk extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$home$deleteFolder$uk extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Видалити папку';
	@override String deleteName({required Object f}) => 'Видалити ${f}';
	@override String get delete => 'Видалити';
	@override String get alsoDeleteContents => 'Також видаліть усі нотатки в цій папці';
}

// Path: home.sort
class _Translations$home$sort$uk extends Translations$home$sort$en {
	_Translations$home$sort$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get sortBy => 'Сортувати за';
	@override String get nameAToZ => 'Ім\'я (А-Я)';
	@override String get nameZToA => 'Ім\'я (З-А)';
	@override String get lastModifiedNewToOld => 'Відредаговано (Новіші першими)';
	@override String get lastModifiedOldToNew => 'Відредаговано (Найстаріші першими)';
}

// Path: home.layout
class _Translations$home$layout$uk extends Translations$home$layout$en {
	_Translations$home$layout$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get layout => 'Макет';
	@override String get masonryGrid => 'Сітка з використанням мозаїки';
	@override String get simpleGrid => 'Проста сітка';
}

// Path: sentry.consent
class _Translations$sentry$consent$uk extends Translations$sentry$consent$en {
	_Translations$sentry$consent$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$description$uk description = _Translations$sentry$consent$description$uk._(_root);
	@override late final _Translations$sentry$consent$answers$uk answers = _Translations$sentry$consent$answers$uk._(_root);
	@override String get title => 'Допоможіть покращити Saber?';
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$uk extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get general => 'Загальне';
	@override String get writing => 'Писати';
	@override String get editor => 'Редактор';
	@override String get performance => 'Продуктивність';
	@override String get advanced => 'Розширений';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$uk extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
	@override String get customDataDir => 'Кастомна папка Saber';
	@override String get sentry => 'Повідомлення про помилку';
}

// Path: settings.prefDescriptions
class _Translations$settings$prefDescriptions$uk extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$uk hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$uk._(_root);
	@override late final _Translations$settings$prefDescriptions$sentry$uk sentry = _Translations$settings$prefDescriptions$sentry$uk._(_root);
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
	@override String get shouldAlwaysAlertForUpdates => 'Повідомляйте мені про оновлення, як тільки вони будуть доступні.';
}

// Path: settings.themeModes
class _Translations$settings$themeModes$uk extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get system => 'Система';
	@override String get light => 'Світло';
	@override String get dark => 'Темний';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$uk extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Авто';
	@override String get phone => 'Телефон';
	@override String get tablet => 'Планшет';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$uk extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Вибери колір';
}

// Path: settings.reset
class _Translations$settings$reset$uk extends Translations$settings$reset$en {
	_Translations$settings$reset$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Скинути налаштування?';
	@override String get button => 'Скинути';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$uk extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Скасувати';
	@override String get select => 'Виберіть';
	@override String get mustBeEmpty => 'Обрана папка має бути порожньою';
	@override String get mustBeDoneSyncing => 'Переконайтеся, що синхронізація завершена перед зміною папки';
	@override String get unsupported => 'Ця функція наразі доступна лише розробникам. Використання її може призвести до втрати даних.';
}

// Path: login.form
class _Translations$login$form$uk extends Translations$login$form$en {
	_Translations$login$form$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Увійшовши в систему, ви погоджуєтеся з '),
		linkToPrivacyPolicy('Політика конфіденційності'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _Translations$login$status$uk extends Translations$login$status$en {
	_Translations$login$status$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Вийшов з системи';
	@override String get tapToLogin => 'Натисніть для входу через Nextcloud';
	@override String hi({required Object u}) => 'Привіт, ${u}!';
	@override String get almostDone => 'Майже готово до синхронізації, натисніть, щоб завершити вхід';
	@override String get loggedIn => 'Увійшов через Nextcloud';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$uk extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _Translations$login$ncLoginStep$loginFlow$uk loginFlow = _Translations$login$ncLoginStep$loginFlow$uk._(_root);
	@override String get whereToStoreData => 'Оберіть, де ви хочете зберігати ваші дані:';
	@override String get saberNcServer => 'Сервер Nextcloud Saber';
	@override String get otherNcServer => 'Інший сервер Nextcloud';
	@override String get serverUrl => 'URL сервера';
	@override String get loginWithSaber => 'Увійти через Saber';
	@override String get loginWithNextcloud => 'Увійти через Nextcloud';
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$uk extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$uk._(_root),
		_Translations$login$encLoginStep$encFaq$1$uk._(_root),
		_Translations$login$encLoginStep$encFaq$2$uk._(_root),
	];
	@override String get enterEncPassword => 'Для захисту ваших даних, будь ласка, введіть ваш пароль шифрування:';
	@override String get newToSaber => 'Нова у Saber? Просто введіть новий пароль шифрування.';
	@override String get encPassword => 'Пароль шифрування';
	@override String get encFaqTitle => 'Часті запитання';
	@override String get wrongEncPassword => 'Дешифрування не вдалося з наданим паролем. Будь ласка, спробуйте ввести його ще раз.';
	@override String get connectionFailed => 'Щось пішло не так при підключенні до сервера. Будь ласка, спробуйте пізніше.';
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$uk extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Головна сторінка сервера';
	@override String get deleteAccount => 'Видалити обліковий запис';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$uk extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get q => 'Чи втрачу я свої нотатки, якщо вийду з системи?';
	@override String get a => 'Ваші нотатки залишаться як на вашому пристрої, так і на сервері. Вони не будуть синхронізовані з сервером доти, доки ви не увійдете знову. Переконайтеся, що синхронізація завершена перед виходом (подивіться на прогрес синхронізації на головному екрані), щоб не втратити жодних даних.';
}

// Path: profile.faq.1
class _Translations$profile$faq$1$uk extends Translations$profile$faq$1$en {
	_Translations$profile$faq$1$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get q => 'Як змінити пароль у Nextcloud?';
	@override String get a => 'Перейдіть на вебсайт вашого сервера та увійдіть. Потім перейдіть до Налаштування > Безпека > Змінити пароль. Вам потрібно буде вийти та увійти назад до Saber після зміни пароля.';
}

// Path: profile.faq.2
class _Translations$profile$faq$2$uk extends Translations$profile$faq$2$en {
	_Translations$profile$faq$2$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get q => 'Як змінити пароль шифрування?';
	@override String get a => '0. Переконайтеся, що синхронізація завершена (подивіться на прогрес синхронізації на головному екрані).\n1. Вийдіть з облікового запису Saber.\n2. Перейдіть на вебсайт вашого сервера та видаліть папку \'Saber\'. Це видалить усі ваші нотатки з сервера.\n3. Увійдіть назад у Saber. Ви можете вибрати новий пароль шифрування при вході.\n4. Не забудьте вийти та увійти назад у Saber на інших пристроях також.';
}

// Path: profile.faq.3
class _Translations$profile$faq$3$uk extends Translations$profile$faq$3$en {
	_Translations$profile$faq$3$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get q => 'Як я можу видалити свій обліковий запис?';
	@override String get a => 'Натисніть на кнопку "${_root.profile.quickLinks.deleteAccount}" вище та увійдіть у систему, якщо потрібно.\nЯкщо ви використовуєте офіційний сервер Saber, ваш обліковий запис буде видалено після 1 тижневого періоду графіка. Ви можете зв\'язатися зі мною за адресою adilhanney@disroot.org протягом цього періоду, щоб скасувати видалення.\nЯкщо ви використовуєте сторонній сервер, у вас може не бути опції видалення вашого облікового запису: вам потрібно буде ознайомитися з політикою конфіденційності сервера для отримання додаткової інформації.';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$uk extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$editor$pens$uk extends Translations$editor$pens$en {
	_Translations$editor$pens$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$editor$penOptions$uk extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get size => 'Розмір';
}

// Path: editor.colors
class _Translations$editor$colors$uk extends Translations$editor$colors$en {
	_Translations$editor$colors$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$editor$imageOptions$uk extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$editor$selectionBar$uk extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Видалити';
	@override String get duplicate => 'Дублікат';
}

// Path: editor.menu
class _Translations$editor$menu$uk extends Translations$editor$menu$en {
	_Translations$editor$menu$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$menu$boxFits$uk boxFits = _Translations$editor$menu$boxFits$uk._(_root);
	@override late final _Translations$editor$menu$bgPatterns$uk bgPatterns = _Translations$editor$menu$bgPatterns$uk._(_root);
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
class _Translations$editor$readOnlyBanner$uk extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Режим лише читання';
	@override String get watchingServer => 'Ви наразі стежите за оновленнями на сервері. Редагування вимкнено в цьому режимі.';
	@override String get corrupted => 'Не вдалося завантажити нотатку. Вона може бути пошкоджена або все ще завантажується.';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$uk extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ця нота була відредагована за допомогою новішої версії Saber';
	@override String get subtitle => 'Редагування цієї нотатки може призвести до втрати деякої інформації. Ви хочете проігнорувати це та редагувати все одно?';
	@override String get allowEditing => 'Дозволити редагування';
}

// Path: editor.quill
class _Translations$editor$quill$uk extends Translations$editor$quill$en {
	_Translations$editor$quill$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Напишіть щось тут...';
}

// Path: editor.hud
class _Translations$editor$hud$uk extends Translations$editor$hud$en {
	_Translations$editor$hud$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$sentry$consent$description$uk extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
class _Translations$sentry$consent$answers$uk extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Так';
	@override String get no => 'Ні';
	@override String get later => 'Запитайте мене пізніше';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$uk extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Запобігає випадковому перемиканню';
	@override String get fixedOn => 'Малювання пальців встановлено як увімкнене';
	@override String get fixedOff => 'Малювання пальців закріплено як вимкнене';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$uk extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get active => 'Активний';
	@override String get inactive => 'Неактивний';
	@override String get activeUntilRestart => 'Активно до перезапуску програми';
	@override String get inactiveUntilRestart => 'Неактивно до перезапуску програми';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$uk extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Будь ласка, авторизуйте Saber для доступу до вашого облікового запису Nextcloud';
	@override String get followPrompts => 'Будь ласка, дотримуйтесь інструкцій у інтерфейсі Nextcloud';
	@override String get browserDidntOpen => 'Сторінка входу не відкрилася? Натисніть сюди';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$uk extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get q => 'Що таке пароль шифрування? Чому використовувати два паролі?';
	@override String get a => 'Пароль Nextcloud використовується для доступу до хмари. Пароль шифрування "scrambles" заплутує ваші дані ще до того, як вони потраплять у хмару.\nНавіть якщо хтось отримає доступ до вашого облікового запису Nextcloud, ваші нотатки залишаться в безпеці та зашифровані окремим паролем. Це забезпечує вам другий рівень безпеки для захисту ваших даних.\nНіхто не може отримати доступ до ваших нотаток на сервері без вашого пароля шифрування, але це також означає, що якщо ви забудете свій пароль шифрування, ви втратите доступ до ваших даних.';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$uk extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get q => 'Я ще не встановлював пароль шифрування. Де я його отримаю?';
	@override String get a => 'Оберіть новий пароль шифрування та введіть його вище.\nSaber автоматично згенерує ваші ключі шифрування з цього пароля.';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$uk extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get q => 'Чи можу я використовувати той самий пароль для свого облікового запису Nextcloud?';
	@override String get a => 'Так, але пам\'ятайте, що буде легше для адміністратора сервера або когось іншого отримати доступ до ваших нотаток, якщо вони отримають доступ до вашого облікового запису Nextcloud.';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$uk extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$uk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Розтягнути';
	@override String get cover => 'Покриття';
	@override String get contain => 'Містити';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$uk extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$uk._(TranslationsUk root) : this._root = root, super.internal(root);

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
