extension StringExtensions on String {
  /// Acts like [String.replaceAllMapped]
  /// but accepts an async [replace] function.
  ///
  /// Source: https://stackoverflow.com/a/34345073
  Future<String> replaceAllMappedAsync(
    Pattern exp,
    Future<String> Function(Match match) replace,
  ) async {
    final buffer = StringBuffer();
    final matches = exp.allMatches(this).toList();

    /// Pre-calculate all replacements asynchronously
    final replacements = await Future.wait([
      for (Match match in matches)
        replace(match),
    ]);

    int stringIndex = 0;
    for (int matchIndex = 0; matchIndex < matches.length; matchIndex++) {
      final match = matches[matchIndex];
      final prefix = substring(stringIndex, match.start);

      buffer
        ..write(prefix)
        ..write(replacements[matchIndex]);

      stringIndex = match.end;
    }

    buffer.write(substring(stringIndex));
    return buffer.toString();
  }
}
