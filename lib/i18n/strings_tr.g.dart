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
class TranslationsTr extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsTr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.tr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <tr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsTr _root = this; // ignore: unused_field

	@override 
	TranslationsTr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonTr common = _TranslationsCommonTr._(_root);
	@override late final _TranslationsHomeTr home = _TranslationsHomeTr._(_root);
	@override late final _TranslationsSettingsTr settings = _TranslationsSettingsTr._(_root);
	@override late final _TranslationsLogsTr logs = _TranslationsLogsTr._(_root);
	@override late final _TranslationsLoginTr login = _TranslationsLoginTr._(_root);
	@override late final _TranslationsProfileTr profile = _TranslationsProfileTr._(_root);
	@override late final _TranslationsAppInfoTr appInfo = _TranslationsAppInfoTr._(_root);
	@override late final _TranslationsUpdateTr update = _TranslationsUpdateTr._(_root);
	@override late final _TranslationsEditorTr editor = _TranslationsEditorTr._(_root);
}

// Path: common
class _TranslationsCommonTr extends TranslationsCommonEn {
	_TranslationsCommonTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get done => 'Tamamlandı';
	@override String get continueBtn => 'Devam';
	@override String get cancel => 'İptal';
}

// Path: home
class _TranslationsHomeTr extends TranslationsHomeEn {
	_TranslationsHomeTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsTr tabs = _TranslationsHomeTabsTr._(_root);
	@override late final _TranslationsHomeTitlesTr titles = _TranslationsHomeTitlesTr._(_root);
	@override late final _TranslationsHomeTooltipsTr tooltips = _TranslationsHomeTooltipsTr._(_root);
	@override late final _TranslationsHomeCreateTr create = _TranslationsHomeCreateTr._(_root);
	@override String get welcome => 'Saber\'a hoş geldiniz';
	@override String get invalidFormat => 'Seçtiğiniz dosya desteklenmiyor. Lütfen bir .sbn, .sbn2, .sba veya .pdf dosyası seçin.';
	@override String get noFiles => 'Dosya yok';
	@override String get noPreviewAvailable => 'Önizleme yok';
	@override String get createNewNote => 'Yeni bir not oluşturmak için + butonuna tıklayınız';
	@override String get backFolder => 'Önceki klasöre dön';
	@override late final _TranslationsHomeNewFolderTr newFolder = _TranslationsHomeNewFolderTr._(_root);
	@override late final _TranslationsHomeRenameNoteTr renameNote = _TranslationsHomeRenameNoteTr._(_root);
	@override late final _TranslationsHomeMoveNoteTr moveNote = _TranslationsHomeMoveNoteTr._(_root);
	@override String get deleteNote => 'Notu sil';
	@override late final _TranslationsHomeRenameFolderTr renameFolder = _TranslationsHomeRenameFolderTr._(_root);
	@override late final _TranslationsHomeDeleteFolderTr deleteFolder = _TranslationsHomeDeleteFolderTr._(_root);
}

// Path: settings
class _TranslationsSettingsTr extends TranslationsSettingsEn {
	_TranslationsSettingsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesTr prefCategories = _TranslationsSettingsPrefCategoriesTr._(_root);
	@override late final _TranslationsSettingsPrefLabelsTr prefLabels = _TranslationsSettingsPrefLabelsTr._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsTr prefDescriptions = _TranslationsSettingsPrefDescriptionsTr._(_root);
	@override late final _TranslationsSettingsThemeModesTr themeModes = _TranslationsSettingsThemeModesTr._(_root);
	@override late final _TranslationsSettingsLayoutSizesTr layoutSizes = _TranslationsSettingsLayoutSizesTr._(_root);
	@override late final _TranslationsSettingsAccentColorPickerTr accentColorPicker = _TranslationsSettingsAccentColorPickerTr._(_root);
	@override String get systemLanguage => 'Sistem dili';
	@override List<String> get axisDirections => [
		'Üst',
		'Sağ',
		'Aşağı',
		'Sol',
	];
	@override late final _TranslationsSettingsResetTr reset = _TranslationsSettingsResetTr._(_root);
	@override String get resyncEverything => 'Her şeyi yeniden senkronize et';
	@override String get openDataDir => 'Saber klasörünü aç';
	@override late final _TranslationsSettingsCustomDataDirTr customDataDir = _TranslationsSettingsCustomDataDirTr._(_root);
}

