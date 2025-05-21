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
class TranslationsRu extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonRu common = _TranslationsCommonRu._(_root);
	@override late final _TranslationsHomeRu home = _TranslationsHomeRu._(_root);
	@override late final _TranslationsSettingsRu settings = _TranslationsSettingsRu._(_root);
	@override late final _TranslationsLogsRu logs = _TranslationsLogsRu._(_root);
	@override late final _TranslationsLoginRu login = _TranslationsLoginRu._(_root);
	@override late final _TranslationsProfileRu profile = _TranslationsProfileRu._(_root);
	@override late final _TranslationsAppInfoRu appInfo = _TranslationsAppInfoRu._(_root);
	@override late final _TranslationsUpdateRu update = _TranslationsUpdateRu._(_root);
	@override late final _TranslationsEditorRu editor = _TranslationsEditorRu._(_root);
}

// Path: common
class _TranslationsCommonRu extends TranslationsCommonEn {
	_TranslationsCommonRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get done => 'Готово';
	@override String get continueBtn => 'Продолжить';
	@override String get cancel => 'Отмена';
}

// Path: home
class _TranslationsHomeRu extends TranslationsHomeEn {
	_TranslationsHomeRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsRu tabs = _TranslationsHomeTabsRu._(_root);
	@override late final _TranslationsHomeTitlesRu titles = _TranslationsHomeTitlesRu._(_root);
	@override late final _TranslationsHomeTooltipsRu tooltips = _TranslationsHomeTooltipsRu._(_root);
	@override late final _TranslationsHomeCreateRu create = _TranslationsHomeCreateRu._(_root);
	@override String get welcome => 'Приветствуем в Saber';
	@override String get invalidFormat => 'Выбранный вами файл не поддерживается. Выберите файл .sbn, .sbn2, .sba или .pdf.';
	@override String get noFiles => 'Файлов ещё нет';
	@override String get noPreviewAvailable => 'Нет предварительного просмотра';
	@override String get createNewNote => 'Нажмите кнопку «+» чтобы создать новую заметку';
	@override String get backFolder => 'Вернуться к предыдущей папке';
	@override late final _TranslationsHomeNewFolderRu newFolder = _TranslationsHomeNewFolderRu._(_root);
	@override late final _TranslationsHomeRenameNoteRu renameNote = _TranslationsHomeRenameNoteRu._(_root);
	@override late final _TranslationsHomeMoveNoteRu moveNote = _TranslationsHomeMoveNoteRu._(_root);
	@override String get deleteNote => 'Удалить заметку';
	@override late final _TranslationsHomeRenameFolderRu renameFolder = _TranslationsHomeRenameFolderRu._(_root);
	@override late final _TranslationsHomeDeleteFolderRu deleteFolder = _TranslationsHomeDeleteFolderRu._(_root);
}

// Path: settings
class _TranslationsSettingsRu extends TranslationsSettingsEn {
	_TranslationsSettingsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesRu prefCategories = _TranslationsSettingsPrefCategoriesRu._(_root);
	@override late final _TranslationsSettingsPrefLabelsRu prefLabels = _TranslationsSettingsPrefLabelsRu._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsRu prefDescriptions = _TranslationsSettingsPrefDescriptionsRu._(_root);
	@override late final _TranslationsSettingsThemeModesRu themeModes = _TranslationsSettingsThemeModesRu._(_root);
	@override late final _TranslationsSettingsLayoutSizesRu layoutSizes = _TranslationsSettingsLayoutSizesRu._(_root);
	@override late final _TranslationsSettingsAccentColorPickerRu accentColorPicker = _TranslationsSettingsAccentColorPickerRu._(_root);
	@override String get systemLanguage => 'Язык системы';
	@override List<String> get axisDirections => [
		'Сверху',
		'Справа',
		'Снизу',
		'Слева',
	];
	@override late final _TranslationsSettingsResetRu reset = _TranslationsSettingsResetRu._(_root);
	@override String get resyncEverything => 'Повторная синхронизация всего';
	@override String get openDataDir => 'Открыть папку Saber';
	@override late final _TranslationsSettingsCustomDataDirRu customDataDir = _TranslationsSettingsCustomDataDirRu._(_root);
}

