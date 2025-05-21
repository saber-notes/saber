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
class TranslationsEs extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonEs common = _TranslationsCommonEs._(_root);
	@override late final _TranslationsHomeEs home = _TranslationsHomeEs._(_root);
	@override late final _TranslationsSettingsEs settings = _TranslationsSettingsEs._(_root);
	@override late final _TranslationsLogsEs logs = _TranslationsLogsEs._(_root);
	@override late final _TranslationsLoginEs login = _TranslationsLoginEs._(_root);
	@override late final _TranslationsProfileEs profile = _TranslationsProfileEs._(_root);
	@override late final _TranslationsAppInfoEs appInfo = _TranslationsAppInfoEs._(_root);
	@override late final _TranslationsUpdateEs update = _TranslationsUpdateEs._(_root);
	@override late final _TranslationsEditorEs editor = _TranslationsEditorEs._(_root);
}

// Path: common
class _TranslationsCommonEs extends TranslationsCommonEn {
	_TranslationsCommonEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Cancelar';
	@override String get done => 'Hecho';
	@override String get continueBtn => 'Continuar';
}

// Path: home
class _TranslationsHomeEs extends TranslationsHomeEn {
	_TranslationsHomeEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsEs tabs = _TranslationsHomeTabsEs._(_root);
	@override late final _TranslationsHomeTitlesEs titles = _TranslationsHomeTitlesEs._(_root);
	@override late final _TranslationsHomeTooltipsEs tooltips = _TranslationsHomeTooltipsEs._(_root);
	@override late final _TranslationsHomeCreateEs create = _TranslationsHomeCreateEs._(_root);
	@override String get welcome => 'Te damos la bienvenida a Saber';
	@override String get invalidFormat => 'El archivo que seleccionaste no es válido. Por favor, selecciona un archivo .sbn, .sbn2, .sba or .pdf.';
	@override String get noFiles => 'No se ha encontrado ninguna nota';
	@override String get noPreviewAvailable => 'No hay una vista previa disponible';
	@override String get createNewNote => 'Presiona el botón + para crear una nueva nota';
	@override String get backFolder => 'Volver a la carpeta anterior';
	@override late final _TranslationsHomeNewFolderEs newFolder = _TranslationsHomeNewFolderEs._(_root);
	@override late final _TranslationsHomeRenameNoteEs renameNote = _TranslationsHomeRenameNoteEs._(_root);
	@override late final _TranslationsHomeMoveNoteEs moveNote = _TranslationsHomeMoveNoteEs._(_root);
	@override String get deleteNote => 'Eliminar nota';
	@override late final _TranslationsHomeRenameFolderEs renameFolder = _TranslationsHomeRenameFolderEs._(_root);
	@override late final _TranslationsHomeDeleteFolderEs deleteFolder = _TranslationsHomeDeleteFolderEs._(_root);
}

// Path: settings
class _TranslationsSettingsEs extends TranslationsSettingsEn {
	_TranslationsSettingsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesEs prefCategories = _TranslationsSettingsPrefCategoriesEs._(_root);
	@override late final _TranslationsSettingsPrefLabelsEs prefLabels = _TranslationsSettingsPrefLabelsEs._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsEs prefDescriptions = _TranslationsSettingsPrefDescriptionsEs._(_root);
	@override late final _TranslationsSettingsThemeModesEs themeModes = _TranslationsSettingsThemeModesEs._(_root);
	@override late final _TranslationsSettingsLayoutSizesEs layoutSizes = _TranslationsSettingsLayoutSizesEs._(_root);
	@override late final _TranslationsSettingsAccentColorPickerEs accentColorPicker = _TranslationsSettingsAccentColorPickerEs._(_root);
	@override String get systemLanguage => 'Idioma del sistema';
	@override List<String> get axisDirections => [
		'Arriba',
		'Derecha',
		'Abajo',
		'Izquierda',
	];
	@override late final _TranslationsSettingsResetEs reset = _TranslationsSettingsResetEs._(_root);
	@override late final _TranslationsSettingsCustomDataDirEs customDataDir = _TranslationsSettingsCustomDataDirEs._(_root);
	@override String get openDataDir => 'Abrir carpeta Saber';
	@override String get resyncEverything => 'Resync todo';
}

