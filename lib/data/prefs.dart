import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:perfect_freehand/perfect_freehand.dart';
import 'package:saber/components/canvas/_canvas_background_painter.dart';
import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/components/settings/nextcloud_profile.dart';
import 'package:saber/data/codecs/base64_codec.dart';
import 'package:saber/data/codecs/date_time_codec.dart';
import 'package:saber/data/codecs/quota_codec.dart';
import 'package:saber/data/editor/pencil_sound.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/tools/_tool.dart';
import 'package:saber/data/tools/highlighter.dart';
import 'package:saber/data/tools/pen.dart';
import 'package:stow/stow.dart';
import 'package:stow_codecs/stow_codecs.dart';
import 'package:stow_plain/stow_plain.dart';
import 'package:stow_secure/stow_secure.dart';

/// If false, all stows are stuck at their default values.
bool _isOnMainIsolate = false;

final stows = Stows();

class Stows {
  Stows() {
    recentColorsLength.addListener(() {
      // truncate if needed
      while (recentColorsLength.value < recentColorsPositioned.value.length) {
        // remove oldest color
        final removed = recentColorsChronological.value.removeAt(0);
        recentColorsPositioned.value.remove(removed);
      }
    });
  }

  /// Call this before [runApp] to set [_isOnMainIsolate] to true.
  static void markAsOnMainIsolate() {
    _isOnMainIsolate = true;
  }

  final log = Logger('Stows');

  final customDataDir =
      PlainStow<String?>('customDataDir', null, autoRead: _isOnMainIsolate);

  final allowInsecureConnections =
      SecureStow('allowInsecureConnections', false, autoRead: _isOnMainIsolate);
  final url = SecureStow('url', '', autoRead: _isOnMainIsolate);
  final username = SecureStow('username', '', autoRead: _isOnMainIsolate);

  /// the password used to login to Nextcloud
  final ncPassword = SecureStow('ncPassword', '', autoRead: _isOnMainIsolate);
  // TODO(adil192): maybe deprecate?
  final ncPasswordIsAnAppPassword =
      PlainStow('ncPasswordIsAnAppPassword', false, autoRead: _isOnMainIsolate);

  /// the password used to encrypt/decrypt notes
  final encPassword = SecureStow('encPassword', '', autoRead: _isOnMainIsolate);

  /// Whether the user is logged in and has provided both passwords.
  /// Please ensure that the relevant Prefs are loaded before using this.
  bool get loggedIn =>
      username.value.isNotEmpty &&
      ncPassword.value.isNotEmpty &&
      encPassword.value.isNotEmpty;

  final key = SecureStow('key', '', autoRead: _isOnMainIsolate);
  final iv = SecureStow('iv', '', autoRead: _isOnMainIsolate);

  final pfp = PlainStow<Uint8List?>('pfp', null,
      codec: const Base64StowCodec(), autoRead: _isOnMainIsolate);
  final syncInBackground =
      PlainStow('syncInBackground', true, autoRead: _isOnMainIsolate);

  final appTheme = PlainStow('appTheme', ThemeMode.system,
      codec: EnumCodec(ThemeMode.values), autoRead: _isOnMainIsolate);

  /// The type of platform to theme. Default value is [defaultTargetPlatform].
  final platform = PlainStow('platform', defaultTargetPlatform,
      codec: EnumCodec(TargetPlatform.values), autoRead: _isOnMainIsolate);
  final layoutSize = PlainStow('layoutSize', LayoutSize.auto,
      codec: LayoutSize.codec, autoRead: _isOnMainIsolate);

  /// The accent color of the app. If 0, the system accent color will be used.
  final accentColor = PlainStow<Color?>('accentColor', null,
      codec: ColorCodec(), autoRead: _isOnMainIsolate);
  final hyperlegibleFont =
      PlainStow('hyperlegibleFont', false, autoRead: _isOnMainIsolate);

