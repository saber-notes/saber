
class FlavorConfig {
  FlavorConfig._();

  static late final String _flavor;
  static String get flavor => _flavor;

  static late final bool _shouldCheckForUpdatesByDefault;
  static bool get shouldCheckForUpdatesByDefault => _shouldCheckForUpdatesByDefault;

  static setup({
    String? flavor,
    bool? shouldCheckForUpdatesByDefault,
  }) {
    _flavor = flavor ?? "";
    _shouldCheckForUpdatesByDefault = shouldCheckForUpdatesByDefault ?? true;
  }

}
