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
    @Deprecated('No Yaru equivalent') super.tileColor,
    super.title,
    super.subtitle,
    @Deprecated('No Yaru equivalent') super.isThreeLine,
    @Deprecated('No Yaru equivalent') super.dense,
    super.contentPadding,
    super.secondary,
    @Deprecated('No Yaru equivalent') super.selected,
    super.controlAffinity,
    super.shape,
    @Deprecated('No Yaru equivalent') super.selectedTileColor,
    @Deprecated('No Yaru equivalent') super.visualDensity,
    super.enableFeedback,
    super.hoverColor,
    super.internalAddSemanticForOnTap,
  }) : super.adaptive();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (theme.platform == .linux) {
      return _buildYaru(context, theme);
    }
    return super.build(context);
  }

  Widget _buildYaru(BuildContext context, ThemeData theme) {
    final textTheme = theme.textTheme;
    final listTileTheme = theme.listTileTheme;
    return YaruSwitchListTile(
      value: value,
      onChanged: onChanged,
      title: title == null
          ? null
          : DefaultTextStyle(
              style: textTheme.labelLarge!
                  .merge(listTileTheme.titleTextStyle)
                  .copyWith(inherit: false),
              child: title!,
            ),
      subtitle: subtitle == null
          ? null
          : DefaultTextStyle(
              style: textTheme.labelMedium!
                  .merge(listTileTheme.subtitleTextStyle)
                  .copyWith(inherit: false),
              child: subtitle!,
            ),
      contentPadding: contentPadding,
      secondary: secondary,
      autofocus: autofocus,
      controlAffinity: controlAffinity ?? .platform,
      shape: shape,
      focusNode: focusNode,
      enableFeedback: enableFeedback ?? true,
      hoverColor: hoverColor,
      mouseCursor: mouseCursor,
    );
  }
}
