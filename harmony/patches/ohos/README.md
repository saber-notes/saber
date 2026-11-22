# OpenHarmony(鸿蒙)补丁

这个目录里的脚本用于让 Saber 能在 **OpenHarmony / HarmonyOS NEXT** 上编译。

## 用法

```bash
bash harmony/patches/ohos/apply_ohos_patches.sh
flutter pub get
flutter build hap --release
```

或者直接用 `harmony/scripts/build_ohos.sh`,它会自动依次执行上面三步。

> 脚本会直接修改 pub cache 里的文件(和 `patches/pre`、`patches/post` 的既有做法一致),
> 误执行后可用 `flutter pub cache repair` 还原。

## 做了什么

| # | 目标 | 原因 |
|---|------|------|
| 1 | `flutter_quill`、`flex_color_picker` | Flutter-OH 给 `TargetPlatform` 加了 `ohos` 成员,这两个包里的 `switch (TargetPlatform)` 是穷尽的,不加分支会直接编译失败。鸿蒙按移动端处理。 |
| 2 | `super_native_extensions` | 它的 build hook 会用 Rust 交叉编译原生扩展(还依赖 glib/gobject),鸿蒙端没有对应产物,跳过。 |
| 3 | `pdfium_dart` | 它的 build hook 会从 GitHub 下载预编译的 pdfium(只有 android/linux/macos/windows 版本),鸿蒙端没有,跳过。**代价:鸿蒙版暂不支持 PDF 预览/导入。** |
| 4 | `window_manager` | 桌面专用插件,鸿蒙没有原生实现。构建时用 `--target-os=linux` 编 AOT,`Platform.isLinux` 恒为 true,会让 Saber 误判自己在桌面上而调用它,抛 `MissingPluginException` 导致白屏。加降级:缺实现就静默忽略。 |
| 5 | `url_launcher_ohos` | 鸿蒙的 `url_launcher` 对 http/https 默认走「应用内嵌 WebView」,而原生侧要求宿主应用传 `harmony_browser_page` 并真的实现那个页面,否则只弹一个 toast、链接打不开。改成:调用方没提供该 header 时直接用系统浏览器。配合 `ohos/entry/src/main/module.json5` 里新增的 `entity.system.browsable` skill 使用。 |

## 依赖覆盖

`pubspec_overrides.yaml` 里做了两类覆盖:

1. 把带鸿蒙实现的官方插件换成 [OpenHarmony-TPC/flutter_packages](https://gitcode.com/openharmony-tpc/flutter_packages)
   里的版本:`shared_preferences`、`path_provider`、`url_launcher`;
2. 把 `stow_secure` 换成本仓库 `harmony/packages/stow_secure` 下的鸿蒙实现
   (上游依赖 `flutter_secure_storage`,该插件至今没有鸿蒙实现)。

这样业务代码一行都不用改。
