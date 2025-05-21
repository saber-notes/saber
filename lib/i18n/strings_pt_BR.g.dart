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
class TranslationsPtBr extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPtBr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ptBr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <pt-BR>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsPtBr _root = this; // ignore: unused_field

	@override 
	TranslationsPtBr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPtBr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonPtBr common = _TranslationsCommonPtBr._(_root);
	@override late final _TranslationsHomePtBr home = _TranslationsHomePtBr._(_root);
	@override late final _TranslationsSettingsPtBr settings = _TranslationsSettingsPtBr._(_root);
	@override late final _TranslationsLogsPtBr logs = _TranslationsLogsPtBr._(_root);
	@override late final _TranslationsLoginPtBr login = _TranslationsLoginPtBr._(_root);
	@override late final _TranslationsProfilePtBr profile = _TranslationsProfilePtBr._(_root);
	@override late final _TranslationsAppInfoPtBr appInfo = _TranslationsAppInfoPtBr._(_root);
	@override late final _TranslationsUpdatePtBr update = _TranslationsUpdatePtBr._(_root);
	@override late final _TranslationsEditorPtBr editor = _TranslationsEditorPtBr._(_root);
}

// Path: common
class _TranslationsCommonPtBr extends TranslationsCommonEn {
	_TranslationsCommonPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Cancelar';
	@override String get done => 'Feito';
	@override String get continueBtn => 'Continuar';
}

// Path: home
class _TranslationsHomePtBr extends TranslationsHomeEn {
	_TranslationsHomePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsPtBr tabs = _TranslationsHomeTabsPtBr._(_root);
	@override late final _TranslationsHomeTitlesPtBr titles = _TranslationsHomeTitlesPtBr._(_root);
	@override late final _TranslationsHomeTooltipsPtBr tooltips = _TranslationsHomeTooltipsPtBr._(_root);
	@override late final _TranslationsHomeCreatePtBr create = _TranslationsHomeCreatePtBr._(_root);
	@override String get welcome => 'Bem-vindo(a) ao Saber';
	@override String get invalidFormat => 'O arquivo que você selecionou não é suportado. Por favor selecione um arquivo .sbn, .sbn2, .sba ou .pdf.';
	@override String get noFiles => 'Nenhum arquivo encontrado';
	@override String get noPreviewAvailable => 'Nenhuma visualização disponível';
	@override String get createNewNote => 'Toque no botão + para criar uma nova nota';
	@override String get backFolder => 'Retornar para a pasta anterior';
	@override late final _TranslationsHomeNewFolderPtBr newFolder = _TranslationsHomeNewFolderPtBr._(_root);
	@override late final _TranslationsHomeRenameNotePtBr renameNote = _TranslationsHomeRenameNotePtBr._(_root);
	@override late final _TranslationsHomeMoveNotePtBr moveNote = _TranslationsHomeMoveNotePtBr._(_root);
	@override String get deleteNote => 'Apagar nota';
	@override late final _TranslationsHomeRenameFolderPtBr renameFolder = _TranslationsHomeRenameFolderPtBr._(_root);
	@override late final _TranslationsHomeDeleteFolderPtBr deleteFolder = _TranslationsHomeDeleteFolderPtBr._(_root);
}

// Path: settings
class _TranslationsSettingsPtBr extends TranslationsSettingsEn {
	_TranslationsSettingsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesPtBr prefCategories = _TranslationsSettingsPrefCategoriesPtBr._(_root);
	@override late final _TranslationsSettingsPrefLabelsPtBr prefLabels = _TranslationsSettingsPrefLabelsPtBr._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsPtBr prefDescriptions = _TranslationsSettingsPrefDescriptionsPtBr._(_root);
	@override late final _TranslationsSettingsThemeModesPtBr themeModes = _TranslationsSettingsThemeModesPtBr._(_root);
	@override late final _TranslationsSettingsLayoutSizesPtBr layoutSizes = _TranslationsSettingsLayoutSizesPtBr._(_root);
	@override late final _TranslationsSettingsAccentColorPickerPtBr accentColorPicker = _TranslationsSettingsAccentColorPickerPtBr._(_root);
	@override String get systemLanguage => 'Idioma do sistema';
	@override List<String> get axisDirections => [
		'Em cima',
		'Direita',
		'Embaixo',
		'Esquerda',
	];
	@override late final _TranslationsSettingsResetPtBr reset = _TranslationsSettingsResetPtBr._(_root);
	@override late final _TranslationsSettingsCustomDataDirPtBr customDataDir = _TranslationsSettingsCustomDataDirPtBr._(_root);
	@override String get openDataDir => 'Abra a pasta Saber';
	@override String get resyncEverything => 'Resync tudo';
}

