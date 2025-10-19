class FlavorConfig {
  FlavorConfig._();

  static late String _flavor;
  static String get flavor => _flavor;

  static late String _appStore;
  static String get appStore => _appStore;

  static late bool _shouldCheckForUpdatesByDefault;
  static bool get shouldCheckForUpdatesByDefault =>
      _shouldCheckForUpdatesByDefault;

  static late bool _dirty;

  /// If a build is dirty, it has commits that are ahead of the latest release.
  static bool get dirty => _dirty;

  static void setup({
    String flavor = '',
    String appStore = '',
    bool shouldCheckForUpdatesByDefault = true,
    bool dirty = false,
  }) {
    _flavor = flavor;
    _appStore = appStore;
    _shouldCheckForUpdatesByDefault = shouldCheckForUpdatesByDefault;
    _dirty = dirty;
  }

  static void setupFromEnvironment() => setup(
    flavor: const String.fromEnvironment('FLAVOR'),
    appStore: const String.fromEnvironment('APP_STORE'),
    shouldCheckForUpdatesByDefault: const bool.fromEnvironment(
      'UPDATE_CHECK',
      defaultValue: true,
    ),
    dirty: const bool.fromEnvironment('DIRTY', defaultValue: false),
  );
}