// Path: logs
class _TranslationsLogsTr extends TranslationsLogsEn {
	_TranslationsLogsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Günlükler';
	@override String get viewLogs => 'Günlükleri görüntüle';
	@override String get debuggingInfo => 'Günlükler hata ayıklama ve geliştirme için yararlı bilgiler içerir';
	@override String get noLogs => 'Burada kayıt yok!';
	@override String get logsAreTemporary => 'Günlükler yalnızca uygulamayı kapatana kadar tutulur';
}

// Path: login
class _TranslationsLoginTr extends TranslationsLoginEn {
	_TranslationsLoginTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Giriş yap';
	@override late final _TranslationsLoginFormTr form = _TranslationsLoginFormTr._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Henüz hesabınız yok mu? '),
		linkToSignup('Hesap oluşturmak için tıklayın'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'Siz değil misiniz? '),
		undoLogin('Başka bir hesap seçin'),
		const TextSpan(text: '.'),
	]);
	@override late final _TranslationsLoginStatusTr status = _TranslationsLoginStatusTr._(_root);
	@override late final _TranslationsLoginNcLoginStepTr ncLoginStep = _TranslationsLoginNcLoginStepTr._(_root);
	@override late final _TranslationsLoginEncLoginStepTr encLoginStep = _TranslationsLoginEncLoginStepTr._(_root);
}

// Path: profile
class _TranslationsProfileTr extends TranslationsProfileEn {
	_TranslationsProfileTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profilim';
	@override String get logout => 'Çıkış yap';
	@override String quotaUsage({required Object total, required Object used, required Object percent}) => 'Toplam ${total} alanın ${used} kadarını (${percent}%) kullandınız';
	@override String get connectedTo => 'Bağlanılan sunucu';
	@override late final _TranslationsProfileQuickLinksTr quickLinks = _TranslationsProfileQuickLinksTr._(_root);
	@override String get faqTitle => 'Sıkça sorulan sorular';
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$Tr._(_root),
		_TranslationsProfile$faq$0i1$Tr._(_root),
		_TranslationsProfile$faq$0i2$Tr._(_root),
		_TranslationsProfile$faq$0i3$Tr._(_root),
	];
}

// Path: appInfo
class _TranslationsAppInfoTr extends TranslationsAppInfoEn {
	_TranslationsAppInfoTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nBu program hiçbir şeyi garanti etmez ve güvence vermez.\nBu program özgür (free) bir yazılımdır ve belli koşullar sağlandığında yeniden dağıtıma müsaittir.';
	@override String get dirty => 'TEST';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Beni sponsorlamak veya daha fazla alan satın almak için buraya tıkla';
	@override String get licenseButton => 'Lisans bilgisinin detaylarını görmek için buraya tıkla';
	@override String get privacyPolicyButton => 'Gizlilik Politikasını görmek için buraya tıkla';
}

// Path: update
class _TranslationsUpdateTr extends TranslationsUpdateEn {
	_TranslationsUpdateTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Güncelleme var';
	@override String get updateAvailableDescription => 'Uygulamanın şu değişiklikleri içeren yeni bir sürümü mevcut:';
	@override String get update => 'Güncelle';
	@override String get downloadNotAvailableYet => 'Bu indirme platformunuz için henüz hazır değil. Lütfen daha sonra tekrar deneyiniz.';
}

// Path: editor
class _TranslationsEditorTr extends TranslationsEditorEn {
	_TranslationsEditorTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarTr toolbar = _TranslationsEditorToolbarTr._(_root);
	@override late final _TranslationsEditorPensTr pens = _TranslationsEditorPensTr._(_root);
	@override late final _TranslationsEditorPenOptionsTr penOptions = _TranslationsEditorPenOptionsTr._(_root);
	@override late final _TranslationsEditorColorsTr colors = _TranslationsEditorColorsTr._(_root);
	@override late final _TranslationsEditorImageOptionsTr imageOptions = _TranslationsEditorImageOptionsTr._(_root);
	@override late final _TranslationsEditorSelectionBarTr selectionBar = _TranslationsEditorSelectionBarTr._(_root);
	@override late final _TranslationsEditorMenuTr menu = _TranslationsEditorMenuTr._(_root);
	@override late final _TranslationsEditorNewerFileFormatTr newerFileFormat = _TranslationsEditorNewerFileFormatTr._(_root);
	@override late final _TranslationsEditorQuillTr quill = _TranslationsEditorQuillTr._(_root);
	@override late final _TranslationsEditorHudTr hud = _TranslationsEditorHudTr._(_root);
	@override String get pages => 'Sayfalar';
	@override String get untitled => 'İsimsiz';
	@override String get needsToSaveBeforeExiting => 'Değişiklikler kaydediliyor... kayıt tamamlandığında editörden güvenli biçimde çıkabilirsiniz.';
}