// Path: logs
class _TranslationsLogsPtBr extends TranslationsLogsEn {
	_TranslationsLogsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Registros';
	@override String get viewLogs => 'Ver logs';
	@override String get debuggingInfo => 'Os logs contêm informações úteis para depuração e desenvolvimento';
	@override String get noLogs => 'Nenhum registro aqui!';
	@override String get logsAreTemporary => 'Os registros são mantidos somente até você fechar o aplicativo';
}

// Path: login
class _TranslationsLoginPtBr extends TranslationsLoginEn {
	_TranslationsLoginPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Login';
	@override late final _TranslationsLoginFormPtBr form = _TranslationsLoginFormPtBr._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Ainda não tem uma conta? '),
		linkToSignup('Registre-se agora'),
		const TextSpan(text: '!'),
	]);
	@override late final _TranslationsLoginStatusPtBr status = _TranslationsLoginStatusPtBr._(_root);
	@override late final _TranslationsLoginNcLoginStepPtBr ncLoginStep = _TranslationsLoginNcLoginStepPtBr._(_root);
	@override late final _TranslationsLoginEncLoginStepPtBr encLoginStep = _TranslationsLoginEncLoginStepPtBr._(_root);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		undoLogin('Você não'),
	]);
}

// Path: profile
class _TranslationsProfilePtBr extends TranslationsProfileEn {
	_TranslationsProfilePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Meu perfil';
	@override String get logout => 'Sair';
	@override late final _TranslationsProfileQuickLinksPtBr quickLinks = _TranslationsProfileQuickLinksPtBr._(_root);
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$PtBr._(_root),
		_TranslationsProfile$faq$0i1$PtBr._(_root),
		_TranslationsProfile$faq$0i2$PtBr._(_root),
		_TranslationsProfile$faq$0i3$PtBr._(_root),
	];
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Você está usando ${used} de ${total} (${percent}%)';
	@override String get connectedTo => 'Conectado a';
	@override String get faqTitle => 'Perguntas frequentes';
}

// Path: appInfo
class _TranslationsAppInfoPtBr extends TranslationsAppInfoEn {
	_TranslationsAppInfoPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nEste programa vem sem absolutamente nenhuma garantia. Este é um software livre e você pode redistribuí-lo sob certas condições.';
	@override String get dirty => 'DIRTY';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Toque aqui para me patrocinar ou comprar mais armazenamento';
	@override String get licenseButton => 'Toque aqui para ver mais informações de licença';
	@override String get privacyPolicyButton => 'Toque aqui para ver a política de privacidade';
}

// Path: update
class _TranslationsUpdatePtBr extends TranslationsUpdateEn {
	_TranslationsUpdatePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Atualização disponível';
	@override String get updateAvailableDescription => 'Uma nova versão do aplicativo está disponível, com estas mudanças:';
	@override String get update => 'Atualizar';
	@override String get downloadNotAvailableYet => 'O download ainda não está disponível para sua plataforma. Verifique novamente em breve.';
}