// Path: logs
class _TranslationsLogsEs extends TranslationsLogsEn {
	_TranslationsLogsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Registros';
	@override String get viewLogs => 'Ver registros';
	@override String get debuggingInfo => 'Los registros contienen información útil para la depuración y el desarrollo.';
	@override String get noLogs => '¡Aquí no hay registros!';
	@override String get logsAreTemporary => 'Los registros solo se conservan hasta que cierras la aplicación.';
}

// Path: login
class _TranslationsLoginEs extends TranslationsLoginEn {
	_TranslationsLoginEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Iniciar sesión';
	@override late final _TranslationsLoginFormEs form = _TranslationsLoginFormEs._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: '¿Aún no tienes una cuenta? '),
		linkToSignup('Regístrate ahora'),
	]);
	@override late final _TranslationsLoginStatusEs status = _TranslationsLoginStatusEs._(_root);
	@override late final _TranslationsLoginNcLoginStepEs ncLoginStep = _TranslationsLoginNcLoginStepEs._(_root);
	@override late final _TranslationsLoginEncLoginStepEs encLoginStep = _TranslationsLoginEncLoginStepEs._(_root);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		undoLogin('No tú'),
	]);
}

// Path: profile
class _TranslationsProfileEs extends TranslationsProfileEn {
	_TranslationsProfileEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mi perfil';
	@override String get logout => 'Cerrar sesión';
	@override late final _TranslationsProfileQuickLinksEs quickLinks = _TranslationsProfileQuickLinksEs._(_root);
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$Es._(_root),
		_TranslationsProfile$faq$0i1$Es._(_root),
		_TranslationsProfile$faq$0i2$Es._(_root),
		_TranslationsProfile$faq$0i3$Es._(_root),
	];
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Estás usando ${used} de ${total} (${percent}%)';
	@override String get connectedTo => 'Conectado a';
	@override String get faqTitle => 'Preguntas frecuentes';
}

// Path: appInfo
class _TranslationsAppInfoEs extends TranslationsAppInfoEn {
	_TranslationsAppInfoEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nEste programa no tiene ninguna garantía. Es un software libre, y se puede redistribuir bajo ciertas condiciones.';
	@override String get dirty => 'DIRTY';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Toca aquí para patrocinarme o comprar más almacenamiento';
	@override String get licenseButton => 'Toca aquí para ver más información sobre la licencia';
	@override String get privacyPolicyButton => 'Toca aquí para ver nuestra política de privacidad';
}

// Path: update
class _TranslationsUpdateEs extends TranslationsUpdateEn {
	_TranslationsUpdateEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Actualización disponible';
	@override String get updateAvailableDescription => 'Hay una nueva versión de la aplicación disponible. Novedades en esta versión:';
	@override String get update => 'Actualizar';
	@override String get downloadNotAvailableYet => 'La descarga aún no está disponible para su plataforma. Vuelve a consultar en breve.';
}

// Path: editor
class _TranslationsEditorEs extends TranslationsEditorEn {
	_TranslationsEditorEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarEs toolbar = _TranslationsEditorToolbarEs._(_root);
	@override late final _TranslationsEditorPensEs pens = _TranslationsEditorPensEs._(_root);
	@override late final _TranslationsEditorPenOptionsEs penOptions = _TranslationsEditorPenOptionsEs._(_root);
	@override late final _TranslationsEditorColorsEs colors = _TranslationsEditorColorsEs._(_root);
	@override late final _TranslationsEditorImageOptionsEs imageOptions = _TranslationsEditorImageOptionsEs._(_root);
	@override late final _TranslationsEditorSelectionBarEs selectionBar = _TranslationsEditorSelectionBarEs._(_root);
	@override late final _TranslationsEditorMenuEs menu = _TranslationsEditorMenuEs._(_root);
	@override late final _TranslationsEditorNewerFileFormatEs newerFileFormat = _TranslationsEditorNewerFileFormatEs._(_root);
	@override late final _TranslationsEditorQuillEs quill = _TranslationsEditorQuillEs._(_root);
	@override late final _TranslationsEditorHudEs hud = _TranslationsEditorHudEs._(_root);
	@override String get pages => 'Páginas';
	@override String get untitled => 'Sin título';
	@override String get needsToSaveBeforeExiting => 'Guardando los cambios... Puedes salir del editor de forma segura cuando se haya guardado todo';
}

