/// A note may be read-only for different reasons.
/// A note that isn't read-only will have this set to null.
enum ReadOnlyReason {
  /// The note's version is too new for this app version,
  /// so it may not have been parsed correctly or completely.
  ///
  /// We disable editing to prevent data loss.
  versionTooNew,

  /// The note is watching changes from a server.
  ///
  /// Two-way watching/editing is not supported yet, so we disable editing
  /// in this mode.
  watchingServer,

  /// The note is blank as a placeholder until real data is loaded.
  ///
  /// Editing is disabled since we're waiting for real data.
  placeholder,

  /// The note failed to load. It may be corrupted or missing.
  ///
  /// Editing is disabled to prevent overwriting the existing data.
  corrupted,
}
