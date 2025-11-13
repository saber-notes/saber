import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class AdaptiveSwitchListTile extends SwitchListTile {
  const AdaptiveSwitchListTile({
    super.key,
    required super.value,
    required super.onChanged,
    super.activeThumbColor,
    super.activeTrackColor,
    super.inactiveThumbColor,
    super.inactiveTrackColor,
    super.activeThumbImage,
    super.onActiveThumbImageError,
    super.inactiveThumbImage,
    super.onInactiveThumbImageError,
    super.thumbColor,
    super.trackColor,
    super.trackOutlineColor,
    super.thumbIcon,
    super.materialTapTargetSize,
    super.dragStartBehavior,
    super.mouseCursor,
    super.overlayColor,
    super.splashRadius,
    super.focusNode,
    super.onFocusChange,
    super.autofocus,
    super.applyCupertinoTheme,
    super.tileColor,
    super.title,
    super.subtitle,
    super.isThreeLine,
    super.dense,
    super.contentPadding,
    super.secondary,
    super.selected,
    super.controlAffinity,
    super.shape,
    super.selectedTileColor,
    super.visualDensity,
    super.enableFeedback,
    super.hoverColor,
    super.internalAddSemanticForOnTap,
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
    return YaruSwitchListTile(
      value: value,
      onChanged: onChanged,
      tileColor: tileColor,
      title: title,
      subtitle: subtitle,
      isThreeLine: isThreeLine ?? false,
      dense: dense,
      contentPadding: contentPadding,
      secondary: secondary,
      selected: selected,
      autofocus: autofocus,
      controlAffinity: controlAffinity ?? ListTileControlAffinity.platform,
      shape: shape,
      selectedTileColor: selectedTileColor,
      visualDensity: visualDensity,
      focusNode: focusNode,
      enableFeedback: enableFeedback,
      hoverColor: hoverColor,
      mouseCursor: mouseCursor,
    );
  }
}
