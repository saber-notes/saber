import 'package:flutter/material.dart';
import 'package:saber/devils_book/models/theme_preset.dart';
import 'package:saber/devils_book/registry/devils_catalog.dart';

class ThemeSelectorSheet extends StatelessWidget {
  final ThemePreset currentTheme;
  final Function(ThemePreset) onSelect;

  const ThemeSelectorSheet({
    super.key,
    required this.currentTheme,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final themeList = DevilsCatalog.themes.values.toList();
    
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0D0D0D),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(top: BorderSide(color: Color(0xFFD4AF37), width: 1.5)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'SELECT RITUAL REALM',
            style: TextStyle(
              color: Color(0xFFD4AF37),
              fontWeight: FontWeight.w900,
              letterSpacing: 2.0,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: themeList.length,
              itemBuilder: (context, index) {
                final theme = themeList[index];
                final isSelected = theme.id == currentTheme.id;
                
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: InkWell(
                    onTap: () {
                      onSelect(theme);
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: 140,
                      decoration: BoxDecoration(
                        gradient: theme.backgroundGradient != null 
                          ? LinearGradient(
                              colors: theme.backgroundGradient!,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : null,
                        color: theme.backgroundGradient == null ? theme.backgroundColor : null,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected ? const Color(0xFFFF2200) : Colors.white10,
                          width: 1.5,
                        ),
                      ),
                      child: Stack(
                        children: [
                          if (theme.texturePath != null)
                            Positioned.fill(
                              child: Opacity(
                                opacity: 0.1,
                                child: Image.asset(theme.texturePath!, repeat: ImageRepeat.repeat),
                              ),
                            ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    theme.name.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : Colors.white70,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.5,
                                      shadows: const [
                                        Shadow(color: Colors.black, blurRadius: 4),
                                      ],
                                    ),
                                  ),
                                  if (isSelected)
                                    const Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Icon(Icons.check_circle, color: Color(0xFFFF2200), size: 16),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