// Path: home.tabs
class _TranslationsHomeTabsEs extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Inicio';
	@override String get browse => 'Explorar';
	@override String get whiteboard => 'Pizarra';
	@override String get settings => 'Configuración';
}

// Path: home.titles
class _TranslationsHomeTitlesEs extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Notas recientes';
	@override String get browse => 'Navegar';
	@override String get whiteboard => 'Pizarra';
	@override String get settings => 'Configuración';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsEs extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Crear nota';
	@override String get showUpdateDialog => 'Mostrar cuadro de diálogo de actualizaciónes';
	@override String get exportNote => 'Exportar nota';
}

// Path: home.create
class _TranslationsHomeCreateEs extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nueva nota';
	@override String get importNote => 'Importar nota';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderEs extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Nueva carpeta';
	@override String get folderName => 'Nombre de la carpeta';
	@override String get create => 'Crear';
	@override String get folderNameEmpty => 'El nombre de la carpeta no puede estar vacío';
	@override String get folderNameContainsSlash => 'El nombre de la carpeta no puede contener una barra vertical';
	@override String get folderNameExists => 'Ya existe una carpeta con este nombre';
}

// Path: home.renameNote
class _TranslationsHomeRenameNoteEs extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Renombrar nota';
	@override String get noteName => 'Nombre de la nota';
	@override String get rename => 'Renombrar';
	@override String get noteNameEmpty => 'El nombre de la nota no puede estar vacío';
	@override String get noteNameContainsSlash => 'El nombre de la nota no puede contener una barra vertical';
	@override String get noteNameExists => 'Ya existe una nota con este nombre';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteEs extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Mover nota';
	@override String moveNotes({required Object n}) => 'Mover ${n} notas';
	@override String moveName({required Object f}) => 'Mover ${f}';
	@override String get move => 'Mover';
	@override String renamedTo({required Object newName}) => 'Se renombrará la nota a ${newName}';
	@override String get multipleRenamedTo => 'Renombrar las siguientes notas';
	@override String numberRenamedTo({required Object n}) => '${n} notas serán renombradas para evitar conflictos';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderEs extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Renombrar carpeta';
	@override String get folderName => 'Nombre de la carpeta';
	@override String get rename => 'Renombrar';
	@override String get folderNameEmpty => 'El nombre de la carpeta no puede estar vacío';
	@override String get folderNameContainsSlash => 'El nombre de la carpeta no puede contener una barra (/)';
	@override String get folderNameExists => 'Ya existe una carpeta con este nombre';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderEs extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Eliminar carpeta';
	@override String deleteName({required Object f}) => 'Eliminar ${f}';
	@override String get delete => 'Eliminar';
	@override String get alsoDeleteContents => 'Eliminar también las notas guardadas dentro de la carpeta';
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesEs extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get general => 'General';
	@override String get writing => 'Escritura';
	@override String get editor => 'Editor';
	@override String get advanced => 'Avanzado';
	@override String get performance => 'Actuación';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsEs extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Idioma de la aplicación';
	@override String get appTheme => 'Tema de la aplicación';
	@override String get platform => 'Tipo de tema';
	@override String get layoutSize => 'Tipo de disposición';
	@override String get customAccentColor => 'Color de acento personalizado';
	@override String get hyperlegibleFont => 'Fuente hiperlegible';
	@override String get shouldCheckForUpdates => 'Buscar actualizaciones de Saber automáticamente';
	@override String get shouldAlwaysAlertForUpdates => 'Actualizaciones más rápidas';
	@override String get allowInsecureConnections => 'Permitir conexiones inseguras';
	@override String get editorToolbarAlignment => 'Alineación de la barra de herramientas del editor';
	@override String get editorToolbarShowInFullscreen => 'Mostrar la barra de herramientas del editor en el modo de pantalla completa';
	@override String get editorAutoInvert => 'Invertir notas en el modo oscuro';
	@override String get preferGreyscale => 'Preferir colores en escala de grises';
	@override String get maxImageSize => 'Tamaño máximo de la imagen';
	@override String get autoClearWhiteboardOnExit => 'Borrar la pizarra después de salir de la aplicación';
	@override String get disableEraserAfterUse => 'Desactivar automáticamente la goma de borrar';
	@override String get hideFingerDrawingToggle => 'Ocultar la opción para activar/desactivar la escritura con el dedo';
	@override String get editorPromptRename => 'Solicitarte cambiar el nombre de nuevas notas';
	@override String get hideHomeBackgrounds => 'Ocultar fondos en la pantalla de inicio';
	@override String get recentColorsDontSavePresets => 'No guardar colores preestablecidos en los colores recientes';
	@override String get recentColorsLength => 'Número de colores recientes a almacenar';
	@override String get printPageIndicators => 'Indicadores de página de impresión';
	@override String get autosaveDelay => 'Retardo en el autoguardado';
	@override String get simplifiedHomeLayout => 'Disposición simplificada de la casa';
	@override String get pencilSoundSetting => 'Efecto de sonido de lápiz';
	@override String get customDataDir => 'Directorio de datos personalizado';
	@override String get autoStraightenLines => 'Líneas de enderezamiento automático';
	@override String get shapeRecognitionDelay => 'Retraso en el reconocimiento de formas';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsEs extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible aumenta la legibilidad para lectores con poca visión';
	@override String get allowInsecureConnections => '(No recomendado) Autorizar a Saber a conectarse a servidores con certificados autofirmados o no fiables';
	@override String get preferGreyscale => 'Para pantallas con tinta electrónica';
	@override String get autoClearWhiteboardOnExit => 'Aún se sincronizará con tus otros dispositivos';
	@override String get disableEraserAfterUse => 'Volver automáticamente al bolígrafo tras usar la goma';
	@override String get maxImageSize => 'Las imágenes más grandes que este valor serán comprimidas';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingEs hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingEs._(_root);
	@override String get editorPromptRename => 'Siempre puedes cambiar el nombre de las notas más tarde';
	@override String get hideHomeBackgrounds => 'Para una vista más limpia';
	@override String get printPageIndicators => 'Mostrar indicadores de página en las exportaciones';
	@override String get autosaveDelay => 'Cuánto esperar antes de autoguardar una nota';
	@override String get shouldAlwaysAlertForUpdates => 'Avísame sobre actualizaciones tan pronto como estén disponibles';
	@override late final _TranslationsSettingsPrefDescriptionsPencilSoundSettingEs pencilSoundSetting = _TranslationsSettingsPrefDescriptionsPencilSoundSettingEs._(_root);
	@override String get simplifiedHomeLayout => 'Establece una altura fija para cada vista previa de nota';
	@override String get autoStraightenLines => 'Endereza líneas largas sin tener que usar el rotulador.';
	@override String get shapeRecognitionDelay => 'Con qué frecuencia actualizar la vista previa de la forma';
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesEs extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get light => 'Claro';
	@override String get dark => 'Oscuro';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesEs extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Auto';
	@override String get phone => 'Teléfono';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerEs extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Elegir un color';
}