// Path: editor
class _TranslationsEditorPtBr extends TranslationsEditorEn {
	_TranslationsEditorPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarPtBr toolbar = _TranslationsEditorToolbarPtBr._(_root);
	@override late final _TranslationsEditorPensPtBr pens = _TranslationsEditorPensPtBr._(_root);
	@override late final _TranslationsEditorPenOptionsPtBr penOptions = _TranslationsEditorPenOptionsPtBr._(_root);
	@override late final _TranslationsEditorColorsPtBr colors = _TranslationsEditorColorsPtBr._(_root);
	@override late final _TranslationsEditorImageOptionsPtBr imageOptions = _TranslationsEditorImageOptionsPtBr._(_root);
	@override late final _TranslationsEditorSelectionBarPtBr selectionBar = _TranslationsEditorSelectionBarPtBr._(_root);
	@override late final _TranslationsEditorMenuPtBr menu = _TranslationsEditorMenuPtBr._(_root);
	@override late final _TranslationsEditorNewerFileFormatPtBr newerFileFormat = _TranslationsEditorNewerFileFormatPtBr._(_root);
	@override late final _TranslationsEditorQuillPtBr quill = _TranslationsEditorQuillPtBr._(_root);
	@override late final _TranslationsEditorHudPtBr hud = _TranslationsEditorHudPtBr._(_root);
	@override String get pages => 'Páginas';
	@override String get untitled => 'Sem título';
	@override String get needsToSaveBeforeExiting => 'Salvando as suas alterações... Você pode sair do editor com segurança quando isto terminar';
}

// Path: home.tabs
class _TranslationsHomeTabsPtBr extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Início';
	@override String get browse => 'Explorar';
	@override String get whiteboard => 'Quadro branco';
	@override String get settings => 'Configurações';
}

// Path: home.titles
class _TranslationsHomeTitlesPtBr extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Notas recentes';
	@override String get browse => 'Navegar';
	@override String get whiteboard => 'Quadro branco';
	@override String get settings => 'Configurações';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsPtBr extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nova nota';
	@override String get showUpdateDialog => 'Mostrar caixa de diálogo de atualização';
	@override String get exportNote => 'Nota de exportação';
}

// Path: home.create
class _TranslationsHomeCreatePtBr extends TranslationsHomeCreateEn {
	_TranslationsHomeCreatePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nova nota';
	@override String get importNote => 'Importar nota';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderPtBr extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Nova pasta';
	@override String get folderName => 'Nome da pasta';
	@override String get create => 'Criar';
	@override String get folderNameEmpty => 'O nome da pasta não pode estar vazio';
	@override String get folderNameContainsSlash => 'O nome da pasta não pode conter uma barra';
	@override String get folderNameExists => 'A pasta já existe';
}

// Path: home.renameNote
class _TranslationsHomeRenameNotePtBr extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNotePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Renomear nota';
	@override String get noteName => 'Nome da nota';
	@override String get rename => 'Renomear';
	@override String get noteNameEmpty => 'O nome da nota não pode estar vazio';
	@override String get noteNameContainsSlash => 'O nome da nota não pode conter uma barra';
	@override String get noteNameExists => 'Já existe uma nota com este nome';
}

