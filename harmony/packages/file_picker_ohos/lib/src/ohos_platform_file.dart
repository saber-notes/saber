import 'dart:io';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:file_picker_platform_interface/file_picker_platform_interface.dart';

/// 鸿蒙版 `file_picker` 返回的单个文件。
///
/// 鸿蒙的系统选择器返回的是 `file://` 形式的 URI,不能直接交给 Dart 的
/// `File` / `Directory` 使用。因此原生侧会把用户选中的文件**复制到应用沙箱
/// 的缓存目录**(`context.cacheDir/file_picker`)再返回,这样 [path] 就是一个
/// 真实的、可读写的文件系统路径。
base class OhosPlatformFile({
  /// 文件名(带扩展名)。
  @override
  required final String name,

  /// 应用沙箱内的真实路径。
  @override
  required final String path,

  /// 文件大小(字节)。
  final int size = 0,

  /// 文件内容;原生侧没有一并返回时为 `null`,此时按需从 [path] 读取。
  final Uint8List? bytes,
}) extends PlatformFile {
  @override
  Uri get uri => Uri.file(path);

  @override
  XFile get xFile => XFile(path, name: name, mimeType: _mimeType);

  @override
  int? lengthSync() => size;

  @override
  Future<int?> length() async => size;

  @override
  Future<Uint8List> readAsBytes() async {
    final Uint8List? cached = bytes;
    if (cached != null) return cached;
    return File(path).readAsBytes();
  }

  @override
  Stream<Uint8List> readAsByteStream() async* {
    final Uint8List? cached = bytes;
    if (cached != null) {
      yield cached;
      return;
    }
    await for (final List<int> chunk in File(path).openRead()) {
      yield Uint8List.fromList(chunk);
    }
  }

  String? get _mimeType {
    final int dot = name.lastIndexOf('.');
    if (dot < 0 || dot == name.length - 1) return null;
    return switch (name.substring(dot + 1).toLowerCase()) {
      'jpg' || 'jpeg' => 'image/jpeg',
      'png' => 'image/png',
      'gif' => 'image/gif',
      'webp' => 'image/webp',
      'bmp' => 'image/bmp',
      'svg' => 'image/svg+xml',
      'pdf' => 'application/pdf',
      'zip' => 'application/zip',
      _ => null,
    };
  }
}