// Path: logs
class _TranslationsLogsRu extends TranslationsLogsEn {
	_TranslationsLogsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Жерналы';
	@override String get viewLogs => 'Просмотр журналов';
	@override String get debuggingInfo => 'Журналы содержат информацию, полезную для отладки и разработки';
	@override String get noLogs => 'Здесь нет журналов!';
	@override String get logsAreTemporary => 'Журналы хранятся пока вы не закроете приложение';
}

// Path: login
class _TranslationsLoginRu extends TranslationsLoginEn {
	_TranslationsLoginRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Авторизация';
	@override late final _TranslationsLoginFormRu form = _TranslationsLoginFormRu._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'У вас нет учётной записи? '),
		linkToSignup('Зарегистрируйтесь сейчас'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'Не вы? '),
		undoLogin('Выбрать другую учётную запись'),
		const TextSpan(text: '.'),
	]);
	@override late final _TranslationsLoginStatusRu status = _TranslationsLoginStatusRu._(_root);
	@override late final _TranslationsLoginNcLoginStepRu ncLoginStep = _TranslationsLoginNcLoginStepRu._(_root);
	@override late final _TranslationsLoginEncLoginStepRu encLoginStep = _TranslationsLoginEncLoginStepRu._(_root);
}

// Path: profile
class _TranslationsProfileRu extends TranslationsProfileEn {
	_TranslationsProfileRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Мой профиль';
	@override String get logout => 'Выйти';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Вы используете ${used} из ${total} (${percent}%)';
	@override String get connectedTo => 'Подключен к';
	@override late final _TranslationsProfileQuickLinksRu quickLinks = _TranslationsProfileQuickLinksRu._(_root);
	@override String get faqTitle => 'Часто задаваемые вопросы';
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$Ru._(_root),
		_TranslationsProfile$faq$0i1$Ru._(_root),
		_TranslationsProfile$faq$0i2$Ru._(_root),
		_TranslationsProfile$faq$0i3$Ru._(_root),
	];
}

// Path: appInfo
class _TranslationsAppInfoRu extends TranslationsAppInfoEn {
	_TranslationsAppInfoRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nЭта программа поставляется без каких-либо гарантий. Это бесплатное программное обеспечение, и вы можете распространять его при определенных условиях.';
	@override String get dirty => 'ГРЯЗНАЯ';
	@override String get debug => 'ОТЛАДКА';
	@override String get sponsorButton => 'Проспонсируйте меня или купите дополнительное пространство';
	@override String get licenseButton => 'Просмотрите дополнительную информацию о лицензии';
	@override String get privacyPolicyButton => 'Просмотр политики конфиденциальности';
}

// Path: update
class _TranslationsUpdateRu extends TranslationsUpdateEn {
	_TranslationsUpdateRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Доступно обновление';
	@override String get updateAvailableDescription => 'Доступна новая версия приложения со следующими изменениями:';
	@override String get update => 'Обновить';
	@override String get downloadNotAvailableYet => 'Загрузка недоступна для вашей платформы. Пожалуйста, проверьте ещё раз позже.';
}

