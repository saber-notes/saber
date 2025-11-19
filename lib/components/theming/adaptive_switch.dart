import 'package:flutter/material.dart';
import 'package:yaru/widgets.dart';

class AdaptiveSwitch extends Switch {
  const AdaptiveSwitch({
    super.key,
    required super.value,
    required super.onChanged,
    super.thumbIcon,
    super.thumbColor,
    super.focusNode,
    super.autofocus = false,
    super.mouseCursor,
  }) : super.adaptive();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (theme.platform == .linux) {
      return _buildYaru(context);
    }
    return super.build(context);
  }

  Widget _buildYaru(BuildContext context) {
    return YaruSwitch(
      value: value,
      onChanged: onChanged,
      thumbColor: thumbColor?.resolve({
        if (value) WidgetState.selected,
        if (onChanged == null) WidgetState.disabled,
      }),
      focusNode: focusNode,
      autofocus: autofocus,
      mouseCursor: mouseCursor,
    );
  }
}
