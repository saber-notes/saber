import 'package:collapsible/collapsible.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saber/components/home/banner_ad_widget.dart';
import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/components/settings/nextcloud_profile.dart';
import 'package:saber/components/settings/settings_button.dart';
import 'package:saber/components/settings/settings_color.dart';
import 'package:saber/components/settings/settings_dropdown.dart';
import 'package:saber/components/settings/settings_selection.dart';
import 'package:saber/components/settings/settings_subtitle.dart';
import 'package:saber/components/settings/settings_switch.dart';
import 'package:saber/components/settings/update_manager.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/components/theming/adaptive_toggle_buttons.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/locales.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/tools/shape_pen.dart';
import 'package:saber/i18n/strings.g.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();

  static Future<bool?> showResetDialog({
    required BuildContext context,
    required IPref pref,//ValueNotifier<>
    required String prefTitle,
  }) async {
    if (pref.value == pref.defaultValue) return null;
    return await showDialog(
      context: context,
      builder: (context) => AdaptiveAlertDialog(
        title: Text(t.settings.reset.title),
        content: Text(prefTitle),
        actions: [
          CupertinoDialogAction(
            onPressed: () {// 更新 ValueNotifier 中的值，會觸發 UI 的更新
              Navigator.of(context).pop(false);//在模態頁面關閉時將結果傳遞給打開它的頁面(沒有變動)
            },
            child: Text(MaterialLocalizations.of(context).cancelButtonLabel),//取消按鈕標籤根據app的語言設置變化
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {// 更新 ValueNotifier 中的值，會觸發 UI 的更新
              pref.value = pref.defaultValue;//將調整的值設為default值
              Navigator.of(context).pop(true);//在模態頁面關閉時將結果傳遞給打開它的頁面(有變動)
            },
            child: Text(t.settings.reset.button),//更新按鈕標籤根據app的語言設置變化
          ),
        ],
      ),
    );
  }
}

abstract class _SettingsPrefs {//設定拉條列表的選項.chen//設定&儲存偏好值.evan
  static final appTheme = TransformedPref(
    Prefs.appTheme,
        (ThemeMode value) => value.index,
        (int value) => ThemeMode.values[value],
  );//將應用程式主題轉換成int並形成陣列

  static final platform = TransformedPref(
    Prefs.platform,
        (TargetPlatform value) => value.index,
        (int value) => TargetPlatform.values[value],
  );//將主題類型轉換成int並形成陣列

  static final layoutSize = TransformedPref(
    Prefs.layoutSize,
        (LayoutSize value) => value.index,
        (int value) => LayoutSize.values[value],
  );//將布局大小轉換成int並形成陣列