// Path: editor
class _TranslationsEditorRu extends TranslationsEditorEn {
	_TranslationsEditorRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarRu toolbar = _TranslationsEditorToolbarRu._(_root);
	@override late final _TranslationsEditorPensRu pens = _TranslationsEditorPensRu._(_root);
	@override late final _TranslationsEditorPenOptionsRu penOptions = _TranslationsEditorPenOptionsRu._(_root);
	@override late final _TranslationsEditorColorsRu colors = _TranslationsEditorColorsRu._(_root);
	@override late final _TranslationsEditorImageOptionsRu imageOptions = _TranslationsEditorImageOptionsRu._(_root);
	@override late final _TranslationsEditorSelectionBarRu selectionBar = _TranslationsEditorSelectionBarRu._(_root);
	@override late final _TranslationsEditorMenuRu menu = _TranslationsEditorMenuRu._(_root);
	@override late final _TranslationsEditorNewerFileFormatRu newerFileFormat = _TranslationsEditorNewerFileFormatRu._(_root);
	@override late final _TranslationsEditorQuillRu quill = _TranslationsEditorQuillRu._(_root);
	@override late final _TranslationsEditorHudRu hud = _TranslationsEditorHudRu._(_root);
	@override String get pages => 'Листы';
	@override String get untitled => 'Без названия';
	@override String get needsToSaveBeforeExiting => 'Сохраните Ваши изменения... Вы можете безопасно выйти из редактора, когда это будет сделано';
}

// Path: home.tabs
class _TranslationsHomeTabsRu extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get home => 'Домашняя';
	@override String get browse => 'Обзор';
	@override String get whiteboard => 'Чистый лист';
	@override String get settings => 'Настройки';
}

// Path: home.titles
class _TranslationsHomeTitlesRu extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get home => 'Недавние заметки';
	@override String get browse => 'Обзор';
	@override String get whiteboard => 'Чистый лист';
	@override String get settings => 'Настройки';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsRu extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Новая заметка';
	@override String get showUpdateDialog => 'Показывать диалог обновления';
	@override String get exportNote => 'Экспортировать заметку';
}

// Path: home.create
class _TranslationsHomeCreateRu extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Новая заметка';
	@override String get importNote => 'Импорт заметки';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderRu extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Новая папка';
	@override String get folderName => 'Имя папки';
	@override String get create => 'Создать';
	@override String get folderNameEmpty => 'Имя папки не может быть пустым';
	@override String get folderNameContainsSlash => 'Имя папки не должно содержать косую черту';
	@override String get folderNameExists => 'Папка уже существует';
}

