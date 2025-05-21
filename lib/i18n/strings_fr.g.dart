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
class TranslationsFr extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonFr common = _TranslationsCommonFr._(_root);
	@override late final _TranslationsHomeFr home = _TranslationsHomeFr._(_root);
	@override late final _TranslationsSettingsFr settings = _TranslationsSettingsFr._(_root);
	@override late final _TranslationsLogsFr logs = _TranslationsLogsFr._(_root);
	@override late final _TranslationsLoginFr login = _TranslationsLoginFr._(_root);
	@override late final _TranslationsProfileFr profile = _TranslationsProfileFr._(_root);
	@override late final _TranslationsAppInfoFr appInfo = _TranslationsAppInfoFr._(_root);
	@override late final _TranslationsUpdateFr update = _TranslationsUpdateFr._(_root);
	@override late final _TranslationsEditorFr editor = _TranslationsEditorFr._(_root);
}

// Path: common
class _TranslationsCommonFr extends TranslationsCommonEn {
	_TranslationsCommonFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Annuler';
	@override String get done => 'Fait';
	@override String get continueBtn => 'Continuer';
}

// Path: home
class _TranslationsHomeFr extends TranslationsHomeEn {
	_TranslationsHomeFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeTabsFr tabs = _TranslationsHomeTabsFr._(_root);
	@override late final _TranslationsHomeTitlesFr titles = _TranslationsHomeTitlesFr._(_root);
	@override late final _TranslationsHomeTooltipsFr tooltips = _TranslationsHomeTooltipsFr._(_root);
	@override late final _TranslationsHomeCreateFr create = _TranslationsHomeCreateFr._(_root);
	@override String get welcome => 'Bienvenue dans Saber';
	@override String get invalidFormat => 'Type de fichier non supporté. Veuillez choisr un fichier .sbn, .sbn2, .sba ou .pdf.';
	@override String get noFiles => 'Aucun fichier trouvé';
	@override String get noPreviewAvailable => 'Aucun aperçu disponible';
	@override String get createNewNote => 'Presser le bouton + pour créer une nouvelle note';
	@override String get backFolder => 'Retour au dossier précédent';
	@override late final _TranslationsHomeNewFolderFr newFolder = _TranslationsHomeNewFolderFr._(_root);
	@override late final _TranslationsHomeRenameNoteFr renameNote = _TranslationsHomeRenameNoteFr._(_root);
	@override late final _TranslationsHomeMoveNoteFr moveNote = _TranslationsHomeMoveNoteFr._(_root);
	@override String get deleteNote => 'Effacer la note';
	@override late final _TranslationsHomeRenameFolderFr renameFolder = _TranslationsHomeRenameFolderFr._(_root);
	@override late final _TranslationsHomeDeleteFolderFr deleteFolder = _TranslationsHomeDeleteFolderFr._(_root);
}

// Path: settings
class _TranslationsSettingsFr extends TranslationsSettingsEn {
	_TranslationsSettingsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPrefCategoriesFr prefCategories = _TranslationsSettingsPrefCategoriesFr._(_root);
	@override late final _TranslationsSettingsPrefLabelsFr prefLabels = _TranslationsSettingsPrefLabelsFr._(_root);
	@override late final _TranslationsSettingsPrefDescriptionsFr prefDescriptions = _TranslationsSettingsPrefDescriptionsFr._(_root);
	@override late final _TranslationsSettingsThemeModesFr themeModes = _TranslationsSettingsThemeModesFr._(_root);
	@override late final _TranslationsSettingsLayoutSizesFr layoutSizes = _TranslationsSettingsLayoutSizesFr._(_root);
	@override late final _TranslationsSettingsAccentColorPickerFr accentColorPicker = _TranslationsSettingsAccentColorPickerFr._(_root);
	@override String get systemLanguage => 'Langue système';
	@override List<String> get axisDirections => [
		'Haut',
		'Droite',
		'Bas',
		'Gauche',
	];
	@override late final _TranslationsSettingsResetFr reset = _TranslationsSettingsResetFr._(_root);
	@override String get resyncEverything => 'Tout re-syncroniser';
	@override late final _TranslationsSettingsCustomDataDirFr customDataDir = _TranslationsSettingsCustomDataDirFr._(_root);
	@override String get openDataDir => 'Ouvrir le dossier Saber';
}