// Path: home.moveNote
class _TranslationsHomeMoveNotePtBr extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNotePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Mover a nota';
	@override String moveName({required Object f}) => 'Mover ${f}';
	@override String get move => 'Mover';
	@override String renamedTo({required Object newName}) => 'A nota será renomeada para ${newName}';
	@override String moveNotes({required Object n}) => 'Mover ${n} notas';
	@override String get multipleRenamedTo => 'As seguintes notas serão renomeadas:';
	@override String numberRenamedTo({required Object n}) => '${n} notas serão renomeadas para evitar conflitos';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderPtBr extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Renomear pasta';
	@override String get folderName => 'Nome da pasta';
	@override String get rename => 'Renomear';
	@override String get folderNameEmpty => 'O nome da pasta não pode estar vazio';
	@override String get folderNameContainsSlash => 'O nome da pasta não pode conter uma barra';
	@override String get folderNameExists => 'Já existe uma pasta com este nome';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderPtBr extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Apagar pasta';
	@override String deleteName({required Object f}) => 'Apagar ${f}';
	@override String get delete => 'Apagar';
	@override String get alsoDeleteContents => 'Apagar também todas as notas dentro desta pasta';
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesPtBr extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get general => 'Geral';
	@override String get writing => 'Escrita';
	@override String get editor => 'editor';
	@override String get advanced => 'Avançado';
	@override String get performance => 'Desempenho';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsPtBr extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Idioma do aplicativo';
	@override String get appTheme => 'Tema do aplicativo';
	@override String get platform => 'Tipo do tema';
	@override String get layoutSize => 'Tipo de leiaute';
	@override String get customAccentColor => 'Cor de destaque personalizada';
	@override String get hyperlegibleFont => 'Fonte hiperlegível';
	@override String get shouldCheckForUpdates => 'Verificar automaticamente as atualizações do Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Atualizações mais rápidas';
	@override String get allowInsecureConnections => 'Permitir conexões inseguras';
	@override String get editorToolbarAlignment => 'Alinhamento da barra de ferramentas do editor';
	@override String get editorToolbarShowInFullscreen => 'Mostrar a barra de ferramentas do editor no modo de tela cheia';
	@override String get editorAutoInvert => 'Inverter as notas no modo escuro';
	@override String get preferGreyscale => 'Preferir as cores em escala de cinza';
	@override String get maxImageSize => 'Tamanho máximo da imagem';
	@override String get autoClearWhiteboardOnExit => 'Limpar o quadro branco depois de sair do aplicativo';
	@override String get disableEraserAfterUse => 'Desativar automaticamente a borracha';
	@override String get hideFingerDrawingToggle => 'Ocultar o botão de desenho com o dedo';
	@override String get editorPromptRename => 'Solicitar que você renomeie novas notas';
	@override String get hideHomeBackgrounds => 'Ocultar planos de fundo na tela inicial';
	@override String get recentColorsDontSavePresets => 'Não salvar as cores predefinidas nas cores recentes';
	@override String get printPageIndicators => 'Imprimir os indicadores de página';
	@override String get autosaveDelay => 'Atraso de salvamento automático';
	@override String get simplifiedHomeLayout => 'Layout simplificado da casa';
	@override String get pencilSoundSetting => 'Efeito sonoro de lápis';
	@override String get customDataDir => 'Diretório de dados personalizado';
	@override String get autoStraightenLines => 'Endireitar linhas automaticamente';
	@override String get shapeRecognitionDelay => 'Atraso no reconhecimento de forma';
	@override String get recentColorsLength => 'Quantas cores recentes armazenar';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsPtBr extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible aumenta a legibilidade para leitores com baixa visão';
	@override String get allowInsecureConnections => '(Não recomendado) Permitir que o Saber se conecte a servidores com certificados autoassinados/não-confiáveis';
	@override String get preferGreyscale => 'Para telas e-ink';
	@override String get autoClearWhiteboardOnExit => 'Ainda será sincronizado com seus outros dispositivos';
	@override String get disableEraserAfterUse => 'Voltar automaticamente para a caneta depois de usar a borracha';
	@override String get maxImageSize => 'Imagens maiores que isso serão compactadas';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingPtBr hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingPtBr._(_root);
	@override String get editorPromptRename => 'Você pode sempre renomear as notas mais tarde';
	@override String get hideHomeBackgrounds => 'Para uma aparência mais limpa';
	@override String get printPageIndicators => 'Mostrar os indicadores de página nas exportações';
	@override String get autosaveDelay => 'Quanto tempo esperar antes de salvar automaticamente uma nota';
	@override String get shouldAlwaysAlertForUpdates => 'Conte-me sobre atualizações assim que elas estiverem disponíveis';
	@override late final _TranslationsSettingsPrefDescriptionsPencilSoundSettingPtBr pencilSoundSetting = _TranslationsSettingsPrefDescriptionsPencilSoundSettingPtBr._(_root);
	@override String get simplifiedHomeLayout => 'Define uma altura fixa para cada pré-visualização de nota';
	@override String get autoStraightenLines => 'Endireita linhas longas sem precisar usar a caneta modeladora';
	@override String get shapeRecognitionDelay => 'Com que frequência atualizar a visualização da forma';
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesPtBr extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get light => 'Claro';
	@override String get dark => 'Escuro';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesPtBr extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Automático';
	@override String get phone => 'Celular';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerPtBr extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Selecionar uma cor';
}