// Path: home.renameNote
class _TranslationsHomeRenameNoteRu extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Переименовать заметку';
	@override String get noteName => 'Название заметки';
	@override String get rename => 'Переименовать';
	@override String get noteNameEmpty => 'Название заметки не может быть пустым';
	@override String get noteNameContainsSlash => 'Название заметки не может содержать косую черту';
	@override String get noteNameExists => 'Заметка с таким названием уже существует';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteRu extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Переместить заметку';
	@override String moveNotes({required Object n}) => 'Переместить ${n} заметок';
	@override String moveName({required Object f}) => 'Переместить ${f}';
	@override String get move => 'Перемещение';
	@override String renamedTo({required Object newName}) => 'Заметка будет переименована в ${newName}';
	@override String get multipleRenamedTo => 'Следующие заметки будут переименованы:';
	@override String numberRenamedTo({required Object n}) => '${n} заметок будут переименованы, чтобы избежать конфликтов';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderRu extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Переименовать папку';
	@override String get folderName => 'Имя папки';
	@override String get rename => 'Переименовать';
	@override String get folderNameEmpty => 'Имя папки не может быть пустым';
	@override String get folderNameContainsSlash => 'Имя папки не может содержать косую черту';
	@override String get folderNameExists => 'Папка с таким названием уже существует';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderRu extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Удалить папку';
	@override String deleteName({required Object f}) => 'Удалить ${f}';
	@override String get delete => 'Удалить';
	@override String get alsoDeleteContents => 'Также, удалить все заметки в этой папке';
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesRu extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get general => 'Общие';
	@override String get writing => 'Письмо';
	@override String get editor => 'Редактор';
	@override String get performance => 'Производительность';
	@override String get advanced => 'Дополнительно';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsRu extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Язык приложения';
	@override String get appTheme => 'Тема оформления';
	@override String get platform => 'Тип темы';
	@override String get layoutSize => 'Размер макета';
	@override String get customAccentColor => 'Свой цвет акцента';
	@override String get hyperlegibleFont => 'Гипер разборчивый шрифт';
	@override String get shouldCheckForUpdates => 'Автоматически проверять обновления Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Быстрые обновления';
	@override String get allowInsecureConnections => 'Разрешить небезопасные соединения';
	@override String get editorToolbarAlignment => 'Панель инструментов редактора';
	@override String get editorToolbarShowInFullscreen => 'Показывать инструменты в полноэкранном режиме';
	@override String get editorAutoInvert => 'Инвертировать заметки в тёмном режиме';
	@override String get preferGreyscale => 'Предпочтение оттенкам серого';
	@override String get maxImageSize => 'Макс. размер изображения';
	@override String get autoClearWhiteboardOnExit => 'Очищать лист при выходе из приложения';
	@override String get disableEraserAfterUse => 'Автоотключение ластика';
	@override String get hideFingerDrawingToggle => 'Скрыть переключатель «Рисование пальцем»';
	@override String get editorPromptRename => 'Предлагать переименовывать новые заметки';
	@override String get hideHomeBackgrounds => 'Скрыть фон на главном экране';
	@override String get recentColorsDontSavePresets => 'Не сохранять предустановленные цвета в последних цветах';
	@override String get recentColorsLength => 'Количество последних сохраняемых цветов';
	@override String get printPageIndicators => 'Печатать номера страниц';
	@override String get autosaveDelay => 'Задержка автосохранения';
	@override String get shapeRecognitionDelay => 'Задержка распознавания формы';
	@override String get autoStraightenLines => 'Автоматическое выпрямление линий';
	@override String get simplifiedHomeLayout => 'Упрощённый главный экран';
	@override String get customDataDir => 'Свой каталог Saber';
	@override String get pencilSoundSetting => 'Звуковой эффект карандаша';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsRu extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Шрифт Atkinson Hyperlegible повышает разборчивость для читателей с плохим зрением';
	@override String get allowInsecureConnections => '(Не рекомендуется) Разрешить Saber подключаться к серверам с самоподписанными/ненадёжными сертификатами.';
	@override String get preferGreyscale => 'Для e-ink экранов';
	@override String get autoClearWhiteboardOnExit => 'Это будет синхронизировано с другими вашими устройствами';
	@override String get disableEraserAfterUse => 'Автоматически переключается на перо после использования ластика';
	@override String get maxImageSize => 'Большие изображения будут сжаты';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingRu hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingRu._(_root);
	@override String get editorPromptRename => 'Вы всегда можете переименовать заметки позже';
	@override String get hideHomeBackgrounds => 'Для чистого вида';
	@override String get printPageIndicators => 'Показывать номера страниц при экспорте';
	@override String get autosaveDelay => 'Время ожидания до автосохранения заметки';
	@override String get shapeRecognitionDelay => 'Как часто обновлять предварительный просмотр формы';
	@override String get autoStraightenLines => 'Выпрямляет длинные линии без использования фигурного пера';
	@override String get simplifiedHomeLayout => 'Фиксированная высота предварительного просмотра каждой заметки';
	@override String get shouldAlwaysAlertForUpdates => 'Сообщать мне об обновлениях, как только они станут доступны';
	@override late final _TranslationsSettingsPrefDescriptionsPencilSoundSettingRu pencilSoundSetting = _TranslationsSettingsPrefDescriptionsPencilSoundSettingRu._(_root);
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesRu extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get system => 'Системная';
	@override String get light => 'Светлая';
	@override String get dark => 'Тёмная';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesRu extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Авто';
	@override String get phone => 'Телефон';
	@override String get tablet => 'Планшет';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerRu extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Выбери цвет';
}

// Path: settings.reset
class _TranslationsSettingsResetRu extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Сбросить эту настройку?';
	@override String get button => 'Сбросить';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirRu extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Отмена';
	@override String get select => 'Выбрать';
	@override String get mustBeEmpty => 'Выбранный каталог должен быть пустым';
	@override String get mustBeDoneSyncing => 'Перед изменением каталога убедитесь, что синхронизация завершена';
}

