import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// An Icon widget that can take an [IconData] or [FaIconData].
class UniIcon extends Icon {
  const UniIcon(
    this.uniIcon, {
    super.key,
    super.size,
    super.color,
    super.semanticLabel,
  }) : super(null);

  final Object uniIcon;

  @override
  Widget build(BuildContext context) {
    final uniIcon = this.uniIcon;
    return switch (uniIcon) {
      FaIconData() => FaIcon(
        uniIcon,
        key: ValueKey(uniIcon),
        size: size,
        color: color,
        semanticLabel: semanticLabel,
      ),
      IconData() => Icon(
        uniIcon,
        key: ValueKey(uniIcon),
        size: size,
        color: color,
        semanticLabel: semanticLabel,
      ),
      _ => throw ArgumentError.value(
        uniIcon,
        'uniIcon',
        'uniIcon must be a FaIconData or IconData',
      ),
    };
  }

  @override
  @Deprecated('Use uniIcon directly')
  IconData get icon => switch (uniIcon) {
    IconData() => uniIcon as IconData,
    FaIconData() => (uniIcon as FaIconData).data,
    _ => throw ArgumentError.value(
      uniIcon,
      'uniIcon',
      'uniIcon must be a FaIconData or IconData',
    ),
  };
}
