import 'package:file_picker_ohos/src/ohos_platform_file.dart';
import 'package:file_picker_platform_interface/file_picker_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// OpenHarmony (HarmonyOS NEXT) 版 `file_picker` 的 Dart 侧实现。
///
/// 与原生 ArkTS 实现通过 [channel] 通信。方法名与参数名刻意与 `file_picker`
/// 上游其它平台实现保持一致,因此原生侧可以复用同一套线上协议。
base class FilePickerOhos extends FilePickerPlatform {
  /// 与原生侧通信的 method channel。
  ///
  /// 名字与上游 `file_picker` 各平台实现一致。
  @visibleForTesting
  static const channel = MethodChannel(
    'miguelruivo.flutter.plugins.filepicker',
    StandardMethodCodec(),
  );

  /// 供 flutter 工具生成的插件注册器调用。
  static void registerWith() {
    FilePickerPlatform.instance = FilePickerOhos();
  }

  @override
  Future<PlatformFile?> pickFile({
    String? dialogTitle,
    String? initialDirectory,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    int compressionQuality = 0,
    AndroidOptions androidOptions = const AndroidOptions(),
    DarwinOptions darwinOptions = const DarwinOptions(),
    WindowsOptions windowsOptions = const WindowsOptions(),
    LinuxOptions linuxOptions = const LinuxOptions(),
    WebOptions webOptions = const WebOptions(),
  }) async {
    final List<PlatformFile> files = await pickFiles(
      dialogTitle: dialogTitle,
      initialDirectory: initialDirectory,
      type: type,
      allowedExtensions: allowedExtensions,
      onFileLoading: onFileLoading,
      compressionQuality: compressionQuality,
      androidOptions: androidOptions,
      darwinOptions: darwinOptions,
      windowsOptions: windowsOptions,
      linuxOptions: linuxOptions,
      webOptions: webOptions,
    );
    return files.isEmpty ? null : files.first;
  }

  @override
  Future<List<PlatformFile>> pickFiles({
    String? dialogTitle,
    String? initialDirectory,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    int compressionQuality = 0,
    AndroidOptions androidOptions = const AndroidOptions(),
    DarwinOptions darwinOptions = const DarwinOptions(),
    WindowsOptions windowsOptions = const WindowsOptions(),
    LinuxOptions linuxOptions = const LinuxOptions(),
    WebOptions webOptions = const WebOptions(),
  }) async {
    onFileLoading?.call(FilePickerStatus.picking);
    try {
      final List<Object?>? raw = await channel.invokeListMethod<Object?>(
        type.name,
        <String, Object?>{
          'allowMultipleSelection': false,
          'allowedExtensions': allowedExtensions,
          'withData': true,
          'dialogTitle': dialogTitle,
          'initialDirectory': initialDirectory,
        },
      );
      if (raw == null) return const <PlatformFile>[];
      return raw
          .whereType<Map<Object?, Object?>>()
          .map(_toPlatformFile)
          .toList(growable: false);
    } finally {
      onFileLoading?.call(FilePickerStatus.done);
    }
  }

  @override
  Future<List<String>> pickFileAndDirectoryPaths({
    String? dialogTitle,
    String? initialDirectory,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
  }) async {
    final List<PlatformFile> files = await pickFiles(
      dialogTitle: dialogTitle,
      initialDirectory: initialDirectory,
      type: type,
      allowedExtensions: allowedExtensions,
    );
    return files
        .map((PlatformFile file) => file.path)
        .whereType<String>()
        .toList(growable: false);
  }

  @override
  Future<String?> getDirectoryPath({
    String? dialogTitle,
    String? initialDirectory,
    AndroidOptions androidOptions = const AndroidOptions(),
    WindowsOptions windowsOptions = const WindowsOptions(),
    LinuxOptions linuxOptions = const LinuxOptions(),
    WebOptions webOptions = const WebOptions(),
  }) async {
    final String? path = await channel.invokeMethod<String>('dir', <String, Object?>{
      'dialogTitle': dialogTitle,
      'initialDirectory': initialDirectory,
    });
    return path;
  }

  @override
  Future<void> clearTemporaryFiles() async {
    await channel.invokeMethod<void>('clear');
  }

  @override
  Future<Uri?> saveFile({
    required String fileName,
    required Uint8List bytes,
    required String mimeType,
    String? dialogTitle,
    String? initialDirectory,
    Function(FilePickerStatus)? onFileSaving,
    WindowsOptions windowsOptions = const WindowsOptions(),
    LinuxOptions linuxOptions = const LinuxOptions(),
    WebOptions webOptions = const WebOptions(),
  }) async {
    onFileSaving?.call(FilePickerStatus.picking);
    try {
      final String? savedPath = await channel.invokeMethod<String>(
        'save',
        <String, Object?>{
          'fileName': fileName,
          'fileType': mimeType,
          'initialDirectory': initialDirectory,
          'dialogTitle': dialogTitle,
          'bytes': bytes,
        },
      );
      if (savedPath == null) return null;
      return Uri.tryParse(savedPath) ?? Uri.file(savedPath);
    } finally {
      onFileSaving?.call(FilePickerStatus.done);
    }
  }

  /// 把原生侧返回的 Map 转换成 [OhosPlatformFile]。
  OhosPlatformFile _toPlatformFile(Map<Object?, Object?> map) {
    final String path = (map['path'] as String?) ?? '';
    final String name =
        (map['name'] as String?) ??
        (path.isEmpty ? '' : path.substring(path.lastIndexOf('/') + 1));
    final int size = (map['size'] as int?) ?? 0;
    final Uint8List? bytes = map['bytes'] as Uint8List?;
    return OhosPlatformFile(
      name: name,
      path: path,
      size: size,
      bytes: bytes,
    );
  }
}