// Path: logs
class _TranslationsLogsFr extends TranslationsLogsEn {
	_TranslationsLogsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get logs => 'Journaux';
	@override String get viewLogs => 'Afficher les journaux';
	@override String get debuggingInfo => 'Les journaux contiennent des informations utiles pour le débogage et le développement';
	@override String get noLogs => 'Pas de journaux ici !';
	@override String get logsAreTemporary => 'Les journaux ne sont conservés que jusqu\'à la fermeture de l\'application';
}

// Path: login
class _TranslationsLoginFr extends TranslationsLoginEn {
	_TranslationsLoginFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Connexion';
	@override late final _TranslationsLoginFormFr form = _TranslationsLoginFormFr._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Pas encore de compte ? '),
		linkToSignup('Sign up now'),
		const TextSpan(text: ' !'),
	]);
	@override late final _TranslationsLoginStatusFr status = _TranslationsLoginStatusFr._(_root);
	@override late final _TranslationsLoginNcLoginStepFr ncLoginStep = _TranslationsLoginNcLoginStepFr._(_root);
	@override late final _TranslationsLoginEncLoginStepFr encLoginStep = _TranslationsLoginEncLoginStepFr._(_root);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		undoLogin('Pas toi'),
	]);
}

// Path: profile
class _TranslationsProfileFr extends TranslationsProfileEn {
	_TranslationsProfileFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mon profil';
	@override String get logout => 'Déconnexion';
	@override late final _TranslationsProfileQuickLinksFr quickLinks = _TranslationsProfileQuickLinksFr._(_root);
	@override List<dynamic> get faq => [
		_TranslationsProfile$faq$0i0$Fr._(_root),
		_TranslationsProfile$faq$0i1$Fr._(_root),
		_TranslationsProfile$faq$0i2$Fr._(_root),
		_TranslationsProfile$faq$0i3$Fr._(_root),
	];
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Vous utilisez ${used} sur ${total} (${percent}%)';
	@override String get connectedTo => 'Connecté à';
	@override String get faqTitle => 'Questions fréquemment posées';
}

// Path: appInfo
class _TranslationsAppInfoFr extends TranslationsAppInfoEn {
	_TranslationsAppInfoFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nCe programme est livré sans aucune garantie. Il s\'agit d\'un logiciel libre, et vous pouvez le diffuser sous certaines conditions.';
	@override String get dirty => 'DIRTY';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Appuyer ici pour me soutenir ou acheter ou acheter plus d\'espace de stockage';
	@override String get licenseButton => 'Appuyer ici pour plus d\'information de licence';
	@override String get privacyPolicyButton => 'Appuyez ici pour voir la politique de confidentialité';
}

// Path: update
class _TranslationsUpdateFr extends TranslationsUpdateEn {
	_TranslationsUpdateFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Mise à jour disponible';
	@override String get updateAvailableDescription => 'Une nouvelle version de cette application est disponible, avec les changements suivants :';
	@override String get update => 'Mettre à jour';
	@override String get downloadNotAvailableYet => 'Le téléchargement n\'est pas encore disponible pour votre plateforme. Veuillez revenir sous peu.';
}

// Path: editor
class _TranslationsEditorFr extends TranslationsEditorEn {
	_TranslationsEditorFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsEditorToolbarFr toolbar = _TranslationsEditorToolbarFr._(_root);
	@override late final _TranslationsEditorPensFr pens = _TranslationsEditorPensFr._(_root);
	@override late final _TranslationsEditorPenOptionsFr penOptions = _TranslationsEditorPenOptionsFr._(_root);
	@override late final _TranslationsEditorColorsFr colors = _TranslationsEditorColorsFr._(_root);
	@override late final _TranslationsEditorImageOptionsFr imageOptions = _TranslationsEditorImageOptionsFr._(_root);
	@override late final _TranslationsEditorSelectionBarFr selectionBar = _TranslationsEditorSelectionBarFr._(_root);
	@override late final _TranslationsEditorMenuFr menu = _TranslationsEditorMenuFr._(_root);
	@override late final _TranslationsEditorNewerFileFormatFr newerFileFormat = _TranslationsEditorNewerFileFormatFr._(_root);
	@override late final _TranslationsEditorQuillFr quill = _TranslationsEditorQuillFr._(_root);
	@override late final _TranslationsEditorHudFr hud = _TranslationsEditorHudFr._(_root);
	@override String get pages => 'Pages';
	@override String get untitled => 'Sans titre';
	@override String get needsToSaveBeforeExiting => 'Sauvegarde en cours... Vous pourrez quitter l\'éditeur en toute sécurité une fois qu\'elle sera terminée';
}

