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
class TranslationsPt extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.pt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <pt>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsPt _root = this; // ignore: unused_field

	@override 
	TranslationsPt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPt(meta: meta ?? this.$meta);

	// Translations
	@override late final Translations$common$pt common = Translations$common$pt.internal(_root);
	@override late final Translations$home$pt home = Translations$home$pt.internal(_root);
	@override late final Translations$sentry$pt sentry = Translations$sentry$pt.internal(_root);
	@override late final Translations$settings$pt settings = Translations$settings$pt.internal(_root);
	@override late final Translations$logs$pt logs = Translations$logs$pt.internal(_root);
	@override late final Translations$login$pt login = Translations$login$pt.internal(_root);
	@override late final Translations$profile$pt profile = Translations$profile$pt.internal(_root);
	@override late final Translations$appInfo$pt appInfo = Translations$appInfo$pt.internal(_root);
	@override late final Translations$update$pt update = Translations$update$pt.internal(_root);
	@override late final Translations$editor$pt editor = Translations$editor$pt.internal(_root);
}

// Path: common
class Translations$common$pt extends Translations$common$en {
	Translations$common$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get done => 'Feito';
	@override String get continueBtn => 'Continuar';
	@override String get cancel => 'Cancelar';
}

// Path: home
class Translations$home$pt extends Translations$home$en {
	Translations$home$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final Translations$home$tabs$pt tabs = Translations$home$tabs$pt.internal(_root);
	@override late final Translations$home$titles$pt titles = Translations$home$titles$pt.internal(_root);
	@override late final Translations$home$tooltips$pt tooltips = Translations$home$tooltips$pt.internal(_root);
	@override late final Translations$home$create$pt create = Translations$home$create$pt.internal(_root);
	@override String get welcome => 'Bem-vindo(a) ao Saber';
	@override String get invalidFormat => 'O ficheiro que selecionou não é apoiado. Por favor selecione um ficheiro .sbn, .sbn2, .sba ou .pdf.';
	@override String get noFiles => 'Nenhum ficheiro encontrado';
	@override String get noPreviewAvailable => 'Nenhuma prévia disponível';
	@override String get createNewNote => 'Toque no botão + para criar uma nova nota';
	@override String get backFolder => 'Retornar para a pasta anterior';
	@override late final Translations$home$newFolder$pt newFolder = Translations$home$newFolder$pt.internal(_root);
	@override late final Translations$home$renameNote$pt renameNote = Translations$home$renameNote$pt.internal(_root);
	@override late final Translations$home$moveNote$pt moveNote = Translations$home$moveNote$pt.internal(_root);
	@override String get deleteNote => 'Apagar nota';
	@override late final Translations$home$deleteNoteDialog$pt deleteNoteDialog = Translations$home$deleteNoteDialog$pt.internal(_root);
	@override late final Translations$home$renameFolder$pt renameFolder = Translations$home$renameFolder$pt.internal(_root);
	@override late final Translations$home$deleteFolder$pt deleteFolder = Translations$home$deleteFolder$pt.internal(_root);
}

// Path: sentry
class Translations$sentry$pt extends Translations$sentry$en {
	Translations$sentry$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final Translations$sentry$consent$pt consent = Translations$sentry$consent$pt.internal(_root);
}

// Path: settings
class Translations$settings$pt extends Translations$settings$en {
	Translations$settings$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final Translations$settings$prefCategories$pt prefCategories = Translations$settings$prefCategories$pt.internal(_root);
	@override late final Translations$settings$prefLabels$pt prefLabels = Translations$settings$prefLabels$pt.internal(_root);
	@override late final Translations$settings$prefDescriptions$pt prefDescriptions = Translations$settings$prefDescriptions$pt.internal(_root);
	@override late final Translations$settings$themeModes$pt themeModes = Translations$settings$themeModes$pt.internal(_root);
	@override late final Translations$settings$layoutSizes$pt layoutSizes = Translations$settings$layoutSizes$pt.internal(_root);
	@override late final Translations$settings$accentColorPicker$pt accentColorPicker = Translations$settings$accentColorPicker$pt.internal(_root);
	@override String get systemLanguage => 'Idioma do sistema';
	@override List<String> get axisDirections => [
		'Em cima',
		'Direita',
		'Embaixo',
		'Esquerda',
	];
	@override late final Translations$settings$reset$pt reset = Translations$settings$reset$pt.internal(_root);
	@override late final Translations$settings$customDataDir$pt customDataDir = Translations$settings$customDataDir$pt.internal(_root);
	@override String get resyncEverything => 'Sincronizar tudo';
	@override String get openDataDir => 'Abrir pasta Saber';
	@override String get autosaveDisabled => 'Nunca';
	@override String get shapeRecognitionDisabled => 'Nunca';
}

