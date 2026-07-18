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
class TranslationsFr extends Translations with BaseTranslations<AppLocale, Translations> {
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
	@override late final _Translations$common$fr common = _Translations$common$fr._(_root);
	@override late final _Translations$home$fr home = _Translations$home$fr._(_root);
	@override late final _Translations$sentry$fr sentry = _Translations$sentry$fr._(_root);
	@override late final _Translations$settings$fr settings = _Translations$settings$fr._(_root);
	@override late final _Translations$logs$fr logs = _Translations$logs$fr._(_root);
	@override late final _Translations$login$fr login = _Translations$login$fr._(_root);
	@override late final _Translations$profile$fr profile = _Translations$profile$fr._(_root);
	@override late final _Translations$appInfo$fr appInfo = _Translations$appInfo$fr._(_root);
	@override late final _Translations$update$fr update = _Translations$update$fr._(_root);
	@override late final _Translations$editor$fr editor = _Translations$editor$fr._(_root);
}

// Path: common
class _Translations$common$fr extends Translations$common$en {
	_Translations$common$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Annuler';
	@override String get done => 'Fait';
	@override String get continueBtn => 'Continuer';
}

// Path: home
class _Translations$home$fr extends Translations$home$en {
	_Translations$home$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$tabs$fr tabs = _Translations$home$tabs$fr._(_root);
	@override late final _Translations$home$titles$fr titles = _Translations$home$titles$fr._(_root);
	@override late final _Translations$home$tooltips$fr tooltips = _Translations$home$tooltips$fr._(_root);
	@override late final _Translations$home$create$fr create = _Translations$home$create$fr._(_root);
	@override String get welcome => 'Bienvenue dans Saber';
	@override String get invalidFormat => 'Type de fichier non supporté. Veuillez choisr un fichier .sbn, .sbn2, .sba ou .pdf.';
	@override String get noFiles => 'Aucun fichier trouvé';
	@override String get createNewNote => 'Presser le bouton + pour créer une nouvelle note';
	@override String get backFolder => 'Retour au dossier précédent';
	@override late final _Translations$home$newFolder$fr newFolder = _Translations$home$newFolder$fr._(_root);
	@override late final _Translations$home$renameNote$fr renameNote = _Translations$home$renameNote$fr._(_root);
	@override late final _Translations$home$moveNote$fr moveNote = _Translations$home$moveNote$fr._(_root);
	@override String get deleteNote => 'Effacer la note';
	@override late final _Translations$home$deleteNoteDialog$fr deleteNoteDialog = _Translations$home$deleteNoteDialog$fr._(_root);
	@override late final _Translations$home$renameFolder$fr renameFolder = _Translations$home$renameFolder$fr._(_root);
	@override late final _Translations$home$deleteFolder$fr deleteFolder = _Translations$home$deleteFolder$fr._(_root);
	@override String get noPreviewAvailable => 'Aucun aperçu disponible';
}

// Path: sentry
class _Translations$sentry$fr extends Translations$sentry$en {
	_Translations$sentry$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$fr consent = _Translations$sentry$consent$fr._(_root);
}

// Path: settings
class _Translations$settings$fr extends Translations$settings$en {
	_Translations$settings$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$settings$prefCategories$fr prefCategories = _Translations$settings$prefCategories$fr._(_root);
	@override late final _Translations$settings$prefLabels$fr prefLabels = _Translations$settings$prefLabels$fr._(_root);
	@override late final _Translations$settings$prefDescriptions$fr prefDescriptions = _Translations$settings$prefDescriptions$fr._(_root);
	@override late final _Translations$settings$themeModes$fr themeModes = _Translations$settings$themeModes$fr._(_root);
	@override late final _Translations$settings$layoutSizes$fr layoutSizes = _Translations$settings$layoutSizes$fr._(_root);
	@override late final _Translations$settings$accentColorPicker$fr accentColorPicker = _Translations$settings$accentColorPicker$fr._(_root);
	@override String get systemLanguage => 'Langue système';
	@override List<String> get axisDirections => [
		'Haut',
		'Droite',
		'Bas',
		'Gauche',
	];
	@override late final _Translations$settings$reset$fr reset = _Translations$settings$reset$fr._(_root);
	@override String get resyncEverything => 'Tout re-syncroniser';
	@override late final _Translations$settings$customDataDir$fr customDataDir = _Translations$settings$customDataDir$fr._(_root);
	@override String get autosaveDisabled => 'Jamais';
	@override String get shapeRecognitionDisabled => 'Jamais';
	@override String get openDataDir => 'Ouvrir le dossier Saber';
}

