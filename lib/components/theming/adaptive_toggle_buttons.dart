
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveToggleButtons<T> extends StatelessWidget {
  const AdaptiveToggleButtons({
    super.key,
    required this.value,
    required this.options,
    required this.onChange,
  });

  final T value;
  final List<ToggleButtonsOption<T>> options;
  final ValueChanged<T?> onChange;

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
        minWidth: 24.0 * options.length,
        minHeight: 40,
      ),
      onPressed: (int index) {
        onChange(options[index].value);
      },
      isSelected: [
        for (ToggleButtonsOption option in options) value == option.value,
      ],
      children: [
        for (ToggleButtonsOption option in options) Text(option.text),
      ],
    );
  }
  Widget _buildCupertino(BuildContext context) {
    return CupertinoSlidingSegmentedControl<T>(
      children: options.asMap().map((_, ToggleButtonsOption option) => MapEntry<T, Widget>(option.value, Text(option.text))),
      groupValue: value,
      onValueChanged: onChange,
    );
  }
}

class ToggleButtonsOption<T> {
  final T value;
  final String text;

  const ToggleButtonsOption(this.value, this.text);
}
