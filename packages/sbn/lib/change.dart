class Change<T> {
  final T previous, current;

  const Change({required this.previous, required this.current});

  Change<T> reverse() => Change(previous: current, current: previous);
}
