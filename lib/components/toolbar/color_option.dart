
import 'package:flutter/material.dart';

class ColorOption extends StatelessWidget {
  const ColorOption({
    Key? key,
    required this.isSelected,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  final bool isSelected;
  final VoidCallback onTap;
  final Widget child;

  static const double diameter = 25;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(diameter / 2),
        onTap: onTap,
        child: Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? colorScheme.onSurface : Colors.transparent,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
