import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class AdaptiveCircularProgressIndicator extends CircularProgressIndicator {
  const AdaptiveCircularProgressIndicator({
    super.key,
    super.value,
    super.backgroundColor,
    super.valueColor,
    super.strokeWidth,
    super.semanticsLabel,
    super.semanticsValue,
    super.strokeCap,
    super.strokeAlign,
    super.constraints,
    super.trackGap,
    super.year2023 = false,
    super.padding,
  }) : super.adaptive();

  /// Creates a circular progress indicator with the same size and color
  /// as the surrounding text.
  static Widget textStyled({double? value, double alpha = 1.0}) => Builder(
    builder: (context) {
      final textStyle = DefaultTextStyle.of(context).style;
      final textSize = textStyle.fontSize ?? 14;
      final textColor = textStyle.color ?? ColorScheme.of(context).onSurface;
      return SizedBox.square(
        dimension: textSize,
        child: AdaptiveCircularProgressIndicator(
          value: value,
          strokeWidth: textSize / 4,
          valueColor: AlwaysStoppedAnimation(
            textColor.withValues(alpha: alpha),
          ),
        ),
      );
    },
  );

  @override
  State<AdaptiveCircularProgressIndicator> createState() =>
      _CircularProgressIndicatorState();
}

class _CircularProgressIndicatorState
    extends State<AdaptiveCircularProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (theme.platform == .linux) {
      return _buildYaru(context);
    } else {
      return _buildDefault(context);
    }
  }

  Widget _buildYaru(BuildContext context) {
    return YaruCircularProgressIndicator(
      value: widget.value,
      strokeWidth: widget.strokeWidth,
      color: widget.color,
      valueColor: widget.valueColor,
      trackColor: widget.backgroundColor,
      semanticsLabel: widget.semanticsLabel,
      semanticsValue: widget.semanticsValue,
    );
  }

  Widget _buildDefault(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      value: widget.value,
      backgroundColor: widget.backgroundColor,
      valueColor: widget.valueColor,
      strokeWidth: widget.strokeWidth,
      semanticsLabel: widget.semanticsLabel,
      semanticsValue: widget.semanticsValue,
      strokeCap: widget.strokeCap,
      strokeAlign: widget.strokeAlign,
      constraints: widget.constraints,
      trackGap: widget.trackGap,
      // ignore: deprecated_member_use
      year2023: widget.year2023,
      padding: widget.padding,
    );
  }
}