// Path: logs
class _Translations$logs$fr extends Translations$logs$en {
	_Translations$logs$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get useTheApp => 'Les journaux apparaîtront ici lorsque vous utilisez l\'application';
	@override String get logs => 'Journaux';
	@override String get viewLogs => 'Afficher les journaux';
	@override String get debuggingInfo => 'Les journaux contiennent des informations utiles pour le débogage et le développement';
	@override String get noLogs => 'Pas de journaux ici !';
}

// Path: login
class _Translations$login$fr extends Translations$login$en {
	_Translations$login$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Connexion';
	@override late final _Translations$login$form$fr form = _Translations$login$form$fr._(_root);
	@override TextSpan signup({required InlineSpanBuilder linkToSignup}) => TextSpan(children: [
		const TextSpan(text: 'Pas encore de compte ? '),
		linkToSignup('Sign up now'),
		const TextSpan(text: ' !'),
	]);
	@override late final _Translations$login$status$fr status = _Translations$login$status$fr._(_root);
	@override late final _Translations$login$ncLoginStep$fr ncLoginStep = _Translations$login$ncLoginStep$fr._(_root);
	@override late final _Translations$login$encLoginStep$fr encLoginStep = _Translations$login$encLoginStep$fr._(_root);
	@override TextSpan notYou({required InlineSpanBuilder undoLogin}) => TextSpan(children: [
		undoLogin('Pas toi'),
	]);
}

// Path: profile
class _Translations$profile$fr extends Translations$profile$en {
	_Translations$profile$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mon profil';
	@override String get logout => 'Déconnexion';
	@override late final _Translations$profile$quickLinks$fr quickLinks = _Translations$profile$quickLinks$fr._(_root);
	@override List<dynamic> get faq => [
		_Translations$profile$faq$0$fr._(_root),
		_Translations$profile$faq$1$fr._(_root),
		_Translations$profile$faq$2$fr._(_root),
		_Translations$profile$faq$3$fr._(_root),
	];
	@override String quotaUsage({required Object used, required Object total, required Object percent}) => 'Vous utilisez ${used} sur ${total} (${percent}%)';
	@override String get connectedTo => 'Connecté à';
	@override String get faqTitle => 'Questions fréquemment posées';
}

// Path: appInfo
class _Translations$appInfo$fr extends Translations$appInfo$en {
	_Translations$appInfo$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String licenseNotice({required Object buildYear}) => 'Saber  Copyright © 2022-${buildYear}  Adil Hanney\nCe programme est livré sans aucune garantie. Il s\'agit d\'un logiciel libre, et vous pouvez le diffuser sous certaines conditions.';
	@override String get debug => 'DEBUG';
	@override String get sponsorButton => 'Appuyer ici pour me soutenir ou acheter ou acheter plus d\'espace de stockage';
	@override String get licenseButton => 'Appuyer ici pour plus d\'information de licence';
	@override String get privacyPolicyButton => 'Appuyez ici pour voir la politique de confidentialité';
}

// Path: update
class _Translations$update$fr extends Translations$update$en {
	_Translations$update$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get updateAvailable => 'Mise à jour disponible';
	@override String get updateAvailableDescription => 'Une nouvelle version de cette application est disponible, avec les changements suivants :';
	@override String get update => 'Mettre à jour';
	@override String get downloadNotAvailableYet => 'Le téléchargement n\'est pas encore disponible pour votre plateforme. Veuillez revenir sous peu.';
}

