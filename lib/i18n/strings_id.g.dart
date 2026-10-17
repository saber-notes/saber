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
class TranslationsId extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsId({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.id,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <id>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	late final TranslationsId _root = this; // ignore: unused_field

	@override 
	TranslationsId $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsId(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$id common = _Translations$common$id._(_root);
	@override late final _Translations$home$id home = _Translations$home$id._(_root);
	@override late final _Translations$sentry$id sentry = _Translations$sentry$id._(_root);
	@override late final _Translations$settings$id settings = _Translations$settings$id._(_root);
	@override late final _Translations$logs$id logs = _Translations$logs$id._(_root);
	@override late final _Translations$login$id login = _Translations$login$id._(_root);
	@override late final _Translations$profile$id profile = _Translations$profile$id._(_root);
	@override late final _Translations$appInfo$id appInfo = _Translations$appInfo$id._(_root);
	@override late final _Translations$update$id update = _Translations$update$id._(_root);
	@override late final _Translations$editor$id editor = _Translations$editor$id._(_root);
}

// Path: common
class _Translations$common$id extends Translations$common$en {
	_Translations$common$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get done => 'Selesai';
	@override String get continueBtn => 'Lanjutkan';
	@override String get cancel => 'Batal';
}

// Path: home
class _Translations$home$id extends Translations$home$en {
	_Translations$home$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$id tabs = _Translations$home$tabs$id._(_root);
	@override late final _Translations$home$titles$id titles = _Translations$home$titles$id._(_root);
	@override late final _Translations$home$tooltips$id tooltips = _Translations$home$tooltips$id._(_root);
	@override late final _Translations$home$create$id create = _Translations$home$create$id._(_root);
	@override String get welcome => 'Selamat datang di Saber';
	@override String get invalidFormat => 'File yang kamu pilih tidak didukung. Pilih file sbn, sbn2, sba, atau pdf.';
	@override String get noFiles => 'Tidak ada file';
	@override String get noPreviewAvailable => 'Pratinjau tidak tersedia';
	@override String get createNewNote => 'Ketuk tombol + untuk membuat catatan baru';
	@override String get backFolder => 'Kembali ke folder sebelumnya';
	@override late final _Translations$home$newFolder$id newFolder = _Translations$home$newFolder$id._(_root);
	@override late final _Translations$home$renameNote$id renameNote = _Translations$home$renameNote$id._(_root);
	@override late final _Translations$home$moveNote$id moveNote = _Translations$home$moveNote$id._(_root);
	@override String get deleteNote => 'Hapus catatan';
	@override late final _Translations$home$deleteNoteDialog$id deleteNoteDialog = _Translations$home$deleteNoteDialog$id._(_root);
	@override late final _Translations$home$renameFolder$id renameFolder = _Translations$home$renameFolder$id._(_root);
	@override late final _Translations$home$deleteFolder$id deleteFolder = _Translations$home$deleteFolder$id._(_root);
	@override late final _Translations$home$sort$id sort = _Translations$home$sort$id._(_root);
	@override late final _Translations$home$layout$id layout = _Translations$home$layout$id._(_root);
}

// Path: sentry
class _Translations$sentry$id extends Translations$sentry$en {
	_Translations$sentry$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$id consent = _Translations$sentry$consent$id._(_root);
}

// Path: settings
class _Translations$settings$id extends Translations$settings$en {
	_Translations$settings$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$id prefCategories = _Translations$settings$prefCategories$id._(_root);
	@override late final _Translations$settings$prefLabels$id prefLabels = _Translations$settings$prefLabels$id._(_root);
	@override late final _Translations$settings$prefDescriptions$id prefDescriptions = _Translations$settings$prefDescriptions$id._(_root);
	@override late final _Translations$settings$themeModes$id themeModes = _Translations$settings$themeModes$id._(_root);
	@override late final _Translations$settings$layoutSizes$id layoutSizes = _Translations$settings$layoutSizes$id._(_root);
	@override late final _Translations$settings$accentColorPicker$id accentColorPicker = _Translations$settings$accentColorPicker$id._(_root);
	@override String get systemLanguage => 'Otomatis';
	@override List<String> get axisDirections => [
		'Atas',
		'Kanan',
		'Bawah',
		'Kiri',
	];
	@override late final _Translations$settings$reset$id reset = _Translations$settings$reset$id._(_root);
	@override String get resyncEverything => 'Sinkronkan ulang semuanya';
	@override String get openDataDir => 'Buka folder Saber';
	@override late final _Translations$settings$customDataDir$id customDataDir = _Translations$settings$customDataDir$id._(_root);
	@override String get autosaveDisabled => 'Tidak pernah';
	@override String get shapeRecognitionDisabled => 'Tidak pernah';
}

// Path: logs
class _Translations$logs$id extends Translations$logs$en {
	_Translations$logs$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Log';
	@override String get viewLogs => 'Lihat log';
	@override String get debuggingInfo => 'Log berisi informasi yang berguna untuk debugging dan pengembangan';
	@override String get noLogs => 'Belum ada log!';
	@override String get useTheApp => 'Log akan muncul di sini saat kamu menggunakan aplikasi';
}

// Path: login
class _Translations$login$id extends Translations$login$en {
	_Translations$login$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Masuk';
	@override late final _Translations$login$form$id form = _Translations$login$form$id._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Belum punya akun? '),
		linkToSignup('Daftar sekarang'),
		const TextSpan(text: '!'),
	]);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'Bukan kamu? '),
		undoLogin('Pilih akun lain'),
		const TextSpan(text: '.'),
	]);
	@override late final _Translations$login$status$id status = _Translations$login$status$id._(_root);
	@override late final _Translations$login$ncLoginStep$id ncLoginStep = _Translations$login$ncLoginStep$id._(_root);
	@override late final _Translations$login$encLoginStep$id encLoginStep = _Translations$login$encLoginStep$id._(_root);
}

