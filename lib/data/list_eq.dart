/// Compares two lists by their contents.
///
/// This is the same as Flutter's [listEquals]
/// but non-nullable.
bool listEq<T>(List<T> list, List<T> other) {
  if (identical(list, other)) return true;
  if (list.length != other.length) return false;
  for (var i = 0; i < list.length; i++) {
    if (list[i] != other[i]) return false;
  }
  return true;
}
