/// OpenHarmony (HarmonyOS NEXT) 版的 `file_picker` 插件实现。
///
/// 上游 [file_picker](https://pub.dev/packages/file_picker) 目前没有鸿蒙实现,
/// 导致 `FilePicker.pickFile()` / `FilePicker.saveFile()` / `FilePicker.getDirectoryPath()`
/// 在鸿蒙上全部抛 `UnimplementedError`。
///
/// 这个包通过 `MethodChannel` 与 `ohos/` 下的 ArkTS 实现通信,并遵循
/// `file_picker` 上游的线上协议(method channel 名与参数名保持一致),
/// 因此 Dart 侧无需改动任何业务代码。
library;

export 'src/file_picker_ohos_platform.dart' show FilePickerOhos;
export 'src/ohos_platform_file.dart' show OhosPlatformFile;
