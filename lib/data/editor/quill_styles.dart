import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:saber/components/theming/font_fallbacks.dart';

typedef _ArgRecord = ({bool invert, Color secondary, int lineHeight});

abstract class SaberQuillStyles {
  static DefaultStyles get({
    required bool invert,
    required Color secondary,
    required int lineHeight,
  }) {
    final _ArgRecord args = (
      invert: invert,
      secondary: secondary,
      lineHeight: lineHeight,
    );
    if (_lastArgs == args) {
      return _cachedStyles;
    }

    _lastArgs = args;
    return _cachedStyles = _createStyles(
      invert: invert,
      secondary: secondary,
      lineHeight: lineHeight,
    );
  }

  static _ArgRecord? _lastArgs;
  static late DefaultStyles _cachedStyles;

  /// Adapted from https://github.com/singerdmx/flutter-quill/blob/master/lib/src/editor/widgets/default_styles.dart
  static DefaultStyles _createStyles({
    required bool invert,
    required Color secondary,
    required int lineHeight,
  }) {
    final baseStyle = TextStyle(
      inherit: false,
      fontFamily: 'Neucha',
      fontFamilyFallback: saberHandwritingFontFallbacks,
      color: invert ? Colors.white : Colors.black,
      fontSize: lineHeight * 1,
      height: 1 / 1,
      decoration: TextDecoration.none,
    );
    final textTheme = (
      bodyLarge: baseStyle.copyWith(
        fontSize: lineHeight * 0.7,
        height: 1 / 0.7,
      ),
      displayLarge: baseStyle.copyWith(
        fontSize: lineHeight * 1.15,
        height: 1 / 1.15,
        decoration: TextDecoration.underline,
        decorationColor: baseStyle.color?.withValues(alpha: 0.6),
        decorationThickness: 3,
      ),
      displayMedium: baseStyle.copyWith(
        fontSize: lineHeight * 1,
        height: 1 / 1,
        decoration: TextDecoration.underline,
        decorationColor: baseStyle.color?.withValues(alpha: 0.5),
        decorationThickness: 3,
      ),
      displaySmall: baseStyle.copyWith(
        fontSize: lineHeight * 0.9,
        height: 1 / 0.9,
        decoration: TextDecoration.underline,
        decorationColor: baseStyle.color?.withValues(alpha: 0.4),
        decorationThickness: 3,
      ),
    );

    final lineHeightBlockStyle = DefaultTextBlockStyle(
      baseStyle,
      HorizontalSpacing.zero,
      VerticalSpacing.zero,
      VerticalSpacing.zero,
      null,
    );

    return DefaultStyles(
      h1: DefaultTextBlockStyle(
        textTheme.displayLarge,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      h2: DefaultTextBlockStyle(
        textTheme.displayMedium,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      h3: DefaultTextBlockStyle(
        textTheme.displaySmall,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      h4: DefaultTextBlockStyle(
        textTheme.displaySmall,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      h5: DefaultTextBlockStyle(
        textTheme.displaySmall,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      h6: DefaultTextBlockStyle(
        textTheme.displaySmall,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      lineHeightNormal: lineHeightBlockStyle,
      lineHeightTight: lineHeightBlockStyle,
      lineHeightOneAndHalf: lineHeightBlockStyle,
      lineHeightDouble: lineHeightBlockStyle,
      paragraph: DefaultTextBlockStyle(
        textTheme.bodyLarge,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      small: TextStyle(fontSize: lineHeight * 0.4, height: 1 / 0.4),
      inlineCode: InlineCodeStyle(
        backgroundColor: Colors.grey.withValues(alpha: 0.2),
        radius: const Radius.circular(3),
        style: textTheme.bodyLarge.copyWith(
          fontFamily: 'FiraMono',
          fontFamilyFallback: saberMonoFontFallbacks,
        ),
        header1: textTheme.displayLarge.copyWith(
          fontFamily: 'FiraMono',
          fontFamilyFallback: saberMonoFontFallbacks,
        ),
        header2: textTheme.displayMedium.copyWith(
          fontFamily: 'FiraMono',
          fontFamilyFallback: saberMonoFontFallbacks,
        ),
        header3: textTheme.displaySmall.copyWith(
          fontFamily: 'FiraMono',
          fontFamilyFallback: saberMonoFontFallbacks,
        ),
      ),
      link: TextStyle(color: secondary, decoration: TextDecoration.underline),
      placeHolder: DefaultTextBlockStyle(
        textTheme.bodyLarge.copyWith(color: Colors.grey.withValues(alpha: 0.6)),
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      lists: DefaultListBlockStyle(
        textTheme.bodyLarge,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
        null,
      ),
      quote: DefaultTextBlockStyle(
        TextStyle(color: textTheme.bodyLarge.color!.withValues(alpha: 0.6)),
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        BoxDecoration(
          border: Border(
            left: BorderSide(
              color: textTheme.bodyLarge.color!.withValues(alpha: 0.6),
              width: 4,
            ),
          ),
        ),
      ),
      code: DefaultTextBlockStyle(
        textTheme.bodyLarge.copyWith(
          fontFamily: 'FiraMono',
          fontFamilyFallback: saberMonoFontFallbacks,
        ),
        HorizontalSpacing.zero,
        VerticalSpacing(-lineHeight * 0.16, lineHeight * 0.8),
        VerticalSpacing.zero,
        BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
      indent: DefaultTextBlockStyle(
        textTheme.bodyLarge,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      align: DefaultTextBlockStyle(
        textTheme.bodyLarge,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      leading: DefaultTextBlockStyle(
        textTheme.bodyLarge,
        HorizontalSpacing.zero,
        VerticalSpacing.zero,
        VerticalSpacing.zero,
        null,
      ),
      sizeSmall: TextStyle(
        fontSize: textTheme.bodyLarge.fontSize!,
        height: textTheme.bodyLarge.height!,
      ),
      sizeLarge: TextStyle(
        fontSize: textTheme.bodyLarge.fontSize!,
        height: textTheme.bodyLarge.height!,
      ),
      sizeHuge: TextStyle(
        fontSize: textTheme.bodyLarge.fontSize!,
        height: textTheme.bodyLarge.height!,
      ),
    );
  }
}