// Path: login.form
class _TranslationsLoginFormRu extends TranslationsLoginFormEn {
	_TranslationsLoginFormRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Авторизуясь, вы соглашаетесь с '),
		linkToPrivacyPolicy('политикой конфиденциальности'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusRu extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Не авторизован';
	@override String get tapToLogin => 'Нажми для авторизации в Nextcloud';
	@override String hi({required Object u}) => 'Привет, ${u}!';
	@override String get almostDone => 'Синхронизация почти готова, нажмите, чтобы завершить вход в систему';
	@override String get loggedIn => 'Авторизован в Nextcloud';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepRu extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'Выберите, где вы хотите хранить свои данные:';
	@override String get saberNcServer => 'Saber Nextcloud сервер';
	@override String get otherNcServer => 'Другой Nextcloud сервер';
	@override String get serverUrl => 'URL-адрес сервера';
	@override String get loginWithSaber => 'Войти с помощью Saber';
	@override String get loginWithNextcloud => 'Войти с помощью Nextcloud';
	@override late final _TranslationsLoginNcLoginStepLoginFlowRu loginFlow = _TranslationsLoginNcLoginStepLoginFlowRu._(_root);
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepRu extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Чтобы защитить ваши данные, введите пароль шифрования:';
	@override String get newToSaber => 'Новичок в Saber? Просто введите новый пароль для шифрования.';
	@override String get encPassword => 'Пароль шифрования';
	@override String get encFaqTitle => 'Часто задаваемые вопросы';
	@override String get wrongEncPassword => 'Не удалось расшифровать указанным паролем. Пожалуйста, попробуйте ввести его еще раз.';
	@override String get connectionFailed => 'При подключении к серверу произошла ошибка. Пожалуйста, повторите попытку позже.';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$Ru._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$Ru._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$Ru._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksRu extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Домашняя страница сервера';
	@override String get deleteAccount => 'Удалить учётную запись';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$Ru extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$Ru._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Потеряю ли я свои заметки, если выйду из системы?';
	@override String get a => 'Нет. Ваши заметки останутся как на вашем устройстве, так и на сервере. Они не будут синхронизированы с сервером, пока вы снова не войдете в систему. Перед выходом из системы убедитесь, что синхронизация завершена, чтобы не потерять данные (см. синхронизацию на главном экране).';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$Ru extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$Ru._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Как изменить свой пароль Nextcloud?';
	@override String get a => 'Перейдите на веб-сайт своего сервера и войдите в систему. Затем перейдите в «Параметры пользователя» > «Безопасность» > «Пароль». Вам нужно будет выйти и снова войти в Saber после смены пароля.';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$Ru extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$Ru._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Как изменить свой пароль шифрования?';
	@override String get a => '1. Выйдите из Saber. Перед выходом убедитесь, что синхронизация завершена, чтобы не потерять данные (см. синхронизацию на главном экране).\n2. Перейдите на веб-сайт своего сервера и удалите папку «Saber». Это приведет к удалению всех ваших заметок с сервера.\n3. Снова войдите в Saber. Вы можете создать новый пароль шифрования при входе в систему.\n4. Не забудьте выйти и снова войти в Saber на других своих устройствах.';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$Ru extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$Ru._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Как я могу удалить свою учётную запись?';
	@override String get a => 'Нажмите кнопку "${_root.profile.quickLinks.deleteAccount}" выше и войдите в систему, если необходимо.\nЕсли вы используете официальный сервер Saber, ваша учётная запись будет удалена по истечении 1-недельного льготного периода. Вы можете связаться со мной по адресу adilhanney@disroot.org в течение этого периода, чтобы отменить удаление.\nЕсли вы используете сторонний сервер, то у вас может не быть возможности удалить свою учётную запись. Вам нужно будет ознакомиться с политикой конфиденциальности сервера, для получения дополнительной информации.';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarRu extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Выбор цвета (Ctrl C)';
	@override String get select => 'Выделение';
	@override String get toggleEraser => 'Ластик (Ctrl E)';
	@override String get photo => 'Фото';
	@override String get text => 'Текст';
	@override String get toggleFingerDrawing => 'Рисование пальцем (Ctrl F)';
	@override String get undo => 'Отменить';
	@override String get redo => 'Вернуть';
	@override String get export => 'Экспорт (Ctrl Shift S)';
	@override String get exportAs => 'Сохранить как:';
	@override String get fullscreen => 'Полноэкранный режим (F11)';
}

// Path: editor.pens
class _TranslationsEditorPensRu extends TranslationsEditorPensEn {
	_TranslationsEditorPensRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Перьевая ручка';
	@override String get ballpointPen => 'Шариковая ручка';
	@override String get highlighter => 'Маркер';
	@override String get pencil => 'Карандаш';
	@override String get shapePen => 'Вид ручки';
	@override String get laserPointer => 'Лазерная указка';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsRu extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get size => 'Размер';
}

// Path: editor.colors
class _TranslationsEditorColorsRu extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Выбор цвета';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Свой ${b} ${h}';
	@override String customHue({required Object h}) => 'Свой ${h}';
	@override String get dark => 'тёмный';
	@override String get light => 'светлый';
	@override String get black => 'Чёрный';
	@override String get darkGrey => 'Тёмно-серый';
	@override String get grey => 'Серый';
	@override String get lightGrey => 'Светло-серый';
	@override String get white => 'Белый';
	@override String get red => 'Красный';
	@override String get green => 'Зелёный';
	@override String get cyan => 'Голубой';
	@override String get blue => 'Синий';
	@override String get yellow => 'Жёлтый';
	@override String get purple => 'Фиолетовый';
	@override String get pink => 'Розовый';
	@override String get orange => 'Оранжевый';
	@override String get pastelRed => 'Пастельный красный';
	@override String get pastelOrange => 'Пастельный оранжевый';
	@override String get pastelYellow => 'Пастельный жёлтый';
	@override String get pastelGreen => 'Пастельный зелёный';
	@override String get pastelCyan => 'Пастельный голубой';
	@override String get pastelBlue => 'Пастельный синий';
	@override String get pastelPurple => 'Пастельный фиолетовый';
	@override String get pastelPink => 'Пастельный розовый';
}