// Path: settings.reset
class _TranslationsSettingsResetEs extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '¿Quieres restablecer esta configuración?';
	@override String get button => 'Restablecer';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirEs extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Cancelar';
	@override String get select => 'Seleccionar';
	@override String get mustBeEmpty => 'El directorio seleccionado debe estar vacío.';
	@override String get mustBeDoneSyncing => 'Asegúrese de que la sincronización esté completa antes de cambiar el directorio';
}

// Path: login.form
class _TranslationsLoginFormEs extends TranslationsLoginFormEn {
	_TranslationsLoginFormEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Al iniciar sesión, aceptas nuestra '),
		linkToPrivacyPolicy('Política de privacidad'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusEs extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Desconectado';
	@override String get tapToLogin => 'Toca para iniciar sesión con Nextcloud';
	@override String get loggedIn => 'Sesión iniciada con Nextcloud';
	@override String hi({required Object u}) => 'Hola ${u}!';
	@override String get almostDone => 'Casi listo para sincronizar, toca para finalizar el inicio de sesión';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepEs extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsLoginNcLoginStepLoginFlowEs loginFlow = _TranslationsLoginNcLoginStepLoginFlowEs._(_root);
	@override String get whereToStoreData => 'Elige dónde quieres almacenar tus datos:';
	@override String get saberNcServer => 'Servidor Nextcloud de Saber';
	@override String get otherNcServer => 'Otro servidor Nextcloud';
	@override String get serverUrl => 'URL del servidor';
	@override String get loginWithSaber => 'Iniciar sesión con Saber';
	@override String get loginWithNextcloud => 'Iniciar sesión con Nextcloud';
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepEs extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Para proteger sus datos, ingrese su contraseña de cifrado:';
	@override String get newToSaber => 'Nuevo en Saber';
	@override String get encPassword => 'Contraseña de cifrado';
	@override String get encFaqTitle => 'Preguntas frecuentes';
	@override String get wrongEncPassword => 'El descifrado falló con la contraseña proporcionada. Intente ingresarlo nuevamente.';
	@override String get connectionFailed => 'Algo salió mal al conectarse al servidor. Por favor, inténtelo de nuevo más tarde.';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$Es._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$Es._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$Es._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksEs extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Página de inicio del servidor';
	@override String get deleteAccount => 'Eliminar cuenta';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$Es extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$Es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Pierdo mis notas si cierro sesión?';
	@override String get a => 'No. Tus notas permanecerán tanto en tu dispositivo como en el servidor. Solo no se sincronizarán con el servidor hasta que vuelvas a iniciar sesión. Asegúrate de que la sincronización se completó antes de cerrar la sesión para asegurarte de que no pierdes nada (puedes ver el progreso en la pantalla de inicio).';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$Es extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$Es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Cómo puedo cambiar mi contraseña de Nextcloud?';
	@override String get a => 'Accede a la web de tu servidor e inicia sesión. Luego, accede a Ajustes > Seguridad > Cambiar contraseña. Necesitarás cerrar la sesión e iniciarla de nuevo en Saber tras cambiar la contraseña.';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$Es extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$Es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Cómo cambio mi contraseña de cifrado?';
	@override String get a => '1. Cierra la sesión en Saber. Asegúrate de que la sincronización se completó antes de cerrar la sesión para asegurarte de que no pierdes nada (puedes ver el progreso en la pantalla de inicio).\n2. Accede a la web de tu servidor y elimina la carpeta \'Saber\'. Esto eliminará todas las notas del servidor.\n3. Inicia sesión de nuevo en Saber. Puedes elegir una nueva contraseña de cifrado al iniciar la sesión.\n4. No te olvides de cerrar e iniciar la sesión de Saber de nuevo en el resto de tus dispositivos.';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$Es extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$Es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Cómo puedo eliminar mi cuenta?';
	@override String get a => 'Pincha en el botón "${_root.profile.quickLinks.deleteAccount}", e inicia sesión si es necesario.\nSi estás usando el servidor oficial de Saber, tu cuenta se eliminará después de un periodo de una semana. Puedes contactar conmigo en la dirección adilhanney@disroot.org durante este tiempo para cancelar la eliminación.\nSi estás usando un servidor de terceros, puede ser que la opción de eliminar no exista: necesitas consultar la política de privacidad del servidor para más información.';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarEs extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Paleta de colores (Ctrl C)';
	@override String get select => 'Seleccionar';
	@override String get toggleEraser => 'Borrar (Ctrl E)';
	@override String get photo => 'Foto';
	@override String get text => 'Texto';
	@override String get toggleFingerDrawing => 'Dibujar con el dedo (Ctrl F)';
	@override String get undo => 'Deshacer';
	@override String get redo => 'Rehacer';
	@override String get export => 'Exportar (Ctrl Shift S)';
	@override String get exportAs => 'Exportar cómo:';
	@override String get fullscreen => 'Pantalla completa (F11)';
}

// Path: editor.pens
class _TranslationsEditorPensEs extends TranslationsEditorPensEn {
	_TranslationsEditorPensEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get ballpointPen => 'Bolígrafo';
	@override String get highlighter => 'Resaltador';
	@override String get shapePen => 'Bolígrafo con formas';
	@override String get laserPointer => 'Puntero láser';
	@override String get fountainPen => 'Estilográfica';
	@override String get pencil => 'Lápiz';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsEs extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get size => 'Tamaño';
}

// Path: editor.colors
class _TranslationsEditorColorsEs extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Selector de color';
	@override String customHue({required Object h}) => '${h} personalizado';
	@override String get dark => 'oscuro';
	@override String get light => 'claro';
	@override String get black => 'Negro';
	@override String get darkGrey => 'Gris oscuro';
	@override String get grey => 'Gris';
	@override String get lightGrey => 'Gris claro';
	@override String get white => 'Blanco';
	@override String get red => 'Rojo';
	@override String get green => 'Verde';
	@override String get cyan => 'Cyan';
	@override String get blue => 'Azul';
	@override String get yellow => 'Amarillo';
	@override String get purple => 'Morado';
	@override String get pink => 'Rosa';
	@override String get orange => 'Naranja';
	@override String get pastelRed => 'Rojo pastel';
	@override String get pastelOrange => 'Naranja pastel';
	@override String get pastelYellow => 'Amarillo pastel';
	@override String get pastelGreen => 'Verde pastel';
	@override String get pastelCyan => 'Azul cyan pastel';
	@override String get pastelBlue => 'Azul pastel';
	@override String get pastelPurple => 'Morado pastel';
	@override String get pastelPink => 'Rosa pastel';
	@override String customBrightnessHue({required Object h, required Object b}) => '${h} ${b} personalizado';
}