// Path: home.tabs
class _TranslationsHomeTabsTr extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Giriş';
	@override String get browse => 'Göz at';
	@override String get whiteboard => 'Beyaz tahta';
	@override String get settings => 'Ayarlar';
}

// Path: home.titles
class _TranslationsHomeTitlesTr extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Son notlar';
	@override String get browse => 'Göz at';
	@override String get whiteboard => 'Beyaz tahta';
	@override String get settings => 'Ayarlar';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsTr extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Yeni not';
	@override String get showUpdateDialog => 'Güncelleme diyalogunu göster';
	@override String get exportNote => 'Notu dışa aktar';
}

// Path: home.create
class _TranslationsHomeCreateTr extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Yeni not';
	@override String get importNote => 'Notu içeri aktar';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderTr extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Yeni klasör';
	@override String get folderName => 'Klasör adı';
	@override String get create => 'Oluştur';
	@override String get folderNameEmpty => 'Klasör adı boş bırakılamaz';
	@override String get folderNameContainsSlash => 'Klasör adı eğik çizgi işareti içeremez';
	@override String get folderNameExists => 'Bu isimde bir klasör zaten var';
}

// Path: home.renameNote
class _TranslationsHomeRenameNoteTr extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Notu yeniden adlandır';
	@override String get noteName => 'Not adı';
	@override String get rename => 'Yeniden adlandır';
	@override String get noteNameEmpty => 'Not adı boş bırakılamaz';
	@override String get noteNameContainsSlash => 'Not adı eğik çizgi işareti içeremez';
	@override String get noteNameExists => 'Bu isimde bir not zaten var';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteTr extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Notu taşı';
	@override String moveNotes({required Object n}) => '${n} tane notu taşı';
	@override String moveName({required Object f}) => '${f} dosyasını taşı';
	@override String get move => 'Taşı';
	@override String renamedTo({required Object newName}) => 'Not ${newName} olarak yeniden adlandırılacak';
	@override String get multipleRenamedTo => 'Bu notlar yeniden adlandırılacak:';
	@override String numberRenamedTo({required Object n}) => '${n} tane not çakışma olmaması için yeniden adlandırılacak';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderTr extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Klasörü adlandır';
	@override String get folderName => 'Klasör ismi';
	@override String get rename => 'Yeniden adlandır';
	@override String get folderNameEmpty => 'Klasör ismi boş bırakılamaz';
	@override String get folderNameContainsSlash => 'Klasör isminde slash kullanılamaz';
	@override String get folderNameExists => 'Bu isme sahip bir klasör zaten var';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderTr extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Klasörü sil';
	@override String deleteName({required Object f}) => '${f} silinecek';
	@override String get delete => 'Sil';
	@override String get alsoDeleteContents => 'Bu klasördeki tüm notları da sil';
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesTr extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get general => 'Genel';
	@override String get writing => 'Yazım';
	@override String get editor => 'Editör';
	@override String get performance => 'Performans';
	@override String get advanced => 'Gelişmiş';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsTr extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Uygulama dili';
	@override String get appTheme => 'Uygulama teması';
	@override String get platform => 'Tema tipi';
	@override String get layoutSize => 'Yerleşim tipi';
	@override String get customAccentColor => 'Farklı ana renk';
	@override String get hyperlegibleFont => 'Hyperlegible font';
	@override String get shouldCheckForUpdates => 'Otomatik olarak Saber güncellemelerini kontrol et';
	@override String get shouldAlwaysAlertForUpdates => 'Hızlı güncellemeler';
	@override String get allowInsecureConnections => 'Güvensiz bağlantılara izin ver';
	@override String get editorToolbarAlignment => 'Editör araç çubuğunun yerleşimi';
	@override String get editorToolbarShowInFullscreen => 'Editör araç kutusunu tam ekranda göster';
	@override String get editorAutoInvert => 'Karanlık temada notların rengini tersine çevir';
	@override String get preferGreyscale => 'Gri tonlamayı tercih et';
	@override String get maxImageSize => 'Maksimum görsel boyutu';
	@override String get autoClearWhiteboardOnExit => 'Uygulamadan çıkıldığında beyaz tahtayı temizle';
	@override String get disableEraserAfterUse => 'Silgiden kaleme geçiş';
	@override String get hideFingerDrawingToggle => 'Parmakla çizme kilidini sakla';
	@override String get editorPromptRename => 'Notları yeniden adlandırmak için uyar';
	@override String get hideHomeBackgrounds => 'Ana ekranda arkaplanları gizle';
	@override String get recentColorsDontSavePresets => 'Ön tanımlı renkleri son kullanılanlara kaydetme';
	@override String get recentColorsLength => 'Kaç tane son kullanılan renk saklanacak';
	@override String get printPageIndicators => 'Sayfa belirteçlerini yazdır';
	@override String get autosaveDelay => 'Otomatik kayıt aralığı';
	@override String get shapeRecognitionDelay => 'Şekil tanıma gecikmesi';
	@override String get autoStraightenLines => 'Çizgileri otomatik düzleştir';
	@override String get simplifiedHomeLayout => 'Sadeleştirilmiş ana ekran düzeni';
	@override String get customDataDir => 'Özel Saber klasörü';
	@override String get pencilSoundSetting => 'Kurşun kalem ses efekti';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsTr extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible, görme sorunu yaşayanların okumasını kolaylaştıran bir fonttur';
	@override String get allowInsecureConnections => '(Önerilmez) Saber\'ın kendinden imzalı/güvensiz sertifika kullanan sunuculara bağlanmasına izin verir';
	@override String get preferGreyscale => 'E-mürekkep ekranlar için';
	@override String get autoClearWhiteboardOnExit => 'Diğer cihazlarınıza senkronize edilmeye devam edecek';
	@override String get disableEraserAfterUse => 'Silgiyi kullandıktan sonra otomatik olarak kaleme geçer';
	@override String get maxImageSize => 'Bundan daha büyük görseller sıkıştırılacak';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingTr hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingTr._(_root);
	@override String get editorPromptRename => 'Notlarınızı daha sonra da yeniden adlandırabilirsiniz';
	@override String get hideHomeBackgrounds => 'Daha sade bir görüntü için';
	@override String get printPageIndicators => 'Çıktılarda sayfa belirteçlerini göster';
	@override String get autosaveDelay => 'Bir notu otomatik kaydetmeden önce ne kadar bekleneceğini ayarlar';
	@override String get shapeRecognitionDelay => 'Çizilen şekilleri tanımlama sıklığını belirler';
	@override String get autoStraightenLines => 'Şekil aracını kullanmadığınızda da çizgileri düzleştirir';
	@override String get simplifiedHomeLayout => 'Not önizlemelerinin uzunluklarını eşitler';
	@override String get shouldAlwaysAlertForUpdates => 'Güncelleme mevcut olduğu gibi bana haber ver';
	@override late final _TranslationsSettingsPrefDescriptionsPencilSoundSettingTr pencilSoundSetting = _TranslationsSettingsPrefDescriptionsPencilSoundSettingTr._(_root);
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesTr extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem teması';
	@override String get light => 'Aydınlık';
	@override String get dark => 'Karanlık';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesTr extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Otomatik';
	@override String get phone => 'Telefon';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerTr extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Bir renk seçin';
}

