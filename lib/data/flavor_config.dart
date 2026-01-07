class FlavorConfig {
  FlavorConfig._();

  static late String _flavor;
  static String get flavor => _flavor;

  static late String _appStore;
  static String get appStore => _appStore;

  static late bool _shouldCheckForUpdatesByDefault;
  static bool get shouldCheckForUpdatesByDefault =>
      _shouldCheckForUpdatesByDefault;

  static void setup({
    String flavor = '',
    String appStore = '',
    bool shouldCheckForUpdatesByDefault = true,
  }) {
    _flavor = flavor;
    _appStore = appStore;
    _shouldCheckForUpdatesByDefault = shouldCheckForUpdatesByDefault;
  }

  static void setupFromEnvironment() => setup(
    flavor: const String.fromEnvironment('FLAVOR'),
    appStore: const String.fromEnvironment('APP_STORE'),
    shouldCheckForUpdatesByDefault: const bool.fromEnvironment(
      'UPDATE_CHECK',
      defaultValue: true,
    ),
  );
}