// Path: logs
class Translations$logs$pt extends Translations$logs$en {
	Translations$logs$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Registros';
	@override String get viewLogs => 'Ver logs';
	@override String get debuggingInfo => 'Os logs contêm informações úteis para depuração e desenvolvimento';
	@override String get noLogs => 'Nenhum log aqui!';
	@override String get useTheApp => 'Os logs aparecerão aqui enquanto você usa o aplicativo';
}

// Path: login
class Translations$login$pt extends Translations$login$en {
	Translations$login$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Login';
	@override late final Translations$login$form$pt form = Translations$login$form$pt.internal(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Ainda não tem uma conta? '),
		linkToSignup('Registe-se agora'),
		const TextSpan(text: '!'),
	]);
	@override late final Translations$login$status$pt status = Translations$login$status$pt.internal(_root);
	@override late final Translations$login$ncLoginStep$pt ncLoginStep = Translations$login$ncLoginStep$pt.internal(_root);
	@override late final Translations$login$encLoginStep$pt encLoginStep = Translations$login$encLoginStep$pt.internal(_root);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		const TextSpan(text: 'Não você? '),
		undoLogin('Escolher outra conta'),
		const TextSpan(text: '.'),
	]);
}

// Path: profile
class Translations$profile$pt extends Translations$profile$en {
	Translations$profile$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'O meu perfil';
	@override String get logout => 'Sair';
	@override late final Translations$profile$quickLinks$pt quickLinks = Translations$profile$quickLinks$pt.internal(_root);
	@override List<dynamic> get faq => [
		Translations$profile$faq$0$pt.internal(_root),
		Translations$profile$faq$1$pt.internal(_root),
		Translations$profile$faq$2$pt.internal(_root),
		Translations$profile$faq$3$pt.internal(_root),
	];
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Você está usando ${used} de ${total} (${percent}%)';
	@override String get connectedTo => 'Conectado a';
	@override String get faqTitle => 'Perguntas frequentes';
}

// Path: appInfo
class Translations$appInfo$pt extends Translations$appInfo$en {
	Translations$appInfo$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nEste programa vem sem absolutamente nenhuma garantia. Este é um software livre e pode redistribuí-lo sob certas condições.';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Toque aqui para me patrocinar ou comprar mais armazenamento';
	@override String get licenseButton => 'Toque aqui para ver mais informações de licença';
	@override String get privacyPolicyButton => 'Toque aqui para ver a política de privacidade';
}

// Path: update
class Translations$update$pt extends Translations$update$en {
	Translations$update$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Atualização disponível';
	@override String get updateAvailableDescription => 'Uma nova versão da app está disponível, com estas mudanças:';
	@override String get update => 'Atualizar';
	@override String get downloadNotAvailableYet => 'O download ainda não está disponível para a sua plataforma. Por favor, verifique novamente em breve.';
}

