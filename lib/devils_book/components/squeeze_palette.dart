import 'package:flutter/material.dart';
import '../stylus/squeeze_palette_controller.dart';

class SqueezePalette extends StatelessWidget {
  final SqueezePaletteController controller;
  final VoidCallback onSelectPen;
  final VoidCallback onLongPressPen;
  final VoidCallback onSelectEraser;
  final VoidCallback onSelectInk;
  final VoidCallback onCycleMode;
  final VoidCallback onSelectRelic;
  final VoidCallback onToggleZoomWindow;
  final VoidCallback onSelectTheme;
  final VoidCallback onSelectEffect;
  final VoidCallback onStartSession;
  final VoidCallback onTriggerReplay;
  final VoidCallback onTriggerExport;
  final VoidCallback onSelectTemplate;
  final String currentModeName;
  
  const SqueezePalette({
    Key? key,
    required this.controller,
    required this.onSelectPen,
    required this.onLongPressPen,
    required this.onSelectEraser,
    required this.onSelectInk,
    required this.onCycleMode,
    required this.onSelectRelic,
    required this.onToggleZoomWindow,
    required this.onSelectTheme,
    required this.onSelectEffect,
    required this.onStartSession,
    required this.onTriggerReplay,
    required this.onTriggerExport,
    required this.onSelectTemplate,
    required this.currentModeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        if (!controller.isVisible) return const SizedBox.shrink();
        
        // Offset the menu slightly up and left from the stylus tip, clamping to boundaries
        final size = MediaQuery.sizeOf(context);
        final left = (controller.position.dx - 120).clamp(10.0, size.width - 250.0);
        final top = (controller.position.dy - 80).clamp(10.0, size.height - 100.0);

        return Positioned(
          left: left,
          top: top,
          child: Material(
            color: Colors.transparent,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutBack,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  alignment: Alignment.bottomRight,
                  child: Opacity(
                    opacity: value.clamp(0.0, 1.0),
                    child: child,
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildItem(
                      icon: Icons.edit,
                      tooltip: 'The Devil\'s Pen (Hold to change)',
                      onTap: () {
                        onSelectPen();
                        controller.hide();
                      },
                      onLongPress: () {
                        onLongPressPen();
                        controller.hide();
                      },
                    ),
                    _buildItem(
                      icon: Icons.cleaning_services,
                      tooltip: 'Eraser',
                      onTap: () {
                        onSelectEraser();
                        controller.hide();
                      },
                    ),
                    _buildItem(
                      icon: Icons.water_drop,
                      tooltip: 'Inks & Materials',
                      onTap: () {
                        onSelectInk();
                        controller.hide();
                      },
                    ),
                    const SizedBox(
                      height: 24,
                      child: VerticalDivider(width: 16, thickness: 1, endIndent: 4, indent: 4),
                    ),
                    _buildItem(
                      icon: Icons.zoom_in_map,
                      tooltip: 'Writing Strip',
                      onTap: () {
                        onToggleZoomWindow();
                        controller.hide();
                      },
                    ),
                    _buildItem(
                      icon: Icons.palette_outlined,
                      tooltip: 'Paper & Atmosphere',
                      onTap: () {
                        onSelectTheme();
                        controller.hide();
                      },
                    ),
                    _buildItem(
                      icon: Icons.library_books,
                      tooltip: 'Ready Papers (Templates)',
                      onTap: () {
                        onSelectTemplate();
                        controller.hide();
                      },
                    ),
                    _buildItem(
                      icon: Icons.flare,
                      tooltip: 'Live Effects',
                      onTap: () {
                        onSelectEffect();
                        controller.hide();
                      },
                    ),
                    _buildItem(
                      icon: Icons.history,
                      tooltip: 'Memory Replay',
                      onTap: () {
                        onTriggerReplay();
                        controller.hide();
                      },
                    ),
                    const SizedBox(
                      height: 24,
                      child: VerticalDivider(width: 16, thickness: 1, endIndent: 4, indent: 4),
                    ),
                    _buildItem(
                      icon: Icons.ios_share,
                      tooltip: 'Export',
                      onTap: () {
                        onTriggerExport();
                        controller.hide();
                      },
                    ),
                    _buildItem(
                      icon: Icons.auto_awesome,
                      tooltip: 'Mode: $currentModeName',
                      onTap: () {
                        onCycleMode();
                      },
                    ),
                    const SizedBox(
                      height: 24,
                      child: VerticalDivider(width: 16, thickness: 1, endIndent: 4, indent: 4),
                    ),
                    _buildItem(
                      icon: Icons.hourglass_empty,
                      tooltip: 'Begin Session',
                      onTap: () {
                        onStartSession();
                        controller.hide();
                      },
                    ),
                    _buildItem(
                      icon: Icons.local_fire_department,
                      tooltip: 'Seals & Relics',
                      onTap: () {
                        onSelectRelic();
                        controller.hide();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildItem({
    required IconData icon,
    required String tooltip,
    required VoidCallback onTap,
    VoidCallback? onLongPress,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(icon, size: 26),
        ),
      ),
    );
  }
}