// Path: profile
class _Translations$profile$id extends Translations$profile$en {
	_Translations$profile$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profil saya';
	@override String get logout => 'Keluar';
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Kamu memakai ${used} dari ${total} (${percent}%)';
	@override String quotaUsageUncapped({required Object used}) => 'Kamu memakai ${used}';
	@override String get connectedTo => 'Terhubung ke';
	@override late final _Translations$profile$quickLinks$id quickLinks = _Translations$profile$quickLinks$id._(_root);
	@override String get faqTitle => 'Pertanyaan yang sering diajukan';
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$id._(_root),
		_Translations$profile$faq$1$id._(_root),
		_Translations$profile$faq$2$id._(_root),
		_Translations$profile$faq$3$id._(_root),
	];
}

// Path: appInfo
class _Translations$appInfo$id extends Translations$appInfo$en {
	_Translations$appInfo$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nProgram ini sama sekali tanpa garansi. Ini adalah perangkat lunak bebas, dan kamu dipersilakan untuk membagikannya kembali dengan ketentuan tertentu.';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Ketuk di sini untuk mendukung saya atau membeli penyimpanan tambahan';
	@override String get licenseButton => 'Ketuk di sini untuk melihat informasi lisensi lainnya';
	@override String get privacyPolicyButton => 'Ketuk di sini untuk melihat kebijakan privasi';
}

// Path: update
class _Translations$update$id extends Translations$update$en {
	_Translations$update$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Pembaruan tersedia';
	@override String get updateAvailableDescription => 'Versi baru aplikasi sudah tersedia:';
	@override String get update => 'Perbarui';
	@override String get downloadNotAvailableYet => 'Unduhan untuk platformmu belum tersedia. Coba cek lagi sebentar lagi.';
}

