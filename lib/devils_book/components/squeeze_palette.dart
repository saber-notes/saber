import 'package:flutter/material.dart';
import 'package:saber/devils_book/sessions/session_controller.dart';
import 'package:saber/devils_book/stylus/squeeze_palette_controller.dart';

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
    super.key,
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
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([controller, SessionController()]),
      builder: (context, child) {
        if (!controller.isVisible) return const SizedBox.shrink();
        
        final size = MediaQuery.sizeOf(context);
        final left = (controller.position.dx - 180).clamp(10.0, size.width - 400.0);
        final top = (controller.position.dy - 120).clamp(10.0, size.height - 150.0);
        
        final intensity = SessionController().getSessionIntensity();

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
              child: Stack(
                alignment: Alignment.center,
                children: [
                   // THE RITUAL HEARTBEAT: Pulsing Ring
                   if (intensity > 0.05)
                     TweenAnimationBuilder<double>(
                       tween: Tween(begin: 0.9, end: 1.1 + (intensity * 0.2)),
                       duration: Duration(milliseconds: (600 - (intensity * 400)).toInt()), // Faster pulse at high intensity
                       curve: Curves.easeInOutSine,
                       builder: (context, pulse, _) {
                         return Container(
                           width: 500 * pulse,
                           height: 120 * pulse,
                           decoration: BoxDecoration(
                             border: Border.all(
                               color: const Color(0xFFD4AF37).withValues(alpha: (0.3 * intensity) / pulse),
                               width: 2.0 / pulse,
                             ),
                             borderRadius: BorderRadius.circular(20),
                           ),
                         );
                       },
                       onEnd: () {
                         // This is a stateless way to loop, but actually TweenAnimationBuilder 
                         // handles its own state. For a true continuous pulse, we'd use a controller, 
                         // but this "bouncing" logic works well enough for a ritual feel.
                       },
                     ),
                   
                   // MAIN PALETTE BODY
                   Transform.scale(
                     scale: 1.0 + (intensity * 0.05),
                     child: AnimatedContainer(
                       duration: const Duration(milliseconds: 200),
                       decoration: BoxDecoration(
                         color: const Color(0xFF0A0A0A).withValues(alpha: 0.98), // Deep Obsidian
                         borderRadius: BorderRadius.circular(16), 
                         border: Border.all(
                           color: const Color(0xFFD4AF37).withValues(alpha: 0.6 + (intensity * 0.4)), 
                           width: 1.5 + (intensity * 1.0),
                         ),
                         boxShadow: [
                           BoxShadow(
                             color: const Color(0xFFFF2200).withValues(alpha: 0.2 + (intensity * 0.5)), // Scarlet glow
                             blurRadius: 15 + (intensity * 25),
                             spreadRadius: 2 + (intensity * 5),
                           ),
                           if (intensity > 0.7)
                             BoxShadow(
                               color: const Color(0xFFD4AF37).withValues(alpha: 0.3),
                               blurRadius: 30,
                               spreadRadius: 10,
                             ),
                         ],
                       ),
                       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                       child: _buildPaletteItems(context),
                     ),
                   ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPaletteItems(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildItem(
          context: context,
          icon: Icons.history_edu_sharp, 
          tooltip: 'THE DEVIL\'S PEN',
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
          context: context,
          icon: Icons.auto_delete_outlined, 
          tooltip: 'BANISH (Eraser)',
          onTap: () {
            onSelectEraser();
            controller.hide();
          },
        ),
        _buildItem(
          context: context,
          icon: Icons.blur_on_sharp, 
          tooltip: 'VOID INKS',
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
          context: context,
          icon: Icons.center_focus_strong_outlined,
          tooltip: 'SUMMONING FOCUS',
          onTap: () {
            onToggleZoomWindow();
            controller.hide();
          },
        ),
        _buildItem(
          context: context,
          icon: Icons.auto_awesome_mosaic_outlined,
          tooltip: 'OBSIDIAN SANCTUM (Theme)',
          onTap: () {
            onSelectTheme();
            controller.hide();
          },
        ),
        _buildItem(
          context: context,
          icon: Icons.menu_book_sharp,
          tooltip: 'ANCIENT TEXTS (Templates)',
          onTap: () {
            onSelectTemplate();
            controller.hide();
          },
        ),
        _buildItem(
          context: context,
          icon: Icons.fireplace_sharp,
          tooltip: 'HELLFIRE EFFECTS',
          onTap: () {
            onSelectEffect();
            controller.hide();
          },
        ),
        _buildItem(
          context: context,
          icon: Icons.remove_red_eye_outlined,
          tooltip: 'CHRONICLER\'S SIGHT (Replay)',
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
          context: context,
          icon: Icons.ios_share_outlined,
          tooltip: 'MANIFEST (Export)',
          onTap: () {
            onTriggerExport();
            controller.hide();
          },
        ),
        _buildItem(
          context: context,
          icon: Icons.sync_problem_sharp,
          tooltip: 'TRANSFORMATION ($currentModeName)',
          onTap: () {
            onCycleMode();
          },
        ),
        const SizedBox(
          height: 24,
          child: VerticalDivider(width: 16, thickness: 1.5, color: Color(0x33D4AF37), endIndent: 4, indent: 4),
        ),
        _buildItem(
          context: context,
          icon: Icons.local_fire_department_sharp,
          tooltip: 'BEGIN RITUAL',
          onTap: () {
            onStartSession();
            controller.hide();
          },
        ),
        _buildItem(
          context: context,
          icon: Icons.auto_awesome, 
          tooltip: 'THE SEALS (Relics)',
          onTap: () {
            onSelectRelic();
            controller.hide();
          },
        ),
      ],
    );
  }

  Widget _buildItem({
    required BuildContext context,
    required IconData icon,
    required String tooltip,
    required VoidCallback onTap,
    VoidCallback? onLongPress,
  }) {
    return Tooltip(
      message: tooltip,
      textStyle: const TextStyle(color: Color(0xFFD4AF37), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0),
      decoration: BoxDecoration(color: const Color(0xFF0F0F0F), border: Border.all(color: const Color(0xFFD4AF37), width: 0.5)),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        splashColor: const Color(0x44FF2200),
        highlightColor: const Color(0x22D4AF37),
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(icon, size: 28, color: const Color(0xFFD4AF37)), // Fixed Gold Icons
        ),
      ),
    );
  }
}