// Path: editor
class Translations$editor$pt extends Translations$editor$en {
	Translations$editor$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final Translations$editor$toolbar$pt toolbar = Translations$editor$toolbar$pt.internal(_root);
	@override late final Translations$editor$pens$pt pens = Translations$editor$pens$pt.internal(_root);
	@override late final Translations$editor$penOptions$pt penOptions = Translations$editor$penOptions$pt.internal(_root);
	@override late final Translations$editor$colors$pt colors = Translations$editor$colors$pt.internal(_root);
	@override late final Translations$editor$imageOptions$pt imageOptions = Translations$editor$imageOptions$pt.internal(_root);
	@override late final Translations$editor$selectionBar$pt selectionBar = Translations$editor$selectionBar$pt.internal(_root);
	@override late final Translations$editor$menu$pt menu = Translations$editor$menu$pt.internal(_root);
	@override late final Translations$editor$readOnlyBanner$pt readOnlyBanner = Translations$editor$readOnlyBanner$pt.internal(_root);
	@override late final Translations$editor$versionTooNew$pt versionTooNew = Translations$editor$versionTooNew$pt.internal(_root);
	@override late final Translations$editor$quill$pt quill = Translations$editor$quill$pt.internal(_root);
	@override late final Translations$editor$hud$pt hud = Translations$editor$hud$pt.internal(_root);
	@override String get pages => 'Páginas';
	@override String get untitled => 'Sem título';
	@override String get needsToSaveBeforeExiting => 'A gravar as suas alterações... Pode sair do editor com segurança quando isto terminar';
}

// Path: home.tabs
class Translations$home$tabs$pt extends Translations$home$tabs$en {
	Translations$home$tabs$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Início';
	@override String get browse => 'Explorar';
	@override String get whiteboard => 'Quadro branco';
	@override String get settings => 'Configurações';
}

// Path: home.titles
class Translations$home$titles$pt extends Translations$home$titles$en {
	Translations$home$titles$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Notas recentes';
	@override String get browse => 'Navegar';
	@override String get whiteboard => 'Quadro branco';
	@override String get settings => 'Configurações';
}

// Path: home.tooltips
class Translations$home$tooltips$pt extends Translations$home$tooltips$en {
	Translations$home$tooltips$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nova nota';
	@override String get showUpdateDialog => 'Mostrar caixa de diálogo de atualização';
	@override String get exportNote => 'Exportar nota';
}

// Path: home.create
class Translations$home$create$pt extends Translations$home$create$en {
	Translations$home$create$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nova nota';
	@override String get importNote => 'Importar nota';
}

// Path: home.newFolder
class Translations$home$newFolder$pt extends Translations$home$newFolder$en {
	Translations$home$newFolder$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Nova pasta';
	@override String get folderName => 'Nome da pasta';
	@override String get create => 'Criar';
	@override String get folderNameEmpty => 'O nome da pasta não pode estar vazio';
	@override String get folderNameContainsSlash => 'O nome da pasta não pode conter uma barra';
	@override String get folderNameExists => 'A pasta já existe';
}

// Path: home.renameNote
class Translations$home$renameNote$pt extends Translations$home$renameNote$en {
	Translations$home$renameNote$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Renomear nota';
	@override String get noteName => 'Nome da nota';
	@override String get rename => 'Renomear';
	@override String get noteNameEmpty => 'O nome da nota não pode estar vazio';
	@override String get noteNameExists => 'Já existe uma nota com este nome';
	@override String get noteNameForbiddenCharacters => 'Nome da nota contem caracteres proibidos';
	@override String get noteNameReserved => 'Nome da nota reservado';
}

// Path: home.moveNote
class Translations$home$moveNote$pt extends Translations$home$moveNote$en {
	Translations$home$moveNote$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Mover a nota';
	@override String moveNotes({required Object n}) => 'Mova ${n} notas';
	@override String moveName({required Object f}) => 'Mover ${f}';
	@override String get move => 'Mover';
	@override String renamedTo({required Object newName}) => 'A nota será renomeada para ${newName}';
	@override String get multipleRenamedTo => 'As notas a seguir serão renomeadas:';
	@override String numberRenamedTo({required Object n}) => '${n} notas serão renomeadas para evitar conflitos';
}

// Path: home.deleteNoteDialog
class Translations$home$deleteNoteDialog$pt extends Translations$home$deleteNoteDialog$en {
	Translations$home$deleteNoteDialog$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String deleteNotes({required Object n}) => 'Apagar ${n} notas';
	@override String deleteName({required Object f}) => 'Apagar ${f}';
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
		one: 'Permanentemente apagar a nota selecionada?',
		other: 'Permanentemente apagar as notas selecionadas?',
	);
	@override String get delete => 'Apagar';
}