  static final editorToolbarAlignment = TransformedPref(
    Prefs.editorToolbarAlignment,
        (AxisDirection value) => value.index,
        (int value) => AxisDirection.values[value],
  );
}//將應用程式主題轉換成int並形成陣列.chen//在偏好設定存儲中以整數形式保存這些設定值.evan

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    Prefs.locale.addListener(onChanged);
    UpdateManager.status.addListener(onChanged);
    super.initState();
  }//初始化settings

  void onChanged() {
    setState(() {});
  }//更新settings

  static final bool usesCupertinoByDefault = switch (defaultTargetPlatform) {
    TargetPlatform.iOS => true,
    TargetPlatform.macOS => true,
    _ => false,
  };//使用者平台為iOS或macOS
  static final bool usesYaruByDefault = switch (defaultTargetPlatform) {
    TargetPlatform.linux => true,
    _ => false,
  };//使用者平台為linux
  static final bool usesMaterialByDefault =
      !usesCupertinoByDefault && !usesYaruByDefault;//使用者平台為android

  static const cupertinoDirectionIcons = [
    CupertinoIcons.arrow_up_to_line,
    CupertinoIcons.arrow_right_to_line,
    CupertinoIcons.arrow_down_to_line,
    CupertinoIcons.arrow_left_to_line,
  ];//箭頭圖示的陣列(iOS或macOS)
  static const materialDirectionIcons = [
    Icons.north,
    Icons.east,
    Icons.south,
    Icons.west,
  ];//箭頭圖示的陣列(android)

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final platform = Theme.of(context).platform;
    final cupertino =
        platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;

    final bool requiresManualUpdates = FlavorConfig.appStore.isEmpty;

    final IconData materialIcon = switch (defaultTargetPlatform) {
      TargetPlatform.windows => FontAwesomeIcons.windows,
      _ => Icons.android,
    };

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(
              bottom: 8,
            ),
            sliver: SliverAppBar(
              collapsedHeight: kToolbarHeight,
              expandedHeight: 200,
              pinned: true,
              scrolledUnderElevation: 1,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  t.home.titles.settings,
                  style: TextStyle(color: colorScheme.onBackground),
                ),
                centerTitle: cupertino,
                titlePadding: EdgeInsetsDirectional.only(
                  start: cupertino ? 0 : 16,
                  bottom: 16,
                ),
              ),
              actions: [
                if (UpdateManager.status.value != UpdateStatus.upToDate)
                  IconButton(
                    tooltip: t.home.tooltips.showUpdateDialog,
                    icon: const Icon(Icons.system_update),
                    onPressed: () {
                      UpdateManager.showUpdateDialog(context,
                          userTriggered: true);
                    },
                  ),
              ],
            ),
          ),
          SliverSafeArea(
              sliver: SliverList.list(
            children: [
              const NextcloudProfile(),//使用者雲端和個人資訊
              const Padding(
                padding: EdgeInsets.all(8),
                child: AppInfo(),
              ), //app版本資訊
              SettingsSubtitle(
                subtitle: t.settings.prefCategories.general,
              ),
              SettingsDropdown(
                title: t.settings.prefLabels.locale,
                icon: cupertino ? CupertinoIcons.globe : Icons.language,
                pref: Prefs.locale,
                options: [
                  ToggleButtonsOption('', Text(t.settings.systemLanguage)),
                  ...AppLocaleUtils.supportedLocales.map((locale) {
                    final String localeCode = locale.toLanguageTag();
                    String? localeName = localeNames[localeCode];
                    assert(localeName != null,
                        'Missing locale name for $localeCode');
                    return ToggleButtonsOption(
                      localeCode,
                      Text(localeName ?? localeCode),
                    );
                  }),
                ],
              ),//app語言
              SettingsSelection(
                title: t.settings.prefLabels.appTheme,
                iconBuilder: (i) {
                  if (i == ThemeMode.system.index) return Icons.brightness_auto;
                  if (i == ThemeMode.light.index) return Icons.light_mode;
                  if (i == ThemeMode.dark.index) return Icons.dark_mode;
                  return null;
                },
                pref: _SettingsPrefs.appTheme,
                optionsWidth: 60,
                options: [
                  ToggleButtonsOption(
                      ThemeMode.system.index,
                      Icon(Icons.brightness_auto,
                          semanticLabel: t.settings.themeModes.system)),
                  ToggleButtonsOption(
                      ThemeMode.light.index,
                      Icon(Icons.light_mode,
                          semanticLabel: t.settings.themeModes.light)),
                  ToggleButtonsOption(
                      ThemeMode.dark.index,
                      Icon(Icons.dark_mode,
                          semanticLabel: t.settings.themeModes.dark)),
                ],
              ),//app主題
              SettingsSelection(
                title: t.settings.prefLabels.platform,
                iconBuilder: (i) => switch (Prefs.platform.value) {
                  TargetPlatform.iOS || TargetPlatform.macOS => Icons.apple,
                  TargetPlatform.linux => FontAwesomeIcons.ubuntu,
                  _ => materialIcon,
                },
                pref: _SettingsPrefs.platform,
                optionsWidth: 60,
                options: [
                  ToggleButtonsOption(
                    () {
                      if (usesMaterialByDefault)
                        return defaultTargetPlatform.index;
                      return TargetPlatform.android.index;
                    }(),
                    Icon(materialIcon, semanticLabel: 'Material'),
                  ),
                  ToggleButtonsOption(
                    () {
                      if (usesCupertinoByDefault)
                        return defaultTargetPlatform.index;
                      return TargetPlatform.iOS.index;
                    }(),
                    const Icon(Icons.apple, semanticLabel: 'Cupertino'),
                  ),
                  ToggleButtonsOption(
                    () {
                      if (usesYaruByDefault) return defaultTargetPlatform.index;
                      return TargetPlatform.linux.index;
                    }(),
                    const Icon(FontAwesomeIcons.ubuntu, semanticLabel: 'Yaru'),
                  ),
                ],
              ),//主題類型
              SettingsSelection(
                title: t.settings.prefLabels.layoutSize,
                subtitle: switch (Prefs.layoutSize.value) {
                  LayoutSize.auto => t.settings.layoutSizes.auto,
                  LayoutSize.phone => t.settings.layoutSizes.phone,
                  LayoutSize.tablet => t.settings.layoutSizes.tablet,
                },
                afterChange: (_) => setState(() {}),
                iconBuilder: (i) => switch (LayoutSize.values[i]) {
                  LayoutSize.auto => Icons.aspect_ratio,
                  LayoutSize.phone => Icons.smartphone,
                  LayoutSize.tablet => Icons.tablet,
                },
                pref: _SettingsPrefs.layoutSize,
                optionsWidth: 60,
                options: [
                  ToggleButtonsOption(
                      LayoutSize.auto.index,
                      Icon(Icons.aspect_ratio,
                          semanticLabel: t.settings.layoutSizes.auto)),
                  ToggleButtonsOption(
                      LayoutSize.phone.index,
                      Icon(Icons.smartphone,
                          semanticLabel: t.settings.layoutSizes.phone)),
                  ToggleButtonsOption(
                      LayoutSize.tablet.index,
                      Icon(Icons.tablet,
                          semanticLabel: t.settings.layoutSizes.tablet)),
                ],
              ),//佈局大小
              SettingsColor(
                title: t.settings.prefLabels.customAccentColor,
                icon: Icons.colorize,
                pref: Prefs.accentColor,
              ),//自訂主題色
              SettingsSwitch(
                title: t.settings.prefLabels.hyperlegibleFont,
                subtitle: t.settings.prefDescriptions.hyperlegibleFont,
                iconBuilder: (b) {
                  if (b)
                    return cupertino
                        ? CupertinoIcons.textformat
                        : Icons.font_download;
                  return cupertino
                      ? CupertinoIcons.textformat_alt
                      : Icons.font_download_off;
                },
                pref: Prefs.hyperlegibleFont,
              ),//易讀字體
              SettingsSubtitle(subtitle: t.settings.prefCategories.writing),
              SettingsSwitch(
                title: t.settings.prefLabels.preferGreyscale,
                subtitle: t.settings.prefDescriptions.preferGreyscale,
                iconBuilder: (b) {
                  return b
                      ? Icons.monochrome_photos
                      : Icons.enhance_photo_translate;
                },
                pref: Prefs.preferGreyscale,
              ),//使用灰度顏色
              SettingsSwitch(
                title: t.settings.prefLabels.hideFingerDrawingToggle,
                subtitle: () {
                  if (!Prefs.hideFingerDrawingToggle.value) {
                    return t.settings.prefDescriptions.hideFingerDrawing.shown;
                  } else if (Prefs.editorFingerDrawing.value) {
                    return t
                        .settings.prefDescriptions.hideFingerDrawing.fixedOn;
                  } else {
                    return t
                        .settings.prefDescriptions.hideFingerDrawing.fixedOff;
                  }
                }(),
                icon: CupertinoIcons.hand_draw,
                pref: Prefs.hideFingerDrawingToggle,
                afterChange: (_) => setState(() {}),
              ),//隱藏手指繪圖切換開關
              ExpansionTile(
                title: Text("..."), // 展開后顯示的標题
                children: [
                  SettingsSwitch(
                    title: t.settings.prefLabels.disableEraserAfterUse,
                    subtitle: t.settings.prefDescriptions.disableEraserAfterUse,
                    icon: FontAwesomeIcons.eraser,
                    pref: Prefs.disableEraserAfterUse,
                  ),//自動禁用橡皮擦
                  SettingsSwitch(
                    title: t.settings.prefLabels.autoClearWhiteboardOnExit,
                    subtitle: t.settings.prefDescriptions.autoClearWhiteboardOnExit,
                    icon: Icons.cleaning_services,
                    pref: Prefs.autoClearWhiteboardOnExit,
                  ),//退出應用程式後清除白板
                ],
              ),
              SettingsSubtitle(subtitle: t.settings.prefCategories.editor),//設定子標題:編輯器
              SettingsSelection(
                title: t.settings.prefLabels.editorToolbarAlignment,//標題
                subtitle: t.settings.axisDirections[
                _SettingsPrefs.editorToolbarAlignment.value],//副標題(根據偏好設定存儲中設定值 來顯示)
                iconBuilder: (num i) {//應該是標題旁邊的圖標
                  if (i is! int || i >= materialDirectionIcons.length)
                    return null;
                  return cupertino
                      ? cupertinoDirectionIcons[i]//iOS風格圖標
                      : materialDirectionIcons[i];//Android風格圖標
                },//0:上,1:右,2:下,3:左
                pref: _SettingsPrefs.editorToolbarAlignment,
                optionsWidth: 60,
                options: [//options - 這是一個選項列表，每個選項是一個 ToggleButtonsOption，它包括一個索引和一個圖標
                  for (final AxisDirection direction in AxisDirection.values)//想看AxisDirection,我的在C:\Users\a6581\AppData\Local\Flutter\flutter\packages\flutter\lib\src\painting //拉到最下面可以看到up,down,left,right
                    ToggleButtonsOption(
                      direction.index,
                      Icon(
                        cupertino
                            ? cupertinoDirectionIcons[direction.index]
                            : materialDirectionIcons[direction.index],
                        semanticLabel:
                        t.settings.axisDirections[direction.index],
                      ),
                    ),
                ],
                afterChange: (_) => setState(() {}),//設置變更後觸發的回調函數,setState(() {}) 这样的调用，其中的函数体{}是空的，这意味着调用 setState() 本身是为了触发界面的重建，但并没有指定在重建之前需要更新哪些具体的状态变量。这种情况可能发生在状态更新已经在别的地方完成
              ),//編輯器工具列的對齊方式
              SettingsSwitch(
                title: t.settings.prefLabels.editorToolbarShowInFullscreen,
                icon: cupertino ? CupertinoIcons.fullscreen : Icons.fullscreen,
                pref: Prefs.editorToolbarShowInFullscreen,
              ),//在全螢幕模式中顯示編輯器工具列
              SettingsSwitch(
                title: t.settings.prefLabels.editorAutoInvert,
                iconBuilder: (b) {
                  return b ? Icons.invert_colors_on : Icons.invert_colors_off;
                },
                pref: Prefs.editorAutoInvert,
              ),//在深色模式下使用反色筆記背景
              SettingsSwitch(
                title: t.settings.prefLabels.editorPromptRename,
                subtitle: t.settings.prefDescriptions.editorPromptRename,
                iconBuilder: (b) {
                  if (b)
                    return cupertino ? CupertinoIcons.keyboard : Icons.keyboard;
                  return cupertino
                      ? CupertinoIcons.keyboard_chevron_compact_down
                      : Icons.keyboard_hide;
                },
                pref: Prefs.editorPromptRename,
              ),//提醒您重新命名新筆記
              SettingsSwitch(
                title: t.settings.prefLabels.hideHomeBackgrounds,
                subtitle: t.settings.prefDescriptions.hideHomeBackgrounds,
                iconBuilder: (b) {
                  if (b) return cupertino ? CupertinoIcons.photo : Icons.photo;
                  return cupertino
                      ? CupertinoIcons.photo_fill
                      : Icons.photo_library;
                },
                pref: Prefs.hideHomeBackgrounds,
              ),//隱藏主畫面上的背景
              SettingsSwitch(
                title: t.settings.prefLabels.recentColorsDontSavePresets,
                icon: Icons.palette,
                pref: Prefs.recentColorsDontSavePresets,
              ),//不要在最近的顏色中儲存預設顏色
              SettingsSelection(
                title: t.settings.prefLabels.recentColorsLength,
                icon: Icons.history,
                pref: Prefs.recentColorsLength,
                options: const [
                  ToggleButtonsOption(5, Text('5')),
                  ToggleButtonsOption(10, Text('10')),
                ],
              ),//要儲存種最近的顏色
              SettingsSwitch(
                title: t.settings.prefLabels.printPageIndicators,
                subtitle: t.settings.prefDescriptions.printPageIndicators,
                icon: Icons.numbers,
                pref: Prefs.printPageIndicators,
              ),//列印頁碼
              SettingsSubtitle(subtitle: t.settings.prefCategories.performance),
              SettingsSelection(
                title: t.settings.prefLabels.maxImageSize,
                subtitle: t.settings.prefDescriptions.maxImageSize,
                icon: Icons.photo_size_select_large,
                pref: Prefs.maxImageSize,
                options: const <ToggleButtonsOption<double>>[
                  ToggleButtonsOption(500, Text('500')),
                  ToggleButtonsOption(1000, Text('1000')),
                  ToggleButtonsOption(2000, Text('2000')),
                ],
              ),//最大圖片尺寸
              SettingsSelection(
                title: t.settings.prefLabels.autosaveDelay,
                subtitle: t.settings.prefDescriptions.autosaveDelay,
                icon: Icons.save,
                pref: Prefs.autosaveDelay,
                options: const [
                  ToggleButtonsOption(5000, Text('5s')),
                  ToggleButtonsOption(10000, Text('10s')),
                  ToggleButtonsOption(-1, Icon(Icons.close)),
                ],
              ),//自動儲存延遲
              SettingsSelection(
                title: t.settings.prefLabels.shapeRecognitionDelay,
                subtitle: t.settings.prefDescriptions.shapeRecognitionDelay,
                icon: FontAwesomeIcons.shapes,
                pref: Prefs.shapeRecognitionDelay,
                options: const [
                  ToggleButtonsOption(500, Text('0.5s')),
                  ToggleButtonsOption(1000, Text('1s')),
                  ToggleButtonsOption(-1, Icon(Icons.close)),
                ],
                afterChange: (ms) {
                  ShapePen.debounceDuration = ShapePen.getDebounceFromPref();
                },
              ),//形狀辨別延遲
              SettingsSwitch(
                title: t.settings.prefLabels.autoStraightenLines,
                subtitle: t.settings.prefDescriptions.autoStraightenLines,
                icon: Icons.straighten,
                pref: Prefs.autoStraightenLines,
              ),//自動拉直線條
              SettingsSubtitle(subtitle: t.settings.prefCategories.advanced),
              if (requiresManualUpdates ||
                  Prefs.shouldCheckForUpdates.value !=
                      Prefs.shouldCheckForUpdates.defaultValue) ...[
                SettingsSwitch(
                  title: t.settings.prefLabels.shouldCheckForUpdates,
                  icon: Icons.system_update,
                  pref: Prefs.shouldCheckForUpdates,
                  afterChange: (_) => setState(() {}),
                ),//禁用廣告
                Collapsible(
                  collapsed: !Prefs.shouldCheckForUpdates.value,
                  axis: CollapsibleAxis.vertical,
                  child: SettingsSwitch(
                    title: t.settings.prefLabels.shouldAlwaysAlertForUpdates,
                    subtitle:
                        t.settings.prefDescriptions.shouldAlwaysAlertForUpdates,
                    icon: Icons.system_security_update_warning,
                    pref: Prefs.shouldAlwaysAlertForUpdates,
                  ),
                ),
              ],
              if (AdState.adsSupported) ...[
                SettingsSwitch(
                  title: t.settings.prefLabels.disableAds,
                  subtitle: t.settings.prefDescriptions.disableAds,
                  icon: FontAwesomeIcons.rectangleAd,
                  pref: Prefs.disableAds,
                  afterChange: (_) => setState(() {}),
                ),
                Collapsible(
                  collapsed: Prefs.disableAds.value,
                  axis: CollapsibleAxis.vertical,
                  child: SettingsButton(
                    title: t.settings.prefLabels.changeAdsConsent,
                    icon: FontAwesomeIcons.cookieBite,
                    onPressed: () => AdState.showConsentForm(),
                  ),
                ),
              ],//修改懬告同意書
              SettingsSwitch(
                title: t.settings.prefLabels.allowInsecureConnections,
                subtitle: t.settings.prefDescriptions.allowInsecureConnections,
                icon: Icons.private_connectivity,
                pref: Prefs.allowInsecureConnections,
              ),//允許不安全的連結
            ],
          )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Prefs.locale.removeListener(onChanged);
    UpdateManager.status.removeListener(onChanged);
    super.dispose();
  }
}