// Path: settings.reset
class _TranslationsSettingsResetTr extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ayarı sıfırlamak istiyor musunuz?';
	@override String get button => 'Sıfırla';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirTr extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'İptal';
	@override String get select => 'Seç';
	@override String get mustBeEmpty => 'Seçilen klasör boş olmalı';
	@override String get mustBeDoneSyncing => 'Klasörü değiştirmeden önce senkronizasyonun tamamlandığından emin olun';
}

// Path: login.form
class _TranslationsLoginFormTr extends TranslationsLoginFormEn {
	_TranslationsLoginFormTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Giriş yaparak '),
		linkToPrivacyPolicy('Gizlilik Politikasını'),
		const TextSpan(text: ' kabul edersiniz.'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusTr extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Çıkış yapıldı';
	@override String get tapToLogin => 'Nextcloud oturumu açmak için tıklayın';
	@override String hi({required Object u}) => 'Merhaba, ${u}!';
	@override String get almostDone => 'Senkronizasyona hazırız, giriş yapmayı tamamlamak için tıklayın';
	@override String get loggedIn => 'Nextcloud\'a giriş yapıldı';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepTr extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'Verilerinizi nerede saklamak istediğinizi seçin:';
	@override String get saberNcServer => 'Saber\'ın resmi Nextcloud sunucus';
	@override String get otherNcServer => 'Diğer Nextcloud sunucusu';
	@override String get serverUrl => 'Sunucu URL\'i';
	@override String get loginWithSaber => 'Saber ile giriş yap';
	@override String get loginWithNextcloud => 'Nextcloud ile giriş yap';
	@override late final _TranslationsLoginNcLoginStepLoginFlowTr loginFlow = _TranslationsLoginNcLoginStepLoginFlowTr._(_root);
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepTr extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Verilerinizi korumak için lütfen şifreleme parolanızı girin:';
	@override String get newToSaber => 'Saber\'da ilk seferiniz mi? Yeni bir şifreleme parolası girin.';
	@override String get encPassword => 'Şifreleme parolası';
	@override String get encFaqTitle => 'Sıkça sorulan sorular';
	@override String get wrongEncPassword => 'Verilen parola ile şifre çözülemedi. Lütfen parolayı tekrar girin.';
	@override String get connectionFailed => 'Sunucuya bağlanılamadı. Lütfen daha sonra tekrar deneyin.';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$Tr._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$Tr._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$Tr._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksTr extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Sunucu anasayfası';
	@override String get deleteAccount => 'Hesabı sil';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$Tr extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$Tr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Çıkış yaparsam notlarımı kaybedecek miyim?';
	@override String get a => 'Hayır. Notlarınız hem cihazınızda hem de sunucuda tutuluyor olacak. Siz tekrardan giriş yapana dek notlarınız senkronize edilmeyecek. Veri kaybı yaşamamak için çıkış yapmadan önce senkronizasyonun tamamlandığından emin olun (ana sayfada senkronizasyon ilerlemesini görebilirsiniz).';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$Tr extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$Tr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nextcloud parolamı nasıl değiştirebilirim?';
	@override String get a => 'Sunucu websitesine gidin ve hesabınıza giriş yapın. Arayüzde Ayarlar > Güvenlik > Parola değiştir yolunu takip edin. Parolanızı değiştirdikten sonra Saber\'dan çıkış yapıp tekrardan giriş yapmanız gerekecek.';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$Tr extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$Tr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Şifreleme parolamı nasıl değiştirebilirim?';
	@override String get a => '"1. Saber\'dan çıkış yap. Veri kaybı yaşamamak için çıkış yapmadan önce senkronizasyonun tamamlandığından emin olun (ana sayfada senkronizasyon ilerlemesini görebilirsiniz)."\n2. Sunucu websitesine gidin ve \'Saber\' klasörünü silin. Bu sunucudaki tüm notları silecek.\n"3. Saber\'a giriş yap. Tekrar giriş yaparken yeni şifreleme parolanızı belirleyebilirsiniz.\n4. Diğer cihazlarınızda da Saber\'dan çıkış yapıp tekrar giriş yapmayı unutmayın.';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$Tr extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$Tr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Hesabımı nasıl silebilirim?';
	@override String get a => 'Üstte yer alan "${_root.profile.quickLinks.deleteAccount}" butonuna tıklayın, gerekirse giriş yapın.\nEğer resmi Saber sunucusunu kullanıyorsanız hesabınız 1 haftalık bekleme süresinden sonra silinecek. adilhanney@disroot.org adresinden benimle iletişime geçerek silinme talebini iptal edebilirsiniz.\nEğer üçüncü parti bir sunucu kullanıyorsanız hesabınızı silme seçeneği sunulmuyor olabilir: daha fazla bilgi için ilgili sunucunun gizlilik politikasını inceleyin.';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarTr extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Renklere geç (Ctrl C)';
	@override String get select => 'Seç';
	@override String get toggleEraser => 'Silgiyi aktifleştir (Ctrl E)';
	@override String get photo => 'Fotoğraf';
	@override String get text => 'Metin';
	@override String get toggleFingerDrawing => 'Parmakla çizimi aktifleştir (Ctrl F)';
	@override String get undo => 'Geri al';
	@override String get redo => 'Yeniden yap';
	@override String get export => 'Dışa aktar (Ctrl Shift S)';
	@override String get exportAs => 'Farklı formatta dışa aktar:';
	@override String get fullscreen => 'Tam ekrana geç (F11)';
}

// Path: editor.pens
class _TranslationsEditorPensTr extends TranslationsEditorPensEn {
	_TranslationsEditorPensTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Dolma kalem';
	@override String get ballpointPen => 'Tükenmez kalem';
	@override String get highlighter => 'İşaretleme kalemi';
	@override String get pencil => 'Kalem';
	@override String get shapePen => 'Şekil kalemi';
	@override String get laserPointer => 'Lazer işaretçi';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsTr extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get size => 'Boyut';
}

// Path: editor.colors
class _TranslationsEditorColorsTr extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Renk seçici';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Seçili ${b} ${h}';
	@override String customHue({required Object h}) => 'Seçili ${h}';
	@override String get dark => 'karanlık';
	@override String get light => 'aydınlık';
	@override String get black => 'Siyah';
	@override String get darkGrey => 'Koyu gri';
	@override String get grey => 'Gri';
	@override String get lightGrey => 'Açık gri';
	@override String get white => 'Beyaz';
	@override String get red => 'Kırmızı';
	@override String get green => 'Yeşil';
	@override String get cyan => 'Turkuaz';
	@override String get blue => 'Mavi';
	@override String get yellow => 'Sarı';
	@override String get purple => 'Mor';
	@override String get pink => 'Pembe';
	@override String get orange => 'Turuncu';
	@override String get pastelRed => 'Pastel kırmızı';
	@override String get pastelOrange => 'Pastel turuncu';
	@override String get pastelYellow => 'Pastel sarı';
	@override String get pastelGreen => 'Pastel yeşil';
	@override String get pastelCyan => 'Pastel camgöbeği';
	@override String get pastelBlue => 'Pastel mavi';
	@override String get pastelPurple => 'Pastel mor';
	@override String get pastelPink => 'Pastel pembe';
}