// Path: editor
class _Translations$editor$id extends Translations$editor$en {
	_Translations$editor$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$id toolbar = _Translations$editor$toolbar$id._(_root);
	@override late final _Translations$editor$pens$id pens = _Translations$editor$pens$id._(_root);
	@override late final _Translations$editor$penOptions$id penOptions = _Translations$editor$penOptions$id._(_root);
	@override late final _Translations$editor$colors$id colors = _Translations$editor$colors$id._(_root);
	@override late final _Translations$editor$imageOptions$id imageOptions = _Translations$editor$imageOptions$id._(_root);
	@override late final _Translations$editor$selectionBar$id selectionBar = _Translations$editor$selectionBar$id._(_root);
	@override late final _Translations$editor$menu$id menu = _Translations$editor$menu$id._(_root);
	@override late final _Translations$editor$readOnlyBanner$id readOnlyBanner = _Translations$editor$readOnlyBanner$id._(_root);
	@override late final _Translations$editor$versionTooNew$id versionTooNew = _Translations$editor$versionTooNew$id._(_root);
	@override late final _Translations$editor$quill$id quill = _Translations$editor$quill$id._(_root);
	@override late final _Translations$editor$hud$id hud = _Translations$editor$hud$id._(_root);
	@override String get pages => 'Halaman';
	@override String get untitled => 'Tanpa judul';
	@override String get needsToSaveBeforeExiting => 'Menyimpan perubahanmu… Kamu bisa keluar dari editor dengan aman setelah selesai';
}

// Path: home.tabs
class _Translations$home$tabs$id extends Translations$home$tabs$en {
	_Translations$home$tabs$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get home => 'Beranda';
	@override String get browse => 'Jelajahi';
	@override String get whiteboard => 'Papan tulis';
	@override String get settings => 'Pengaturan';
}

// Path: home.titles
class _Translations$home$titles$id extends Translations$home$titles$en {
	_Translations$home$titles$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get home => 'Catatan terbaru';
	@override String get browse => 'Jelajahi';
	@override String get whiteboard => 'Papan tulis';
	@override String get settings => 'Pengaturan';
}

// Path: home.tooltips
class _Translations$home$tooltips$id extends Translations$home$tooltips$en {
	_Translations$home$tooltips$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Catatan baru';
	@override String get showUpdateDialog => 'Tampilkan dialog pembaruan';
	@override String get exportNote => 'Ekspor catatan';
}

// Path: home.create
class _Translations$home$create$id extends Translations$home$create$en {
	_Translations$home$create$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Catatan baru';
	@override String get importNote => 'Impor catatan';
}

// Path: home.newFolder
class _Translations$home$newFolder$id extends Translations$home$newFolder$en {
	_Translations$home$newFolder$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Folder baru';
	@override String get folderName => 'Nama folder';
	@override String get create => 'Buat';
	@override String get folderNameEmpty => 'Nama folder tidak boleh kosong';
	@override String get folderNameContainsSlash => 'Nama folder tidak boleh mengandung garis miring';
	@override String get folderNameExists => 'Folder sudah ada';
}

// Path: home.renameNote
class _Translations$home$renameNote$id extends Translations$home$renameNote$en {
	_Translations$home$renameNote$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Ganti nama catatan';
	@override String get noteName => 'Nama catatan';
	@override String get rename => 'Ganti nama';
	@override String get noteNameEmpty => 'Nama catatan tidak boleh kosong';
	@override String get noteNameExists => 'Sudah ada catatan dengan nama ini';
	@override String get noteNameForbiddenCharacters => 'Nama catatan mengandung karakter yang tidak diperbolehkan';
	@override String get noteNameReserved => 'Nama catatan ini dicadangkan oleh sistem';
}

// Path: home.moveNote
class _Translations$home$moveNote$id extends Translations$home$moveNote$en {
	_Translations$home$moveNote$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Pindahkan catatan';
	@override String moveNotes({required Object n}) => 'Pindahkan ${n} catatan';
	@override String moveName({required Object f}) => 'Pindahkan ${f}';
	@override String get move => 'Pindahkan';
	@override String renamedTo({required Object newName}) => 'Catatan akan diganti namanya menjadi ${newName}';
	@override String get multipleRenamedTo => 'Catatan berikut akan diganti namanya:';
	@override String numberRenamedTo({required Object n}) => '${n} catatan akan diganti namanya agar tidak bentrok';
}

// Path: home.deleteNoteDialog
class _Translations$home$deleteNoteDialog$id extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String deleteNotes({required Object n}) => 'Hapus ${n} catatan';
	@override String deleteName({required Object f}) => 'Hapus ${f}';
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'Hapus permanen catatan yang dipilih?',
		other: 'Hapus permanen catatan yang dipilih?',
	);
	@override String get delete => 'Hapus';
}

