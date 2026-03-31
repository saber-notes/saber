import 'package:flutter/material.dart';
import 'package:saber/data/prefs.dart';

class RitualSettingTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool selected;

  const RitualSettingTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              color: selected 
                  ? colorScheme.primary.withValues(alpha: 0.15)
                  : colorScheme.surfaceContainer.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: selected 
                    ? colorScheme.primary.withValues(alpha: 0.4)
                    : colorScheme.onSurface.withValues(alpha: 0.08),
                width: 1.5,
              ),
              boxShadow: selected ? [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                )
              ] : null,
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                if (leading != null) ...[
                  IconTheme(
                    data: IconThemeData(
                      color: selected ? colorScheme.primary : colorScheme.onSurface,
                      size: 24,
                    ),
                    child: leading!,
                  ),
                  const SizedBox(width: 16),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: selected ? colorScheme.primary : colorScheme.onSurface,
                          letterSpacing: 0.5,
                        ),
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          subtitle!,
                          style: TextStyle(
                            fontSize: 13,
                            color: colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (trailing != null) ...[
                  const SizedBox(width: 12),
                  trailing!,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RitualSettingSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const RitualSettingSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 24, 16, 12),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: colorScheme.primary.withValues(alpha: 0.8),
              letterSpacing: 2.0,
            ),
          ),
        ),
        ...children,
      ],
    );
  }
}
