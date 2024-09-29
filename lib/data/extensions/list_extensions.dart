extension ListExtensions<T> on List<T> {
  D get<D extends T?>(int index, D defaultValue) {
    assert(D == T || D == _typeOf<T?>());
    if (index < 0 || index >= length) {
      return defaultValue;
    } else {
      return this[index] as D;
    }
  }

  T? getOrNull(int index) {
    if (index < 0 || index >= length) {
      return null;
    } else {
      return this[index];
    }
  }
}

Type _typeOf<T>() => T;
