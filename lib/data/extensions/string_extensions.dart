extension StringExtensions on String {
  /// Acts like [String.replaceAllMapped]
  /// but accepts an async [replace] function.
  ///
  /// Source: https://stackoverflow.com/a/34345073
  Future<String> replaceAllMappedAsync(
    Pattern exp,
    Future<String> Function(Match match) replace,
  ) async {
    StringBuffer replaced = StringBuffer();

    int currentIndex = 0;
    for (Match match in exp.allMatches(this)) {
      String prefix = substring(currentIndex, match.start);
      currentIndex = match.end;
      replaced
        ..write(prefix)
        ..write(await replace(match));
    }

    replaced.write(substring(currentIndex));
    return replaced.toString();
  }
}
