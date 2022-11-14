
class FlavorConfig {
  FlavorConfig._();

  static late final String _flavor;
  static String get flavor => _flavor;

  static late final String? _appStore;
  static String? get appStore => _appStore;

  static late final bool _shouldCheckForUpdatesByDefault;
  static bool get shouldCheckForUpdatesByDefault => _shouldCheckForUpdatesByDefault;

  static setup({
    String? flavor,
    String? appStore,
    bool? shouldCheckForUpdatesByDefault,
  }) {
    _flavor = flavor ?? "";
    _appStore = appStore;
    _shouldCheckForUpdatesByDefault = shouldCheckForUpdatesByDefault ?? true;
  }

}