// Path: home.renameFolder
class _Translations$home$renameFolder$id extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Ganti nama folder';
	@override String get folderName => 'Nama folder';
	@override String get rename => 'Ganti nama';
	@override String get folderNameEmpty => 'Nama folder tidak boleh kosong';
	@override String get folderNameContainsSlash => 'Nama folder tidak boleh mengandung garis miring';
	@override String get folderNameExists => 'Sudah ada folder dengan nama ini';
}

// Path: home.deleteFolder
class _Translations$home$deleteFolder$id extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Hapus folder';
	@override String deleteName({required Object f}) => 'Hapus ${f}';
	@override String get delete => 'Hapus';
	@override String get alsoDeleteContents => 'Hapus juga semua catatan di dalam folder ini';
}

// Path: home.sort
class _Translations$home$sort$id extends Translations$home$sort$en {
	_Translations$home$sort$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get sortBy => 'Urutkan berdasarkan';
	@override String get nameAToZ => 'Nama (A-Z)';
	@override String get nameZToA => 'Nama (Z-A)';
	@override String get lastModifiedNewToOld => 'Diedit (Terbaru dulu)';
	@override String get lastModifiedOldToNew => 'Diedit (Terlama dulu)';
}

// Path: home.layout
class _Translations$home$layout$id extends Translations$home$layout$en {
	_Translations$home$layout$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get layout => 'Tata letak';
	@override String get masonryGrid => 'Grid masonry';
	@override String get simpleGrid => 'Grid sederhana';
}

// Path: sentry.consent
class _Translations$sentry$consent$id extends Translations$sentry$consent$en {
	_Translations$sentry$consent$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bantu tingkatkan Saber?';
	@override late final _Translations$sentry$consent$description$id description = _Translations$sentry$consent$description$id._(_root);
	@override late final _Translations$sentry$consent$answers$id answers = _Translations$sentry$consent$answers$id._(_root);
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$id extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get general => 'Umum';
	@override String get writing => 'Menulis';
	@override String get editor => 'Editor';
	@override String get performance => 'Performa';
	@override String get advanced => 'Lanjutan';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$id extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Bahasa';
	@override String get appTheme => 'Tema aplikasi';
	@override String get platform => 'Jenis tema';
	@override String get layoutSize => 'Jenis tata letak';
	@override String get customAccentColor => 'Warna aksen kustom';
	@override String get hyperlegibleFont => 'Font Atkinson Hyperlegible';
	@override String get shouldCheckForUpdates => 'Periksa pembaruan Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Pembaruan lebih cepat';
	@override String get allowInsecureConnections => 'Izinkan koneksi tidak aman';
	@override String get editorToolbarAlignment => 'Posisi toolbar';
	@override String get editorToolbarShowInFullscreen => 'Tampilkan toolbar di mode layar penuh';
	@override String get editorAutoInvert => 'Balik warna catatan di mode gelap';
	@override String get preferGreyscale => 'Utamakan warna abu-abu';
	@override String get maxImageSize => 'Ukuran gambar maksimum';
	@override String get autoClearWhiteboardOnExit => 'Kosongkan papan tulis otomatis';
	@override String get disableEraserAfterUse => 'Nonaktifkan penghapus otomatis';
	@override String get hideFingerDrawingToggle => 'Sembunyikan tombol menggambar dengan jari';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Nonaktifkan menggambar dengan jari otomatis';
	@override String get editorPromptRename => 'Minta ganti nama catatan baru';
	@override String get recentColorsDontSavePresets => 'Jangan simpan warna preset di warna terbaru';
	@override String get recentColorsLength => 'Jumlah warna terbaru yang disimpan';
	@override String get printPageIndicators => 'Cetak indikator halaman';
	@override String get autosave => 'Simpan otomatis';
	@override String get shapeRecognitionDelay => 'Jeda pengenalan bentuk';
	@override String get autoStraightenLines => 'Luruskan garis otomatis';
	@override String get customDataDir => 'Folder Saber kustom';
	@override String get sentry => 'Pelaporan error';
}

