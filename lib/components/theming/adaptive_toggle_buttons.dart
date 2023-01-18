
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveToggleButtons<T> extends StatelessWidget {
  const AdaptiveToggleButtons({
    super.key,
    required this.value,
    required this.options,
    required this.onChange,
    this.optionsWidth = 72,
    this.optionsHeight = 40,
  }): assert(optionsWidth > 0), assert(optionsHeight > 0);

  final T value;
  final List<ToggleButtonsOption<T>> options;
  final ValueChanged<T?> onChange;

  final double optionsWidth, optionsHeight;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    bool cupertino = theme.platform == TargetPlatform.iOS || theme.platform == TargetPlatform.macOS;

    if (cupertino) {
      return _buildCupertino(context);
    } else {
      return _buildMaterial(context);
    }
  }

  Widget _buildMaterial(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(1000),
      constraints: BoxConstraints(
        minWidth: optionsWidth,
        minHeight: optionsHeight,
      ),
      onPressed: (int index) {
        onChange(options[index].value);
      },
      isSelected: [
        for (ToggleButtonsOption option in options) value == option.value,
      ],
      children: [
        for (ToggleButtonsOption option in options) option.widget,
      ],
    );
  }
  Widget _buildCupertino(BuildContext context) {
    return CupertinoSlidingSegmentedControl<T>(
      children: options.asMap().map((_, ToggleButtonsOption option) => MapEntry<T, Widget>(option.value, option.widget)),
      groupValue: value,
      onValueChanged: onChange,
      padding: const EdgeInsets.all(8),
    );
  }
}

class ToggleButtonsOption<T> {
  final T value;
  final Widget widget;

  const ToggleButtonsOption(this.value, this.widget);
}