// Path: settings.reset
class _TranslationsSettingsResetPtBr extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Redefinir esta configuração?';
	@override String get button => 'Redefinir';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirPtBr extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Cancelar';
	@override String get select => 'Selecione';
	@override String get mustBeEmpty => 'O diretório selecionado deve estar vazio';
	@override String get mustBeDoneSyncing => 'Certifique-se de que a sincronização esteja concluída antes de alterar o diretório';
}

// Path: login.form
class _TranslationsLoginFormPtBr extends TranslationsLoginFormEn {
	_TranslationsLoginFormPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Ao fazer login, você concorda com a '),
		linkToPrivacyPolicy('Política de Privacidade'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusPtBr extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Desconectado';
	@override String get tapToLogin => 'Toque para fazer login com o Nextcloud';
	@override String get loggedIn => 'Logado com o Nextcloud';
	@override String hi({required Object u}) => 'Olá, ${u}!';
	@override String get almostDone => 'Quase pronto para sincronização, toque para finalizar o login';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepPtBr extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsLoginNcLoginStepLoginFlowPtBr loginFlow = _TranslationsLoginNcLoginStepLoginFlowPtBr._(_root);
	@override String get whereToStoreData => 'Escolha onde deseja armazenar seus dados:';
	@override String get saberNcServer => 'Servidor Nextcloud do Saber';
	@override String get otherNcServer => 'Outro servidor Nextcloud';
	@override String get serverUrl => 'URL do servidor';
	@override String get loginWithSaber => 'Faça login com Saber';
	@override String get loginWithNextcloud => 'Faça login com Nextcloud';
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepPtBr extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Para proteger seus dados, digite sua senha de criptografia:';
	@override String get newToSaber => 'Novo no Saber';
	@override String get encPassword => 'Senha de criptografia';
	@override String get encFaqTitle => 'Perguntas frequentes';
	@override String get wrongEncPassword => 'A descriptografia falhou com a senha fornecida. Por favor, tente inseri-lo novamente.';
	@override String get connectionFailed => 'Algo deu errado ao conectar-se ao servidor. Por favor, tente novamente mais tarde.';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$PtBr._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$PtBr._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$PtBr._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksPtBr extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Página inicial do servidor';
	@override String get deleteAccount => 'Apagar conta';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$PtBr extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$PtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Eu perderei as minhas notas se eu sair da minha conta?';
	@override String get a => 'Não. As suas notas permanecerão tanto no seu dispositivo quanto no servidor. Elas não serão sincronizadas com o servidor até você fazer login novamente. Tenha certeza de que a sincronização foi finalizada antes de sair, de modo que você não perca nenhum dado (veja o progresso da sincronização na tela inicial).';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$PtBr extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$PtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Como eu mudo a minha senha do Nextcloud?';
	@override String get a => 'Vá para o website do seu servidor e faça login. Então vá para Configurações > Segurança > Mudar senha. Você precisará sair da conta e fazer login novamente no Saber depois de mudar a sua senha.';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$PtBr extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$PtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Como eu mudo a minha senha de criptografia?';
	@override String get a => '1. Saia da sua conta do Saber. Tenha certeza de que a sincronização foi finalizada antes de sair, de modo que você não perca nenhum dado (veja o progresso da sincronização na tela inicial).\n2. Vá para o website do seu servidor e apague a sua pasta do Saber. Isso apagará todas as suas notas do servidor.\n3. Faça login na sua conta do Saber. Você pode escolher uma nova senha de criptografia quando fizer login.\n4. Não se esqueça de sair e fazer login novamente no Saber em seus outros dispositivos também.';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$PtBr extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$PtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Como eu posso apagar a minha conta?';
	@override String get a => 'Toque no "${_root.profile.quickLinks.deleteAccount}" botão acima, e faça login se necessário.\nSe você estiver usando o servidor oficial do Saber, a sua conta será apagada depois de um período de carência de uma semana. Você pode entrar em contato comigo em adilhanney@disroot.org durante esse período para cancelar a exclusão.\nSe você estiver usando um servidor de terceiros, pode ser que não haja uma opção de apagar a sua conta: você precisará consultar a política de privacidade do servidor para mais informações.';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarPtBr extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Paleta de cores (Ctrl C)';
	@override String get select => 'Selecionar';
	@override String get toggleEraser => 'Borracha (Ctrl E)';
	@override String get photo => 'Imagens';
	@override String get text => 'Texto';
	@override String get toggleFingerDrawing => 'Desenhar com o dedo (Ctrl F)';
	@override String get undo => 'Desfazer';
	@override String get redo => 'Refazer';
	@override String get export => 'Exportar (Ctrl Shift S)';
	@override String get exportAs => 'Exportar como:';
	@override String get fullscreen => 'Tela cheia (F11)';
}

// Path: editor.pens
class _TranslationsEditorPensPtBr extends TranslationsEditorPensEn {
	_TranslationsEditorPensPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Caneta tinteiro';
	@override String get ballpointPen => 'Caneta esferográfica';
	@override String get highlighter => 'Marcador';
	@override String get laserPointer => 'Apontador laser';
	@override String get pencil => 'Lápis';
	@override String get shapePen => 'Caneta de forma';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsPtBr extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get size => 'Tamanho';
}

// Path: editor.colors
class _TranslationsEditorColorsPtBr extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Seletor de cores';
	@override String get black => 'Preto';
	@override String get darkGrey => 'Cinza escuro';
	@override String get grey => 'Cinza';
	@override String get lightGrey => 'Cinza claro';
	@override String get white => 'Branco';
	@override String get red => 'Vermelho';
	@override String get green => 'Verde';
	@override String get blue => 'Azul';
	@override String get yellow => 'Amarelo';
	@override String get purple => 'Roxo';
	@override String get orange => 'Laranja';
	@override String get pastelRed => 'Vermelho pastel';
	@override String get pastelOrange => 'Laranja pastel';
	@override String get pastelYellow => 'Amarelo pastel';
	@override String get pastelGreen => 'Verde pastel';
	@override String get pastelCyan => 'Ciano pastel';
	@override String get pastelBlue => 'Azul pastel';
	@override String get pastelPurple => 'Roxo pastel';
	@override String get pastelPink => 'Rosa pastel';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Personalizado ${b} ${h}';
	@override String customHue({required Object h}) => '${h} personalizado';
	@override String get dark => 'escuro';
	@override String get light => 'luz';
	@override String get cyan => 'Ciano';
	@override String get pink => 'Rosa';
}