// Path: home.renameFolder
class Translations$home$renameFolder$pt extends Translations$home$renameFolder$en {
	Translations$home$renameFolder$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Renomear pasta';
	@override String get folderName => 'Nome da pasta';
	@override String get rename => 'Renomear';
	@override String get folderNameEmpty => 'O nome da pasta não pode estar vazio';
	@override String get folderNameContainsSlash => 'O nome da pasta não pode conter uma barra';
	@override String get folderNameExists => 'Já existe uma pasta com este nome';
}

// Path: home.deleteFolder
class Translations$home$deleteFolder$pt extends Translations$home$deleteFolder$en {
	Translations$home$deleteFolder$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Apagar pasta';
	@override String deleteName({required Object f}) => 'Apagar ${f}';
	@override String get delete => 'Apagar';
	@override String get alsoDeleteContents => 'Apagar também todas as notas dentro desta pasta';
}

// Path: sentry.consent
class Translations$sentry$consent$pt extends Translations$sentry$consent$en {
	Translations$sentry$consent$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ajudar a melhorar Saber?';
	@override late final Translations$sentry$consent$description$pt description = Translations$sentry$consent$description$pt.internal(_root);
	@override late final Translations$sentry$consent$answers$pt answers = Translations$sentry$consent$answers$pt.internal(_root);
}

// Path: settings.prefCategories
class Translations$settings$prefCategories$pt extends Translations$settings$prefCategories$en {
	Translations$settings$prefCategories$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get general => 'Geral';
	@override String get writing => 'Escrita';
	@override String get editor => 'editor';
	@override String get performance => 'Performance';
	@override String get advanced => 'Avançado';
}

// Path: settings.prefLabels
class Translations$settings$prefLabels$pt extends Translations$settings$prefLabels$en {
	Translations$settings$prefLabels$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Idioma';
	@override String get appTheme => 'Tema da app';
	@override String get platform => 'Tipo do tema';
	@override String get layoutSize => 'Tipo de leiaute';
	@override String get customAccentColor => 'Cor de destaque personalizada';
	@override String get hyperlegibleFont => 'Fonte hiperlegível';
	@override String get shouldCheckForUpdates => 'Verificar automaticamente as atualizações do Saber';
	@override String get shouldAlwaysAlertForUpdates => 'Atualizações mais rápidas';
	@override String get allowInsecureConnections => 'Permitir conexões inseguras';
	@override String get editorToolbarAlignment => 'Alinhamento da barra de ferramentas do editor';
	@override String get editorToolbarShowInFullscreen => 'Mostrar a barra de ferramentas do editor no modo de ecrã cheio';
	@override String get editorAutoInvert => 'Inverter as notas no modo escuro';
	@override String get preferGreyscale => 'Preferir as cores em escala de cinzento';
	@override String get maxImageSize => 'Tamanho máximo da imagem';
	@override String get autoClearWhiteboardOnExit => 'Limpar o quadro automaticamente';
	@override String get disableEraserAfterUse => 'Desativar automaticamente a borracha';
	@override String get hideFingerDrawingToggle => 'Ocultar o botão de desenho com o dedo';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Auto-disabilitar desenho com os dedos';
	@override String get editorPromptRename => 'Solicitar que renomeie novas notas';
	@override String get recentColorsDontSavePresets => 'Não gravar as cores predefinidas nas cores recentes';
	@override String get recentColorsLength => 'Quantas cores recentes guardar';
	@override String get printPageIndicators => 'Imprimir os indicadores de página';
	@override String get autosave => 'Auto-gravar';
	@override String get shapeRecognitionDelay => 'Atraso no reconhecimento de formatos';
	@override String get autoStraightenLines => 'Auto alinhamento de linhas';
	@override String get simplifiedHomeLayout => 'Layout de casa simplificado';
	@override String get customDataDir => 'Pasta Saber personalizada';
	@override String get sentry => 'Relatório de erro';
}