// Path: editor
class _Translations$editor$fr extends Translations$editor$en {
	_Translations$editor$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$editor$toolbar$fr toolbar = _Translations$editor$toolbar$fr._(_root);
	@override late final _Translations$editor$pens$fr pens = _Translations$editor$pens$fr._(_root);
	@override late final _Translations$editor$penOptions$fr penOptions = _Translations$editor$penOptions$fr._(_root);
	@override late final _Translations$editor$colors$fr colors = _Translations$editor$colors$fr._(_root);
	@override late final _Translations$editor$imageOptions$fr imageOptions = _Translations$editor$imageOptions$fr._(_root);
	@override late final _Translations$editor$selectionBar$fr selectionBar = _Translations$editor$selectionBar$fr._(_root);
	@override late final _Translations$editor$menu$fr menu = _Translations$editor$menu$fr._(_root);
	@override late final _Translations$editor$readOnlyBanner$fr readOnlyBanner = _Translations$editor$readOnlyBanner$fr._(_root);
	@override late final _Translations$editor$versionTooNew$fr versionTooNew = _Translations$editor$versionTooNew$fr._(_root);
	@override late final _Translations$editor$quill$fr quill = _Translations$editor$quill$fr._(_root);
	@override late final _Translations$editor$hud$fr hud = _Translations$editor$hud$fr._(_root);
	@override String get pages => 'Pages';
	@override String get untitled => 'Sans titre';
	@override String get needsToSaveBeforeExiting => 'Sauvegarde en cours... Vous pourrez quitter l\'éditeur en toute sécurité une fois qu\'elle sera terminée';
}

// Path: home.tabs
class _Translations$home$tabs$fr extends Translations$home$tabs$en {
	_Translations$home$tabs$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Accueil';
	@override String get browse => 'Parcourir';
	@override String get whiteboard => 'Tableau blanc';
	@override String get settings => 'Paramètres';
}

// Path: home.titles
class _Translations$home$titles$fr extends Translations$home$titles$en {
	_Translations$home$titles$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Notes récentes';
	@override String get browse => 'Parcourir';
	@override String get whiteboard => 'Tableau blanc';
	@override String get settings => 'Paramètres';
}

// Path: home.tooltips
class _Translations$home$tooltips$fr extends Translations$home$tooltips$en {
	_Translations$home$tooltips$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nouvelle note';
	@override String get showUpdateDialog => 'Afficher le dialogue de mise à jour';
	@override String get exportNote => 'Exporter la note';
}

// Path: home.create
class _Translations$home$create$fr extends Translations$home$create$en {
	_Translations$home$create$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get newNote => 'Nouvelle note';
	@override String get importNote => 'Importer une note';
}