// Path: home.tabs
class _TranslationsHomeTabsFr extends TranslationsHomeTabsEn {
	_TranslationsHomeTabsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Accueil';
	@override String get browse => 'Parcourir';
	@override String get whiteboard => 'Tableau blanc';
	@override String get settings => 'Paramètres';
}

// Path: home.titles
class _TranslationsHomeTitlesFr extends TranslationsHomeTitlesEn {
	_TranslationsHomeTitlesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Notes récentes';
	@override String get browse => 'Parcourir';
	@override String get whiteboard => 'Tableau blanc';
	@override String get settings => 'Paramètres';
}

// Path: home.tooltips
class _TranslationsHomeTooltipsFr extends TranslationsHomeTooltipsEn {
	_TranslationsHomeTooltipsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nouvelle note';
	@override String get showUpdateDialog => 'Afficher le dialogue de mise à jour';
	@override String get exportNote => 'Exporter la note';
}

// Path: home.create
class _TranslationsHomeCreateFr extends TranslationsHomeCreateEn {
	_TranslationsHomeCreateFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nouvelle note';
	@override String get importNote => 'Importer une note';
}

// Path: home.newFolder
class _TranslationsHomeNewFolderFr extends TranslationsHomeNewFolderEn {
	_TranslationsHomeNewFolderFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get newFolder => 'Nouveau dossier';
	@override String get folderName => 'Nom du dossier';
	@override String get create => 'Créer';
	@override String get folderNameEmpty => 'Le nom de fichier ne peut pas être vide';
	@override String get folderNameContainsSlash => 'Le nom de fichier ne peut pas contenir une barre oblique';
	@override String get folderNameExists => 'Un fichier du même nom existe déjà';
}

// Path: home.renameNote
class _TranslationsHomeRenameNoteFr extends TranslationsHomeRenameNoteEn {
	_TranslationsHomeRenameNoteFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Renommer une note';
	@override String get noteName => 'Nom de note';
	@override String get rename => 'Renommer';
	@override String get noteNameEmpty => 'Le nom de note ne peut pas être vide';
	@override String get noteNameContainsSlash => 'Le nom de note ne peut pas contenir une barre oblique';
	@override String get noteNameExists => 'Une note du même nom existe déjà';
}

// Path: home.moveNote
class _TranslationsHomeMoveNoteFr extends TranslationsHomeMoveNoteEn {
	_TranslationsHomeMoveNoteFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get moveNote => 'Déplacer la note';
	@override String moveNotes({required Object n}) => 'Déplacer ${n} notes';
	@override String moveName({required Object f}) => 'Déplacer ${f}';
	@override String get move => 'Déplacer';
	@override String renamedTo({required Object newName}) => 'La note sera renommée en ${newName}';
	@override String get multipleRenamedTo => 'Les notes suivantes vont être renommées :';
	@override String numberRenamedTo({required Object n}) => '${n} notes vont être renommées pour résoudre des conflits';
}

// Path: home.renameFolder
class _TranslationsHomeRenameFolderFr extends TranslationsHomeRenameFolderEn {
	_TranslationsHomeRenameFolderFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get renameFolder => 'Renommer le dossier';
	@override String get folderName => 'Nom de dossier';
	@override String get rename => 'Renommer';
	@override String get folderNameEmpty => 'Le nom de dossier ne peut pas être vide';
	@override String get folderNameContainsSlash => 'Le nom de dossier ne peut pas contenir une barre oblique';
	@override String get folderNameExists => 'Un dossier du même nom existe déjà';
}

// Path: home.deleteFolder
class _TranslationsHomeDeleteFolderFr extends TranslationsHomeDeleteFolderEn {
	_TranslationsHomeDeleteFolderFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Supprimer le dossier';
	@override String deleteName({required Object f}) => 'Supprimer ${f}';
	@override String get delete => 'Supprimer';
	@override String get alsoDeleteContents => 'Supprimer aussi toutes les notes rangées dans ce dossier';
}

// Path: settings.prefCategories
class _TranslationsSettingsPrefCategoriesFr extends TranslationsSettingsPrefCategoriesEn {
	_TranslationsSettingsPrefCategoriesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get general => 'Général';
	@override String get writing => 'Tracé';
	@override String get editor => 'Editeur';
	@override String get performance => 'Performance';
	@override String get advanced => 'Avancé';
}