// Path: settings.prefDescriptions
class Translations$settings$prefDescriptions$pt extends Translations$settings$prefDescriptions$en {
	Translations$settings$prefDescriptions$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'Atkinson Hyperlegible aumenta a legibilidade para leitores com baixa visão';
	@override String get allowInsecureConnections => '(Não recomendado) Permitir que o Saber conecte a servidores com certificados autoassinados/não-confiáveis';
	@override String get preferGreyscale => 'Para ecrãs e-ink';
	@override String get autoClearWhiteboardOnExit => 'Ainda será sincronizado com os seus outros dispositivos';
	@override String get disableEraserAfterUse => 'Voltar automaticamente para a caneta depois de usar a borracha';
	@override String get maxImageSize => 'Imagens maiores que isso serão compactadas';
	@override late final Translations$settings$prefDescriptions$hideFingerDrawing$pt hideFingerDrawing = Translations$settings$prefDescriptions$hideFingerDrawing$pt.internal(_root);
	@override String get editorPromptRename => 'Pode sempre renomear as notas mais tarde';
	@override String get printPageIndicators => 'Mostrar os indicadores de página nas exportações';
	@override String get shouldAlwaysAlertForUpdates => 'Conte-me sobre atualizações assim que elas estiverem disponíveis';
	@override late final Translations$settings$prefDescriptions$sentry$pt sentry = Translations$settings$prefDescriptions$sentry$pt.internal(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Desligar o desenho com o dedo quando um stylus for detectado';
	@override String get autosave => 'Salvar automaticamente após um breve atraso, ou nunca';
	@override String get shapeRecognitionDelay => 'Com que frequência atualizar a prévia da forma?';
	@override String get autoStraightenLines => 'Endireita linhas longas sem precisar usar a caneta de forma';
	@override String get simplifiedHomeLayout => 'Define uma altura fixa para cada prévia de nota';
}

// Path: settings.themeModes
class Translations$settings$themeModes$pt extends Translations$settings$themeModes$en {
	Translations$settings$themeModes$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistema';
	@override String get light => 'Claro';
	@override String get dark => 'Escuro';
}

// Path: settings.layoutSizes
class Translations$settings$layoutSizes$pt extends Translations$settings$layoutSizes$en {
	Translations$settings$layoutSizes$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Automático';
	@override String get phone => 'Telemóvel';
	@override String get tablet => 'Tablet';
}

// Path: settings.accentColorPicker
class Translations$settings$accentColorPicker$pt extends Translations$settings$accentColorPicker$en {
	Translations$settings$accentColorPicker$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Selecionar uma cor';
}

// Path: settings.reset
class Translations$settings$reset$pt extends Translations$settings$reset$en {
	Translations$settings$reset$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Redefinir esta configuração?';
	@override String get button => 'Redefinir';
}

// Path: settings.customDataDir
class Translations$settings$customDataDir$pt extends Translations$settings$customDataDir$en {
	Translations$settings$customDataDir$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Cancelar';
	@override String get select => 'Selecionar';
	@override String get mustBeEmpty => 'A pasta selecionada deve estar vazia';
	@override String get mustBeDoneSyncing => 'Certifique-se de que a sincronização esteja completa antes de mudar a pasta';
	@override String get unsupported => 'Este recurso é atualmente apenas para desenvolvedores. O uso dele provavelmente resultará em perda de dados.';
}

// Path: login.form
class Translations$login$form$pt extends Translations$login$form$en {
	Translations$login$form$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'Ao fazer login, concorda com a '),
		linkToPrivacyPolicy('Política de Privacidade'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class Translations$login$status$pt extends Translations$login$status$en {
	Translations$login$status$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Desconectado';
	@override String get tapToLogin => 'Toque para fazer login com o Nextcloud';
	@override String get loggedIn => 'Logado com o Nextcloud';
	@override String hi({required Object u}) => 'Olá, ${u}!';
	@override String get almostDone => 'Quase pronto para sincronizar, toque para finalizar o login';
}

// Path: login.ncLoginStep
class Translations$login$ncLoginStep$pt extends Translations$login$ncLoginStep$en {
	Translations$login$ncLoginStep$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final Translations$login$ncLoginStep$loginFlow$pt loginFlow = Translations$login$ncLoginStep$loginFlow$pt.internal(_root);
	@override String get whereToStoreData => 'Escolha onde você deseja armazenar seus dados:';
	@override String get saberNcServer => 'Servidor Nextcloud do Saber';
	@override String get otherNcServer => 'Outro servidor Nextcloud';
	@override String get serverUrl => 'URL do servidor';
	@override String get loginWithSaber => 'Entrar com Saber';
	@override String get loginWithNextcloud => 'Fazer login com o Nextcloud';
}

// Path: login.encLoginStep
class Translations$login$encLoginStep$pt extends Translations$login$encLoginStep$en {
	Translations$login$encLoginStep$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override List<dynamic> get encFaq => [
		Translations$login$encLoginStep$encFaq$0$pt.internal(_root),
		Translations$login$encLoginStep$encFaq$1$pt.internal(_root),
		Translations$login$encLoginStep$encFaq$2$pt.internal(_root),
	];
	@override String get enterEncPassword => 'Para proteger seus dados, por favor, insira sua senha de criptografia:';
	@override String get newToSaber => 'Novo no Saber? Basta inserir uma nova senha de criptografia.';
	@override String get encPassword => 'senha de criptografia';
	@override String get encFaqTitle => 'Perguntas frequentes';
	@override String get wrongEncPassword => 'Falha na descriptografia com a senha fornecida. Por favor, tente inseri-la novamente.';
	@override String get connectionFailed => 'Algo deu errado ao conectar ao servidor. Por favor, tente novamente mais tarde.';
}

// Path: profile.quickLinks
class Translations$profile$quickLinks$pt extends Translations$profile$quickLinks$en {
	Translations$profile$quickLinks$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Página inicial do servidor';
	@override String get deleteAccount => 'Apagar a conta';
}

// Path: profile.faq.0
class Translations$profile$faq$0$pt extends Translations$profile$faq$0$en {
	Translations$profile$faq$0$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Perderei as minhas notas se eu sair da minha conta?';
	@override String get a => 'Não. As suas notas permanecerão tanto no seu dispositivo quanto no servidor. Elas não serão sincronizadas com o servidor até fazer login novamente. Tenha certeza que a sincronização foi finalizada antes de sair, de modo que não perca nenhum dado (veja o progresso da sincronização no ecrã inicial).';
}

// Path: profile.faq.1
class Translations$profile$faq$1$pt extends Translations$profile$faq$1$en {
	Translations$profile$faq$1$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Como mudo a minha palavra-passe do Nextcloud?';
	@override String get a => 'Vá para o website do seu servidor e faça login. Depois vá para Configurações > Segurança > Mudar palavra-passe. Precisará sair da conta e fazer login novamente no Saber depois de mudar a sua palavra-passe.';
}

// Path: profile.faq.2
class Translations$profile$faq$2$pt extends Translations$profile$faq$2$en {
	Translations$profile$faq$2$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Como mudo a minha palavra-passe de criptografia?';
}

// Path: profile.faq.3
class Translations$profile$faq$3$pt extends Translations$profile$faq$3$en {
	Translations$profile$faq$3$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Como posso apagar a minha conta?';
	@override String get a => 'Toque no "${_root.profile.quickLinks.deleteAccount}" botão acima e faça login se necessário.\nSe estiver a usar o servidor oficial do Saber, a sua conta será apagada depois de um período de carência de uma semana. Pode entrar em contacto comigo em adilhanney@disroot.org durante este período para cancelar o apagar.\nSe usar um servidor de terceiros, pode ser que não haja uma opção de apagar a sua conta: precisará consultar a política de privacidade do servidor para mais informações.';
}

// Path: editor.toolbar
class Translations$editor$toolbar$pt extends Translations$editor$toolbar$en {
	Translations$editor$toolbar$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

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
	@override String get fullscreen => 'Ecrã cheio (F11)';
}

// Path: editor.pens
class Translations$editor$pens$pt extends Translations$editor$pens$en {
	Translations$editor$pens$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Caneta tinteiro';
	@override String get ballpointPen => 'Caneta esferográfica';
	@override String get highlighter => 'Marcador';
	@override String get laserPointer => 'Apontador laser';
	@override String get pencil => 'Lápis';
	@override String get shapePen => 'Caneta de formato';
}

// Path: editor.penOptions
class Translations$editor$penOptions$pt extends Translations$editor$penOptions$en {
	Translations$editor$penOptions$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get size => 'Tamanho';
}

// Path: editor.colors
class Translations$editor$colors$pt extends Translations$editor$colors$en {
	Translations$editor$colors$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Seletor de cores';
	@override String get black => 'Preto';
	@override String get darkGrey => 'Cinzento escuro';
	@override String get grey => 'Cinzento';
	@override String get lightGrey => 'Cinzento claro';
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
	@override String customBrightnessHue({required Object b, required Object h}) => 'Custom ${b} ${h}';
	@override String customHue({required Object h}) => 'Custom ${h}';
	@override String get dark => 'escuro';
	@override String get light => 'luz';
	@override String get cyan => 'Ciano';
	@override String get pink => 'Rosa';
}

// Path: editor.imageOptions
class Translations$editor$imageOptions$pt extends Translations$editor$imageOptions$en {
	Translations$editor$imageOptions$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opções de imagem';
	@override String get invertible => 'Invertível';
	@override String get download => 'Descarregar';
	@override String get setAsBackground => 'Definir como plano de fundo';
	@override String get removeAsBackground => 'Remover como plano de fundo';
	@override String get delete => 'Apagar';
}

// Path: editor.selectionBar
class Translations$editor$selectionBar$pt extends Translations$editor$selectionBar$en {
	Translations$editor$selectionBar$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Apagar';
	@override String get duplicate => 'Duplicado';
}

// Path: editor.menu
class Translations$editor$menu$pt extends Translations$editor$menu$en {
	Translations$editor$menu$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

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
	@override late final Translations$editor$menu$boxFits$pt boxFits = Translations$editor$menu$boxFits$pt.internal(_root);
	@override late final Translations$editor$menu$bgPatterns$pt bgPatterns = Translations$editor$menu$bgPatterns$pt.internal(_root);
	@override String get lineHeightDescription => 'Também controla o tamanho do texto para notas digitadas';
	@override String get lineThickness => 'Espessura da linha';
	@override String get lineThicknessDescription => 'espessura da linha de fundo';
	@override String get watchServer => 'Fique atento às atualizações no servidor';
	@override String get watchServerReadOnly => 'A edição está desativada ao assistir ao servidor';
}

// Path: editor.readOnlyBanner
class Translations$editor$readOnlyBanner$pt extends Translations$editor$readOnlyBanner$en {
	Translations$editor$readOnlyBanner$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Modo somente leitura';
	@override String get watchingServer => 'Você está atualmente monitorando atualizações no servidor. A edição está desativada neste modo.';
	@override String get corrupted => 'Falha ao carregar a nota. Ela pode estar corrompida ou ainda sendo baixada.';
}

// Path: editor.versionTooNew
class Translations$editor$versionTooNew$pt extends Translations$editor$versionTooNew$en {
	Translations$editor$versionTooNew$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Esta nota foi editada usando uma versão mais recente do Saber';
	@override String get subtitle => 'A edição desta nota pode resultar na perda de algumas informações. Deseja ignorar isto e editá-la mesmo assim?';
	@override String get allowEditing => 'Permitir edição';
}

// Path: editor.quill
class Translations$editor$quill$pt extends Translations$editor$quill$en {
	Translations$editor$quill$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Digite algo aqui...';
}

// Path: editor.hud
class Translations$editor$hud$pt extends Translations$editor$hud$en {
	Translations$editor$hud$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Desbloquear zoom';
	@override String get lockZoom => 'Bloquear zoom';
	@override String get unlockSingleFingerPan => 'Ativar rolagem com um dedo';
	@override String get lockSingleFingerPan => 'Desativar rolagem com um dedo';
	@override String get unlockAxisAlignedPan => 'Desbloqueie a rolagem para horizontal ou vertical';
	@override String get lockAxisAlignedPan => 'Bloqueie a rolagem para horizontal ou vertical';
}

// Path: sentry.consent.description
class Translations$sentry$consent$description$pt extends Translations$sentry$consent$description$en {
	Translations$sentry$consent$description$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get question => 'Gostaria de reportar automaticamente erros inesperados? Isto ajuda-me a identificar e corrigir erros mais rápido.';
	@override String get scope => 'Os reportes podem conter informações sobre os erros e o seu dispositivo. Tentei o máximo possível remover todas as informações pessoais, mas algumas talvez continuem.';
	@override String get currentlyOff => 'Se dar consentimento, os reportes de erro serão ativados após a reinicialização da app.';
	@override String get currentlyOn => 'Se revogar o consentimento, por favor reinicie a app para desativar os reportes de erro.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'Veja mais em: '),
		link('privacy policy'),
		const TextSpan(text: '.'),
	]);
}