// Path: settings.prefDescriptions
class _Translations$settings$prefDescriptions$id extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Meningkatkan keterbacaan bagi pengguna dengan penglihatan rendah';
	@override String get allowInsecureConnections => '(Tidak disarankan) Izinkan Saber terhubung ke server dengan sertifikat yang ditandatangani sendiri/tidak tepercaya';
	@override String get preferGreyscale => 'Untuk layar e-ink';
	@override String get autoClearWhiteboardOnExit => 'Mengosongkan papan tulis setelah kamu keluar dari aplikasi';
	@override String get disableEraserAfterUse => 'Otomatis kembali ke pena setelah memakai penghapus';
	@override String get maxImageSize => 'Gambar yang lebih besar akan dikompresi';
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$id hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$id._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Matikan menggambar dengan jari saat stylus terdeteksi';
	@override String get editorPromptRename => 'Kamu selalu bisa mengganti nama catatan nanti';
	@override String get printPageIndicators => 'Tampilkan indikator halaman di hasil ekspor';
	@override String get autosave => 'Simpan otomatis setelah jeda singkat, atau tidak sama sekali';
	@override String get shapeRecognitionDelay => 'Seberapa sering pratinjau bentuk diperbarui';
	@override String get autoStraightenLines => 'Meluruskan garis panjang tanpa perlu memakai pena bentuk';
	@override String get shouldAlwaysAlertForUpdates => 'Beri tahu begitu pembaruan tersedia';
	@override late final _Translations$settings$prefDescriptions$sentry$id sentry = _Translations$settings$prefDescriptions$sentry$id._(_root);
}

// Path: settings.themeModes
class _Translations$settings$themeModes$id extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem';
	@override String get light => 'Terang';
	@override String get dark => 'Gelap';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$id extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Otomatis';
	@override String get phone => 'Ponsel';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$id extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Pilih warna';
}

// Path: settings.reset
class _Translations$settings$reset$id extends Translations$settings$reset$en {
	_Translations$settings$reset$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Atur ulang pengaturan ini?';
	@override String get button => 'Atur ulang';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$id extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Batal';
	@override String get select => 'Pilih';
	@override String get mustBeEmpty => 'Folder yang dipilih harus kosong';
	@override String get mustBeDoneSyncing => 'Pastikan sinkronisasi sudah selesai sebelum mengganti folder';
	@override String get unsupported => 'Fitur ini untuk saat ini hanya ditujukan bagi developer. Menggunakannya kemungkinan besar akan menyebabkan data hilang.';
}