// Path: editor.imageOptions
class _TranslationsEditorImageOptionsPtBr extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opções de imagem';
	@override String get invertible => 'Invertível';
	@override String get download => 'Download';
	@override String get setAsBackground => 'Definir como plano de fundo';
	@override String get removeAsBackground => 'Remover como plano de fundo';
	@override String get delete => 'Excluir';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarPtBr extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Excluir';
	@override String get duplicate => 'Duplicação';
}

// Path: editor.menu
class _TranslationsEditorMenuPtBr extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Limpar a página ${page}/${totalPages}';
	@override String get clearAllPages => 'Limpar todas as páginas';
	@override String get insertPage => 'Inserir página abaixo';
	@override String get duplicatePage => 'Duplicar página';
	@override String get deletePage => 'Apagar página';
	@override String get lineHeight => 'Altura da linha';
	@override String get backgroundImageFit => 'Ajustar a imagem de plano de fundo';
	@override String get backgroundPattern => 'Padrão de plano de fundo';
	@override String get import => 'Importar';
	@override late final _TranslationsEditorMenuBoxFitsPtBr boxFits = _TranslationsEditorMenuBoxFitsPtBr._(_root);
	@override late final _TranslationsEditorMenuBgPatternsPtBr bgPatterns = _TranslationsEditorMenuBgPatternsPtBr._(_root);
	@override String get lineThickness => 'Espessura da linha';
	@override String get lineThicknessDescription => 'Espessura da linha de fundo';
	@override String get watchServer => 'Fique atento às atualizações no servidor';
	@override String get watchServerReadOnly => 'A edição está desativada enquanto observa o servidor';
	@override String get lineHeightDescription => 'Também controla o tamanho do texto para notas digitadas';
}