// Path: settings.prefLabels
class _TranslationsSettingsPrefLabelsFr extends TranslationsSettingsPrefLabelsEn {
	_TranslationsSettingsPrefLabelsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get locale => 'Langue';
	@override String get appTheme => 'Thème de l\'application';
	@override String get platform => 'Type de thème';
	@override String get layoutSize => 'Type de disposition';
	@override String get customAccentColor => 'Couleur d\'accentuation personnalisée';
	@override String get hyperlegibleFont => 'Fonte Hyperlegible';
	@override String get shouldCheckForUpdates => 'Rechercher automatiquement les mises à jour';
	@override String get shouldAlwaysAlertForUpdates => 'M\'alerter à chaque mise à jour';
	@override String get allowInsecureConnections => 'Autoriser les connexions non sécurisées';
	@override String get editorToolbarAlignment => 'Position de la barre d\'outils';
	@override String get editorToolbarShowInFullscreen => 'Afficher la barre d\'outils en mode plein écran';
	@override String get editorAutoInvert => 'Inverser les couleurs en mode sombre';
	@override String get preferGreyscale => 'Préférer les nuances de gris';
	@override String get maxImageSize => 'Taille d\'image maximum';
	@override String get autoClearWhiteboardOnExit => 'Effacer le tableau blanc quand vous fermez l\'application';
	@override String get disableEraserAfterUse => 'Désactiver automatiquement la gomme après usage';
	@override String get hideFingerDrawingToggle => 'Cacher l\'icône d\'activation/désactivation de tracé au doigt';
	@override String get editorPromptRename => 'Vous rappeler de renommer les notes';
	@override String get hideHomeBackgrounds => 'Cacher le fond de la page d\'accueil';
	@override String get recentColorsDontSavePresets => 'Ne pas conserver les couleurs pré-définies parmi les couleurs récentes';
	@override String get recentColorsLength => 'Nombre de couleurs récentes à conserver';
	@override String get printPageIndicators => 'Imprimer les numéros de pages';
	@override String get autosaveDelay => 'Délai entre les sauvegardes automatiques';
	@override String get shapeRecognitionDelay => 'Délai de reconnaissance de forme';
	@override String get simplifiedHomeLayout => 'Aménagement d\'une maison simplifié';
	@override String get pencilSoundSetting => 'Effet sonore de crayon';
	@override String get customDataDir => 'Répertoire de données personnalisé';
	@override String get autoStraightenLines => 'Redresser automatiquement les lignes';
}

// Path: settings.prefDescriptions
class _TranslationsSettingsPrefDescriptionsFr extends TranslationsSettingsPrefDescriptionsEn {
	_TranslationsSettingsPrefDescriptionsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'La fonte Atkinson Hyperlegible améliore la lisibilité pour les personnes malvoyantes';
	@override String get allowInsecureConnections => '(Déconseillé) Autoriser Saber à se connecter à des serveurs dont les certificats sont auto-signés/non-sécurisé';
	@override String get preferGreyscale => 'Pour les couleurs de stylos proposées';
	@override String get autoClearWhiteboardOnExit => 'Il restera synchronisé avec vos autres appareils';
	@override String get disableEraserAfterUse => 'Revenir automatiquement au stylo après usage de la gomme';
	@override String get maxImageSize => 'Les images plus grandes seront compressées';
	@override late final _TranslationsSettingsPrefDescriptionsHideFingerDrawingFr hideFingerDrawing = _TranslationsSettingsPrefDescriptionsHideFingerDrawingFr._(_root);
	@override String get editorPromptRename => 'Vous pourrez toujours les renommer plus tard';
	@override String get hideHomeBackgrounds => 'Pour une apparence plus sobre';
	@override String get printPageIndicators => 'Montrer les numéros de pages dans les exportations';
	@override String get autosaveDelay => 'Combien de temps attendre avant de sauvegarder automatiquement une note';
	@override String get shapeRecognitionDelay => 'Avec quelle fréquence mettre à jour la prévisualisation de forme';
	@override String get shouldAlwaysAlertForUpdates => 'Me prévenir dès qu\'une mise à jour est disponible';
	@override late final _TranslationsSettingsPrefDescriptionsPencilSoundSettingFr pencilSoundSetting = _TranslationsSettingsPrefDescriptionsPencilSoundSettingFr._(_root);
	@override String get simplifiedHomeLayout => 'Définit une hauteur fixe pour chaque aperçu de note';
	@override String get autoStraightenLines => 'Redresse les longues lignes sans avoir à utiliser le stylo de forme';
}