// Path: editor.imageOptions
class _TranslationsEditorImageOptionsEs extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opciones de imagen';
	@override String get invertible => 'Invertible';
	@override String get download => 'Descargar';
	@override String get setAsBackground => 'Usar como fondo';
	@override String get removeAsBackground => 'Eliminar como fondo';
	@override String get delete => 'Eliminar';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarEs extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Eliminar';
	@override String get duplicate => 'Duplicar';
}

// Path: editor.menu
class _TranslationsEditorMenuEs extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Eliminar páginas ${page}/${totalPages}';
	@override String get clearAllPages => 'Borrar todas las páginas';
	@override String get insertPage => 'Insertar página debajo';
	@override String get duplicatePage => 'Duplicar página';
	@override String get deletePage => 'Eliminar página';
	@override String get lineHeight => 'Altura de la línea';
	@override String get backgroundImageFit => 'Ajuste de la imagen de fondo';
	@override String get backgroundPattern => 'Patrón de fondo';
	@override String get import => 'Importar';
	@override late final _TranslationsEditorMenuBoxFitsEs boxFits = _TranslationsEditorMenuBoxFitsEs._(_root);
	@override late final _TranslationsEditorMenuBgPatternsEs bgPatterns = _TranslationsEditorMenuBgPatternsEs._(_root);
	@override String get lineThickness => 'Espesor de línea';
	@override String get lineThicknessDescription => 'Grosor de la línea de fondo';
	@override String get watchServer => 'Esté atento a las actualizaciones en el servidor.';
	@override String get watchServerReadOnly => 'La edición está deshabilitada mientras se mira el servidor.';
	@override String get lineHeightDescription => 'También controla el tamaño del texto de las notas escritas.';
}