  final editorToolbarAlignment = PlainStow(
      'editorToolbarAlignment', AxisDirection.down,
      codec: EnumCodec(AxisDirection.values), autoRead: _isOnMainIsolate);
  final editorToolbarShowInFullscreen = PlainStow(
      'editorToolbarShowInFullscreen', true,
      autoRead: _isOnMainIsolate);
  final editorFingerDrawing =
      PlainStow('editorFingerDrawing', true, autoRead: _isOnMainIsolate);
  final editorAutoInvert =
      PlainStow('editorAutoInvert', true, autoRead: _isOnMainIsolate);
  final preferGreyscale =
      PlainStow('preferGreyscale', false, autoRead: _isOnMainIsolate);
  final editorPromptRename =
      PlainStow('editorPromptRename', isDesktop, autoRead: _isOnMainIsolate);
  final autosaveDelay =
      PlainStow('autosaveDelay', 10000, autoRead: _isOnMainIsolate);
  final shapeRecognitionDelay =
      PlainStow('shapeRecognitionDelay', 500, autoRead: _isOnMainIsolate);
  final autoStraightenLines =
      PlainStow('autoStraightenLines', true, autoRead: _isOnMainIsolate);
  final pencilSound = PlainStow(
      'pencilSound', PencilSoundSetting.onButNotInSilentMode,
      codec: PencilSoundSetting.codec, autoRead: _isOnMainIsolate);

  final simplifiedHomeLayout =
      PlainStow('simplifiedHomeLayout', false, autoRead: _isOnMainIsolate);
  final hideHomeBackgrounds =
      PlainStow('hideHomeBackgrounds', false, autoRead: _isOnMainIsolate);
  final printPageIndicators =
      PlainStow('printPageIndicators', false, autoRead: _isOnMainIsolate);

  final maxImageSize =
      PlainStow<double>('maxImageSize', 1000, autoRead: _isOnMainIsolate);

  final autoClearWhiteboardOnExit =
      PlainStow('autoClearWhiteboardOnExit', false, autoRead: _isOnMainIsolate);

  final disableEraserAfterUse =
      PlainStow('disableEraserAfterUse', false, autoRead: _isOnMainIsolate);
  final hideFingerDrawingToggle =
      PlainStow('hideFingerDrawingToggle', false, autoRead: _isOnMainIsolate);

  final recentColorsChronological = PlainStow(
      'recentColorsChronological', <String>[],
      autoRead: _isOnMainIsolate);
  final recentColorsPositioned = PlainStow('recentColorsPositioned', <String>[],
      autoRead: _isOnMainIsolate);
  final pinnedColors =
      PlainStow('pinnedColors', <String>[], autoRead: _isOnMainIsolate);
  final recentColorsDontSavePresets =
      PlainStow('dontSavePresetColors', false, autoRead: _isOnMainIsolate);
  final recentColorsLength =
      PlainStow('recentColorsLength', 5, autoRead: _isOnMainIsolate);

  final lastTool = PlainStow('lastTool', ToolId.fountainPen,
      codec: ToolId.codec, autoRead: _isOnMainIsolate);
  static StrokeOptions _strokeOptionsFromJson(Object json) =>
      StrokeOptions.fromJson(json as Map<String, dynamic>);
  final lastFountainPenOptions = PlainStow.json(
          'lastFountainPenProperties', Pen.fountainPenOptions,
          fromJson: _strokeOptionsFromJson, autoRead: _isOnMainIsolate),
      lastBallpointPenOptions = PlainStow.json(
          'lastBallpointPenProperties', Pen.ballpointPenOptions,
          fromJson: _strokeOptionsFromJson, autoRead: _isOnMainIsolate),
      lastHighlighterOptions = PlainStow.json(
          'lastHighlighterProperties', Pen.highlighterOptions,
          fromJson: _strokeOptionsFromJson, autoRead: _isOnMainIsolate),
      lastPencilOptions = PlainStow.json(
          'lastPencilProperties', Pen.pencilOptions,
          fromJson: _strokeOptionsFromJson, autoRead: _isOnMainIsolate),
      lastShapePenOptions = PlainStow.json(
          'lastShapePenProperties', Pen.shapePenOptions,
          fromJson: _strokeOptionsFromJson, autoRead: _isOnMainIsolate);
  final lastFountainPenColor = PlainStow(
          'lastFountainPenColor', Colors.black.toARGB32(),
          autoRead: _isOnMainIsolate),
      lastBallpointPenColor = PlainStow(
          'lastBallpointPenColor', Colors.black.toARGB32(),
          autoRead: _isOnMainIsolate),
      lastHighlighterColor = PlainStow('lastHighlighterColor',
          Colors.yellow.withAlpha(Highlighter.alpha).toARGB32(),
          autoRead: _isOnMainIsolate),
      lastPencilColor = PlainStow('lastPencilColor', Colors.black.toARGB32(),
          autoRead: _isOnMainIsolate),
      lastShapePenColor = PlainStow(
          'lastShapePenColor', Colors.black.toARGB32(),
          autoRead: _isOnMainIsolate);
  final lastBackgroundPattern = PlainStow(
      'lastBackgroundPattern', CanvasBackgroundPattern.none,
      codec: CanvasBackgroundPattern.codec, autoRead: _isOnMainIsolate);
  static const defaultLineHeight = 40;
  static const defaultLineThickness = 3;
  final lastLineHeight = PlainStow('lastLineHeight', defaultLineHeight,
      autoRead: _isOnMainIsolate);
  final lastLineThickness = PlainStow('lastLineThickness', defaultLineThickness,
      autoRead: _isOnMainIsolate);
  final lastZoomLock =
          PlainStow('lastZoomLock', false, autoRead: _isOnMainIsolate),
      lastSingleFingerPanLock = PlainStow('lastSingleFingerPanLock', false,
          autoRead: _isOnMainIsolate),
      lastAxisAlignedPanLock = PlainStow('lastAxisAlignedPanLock', false,
          autoRead: _isOnMainIsolate);