// Path: editor.imageOptions
class _TranslationsEditorImageOptionsTr extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Görüntü ayarları';
	@override String get invertible => '(Rengi) Tersine çevrilebilir';
	@override String get download => 'İndir';
	@override String get setAsBackground => 'Arkaplan olarak ayarla';
	@override String get removeAsBackground => 'Arkaplanı kaldır';
	@override String get delete => 'Sil';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarTr extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Sil';
	@override String get duplicate => 'Çoğalt';
}

// Path: editor.menu
class _TranslationsEditorMenuTr extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => '${page}/${totalPages} numaralı sayfayı temizle';
	@override String get clearAllPages => 'Tüm sayfaları temizle';
	@override String get insertPage => 'Aşağıya sayfa ekle';
	@override String get duplicatePage => 'Sayfayı çoğalt';
	@override String get deletePage => 'Sayfayı sil';
	@override String get lineHeight => 'Satır aralığı';
	@override String get lineHeightDescription => 'Klavye girişi olan notların metin boyutunu da kontrol eder';
	@override String get backgroundImageFit => 'Arkaplan görüntüsünü sığdır';
	@override String get backgroundPattern => 'Arkaplan deseni';
	@override String get import => 'İçe aktar';
	@override String get watchServer => 'Sunucudaki değişiklikleri izle';
	@override String get watchServerReadOnly => 'Sunucu izlenirken düzenleme yapılamaz';
	@override late final _TranslationsEditorMenuBoxFitsTr boxFits = _TranslationsEditorMenuBoxFitsTr._(_root);
	@override late final _TranslationsEditorMenuBgPatternsTr bgPatterns = _TranslationsEditorMenuBgPatternsTr._(_root);
	@override String get lineThickness => 'Çizgi kalınlığı';
	@override String get lineThicknessDescription => 'Arka plan çizgisi kalınlığı';
}