// Path: home.newFolder
class _Translations$home$newFolder$fr extends Translations$home$newFolder$en {
	_Translations$home$newFolder$fr._(TranslationsFr root) : this._root = root, super.internal(root);

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
class _Translations$home$renameNote$fr extends Translations$home$renameNote$en {
	_Translations$home$renameNote$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get renameNote => 'Renommer une note';
	@override String get noteName => 'Nom de note';
	@override String get rename => 'Renommer';
	@override String get noteNameEmpty => 'Le nom de note ne peut pas être vide';
	@override String get noteNameExists => 'Une note du même nom existe déjà';
	@override String get noteNameForbiddenCharacters => 'Le nom de la note contient des caractères interdits';
	@override String get noteNameReserved => 'Nom de la note réservé';
}

// Path: home.moveNote
class _Translations$home$moveNote$fr extends Translations$home$moveNote$en {
	_Translations$home$moveNote$fr._(TranslationsFr root) : this._root = root, super.internal(root);

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

// Path: home.deleteNoteDialog
class _Translations$home$deleteNoteDialog$fr extends Translations$home$deleteNoteDialog$en {
	_Translations$home$deleteNoteDialog$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String confirmDelete({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		one: 'Supprimer définitivement la note sélectionnée ?',
		other: 'Supprimer définitivement les notes sélectionnées ?',
	);
	@override String deleteNotes({required Object n}) => 'Supprimer les notes ${n}';
	@override String deleteName({required Object f}) => 'Supprimer ${f}';
	@override String get delete => 'Supprimer';
}

// Path: home.renameFolder
class _Translations$home$renameFolder$fr extends Translations$home$renameFolder$en {
	_Translations$home$renameFolder$fr._(TranslationsFr root) : this._root = root, super.internal(root);

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
class _Translations$home$deleteFolder$fr extends Translations$home$deleteFolder$en {
	_Translations$home$deleteFolder$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get deleteFolder => 'Supprimer le dossier';
	@override String deleteName({required Object f}) => 'Supprimer ${f}';
	@override String get delete => 'Supprimer';
	@override String get alsoDeleteContents => 'Supprimer aussi toutes les notes rangées dans ce dossier';
}

// Path: sentry.consent
class _Translations$sentry$consent$fr extends Translations$sentry$consent$en {
	_Translations$sentry$consent$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$sentry$consent$description$fr description = _Translations$sentry$consent$description$fr._(_root);
	@override late final _Translations$sentry$consent$answers$fr answers = _Translations$sentry$consent$answers$fr._(_root);
	@override String get title => 'Aidez-moi à améliorer Saber?';
}

// Path: settings.prefCategories
class _Translations$settings$prefCategories$fr extends Translations$settings$prefCategories$en {
	_Translations$settings$prefCategories$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get general => 'Général';
	@override String get writing => 'Tracé';
	@override String get editor => 'Editeur';
	@override String get performance => 'Performance';
	@override String get advanced => 'Avancé';
}

// Path: settings.prefLabels
class _Translations$settings$prefLabels$fr extends Translations$settings$prefLabels$en {
	_Translations$settings$prefLabels$fr._(TranslationsFr root) : this._root = root, super.internal(root);

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
	@override String get recentColorsDontSavePresets => 'Ne pas conserver les couleurs pré-définies parmi les couleurs récentes';
	@override String get recentColorsLength => 'Nombre de couleurs récentes à conserver';
	@override String get printPageIndicators => 'Imprimer les numéros de pages';
	@override String get shapeRecognitionDelay => 'Délai de reconnaissance de forme';
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Désactivation automatique du dessin au doigt';
	@override String get sentry => 'Rapports d\'erreur';
	@override String get autosave => 'S\'attacher automatiquement';
	@override String get simplifiedHomeLayout => 'Aménagement d\'une maison simplifié';
	@override String get customDataDir => 'Répertoire de données personnalisé';
	@override String get autoStraightenLines => 'Redresser automatiquement les lignes';
}

// Path: settings.prefDescriptions
class _Translations$settings$prefDescriptions$fr extends Translations$settings$prefDescriptions$en {
	_Translations$settings$prefDescriptions$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get hyperlegibleFont => 'La fonte Atkinson Hyperlegible améliore la lisibilité pour les personnes malvoyantes';
	@override String get allowInsecureConnections => '(Déconseillé) Autoriser Saber à se connecter à des serveurs dont les certificats sont auto-signés/non-sécurisé';
	@override String get preferGreyscale => 'Pour les couleurs de stylos proposées';
	@override String get autoClearWhiteboardOnExit => 'Il restera synchronisé avec vos autres appareils';
	@override String get disableEraserAfterUse => 'Revenir automatiquement au stylo après usage de la gomme';
	@override String get maxImageSize => 'Les images plus grandes seront compressées';
	@override late final _Translations$settings$prefDescriptions$hideFingerDrawing$fr hideFingerDrawing = _Translations$settings$prefDescriptions$hideFingerDrawing$fr._(_root);
	@override String get editorPromptRename => 'Vous pourrez toujours les renommer plus tard';
	@override String get printPageIndicators => 'Montrer les numéros de pages dans les exportations';
	@override String get shapeRecognitionDelay => 'Avec quelle fréquence mettre à jour la prévisualisation de forme';
	@override String get shouldAlwaysAlertForUpdates => 'Me prévenir dès qu\'une mise à jour est disponible';
	@override late final _Translations$settings$prefDescriptions$sentry$fr sentry = _Translations$settings$prefDescriptions$sentry$fr._(_root);
	@override String get autoDisableFingerDrawingWhenStylusDetected => 'Désactiver le dessin au doigt lorsqu\'un stylet est détecté';
	@override String get autosave => 'S\'attacher automatiquement après un court délai, ou jamais';
	@override String get simplifiedHomeLayout => 'Définit une hauteur fixe pour chaque aperçu de note';
	@override String get autoStraightenLines => 'Redresse les longues lignes sans avoir à utiliser le stylo de forme';
}

// Path: settings.themeModes
class _Translations$settings$themeModes$fr extends Translations$settings$themeModes$en {
	_Translations$settings$themeModes$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Système';
	@override String get light => 'Clair';
	@override String get dark => 'Foncé';
}

// Path: settings.layoutSizes
class _Translations$settings$layoutSizes$fr extends Translations$settings$layoutSizes$en {
	_Translations$settings$layoutSizes$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Auto';
	@override String get phone => 'Smartphone';
	@override String get tablet => 'Tablette';
}

// Path: settings.accentColorPicker
class _Translations$settings$accentColorPicker$fr extends Translations$settings$accentColorPicker$en {
	_Translations$settings$accentColorPicker$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get pickAColor => 'Choisir une couleur';
}

// Path: settings.reset
class _Translations$settings$reset$fr extends Translations$settings$reset$en {
	_Translations$settings$reset$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rétablir les valeurs par défaut ?';
	@override String get button => 'Défaut';
}

// Path: settings.customDataDir
class _Translations$settings$customDataDir$fr extends Translations$settings$customDataDir$en {
	_Translations$settings$customDataDir$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get unsupported => 'Cette fonctionnalité est actuellement uniquement pour les développeurs. L\'utiliser entraînera probablement une perte de données.';
	@override String get cancel => 'Annuler';
	@override String get select => 'Sélectionner';
	@override String get mustBeEmpty => 'Le répertoire sélectionné doit être vide';
	@override String get mustBeDoneSyncing => 'Assurez-vous que la synchronisation est terminée avant de modifier le répertoire';
}

// Path: login.form
class _Translations$login$form$fr extends Translations$login$form$en {
	_Translations$login$form$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override TextSpan agreeToPrivacyPolicy({required InlineSpanBuilder linkToPrivacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'En vous connectant, vous acceptez les '),
		linkToPrivacyPolicy('Privacy Policy'),
		const TextSpan(text: '.'),
	]);
}

// Path: login.status
class _Translations$login$status$fr extends Translations$login$status$en {
	_Translations$login$status$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get loggedOut => 'Déconnecté';
	@override String get tapToLogin => 'Appuyer pour vous connecter avec Nextcloud';
	@override String get loggedIn => 'Connecté avec Nextcloud';
	@override String hi({required Object u}) => 'Salut, ${u}!';
	@override String get almostDone => 'Presque prêt pour la synchronisation, appuyez pour terminer la connexion';
}

// Path: login.ncLoginStep
class _Translations$login$ncLoginStep$fr extends Translations$login$ncLoginStep$en {
	_Translations$login$ncLoginStep$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$login$ncLoginStep$loginFlow$fr loginFlow = _Translations$login$ncLoginStep$loginFlow$fr._(_root);
	@override String get whereToStoreData => 'Choisissez où vous souhaitez stocker vos données :';
	@override String get saberNcServer => 'Le serveur Nextcloud de Saber';
	@override String get otherNcServer => 'Autre serveur Nextcloud';
	@override String get serverUrl => 'URL du serveur';
	@override String get loginWithSaber => 'Connectez-vous avec Saber';
	@override String get loginWithNextcloud => 'Connectez-vous avec Nextcloud';
}

// Path: login.encLoginStep
class _Translations$login$encLoginStep$fr extends Translations$login$encLoginStep$en {
	_Translations$login$encLoginStep$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get enterEncPassword => 'Pour protéger vos données, veuillez saisir votre mot de passe de cryptage :';
	@override String get newToSaber => 'Nouveau sur Saber';
	@override String get encPassword => 'Mot de passe de cryptage';
	@override String get encFaqTitle => 'Questions fréquemment posées';
	@override String get wrongEncPassword => 'Le décryptage a échoué avec le mot de passe fourni. Veuillez réessayer de le saisir.';
	@override String get connectionFailed => 'Une erreur s\'est produite lors de la connexion au serveur. Veuillez réessayer plus tard.';
	@override List<dynamic> get encFaq => [
		_Translations$login$encLoginStep$encFaq$0$fr._(_root),
		_Translations$login$encLoginStep$encFaq$1$fr._(_root),
		_Translations$login$encLoginStep$encFaq$2$fr._(_root),
	];
}

// Path: profile.quickLinks
class _Translations$profile$quickLinks$fr extends Translations$profile$quickLinks$en {
	_Translations$profile$quickLinks$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get serverHomepage => 'Page d\'accueil du serveur';
	@override String get deleteAccount => 'Supprimer le compte';
}

// Path: profile.faq.0
class _Translations$profile$faq$0$fr extends Translations$profile$faq$0$en {
	_Translations$profile$faq$0$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Vais-je perdre mes notes si je me déconnecte ?';
	@override String get a => 'Non. Vos notes seront conservées à la fois sur votre poste et sur le serveur. Elles ne seront pas synchronisées avec le serveur jusqu\'à votre prochaine connexion. Assurez-vous que la synchronisation soit terminée avant de vous déconnecter pour ne perdre aucune donnée (consultez la barre de progression sur l\'écran d\'accueil).';
}

// Path: profile.faq.1
class _Translations$profile$faq$1$fr extends Translations$profile$faq$1$en {
	_Translations$profile$faq$1$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Comment changer mon mot de passe Nextcloud ?';
	@override String get a => 'Allez sur le site web du serveur et connectez-vous. Allez dans Paramètres > Sécurité > Changer mon mot de passe. Vous devrez vous déconnecter et vous reconnecter dans Saber après avoir changé votre mot de passe.';
}

// Path: profile.faq.2
class _Translations$profile$faq$2$fr extends Translations$profile$faq$2$en {
	_Translations$profile$faq$2$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Comment changer mon mot de passe de chiffrement ?';
	@override String get a => '1. Déconnectez-vous de Saber. Assurez-vous que la synchronisation soit terminée avant de vous déconnecter afin de ne perdre aucune donnée (consultez la barre de progression sur l\'écran d\'accueil).\n2. Sur le site web du serveur supprimez votre dossier \'Saber\'. Cela supprimera toutes vos notes sur le serveur.\n3. Connectez-vous à nouveau dans Saber. Vous pourrez choisir un nouveau mot de passe de chiffrement à la connexion.\n4. N\'oubliez pas de vous déconnecter et vous re-connecter dans Saber sur votre poste également.';
}

// Path: profile.faq.3
class _Translations$profile$faq$3$fr extends Translations$profile$faq$3$en {
	_Translations$profile$faq$3$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Comment puis-je supprimer mon compte ?';
	@override String get a => 'Cliquez sur le button "${_root.profile.quickLinks.deleteAccount}" ci-dessus, et connectez-vous si nécessaire.\nSi vous utilisez le serveur Saber officiel, votre compte sera supprimé au bout d\'une semaine . Durant cette période, vous pourrez me contacter à adilhanney@disroot.org pour annuler la suppression.\nSi vous utilisez un autre serveur, il n\'est pas certain que vous puissiez supprimer votre compte dessus : il vous faudra consulter les règles de confidentialité du serveur pour plus d\'informations.';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$fr extends Translations$editor$toolbar$en {
	_Translations$editor$toolbar$fr._(TranslationsFr root) : this._root = root, super.internal(root);

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
class _Translations$editor$pens$fr extends Translations$editor$pens$en {
	_Translations$editor$pens$fr._(TranslationsFr root) : this._root = root, super.internal(root);

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
class _Translations$editor$penOptions$fr extends Translations$editor$penOptions$en {
	_Translations$editor$penOptions$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get size => 'Taille';
}

// Path: editor.colors
class _Translations$editor$colors$fr extends Translations$editor$colors$en {
	_Translations$editor$colors$fr._(TranslationsFr root) : this._root = root, super.internal(root);

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
class _Translations$editor$imageOptions$fr extends Translations$editor$imageOptions$en {
	_Translations$editor$imageOptions$fr._(TranslationsFr root) : this._root = root, super.internal(root);

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
class _Translations$editor$selectionBar$fr extends Translations$editor$selectionBar$en {
	_Translations$editor$selectionBar$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Effacer';
	@override String get duplicate => 'Dupliquer';
}

// Path: editor.menu
class _Translations$editor$menu$fr extends Translations$editor$menu$en {
	_Translations$editor$menu$fr._(TranslationsFr root) : this._root = root, super.internal(root);

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
	@override late final _Translations$editor$menu$boxFits$fr boxFits = _Translations$editor$menu$boxFits$fr._(_root);
	@override late final _Translations$editor$menu$bgPatterns$fr bgPatterns = _Translations$editor$menu$bgPatterns$fr._(_root);
	@override String get lineThickness => 'Épaisseur de ligne';
	@override String get lineThicknessDescription => 'Épaisseur de ligne de fond';
	@override String get watchServer => 'Surveillez les mises à jour sur le serveur';
	@override String get watchServerReadOnly => 'L\'édition est désactivée lorsque vous regardez le serveur';
	@override String get lineHeightDescription => 'Contrôle également la taille du texte pour les notes saisies';
}

// Path: editor.readOnlyBanner
class _Translations$editor$readOnlyBanner$fr extends Translations$editor$readOnlyBanner$en {
	_Translations$editor$readOnlyBanner$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mode lecture seule';
	@override String get corrupted => 'Échec du chargement de la note. Il est peut-être corrompu ou en cours de téléchargement.';
	@override String get watchingServer => 'Vous surveillez actuellement les mises à jour sur le serveur. L\'édition est désactivée dans ce mode.';
}

// Path: editor.versionTooNew
class _Translations$editor$versionTooNew$fr extends Translations$editor$versionTooNew$en {
	_Translations$editor$versionTooNew$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cette note a été modifiée avec une version plus récente de Saber';
	@override String get subtitle => 'Éditer cette note pourrait entraîner la perte de certaines informations. Voulez-vous la modifier quand même ?';
	@override String get allowEditing => 'Autoriser les modifications';
}

// Path: editor.quill
class _Translations$editor$quill$fr extends Translations$editor$quill$en {
	_Translations$editor$quill$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get typeSomething => 'Taper du texte ici...';
}

// Path: editor.hud
class _Translations$editor$hud$fr extends Translations$editor$hud$en {
	_Translations$editor$hud$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get unlockZoom => 'Déverrouiller le zoom';
	@override String get lockZoom => 'Verrouiller le zoom';
	@override String get unlockSingleFingerPan => 'Activer le défilement à un seul doigt';
	@override String get lockSingleFingerPan => 'Désactiver le défilement à un seul doigt';
	@override String get unlockAxisAlignedPan => 'Déverrouiller le panoramique à l\'horizontale ou à la verticale';
	@override String get lockAxisAlignedPan => 'Verrouiller le panoramique à l\'horizontale ou à la verticale';
}

// Path: sentry.consent.description
class _Translations$sentry$consent$description$fr extends Translations$sentry$consent$description$en {
	_Translations$sentry$consent$description$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get question => 'Souhaitez-vous signaler automatiquement les erreurs inattendues? Cela m\'aide à identifier et à résoudre les problèmes plus rapidement.';
	@override String get scope => 'Les rapports peuvent contenir des informations sur l\'erreur et votre appareil. J\'ai fait tout son possible pour filtrer les données personnelles, mais certaines peuvent rester.';
	@override String get currentlyOff => 'Si vous accordez le consentement, les rapports d\'erreur seront activés après le redémarrage de l\'application.';
	@override String get currentlyOn => 'Si vous révoquez le consentement, veuillez redémarrer l\'application pour désactiver les rapports d\'erreur.';
	@override TextSpan learnMoreInPrivacyPolicy({required InlineSpanBuilder link}) => TextSpan(children: [
		const TextSpan(text: 'En savoir plus dans le '),
		link('Politique de confidentialité'),
		const TextSpan(text: '.'),
	]);
}

// Path: sentry.consent.answers
class _Translations$sentry$consent$answers$fr extends Translations$sentry$consent$answers$en {
	_Translations$sentry$consent$answers$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Oui';
	@override String get no => 'Non';
	@override String get later => 'Demandez-moi plus tard';
}

// Path: settings.prefDescriptions.hideFingerDrawing
class _Translations$settings$prefDescriptions$hideFingerDrawing$fr extends Translations$settings$prefDescriptions$hideFingerDrawing$en {
	_Translations$settings$prefDescriptions$hideFingerDrawing$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get shown => 'Empêcher l\'activation/désactivation accidentelle';
	@override String get fixedOn => 'Le tracé au doigt est fixé à activé';
	@override String get fixedOff => 'Le tracé au doigt est fixé à désactivé';
}

// Path: settings.prefDescriptions.sentry
class _Translations$settings$prefDescriptions$sentry$fr extends Translations$settings$prefDescriptions$sentry$en {
	_Translations$settings$prefDescriptions$sentry$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get active => 'Actif';
	@override String get inactive => 'Inactif';
	@override String get activeUntilRestart => 'Actif jusqu\'à ce que vous redémarrez l\'application';
	@override String get inactiveUntilRestart => 'Inactif jusqu\'à ce que vous redémarrez l\'application';
}

// Path: login.ncLoginStep.loginFlow
class _Translations$login$ncLoginStep$loginFlow$fr extends Translations$login$ncLoginStep$loginFlow$en {
	_Translations$login$ncLoginStep$loginFlow$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get pleaseAuthorize => 'Veuillez autoriser Saber à accéder à votre compte Nextcloud';
	@override String get followPrompts => 'Veuillez suivre les instructions de votre navigateur.';
	@override String get browserDidntOpen => 'Le navigateur ne s\'est pas ouvert';
}

// Path: login.encLoginStep.encFaq.0
class _Translations$login$encLoginStep$encFaq$0$fr extends Translations$login$encLoginStep$encFaq$0$en {
	_Translations$login$encLoginStep$encFaq$0$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Qu\'est-ce que le mot de passe de cryptage ?';
	@override String get a => 'Le mot de passe de cryptage est utilisé pour crypter vos données avant qu\'elles ne soient envoyées au serveur. Vous le créez lors de votre première connexion à Saber, et il est indépendant de votre compte et de votre mot de passe sur Nextcloud.\nPersonne ne peut accéder à vos notes sur le serveur sans votre mot de passe de chiffrement. Cela implique aussi que si vous oubliez votre mot de passe de cryptage, vous perdrez l\'accès à vos données.';
}

// Path: login.encLoginStep.encFaq.1
class _Translations$login$encLoginStep$encFaq$1$fr extends Translations$login$encLoginStep$encFaq$1$en {
	_Translations$login$encLoginStep$encFaq$1$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Pourquoi utiliser deux mots de passe ?';
	@override String get a => 'Le mot de passe Nextcloud est utilisé pour accéder au nuage (cloud). Le mot de passe de cryptage "brouille" vos données avant même qu\'elles n\'atteignent le nuage.\nMême si quelqu\'un accède à votre compte Nextcloud, vos notes resteront sécurisées et cryptées avec un mot de passe distinct. Cela crée un deuxième niveau de sécurité pour protéger vos données.';
}

// Path: login.encLoginStep.encFaq.2
class _Translations$login$encLoginStep$encFaq$2$fr extends Translations$login$encLoginStep$encFaq$2$en {
	_Translations$login$encLoginStep$encFaq$2$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get q => 'Puis-je utiliser le même mot de passe pour les deux ?';
	@override String get a => 'Oui, mais c\'est moins sécurisé. Comme votre mot de passe sur Nextcloud est envoyé au serveur, toute personne qui y aurait accès pourrait decrypter vos notes. N\'utilisez le même mot de passe que si vous faites confiance aux personnes qui gèrent le serveur.';
}

// Path: editor.menu.boxFits
class _Translations$editor$menu$boxFits$fr extends Translations$editor$menu$boxFits$en {
	_Translations$editor$menu$boxFits$fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get fill => 'S\'ajuste';
	@override String get cover => 'Couvre';
	@override String get contain => 'Contient';
}

// Path: editor.menu.bgPatterns
class _Translations$editor$menu$bgPatterns$fr extends Translations$editor$menu$bgPatterns$en {
	_Translations$editor$menu$bgPatterns$fr._(TranslationsFr root) : this._root = root, super.internal(root);

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