// Path: login.form
class _Translations$login$form$id extends Translations$login$form$en {
	_Translations$login$form$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Dengan masuk, kamu menyetujui '),
		linkToPrivacyPolicy('Kebijakan Privasi'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _Translations$login$status$id extends Translations$login$status$en {
	_Translations$login$status$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Belum masuk';
	@override String get tapToLogin => 'Ketuk untuk masuk dengan Nextcloud';
	@override String hi({required Object u}) => 'Hai, ${u}!';
	@override String get almostDone => 'Hampir siap untuk sinkronisasi, ketuk untuk menyelesaikan proses masuk';
	@override String get loggedIn => 'Sudah masuk dengan Nextcloud';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$id extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get whereToStoreData => 'Pilih tempat menyimpan datamu:';
	@override String get saberNcServer => 'Server Nextcloud milik Saber';
	@override String get otherNcServer => 'Server Nextcloud lain';
	@override String get serverUrl => 'URL server';
	@override String get loginWithSaber => 'Masuk dengan Saber';
	@override String get loginWithNextcloud => 'Masuk dengan Nextcloud';
	@override late final _Translations$login$ncLoginStep$loginFlow$id loginFlow = _Translations$login$ncLoginStep$loginFlow$id._(_root);
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$id extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Untuk melindungi datamu, masukkan kata sandi enkripsi:';
	@override String get newToSaber => 'Baru di Saber? Cukup masukkan kata sandi enkripsi baru.';
	@override String get encPassword => 'Kata sandi enkripsi';
	@override String get encFaqTitle => 'Pertanyaan yang sering diajukan';
	@override String get wrongEncPassword => 'Dekripsi gagal dengan kata sandi tersebut. Coba masukkan lagi.';
	@override String get connectionFailed => 'Terjadi masalah saat menghubungkan ke server. Coba lagi nanti.';
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$id._(_root),
		_Translations$login$encLoginStep$encFaq$1$id._(_root),
		_Translations$login$encLoginStep$encFaq$2$id._(_root),
	];
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$id extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Beranda server';
	@override String get deleteAccount => 'Hapus akun';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$id extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get q => 'Apakah catatan saya akan hilang kalau saya keluar?';
	@override String get a => 'Tidak. Catatanmu tetap ada di perangkat maupun di server. Catatan tidak akan disinkronkan dengan server sampai kamu masuk lagi. Pastikan sinkronisasi sudah selesai sebelum keluar supaya tidak ada data yang hilang (lihat progres sinkronisasi di layar beranda).';
}

// Path: profile.faq.1
class _Translations$profile$faq$1$id extends Translations$profile$faq$1$en {
	_Translations$profile$faq$1$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get q => 'Bagaimana cara mengganti kata sandi Nextcloud?';
	@override String get a => 'Buka situs web server dan masuk. Lalu buka Pengaturan > Keamanan > Ubah kata sandi. Setelah mengganti kata sandi, kamu perlu keluar lalu masuk kembali ke Saber.';
}

// Path: profile.faq.2
class _Translations$profile$faq$2$id extends Translations$profile$faq$2$en {
	_Translations$profile$faq$2$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get q => 'Bagaimana cara mengganti kata sandi enkripsi?';
	@override String get a => '0. Pastikan sinkronisasi sudah selesai (lihat progres sinkronisasi di layar beranda).\n1. Keluar dari Saber.\n2. Buka situs web server dan hapus folder \'Saber\'. Ini akan menghapus semua catatanmu dari server.\n3. Masuk lagi ke Saber. Kamu bisa memilih kata sandi enkripsi baru saat masuk.\n4. Jangan lupa keluar dan masuk lagi ke Saber di perangkat lainmu juga.';
}

// Path: profile.faq.3
class _Translations$profile$faq$3$id extends Translations$profile$faq$3$en {
	_Translations$profile$faq$3$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get q => 'Bagaimana cara menghapus akun saya?';
	@override String get a => 'Ketuk tombol "${_root.profile.quickLinks.deleteAccount}" di atas, lalu masuk jika diminta.\nJika kamu memakai server resmi Saber, akunmu akan dihapus setelah masa tenggang 1 minggu. Selama masa ini, kamu bisa menghubungi saya di adilhanney@disroot.org untuk membatalkan penghapusan.\nJika kamu memakai server pihak ketiga, mungkin tidak ada opsi untuk menghapus akun: kamu perlu membaca kebijakan privasi server tersebut untuk informasi lebih lanjut.';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$id extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Tampilkan/sembunyikan warna (Ctrl C)';
	@override String get select => 'Pilih';
	@override String get toggleEraser => 'Aktifkan/nonaktifkan penghapus (Ctrl E)';
	@override String get photo => 'Gambar';
	@override String get text => 'Teks';
	@override String get toggleFingerDrawing => 'Aktifkan/nonaktifkan menggambar dengan jari (Ctrl F)';
	@override String get undo => 'Urungkan';
	@override String get redo => 'Ulangi';
	@override String get export => 'Ekspor (Ctrl Shift S)';
	@override String get exportAs => 'Ekspor sebagai:';
	@override String get fullscreen => 'Mode layar penuh (F11)';
}

// Path: editor.pens
class _Translations$editor$pens$id extends Translations$editor$pens$en {
	_Translations$editor$pens$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Pena tinta';
	@override String get ballpointPen => 'Pulpen';
	@override String get highlighter => 'Stabilo';
	@override String get pencil => 'Pensil';
	@override String get shapePen => 'Pena bentuk';
	@override String get laserPointer => 'Penunjuk laser';
}

// Path: editor.penOptions
class _Translations$editor$penOptions$id extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get size => 'Ukuran';
}