// Path: editor.newerFileFormat
class _TranslationsEditorNewerFileFormatTr extends TranslationsEditorNewerFileFormatEn {
	_TranslationsEditorNewerFileFormatTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Yalnızca okunabilir mod';
	@override String get title => 'Bu not Saber\'ın yeni bir versiyonunda düzenlenmiş';
	@override String get subtitle => 'Bu notu düzenlemek veri kaybına sebep olabilir. Bunu görmezden gelerek düzenlemek ister misiniz?';
	@override String get allowEditing => 'Düzenlemeye izin ver';
}

// Path: editor.quill
class _TranslationsEditorQuillTr extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Buraya bir şey yaz...';
}

// Path: editor.hud
class _TranslationsEditorHudTr extends TranslationsEditorHudEn {
	_TranslationsEditorHudTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Yakınlaştırma kilidini aç';
	@override String get lockZoom => 'Yakınlaştırmayı kilitle';
	@override String get unlockSingleFingerPan => 'Tek parmakla kaydırma kilidini aç';
	@override String get lockSingleFingerPan => 'Tek parmakla kaydırmayı kilitle';
	@override String get unlockAxisAlignedPan => 'Yatay ve dikey hareket kilidini aç';
	@override String get lockAxisAlignedPan => 'Yatay ve dikey hareketi kilitle';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingTr extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Yanlışlıkla değiştirilmesini engeller';
	@override String get fixedOn => 'Parmakla çizim izni verildi ve sabitlendi';
	@override String get fixedOff => 'Parmakla çizim izni verilmedi ve sabitlendi';
}