// Path: editor.newerFileFormat
class _TranslationsEditorNewerFileFormatEs extends TranslationsEditorNewerFileFormatEn {
	_TranslationsEditorNewerFileFormatEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Modo de solo lectura';
	@override String get title => 'Esta nota fue editada usando una versión más reciente de Saber';
	@override String get subtitle => 'La edición de esta nota puede resultar en la pérdida de cierta información. ¿Quieres ignorar esto y editarlo de todos modos?';
	@override String get allowEditing => 'Editar';
}

// Path: editor.quill
class _TranslationsEditorQuillEs extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Escribe algo aquí...';
}

// Path: editor.hud
class _TranslationsEditorHudEs extends TranslationsEditorHudEn {
	_TranslationsEditorHudEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Desbloquear zoom';
	@override String get lockZoom => 'Bloquear zoom';
	@override String get unlockSingleFingerPan => 'Habilitar la panorámica con un solo dedo';
	@override String get lockSingleFingerPan => 'Deshabilitar la panorámica con un solo dedo';
	@override String get unlockAxisAlignedPan => 'Desbloquear el desplazamiento a horizontal o vertical';
	@override String get lockAxisAlignedPan => 'Bloquear el desplazamiento a horizontal o vertical';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingEs extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Evita cambios accidentales';
	@override String get fixedOn => 'Dibujar o escribir con el dedo está activado';
	@override String get fixedOff => 'Dibujar o escribir con el dedo está desactivado';
}