// Path: editor.imageOptions
class _TranslationsEditorImageOptionsRu extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Параметры изображения';
	@override String get invertible => 'Инвертировать';
	@override String get download => 'Сохранить';
	@override String get setAsBackground => 'Сделать фоном';
	@override String get removeAsBackground => 'Удалить фон';
	@override String get delete => 'Удалить';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarRu extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Удалить';
	@override String get duplicate => 'Дублировать';
}

// Path: editor.menu
class _TranslationsEditorMenuRu extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Очистить лист ${page}/${totalPages}';
	@override String get clearAllPages => 'Очистить все листы';
	@override String get insertPage => 'Вставить страницу ниже';
	@override String get duplicatePage => 'Дубликат страницы';
	@override String get deletePage => 'Удалить страницу';
	@override String get lineHeight => 'Высота строки';
	@override String get lineHeightDescription => 'Также управляет размером текста для напечатанных заметок';
	@override String get backgroundImageFit => 'Фоновое изображение';
	@override String get backgroundPattern => 'Фоновый шаблон';
	@override String get import => 'Импорт';
	@override String get watchServer => 'Следить за обновлениями на сервере';
	@override String get watchServerReadOnly => 'Редактирование невозможно во время слежки за сервером';
	@override late final _TranslationsEditorMenuBoxFitsRu boxFits = _TranslationsEditorMenuBoxFitsRu._(_root);
	@override late final _TranslationsEditorMenuBgPatternsRu bgPatterns = _TranslationsEditorMenuBgPatternsRu._(_root);
	@override String get lineThickness => 'Линия толщина';
	@override String get lineThicknessDescription => 'Фотовая линия толщина';
}