// Path: settings.prefDescriptions.pencilSoundSetting
class _TranslationsSettingsPrefDescriptionsPencilSoundSettingTr extends TranslationsSettingsPrefDescriptionsPencilSoundSettingEn {
	_TranslationsSettingsPrefDescriptionsPencilSoundSettingTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get off => 'Ses yok';
	@override String get onButNotInSilentMode => 'Etkin (sessiz modda değilse)';
	@override String get onAlways => 'Etkin (sessiz modda da)';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowTr extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Lütfen Saber\'ın Nextcloud hesabınıza erişmesine izin verin';
	@override String get followPrompts => 'Lütfen Nextcloud arayüzündeki aşamaları takip edin';
	@override String get browserDidntOpen => 'Giriş sayfası açılmadıysa buraya tıklayın';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$Tr extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$Tr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Şifreleme parolası nedir? Neden iki parola kullanıyorum?';
	@override String get a => 'Nextcloud parolası bulutta oturum açmak için kullanılıyor. Şifreleme parolası ise verilerinizi buluta aktarmadan önce gizlemek için kullanılıyor.\nEğer birisi Nextcloud hesabınızı ele geçirseydi bile notlarınız güvenli ve şifreli kalmaya devam edecekti. Böylece ikinci bir güvenlik katmanı sağlamış oluyoruz.\nBuluttaki verilerinize, şifreleme parolası olmayan kimse erişemez; dolayısıyla bu parolayı kaybetmeniz durumunda siz de erişemezsiniz.';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$Tr extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$Tr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Henüz bir şifreleme parolası belirlemedim. Nereden alacağım?';
	@override String get a => 'Yeni bir şifreleme parolası belirleyip yukarıya yazın.\nSaber şifreleme anahtarını bu parolayı kullanarak üretecek.';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$Tr extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$Tr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Nextcloud parolamla şifreleme parolam aynı olabilir mi?';
	@override String get a => 'Evet fakat unutmayın ki bu durumda Nextcloud parolanıza sahip herhangi birisi notlarınıza da erişebilir.';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsTr extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Yaydır';
	@override String get cover => 'Kapla';
	@override String get contain => 'İçer';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsTr extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get none => 'Boş';
	@override String get college => 'Std. çizgili defter';
	@override String get collegeRtl => 'Std. çizgili defter (Tersine çevrik)';
	@override String get lined => 'Çizgili';
	@override String get grid => 'Kareli';
	@override String get dots => 'Noktalı';
	@override String get staffs => 'Porte (müzik)';
	@override String get tablature => 'Nota kağıdı';
	@override String get cornell => 'Cornell not şablonu';
}
