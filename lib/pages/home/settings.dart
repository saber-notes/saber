import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/navbar/responsive_navbar.dart';
import 'package:saber/components/settings/app_info.dart';
import 'package:saber/components/settings/nextcloud_profile.dart';
import 'package:saber/components/settings/ritual_setting_tile.dart';
import 'package:saber/components/settings/settings_color.dart';
import 'package:saber/components/settings/settings_sentry.dart';
import 'package:saber/components/settings/theme_gallery.dart';
import 'package:saber/components/theming/adaptive_alert_dialog.dart';
import 'package:saber/components/theming/saber_theme.dart';
import 'package:saber/data/locales.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/devils_book/components/atmosphere_overlay.dart';
import 'package:saber/devils_book/components/ritual_background.dart';
import 'package:saber/devils_book/models/loadout_manager.dart';
import 'package:saber/devils_book/sessions/session_controller.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:stow/stow.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();

  static Future<bool?> showResetDialog({
    required BuildContext context,
    required Stow pref,
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
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              pref.value = pref.defaultValue;
              Navigator.of(context).pop(true);
            },
            child: Text(t.settings.reset.button),
          ),
        ],
      ),
    );
  }
}

class _SettingsPageState extends State<SettingsPage> {
  late TargetPlatform platform;

  @override
  void initState() {
    stows.locale.addListener(onChanged);
    super.initState();
  }

  void onChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    platform = Theme.of(context).platform;
    final cupertino = platform.isCupertino;

    return ListenableBuilder(
      listenable: Listenable.merge([LoadoutManager(), SessionController()]),
      builder: (context, _) {
        final loadout = LoadoutManager().currentLoadout;
        final theme = loadout.theme;
        final intensity = SessionController().getSessionIntensity();
        const ritualGold = Color(0xFFD4AF37);
        const ritualObsidian = Color(0xFF070707);

        return Stack(
          children: [
            RitualBackground(theme: theme, intensity: intensity),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.only(bottom: 8),
                    sliver: SliverAppBar(
                      collapsedHeight: kToolbarHeight,
                      expandedHeight: 220,
                      pinned: true,
                      stretch: true,
                      backgroundColor: ritualObsidian,
                      shape: const Border(bottom: BorderSide(color: ritualGold, width: 1.0)),
                      flexibleSpace: FlexibleSpaceBar(
                        stretchModes: const [
                          StretchMode.zoomBackground,
                          StretchMode.blurBackground,
                          StretchMode.fadeTitle,
                        ],
                        title: const Text(
                          'ALTAR OF CONFIGURATION',
                          style: TextStyle(
                            color: ritualGold,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2.0,
                            fontSize: 16,
                          ),
                        ),
                        centerTitle: true,
                        background: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [ritualObsidian, ritualObsidian.withValues(alpha: 0.8), Colors.transparent],
                                ),
                              ),
                            ),
                            Center(
                              child: Opacity(
                                opacity: 0.05,
                                child: Icon(Icons.settings_suggest, size: 180, color: ritualGold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverSafeArea(
                    top: false,
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: NextcloudProfile(),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: AppInfo(),
                        ),

                        // --- THEME REVELATIONS ---
                        ValueListenableBuilder(
                          valueListenable: stows.activeLoadoutId,
                          builder: (context, activeThemeId, _) {
                            return ThemeGallery(
                              activeThemeId: activeThemeId,
                              onThemeSelected: (id) => stows.activeLoadoutId.value = id,
                            );
                          },
                        ),

                        // --- FOUNDATIONAL RITUALS (General) ---
                        RitualSettingSection(
                          title: 'Foundational Rituals',
                          children: [
                            RitualSettingTile(
                              title: t.settings.prefLabels.locale,
                              subtitle: stows.locale.value.isEmpty
                                  ? t.settings.systemLanguage
                                  : localeNames[stows.locale.value] ?? stows.locale.value,
                              leading: Icon(cupertino ? CupertinoIcons.globe : Icons.language, color: ritualGold),
                              onTap: () {},
                            ),
                            RitualSettingTile(
                              title: t.settings.prefLabels.layoutSize,
                              subtitle: switch (stows.layoutSize.value) {
                                LayoutSize.auto => t.settings.layoutSizes.auto,
                                LayoutSize.phone => t.settings.layoutSizes.phone,
                                LayoutSize.tablet => t.settings.layoutSizes.tablet,
                              },
                              leading: Icon(cupertino ? CupertinoIcons.device_phone_portrait : Icons.devices, color: ritualGold),
                            ),
                            SettingsColor(
                              title: t.settings.prefLabels.customAccentColor,
                              icon: Icons.colorize,
                              pref: stows.accentColor,
                            ),
                          ],
                        ),

                        // --- THE SCRIBE'S HAND (Writing) ---
                        RitualSettingSection(
                          title: "The Scribe's Hand",
                          children: [
                            RitualSettingTile(
                              title: t.settings.prefLabels.hyperlegibleFont,
                              subtitle: t.settings.prefDescriptions.hyperlegibleFont,
                              leading: Icon(cupertino ? CupertinoIcons.textformat : Icons.font_download, color: ritualGold),
                              trailing: Switch.adaptive(
                                value: stows.hyperlegibleFont.value,
                                onChanged: (v) => stows.hyperlegibleFont.value = v,
                              ),
                            ),
                            RitualSettingTile(
                              title: t.settings.prefLabels.preferGreyscale,
                              subtitle: t.settings.prefDescriptions.preferGreyscale,
                              leading: const Icon(Icons.monochrome_photos, color: ritualGold),
                              trailing: Switch.adaptive(
                                value: stows.preferGreyscale.value,
                                onChanged: (v) => stows.preferGreyscale.value = v,
                              ),
                            ),
                            RitualSettingTile(
                              title: t.settings.prefLabels.disableEraserAfterUse,
                              leading: const FaIcon(FontAwesomeIcons.eraser, color: ritualGold),
                              trailing: Switch.adaptive(
                                value: stows.disableEraserAfterUse.value,
                                onChanged: (v) => stows.disableEraserAfterUse.value = v,
                              ),
                            ),
                          ],
                        ),

                        // --- SANCTUARY CONFIGURATION (Editor) ---
                        RitualSettingSection(
                          title: 'Sanctuary Configuration',
                          children: [
                            RitualSettingTile(
                              title: t.settings.prefLabels.editorAutoInvert,
                              leading: const Icon(Icons.invert_colors, color: ritualGold),
                              trailing: Switch.adaptive(
                                value: stows.editorAutoInvert.value,
                                onChanged: (v) => stows.editorAutoInvert.value = v,
                              ),
                            ),
                          ],
                        ),

                        // --- FORBIDDEN ARTS (Advanced) ---
                        RitualSettingSection(
                          title: 'Forbidden Arts',
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: SettingsSentryConsent(),
                            ),
                            RitualSettingTile(
                              title: t.logs.viewLogs,
                              subtitle: t.logs.debuggingInfo,
                              leading: const Icon(Icons.receipt_long, color: ritualGold),
                              onTap: () => context.push(RoutePaths.logs),
                            ),
                            RitualSettingTile(
                              title: t.settings.prefLabels.allowInsecureConnections,
                              subtitle: t.settings.prefDescriptions.allowInsecureConnections,
                              leading: const Icon(Icons.private_connectivity, color: ritualGold),
                              trailing: Switch.adaptive(
                                value: stows.allowInsecureConnections.value,
                                onChanged: (v) => stows.allowInsecureConnections.value = v,
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 100),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            AtmosphereOverlay(theme: theme),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    stows.locale.removeListener(onChanged);
    super.dispose();
  }
}
