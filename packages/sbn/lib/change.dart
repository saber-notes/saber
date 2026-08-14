class Change<T> {
  final T previous, current;

  const new({required this.previous, required this.current});

  Change<T> reverse() => Change(previous: current, current: previous);
}