  final recentFiles =
      PlainStow('recentFiles', <String>[], autoRead: _isOnMainIsolate);

  /// File paths that have been deleted locally
  final fileSyncAlreadyDeleted = PlainStow('fileSyncAlreadyDeleted', <String>{},
      autoRead: _isOnMainIsolate);

  /// File paths that are known to be corrupted on Nextcloud
  final fileSyncCorruptFiles =
      PlainStow('fileSyncCorruptFiles', <String>{}, autoRead: _isOnMainIsolate);

  /// Set when we want to resync everything.
  /// Files on the server older than this date will be
  /// reuploaded with the local version.
  /// By default, we resync everything uploaded before v0.18.4, since uploads before then resulted in 0B files.
  final fileSyncResyncEverythingDate = PlainStow('fileSyncResyncEverythingDate',
      DateTime.parse('2023-12-10T10:06:31.000Z'),
      codec: DateTimeCodec(), autoRead: _isOnMainIsolate);

  /// The last storage quota that was fetched from Nextcloud
  final lastStorageQuota = PlainStow<Quota?>('lastStorageQuota', null,
      codec: QuotaCodec(), autoRead: _isOnMainIsolate);

  final shouldCheckForUpdates = PlainStow('shouldCheckForUpdates',
      FlavorConfig.shouldCheckForUpdatesByDefault && !Platform.isLinux,
      autoRead: _isOnMainIsolate);
  final shouldAlwaysAlertForUpdates = PlainStow('shouldAlwaysAlertForUpdates',
      (kDebugMode || FlavorConfig.dirty) ? true : false,
      autoRead: _isOnMainIsolate);

  final locale = PlainStow('locale', '', autoRead: _isOnMainIsolate);

  static bool get isDesktop =>
      Platform.isLinux || Platform.isWindows || Platform.isMacOS;
}

abstract class IPref<T> extends Stow<String, T, Object?> {
  IPref(
    super.key,
    super.defaultValue, {
    super.codec,
    super.autoRead,
  });

  /// Removes the value from shared preferences, and resets the pref to its default value.
  @visibleForTesting
  @Deprecated('Just set the value to the default value instead')
  Future<void> delete() async {
    value = defaultValue;
    await waitUntilWritten();
  }

  /// Whether this pref has changes that have yet to be saved to disk.
  @Deprecated('No alternative, use [waitUntilWritten] if needed')
  bool get saved => true;

  /// Waits until the value has been saved to disk.
  /// Note that there is no guarantee with shared preferences that
  /// the value will actually be saved to disk.
  @visibleForTesting
  @Deprecated('Use [waitUntilWritten] instead')
  Future<void> waitUntilSaved() => waitUntilWritten();
}

/// An [IPref] that transforms the value of another [IPref].
///
/// Only instantiate this once during the lifetime of the app
/// (e.g. in a static field) to avoid extraneous
/// listeners being added to the underlying [IPref].
class TransformedPref<T_in, T_out> extends IPref<T_out> {
  final Stow<dynamic, T_in, dynamic> pref;
  final T_out Function(T_in) transform;
  final T_in Function(T_out) reverseTransform;

  @override
  T_out get value => transform(pref.value);

  @override
  set value(T_out value) => pref.value = reverseTransform(value);

  TransformedPref(this.pref, this.transform, this.reverseTransform)
      : super(pref.key, transform(pref.defaultValue)) {
    pref.addListener(notifyListeners);
  }

  @override
  Future<T_out> protectedRead() async => defaultValue;

  @override
  Future<void> protectedWrite(T_out value) async {}

  @override
  String toString() {
    return 'TransformedPref<$T_in, $T_out>(from ${pref.key}, $value)';
  }
}