// Path: editor.colors
class _Translations$editor$colors$id extends Translations$editor$colors$en {
	_Translations$editor$colors$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Pemilih warna';
	@override String customBrightnessHue({required Object h, required Object b}) => 'Kustom ${h} ${b}';
	@override String customHue({required Object h}) => 'Kustom ${h}';
	@override String get dark => 'gelap';
	@override String get light => 'terang';
	@override String get black => 'Hitam';
	@override String get darkGrey => 'Abu-abu tua';
	@override String get grey => 'Abu-abu';
	@override String get lightGrey => 'Abu-abu muda';
	@override String get white => 'Putih';
	@override String get red => 'Merah';
	@override String get green => 'Hijau';
	@override String get cyan => 'Cyan';
	@override String get blue => 'Biru';
	@override String get yellow => 'Kuning';
	@override String get purple => 'Ungu';
	@override String get pink => 'Merah muda';
	@override String get orange => 'Oranye';
	@override String get pastelRed => 'Merah pastel';
	@override String get pastelOrange => 'Oranye pastel';
	@override String get pastelYellow => 'Kuning pastel';
	@override String get pastelGreen => 'Hijau pastel';
	@override String get pastelCyan => 'Cyan pastel';
	@override String get pastelBlue => 'Biru pastel';
	@override String get pastelPurple => 'Ungu pastel';
	@override String get pastelPink => 'Merah muda pastel';
}

// Path: editor.imageOptions
class _Translations$editor$imageOptions$id extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opsi gambar';
	@override String get invertible => 'Warna bisa dibalik';
	@override String get download => 'Unduh';
	@override String get setAsBackground => 'Jadikan latar belakang';
	@override String get removeAsBackground => 'Lepas dari latar belakang';
	@override String get delete => 'Hapus';
}

// Path: editor.selectionBar
class _Translations$editor$selectionBar$id extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Hapus';
	@override String get duplicate => 'Duplikat';
}

// Path: editor.menu
class _Translations$editor$menu$id extends Translations$editor$menu$en {
	_Translations$editor$menu$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Kosongkan halaman ${page}/${totalPages}';
	@override String get clearAllPages => 'Kosongkan semua halaman';
	@override String get insertPage => 'Sisipkan halaman di bawah';
	@override String get duplicatePage => 'Duplikat halaman';
	@override String get deletePage => 'Hapus halaman';
	@override String get lineHeight => 'Tinggi baris';
	@override String get lineHeightDescription => 'Juga mengatur ukuran teks untuk catatan yang diketik';
	@override String get lineThickness => 'Ketebalan garis';
	@override String get lineThicknessDescription => 'Ketebalan garis latar belakang';
	@override String get backgroundImageFit => 'Penyesuaian gambar latar';
	@override String get backgroundPattern => 'Pola latar belakang';
	@override String get import => 'Impor';
	@override String get watchServer => 'Pantau pembaruan di server';
	@override String get watchServerReadOnly => 'Pengeditan dinonaktifkan selama memantau server';
	@override late final _Translations$editor$menu$boxFits$id boxFits = _Translations$editor$menu$boxFits$id._(_root);
	@override late final _Translations$editor$menu$bgPatterns$id bgPatterns = _Translations$editor$menu$bgPatterns$id._(_root);
}

// Path: editor.readOnlyBanner
class _Translations$editor$readOnlyBanner$id extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mode baca saja';
	@override String get watchingServer => 'Saat ini kamu sedang memantau pembaruan di server. Pengeditan dinonaktifkan di mode ini.';
	@override String get corrupted => 'Gagal memuat catatan. Mungkin file-nya rusak atau masih diunduh.';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$id extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Catatan ini diedit menggunakan Saber versi yang lebih baru';
	@override String get subtitle => 'Mengedit catatan ini dapat menyebabkan sebagian informasi hilang. Abaikan peringatan ini dan tetap edit?';
	@override String get allowEditing => 'Izinkan pengeditan';
}

// Path: editor.quill
class _Translations$editor$quill$id extends Translations$editor$quill$en {
	_Translations$editor$quill$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Ketik sesuatu di sini…';
}

