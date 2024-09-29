extension ListExtensions<T> on List<T> {
  T? getOrNull(int index) {
    if (index < 0 || index >= length) {
      return null;
    } else {
      return this[index];
    }
  }
}