// Path: settings.prefDescriptions.pencilSoundSetting
class _TranslationsSettingsPrefDescriptionsPencilSoundSettingEs extends TranslationsSettingsPrefDescriptionsPencilSoundSettingEn {
	_TranslationsSettingsPrefDescriptionsPencilSoundSettingEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get off => 'Sin sonido';
	@override String get onButNotInSilentMode => 'Habilitado (a menos que esté en modo silencioso)';
	@override String get onAlways => 'Habilitado (incluso en modo silencioso)';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowEs extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Autorice a Saber a acceder a su cuenta de Nextcloud';
	@override String get followPrompts => 'Siga las indicaciones en su navegador.';
	@override String get browserDidntOpen => 'El navegador no se abrió';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$Es extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$Es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Qué es la contraseña de cifrado?';
	@override String get a => 'La contraseña de cifrado se utiliza para cifrar tus datos antes de enviarlos al servidor. La eliges cuando inicias sesión por primera vez en Saber, y no está relacionada con tu cuenta/contraseña de Nextcloud.\nNadie puede acceder a tus notas en el servidor sin tu contraseña de cifrado. Esto significa que si olvidas tu contraseña de cifrado, perderás el acceso a tus datos.';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$Es extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$Es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Por qué usar dos contraseñas?';
	@override String get a => 'La contraseña de Nextcloud se utiliza para acceder a la nube. La contraseña de encriptación "codifica" tus datos antes de que lleguen a la nube.\nIncluso si alguien obtiene acceso a tu cuenta de Nextcloud, tus notas permanecerán seguras y encriptadas con una contraseña separada. Esto te proporciona una segunda capa de seguridad para proteger tus datos.';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$Es extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$Es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get q => '¿Puedo usar la misma contraseña para ambos?';
	@override String get a => 'Sí, pero hacer esto es menos seguro. Dado que tu contraseña de Nextcloud se envía al servidor, alguien con acceso al servidor podría descifrar tus notas. Solo usa la misma contraseña si confías en el propietario del servidor.';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsEs extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Llenar';
	@override String get cover => 'Cubrir';
	@override String get contain => 'Contener';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsEs extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get none => 'En blanco';
	@override String get college => 'Rayado universitario';
	@override String get collegeRtl => 'Rayado universitario (inverso)';
	@override String get lined => 'Rayado';
	@override String get grid => 'Cuadrículado';
	@override String get dots => 'Punteado';
	@override String get staffs => 'Pentagrama';
	@override String get tablature => 'Tablatura';
	@override String get cornell => 'Método Cornell';
}