// Path: editor.newerFileFormat
class _TranslationsEditorNewerFileFormatRu extends TranslationsEditorNewerFileFormatEn {
	_TranslationsEditorNewerFileFormatRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Режим «Только чтение»';
	@override String get title => 'Эта заметка была отредактирована в более новой версии Saber.';
	@override String get subtitle => 'Редактирование этой заметки может привести к потере некоторой информации. Вы хотите проигнорировать это и начать редактирование?';
	@override String get allowEditing => 'Разрешить редактирование';
}

// Path: editor.quill
class _TranslationsEditorQuillRu extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Напишите что-нибудь здесь...';
}

// Path: editor.hud
class _TranslationsEditorHudRu extends TranslationsEditorHudEn {
	_TranslationsEditorHudRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Разблок. увеличение';
	@override String get lockZoom => 'Блок. увеличения';
	@override String get unlockSingleFingerPan => 'Разрешить панораму одним пальцем';
	@override String get lockSingleFingerPan => 'Запретить панораму одним пальцем';
	@override String get unlockAxisAlignedPan => 'Разблокировать панораму по горизонтали или вертикали';
	@override String get lockAxisAlignedPan => 'Блокировать панораму по горизонтали или вертикали';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingRu extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Предотвращать случайное переключение';
	@override String get fixedOn => '«Рисование пальцем» зафиксировано как включенное';
	@override String get fixedOff => '«Рисование пальцем» зафиксировано как выключенное';
}

// Path: settings.prefDescriptions.pencilSoundSetting
class _TranslationsSettingsPrefDescriptionsPencilSoundSettingRu extends TranslationsSettingsPrefDescriptionsPencilSoundSettingEn {
	_TranslationsSettingsPrefDescriptionsPencilSoundSettingRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get off => 'Без звука';
	@override String get onButNotInSilentMode => 'Включено (кроме тихого режима)';
	@override String get onAlways => 'Включено (даже в беззвучном режиме)';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowRu extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Пожалуйста, авторизуйте Saber для доступа к вашей учётной записи Nextcloud';
	@override String get followPrompts => 'Пожалуйста, следуйте инструкциям в интерфейсе Nextcloud';
	@override String get browserDidntOpen => 'Страница входа в систему не открылась? Нажмите сюда';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$Ru extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$Ru._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Что такое пароль шифрования? Зачем использовать два пароля?';
	@override String get a => 'Пароль Nextcloud используется для доступа к облаку. Пароль шифрования "зашифровывает" ваши данные еще до того, как они попадут в облако.\nДаже если кто-то получит доступ к вашей учётной записи Nextcloud, ваши заметки останутся в безопасности и будут зашифрованы с помощью отдельного пароля. Это обеспечивает второй уровень безопасности для защиты ваших данных.\nНикто не сможет получить доступ к вашим заметкам на сервере без вашего пароля шифрования, но это также означает, что если вы забудете свой пароль шифрования, вы потеряете доступ к своим данным.';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$Ru extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$Ru._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Я еще не установил пароль для шифрования. Где я могу его получить?';
	@override String get a => 'Придумайте новый пароль для шифрования и введите его выше.\nSaber автоматически сгенерирует ваши ключи шифрования на основе этого пароля.';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$Ru extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$Ru._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get q => 'Могу ли я использовать тот же пароль, что и для моей учётной записи Nextcloud?';
	@override String get a => 'Да, но имейте в виду, что администратору сервера или кому-либо ещё будет проще получить доступ к вашим заметкам, если они получат доступ к вашей учётной записи Nextcloud.';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsRu extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Растянуть';
	@override String get cover => 'Обрезать';
	@override String get contain => 'Вместить';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsRu extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get none => 'Пустой';
	@override String get college => 'Школьная тетрадь';
	@override String get collegeRtl => 'Школьная тетрадь (Поворот)';
	@override String get lined => 'Линии';
	@override String get grid => 'Сетка';
	@override String get dots => 'Точки';
	@override String get staffs => 'Персональный';
	@override String get tablature => 'Табулатура';
	@override String get cornell => 'Корнелл';
}
