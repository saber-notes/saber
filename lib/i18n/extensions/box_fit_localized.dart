import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/i18n/strings.g.dart';

extension BoxFitLocalized on BoxFit {
  String get localizedName {
    if (this == BoxFit.fill) {
      return t.editor.menu.boxFits.fill;
    } else if (this == BoxFit.cover) {
      return t.editor.menu.boxFits.cover;
    } else if (this == BoxFit.contain) {
      return t.editor.menu.boxFits.contain;
    } else {
      if (kDebugMode) throw Exception('Untranslated box fit: $this');
      return '';
    }
  }
}
