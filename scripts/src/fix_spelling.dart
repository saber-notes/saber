const _spellingErrors = {'Sabre': 'Saber'};

String fixSpelling(String translation) {
  for (final MapEntry(key: before, value: after) in _spellingErrors.entries) {
    translation = translation.replaceAll(before, after);
  }
  return translation;
}