// Path: sentry.consent.answers
class Translations$sentry$consent$answers$pt extends Translations$sentry$consent$answers$en {
	Translations$sentry$consent$answers$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Sim';
	@override String get no => 'Não';
	@override String get later => 'Pergunte-me mais tarde';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class Translations$settings$prefDescriptions$hideFingerDrawing$pt extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	Translations$settings$prefDescriptions$hideFingerDrawing$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Evitar alternância acidental';
	@override String get fixedOn => 'O desenho com o dedo está ativado';
	@override String get fixedOff => 'O desenho com o dedo está desativado';
}

// Path: settings.prefDescriptions.sentry
class Translations$settings$prefDescriptions$sentry$pt extends Translations$settings$prefDescriptions$sentry$en {
	Translations$settings$prefDescriptions$sentry$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get active => 'Ativo';
	@override String get inactive => 'Inativo';
	@override String get activeUntilRestart => 'Ativo até você reiniciar o aplicativo';
	@override String get inactiveUntilRestart => 'Inativo até você reiniciar o aplicativo';
}

// Path: login.ncLoginStep.loginFlow
class Translations$login$ncLoginStep$loginFlow$pt extends Translations$login$ncLoginStep$loginFlow$en {
	Translations$login$ncLoginStep$loginFlow$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Por favor, autorize o Saber a acessar sua conta Nextcloud';
	@override String get followPrompts => 'Por favor, siga as instruções na interface do Nextcloud';
	@override String get browserDidntOpen => 'A página de login não abriu? Clique aqui';
}