// Path: settings.themeModes
class _TranslationsSettingsThemeModesFr extends TranslationsSettingsThemeModesEn {
	_TranslationsSettingsThemeModesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Système';
	@override String get light => 'Clair';
	@override String get dark => 'Foncé';
}

// Path: settings.layoutSizes
class _TranslationsSettingsLayoutSizesFr extends TranslationsSettingsLayoutSizesEn {
	_TranslationsSettingsLayoutSizesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Auto';
	@override String get phone => 'Smartphone';
	@override String get tablet => 'Tablette';
}

// Path: settings.accentColorPicker
class _TranslationsSettingsAccentColorPickerFr extends TranslationsSettingsAccentColorPickerEn {
	_TranslationsSettingsAccentColorPickerFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Choisir une couleur';
}

// Path: settings.reset
class _TranslationsSettingsResetFr extends TranslationsSettingsResetEn {
	_TranslationsSettingsResetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rétablir les valeurs par défaut ?';
	@override String get button => 'Défaut';
}

// Path: settings.customDataDir
class _TranslationsSettingsCustomDataDirFr extends TranslationsSettingsCustomDataDirEn {
	_TranslationsSettingsCustomDataDirFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Annuler';
	@override String get select => 'Sélectionner';
	@override String get mustBeEmpty => 'Le répertoire sélectionné doit être vide';
	@override String get mustBeDoneSyncing => 'Assurez-vous que la synchronisation est terminée avant de modifier le répertoire';
}