// Path: editor.hud
class _Translations$editor$hud$id extends Translations$editor$hud$en {
	_Translations$editor$hud$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Buka kunci zoom';
	@override String get lockZoom => 'Kunci zoom';
	@override String get unlockSingleFingerPan => 'Aktifkan geser dengan satu jari';
	@override String get lockSingleFingerPan => 'Nonaktifkan geser dengan satu jari';
	@override String get unlockAxisAlignedPan => 'Buka kunci geser ke arah horizontal atau vertikal';
	@override String get lockAxisAlignedPan => 'Kunci geser ke arah horizontal atau vertikal';
}

// Path: sentry.consent.description
class _Translations$sentry$consent$description$id extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get question => 'Mau melaporkan error tak terduga secara otomatis? Ini membantu saya menemukan dan memperbaiki masalah lebih cepat.';
	@override String get scope => 'Laporan bisa berisi informasi tentang error dan perangkatmu. Saya sudah berusaha semaksimal mungkin menyaring data pribadi, tetapi mungkin masih ada yang tersisa.';
	@override String get currentlyOff => 'Jika kamu memberi izin, pelaporan error akan aktif setelah aplikasi dimulai ulang.';
	@override String get currentlyOn => 'Jika kamu mencabut izin, mulai ulang aplikasi untuk menonaktifkan pelaporan error.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Pelajari selengkapnya di '),
		link('kebijakan privasi'),
		const TextSpan(text: '.'),
	]);
}

// Path: sentry.consent.answers
class _Translations$sentry$consent$answers$id extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Ya';
	@override String get no => 'Tidak';
	@override String get later => 'Tanya nanti';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$id extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Mencegah tombol tersentuh tanpa sengaja';
	@override String get fixedOn => 'Menggambar dengan jari selalu aktif';
	@override String get fixedOff => 'Menggambar dengan jari selalu nonaktif';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$id extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get active => 'Aktif';
	@override String get inactive => 'Nonaktif';
	@override String get activeUntilRestart => 'Aktif sampai aplikasi dimulai ulang';
	@override String get inactiveUntilRestart => 'Nonaktif sampai aplikasi dimulai ulang';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$id extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Izinkan Saber mengakses akun Nextcloud-mu';
	@override String get followPrompts => 'Ikuti petunjuk yang muncul di antarmuka Nextcloud';
	@override String get browserDidntOpen => 'Halaman masuk tidak terbuka? Klik di sini';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$id extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get q => 'Apa itu kata sandi enkripsi? Kenapa harus pakai dua kata sandi?';
	@override String get a => 'Kata sandi Nextcloud dipakai untuk mengakses cloud. Kata sandi enkripsi "mengacak" datamu sebelum sampai ke cloud.\nBahkan kalau ada yang berhasil masuk ke akun Nextcloud-mu, catatanmu tetap aman karena dienkripsi dengan kata sandi yang terpisah. Ini memberimu lapisan keamanan kedua untuk melindungi datamu.\nTidak ada yang bisa mengakses catatanmu di server tanpa kata sandi enkripsi, tetapi ini juga berarti kalau kamu lupa kata sandi enkripsi, kamu akan kehilangan akses ke datamu.';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$id extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get q => 'Saya belum mengatur kata sandi enkripsi. Dari mana saya mendapatkannya?';
	@override String get a => 'Pilih kata sandi enkripsi baru, lalu masukkan di atas.\nSaber akan membuat kunci enkripsimu secara otomatis dari kata sandi tersebut.';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$id extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get q => 'Bolehkah memakai kata sandi yang sama dengan akun Nextcloud saya?';
	@override String get a => 'Boleh, tetapi ingat bahwa administrator server atau orang lain akan lebih mudah mengakses catatanmu kalau mereka berhasil masuk ke akun Nextcloud-mu.';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$id extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Regangkan';
	@override String get cover => 'Penuhi';
	@override String get contain => 'Muat';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$id extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$id._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get none => 'Kosong';
	@override String get college => 'Buku kuliah';
	@override String get collegeRtl => 'Buku kuliah (terbalik)';
	@override String get lined => 'Bergaris';
	@override String get grid => 'Kotak-kotak';
	@override String get dots => 'Titik-titik';
	@override String get staffs => 'Paranada';
	@override String get tablature => 'Tablatur';
	@override String get cornell => 'Cornell';
}