// Path: editor.newerFileFormat
class _TranslationsEditorNewerFileFormatPtBr extends TranslationsEditorNewerFileFormatEn {
	_TranslationsEditorNewerFileFormatPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Modo somente leitura';
	@override String get title => 'Esta nota foi editada usando uma versão mais recente do Saber';
	@override String get subtitle => 'A edição desta nota pode resultar na perda de algumas informações. Deseja ignorar isso e editá-la mesmo assim?';
	@override String get allowEditing => 'Permitir edição';
}

// Path: editor.quill
class _TranslationsEditorQuillPtBr extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Digite algo aqui...';
}

// Path: editor.hud
class _TranslationsEditorHudPtBr extends TranslationsEditorHudEn {
	_TranslationsEditorHudPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Desbloquear zoom';
	@override String get lockZoom => 'Bloquear zoom';
	@override String get unlockSingleFingerPan => 'Ativar rolagem com um dedo';
	@override String get lockSingleFingerPan => 'Desativar rolagem com um dedo';
	@override String get unlockAxisAlignedPan => 'Desbloqueie a rolagem para horizontal ou vertical';
	@override String get lockAxisAlignedPan => 'Bloqueie a rolagem para horizontal ou vertical';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingPtBr extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Evitar alternância acidental';
	@override String get fixedOn => 'O desenho com o dedo está ativado';
	@override String get fixedOff => 'O desenho com o dedo está desativado';
}

// Path: settings.prefDescriptions.pencilSoundSetting
class _TranslationsSettingsPrefDescriptionsPencilSoundSettingPtBr extends TranslationsSettingsPrefDescriptionsPencilSoundSettingEn {
	_TranslationsSettingsPrefDescriptionsPencilSoundSettingPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get off => 'Sem som';
	@override String get onButNotInSilentMode => 'Ativado (a menos que esteja no modo silencioso)';
	@override String get onAlways => 'Ativado (mesmo no modo silencioso)';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowPtBr extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Autorize o Saber a acessar sua conta Nextcloud';
	@override String get followPrompts => 'Por favor, siga as instruções no seu navegador.';
	@override String get browserDidntOpen => 'O navegador não abriu';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$PtBr extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$PtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'O que é uma senha de criptografia?';
	@override String get a => 'A senha de criptografia é usada para criptografar os seus dados antes de eles serem enviados ao servidor. Você a escolhe quando faz login pela primeira vez no Saber, e ela não está relacionada à sua conta/senha do Nextcloud.\nNinguém pode acessar as suas notas no servidor sem a sua senha de criptografia. Isso também significa que, se você esquecer a sua senha de criptografia, perderá o acesso aos seus dados.';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$PtBr extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$PtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Por que usar duas senhas?';
	@override String get a => 'A senha do Nextcloud é usada para acessar a nuvem. A senha de criptografia "embaralha" os seus dados antes que eles cheguem à nuvem.\nMesmo que alguém obtenha acesso à sua conta do Nextcloud, as suas notas permanecerão seguras e criptografadas com uma senha separada. Isso fornece uma segunda camada de segurança para proteger os seus dados.';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$PtBr extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$PtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Posso usar a mesma senha para ambos?';
	@override String get a => 'Sim, mas isso é menos seguro. Como a sua senha do Nextcloud é enviada ao servidor, alguém com acesso ao servidor poderá descriptografar as suas notas. Use a mesma senha apenas se você confiar no proprietário do servidor. ';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsPtBr extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Esticar';
	@override String get cover => 'Cobrir';
	@override String get contain => 'Conter';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsPtBr extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get none => 'Em branco';
	@override String get college => 'Pautado com margem';
	@override String get collegeRtl => 'Pautado com margem (Invertido)';
	@override String get lined => 'Pautado';
	@override String get grid => 'Grade';
	@override String get dots => 'Pontos';
	@override String get staffs => 'Pentagrama';
	@override String get tablature => 'Tablatura';
	@override String get cornell => 'Cornell';
}