// Path: login.form
class _TranslationsLoginFormFr extends TranslationsLoginFormEn {
	_TranslationsLoginFormFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'En vous connectant, vous acceptez les '),
		linkToPrivacyPolicy('Privacy Policy'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _TranslationsLoginStatusFr extends TranslationsLoginStatusEn {
	_TranslationsLoginStatusFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Déconnecté';
	@override String get tapToLogin => 'Appuyer pour vous connecter avec Nextcloud';
	@override String get loggedIn => 'Connecté avec Nextcloud';
	@override String hi({required Object u}) => 'Salut, ${u}!';
	@override String get almostDone => 'Presque prêt pour la synchronisation, appuyez pour terminer la connexion';
}

// Path: login.ncLoginStep
class _TranslationsLoginNcLoginStepFr extends TranslationsLoginNcLoginStepEn {
	_TranslationsLoginNcLoginStepFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsLoginNcLoginStepLoginFlowFr loginFlow = _TranslationsLoginNcLoginStepLoginFlowFr._(_root);
	@override String get whereToStoreData => 'Choisissez où vous souhaitez stocker vos données :';
	@override String get saberNcServer => 'Le serveur Nextcloud de Saber';
	@override String get otherNcServer => 'Autre serveur Nextcloud';
	@override String get serverUrl => 'URL du serveur';
	@override String get loginWithSaber => 'Connectez-vous avec Saber';
	@override String get loginWithNextcloud => 'Connectez-vous avec Nextcloud';
}

// Path: login.encLoginStep
class _TranslationsLoginEncLoginStepFr extends TranslationsLoginEncLoginStepEn {
	_TranslationsLoginEncLoginStepFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Pour protéger vos données, veuillez saisir votre mot de passe de cryptage :';
	@override String get newToSaber => 'Nouveau sur Saber';
	@override String get encPassword => 'Mot de passe de cryptage';
	@override String get encFaqTitle => 'Questions fréquemment posées';
	@override String get wrongEncPassword => 'Le décryptage a échoué avec le mot de passe fourni. Veuillez réessayer de le saisir.';
	@override String get connectionFailed => 'Une erreur s\'est produite lors de la connexion au serveur. Veuillez réessayer plus tard.';
	@override List<dynamic> get encFaq => [
		_TranslationsLoginEncLoginStep$encFaq$0i0$Fr._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i1$Fr._(_root),
		_TranslationsLoginEncLoginStep$encFaq$0i2$Fr._(_root),
	];
}

// Path: profile.quickLinks
class _TranslationsProfileQuickLinksFr extends TranslationsProfileQuickLinksEn {
	_TranslationsProfileQuickLinksFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Page d\'accueil du serveur';
	@override String get deleteAccount => 'Supprimer le compte';
}

// Path: profile.faq.0
class _TranslationsProfile$faq$0i0$Fr extends TranslationsProfile$faq$0i0$En {
	_TranslationsProfile$faq$0i0$Fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Vais-je perdre mes notes si je me déconnecte ?';
	@override String get a => 'Non. Vos notes seront conservées à la fois sur votre poste et sur le serveur. Elles ne seront pas synchronisées avec le serveur jusqu\'à votre prochaine connexion. Assurez-vous que la synchronisation soit terminée avant de vous déconnecter pour ne perdre aucune donnée (consultez la barre de progression sur l\'écran d\'accueil).';
}

// Path: profile.faq.1
class _TranslationsProfile$faq$0i1$Fr extends TranslationsProfile$faq$0i1$En {
	_TranslationsProfile$faq$0i1$Fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Comment changer mon mot de passe Nextcloud ?';
	@override String get a => 'Allez sur le site web du serveur et connectez-vous. Allez dans Paramètres > Sécurité > Changer mon mot de passe. Vous devrez vous déconnecter et vous reconnecter dans Saber après avoir changé votre mot de passe.';
}

// Path: profile.faq.2
class _TranslationsProfile$faq$0i2$Fr extends TranslationsProfile$faq$0i2$En {
	_TranslationsProfile$faq$0i2$Fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Comment changer mon mot de passe de chiffrement ?';
	@override String get a => '1. Déconnectez-vous de Saber. Assurez-vous que la synchronisation soit terminée avant de vous déconnecter afin de ne perdre aucune donnée (consultez la barre de progression sur l\'écran d\'accueil).\n2. Sur le site web du serveur supprimez votre dossier \'Saber\'. Cela supprimera toutes vos notes sur le serveur.\n3. Connectez-vous à nouveau dans Saber. Vous pourrez choisir un nouveau mot de passe de chiffrement à la connexion.\n4. N\'oubliez pas de vous déconnecter et vous re-connecter dans Saber sur votre poste également.';
}

// Path: profile.faq.3
class _TranslationsProfile$faq$0i3$Fr extends TranslationsProfile$faq$0i3$En {
	_TranslationsProfile$faq$0i3$Fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Comment puis-je supprimer mon compte ?';
	@override String get a => 'Cliquez sur le button "${_root.profile.quickLinks.deleteAccount}" ci-dessus, et connectez-vous si nécessaire.\nSi vous utilisez le serveur Saber officiel, votre compte sera supprimé au bout d\'une semaine . Durant cette période, vous pourrez me contacter à adilhanney@disroot.org pour annuler la suppression.\nSi vous utilisez un autre serveur, il n\'est pas certain que vous puissiez supprimer votre compte dessus : il vous faudra consulter les règles de confidentialité du serveur pour plus d\'informations.';
}

// Path: editor.toolbar
class _TranslationsEditorToolbarFr extends TranslationsEditorToolbarEn {
	_TranslationsEditorToolbarFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get toggleColors => 'Afficher/cacher les couleurs (Ctrl C)';
	@override String get select => 'Sélectionner';
	@override String get toggleEraser => 'Activer/désactiver la gomme (Ctrl E)';
	@override String get photo => 'Images';
	@override String get text => 'Texte';
	@override String get toggleFingerDrawing => 'Activer/désactiver le tracé (Ctrl F)';
	@override String get undo => 'Annuler';
	@override String get redo => 'Refaire';
	@override String get export => 'Exporter (Ctrl Shift S)';
	@override String get exportAs => 'Exporter comme :';
	@override String get fullscreen => 'Basculer en plein ecran (F11)';
}

// Path: editor.pens
class _TranslationsEditorPensFr extends TranslationsEditorPensEn {
	_TranslationsEditorPensFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get fountainPen => 'Stylo encre';
	@override String get ballpointPen => 'Stylo bille';
	@override String get highlighter => 'Surligneur';
	@override String get pencil => 'Crayon';
	@override String get shapePen => 'Forme du stylo';
	@override String get laserPointer => 'Pointeur laser';
}

// Path: editor.penOptions
class _TranslationsEditorPenOptionsFr extends TranslationsEditorPenOptionsEn {
	_TranslationsEditorPenOptionsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get size => 'Taille';
}

// Path: editor.colors
class _TranslationsEditorColorsFr extends TranslationsEditorColorsEn {
	_TranslationsEditorColorsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get colorPicker => 'Pipette de couleur';
	@override String customBrightnessHue({required Object b, required Object h}) => 'Personnaliser ${b} ${h}';
	@override String customHue({required Object h}) => 'Personnaliser ${h}';
	@override String get dark => 'sombre';
	@override String get light => 'clair';
	@override String get black => 'Noir';
	@override String get darkGrey => 'Gris sombre';
	@override String get grey => 'Gris';
	@override String get lightGrey => 'Gris clair';
	@override String get white => 'Blanc';
	@override String get red => 'Rouge';
	@override String get green => 'Vert';
	@override String get cyan => 'Cyan';
	@override String get blue => 'Bleu';
	@override String get yellow => 'Jaune';
	@override String get purple => 'Violet';
	@override String get pink => 'Rose';
	@override String get orange => 'Orange';
	@override String get pastelRed => 'Rouge pâle';
	@override String get pastelOrange => 'Orange pâle';
	@override String get pastelYellow => 'Jaune pâle';
	@override String get pastelGreen => 'Vert pâle';
	@override String get pastelCyan => 'Cyan pâle';
	@override String get pastelBlue => 'Bleu pâle';
	@override String get pastelPurple => 'Violet pâle';
	@override String get pastelPink => 'Rose pâle';
}

// Path: editor.imageOptions
class _TranslationsEditorImageOptionsFr extends TranslationsEditorImageOptionsEn {
	_TranslationsEditorImageOptionsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Options d\'image';
	@override String get invertible => 'Couleurs inversibles';
	@override String get download => 'Télécharger';
	@override String get setAsBackground => 'Utiliser comme fond';
	@override String get removeAsBackground => 'Supprimer de l\'arrière-plan';
	@override String get delete => 'Effacer';
}

// Path: editor.selectionBar
class _TranslationsEditorSelectionBarFr extends TranslationsEditorSelectionBarEn {
	_TranslationsEditorSelectionBarFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Effacer';
	@override String get duplicate => 'Dupliquer';
}

// Path: editor.menu
class _TranslationsEditorMenuFr extends TranslationsEditorMenuEn {
	_TranslationsEditorMenuFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String clearPage({required Object page, required Object totalPages}) => 'Effacer la page ${page}/${totalPages}';
	@override String get clearAllPages => 'Effacer toutes les pages';
	@override String get insertPage => 'Insérer une page après';
	@override String get duplicatePage => 'Dupliquer la page';
	@override String get deletePage => 'Supprimer la page';
	@override String get lineHeight => 'Hauteur de ligne';
	@override String get backgroundImageFit => 'Adaptation de l\'image de fond';
	@override String get backgroundPattern => 'Texture de fond';
	@override String get import => 'Importer';
	@override late final _TranslationsEditorMenuBoxFitsFr boxFits = _TranslationsEditorMenuBoxFitsFr._(_root);
	@override late final _TranslationsEditorMenuBgPatternsFr bgPatterns = _TranslationsEditorMenuBgPatternsFr._(_root);
	@override String get lineThickness => 'Épaisseur de ligne';
	@override String get lineThicknessDescription => 'Épaisseur de ligne de fond';
	@override String get watchServer => 'Surveillez les mises à jour sur le serveur';
	@override String get watchServerReadOnly => 'L\'édition est désactivée lorsque vous regardez le serveur';
	@override String get lineHeightDescription => 'Contrôle également la taille du texte pour les notes saisies';
}

// Path: editor.newerFileFormat
class _TranslationsEditorNewerFileFormatFr extends TranslationsEditorNewerFileFormatEn {
	_TranslationsEditorNewerFileFormatFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get readOnlyMode => 'Mode lecture seule';
	@override String get title => 'Cette note a été modifiée avec une version plus récente de Saber';
	@override String get subtitle => 'Éditer cette note pourrait entraîner la perte de certaines informations. Voulez-vous la modifier quand même ?';
	@override String get allowEditing => 'Autoriser les modifications';
}

// Path: editor.quill
class _TranslationsEditorQuillFr extends TranslationsEditorQuillEn {
	_TranslationsEditorQuillFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Taper du texte ici...';
}

// Path: editor.hud
class _TranslationsEditorHudFr extends TranslationsEditorHudEn {
	_TranslationsEditorHudFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Déverrouiller le zoom';
	@override String get lockZoom => 'Verrouiller le zoom';
	@override String get unlockSingleFingerPan => 'Activer le défilement à un seul doigt';
	@override String get lockSingleFingerPan => 'Désactiver le défilement à un seul doigt';
	@override String get unlockAxisAlignedPan => 'Déverrouiller le panoramique à l\'horizontale ou à la verticale';
	@override String get lockAxisAlignedPan => 'Verrouiller le panoramique à l\'horizontale ou à la verticale';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _TranslationsSettingsPrefDescriptionsHideFingerDrawingFr extends TranslationsSettingsPrefDescriptionsHideFingerDrawingEn {
	_TranslationsSettingsPrefDescriptionsHideFingerDrawingFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Empêcher l\'activation/désactivation accidentelle';
	@override String get fixedOn => 'Le tracé au doigt est fixé à activé';
	@override String get fixedOff => 'Le tracé au doigt est fixé à désactivé';
}

// Path: settings.prefDescriptions.pencilSoundSetting
class _TranslationsSettingsPrefDescriptionsPencilSoundSettingFr extends TranslationsSettingsPrefDescriptionsPencilSoundSettingEn {
	_TranslationsSettingsPrefDescriptionsPencilSoundSettingFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get off => 'Pas de son';
	@override String get onButNotInSilentMode => 'Activé (sauf en mode silencieux)';
	@override String get onAlways => 'Activé (même en mode silencieux)';
}

// Path: login.ncLoginStep.loginFlow
class _TranslationsLoginNcLoginStepLoginFlowFr extends TranslationsLoginNcLoginStepLoginFlowEn {
	_TranslationsLoginNcLoginStepLoginFlowFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Veuillez autoriser Saber à accéder à votre compte Nextcloud';
	@override String get followPrompts => 'Veuillez suivre les instructions de votre navigateur.';
	@override String get browserDidntOpen => 'Le navigateur ne s\'est pas ouvert';
}

// Path: login.encLoginStep.encFaq.0
class _TranslationsLoginEncLoginStep$encFaq$0i0$Fr extends TranslationsLoginEncLoginStep$encFaq$0i0$En {
	_TranslationsLoginEncLoginStep$encFaq$0i0$Fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Qu\'est-ce que le mot de passe de cryptage ?';
	@override String get a => 'Le mot de passe de cryptage est utilisé pour crypter vos données avant qu\'elles ne soient envoyées au serveur. Vous le créez lors de votre première connexion à Saber, et il est indépendant de votre compte et de votre mot de passe sur Nextcloud.\nPersonne ne peut accéder à vos notes sur le serveur sans votre mot de passe de chiffrement. Cela implique aussi que si vous oubliez votre mot de passe de cryptage, vous perdrez l\'accès à vos données.';
}

// Path: login.encLoginStep.encFaq.1
class _TranslationsLoginEncLoginStep$encFaq$0i1$Fr extends TranslationsLoginEncLoginStep$encFaq$0i1$En {
	_TranslationsLoginEncLoginStep$encFaq$0i1$Fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Pourquoi utiliser deux mots de passe ?';
	@override String get a => 'Le mot de passe Nextcloud est utilisé pour accéder au nuage (cloud). Le mot de passe de cryptage "brouille" vos données avant même qu\'elles n\'atteignent le nuage.\nMême si quelqu\'un accède à votre compte Nextcloud, vos notes resteront sécurisées et cryptées avec un mot de passe distinct. Cela crée un deuxième niveau de sécurité pour protéger vos données.';
}

// Path: login.encLoginStep.encFaq.2
class _TranslationsLoginEncLoginStep$encFaq$0i2$Fr extends TranslationsLoginEncLoginStep$encFaq$0i2$En {
	_TranslationsLoginEncLoginStep$encFaq$0i2$Fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Puis-je utiliser le même mot de passe pour les deux ?';
	@override String get a => 'Oui, mais c\'est moins sécurisé. Comme votre mot de passe sur Nextcloud est envoyé au serveur, toute personne qui y aurait accès pourrait decrypter vos notes. N\'utilisez le même mot de passe que si vous faites confiance aux personnes qui gèrent le serveur.';
}

// Path: editor.menu.boxFits
class _TranslationsEditorMenuBoxFitsFr extends TranslationsEditorMenuBoxFitsEn {
	_TranslationsEditorMenuBoxFitsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get fill => 'S\'ajuste';
	@override String get cover => 'Couvre';
	@override String get contain => 'Contient';
}

// Path: editor.menu.bgPatterns
class _TranslationsEditorMenuBgPatternsFr extends TranslationsEditorMenuBgPatternsEn {
	_TranslationsEditorMenuBgPatternsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get none => 'Vide';
	@override String get college => 'Lignes et marge';
	@override String get collegeRtl => 'College-ruled (Reverse)';
	@override String get lined => 'Lignes';
	@override String get grid => 'Grille';
	@override String get dots => 'Points';
	@override String get staffs => 'Staffs';
	@override String get tablature => 'Tablature';
	@override String get cornell => 'Cornell';
}