// Path: login.encLoginStep.encFaq.0
class Translations$login$encLoginStep$encFaq$0$pt extends Translations$login$encLoginStep$encFaq$0$en {
	Translations$login$encLoginStep$encFaq$0$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get q => 'O que é uma senha de criptografia? Por que usar duas senhas?';
	@override String get a => 'A senha do Nextcloud é usada para acessar a nuvem. A senha de criptografia "scrambles" seus dados antes que eles cheguem à nuvem.\nMesmo que alguém acesse sua conta do Nextcloud, suas anotações permanecerão seguras e criptografadas com uma senha separada. Isso lhe fornece uma segunda camada de segurança para proteger seus dados.\nNinguém pode acessar suas anotações no servidor sem sua senha de criptografia, mas isso também significa que se você esquecer sua senha de criptografia, perderá o acesso aos seus dados.';
}

// Path: login.encLoginStep.encFaq.1
class Translations$login$encLoginStep$encFaq$1$pt extends Translations$login$encLoginStep$encFaq$1$en {
	Translations$login$encLoginStep$encFaq$1$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Eu ainda não configurei uma senha de criptografia. Onde eu a obtenho?';
	@override String get a => 'Escolha uma nova senha de criptografia e insira-a acima.\nO Saber gerará suas chaves de criptografia automaticamente a partir desta senha.';
}

// Path: login.encLoginStep.encFaq.2
class Translations$login$encLoginStep$encFaq$2$pt extends Translations$login$encLoginStep$encFaq$2$en {
	Translations$login$encLoginStep$encFaq$2$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get q => 'Posso usar a mesma senha da minha conta Nextcloud?';
	@override String get a => 'Sim, mas tenha em mente que seria mais fácil para o administrador do servidor ou outra pessoa acessar suas anotações se obtiverem acesso à sua conta Nextcloud.';
}

// Path: editor.menu.boxFits
class Translations$editor$menu$boxFits$pt extends Translations$editor$menu$boxFits$en {
	Translations$editor$menu$boxFits$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get fill => 'Esticar';
	@override String get cover => 'Cobrir';
	@override String get contain => 'Conter';
}

// Path: editor.menu.bgPatterns
class Translations$editor$menu$bgPatterns$pt extends Translations$editor$menu$bgPatterns$en {
	Translations$editor$menu$bgPatterns$pt.internal(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

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
